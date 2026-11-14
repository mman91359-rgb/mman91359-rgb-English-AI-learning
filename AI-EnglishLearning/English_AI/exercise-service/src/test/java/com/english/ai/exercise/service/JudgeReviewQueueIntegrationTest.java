package com.english.ai.exercise.service;

import com.english.ai.exercise.dto.JudgeReviewEnqueueRequest;
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
 * 判题审核队列集成测试（真实 MySQL）
 *
 * <p>覆盖高风险场景：幂等入队。幂等依赖 judge_review_queue 的唯一键
 * uk_review_log(log_id)，同一答题记录重复入队应被忽略。仅靠 Mockito 无法验证
 * 数据库唯一约束，必须连真实 MySQL。</p>
 *
 * <p>前置：本机需可运行 Docker。</p>
 */
@Testcontainers
@SpringBootTest
class JudgeReviewQueueIntegrationTest {

    @Container
    static final MySQLContainer<?> MYSQL = new MySQLContainer<>(
            DockerImageName.parse("mysql:8.0"))
            .withDatabaseName("exercise_db")
            .withUsername("root")
            .withPassword("test");

    @DynamicPropertySource
    static void datasourceProperties(DynamicPropertyRegistry registry) {
        registry.add("spring.datasource.url", MYSQL::getJdbcUrl);
        registry.add("spring.datasource.username", MYSQL::getUsername);
        registry.add("spring.datasource.password", MYSQL::getPassword);
    }

    @Autowired
    private JudgeReviewQueueService judgeReviewQueueService;

    private JudgeReviewEnqueueRequest buildRequest(Long userId, Long questionId, Long logId) {
        JudgeReviewEnqueueRequest req = new JudgeReviewEnqueueRequest();
        req.setUserId(userId);
        req.setQuestionId(questionId);
        req.setLogId(logId);
        req.setModuleType(1);
        req.setDifficultyLevel(2);
        req.setUserAnswer("A");
        req.setCorrectAnswer("B");
        req.setReason("MANUAL");
        return req;
    }

    @Test
    void enqueueIsIdempotentOnSameLogId() {
        Long userId = 300001L + (long) (Math.random() * 1000000);
        Long questionId = 100L;
        Long logId = System.nanoTime(); // 唯一答题记录 ID

        // 首次入队：成功
        boolean first = judgeReviewQueueService.enqueue(buildRequest(userId, questionId, logId));
        assertThat(first).isTrue();

        // 同 logId 重复入队：被幂等拦截
        boolean duplicate = judgeReviewQueueService.enqueue(buildRequest(userId, questionId, logId));
        assertThat(duplicate).isFalse();
    }

    @Test
    void enqueueWithoutLogIdAllowsMultipleEntries() {
        Long userId = 300002L + (long) (Math.random() * 1000000);
        Long questionId = 101L;

        // 无 logId 的手工入队不参与去重（唯一键允许 NULL 重复）
        boolean first = judgeReviewQueueService.enqueue(buildRequest(userId, questionId, null));
        boolean second = judgeReviewQueueService.enqueue(buildRequest(userId, questionId, null));
        assertThat(first).isTrue();
        assertThat(second).isTrue();
    }
}
