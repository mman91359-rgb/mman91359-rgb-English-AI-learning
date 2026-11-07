package com.english.ai.exercise.service;

import com.english.ai.exercise.dto.WritingSubmitRequest;
import com.english.ai.exercise.dto.WritingSubmitResponse;

import java.util.List;

/**
 * 写作模块服务。
 */
public interface WritingService {

    /**
     * 提交作文：先落库，后调 AI 评分，评分失败则保留原文并标记未评分。
     */
    WritingSubmitResponse submit(WritingSubmitRequest request);

    /**
     * 对未评分的作文重新评分。
     */
    WritingSubmitResponse rescore(Long userId, Long essayId);

    /**
     * 查询用户写作历史。
     */
    List<WritingSubmitResponse> listSubmissions(Long userId);

    /**
     * 查询单篇作文详情（含评分）。
     */
    WritingSubmitResponse getSubmission(Long userId, Long essayId);
}
