package com.english.ai.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.common.BusinessException;
import com.english.ai.common.ErrorCode;
import com.english.ai.common.PageResult;
import com.english.ai.common.PasswordUtil;
import com.english.ai.common.Result;
import com.english.ai.common.Roles;
import com.english.ai.user.config.AdminContext;
import com.english.ai.user.dto.admin.AdminUserDetailVO;
import com.english.ai.user.dto.admin.AdminUserListItem;
import com.english.ai.user.dto.admin.AdminUserQuery;
import com.english.ai.user.dto.admin.ResetPasswordResponse;
import com.english.ai.user.entity.SysUser;
import com.english.ai.user.entity.UserAbilityRadar;
import com.english.ai.user.entity.UserCoinAccount;
import com.english.ai.user.entity.UserPreference;
import com.english.ai.user.mapper.UserAbilityRadarMapper;
import com.english.ai.user.mapper.UserCoinAccountMapper;
import com.english.ai.user.mapper.UserMapper;
import com.english.ai.user.mapper.UserPreferenceMapper;
import com.english.ai.user.service.AdminAuditService;
import com.english.ai.user.service.AdminUserService;
import com.english.ai.user.util.AdminDateTimeUtil;
import com.english.ai.user.util.PhoneMaskUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.security.SecureRandom;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class AdminUserServiceImpl implements AdminUserService {

    private static final String TEMP_CHARS = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz23456789";
    private static final SecureRandom RANDOM = new SecureRandom();

    private final UserMapper userMapper;
    private final UserAbilityRadarMapper radarMapper;
    private final UserCoinAccountMapper coinAccountMapper;
    private final UserPreferenceMapper preferenceMapper;
    private final AdminAuditService auditService;
    private final RestTemplate exerciseRestTemplate;

    @Value("${service.exercise.url:http://localhost:8082}")
    private String exerciseServiceUrl;

    @Value("${app.internal.token:}")
    private String internalToken;

    @Override
    public PageResult<AdminUserListItem> page(AdminUserQuery query) {
        int page = Math.max(1, query.getPage());
        int size = Math.max(1, Math.min(100, query.getSize()));
        LambdaQueryWrapper<SysUser> wrapper = new LambdaQueryWrapper<>();
        String keyword = trimToNull(query.getKeyword());
        if (keyword != null) {
            wrapper.and(w -> w.like(SysUser::getUsername, keyword)
                    .or().like(SysUser::getNickname, keyword)
                    .or().like(SysUser::getPhone, keyword));
        }
        if (trimToNull(query.getRole()) != null) {
            wrapper.eq(SysUser::getRoles, query.getRole().trim());
        }
        if (query.getStatus() != null) {
            wrapper.eq(SysUser::getStatus, query.getStatus());
        }
        if (trimToNull(query.getCetLevel()) != null) {
            wrapper.eq(SysUser::getCetLevel, query.getCetLevel().trim());
        }
        LocalDate start = AdminDateTimeUtil.parseDate(query.getStartDate());
        LocalDate end = AdminDateTimeUtil.parseDate(query.getEndDate());
        if (start != null) {
            wrapper.ge(SysUser::getCreatedAt, start.atStartOfDay());
        }
        if (end != null) {
            wrapper.le(SysUser::getCreatedAt, end.plusDays(1).atStartOfDay());
        }
        long total = userMapper.selectCount(wrapper);
        wrapper.orderByDesc(SysUser::getCreatedAt)
                .last("LIMIT " + ((page - 1) * size) + "," + size);
        List<SysUser> users = userMapper.selectList(wrapper);
        if (users.isEmpty()) {
            return PageResult.of(Collections.emptyList(), total, page, size);
        }

        List<Long> ids = users.stream().map(SysUser::getId).toList();
        Map<Long, UserAbilityRadar> radarMap = radarMapper.selectList(
                        new LambdaQueryWrapper<UserAbilityRadar>().in(UserAbilityRadar::getUserId, ids))
                .stream().collect(Collectors.toMap(UserAbilityRadar::getUserId, r -> r, (a, b) -> a));
        Map<Long, UserCoinAccount> coinMap = coinAccountMapper.selectList(
                        new LambdaQueryWrapper<UserCoinAccount>().in(UserCoinAccount::getUserId, ids))
                .stream().collect(Collectors.toMap(UserCoinAccount::getUserId, c -> c, (a, b) -> a));

        List<AdminUserListItem> records = users.stream()
                .map(user -> toItem(user, radarMap.get(user.getId()), coinMap.get(user.getId())))
                .collect(Collectors.toList());
        return PageResult.of(records, total, page, size);
    }

    @Override
    public AdminUserDetailVO detail(Long userId) {
        SysUser user = requireUser(userId);
        UserAbilityRadar radar = radarMapper.selectOne(
                new LambdaQueryWrapper<UserAbilityRadar>().eq(UserAbilityRadar::getUserId, userId));
        UserCoinAccount coin = coinAccountMapper.selectOne(
                new LambdaQueryWrapper<UserCoinAccount>().eq(UserCoinAccount::getUserId, userId));
        UserPreference preference = preferenceMapper.selectOne(
                new LambdaQueryWrapper<UserPreference>().eq(UserPreference::getUserId, userId));

        return AdminUserDetailVO.builder()
                .user(toItem(user, radar, coin))
                .radar(radarMap(radar))
                .coin(coinMap(coin))
                .preference(preferenceMap(preference))
                .stats(fetchUserStats(userId))
                .build();
    }

    @Override
    @Transactional
    public AdminUserListItem updateStatus(Long userId, Integer status) {
        if (userId.equals(AdminContext.getOperatorId())) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "不能修改自己的账号状态");
        }
        SysUser user = requireUser(userId);
        user.setStatus(status);
        userMapper.updateById(user);
        auditService.record("USER_STATUS_UPDATE", "USER", userId,
                "status=" + status + ", username=" + user.getUsername());
        return toItemWithExtras(user);
    }

    @Override
    @Transactional
    public AdminUserListItem updateRole(Long userId, String role) {
        String normalized = role == null ? "" : role.trim().toUpperCase();
        if (!Roles.USER.equals(normalized) && !Roles.ADMIN.equals(normalized)) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "角色只能是 ROLE_USER 或 ROLE_ADMIN");
        }
        if (userId.equals(AdminContext.getOperatorId())) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "不能修改自己的角色");
        }
        SysUser user = requireUser(userId);
        boolean wasAdmin = Roles.isAdmin(user.getRoles());
        if (wasAdmin && Roles.USER.equals(normalized)) {
            Long otherAdmins = userMapper.selectCount(new LambdaQueryWrapper<SysUser>()
                    .eq(SysUser::getRoles, Roles.ADMIN)
                    .eq(SysUser::getStatus, 1)
                    .ne(SysUser::getId, userId));
            if (otherAdmins == null || otherAdmins == 0) {
                throw new BusinessException(ErrorCode.CONFLICT, "至少保留一个启用状态的管理员");
            }
        }
        user.setRoles(normalized);
        userMapper.updateById(user);
        auditService.record("USER_ROLE_UPDATE", "USER", userId,
                "from=" + (wasAdmin ? Roles.ADMIN : Roles.USER) + ", to=" + normalized);
        return toItemWithExtras(user);
    }

    @Override
    @Transactional
    public ResetPasswordResponse resetPassword(Long userId) {
        SysUser user = requireUser(userId);
        String temporaryPassword = randomPassword(12);
        user.setPassword(PasswordUtil.encode(temporaryPassword));
        userMapper.updateById(user);
        auditService.record("USER_PASSWORD_RESET", "USER", userId, "username=" + user.getUsername());
        return new ResetPasswordResponse(userId, temporaryPassword);
    }

    private SysUser requireUser(Long userId) {
        SysUser user = userMapper.selectById(userId);
        if (user == null) {
            throw new BusinessException(ErrorCode.NOT_FOUND, "用户不存在");
        }
        return user;
    }

    private AdminUserListItem toItemWithExtras(SysUser user) {
        UserAbilityRadar radar = radarMapper.selectOne(
                new LambdaQueryWrapper<UserAbilityRadar>().eq(UserAbilityRadar::getUserId, user.getId()));
        UserCoinAccount coin = coinAccountMapper.selectOne(
                new LambdaQueryWrapper<UserCoinAccount>().eq(UserCoinAccount::getUserId, user.getId()));
        return toItem(user, radar, coin);
    }

    private AdminUserListItem toItem(SysUser user, UserAbilityRadar radar, UserCoinAccount coin) {
        return AdminUserListItem.builder()
                .id(user.getId())
                .username(user.getUsername())
                .nickname(user.getNickname())
                .avatarUrl(user.getAvatarUrl())
                .cetLevel(user.getCetLevel())
                .phoneMasked(PhoneMaskUtil.mask(user.getPhone()))
                .roles(user.getRoles())
                .status(user.getStatus())
                .lastLoginAt(user.getLastLoginAt())
                .createdAt(user.getCreatedAt())
                .eloScore(radar == null || radar.getEloScore() == null ? 1000 : radar.getEloScore())
                .coinBalance(coin == null || coin.getBalance() == null ? 0 : coin.getBalance())
                .build();
    }

    private Map<String, Object> radarMap(UserAbilityRadar radar) {
        Map<String, Object> map = new LinkedHashMap<>();
        if (radar == null) {
            map.put("eloScore", 1000);
            map.put("vocabularyScore", 0);
            map.put("grammarScore", 0);
            map.put("listeningScore", 0);
            map.put("readingScore", 0);
            map.put("targetLevel", null);
            return map;
        }
        map.put("eloScore", radar.getEloScore());
        map.put("vocabularyScore", radar.getVocabularyScore());
        map.put("grammarScore", radar.getGrammarScore());
        map.put("listeningScore", radar.getListeningScore());
        map.put("readingScore", radar.getReadingScore());
        map.put("targetLevel", radar.getTargetLevel());
        return map;
    }

    private Map<String, Object> coinMap(UserCoinAccount coin) {
        Map<String, Object> map = new LinkedHashMap<>();
        map.put("balance", coin == null ? 0 : coin.getBalance());
        map.put("totalEarned", coin == null ? 0 : coin.getTotalEarned());
        return map;
    }

    private Map<String, Object> preferenceMap(UserPreference preference) {
        Map<String, Object> map = new LinkedHashMap<>();
        if (preference == null) {
            map.put("vocabGroupSize", null);
            map.put("dailyNewWords", null);
            map.put("dailyReviewWords", null);
            return map;
        }
        map.put("vocabGroupSize", preference.getVocabGroupSize());
        map.put("dailyNewWords", preference.getDailyNewWords());
        map.put("dailyReviewWords", preference.getDailyReviewWords());
        return map;
    }

    /**
     * 学习统计失败不影响用户详情；返回 null 并在日志记录。
     */
    private Object fetchUserStats(Long userId) {
        if (internalToken == null || internalToken.isBlank()) {
            return null;
        }
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setAccept(List.of(MediaType.APPLICATION_JSON));
            headers.set("X-Internal-Token", internalToken);
            String url = exerciseServiceUrl + "/internal/admin/user-stats/" + userId;
            ResponseEntity<Result<Map<String, Object>>> response = exerciseRestTemplate.exchange(
                    url, HttpMethod.GET, new HttpEntity<>(headers),
                    new ParameterizedTypeReference<>() {
                    });
            Result<Map<String, Object>> body = response.getBody();
            return body != null && body.getCode() == 200 ? body.getData() : null;
        } catch (Exception e) {
            log.warn("获取用户学习统计失败: userId={}, reason={}", userId, e.getMessage());
            return null;
        }
    }

    private String randomPassword(int length) {
        StringBuilder builder = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            builder.append(TEMP_CHARS.charAt(RANDOM.nextInt(TEMP_CHARS.length())));
        }
        return builder.toString();
    }

    private String trimToNull(String value) {
        if (value == null || value.isBlank()) {
            return null;
        }
        String trimmed = value.trim();
        return trimmed.length() > 50 ? trimmed.substring(0, 50) : trimmed;
    }
}
