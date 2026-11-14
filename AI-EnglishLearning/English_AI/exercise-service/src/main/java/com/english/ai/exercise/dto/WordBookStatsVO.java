package com.english.ai.exercise.dto;

import lombok.Builder;
import lombok.Data;

/**
 * 词书学习统计 — 返回给前端
 */
@Data
@Builder
public class WordBookStatsVO {
    /** 词书编码 */
    private String bookCode;
    /** 词书总词数 */
    private Integer total;
    /** 已学（user_vocabulary 中存在且未忽略） */
    private Integer learned;
    /** 已掌握（is_mastered=1） */
    private Integer mastered;
    /** 忽略数（status=IGNORE） */
    private Integer ignored;
    /** 待背 = total - learned - ignored */
    private Integer toLearn;
    /** 今日计划 = min(dailyNewWords, toLearn) */
    private Integer todayPlan;
}
