package com.english.ai.exercise.dto;

import lombok.Data;

/**
 * user-service 偏好响应的本地镜像，避免跨模块依赖
 */
@Data
public class PreferenceResult {

    private Long userId;

    private Integer vocabGroupSize;

    private Boolean configured;

    private Integer minGroupSize;

    private Integer maxGroupSize;
}
