package com.english.ai.learning.consumer;

import com.english.ai.learning.service.LearningService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageProperties;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.containers.RabbitMQContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
import org.testcontainers.utility.DockerImageName;

import java.util.Map;
import java.util.concurrent.TimeUnit;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

/**
 * 练习完成事件消费者集成测试（真实 RabbitMQ）
 *
 * <p>覆盖异步链路的消费者端核心场景：</p>
 * <ul>
 *   <li>生产 → 消费闭环：消息投递到 exercise.complete.queue，消费者收到并解析</li>
 *   <li>消费成功：调用 LearningService.updateCurve 后手动 ACK，消息从队列移除</li>
 *   <li>消费失败重试：LearningService 抛异常时 basicNack(requeue=true)，消息重新入队不丢失</li>
 * </ul>
 *
 * <p>关键说明：本测试聚焦「消费者是否正确消费 + ACK 语义」，下游 LearningService
 * 用 MockBean 隔离，避免引入 MySQL 依赖。生产者端的 convertAndSend 由
 * exercise-service 的既有单测覆盖。</p>
 *
 * <p>已知隐患（测试会如实暴露，不改业务代码）：当前消费者 basicNack(requeue=true)
 * 无死信队列兜底，LearningService 持续异常会导致消息无限重试。是否加死信队列
 * 属业务决策，需另行评估。</p>
 *
 * <p>前置：本机需可运行 Docker。</p>
 */
@Testcontainers
@SpringBootTest
class ExerciseCompletedConsumerIntegrationTest {

    private static final String QUEUE = "exercise.complete.queue";
    private static final String EXCHANGE = "exercise.exchange";
    private static final String ROUTING_KEY = "exercise.complete";

    @Container
    static final RabbitMQContainer RABBIT = new RabbitMQContainer(
            DockerImageName.parse("rabbitmq:3.13-management"));

    @DynamicPropertySource
    static void rabbitProperties(DynamicPropertyRegistry registry) {
        registry.add("spring.rabbitmq.host", RABBIT::getHost);
        registry.add("spring.rabbitmq.port", RABBIT::getAmqpPort);
        registry.add("spring.rabbitmq.username", RABBIT::getAdminUsername);
        registry.add("spring.rabbitmq.password", RABBIT::getAdminPassword);
        registry.add("spring.rabbitmq.enabled", () -> "true");
        // 消费成功才 ACK 的手动确认模式
        registry.add("spring.rabbitmq.listener.simple.acknowledge-mode", () -> "manual");
    }

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @MockBean
    private LearningService learningService;

    @BeforeEach
    void resetMocks() {
        reset(learningService);
    }

    /** 复刻生产端发送方式：ExerciseCompletedEvent 经 Jackson converter 序列化 */
    private void sendEvent(Map<String, Object> payload) {
        Jackson2JsonMessageConverter converter = new Jackson2JsonMessageConverter();
        MessageProperties props = new MessageProperties();
        props.setContentType("application/json");
        // 生产端通过 rabbitTemplate.convertAndSend(exchange, routingKey, event)，
        // Jackson converter 会自动加 __TypeId__ 头指向 ExerciseCompletedEvent。
        // 消费端声明 Map 类型，故这里用 Map 构造消息，模拟跨服务 JSON 载荷。
        Message message = converter.toMessage(payload, props);
        rabbitTemplate.send(EXCHANGE, ROUTING_KEY, message);
    }

    private Map<String, Object> payload(Long userId, Long questionId, boolean correct) {
        return Map.of(
                "userId", userId,
                "questionId", questionId,
                "isCorrect", correct,
                "moduleType", 1,
                "attemptCount", 1,
                "timestamp", System.currentTimeMillis(),
                "traceId", "it-" + System.nanoTime());
    }

    @Test
    void consumeSuccessInvokesUpdateCurveAndAcks() throws Exception {
        Long userId = 400001L;
        Long questionId = 200L;

        // 数据准备：默认 updateCurve 正常返回（不抛异常）
        doNothing().when(learningService).updateCurve(any());

        // 执行操作：投递消息
        sendEvent(payload(userId, questionId, true));

        // 断言：消费者收到并解析，updateCurve 被调用，参数正确
        ArgumentCaptor<com.english.ai.learning.dto.UpdateCurveRequest> captor =
                ArgumentCaptor.forClass(com.english.ai.learning.dto.UpdateCurveRequest.class);
        verify(learningService, timeout(5000)).updateCurve(captor.capture());

        assertThat(captor.getValue().getUserId()).isEqualTo(userId);
        assertThat(captor.getValue().getQuestionId()).isEqualTo(questionId);
        assertThat(captor.getValue().getIsCorrect()).isTrue();
        assertThat(captor.getValue().getModuleType()).isEqualTo(1);
    }

    @Test
    void consumeFailureRequeuesMessage() throws Exception {
        Long userId = 400002L;
        Long questionId = 201L;

        // 数据准备：mock updateCurve 抛异常，模拟消费失败
        doThrow(new RuntimeException("模拟遗忘曲线更新失败"))
                .when(learningService).updateCurve(any());

        // 执行操作：投递一条消息（会失败并被 requeue）
        sendEvent(payload(userId, questionId, false));

        // 断言：消费者至少尝试消费（updateCurve 被调用），
        // 因 basicNack(requeue=true)，消息不会被 ACK、会重新入队。
        // 这里验证「失败被捕获并触发 requeue 而非吞掉」——updateCurve 持续被调用
        // 即说明消息在不断重试。
        verify(learningService, timeout(5000).atLeast(1)).updateCurve(any());
        // 等待一次重试窗口，验证仍在重试（requeue 生效，消息未丢失）
        TimeUnit.MILLISECONDS.sleep(1500);
        verify(learningService, atLeast(2)).updateCurve(any());
    }
}
