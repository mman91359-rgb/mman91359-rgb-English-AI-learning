package com.english.ai.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.common.BusinessException;
import com.english.ai.common.ErrorCode;
import com.english.ai.common.PageResult;
import com.english.ai.user.dto.admin.UserActivityVO;
import com.english.ai.user.entity.SysActivity;
import com.english.ai.user.entity.SysUser;
import com.english.ai.user.mapper.SysActivityMapper;
import com.english.ai.user.mapper.UserMapper;
import com.english.ai.user.service.UserActivityService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserActivityServiceImpl implements UserActivityService {

    private final SysActivityMapper activityMapper;
    private final UserMapper userMapper;

    @Override
    public PageResult<UserActivityVO> page(Long userId, int page, int size) {
        int safePage = Math.max(1, page);
        int safeSize = Math.max(1, Math.min(100, size));
        SysUser user = requireUser(userId);
        LambdaQueryWrapper<SysActivity> wrapper = visibleWrapper(user);
        long total = activityMapper.selectCount(wrapper);
        wrapper.orderByDesc(SysActivity::getSortOrder)
                .orderByDesc(SysActivity::getStartAt)
                .last("LIMIT " + ((safePage - 1) * safeSize) + "," + safeSize);
        List<UserActivityVO> records = activityMapper.selectList(wrapper).stream()
                .map(this::toVO)
                .collect(Collectors.toList());
        return PageResult.of(records, total, safePage, safeSize);
    }

    @Override
    public UserActivityVO get(Long userId, Long id) {
        SysUser user = requireUser(userId);
        SysActivity activity = activityMapper.selectById(id);
        if (activity == null || !isVisible(activity, user)) {
            throw new BusinessException(ErrorCode.NOT_FOUND, "活动不存在或不可见");
        }
        return toVO(activity);
    }

    private LambdaQueryWrapper<SysActivity> visibleWrapper(SysUser user) {
        LocalDateTime now = LocalDateTime.now();
        LambdaQueryWrapper<SysActivity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SysActivity::getStatus, "PUBLISHED")
                .le(SysActivity::getStartAt, now)
                .gt(SysActivity::getEndAt, now)
                .and(w -> {
                    w.eq(SysActivity::getTargetAudience, "ALL");
                    if (user.getCetLevel() != null && !user.getCetLevel().isBlank()) {
                        w.or().eq(SysActivity::getTargetAudience, user.getCetLevel());
                    }
                });
        return wrapper;
    }

    private boolean isVisible(SysActivity activity, SysUser user) {
        if (!"PUBLISHED".equals(activity.getStatus())) {
            return false;
        }
        LocalDateTime now = LocalDateTime.now();
        if (activity.getStartAt() == null || activity.getEndAt() == null) {
            return false;
        }
        if (activity.getStartAt().isAfter(now) || !activity.getEndAt().isAfter(now)) {
            return false;
        }
        return "ALL".equals(activity.getTargetAudience())
                || (user.getCetLevel() != null && user.getCetLevel().equals(activity.getTargetAudience()));
    }

    private SysUser requireUser(Long userId) {
        SysUser user = userMapper.selectById(userId);
        if (user == null) {
            throw new BusinessException(ErrorCode.NOT_FOUND, "用户不存在");
        }
        return user;
    }

    private UserActivityVO toVO(SysActivity activity) {
        return UserActivityVO.builder()
                .id(activity.getId())
                .title(activity.getTitle())
                .summary(activity.getSummary())
                .content(activity.getContent())
                .bannerUrl(activity.getBannerUrl())
                .activityType(activity.getActivityType())
                .startAt(activity.getStartAt())
                .endAt(activity.getEndAt())
                .sortOrder(activity.getSortOrder())
                .build();
    }
}
