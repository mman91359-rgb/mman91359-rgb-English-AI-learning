package com.english.ai.user;

import com.english.ai.common.UserIdentityUtil;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * 网关透传身份与请求 userId 的一致性校验。
 */
class UserIdentityUtilTest {

    @Test
    void missingHeaderIsAllowedForLocalDirectCall() {
        assertFalse(UserIdentityUtil.isForbidden(null, 1L));
    }

    @Test
    void sameUserIsAllowed() {
        assertFalse(UserIdentityUtil.isForbidden(1L, 1L));
    }

    @Test
    void differentUserIsForbidden() {
        assertTrue(UserIdentityUtil.isForbidden(1L, 2L));
    }

    @Test
    void missingRequestUserIdIsNotTreatedAsForbidden() {
        assertFalse(UserIdentityUtil.isForbidden(1L, null));
    }
}
