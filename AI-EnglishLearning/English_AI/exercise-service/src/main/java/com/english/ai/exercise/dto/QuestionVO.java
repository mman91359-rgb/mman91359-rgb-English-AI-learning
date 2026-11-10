package com.english.ai.exercise.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 题目视图对象 — 返回给前端（合并info+content）
 */
@Data
@Builder
public class QuestionVO {

    /** 题目ID */
    private Long id;

    /** 模块类型: 1词汇 2语法 3翻译 4听力 5造句 6写作 */
    private Integer moduleType;

    /** 难度等级: 1~8 */
    private Integer difficultyLevel;

    /** 题型 */
    private String questionType;

    /** 题干 */
    private String stem;

    /** 选项(JSON字符串) */
    private String options;

    /** 正确答案（练习模式不返回，提交后才展示） */
    private String correctAnswer;

    /** 提示（正确答案前2个字母，练习模式可用） */
    private String hint;

    /** 题目解析 */
    private String analysis;

    /** 是否展示答案 */
    private Boolean showAnswer;

    /** 听力音频地址（仅听力题有值） */
    private String audioUrl;

    /** 听力原文（仅 showAnswer=true 时下发，作答前不泄题） */
    private String transcript;

    /** 文章段播放时长（秒），区别于 SubmitRequest 的答题用时 */
    private Integer durationSeconds;

    /** 完整音频总时长（秒） */
    private Integer audioTotalSeconds;

    /** 文章段起点（秒，包含） */
    private BigDecimal audioStartSeconds;

    /** 文章段终点（秒，不包含） */
    private BigDecimal audioEndSeconds;

    /** 题目段起点（秒，包含） */
    private BigDecimal questionStartSeconds;

    /** 题目段终点（秒，不包含） */
    private BigDecimal questionEndSeconds;

    /** 答案关键句起点（秒，包含）；复听定位用 */
    private BigDecimal answerStartSeconds;

    /** 答案关键句终点（秒，不包含） */
    private BigDecimal answerEndSeconds;

    /** 题组/音频段落标识 */
    private String groupKey;

    /** 听力题型 */
    private String listeningType;

    /** 听力 LRC 字幕（仅提交后返回，作答前不下发） */
    private String lrcContent;

    /** 仅后端新词去重使用，不返回前端 */
    @JsonIgnore
    private String answerWord;
}
