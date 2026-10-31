package com.english.ai.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.common.Result;
import com.english.ai.common.Roles;
import com.english.ai.user.dto.admin.AdminOverviewVO;
import com.english.ai.user.dto.admin.ExerciseOverviewVO;
import com.english.ai.user.entity.SysActivity;
import com.english.ai.user.entity.SysNotice;
import com.english.ai.user.entity.SysUser;
import com.english.ai.user.entity.UserCheckIn;
import com.english.ai.user.entity.UserCoinAccount;
import com.english.ai.user.mapper.SysActivityMapper;
import com.english.ai.user.mapper.SysNoticeMapper;
import com.english.ai.user.mapper.UserCheckInMapper;
import com.english.ai.user.mapper.UserCoinAccountMapper;
import com.english.ai.user.mapper.UserMapper;
import com.english.ai.user.service.AdminOverviewService;
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
import org.springframework.web.client.RestTemplate;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class AdminOverviewServiceImpl implements AdminOverviewService {

    private final UserMapper userMapper;
    private final UserCoinAccountMapper coinAccountMapper;
    private final UserCheckInMapper checkInMapper;
    private final SysNoticeMapper noticeMapper;
    private final SysActivityMapper activityMapper;
    private final RestTemplate exerciseRestTemplate;

    @Value("${service.exercise.url:http://localhost:8082}")
    private String exerciseServiceUrl;

    @Value("${app.internal.token:}")
    private String internalToken;

    @Override
    public AdminOverviewVO overview() {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime todayStart = LocalDate.now().atStartOfDay();
        LocalDateTime weekAgo = now.minusDays(7);

        long totalUsers = countUsers(null, null, null);
        long enabledUsers = countUsers(1, null, null);
        long newUsersToday = countUsers(null, todayStart, null);
        long newUsers7d = countUsers(null, weekAgo, null);
        long adminUsers = countUsers(null, null, Roles.ADMIN);
        Long balance = coinAccountMapper.sumBalance();
        long todayCheckIns = checkInMapper.selectCount(new LambdaQueryWrapper<UserCheckIn>()
                .eq(UserCheckIn::getCheckInDate, LocalDate.now()));

        long activeNotices = noticeMapper.selectCount(new LambdaQueryWrapper<SysNotice>()
                .eq(SysNotice::getStatus, "PUBLISHED")
                .and(w -> w.isNull(SysNotice::getPublishAt).or().le(SysNotice::getPublishAt, now))
                .and(w -> w.isNull(SysNotice::getExpireAt).or().gt(SysNotice::getExpireAt, now)));

        long activeActivities = activityMapper.selectCount(new LambdaQueryWrapper<SysActivity>()
                .eq(SysActivity::getStatus, "PUBLISHED")
                .le(SysActivity::getStartAt, now)
                .gt(SysActivity::getEndAt, now));

        ExerciseOverviewVO exercise = fetchExerciseOverview();
        boolean degraded = exercise == null;
        if (degraded) {
            exercise = emptyExercise();
        }

        return AdminOverviewVO.builder()
                .generatedAt(now)
                .exerciseDegraded(degraded)
                .totalUsers(totalUsers)
                .enabledUsers(enabledUsers)
                .disabledUsers(Math.max(0, totalUsers - enabledUsers))
                .newUsersToday(newUsersToday)
                .newUsers7d(newUsers7d)
                .adminUsers(adminUsers)
                .totalCoinBalance(balance == null ? 0 : balance)
                .todayCheckIns(todayCheckIns)
                .activeNotices(activeNotices)
                .activeActivities(activeActivities)
                .exercise(exercise)
                .build();
    }

    private long countUsers(Integer status, LocalDateTime createdAfter, String role) {
        LambdaQueryWrapper<SysUser> wrapper = new LambdaQueryWrapper<>();
        if (status != null) {
            wrapper.eq(SysUser::getStatus, status);
        }
        if (createdAfter != null) {
            wrapper.ge(SysUser::getCreatedAt, createdAfter);
        }
        if (role != null) {
            wrapper.eq(SysUser::getRoles, role);
        }
        Long count = userMapper.selectCount(wrapper);
        return count == null ? 0 : count;
    }

    private ExerciseOverviewVO fetchExerciseOverview() {
        if (internalToken == null || internalToken.isBlank()) {
            return null;
        }
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setAccept(List.of(MediaType.APPLICATION_JSON));
            headers.set("X-Internal-Token", internalToken);
            String url = exerciseServiceUrl + "/internal/admin/overview";
            ResponseEntity<Result<ExerciseOverviewVO>> response = exerciseRestTemplate.exchange(
                    url, HttpMethod.GET, new HttpEntity<>(headers),
                    new ParameterizedTypeReference<>() {
                    });
            Result<ExerciseOverviewVO> body = response.getBody();
            return body != null && body.getCode() == 200 ? body.getData() : null;
        } catch (Exception e) {
            log.warn("获取学习统计概览失败，返回降级数据: {}", e.getMessage());
            return null;
        }
    }

    private ExerciseOverviewVO emptyExercise() {
        ExerciseOverviewVO vo = new ExerciseOverviewVO();
        vo.setQuestionTotal(0L);
        vo.setPendingReview(0L);
        vo.setApprovedTotal(0L);
        vo.setRejectedTotal(0L);
        vo.setAnsweredLast30d(0L);
        vo.setTodayAnswered(0L);
        vo.setActiveUsersToday(0L);
        vo.setActiveUsers7d(0L);
        vo.setTotalStudySeconds(0L);
        vo.setDataWindowDays(30);
        return vo;
    }
}
