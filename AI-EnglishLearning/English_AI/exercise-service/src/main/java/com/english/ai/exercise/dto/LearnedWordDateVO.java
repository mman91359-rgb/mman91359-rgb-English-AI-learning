package com.english.ai.exercise.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

/**
 * 已学词库日期分组头 — 「全部已学」页按日期分组的段落标题
 */
@Data
@Builder
@AllArgsConstructor
public class LearnedWordDateVO {

    /** 分组日，格式 yyyy-MM-dd。数据库 datetime 无时区，此值由后端截断，前端不得再做时区转换 */
    private String date;

    /** 该日期下的词条数 */
    private Integer count;
}
