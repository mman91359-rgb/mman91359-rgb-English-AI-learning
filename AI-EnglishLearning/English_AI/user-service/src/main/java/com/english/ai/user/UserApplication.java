package com.english.ai.user;

import com.english.ai.common.EnvGuard;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 用户服务 — Spring Boot 启动类
 */
@SpringBootApplication(scanBasePackages = "com.english.ai")
@MapperScan("com.english.ai.user.mapper")
public class UserApplication {

    public static void main(String[] args) {
        EnvGuard.requireInProd("JWT_SECRET", "MYSQL_PASSWORD", "INTERNAL_TOKEN");
        SpringApplication.run(UserApplication.class, args);
        System.out.println("========================================");
        System.out.println("  User Service 启动成功!");
        System.out.println("  端口: 8081");
        System.out.println("  测试: curl http://localhost:8081/user/login");
        System.out.println("========================================");
    }
}
