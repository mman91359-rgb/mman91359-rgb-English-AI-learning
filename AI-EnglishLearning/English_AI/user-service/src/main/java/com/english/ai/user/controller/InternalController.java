package com.english.ai.user.controller;

import com.english.ai.common.Result;
import com.english.ai.user.dto.AwardCoinRequest;
import com.english.ai.user.dto.AwardCoinResponse;
import com.english.ai.user.dto.PreferenceResponse;
import com.english.ai.user.entity.UserCoinAccount;
import com.english.ai.user.service.CoinService;
import com.english.ai.user.service.UserPreferenceService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 服务间内部接口。
 * 网关只路由 /user、/exercise、/learning、/ai，/internal/** 不会暴露给前端。
 */
@Slf4j
@RestController
@RequestMapping("/internal")
@RequiredArgsConstructor
public class InternalController {

    private final CoinService coinService;
    private final UserPreferenceService preferenceService;

    /**
     * 服务间幂等发币（目前只允许词汇组奖励）
     * POST /internal/coin/award
     */
    @PostMapping("/coin/award")
    public Result<AwardCoinResponse> award(@Valid @RequestBody AwardCoinRequest request) {
        if (request == null || request.getUserId() == null) {
            return Result.badRequest("userId不能为空");
        }
        if (!CoinService.BIZ_VOCAB_GROUP.equals(request.getBizType())) {
            return Result.badRequest("不支持的业务类型");
        }
        String expectedPrefix = CoinService.BIZ_VOCAB_GROUP + ":" + request.getUserId() + ":";
        if (request.getBizKey() == null || !request.getBizKey().startsWith(expectedPrefix)) {
            return Result.badRequest("非法的业务幂等键");
        }
        try {
            return Result.success(coinService.awardVocabGroup(request.getUserId(), request.getBizKey()));
        } catch (DuplicateKeyException e) {
            UserCoinAccount account = coinService.getAccount(request.getUserId());
            return Result.success(AwardCoinResponse.builder()
                    .awarded(false)
                    .amount(0)
                    .balance(account != null && account.getBalance() != null ? account.getBalance() : 0)
                    .reason("DUPLICATE")
                    .build());
        } catch (RuntimeException e) {
            log.warn("内部发币失败: userId={}, bizKey={}, reason={}",
                    request.getUserId(), request.getBizKey(), e.getMessage());
            return Result.error("发币失败");
        }
    }

    /**
     * 服务间读取每组单词数量
     * GET /internal/user/preference/{userId}
     */
    @GetMapping("/user/preference/{userId}")
    public Result<PreferenceResponse> preference(@PathVariable Long userId) {
        return Result.success(preferenceService.get(userId));
    }
}
