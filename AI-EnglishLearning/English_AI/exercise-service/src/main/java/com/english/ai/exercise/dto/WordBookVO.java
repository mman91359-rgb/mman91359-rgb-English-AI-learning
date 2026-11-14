package com.english.ai.exercise.dto;

import lombok.Builder;
import lombok.Data;

/**
 * 词书视图对象 — 返回给前端
 */
@Data
@Builder
public class WordBookVO {
    /** 词书ID */
    private Long id;
    /** 词书编码，如 basic_500 */
    private String code;
    /** 词书名称 */
    private String name;
    /** 目标等级：CET4/CET6 */
    private String level;
    /** 词书说明 */
    private String description;
    /** 词书总词数 */
    private Integer total;
}
