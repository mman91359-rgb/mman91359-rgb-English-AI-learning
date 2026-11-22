package com.english.ai.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.english.ai.common.BizCode;
import com.english.ai.common.BusinessException;
import com.english.ai.common.PageResult;
import com.english.ai.user.dto.NotificationVO;
import com.english.ai.user.entity.Notification;
import com.english.ai.user.mapper.NotificationMapper;
import com.english.ai.user.service.NotificationService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * 个人通知服务实现。
 * <p>
 * 三条口径：
 * <ul>
 *   <li>查询全部带 user_id 条件，不允许跨用户读取</li>
 *   <li>清空走逻辑删除（@TableLogic 会把 delete 拦成 UPDATE is_deleted=1），不物理删数据</li>
 *   <li>params_json 的拆包在 VO 层完成，前端拿到的是 titleParams / contentParams 两个对象</li>
 * </ul>
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class NotificationServiceImpl implements NotificationService {

    private static final int DEFAULT_SIZE = 20;
    private static final int MAX_SIZE = 100;

    private final NotificationMapper notificationMapper;
    private final ObjectMapper objectMapper;

    @Override
    public PageResult<NotificationVO> page(Long userId, int page, int size, boolean unreadOnly) {
        int safePage = page < 1 ? 1 : page;
        int safeSize = size < 1 ? DEFAULT_SIZE : Math.min(size, MAX_SIZE);

        LambdaQueryWrapper<Notification> q = new LambdaQueryWrapper<Notification>()
                .eq(Notification::getUserId, userId);
        if (unreadOnly) {
            q.eq(Notification::getIsRead, 0);
        }
        q.orderByDesc(Notification::getCreatedAt).orderByDesc(Notification::getId);

        Page<Notification> result = notificationMapper.selectPage(new Page<>(safePage, safeSize), q);
        List<NotificationVO> records = result.getRecords().stream().map(this::toVO).toList();
        return PageResult.of(records, result.getTotal(), safePage, safeSize);
    }

    @Override
    public int markRead(Long userId, Long notificationId) {
        if (notificationId == null) {
            throw new BusinessException(BizCode.PARAM_INVALID);
        }
        Notification notification = notificationMapper.selectOne(new LambdaQueryWrapper<Notification>()
                .eq(Notification::getId, notificationId)
                .eq(Notification::getUserId, userId));
        if (notification == null) {
            throw new BusinessException(BizCode.NOTIFICATION_NOT_FOUND);
        }
        if (notification.getIsRead() != null && notification.getIsRead() == 1) {
            return 0;
        }
        notification.setIsRead(1);
        notification.setUpdatedAt(LocalDateTime.now());
        return notificationMapper.updateById(notification);
    }

    @Override
    public int markAllRead(Long userId) {
        Notification patch = new Notification();
        patch.setIsRead(1);
        patch.setUpdatedAt(LocalDateTime.now());
        return notificationMapper.update(patch, new LambdaQueryWrapper<Notification>()
                .eq(Notification::getUserId, userId)
                .eq(Notification::getIsRead, 0));
    }

    @Override
    public int clear(Long userId) {
        return notificationMapper.delete(new LambdaQueryWrapper<Notification>()
                .eq(Notification::getUserId, userId));
    }

    @Override
    public long unreadCount(Long userId) {
        Long count = notificationMapper.selectCount(new LambdaQueryWrapper<Notification>()
                .eq(Notification::getUserId, userId)
                .eq(Notification::getIsRead, 0));
        return count == null ? 0L : count;
    }

    // ========== 内部方法 ==========

    private NotificationVO toVO(Notification notification) {
        NotificationVO vo = new NotificationVO();
        vo.setId(String.valueOf(notification.getId()));
        vo.setType(notification.getType());
        vo.setTitleKey(notification.getTitleKey());
        vo.setContentKey(notification.getContentKey());

        Map<String, Object> root = parseParams(notification.getParamsJson());
        vo.setTitleParams(subMap(root, "titleParams"));
        vo.setContentParams(subMap(root, "contentParams"));

        vo.setCreatedAt(notification.getCreatedAt() == null
                ? null
                : notification.getCreatedAt().atZone(ZoneId.systemDefault()).toInstant().toEpochMilli());
        vo.setRead(notification.getIsRead() != null && notification.getIsRead() == 1);
        return vo;
    }

    private Map<String, Object> parseParams(String json) {
        if (!StringUtils.hasText(json)) {
            return Collections.emptyMap();
        }
        try {
            return objectMapper.readValue(json, new TypeReference<Map<String, Object>>() {
            });
        } catch (Exception e) {
            log.warn("通知参数 JSON 解析失败，按空参数处理: {}", e.getMessage());
            return Collections.emptyMap();
        }
    }

    /** 从根参数里取子对象；不是对象类型时返回 null，不硬转 */
    @SuppressWarnings("unchecked")
    private Map<String, Object> subMap(Map<String, Object> root, String key) {
        Object value = root.get(key);
        return value instanceof Map ? (Map<String, Object>) value : null;
    }
}
