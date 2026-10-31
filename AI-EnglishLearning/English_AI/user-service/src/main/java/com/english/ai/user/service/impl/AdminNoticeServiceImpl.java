package com.english.ai.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.common.BusinessException;
import com.english.ai.common.ErrorCode;
import com.english.ai.common.PageResult;
import com.english.ai.user.config.AdminContext;
import com.english.ai.user.dto.admin.NoticeQuery;
import com.english.ai.user.dto.admin.NoticeRequest;
import com.english.ai.user.dto.admin.NoticeVO;
import com.english.ai.user.entity.SysNotice;
import com.english.ai.user.entity.SysUser;
import com.english.ai.user.mapper.SysNoticeMapper;
import com.english.ai.user.mapper.UserMapper;
import com.english.ai.user.service.AdminAuditService;
import com.english.ai.user.service.AdminNoticeService;
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
public class AdminNoticeServiceImpl implements AdminNoticeService {

    private static final Set<String> NOTICE_TYPES = Set.of("SYSTEM", "REMINDER", "ACTIVITY");
    private static final Set<String> AUDIENCES = Set.of("ALL", "CET4", "CET6");

    private final SysNoticeMapper noticeMapper;
    private final UserMapper userMapper;
    private final AdminAuditService auditService;

    @Override
    public PageResult<NoticeVO> page(NoticeQuery query) {
        int page = Math.max(1, query.getPage());
        int size = Math.max(1, Math.min(100, query.getSize()));
        LambdaQueryWrapper<SysNotice> wrapper = new LambdaQueryWrapper<>();
        if (notBlank(query.getStatus())) {
            wrapper.eq(SysNotice::getStatus, query.getStatus().trim());
        }
        if (notBlank(query.getNoticeType())) {
            wrapper.eq(SysNotice::getNoticeType, query.getNoticeType().trim());
        }
        if (notBlank(query.getTargetAudience())) {
            wrapper.eq(SysNotice::getTargetAudience, query.getTargetAudience().trim());
        }
        if (notBlank(query.getKeyword())) {
            String keyword = query.getKeyword().trim();
            wrapper.and(w -> w.like(SysNotice::getTitle, keyword)
                    .or().like(SysNotice::getContent, keyword));
        }
        long total = noticeMapper.selectCount(wrapper);
        wrapper.orderByDesc(SysNotice::getCreatedAt)
                .last("LIMIT " + ((page - 1) * size) + "," + size);
        List<SysNotice> notices = noticeMapper.selectList(wrapper);
        Map<Long, String> names = loadCreatorNames(notices);
        List<NoticeVO> records = notices.stream()
                .map(n -> toVO(n, names.get(n.getCreatedBy())))
                .collect(Collectors.toList());
        return PageResult.of(records, total, page, size);
    }

    @Override
    public NoticeVO get(Long id) {
        SysNotice notice = requireNotice(id);
        return toVO(notice, creatorName(notice.getCreatedBy()));
    }

    @Override
    @Transactional
    public Long create(NoticeRequest request) {
        validate(request);
        SysNotice notice = new SysNotice();
        apply(notice, request);
        notice.setStatus("DRAFT");
        notice.setCreatedBy(AdminContext.getOperatorId());
        notice.setUpdatedBy(AdminContext.getOperatorId());
        noticeMapper.insert(notice);
        auditService.record("NOTICE_CREATE", "NOTICE", notice.getId(), "title=" + notice.getTitle());
        return notice.getId();
    }

    @Override
    @Transactional
    public NoticeVO update(Long id, NoticeRequest request) {
        SysNotice notice = requireNotice(id);
        if (!"DRAFT".equals(notice.getStatus())) {
            throw new BusinessException(ErrorCode.CONFLICT, "只有草稿通知可以编辑");
        }
        validate(request);
        apply(notice, request);
        notice.setUpdatedBy(AdminContext.getOperatorId());
        noticeMapper.updateById(notice);
        auditService.record("NOTICE_UPDATE", "NOTICE", id, "title=" + notice.getTitle());
        return toVO(notice, creatorName(notice.getCreatedBy()));
    }

