package com.english.ai.exercise.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.Clock;
import java.time.ZoneId;

/**
 * 统一时区时钟，学习会话日期按北京时间计算
 */
@Configuration
public class TimeConfig {

    public static final ZoneId ZONE_ID = ZoneId.of("Asia/Shanghai");

    @Bean
    public Clock clock() {
        return Clock.system(ZONE_ID);
    }
}
