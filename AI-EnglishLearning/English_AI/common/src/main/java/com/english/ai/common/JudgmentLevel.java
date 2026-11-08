package com.english.ai.common;

/**
 * 判题命中层级常量。
 *
 * <p>历史遗留问题：层级编号曾以字面量散落在判题引擎与 {@code ExerciseServiceImpl} 中，
 * 出现 "0 与 1/2/3 并存" 的不自洽（0 由连词成句的本地比对返回）。
 * 此处统一定义语义，<b>取值保持不变</b>，前端 {@code L${matchedLevel}} 解析不受影响。</p>
 *
 * <p>如需调整编号，必须先定义对外契约并同步前端，禁止零散改动。</p>
 */
public final class JudgmentLevel {

    private JudgmentLevel() {
    }

    /** 模块 2（连词成句）在 Service 层做的本地句子比对，不进入判题引擎 */
    public static final int LOCAL_MATCH = 0;

    /** 正确答案 / accepted_answers 精确命中，或 L1 规则、选择题本地比对 */
    public static final int EXACT = 1;

    /** 错因路径拦截、相似度模糊匹配、语义可接受判对 */
    public static final int SEMANTIC = 2;

    /** AI 启发反馈兜底 */
    public static final int AI_FEEDBACK = 3;
}
