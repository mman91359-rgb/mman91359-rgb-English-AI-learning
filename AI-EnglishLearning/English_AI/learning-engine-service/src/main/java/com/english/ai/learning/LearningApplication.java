package com.english.ai.learning;

import com.english.ai.common.EnvGuard;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "com.english.ai")
@MapperScan("com.english.ai.learning.mapper")
public class LearningApplication {

    public static void main(String[] args) {
        EnvGuard.requireInProd("MYSQL_PASSWORD");
        SpringApplication.run(LearningApplication.class, args);
        System.out.println("========================================");
        System.out.println("  Learning Engine Service 启动成功!");
        System.out.println("  端口: 8083");
        System.out.println("========================================");
    }
}
