package com.english.ai.gateway.filter;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.mock.http.server.reactive.MockServerHttpRequest;
import org.springframework.mock.web.server.MockServerWebExchange;
import org.springframework.test.util.ReflectionTestUtils;
import reactor.core.publisher.Mono;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.concurrent.atomic.AtomicReference;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * 网关 JWT 鉴权过滤器单元测试
 *
 * <p>覆盖网关鉴权链路的四个核心分支：白名单放行、缺 Token 401、无效 Token 401、
 * 合法 Token 透传身份头。</p>
 *
 * <p>不启动完整 WebFlux 上下文，直接用 MockServerWebExchange 构造请求，
 * 通过反射注入 jwtSecret / gatewayToken，隔离环境依赖。</p>
 */
class JwtAuthFilterTest {

    private static final String SECRET = "EnglishAI-Unit-Test-JWT-Secret-Key-At-Least-32-Bytes";

    private JwtAuthFilter filter;

    @BeforeEach
    void setUp() {
        filter = new JwtAuthFilter();
        ReflectionTestUtils.setField(filter, "jwtSecret", SECRET);
        ReflectionTestUtils.setField(filter, "gatewayToken", "gw-token");
    }

    /** 记录是否放行到下游链 */
    private static class ChainRecorder implements GatewayFilterChain {
        final AtomicReference<ServerHttpRequest> passed = new AtomicReference<>();

        @Override
        public Mono<Void> filter(org.springframework.web.server.ServerWebExchange exchange) {
            passed.set(exchange.getRequest());
            return Mono.empty();
        }
    }

    /** 用测试密钥直接构造合法 JWT（与 filter 注入的 jwtSecret 一致） */
    private String token(Long userId, String username, String roles) {
        SecretKey key = Keys.hmacShaKeyFor(SECRET.getBytes(StandardCharsets.UTF_8));
        Date now = new Date();
        return Jwts.builder()
                .subject(String.valueOf(userId))
                .claim("username", username)
                .claim("roles", roles)
                .issuedAt(now)
                .expiration(new Date(now.getTime() + 60_000))
                .signWith(key)
                .compact();
    }

    @Test
    void whitelistPathPassesThrough() {
        MockServerWebExchange exchange = MockServerWebExchange.from(
                MockServerHttpRequest.get("/user/login").build());
        ChainRecorder chain = new ChainRecorder();

        filter.filter(exchange, chain).block();

        assertThat(chain.passed.get()).isNotNull();
    }

    @Test
    void missingTokenReturns401() {
        MockServerWebExchange exchange = MockServerWebExchange.from(
                MockServerHttpRequest.get("/exercise/questions").build());
        ChainRecorder chain = new ChainRecorder();

        filter.filter(exchange, chain).block();

        assertThat(chain.passed.get()).isNull();
        assertThat(exchange.getResponse().getStatusCode()).isEqualTo(HttpStatus.UNAUTHORIZED);
    }

    @Test
    void invalidTokenReturns401() {
        MockServerWebExchange exchange = MockServerWebExchange.from(
                MockServerHttpRequest.get("/exercise/questions")
                        .header(HttpHeaders.AUTHORIZATION, "Bearer invalid.token.here")
                        .build());
        ChainRecorder chain = new ChainRecorder();

        filter.filter(exchange, chain).block();

        assertThat(chain.passed.get()).isNull();
        assertThat(exchange.getResponse().getStatusCode()).isEqualTo(HttpStatus.UNAUTHORIZED);
    }

    @Test
    void validTokenForwardsIdentityHeaders() {
        String token = token(42L, "alice", "ROLE_USER");
        MockServerWebExchange exchange = MockServerWebExchange.from(
                MockServerHttpRequest.get("/exercise/questions")
                        // 客户端伪造身份头，验证会被网关剥离并覆盖
                        .header(HttpHeaders.AUTHORIZATION, "Bearer " + token)
                        .header("X-User-Id", "999")
                        .build());
        ChainRecorder chain = new ChainRecorder();

        filter.filter(exchange, chain).block();

        ServerHttpRequest forwarded = chain.passed.get();
        assertThat(forwarded).isNotNull();
        assertThat(forwarded.getHeaders().getFirst("X-User-Id")).isEqualTo("42");
        assertThat(forwarded.getHeaders().getFirst("X-Username")).isEqualTo("alice");
        assertThat(forwarded.getHeaders().getFirst("X-User-Role")).isEqualTo("ROLE_USER");
        assertThat(forwarded.getHeaders().getFirst("X-Gateway-Token")).isEqualTo("gw-token");
    }

    @Test
    void adminPathWithNonAdminRoleReturns403() {
        String token = token(42L, "alice", "ROLE_USER");
        MockServerWebExchange exchange = MockServerWebExchange.from(
                MockServerHttpRequest.get("/admin/users")
                        .header(HttpHeaders.AUTHORIZATION, "Bearer " + token)
                        .build());
        ChainRecorder chain = new ChainRecorder();

        filter.filter(exchange, chain).block();

        assertThat(chain.passed.get()).isNull();
        assertThat(exchange.getResponse().getStatusCode()).isEqualTo(HttpStatus.FORBIDDEN);
    }
}
