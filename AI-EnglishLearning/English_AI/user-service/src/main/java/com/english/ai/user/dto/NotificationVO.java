package com.english.ai.user.dto;

import lombok.Data;

import java.util.Map;

/**
 * 个人通知 VO — 字段形状与前端 {@code composables/useNotifications.ts} 的 Notification 对齐。
 * <p>
 * 四处转换在本层完成，前端零改动：
 * <ul>
 *   <li>{@code type} 下发小写四值 system/reminder/achievement/level，与库里存的值同名同大小写</li>
 *   <li>{@code createdAt} 下发毫秒时间戳（前端类型是 number）</li>
 *   <li>{@code params_json} 在库里是一个字段，这里拆成 titleParams / contentParams 两个</li>
 *   <li>{@code id} 下发字符串（前端类型是 string）</li>
 * </ul>
 */
@Data
public class NotificationVO {

    /** 通知ID（字符串形式，前端类型为 string） */
    private String id;

    /** 类型：system / reminder / achievement / level */
    private String type;

    /** 标题 i18n key */
    private String titleKey;

    /** 正文 i18n key */
    private String contentKey;

    /** 标题渲染参数，可为 null */
    private Map<String, Object> titleParams;

    /** 正文渲染参数，可为 null */
    private Map<String, Object> contentParams;

    /** 创建时间（毫秒时间戳） */
    private Long createdAt;

    /** 是否已读 */
    private Boolean read;
}
