package com.english.ai.user.config;

import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

import java.time.Duration;

/**
 * 服务间调用 HTTP 客户端配置。
 * 看板聚合对 exercise-service 设置较短超时，失败即降级。
 */
@Configuration
public class RestTemplateConfig {

    @Bean
    public RestTemplate exerciseRestTemplate(RestTemplateBuilder builder) {
        return builder
                .setConnectTimeout(Duration.ofSeconds(1))
                .setReadTimeout(Duration.ofSeconds(2))
                .build();
    }
}
