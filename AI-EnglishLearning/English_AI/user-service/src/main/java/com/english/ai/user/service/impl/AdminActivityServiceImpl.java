package com.english.ai.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.common.BusinessException;
import com.english.ai.common.ErrorCode;
import com.english.ai.common.PageResult;
import com.english.ai.user.config.AdminContext;
import com.english.ai.user.dto.admin.ActivityQuery;
import com.english.ai.user.dto.admin.ActivityRequest;
import com.english.ai.user.dto.admin.ActivityVO;
import com.english.ai.user.entity.SysActivity;
import com.english.ai.user.entity.SysUser;
import com.english.ai.user.mapper.SysActivityMapper;
import com.english.ai.user.mapper.UserMapper;
import com.english.ai.user.service.AdminActivityService;
import com.english.ai.user.service.AdminAuditService;
import com.english.ai.user.util.AdminDateTimeUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class AdminActivityServiceImpl implements AdminActivityService {

    private static final Set<String> ACTIVITY_TYPES = Set.of("BANNER", "CONTENT");
    private static final Set<String> AUDIENCES = Set.of("ALL", "CET4", "CET6");

    private final SysActivityMapper activityMapper;
    private final UserMapper userMapper;
    private final AdminAuditService auditService;

    @Override
    public PageResult<ActivityVO> page(ActivityQuery query) {
        int page = Math.max(1, query.getPage());
        int size = Math.max(1, Math.min(100, query.getSize()));
        LambdaQueryWrapper<SysActivity> wrapper = new LambdaQueryWrapper<>();
        if (notBlank(query.getStatus())) {
            wrapper.eq(SysActivity::getStatus, query.getStatus().trim());
        }
        if (notBlank(query.getActivityType())) {
            wrapper.eq(SysActivity::getActivityType, query.getActivityType().trim());
        }
        if (notBlank(query.getTargetAudience())) {
            wrapper.eq(SysActivity::getTargetAudience, query.getTargetAudience().trim());
        }
        if (notBlank(query.getKeyword())) {
            String keyword = query.getKeyword().trim();
            wrapper.and(w -> w.like(SysActivity::getTitle, keyword)
                    .or().like(SysActivity::getSummary, keyword));
        }
        long total = activityMapper.selectCount(wrapper);
        wrapper.orderByDesc(SysActivity::getCreatedAt)
                .last("LIMIT " + ((page - 1) * size) + "," + size);
        List<SysActivity> activities = activityMapper.selectList(wrapper);
        Map<Long, String> names = loadCreatorNames(activities);
        List<ActivityVO> records = activities.stream()
                .map(a -> toVO(a, names.get(a.getCreatedBy())))
                .collect(Collectors.toList());
        return PageResult.of(records, total, page, size);
    }

    @Override
    public ActivityVO get(Long id) {
        SysActivity activity = requireActivity(id);
        return toVO(activity, creatorName(activity.getCreatedBy()));
    }

    @Override
    @Transactional
    public Long create(ActivityRequest request) {
        validate(request);
        SysActivity activity = new SysActivity();
        apply(activity, request);
        activity.setStatus("DRAFT");
        activity.setCreatedBy(AdminContext.getOperatorId());
        activity.setUpdatedBy(AdminContext.getOperatorId());
        activityMapper.insert(activity);
        auditService.record("ACTIVITY_CREATE", "ACTIVITY", activity.getId(), "title=" + activity.getTitle());
        return activity.getId();
    }

    @Override
    @Transactional
    public ActivityVO update(Long id, ActivityRequest request) {
        SysActivity activity = requireActivity(id);
        if (!"DRAFT".equals(activity.getStatus())) {
            throw new BusinessException(ErrorCode.CONFLICT, "只有草稿活动可以编辑");
        }
        validate(request);
        apply(activity, request);
        activity.setUpdatedBy(AdminContext.getOperatorId());
        activityMapper.updateById(activity);
        auditService.record("ACTIVITY_UPDATE", "ACTIVITY", id, "title=" + activity.getTitle());
        return toVO(activity, creatorName(activity.getCreatedBy()));
    }

    @Override
    @Transactional
    public ActivityVO publish(Long id) {
        SysActivity activity = requireActivity(id);
        if (!"DRAFT".equals(activity.getStatus())) {
            throw new BusinessException(ErrorCode.CONFLICT, "只有草稿活动可以发布");
        }
        LocalDateTime now = LocalDateTime.now();
        if (activity.getEndAt() == null || !activity.getEndAt().isAfter(now)) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "结束时间必须晚于当前时间");
        }
        if (activity.getStartAt() == null || !activity.getStartAt().isBefore(activity.getEndAt())) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "开始时间必须早于结束时间");
        }
        activity.setStatus("PUBLISHED");
        activity.setUpdatedBy(AdminContext.getOperatorId());
        activityMapper.updateById(activity);
        auditService.record("ACTIVITY_PUBLISH", "ACTIVITY", id, "title=" + activity.getTitle());
        return toVO(activity, creatorName(activity.getCreatedBy()));
    }

    @Override
    @Transactional
    public ActivityVO end(Long id) {
        SysActivity activity = requireActivity(id);
        if (!"PUBLISHED".equals(activity.getStatus())) {
            throw new BusinessException(ErrorCode.CONFLICT, "只有已发布活动可以结束");
        }
        activity.setStatus("ENDED");
        activity.setUpdatedBy(AdminContext.getOperatorId());
        activityMapper.updateById(activity);
        auditService.record("ACTIVITY_END", "ACTIVITY", id, "title=" + activity.getTitle());
        return toVO(activity, creatorName(activity.getCreatedBy()));
    }

    @Override
    @Transactional
    public void delete(Long id) {
        SysActivity activity = requireActivity(id);
        if (!"DRAFT".equals(activity.getStatus())) {
            throw new BusinessException(ErrorCode.CONFLICT, "只有草稿活动可以删除");
        }
        activityMapper.deleteById(id);
        auditService.record("ACTIVITY_DELETE", "ACTIVITY", id, "title=" + activity.getTitle());
    }

    private void validate(ActivityRequest request) {
        if (!ACTIVITY_TYPES.contains(request.getActivityType())) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "活动类型不合法");
        }
        if (!AUDIENCES.contains(request.getTargetAudience())) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "目标人群不合法");
        }
        LocalDateTime start = AdminDateTimeUtil.parseDateTime(request.getStartAt());
        LocalDateTime end = AdminDateTimeUtil.parseDateTime(request.getEndAt());
        if (start == null || end == null || !start.isBefore(end)) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "开始时间必须早于结束时间");
        }
    }

    private void apply(SysActivity activity, ActivityRequest request) {
        activity.setTitle(request.getTitle().trim());
        activity.setSummary(request.getSummary());
        activity.setContent(request.getContent());
        activity.setBannerUrl(request.getBannerUrl());
        activity.setActivityType(request.getActivityType().trim());
        activity.setTargetAudience(request.getTargetAudience().trim());
        activity.setStartAt(AdminDateTimeUtil.parseDateTime(request.getStartAt()));
        activity.setEndAt(AdminDateTimeUtil.parseDateTime(request.getEndAt()));
        activity.setSortOrder(request.getSortOrder() == null ? 0 : request.getSortOrder());
    }

    private SysActivity requireActivity(Long id) {
        SysActivity activity = activityMapper.selectById(id);
        if (activity == null) {
            throw new BusinessException(ErrorCode.NOT_FOUND, "活动不存在");
        }
        return activity;
    }

    private Map<Long, String> loadCreatorNames(List<SysActivity> activities) {
        List<Long> ids = activities.stream()
                .map(SysActivity::getCreatedBy)
                .filter(id -> id != null)
                .distinct()
                .toList();
        if (ids.isEmpty()) {
            return Collections.emptyMap();
        }
        return userMapper.selectBatchIds(ids).stream()
                .collect(Collectors.toMap(SysUser::getId,
                        u -> u.getNickname() == null ? u.getUsername() : u.getNickname(),
                        (a, b) -> a));
    }

    private String creatorName(Long createdBy) {
        if (createdBy == null) {
            return null;
        }
        SysUser user = userMapper.selectById(createdBy);
        return user == null ? null : (user.getNickname() == null ? user.getUsername() : user.getNickname());
    }

    private ActivityVO toVO(SysActivity activity, String createdByName) {
        return ActivityVO.builder()
                .id(activity.getId())
                .title(activity.getTitle())
                .summary(activity.getSummary())
                .content(activity.getContent())
                .bannerUrl(activity.getBannerUrl())
                .activityType(activity.getActivityType())
                .targetAudience(activity.getTargetAudience())
                .status(activity.getStatus())
                .effectiveStatus(effectiveStatus(activity))
                .startAt(activity.getStartAt())
                .endAt(activity.getEndAt())
                .sortOrder(activity.getSortOrder())
                .createdBy(activity.getCreatedBy())
                .createdByName(createdByName)
                .createdAt(activity.getCreatedAt())
                .updatedAt(activity.getUpdatedAt())
                .build();
    }

    private String effectiveStatus(SysActivity activity) {
        if ("DRAFT".equals(activity.getStatus())) {
            return "DRAFT";
        }
        if ("ENDED".equals(activity.getStatus())) {
            return "ENDED";
        }
        LocalDateTime now = LocalDateTime.now();
        if (activity.getStartAt() != null && now.isBefore(activity.getStartAt())) {
            return "SCHEDULED";
        }
        if (activity.getEndAt() != null && !now.isBefore(activity.getEndAt())) {
            return "ENDED";
        }
        return "ACTIVE";
    }

    private boolean notBlank(String value) {
        return value != null && !value.isBlank();
    }
}
