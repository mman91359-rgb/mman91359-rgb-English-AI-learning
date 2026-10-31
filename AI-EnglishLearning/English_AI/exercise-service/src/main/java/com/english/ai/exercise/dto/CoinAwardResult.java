package com.english.ai.exercise.dto;

import lombok.Data;

/**
 * user-service 发币响应的本地镜像，避免跨模块依赖
 */
@Data
public class CoinAwardResult {

    private Boolean awarded;

    private Integer amount;

    private Integer balance;

    private String reason;
}
