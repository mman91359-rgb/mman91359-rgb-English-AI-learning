package com.english.ai.user.controller;

import com.english.ai.common.Result;
import com.english.ai.user.config.CoinRewardProperties;
import com.english.ai.user.dto.CheckInRequest;
import com.english.ai.user.dto.CheckInResponse;
import com.english.ai.user.dto.CheckInStatus;
import com.english.ai.user.dto.CoinInfoResponse;
import com.english.ai.user.entity.UserCoinAccount;
import com.english.ai.user.service.CheckInService;
import com.english.ai.user.service.CoinService;
import com.english.ai.user.util.UserIdentityUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 金币与签到接口
 */
@Slf4j
@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
public class CoinController {

    private final CoinService coinService;
    private final CheckInService checkInService;
    private final CoinRewardProperties rewardProperties;

    /**
     * 金币余额、签到状态与奖励预览
     * GET /user/coin/info/{userId}
     */
    @GetMapping("/coin/info/{userId}")
    public Result<CoinInfoResponse> getCoinInfo(
            @PathVariable Long userId,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        if (UserIdentityUtil.isForbidden(headerUserId, userId)) {
            return Result.error(403, "无权访问其他用户数据");
        }
        if (!coinService.userExists(userId)) {
            return Result.error(404, "用户不存在");
        }
        try {
            UserCoinAccount account = coinService.getOrCreateAccount(userId);
            CheckInStatus status = checkInService.getStatus(userId);
            int todayGroupCount = coinService.countTodayByBizType(userId, CoinService.BIZ_VOCAB_GROUP);

            CoinInfoResponse response = CoinInfoResponse.builder()
                    .userId(userId)
                    .balance(account.getBalance())
                    .totalEarned(account.getTotalEarned())
                    .todayCheckedIn(status.getTodayCheckedIn())
                    .checkInStreak(status.getStreakDays())
                    .previewSignInReward(status.getPreviewReward())
                    .vocabGroupReward(rewardProperties.getVocabGroup().getReward())
                    .vocabGroupDailyLimit(rewardProperties.getVocabGroup().getDailyLimit())
                    .vocabGroupTodayCount(todayGroupCount)
                    .build();
            return Result.success(response);
        } catch (RuntimeException e) {
            log.warn("查询金币信息失败: userId={}, reason={}", userId, e.getMessage());
            return Result.error("查询金币信息失败");
        }
    }

    /**
     * 每日签到
     * POST /user/check-in
     */
    @PostMapping("/check-in")
    public Result<CheckInResponse> checkIn(
            @RequestBody CheckInRequest request,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        if (request == null || request.getUserId() == null) {
            return Result.badRequest("userId不能为空");
        }
        if (UserIdentityUtil.isForbidden(headerUserId, request.getUserId())) {
            return Result.error(403, "无权操作其他用户数据");
        }
        try {
            return Result.success(checkInService.checkIn(request.getUserId()));
        } catch (DuplicateKeyException e) {
            // 并发重复签到：唯一键兜底后返回已签到状态
            CheckInStatus status = checkInService.getStatus(request.getUserId());
            UserCoinAccount account = coinService.getAccount(request.getUserId());
            return Result.success(CheckInResponse.builder()
                    .alreadyCheckedIn(true)
                    .reward(0)
                    .baseReward(0)
                    .streakBonus(0)
                    .milestoneReward(0)
                    .balance(account != null && account.getBalance() != null ? account.getBalance() : 0)
                    .streakDays(status.getStreakDays())
                    .build());
        } catch (IllegalArgumentException e) {
            return Result.badRequest(e.getMessage());
        } catch (RuntimeException e) {
            log.warn("签到失败: userId={}, reason={}", request.getUserId(), e.getMessage());
            return Result.error("签到失败，请稍后重试");
        }
    }
}
