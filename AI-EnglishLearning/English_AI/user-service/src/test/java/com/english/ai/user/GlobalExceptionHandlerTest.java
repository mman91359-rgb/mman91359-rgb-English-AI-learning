package com.english.ai.user;

import com.english.ai.common.BusinessException;
import com.english.ai.common.ErrorCode;
import com.english.ai.common.Result;
import com.english.ai.user.handler.GlobalExceptionHandler;
import org.junit.jupiter.api.Test;
import org.springframework.http.ResponseEntity;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * 全局异常出口的状态码与 body 约定。
 */
class GlobalExceptionHandlerTest {

    private final GlobalExceptionHandler handler = new GlobalExceptionHandler();

    @Test
    void businessExceptionUsesItsHttpStatusAndBodyCode() {
        ResponseEntity<Result<Void>> response = handler.handleBusiness(
                new BusinessException(ErrorCode.FORBIDDEN, "无权操作"));

        assertEquals(403, response.getStatusCode().value());
        assertEquals(403, response.getBody().getCode());
        assertEquals("无权操作", response.getBody().getMessage());
    }

    @Test
    void illegalArgumentMapsToBadRequest() {
        ResponseEntity<Result<Void>> response = handler.handleIllegalArgument(
                new IllegalArgumentException("参数不合法"));

        assertEquals(400, response.getStatusCode().value());
        assertEquals(400, response.getBody().getCode());
        assertEquals("参数不合法", response.getBody().getMessage());
    }

    @Test
    void unknownExceptionMapsToInternalErrorWithoutLeakingMessage() {
        ResponseEntity<Result<Void>> response = handler.handleException(
                new RuntimeException("数据库密码是 secret"));

        assertEquals(500, response.getStatusCode().value());
        assertEquals(500, response.getBody().getCode());
        assertEquals(ErrorCode.INTERNAL_ERROR.getMessage(), response.getBody().getMessage());
    }
}
