package com.english.ai.user.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.common.BusinessException;
import com.english.ai.user.dto.VerificationCodeSendResult;
import com.english.ai.user.entity.SmsVerificationCode;
import com.english.ai.user.enums.VerificationScene;
import com.english.ai.user.mapper.SmsVerificationCodeMapper;
import com.english.ai.user.service.impl.VerificationCodeServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.core.env.Environment;
import org.springframework.core.env.Profiles;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.Clock;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

/**
 * 统一验证码服务单元测试：签发、限频、过期、失败次数、单次消费、跨用户隔离。
 */
@ExtendWith(MockitoExtension.class)
class VerificationCodeServiceImplTest {

    private static final String RECIPIENT = "13800138000";
    private static final String SALT = "0123456789abcdef0123456789abcdef";
    private static final String CODE = "482913";

    private final Clock clock = Clock.fixed(
            Instant.parse("2026-11-15T04:00:00Z"), ZoneId.of("Asia/Shanghai"));

    @Mock
    private SmsVerificationCodeMapper codeMapper;

    @Mock
    private SmsSender smsSender;

    @Mock
    private Environment environment;

    private VerificationCodeServiceImpl service;

    private LocalDateTime now() {
        return LocalDateTime.now(clock);
    }

    @BeforeEach
    void setUp() {
        service = new VerificationCodeServiceImpl(codeMapper, smsSender, environment, clock);
    }

    /** 构造一条仍有效的待消费记录 */
    private SmsVerificationCode activeRecord(String storedCode, Long userId, int tryCount) {
        SmsVerificationCode record = new SmsVerificationCode();
        record.setId(7L);
        record.setRecipient(RECIPIENT);
        record.setScene(VerificationScene.PHONE_BIND.name());
        record.setUserId(userId);
        record.setSalt(SALT);
        record.setCodeHash(hash(SALT, RECIPIENT, VerificationScene.PHONE_BIND.name(), storedCode));
        record.setExpireAt(now().plusSeconds(300));
        record.setUsed(0);
        record.setTryCount(tryCount);
        record.setCreatedAt(now());
        return record;
    }

