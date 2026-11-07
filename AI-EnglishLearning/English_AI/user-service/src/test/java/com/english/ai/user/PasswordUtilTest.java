package com.english.ai.user;

import com.english.ai.common.PasswordUtil;
import org.junit.jupiter.api.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * PasswordUtil 强度与重编码判断测试。
 */
class PasswordUtilTest {

    @Test
    void encodeUsesConfiguredStrength() {
        String hash = PasswordUtil.encode("123456");
        assertEquals(PasswordUtil.STRENGTH, PasswordUtil.rounds(hash),
                "新密码必须使用 PasswordUtil.STRENGTH 指定的工作因子");
        assertTrue(PasswordUtil.matches("123456", hash));
        assertFalse(PasswordUtil.matches("654321", hash));
    }

    @Test
    void needsRehashForLegacyHigherCostHash() {
        // 模拟存量 $2b$12$ 哈希
        String legacy = new BCryptPasswordEncoder(12).encode("123456");
        assertEquals(12, PasswordUtil.rounds(legacy));
        assertTrue(PasswordUtil.needsRehash(legacy), "存量 cost=12 应被判定需要重编码");

        // 重编码后不再需要
        String rehashed = PasswordUtil.encode("123456");
        assertFalse(PasswordUtil.needsRehash(rehashed));
    }

    @Test
    void needsRehashToleratesInvalidInput() {
        assertEquals(-1, PasswordUtil.rounds(null));
        assertEquals(-1, PasswordUtil.rounds(""));
        assertEquals(-1, PasswordUtil.rounds("not-a-bcrypt-hash"));
        assertFalse(PasswordUtil.needsRehash(null));
        assertFalse(PasswordUtil.needsRehash("not-a-bcrypt-hash"));
    }
}
