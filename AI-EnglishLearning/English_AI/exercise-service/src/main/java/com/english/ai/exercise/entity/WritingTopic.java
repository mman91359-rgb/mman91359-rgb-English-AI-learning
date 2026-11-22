package com.english.ai.exercise.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 写作题库 — 66 道历年真题（CET4 32 / CET6 34），由 V1.0.60、V1.0.61 种子迁移导入。
 * <p>
 * type 五档与前端 {@code utils/writing.ts} 的 WRITING_TYPES 完全一致：
 * SHORT_ESSAY / ARGUMENTATIVE / LETTER / PRACTICAL / CHART。
 * <p>
 * requirements / outlineHints / usefulExpressions 三列在真题源数据中不存在，一律为 null，
 * 由 VO 层转成空数组下发，不让前端处理 null。
 */
@Data
@TableName("writing_topic")
public class WritingTopic {

    @TableId(type = IdType.AUTO)
    private Long id;

    /** 题目key，取值即真题 examId（如 cet4-2024-06-1）；与 writing_essay.topic_key 同一命名空间 */
    private String topicKey;

    /** 题型：SHORT_ESSAY/ARGUMENTATIVE/LETTER/PRACTICAL/CHART */
    private String type;

    /** 等级：CET4/CET6；null 表示通用 */
    private String level;

    /** 题目标题（中文） */
    private String title;

    /** 中文写作指令 */
    private String directions;

    /** 英文题目陈述（考生看到的题干） */
    private String topic;

    /** 写作要求列表，JSON 数组；真题无此项 */
    private String requirements;

    /** 字数下限 */
    private Integer wordRangeMin;

    /** 字数上限 */
    private Integer wordRangeMax;

    /** 建议用时（秒） */
    private Integer timeLimitSeconds;

    /** 来源，如 CET4 2024年6月 第1套；练习题为空 */
    private String source;

    /** 提纲提示，JSON 数组；真题无此项 */
    private String outlineHints;

    /** 常用表达，JSON 数组；真题无此项 */
    private String usefulExpressions;

    /** 排序权重，越小越前 */
    private Integer sortOrder;

    /** 状态：PUBLISHED 正常下发 / OFFLINE 下架（图表题缺图表时使用） */
    private String status;

    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;
}
