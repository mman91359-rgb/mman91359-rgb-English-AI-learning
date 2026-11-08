package com.english.ai.exercise.service;

import com.english.ai.exercise.dto.JudgmentResult;
import com.english.ai.exercise.dto.SubmitRequest;

/**
 * 分层路由判题引擎接口。
 *
 * <p>执行顺序（前置层级命中即短路返回，不再进入后续计算）：</p>
 * <ol>
 *   <li>accepted_answers 精确匹配（含正确答案本身；用户答案先经 {@code AnswerNormalizer} 归一化）</li>
 *   <li>question_buggy_path 常见错误路径拦截（教研沉淀）</li>
 *   <li>L1 规则算法：拼写（莱文斯坦）、语法硬规则（冠词/介词/时态）</li>
 *   <li>L2 相似度模糊匹配（与正确答案相似但不等同）</li>
 *   <li>L2.5 AI 语义判对：仅当 accepted_answers 为空时才执行</li>
 *   <li>L3 AI 启发反馈：仅当 accepted_answers 为空时才执行</li>
 * </ol>
 *
 * <p><b>AI 调用控制</b>：题目 accepted_answers 非空时，判题口径已由教研确定，
 * 缓存未命中直接返回 {@code MISMATCH}，不调用任何 AI 接口；
 * accepted_answers 为空时保留原有 AI 语义判对 + AI 启发反馈路径。</p>
 */
public interface JudgmentEngine {

    /**
     * 执行三级分层路由判题
     * @param request 提交请求
     * @param correctAnswer 正确答案
     * @param context 题干上下文
     * @return 判题结果
     */
    JudgmentResult judge(SubmitRequest request, String correctAnswer, String context);

    /**
     * 翻译题专属判题（moduleType=3）：
     * <p>L1 归一化精确比对（参考译文 + accepted_answers 可接受变体）；
     * 短句翻译未命中时调 AI /ai/judge-acceptable 语义判对兜底；
     * 段落翻译（passage，题干较长）仅做本地归一化比对，不走 AI 兜底。</p>
     *
     * @param request      提交请求
     * @param correctAnswer 参考译文
     * @param context       中文题干
     * @param acceptedAnswersJson question_info.accepted_answers（JSON 数组，可空）
     * @param isPassage     是否段落翻译（true 则不做 AI 兜底）
     * @return 判题结果
     */
    JudgmentResult judgeTranslation(SubmitRequest request, String correctAnswer,
                                    String context, String acceptedAnswersJson, boolean isPassage);
}