    private String hash(String salt, String recipient, String scene, String code) {
        String raw = salt + "|" + recipient + "|" + scene + "|" + code;
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(raw.getBytes(StandardCharsets.UTF_8));
            StringBuilder builder = new StringBuilder(digest.length * 2);
            for (byte value : digest) {
                builder.append(Character.forDigit((value >> 4) & 0xF, 16));
                builder.append(Character.forDigit(value & 0xF, 16));
            }
            return builder.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException(e);
        }
    }

    @Test
    void send_generatesSixDigitCodeAndPersistsHash() {
        when(codeMapper.selectOne(any())).thenReturn(null);
        when(codeMapper.selectCount(any())).thenReturn(0L);
        when(codeMapper.insert(any())).thenReturn(1);

        VerificationCodeSendResult result = service.send(RECIPIENT, VerificationScene.REGISTER, null);

        assertTrue(result.getMockCode().matches("\\d{6}"), "验证码应为 6 位数字");
        assertEquals(300, result.getExpiresInSeconds());
        ArgumentCaptor<SmsVerificationCode> captor = ArgumentCaptor.forClass(SmsVerificationCode.class);
        verify(codeMapper).insert(captor.capture());
        SmsVerificationCode saved = captor.getValue();
        assertEquals(RECIPIENT, saved.getRecipient());
        assertEquals(VerificationScene.REGISTER.name(), saved.getScene());
        assertEquals(32, saved.getSalt().length());
        assertFalse(saved.getCodeHash().contains(result.getMockCode()), "不得存储明文验证码");
        assertEquals(64, saved.getCodeHash().length());
        assertEquals(now().plusSeconds(300), saved.getExpireAt());
        assertEquals(0, saved.getUsed());
        verify(smsSender).send(RECIPIENT, result.getMockCode());
    }

    @Test
    void send_rejectsResendWithin60Seconds() {
        SmsVerificationCode recent = new SmsVerificationCode();
        recent.setCreatedAt(now().minusSeconds(10));
        when(codeMapper.selectOne(any())).thenReturn(recent);

        BusinessException ex = assertThrows(BusinessException.class,
                () -> service.send(RECIPIENT, VerificationScene.REGISTER, null));
        assertTrue(ex.getMessage().contains("过于频繁"));
        verify(codeMapper, never()).insert(any());
    }

    @Test
    void send_rejectsWhenDailyLimitReached() {
        when(codeMapper.selectOne(any())).thenReturn(null);
        when(codeMapper.selectCount(any())).thenReturn(10L);

        BusinessException ex = assertThrows(BusinessException.class,
                () -> service.send(RECIPIENT, VerificationScene.FORGOT_PASSWORD, null));
        assertTrue(ex.getMessage().contains("上限"));
        verify(codeMapper, never()).insert(any());
    }

    @Test
    void send_rejectsPhoneBindWithoutUserId() {
        BusinessException ex = assertThrows(BusinessException.class,
                () -> service.send(RECIPIENT, VerificationScene.PHONE_BIND, null));
        assertTrue(ex.getMessage().contains("登录后操作"));
        verify(codeMapper, never()).insert(any());
    }

    @Test
    void send_rejectsInProdProfile() {
        when(environment.acceptsProfiles(any(Profiles.class))).thenReturn(true);

        BusinessException ex = assertThrows(BusinessException.class,
                () -> service.send(RECIPIENT, VerificationScene.REGISTER, null));
        assertTrue(ex.getMessage().contains("仅本地开发可用"));
    }

    @Test
    void verify_consumesValidCode() {
        when(codeMapper.selectOne(any())).thenReturn(activeRecord(CODE, 1L, 0));
        when(codeMapper.consume(7L)).thenReturn(1);

        service.verifyAndConsume(RECIPIENT, VerificationScene.PHONE_BIND, CODE, 1L);

        verify(codeMapper).consume(7L);
        verify(codeMapper, never()).increaseTryCount(any());
    }

    @Test
    void verify_rejectsWrongCodeAndIncreasesTryCount() {
        when(codeMapper.selectOne(any())).thenReturn(activeRecord("000000", 1L, 0));

        BusinessException ex = assertThrows(BusinessException.class,
                () -> service.verifyAndConsume(RECIPIENT, VerificationScene.PHONE_BIND, CODE, 1L));
        assertTrue(ex.getMessage().contains("还可尝试 4 次"));
        verify(codeMapper).increaseTryCount(7L);
        verify(codeMapper, never()).consume(any());
    }

    @Test
    void verify_rejectsExpiredCodeAndInvalidates() {
        SmsVerificationCode expired = activeRecord(CODE, 1L, 0);
        expired.setExpireAt(now().minusSeconds(1));
        when(codeMapper.selectOne(any())).thenReturn(expired);

        BusinessException ex = assertThrows(BusinessException.class,
                () -> service.verifyAndConsume(RECIPIENT, VerificationScene.PHONE_BIND, CODE, 1L));
        assertTrue(ex.getMessage().contains("已过期"));
        verify(codeMapper).invalidateById(7L);
        verify(codeMapper, never()).consume(any());
    }

    @Test
    void verify_rejectsWhenNoActiveCode() {
        when(codeMapper.selectOne(any())).thenReturn(null);

        BusinessException ex = assertThrows(BusinessException.class,
                () -> service.verifyAndConsume(RECIPIENT, VerificationScene.PHONE_BIND, CODE, 1L));
        assertTrue(ex.getMessage().contains("请先获取验证码"));
    }

    @Test
    void verify_rejectsCrossUserCode() {
        when(codeMapper.selectOne(any())).thenReturn(activeRecord(CODE, 1L, 0));

        BusinessException ex = assertThrows(BusinessException.class,
                () -> service.verifyAndConsume(RECIPIENT, VerificationScene.PHONE_BIND, CODE, 2L));
        assertTrue(ex.getMessage().contains("不匹配"));
        verify(codeMapper, never()).consume(any());
    }

    @Test
    void verify_rejectsWhenConsumeLosesRace() {
        when(codeMapper.selectOne(any())).thenReturn(activeRecord(CODE, 1L, 0));
        when(codeMapper.consume(7L)).thenReturn(0);

        BusinessException ex = assertThrows(BusinessException.class,
                () -> service.verifyAndConsume(RECIPIENT, VerificationScene.PHONE_BIND, CODE, 1L));
        assertTrue(ex.getMessage().contains("已被使用"));
    }

    @Test
    void verify_rejectsInvalidFormatWithoutQuery() {
        BusinessException ex = assertThrows(BusinessException.class,
                () -> service.verifyAndConsume(RECIPIENT, VerificationScene.PHONE_BIND, "abc", 1L));
        assertTrue(ex.getMessage().contains("6 位数字"));
        verify(codeMapper, never()).selectOne(any(LambdaQueryWrapper.class));
    }

    @Test
    void verify_rejectsAfterTooManyFailures() {
        when(codeMapper.selectOne(any())).thenReturn(activeRecord(CODE, 1L, 5));

        BusinessException ex = assertThrows(BusinessException.class,
                () -> service.verifyAndConsume(RECIPIENT, VerificationScene.PHONE_BIND, CODE, 1L));
        assertTrue(ex.getMessage().contains("错误次数过多"));
        verify(codeMapper).invalidateById(7L);
        verify(codeMapper, never()).consume(any());
    }

    @Test
    void verify_rejectsInProdProfile() {
        when(environment.acceptsProfiles(any(Profiles.class))).thenReturn(true);

        BusinessException ex = assertThrows(BusinessException.class,
                () -> service.verifyAndConsume(RECIPIENT, VerificationScene.PHONE_BIND, CODE, 1L));
        assertTrue(ex.getMessage().contains("仅本地开发可用"));
        assertNotNull(ex);
    }
}
