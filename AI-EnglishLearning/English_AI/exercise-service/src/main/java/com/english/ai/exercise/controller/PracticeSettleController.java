package com.english.ai.exercise.controller;

import com.english.ai.common.BusinessException;
import com.english.ai.common.ErrorCode;
import com.english.ai.common.Result;
import com.english.ai.common.UserIdentityUtil;
import com.english.ai.exercise.dto.PracticeSettleResponse;
import com.english.ai.exercise.service.PracticeSettleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * 练习组积分结算接口
 */
@Slf4j
@RestController
@RequestMapping("/exercise")
@RequiredArgsConstructor
public class PracticeSettleController {

    private final PracticeSettleService practiceSettleService;

    /**
     * 结算一组练习的积分（幂等：同一 batchKey 重复调用返回首次结果）
     * POST /exercise/practice/settle
     * Body: {"userId": 1, "batchKey": "uuid"}
     */
    @PostMapping("/practice/settle")
    public Result<PracticeSettleResponse> settle(
            @RequestBody Map<String, Object> body,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        Long userId = parseLong(body.get("userId"));
        String batchKey = body.get("batchKey") == null ? null : String.valueOf(body.get("batchKey"));
        if (userId == null || batchKey == null || batchKey.isBlank()) {
            return Result.badRequest("userId和batchKey不能为空");
        }
        if (UserIdentityUtil.isForbidden(headerUserId, userId)) {
            throw new BusinessException(ErrorCode.FORBIDDEN, "无权操作其他用户数据");
        }
        try {
            return Result.success(practiceSettleService.settle(userId, batchKey));
        } catch (IllegalArgumentException e) {
            return Result.badRequest(e.getMessage());
        } catch (RuntimeException e) {
            log.warn("练习组结算失败: userId={}, reason={}", userId, e.getMessage());
            return Result.error("练习积分结算失败");
        }
    }

    private Long parseLong(Object value) {
        if (value == null) {
            return null;
        }
        try {
            return Long.valueOf(String.valueOf(value));
        } catch (NumberFormatException e) {
            return null;
        }
    }
}
