package com.english.ai.learning.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.learning.dto.UpdateCurveRequest;
import com.english.ai.learning.entity.UserMemoryCurve;
import com.english.ai.learning.mapper.UserMemoryCurveMapper;
import org.junit.jupiter.api.Tag;
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
 * 遗忘曲线状态机集成测试（真实 MySQL）
 *
 * <p>覆盖核心算法「艾宾浩斯遗忘曲线」的状态流转（此为核心逻辑，测试只验证行为、
 * 不改动实现）：</p>
 * <ul>
 *   <li>首次作答 → 新增记录，mastery=1，nextReview=T+1</li>
 *   <li>答对 → mastery+1（上限 5）</li>
 *   <li>答错 → mastery-1（下限 1）</li>
 * </ul>
 *
 * <p>前置：本机需可运行 Docker。</p>
 */
@Testcontainers
@SpringBootTest
class LearningServiceIntegrationTest {

    @Container
    static final MySQLContainer<?> MYSQL = new MySQLContainer<>(
            DockerImageName.parse("mysql:8.0"))
            .withDatabaseName("learning_db")
            .withUsername("root")
            .withPassword("test");

    @DynamicPropertySource
    static void datasourceProperties(DynamicPropertyRegistry registry) {
        registry.add("spring.datasource.url", MYSQL::getJdbcUrl);
        registry.add("spring.datasource.username", MYSQL::getUsername);
        registry.add("spring.datasource.password", MYSQL::getPassword);
    }

    @Autowired
    private LearningService learningService;

    @Autowired
    private UserMemoryCurveMapper curveMapper;

    private Long newUserId() {
        return 200001L + (long) (Math.random() * 1000000);
    }

    private UserMemoryCurve findCurve(Long userId, Long questionId) {
        return curveMapper.selectOne(new LambdaQueryWrapper<UserMemoryCurve>()
                .eq(UserMemoryCurve::getUserId, userId)
                .eq(UserMemoryCurve::getQuestionId, questionId));
    }

    private UpdateCurveRequest req(Long userId, Long qid, boolean correct) {
        UpdateCurveRequest r = new UpdateCurveRequest();
        r.setUserId(userId);
        r.setQuestionId(qid);
        r.setIsCorrect(correct);
        r.setModuleType(1);
        return r;
    }

    @Test
    void firstAttemptCreatesCurveAtMasteryOne() {
        Long userId = newUserId();
        Long qid = 1L;

        // 执行操作：首次作答
        learningService.updateCurve(req(userId, qid, true));

        // 独立回查落库结果
        UserMemoryCurve curve = findCurve(userId, qid);
        assertThat(curve).isNotNull();
        assertThat(curve.getMasteryLevel()).isEqualTo(1);
        assertThat(curve.getReviewCount()).isZero();
        assertThat(curve.getNextReviewTime()).isNotNull();
    }

    @Test
    void correctAnswerUpgradesMastery() {
        Long userId = newUserId();
        Long qid = 2L;
        // 数据准备：先建立 baseline（mastery=1）
        learningService.updateCurve(req(userId, qid, true));
        // 执行操作：答对 → 升级到 2
        learningService.updateCurve(req(userId, qid, true));

        UserMemoryCurve curve = findCurve(userId, qid);
        assertThat(curve.getMasteryLevel()).isEqualTo(2);
        assertThat(curve.getReviewCount()).isEqualTo(1);
    }

    @Test
    void wrongAnswerDowngradesButFloorAtOne() {
        Long userId = newUserId();
        Long qid = 3L;
        // 建立 baseline：mastery=1
        learningService.updateCurve(req(userId, qid, true));
        // 答对升级到 2
        learningService.updateCurve(req(userId, qid, true));

        // 执行操作：连续答错，降级到下限 1
        learningService.updateCurve(req(userId, qid, false));
        learningService.updateCurve(req(userId, qid, false));

        UserMemoryCurve curve = findCurve(userId, qid);
        assertThat(curve.getMasteryLevel()).isEqualTo(1);
        assertThat(curve.getReviewCount()).isEqualTo(3);
    }

    @Test
    void repeatedCorrectAnswersCapAtMasteryFive() {
        Long userId = newUserId();
        Long qid = 4L;
        // 建立 baseline
        learningService.updateCurve(req(userId, qid, true));
        // 连续答对 6 次，验证上限 5
        for (int i = 0; i < 6; i++) {
            learningService.updateCurve(req(userId, qid, true));
        }

        UserMemoryCurve curve = findCurve(userId, qid);
        assertThat(curve.getMasteryLevel()).isEqualTo(5);
    }
}
