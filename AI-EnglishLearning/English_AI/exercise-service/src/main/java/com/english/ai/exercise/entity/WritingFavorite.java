package com.english.ai.exercise.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 写作题目收藏 — 每用户每题仅一行，唯一键 (user_id, topic_key) 写在 DDL 里。
 * <p>
 * 注意与既有的 user_favorite 区分：那张表按 source_type=SENTENCE|EXERCISE 收句子与习题，
 * 且只有普通索引没有唯一键；本表专收写作题目，key 用 topic_key。
 */
@Data
@TableName("writing_favorite")
public class WritingFavorite {

    @TableId(type = IdType.AUTO)
    private Long id;

    /** 用户ID */
    private Long userId;

    /** 题目key；与 writing_topic.topic_key 对应 */
    private String topicKey;

    private LocalDateTime createdAt;
}
