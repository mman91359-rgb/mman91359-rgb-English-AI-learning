package com.english.ai.common;

/**
 * 学习模块类型契约。
 *
 * <p>module_type 负责内容归类，question_type 负责作答形式，雷达维度负责能力统计。
 * 编号约定：1词汇、2语法、3翻译、4听力、5造句（保留，后续可作为翻译页子模式）、6写作、7阅读。
 * 该枚举是后端唯一事实来源，前端 {@code config/modules.ts} 必须与其保持一致。</p>
 */
public enum ModuleType {

    VOCABULARY(1, "词汇", "FILL_BLANK", RadarDimension.VOCABULARY),
    GRAMMAR(2, "语法", "SENTENCE_MAKING", RadarDimension.GRAMMAR),
    TRANSLATION(3, "翻译", "TRANSLATION", RadarDimension.READING),
    LISTENING(4, "听力", "CHOICE", RadarDimension.LISTENING),
    SENTENCE_MAKING(5, "造句", "SENTENCE_MAKING", RadarDimension.GRAMMAR),
    /**
     * 写作暂无独立雷达列，模块分不更新；未来新增 writing_score 时只需改此映射。
     */
    WRITING(6, "写作", "WRITING", null),
    /**
     * 阅读模块：题型不强制（仔细阅读/信息匹配用 CHOICE，选词填空用 FILL_BLANK），
     * defaultQuestionType 为 null 表示选题时不按题型过滤。
     */
    READING(7, "阅读", null, RadarDimension.READING);

    private final int code;
    private final String label;
    private final String defaultQuestionType;
    private final RadarDimension radarDimension;

    ModuleType(int code, String label, String defaultQuestionType, RadarDimension radarDimension) {
        this.code = code;
        this.label = label;
        this.defaultQuestionType = defaultQuestionType;
        this.radarDimension = radarDimension;
    }

    /**
     * 按编号查找模块；未知或 null 返回 null，调用方需自行处理兜底。
     */
    public static ModuleType of(Integer code) {
        if (code == null) {
            return null;
        }
        for (ModuleType type : values()) {
            if (type.code == code) {
                return type;
            }
        }
        return null;
    }

    /**
     * 选题时使用的默认题型。未知模块沿用历史行为兜底为 FILL_BLANK；
     * 阅读模块返回 null，表示"不按题型过滤"，由题目自身的 question_type 决定。
     */
    public static String defaultQuestionType(Integer code) {
        ModuleType type = of(code);
        return type == null ? "FILL_BLANK" : type.defaultQuestionType;
    }

    /**
     * 模块对应的雷达维度。未知模块和写作返回 null，表示不更新模块分。
     */
    public static RadarDimension radarDimensionOf(Integer code) {
        ModuleType type = of(code);
        return type == null ? null : type.radarDimension;
    }

    public int getCode() {
        return code;
    }

    public String getLabel() {
        return label;
    }

    public String getDefaultQuestionType() {
        return defaultQuestionType;
    }

    public RadarDimension getRadarDimension() {
        return radarDimension;
    }
}
