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
    /**
     * 已学：user_vocabulary 中属于本词书的词条数。
     * 合并「忽略」为「标熟」后，词库中每条记录都是已学的词，故此处为全量计数。
     */
    private Integer learned;
    /** 已掌握（is_mastered=1；标熟保持 is_mastered=0，与本项互斥不重叠） */
    private Integer mastered;
    /** 已标熟数（status=FAMILIAR） */
    private Integer familiar;
    /** 待背 = total - learned */
    private Integer toLearn;
    /** 今日计划 = min(dailyNewWords, toLearn) */
    private Integer todayPlan;
}
