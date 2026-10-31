package com.english.ai.gateway;

import com.english.ai.common.EnvGuard;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ApiGatewayApplication {

    public static void main(String[] args) {
        EnvGuard.requireInProd("JWT_SECRET");
        SpringApplication.run(ApiGatewayApplication.class, args);
    }
}
