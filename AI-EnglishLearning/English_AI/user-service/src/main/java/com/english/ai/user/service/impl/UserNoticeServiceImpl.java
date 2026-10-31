package com.english.ai.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.common.BusinessException;
import com.english.ai.common.ErrorCode;
import com.english.ai.common.PageResult;
import com.english.ai.user.dto.admin.UserNoticeVO;
import com.english.ai.user.entity.SysNotice;
import com.english.ai.user.entity.SysUser;
import com.english.ai.user.entity.UserNoticeRead;
import com.english.ai.user.mapper.SysNoticeMapper;
import com.english.ai.user.mapper.UserMapper;
import com.english.ai.user.mapper.UserNoticeReadMapper;
import com.english.ai.user.service.UserNoticeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserNoticeServiceImpl implements UserNoticeService {

    private final SysNoticeMapper noticeMapper;
    private final UserNoticeReadMapper readMapper;
    private final UserMapper userMapper;

    @Override
    public PageResult<UserNoticeVO> page(Long userId, int page, int size) {
        int safePage = Math.max(1, page);
        int safeSize = Math.max(1, Math.min(100, size));
        SysUser user = requireUser(userId);
        LambdaQueryWrapper<SysNotice> wrapper = visibleWrapper(user);
        long total = noticeMapper.selectCount(wrapper);
        wrapper.orderByDesc(SysNotice::getPublishAt)
                .last("LIMIT " + ((safePage - 1) * safeSize) + "," + safeSize);
        List<SysNotice> notices = noticeMapper.selectList(wrapper);
        Set<Long> readIds = readIds(userId);
        List<UserNoticeVO> records = notices.stream()
                .map(notice -> toVO(notice, readIds.contains(notice.getId())))
                .collect(Collectors.toList());
        return PageResult.of(records, total, safePage, safeSize);
    }

    @Override
    public long unreadCount(Long userId) {
        SysUser user = requireUser(userId);
        List<SysNotice> visible = noticeMapper.selectList(visibleWrapper(user));
        if (visible.isEmpty()) {
            return 0;
        }
        Set<Long> readIds = readIds(userId);
        return visible.stream().filter(notice -> !readIds.contains(notice.getId())).count();
    }

    @Override
    public boolean markRead(Long userId, Long noticeId) {
        SysUser user = requireUser(userId);
        SysNotice notice = noticeMapper.selectById(noticeId);
        if (notice == null || !isVisible(notice, user)) {
            throw new BusinessException(ErrorCode.NOT_FOUND, "通知不存在或不可见");
        }
        Long exists = readMapper.selectCount(new LambdaQueryWrapper<UserNoticeRead>()
                .eq(UserNoticeRead::getNoticeId, noticeId)
                .eq(UserNoticeRead::getUserId, userId));
        if (exists != null && exists > 0) {
            return true;
        }
        try {
            UserNoticeRead read = new UserNoticeRead();
            read.setNoticeId(noticeId);
            read.setUserId(userId);
            read.setReadAt(LocalDateTime.now());
            readMapper.insert(read);
        } catch (DuplicateKeyException ignored) {
            // 并发重复标记已读，保持幂等
        }
        return true;
    }

    @Override
    public int markAllRead(Long userId) {
        SysUser user = requireUser(userId);
        List<SysNotice> visible = noticeMapper.selectList(visibleWrapper(user));
        if (visible.isEmpty()) {
            return 0;
        }
        Set<Long> readIds = readIds(userId);
        int inserted = 0;
        for (SysNotice notice : visible) {
            if (readIds.contains(notice.getId())) {
                continue;
            }
            try {
                UserNoticeRead read = new UserNoticeRead();
                read.setNoticeId(notice.getId());
                read.setUserId(userId);
                read.setReadAt(LocalDateTime.now());
                readMapper.insert(read);
                inserted++;
            } catch (DuplicateKeyException ignored) {
                // 并发场景下忽略
            }
        }
        return inserted;
    }

    private LambdaQueryWrapper<SysNotice> visibleWrapper(SysUser user) {
        LocalDateTime now = LocalDateTime.now();
        LambdaQueryWrapper<SysNotice> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SysNotice::getStatus, "PUBLISHED")
                .and(w -> w.isNull(SysNotice::getPublishAt).or().le(SysNotice::getPublishAt, now))
                .and(w -> w.isNull(SysNotice::getExpireAt).or().gt(SysNotice::getExpireAt, now))
                .and(w -> {
                    w.eq(SysNotice::getTargetAudience, "ALL");
                    if (user.getCetLevel() != null && !user.getCetLevel().isBlank()) {
                        w.or().eq(SysNotice::getTargetAudience, user.getCetLevel());
                    }
                });
        return wrapper;
    }

    private boolean isVisible(SysNotice notice, SysUser user) {
        if (!"PUBLISHED".equals(notice.getStatus())) {
            return false;
        }
        LocalDateTime now = LocalDateTime.now();
        if (notice.getPublishAt() != null && notice.getPublishAt().isAfter(now)) {
            return false;
        }
        if (notice.getExpireAt() != null && !notice.getExpireAt().isAfter(now)) {
            return false;
        }
        return "ALL".equals(notice.getTargetAudience())
                || (user.getCetLevel() != null && user.getCetLevel().equals(notice.getTargetAudience()));
    }

    private Set<Long> readIds(Long userId) {
        List<UserNoticeRead> reads = readMapper.selectList(new LambdaQueryWrapper<UserNoticeRead>()
                .eq(UserNoticeRead::getUserId, userId));
        return reads.stream().map(UserNoticeRead::getNoticeId).collect(Collectors.toCollection(HashSet::new));
    }

    private SysUser requireUser(Long userId) {
        SysUser user = userMapper.selectById(userId);
        if (user == null) {
            throw new BusinessException(ErrorCode.NOT_FOUND, "用户不存在");
        }
        return user;
    }

    private UserNoticeVO toVO(SysNotice notice, boolean read) {
        return UserNoticeVO.builder()
                .id(notice.getId())
                .title(notice.getTitle())
                .content(notice.getContent())
                .noticeType(notice.getNoticeType())
                .publishAt(notice.getPublishAt())
                .read(read)
                .build();
    }
}
