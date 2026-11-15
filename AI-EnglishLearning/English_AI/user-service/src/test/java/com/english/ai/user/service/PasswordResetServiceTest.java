package com.english.ai.user.service;

import com.english.ai.common.BusinessException;
import com.english.ai.common.ErrorCode;
import com.english.ai.common.PasswordUtil;
import com.english.ai.user.dto.ForgotPasswordRequest;
import com.english.ai.user.entity.SysUser;
import com.english.ai.user.mapper.UserMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class PasswordResetServiceTest {

    @Mock
    private UserMapper userMapper;
    @Mock
    private VerificationCodeService verificationCodeService;

    private PasswordResetService service;

    @BeforeEach
    void setUp() {
        service = new PasswordResetService(userMapper, verificationCodeService);
    }

    @Test
    void rejectsWhenProdProfileActive() {
        when(userMapper.selectList(any())).thenReturn(List.of(user(9L, 1)));
        doThrow(new BusinessException(ErrorCode.BAD_REQUEST, "模拟验证码仅本地开发可用"))
                .when(verificationCodeService).verifyAndConsume(any(), any(), any(), any());

        BusinessException ex = assertThrows(BusinessException.class,
                () -> service.resetByPhone(request("123456")));
        assertTrue(ex.getMessage().contains("仅本地开发可用"));
        verify(userMapper, never()).updateById(any());
    }

    @Test
    void rejectsWrongCode() {
        when(userMapper.selectList(any())).thenReturn(List.of(user(9L, 1)));
        doThrow(new BusinessException(ErrorCode.BAD_REQUEST, "验证码错误"))
                .when(verificationCodeService).verifyAndConsume(any(), any(), any(), any());

        assertThrows(BusinessException.class, () -> service.resetByPhone(request("000000")));
        verify(userMapper, never()).updateById(any());
    }

    @Test
    void rejectsUnknownPhone() {
        when(userMapper.selectList(any())).thenReturn(List.of());

        assertThrows(BusinessException.class, () -> service.resetByPhone(request("123456")));
        verify(verificationCodeService, never()).verifyAndConsume(any(), any(), any(), any());
    }

    @Test
    void rejectsDuplicatePhone() {
        when(userMapper.selectList(any())).thenReturn(List.of(user(1L, 1), user(2L, 1)));

        assertThrows(BusinessException.class, () -> service.resetByPhone(request("123456")));
    }

    @Test
    void rejectsDisabledUser() {
        when(userMapper.selectList(any())).thenReturn(List.of(user(1L, 0)));

        assertThrows(BusinessException.class, () -> service.resetByPhone(request("123456")));
    }

    @Test
    void updatesPasswordForUniqueActivePhone() {
        SysUser target = user(9L, 1);
        when(userMapper.selectList(any())).thenReturn(List.of(target));

        service.resetByPhone(request("123456"));

        assertTrue(PasswordUtil.matches("NewPass123", target.getPassword()));
        verify(verificationCodeService).verifyAndConsume(any(), any(), any(), any());
        verify(userMapper).updateById(target);
    }

    private ForgotPasswordRequest request(String code) {
        ForgotPasswordRequest request = new ForgotPasswordRequest();
        request.setPhone("13800000000");
        request.setCode(code);
        request.setNewPassword("NewPass123");
        return request;
    }

    private SysUser user(Long id, int status) {
        SysUser user = new SysUser();
        user.setId(id);
        user.setUsername("user" + id);
        user.setPhone("13800000000");
        user.setStatus(status);
        user.setPassword(PasswordUtil.encode("OldPass123"));
        return user;
    }
}
