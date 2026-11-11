package com.english.ai.ai.dto;

import lombok.Data;

@Data
public class ChatRequest {
    /** 用户消息 */
    private String message;
    /** 上下文类型：vocab(词汇), grammar(语法), general(通用) */
    private String contextType;
    /** 当前题目内容（可选） */
    private String questionContent;
    /** 用户答案（可选） */
    private String userAnswer;
    /**
     * 已有的评分摘要（可选）。
     * 用于「批改结果页发起追问」场景：让模型知道各维度实际得了多少分，
     * 否则用户问「为什么内容维度只有 2 分」时它无从回答。
     * 只传摘要文本，不传完整评分模型，避免 prompt 膨胀。
     */
    private String scoreSummary;
    /** 对话历史（可选） */
    private java.util.List<ChatMessage> history;
    /** 评分类型：speaking(口语), writing(作文)（可选） */
    private String scoreType;

    @Data
    public static class ChatMessage {
        private String role;
        private String content;
    }
}
