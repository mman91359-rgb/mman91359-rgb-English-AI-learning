package com.english.ai.user.service;

import com.english.ai.user.dto.AwardCoinResponse;
import com.english.ai.user.entity.UserCoinAccount;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.containers.MySQLContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
import org.testcontainers.utility.DockerImageName;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * 金币服务集成测试（真实 MySQL）
 *
 * <p>覆盖高风险场景：幂等发币。幂等依赖 user_coin_transaction.biz_key 唯一键
 * （uk_biz_key），仅靠 Mockito 无法验证，必须连真实数据库。</p>
 *
 * <p>前置：本机需可运行 Docker（Docker Desktop / Docker Engine）。</p>
 *
 * <p>数据隔离：每个用例用随机 bizKey，且容器为每个测试类独立实例，
 * 不污染开发库。</p>
 */
@Testcontainers
@SpringBootTest
class CoinServiceIntegrationTest {

    @Container
    static final MySQLContainer<?> MYSQL = new MySQLContainer<>(
            DockerImageName.parse("mysql:8.0"))
            .withDatabaseName("user_db")
            .withUsername("root")
            .withPassword("test");

    @DynamicPropertySource
    static void datasourceProperties(DynamicPropertyRegistry registry) {
        registry.add("spring.datasource.url", MYSQL::getJdbcUrl);
        registry.add("spring.datasource.username", MYSQL::getUsername);
        registry.add("spring.datasource.password", MYSQL::getPassword);
    }

    @Autowired
    private CoinService coinService;

    private Long userId;
    private String bizKey;

    @BeforeEach
    void setUp() {
        userId = 100001L + (long) (Math.random() * 1000000);
        bizKey = "IT-" + System.nanoTime();
    }

    @Test
    void awardCreatesAccountAndGrantsCoin() {
        // 执行操作
        AwardCoinResponse first = coinService.award(userId, "TEST", bizKey, 50, "集成测试");

        // 断言结果
        assertThat(first.getAwarded()).isTrue();
        assertThat(first.getAmount()).isEqualTo(50);
        assertThat(first.getBalance()).isEqualTo(50);

        // 独立回查：账户确实建立且余额一致
        UserCoinAccount account = coinService.getAccount(userId);
        assertThat(account).isNotNull();
        assertThat(account.getBalance()).isEqualTo(50);
    }

    @Test
    void awardIsIdempotentOnDuplicateBizKey() {
        // 数据准备：首次发放
        coinService.award(userId, "TEST", bizKey, 30, "首次");

        // 执行操作：同 bizKey 重复发放
        AwardCoinResponse duplicate = coinService.award(userId, "TEST", bizKey, 30, "重复");

        // 断言：重复发放被幂等拦截，余额不翻倍
        assertThat(duplicate.getAwarded()).isFalse();
        assertThat(duplicate.getReason()).isEqualTo("DUPLICATE");

        UserCoinAccount account = coinService.getAccount(userId);
        assertThat(account.getBalance()).isEqualTo(30);
    }

    @Test
    void awardRejectsNonPositiveAmount() {
        AwardCoinResponse res = coinService.award(userId, "TEST", bizKey, 0, "零金额");
        assertThat(res.getAwarded()).isFalse();
        assertThat(res.getReason()).isEqualTo("INVALID_AMOUNT");
    }
}
