package com.english.ai.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.common.BusinessException;
import com.english.ai.common.ErrorCode;
import com.english.ai.user.dto.VerificationCodeSendResult;
import com.english.ai.user.entity.SmsVerificationCode;
import com.english.ai.user.enums.VerificationScene;
import com.english.ai.user.mapper.SmsVerificationCodeMapper;
import com.english.ai.user.service.SmsSender;
import com.english.ai.user.service.VerificationCodeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.env.Environment;
import org.springframework.core.env.Profiles;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.time.Clock;
import java.time.Duration;
import java.time.LocalDateTime;

/**
 * 统一验证码服务实现。
 *
 * <p>策略：6 位随机数字码；5 分钟有效；同一接收地址+场景 60 秒发送间隔、每日 10 条上限；
 * 单条最多校验失败 5 次；成功即原子消费，不可重复使用。验证码只存带独立随机盐的
 * SHA-256 摘要，下发通道为本地模拟，prod profile 直接拒绝。</p>
 *
 * <p>校验使用 REQUIRES_NEW 独立事务：失败次数与消费状态不会被后续业务异常回滚，
 * 避免业务失败后同一验证码被反复重试。</p>
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class VerificationCodeServiceImpl implements VerificationCodeService {

    /** 验证码位数 */
    private static final int CODE_LENGTH = 6;
    /** 有效期（秒） */
    private static final int EXPIRE_SECONDS = 300;
    /** 同一接收地址+场景的最小发送间隔（秒） */
    private static final int RESEND_INTERVAL_SECONDS = 60;
    /** 同一接收地址+场景每日发送上限 */
    private static final int DAILY_LIMIT = 10;
    /** 单条验证码最大校验失败次数 */
    private static final int MAX_TRY_COUNT = 5;
    /** 历史记录保留天数（惰性清理） */
    private static final int HISTORY_KEEP_DAYS = 7;

    private static final SecureRandom RANDOM = new SecureRandom();

    private final SmsVerificationCodeMapper codeMapper;
    private final SmsSender smsSender;
    private final Environment environment;
    private final Clock clock;

    @Override
    @Transactional
    public VerificationCodeSendResult send(String recipient, VerificationScene scene, Long userId) {
        rejectProd();
        String target = normalize(recipient);
        if (target.isEmpty()) {
            throw badRequest("接收地址不能为空");
        }
        if (scene == null) {
            throw badRequest("验证码场景不正确");
        }
        if (!scene.isAnonymous() && userId == null) {
            throw badRequest("该场景需要登录后操作");
        }

        LocalDateTime now = LocalDateTime.now(clock);

        // 限频：同一接收地址+场景 60 秒内只允许签发一次
        SmsVerificationCode recent = codeMapper.selectOne(new LambdaQueryWrapper<SmsVerificationCode>()
                .eq(SmsVerificationCode::getRecipient, target)
                .eq(SmsVerificationCode::getScene, scene.name())
                .ge(SmsVerificationCode::getCreatedAt, now.minusSeconds(RESEND_INTERVAL_SECONDS))
                .orderByDesc(SmsVerificationCode::getCreatedAt)
                .last("LIMIT 1"));
        if (recent != null) {
            long waited = Math.max(0, Duration.between(recent.getCreatedAt(), now).getSeconds());
            long wait = Math.max(1, RESEND_INTERVAL_SECONDS - waited);
            throw badRequest("验证码发送过于频繁，请 " + wait + " 秒后重试");
        }

        // 每日上限：按自然日零点起算
        Long todayCount = codeMapper.selectCount(new LambdaQueryWrapper<SmsVerificationCode>()
                .eq(SmsVerificationCode::getRecipient, target)
                .eq(SmsVerificationCode::getScene, scene.name())
                .ge(SmsVerificationCode::getCreatedAt, now.toLocalDate().atStartOfDay()));
        if (todayCount != null && todayCount >= DAILY_LIMIT) {
            throw badRequest("今日验证码发送次数已达上限，请明天再试");
        }

        // 新码签发前作废旧码；同时只清理保留期外的历史记录
        codeMapper.invalidateUnused(target, scene.name());
        codeMapper.deleteHistoryBefore(now.minusDays(HISTORY_KEEP_DAYS));

        String code = randomCode();
        String salt = randomSalt();
        SmsVerificationCode record = new SmsVerificationCode();
        record.setRecipient(target);
        record.setScene(scene.name());
        record.setUserId(userId);
        record.setSalt(salt);
        record.setCodeHash(hash(salt, target, scene.name(), code));
        record.setExpireAt(now.plusSeconds(EXPIRE_SECONDS));
        record.setUsed(0);
        record.setTryCount(0);
        record.setCreatedAt(now);
        codeMapper.insert(record);

        smsSender.send(target, code);
        log.info("验证码已签发: recipient={}, scene={}, userId={}, expiresIn={}s",
                target, scene.name(), userId, EXPIRE_SECONDS);
        return new VerificationCodeSendResult(EXPIRE_SECONDS, code);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void verifyAndConsume(String recipient, VerificationScene scene, String code, Long userId) {
        rejectProd();
        String target = normalize(recipient);
        if (scene == null) {
            throw badRequest("验证码场景不正确");
        }
        if (code == null || !code.trim().matches("\\d{" + CODE_LENGTH + "}")) {
            throw badRequest("验证码为 " + CODE_LENGTH + " 位数字");
        }
        LocalDateTime now = LocalDateTime.now(clock);

        SmsVerificationCode record = codeMapper.selectOne(new LambdaQueryWrapper<SmsVerificationCode>()
                .eq(SmsVerificationCode::getRecipient, target)
                .eq(SmsVerificationCode::getScene, scene.name())
                .eq(SmsVerificationCode::getUsed, 0)
                .orderByDesc(SmsVerificationCode::getId)
                .last("LIMIT 1"));
        if (record == null) {
            throw badRequest("请先获取验证码");
        }
        if (record.getExpireAt() == null || !record.getExpireAt().isAfter(now)) {
            codeMapper.invalidateById(record.getId());
            throw badRequest("验证码已过期，请重新获取");
        }
        // 换绑场景的码与签发用户绑定，禁止跨账号使用
        if (record.getUserId() != null && !record.getUserId().equals(userId)) {
            throw badRequest("验证码与当前账号不匹配，请重新获取");
        }
        int tried = record.getTryCount() == null ? 0 : record.getTryCount();
        if (tried >= MAX_TRY_COUNT) {
            codeMapper.invalidateById(record.getId());
            throw badRequest("验证码错误次数过多，请重新获取");
        }

        String expected = hash(record.getSalt(), target, scene.name(), code.trim());
        byte[] actual = expected.getBytes(StandardCharsets.UTF_8);
        byte[] stored = record.getCodeHash() == null
                ? new byte[0]
                : record.getCodeHash().getBytes(StandardCharsets.UTF_8);
        if (!MessageDigest.isEqual(actual, stored)) {
            codeMapper.increaseTryCount(record.getId());
            int left = MAX_TRY_COUNT - tried - 1;
            throw badRequest(left > 0
                    ? "验证码错误，还可尝试 " + left + " 次"
                    : "验证码错误次数过多，请重新获取");
        }
        // 条件更新：并发下只有一个请求能消费成功
        if (codeMapper.consume(record.getId()) == 0) {
            throw badRequest("验证码已被使用，请重新获取");
        }
    }

    private void rejectProd() {
        if (environment.acceptsProfiles(Profiles.of("prod"))) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "模拟验证码仅本地开发可用");
        }
    }

    private BusinessException badRequest(String message) {
        return new BusinessException(ErrorCode.BAD_REQUEST, message);
    }

    private String normalize(String value) {
        return value == null ? "" : value.trim();
    }

    private String randomCode() {
        StringBuilder builder = new StringBuilder(CODE_LENGTH);
        for (int i = 0; i < CODE_LENGTH; i++) {
            builder.append(RANDOM.nextInt(10));
        }
        return builder.toString();
    }

    private String randomSalt() {
        byte[] bytes = new byte[16];
        RANDOM.nextBytes(bytes);
        return toHex(bytes);
    }

    /** 摘要输入绑定盐、接收地址与场景，同一验证码不能跨场景/跨地址复用 */
    private String hash(String salt, String recipient, String scene, String code) {
        String raw = salt + "|" + recipient + "|" + scene + "|" + code;
        try {
            return toHex(MessageDigest.getInstance("SHA-256").digest(raw.getBytes(StandardCharsets.UTF_8)));
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException("SHA-256 摘要算法不可用", e);
        }
    }

    private String toHex(byte[] bytes) {
        StringBuilder builder = new StringBuilder(bytes.length * 2);
        for (byte value : bytes) {
            builder.append(Character.forDigit((value >> 4) & 0xF, 16));
            builder.append(Character.forDigit(value & 0xF, 16));
        }
        return builder.toString();
    }
}
