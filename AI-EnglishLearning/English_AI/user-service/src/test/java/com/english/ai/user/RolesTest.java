package com.english.ai.user;

import com.english.ai.common.Roles;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

class RolesTest {

    @Test
    void hasRoleSupportsCommaSeparatedAndWhitespace() {
        assertTrue(Roles.hasRole("ROLE_USER, ROLE_ADMIN", Roles.ADMIN));
        assertTrue(Roles.hasRole(" ROLE_ADMIN ", Roles.ADMIN));
        assertFalse(Roles.hasRole("ROLE_USER", Roles.ADMIN));
        assertFalse(Roles.hasRole(null, Roles.ADMIN));
        assertFalse(Roles.hasRole("", Roles.ADMIN));
    }

    @Test
    void isAdminUsesSameRules() {
        assertTrue(Roles.isAdmin("ROLE_ADMIN"));
        assertTrue(Roles.isAdmin("ROLE_USER,ROLE_ADMIN"));
        assertFalse(Roles.isAdmin("ROLE_USER"));
    }
}
