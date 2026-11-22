package com.english.ai.exercise.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 写作草稿 — 每用户每题仅一行，唯一键 (user_id, topic_key) 写在 DDL 里，
 * 并发保存不会插出两条。
 * <p>
 * 用户清空正文后仍保留这一行（content 可为空），便于在同一道题下继续写，
 * 而不是每次清空都删行再重建。
 */
@Data
@TableName("writing_draft")
public class WritingDraft {

    @TableId(type = IdType.AUTO)
    private Long id;

    /** 用户ID */
    private Long userId;

    /** 题目key；与 writing_topic.topic_key 对应 */
    private String topicKey;

    /** 草稿正文，可为空 */
    private String content;

    /** 累计作答用时（秒），前端覆盖写入不作累加 */
    private Integer elapsedSeconds;

    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;
}