    @Override
    @Transactional
    public NoticeVO publish(Long id) {
        SysNotice notice = requireNotice(id);
        if (!"DRAFT".equals(notice.getStatus())) {
            throw new BusinessException(ErrorCode.CONFLICT, "只有草稿通知可以发布");
        }
        LocalDateTime now = LocalDateTime.now();
        if (notice.getExpireAt() != null && !notice.getExpireAt().isAfter(now)) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "过期时间必须晚于当前时间");
        }
        if (notice.getPublishAt() == null || notice.getPublishAt().isBefore(now)) {
            notice.setPublishAt(now);
        }
        notice.setStatus("PUBLISHED");
        notice.setUpdatedBy(AdminContext.getOperatorId());
        noticeMapper.updateById(notice);
        auditService.record("NOTICE_PUBLISH", "NOTICE", id, "title=" + notice.getTitle());
        return toVO(notice, creatorName(notice.getCreatedBy()));
    }

    @Override
    @Transactional
    public NoticeVO expire(Long id) {
        SysNotice notice = requireNotice(id);
        if (!"PUBLISHED".equals(notice.getStatus())) {
            throw new BusinessException(ErrorCode.CONFLICT, "只有已发布通知可以下线");
        }
        notice.setStatus("EXPIRED");
        notice.setUpdatedBy(AdminContext.getOperatorId());
        noticeMapper.updateById(notice);
        auditService.record("NOTICE_EXPIRE", "NOTICE", id, "title=" + notice.getTitle());
        return toVO(notice, creatorName(notice.getCreatedBy()));
    }

    @Override
    @Transactional
    public void delete(Long id) {
        SysNotice notice = requireNotice(id);
        if (!"DRAFT".equals(notice.getStatus())) {
            throw new BusinessException(ErrorCode.CONFLICT, "只有草稿通知可以删除");
        }
        noticeMapper.deleteById(id);
        auditService.record("NOTICE_DELETE", "NOTICE", id, "title=" + notice.getTitle());
    }

    private void validate(NoticeRequest request) {
        if (!NOTICE_TYPES.contains(request.getNoticeType())) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "通知类型不合法");
        }
        if (!AUDIENCES.contains(request.getTargetAudience())) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "目标人群不合法");
        }
        LocalDateTime publishAt = AdminDateTimeUtil.parseDateTime(request.getPublishAt());
        LocalDateTime expireAt = AdminDateTimeUtil.parseDateTime(request.getExpireAt());
        if (publishAt != null && expireAt != null && !expireAt.isAfter(publishAt)) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "过期时间必须晚于发布时间");
        }
    }

    private void apply(SysNotice notice, NoticeRequest request) {
        notice.setTitle(request.getTitle().trim());
        notice.setContent(request.getContent());
        notice.setNoticeType(request.getNoticeType().trim());
        notice.setTargetAudience(request.getTargetAudience().trim());
        notice.setPublishAt(AdminDateTimeUtil.parseDateTime(request.getPublishAt()));
        notice.setExpireAt(AdminDateTimeUtil.parseDateTime(request.getExpireAt()));
    }

    private SysNotice requireNotice(Long id) {
        SysNotice notice = noticeMapper.selectById(id);
        if (notice == null) {
            throw new BusinessException(ErrorCode.NOT_FOUND, "通知不存在");
        }
        return notice;
    }

    private Map<Long, String> loadCreatorNames(List<SysNotice> notices) {
        List<Long> ids = notices.stream()
                .map(SysNotice::getCreatedBy)
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

    private NoticeVO toVO(SysNotice notice, String createdByName) {
        return NoticeVO.builder()
                .id(notice.getId())
                .title(notice.getTitle())
                .content(notice.getContent())
                .noticeType(notice.getNoticeType())
                .targetAudience(notice.getTargetAudience())
                .status(notice.getStatus())
                .publishAt(notice.getPublishAt())
                .expireAt(notice.getExpireAt())
                .createdBy(notice.getCreatedBy())
                .createdByName(createdByName)
                .createdAt(notice.getCreatedAt())
                .updatedAt(notice.getUpdatedAt())
                .build();
    }

    private boolean notBlank(String value) {
        return value != null && !value.isBlank();
    }
}
