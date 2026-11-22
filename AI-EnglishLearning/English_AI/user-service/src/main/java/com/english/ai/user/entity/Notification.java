package com.english.ai.user.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 点对点通知 — 每人一条，表内自带 is_read，与广播的 sys_notice + user_notice_read 是两套体系。
 * <p>
 * 文案按需求文档 §7.3 定稿下发改 i18n key（titleKey / contentKey），不发育好的整句：
 * 前端 useNotifications.ts 存的本来就是 titleKey/contentKey，TopAppBar 按 $t 渲染，
 * 漏加映射时显示原始 key，属显性失败好排查。
 * <p>
 * paramsJson 约定结构 {"titleParams":{...},"contentParams":{...}}，由 VO 层拆成两个字段下发。
 */
@Data
@TableName("notification")
public class Notification {

    @TableId(type = IdType.AUTO)
    private Long id;

    /** 用户ID */
    private Long userId;

    /** 通知类型：SYSTEM/REMINDER/ACHIEVEMENT/LEVEL */
    private String type;

    /** 标题 i18n key，如 notification.achievementTitle；为空时前端按 type 兜底 */
    private String titleKey;

    /** 正文 i18n key；为空时前端按 type 兜底 */
    private String contentKey;

    /** 参数 JSON：{"titleParams":{...},"contentParams":{...}}，可为空 */
    private String paramsJson;

    /** 是否已读：1=已读, 0=未读 */
    private Integer isRead;

    /** 逻辑删除：1=已删除, 0=正常 */
    @TableLogic
    private Integer isDeleted;

    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;
}
