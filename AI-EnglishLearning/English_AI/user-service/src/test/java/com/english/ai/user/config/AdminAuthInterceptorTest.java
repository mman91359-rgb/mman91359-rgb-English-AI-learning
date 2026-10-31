package com.english.ai.user.config;

import com.english.ai.common.Roles;
import com.english.ai.user.entity.SysUser;
import com.english.ai.user.mapper.UserMapper;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.util.ReflectionTestUtils;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class AdminAuthInterceptorTest {

    @Mock
    private UserMapper userMapper;

    private AdminAuthInterceptor interceptor;
    private MockHttpServletRequest request;
    private MockHttpServletResponse response;

    @BeforeEach
    void setUp() {
        interceptor = new AdminAuthInterceptor(userMapper, new ObjectMapper());
        ReflectionTestUtils.setField(interceptor, "gatewayToken", "gateway-secret");
        request = new MockHttpServletRequest();
        response = new MockHttpServletResponse();
        AdminContext.clear();
    }

    @AfterEach
    void tearDown() {
        AdminContext.clear();
    }

    @Test
    void missingGatewayTokenIsRejected() throws Exception {
        request.addHeader("X-User-Id", "1");
        request.addHeader("X-User-Role", Roles.ADMIN);

        assertFalse(interceptor.preHandle(request, response, null));
        assertEquals(403, response.getStatus());
    }

    @Test
    void nonAdminRoleIsRejected() throws Exception {
        request.addHeader("X-Gateway-Token", "gateway-secret");
        request.addHeader("X-User-Id", "1");
        request.addHeader("X-User-Role", Roles.USER);

        assertFalse(interceptor.preHandle(request, response, null));
        assertEquals(403, response.getStatus());
    }

    @Test
    void demotedAdminInDatabaseIsRejected() throws Exception {
        request.addHeader("X-Gateway-Token", "gateway-secret");
        request.addHeader("X-User-Id", "1");
        request.addHeader("X-User-Role", Roles.ADMIN);
        SysUser user = new SysUser();
        user.setId(1L);
        user.setUsername("admin");
        user.setStatus(1);
        user.setRoles(Roles.USER);
        when(userMapper.selectById(1L)).thenReturn(user);

        assertFalse(interceptor.preHandle(request, response, null));
        assertEquals(403, response.getStatus());
    }

    @Test
    void activeAdminPassesAndContextIsCleared() throws Exception {
        request.addHeader("X-Gateway-Token", "gateway-secret");
        request.addHeader("X-User-Id", "1");
        request.addHeader("X-User-Role", Roles.ADMIN);
        request.addHeader("X-Real-IP", "127.0.0.1");
        SysUser user = new SysUser();
        user.setId(1L);
        user.setUsername("admin");
        user.setStatus(1);
        user.setRoles(Roles.ADMIN);
        when(userMapper.selectById(1L)).thenReturn(user);

        assertTrue(interceptor.preHandle(request, response, null));
        assertEquals(1L, AdminContext.getOperatorId());
        interceptor.afterCompletion(request, response, null, null);
        assertNull(AdminContext.getOperatorId());
    }
}
