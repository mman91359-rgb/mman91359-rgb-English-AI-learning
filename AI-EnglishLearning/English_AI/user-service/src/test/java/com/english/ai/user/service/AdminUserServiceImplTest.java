package com.english.ai.user.service;

import com.english.ai.common.BusinessException;
import com.english.ai.common.Roles;
import com.english.ai.user.config.AdminContext;
import com.english.ai.user.dto.admin.ResetPasswordResponse;
import com.english.ai.user.entity.SysUser;
import com.english.ai.user.mapper.UserAbilityRadarMapper;
import com.english.ai.user.mapper.UserCoinAccountMapper;
import com.english.ai.user.mapper.UserMapper;
import com.english.ai.user.mapper.UserPreferenceMapper;
import com.english.ai.user.service.impl.AdminUserServiceImpl;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.web.client.RestTemplate;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class AdminUserServiceImplTest {

    @Mock
    private UserMapper userMapper;
    @Mock
    private UserAbilityRadarMapper radarMapper;
    @Mock
    private UserCoinAccountMapper coinAccountMapper;
    @Mock
    private UserPreferenceMapper preferenceMapper;
    @Mock
    private AdminAuditService auditService;
    @Mock
    private RestTemplate restTemplate;

    private AdminUserServiceImpl service;

    @BeforeEach
    void setUp() {
        service = new AdminUserServiceImpl(userMapper, radarMapper, coinAccountMapper,
                preferenceMapper, auditService, restTemplate);
        AdminContext.set(1L, "admin", "127.0.0.1");
    }

    @AfterEach
    void tearDown() {
        AdminContext.clear();
    }

    @Test
    void cannotDisableSelf() {
        assertThrows(BusinessException.class, () -> service.updateStatus(1L, 0));
    }

    @Test
    void cannotChangeOwnRole() {
        assertThrows(BusinessException.class, () -> service.updateRole(1L, Roles.USER));
    }

    @Test
    void cannotDemoteLastAdmin() {
        SysUser target = user(2L, Roles.ADMIN, 1);
        when(userMapper.selectById(2L)).thenReturn(target);
        when(userMapper.selectCount(any())).thenReturn(0L);

        assertThrows(BusinessException.class, () -> service.updateRole(2L, Roles.USER));
        verify(userMapper, never()).updateById(any());
    }

    @Test
    void resetPasswordReturnsTemporaryPasswordAndUpdatesUser() {
        SysUser target = user(2L, Roles.USER, 1);
        when(userMapper.selectById(2L)).thenReturn(target);

        ResetPasswordResponse response = service.resetPassword(2L);

        assertEquals(2L, response.getUserId());
        assertEquals(12, response.getTemporaryPassword().length());
        verify(userMapper).updateById(target);
        verify(auditService).record("USER_PASSWORD_RESET", "USER", 2L, "username=user2");
    }

    private SysUser user(Long id, String roles, int status) {
        SysUser user = new SysUser();
        user.setId(id);
        user.setUsername("user" + id);
        user.setRoles(roles);
        user.setStatus(status);
        return user;
    }
}
