package com.english.ai.user.handler;

import com.english.ai.common.BusinessException;
import com.english.ai.common.ErrorCode;
import com.english.ai.common.Result;
import jakarta.validation.ConstraintViolationException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.servlet.resource.NoResourceFoundException;

/**
 * 用户服务统一异常出口。
 * 业务异常使用对应 HTTP 状态，未知异常统一 500 并保留堆栈日志。
 */
@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(BusinessException.class)
    public ResponseEntity<Result<Void>> handleBusiness(BusinessException e) {
        return ResponseEntity.status(e.getHttpStatus())
                .body(Result.<Void>error(e.getCode(), e.getMessage()));
    }

    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<Result<Void>> handleIllegalArgument(IllegalArgumentException e) {
        String message = e.getMessage() == null || e.getMessage().isBlank()
                ? ErrorCode.BAD_REQUEST.getMessage()
                : e.getMessage();
        return badRequest(message);
    }

    @ExceptionHandler({HttpMessageNotReadableException.class,
            MissingServletRequestParameterException.class,
            MethodArgumentTypeMismatchException.class})
    public ResponseEntity<Result<Void>> handleBadRequest(Exception e) {
        log.warn("请求参数解析失败: {}", e.getMessage());
        return badRequest(ErrorCode.BAD_REQUEST.getMessage());
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<Result<Void>> handleValidation(MethodArgumentNotValidException e) {
        String message = e.getBindingResult().getFieldErrors().stream()
                .findFirst()
                .map(error -> error.getDefaultMessage() == null
                        ? error.getField() + "不合法"
                        : error.getDefaultMessage())
                .orElse(ErrorCode.BAD_REQUEST.getMessage());
        return badRequest(message);
    }

    @ExceptionHandler(ConstraintViolationException.class)
    public ResponseEntity<Result<Void>> handleConstraintViolation(ConstraintViolationException e) {
        String message = e.getConstraintViolations().stream()
                .findFirst()
                .map(violation -> violation.getMessage())
                .orElse(ErrorCode.BAD_REQUEST.getMessage());
        return badRequest(message);
    }

    @ExceptionHandler(NoResourceFoundException.class)
    public ResponseEntity<Result<Void>> handleNotFound(NoResourceFoundException e) {
        return ResponseEntity.status(ErrorCode.NOT_FOUND.getCode())
                .body(Result.<Void>error(ErrorCode.NOT_FOUND));
    }

    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public ResponseEntity<Result<Void>> handleMethodNotAllowed(HttpRequestMethodNotSupportedException e) {
        return ResponseEntity.status(ErrorCode.METHOD_NOT_ALLOWED.getCode())
                .body(Result.<Void>error(ErrorCode.METHOD_NOT_ALLOWED));
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<Result<Void>> handleException(Exception e) {
        log.error("用户服务未处理异常", e);
        return ResponseEntity.status(ErrorCode.INTERNAL_ERROR.getCode())
                .body(Result.<Void>error(ErrorCode.INTERNAL_ERROR));
    }

    private ResponseEntity<Result<Void>> badRequest(String message) {
        return ResponseEntity.status(ErrorCode.BAD_REQUEST.getCode())
                .body(Result.<Void>error(ErrorCode.BAD_REQUEST.getCode(), message));
    }
}
