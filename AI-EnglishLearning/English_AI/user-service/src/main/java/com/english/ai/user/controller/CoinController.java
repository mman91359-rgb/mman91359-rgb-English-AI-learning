package com.english.ai.user.controller;

import com.english.ai.common.BusinessException;
import com.english.ai.common.ErrorCode;
import com.english.ai.common.Result;
import com.english.ai.common.UserIdentityUtil;
import com.english.ai.user.config.CoinRewardProperties;
import com.english.ai.user.dto.CheckInCalendarVO;
import com.english.ai.user.dto.CheckInRequest;
import com.english.ai.user.dto.CheckInResponse;
import com.english.ai.user.dto.CheckInStatus;
import com.english.ai.user.dto.CoinInfoResponse;
import com.english.ai.user.entity.UserCoinAccount;
import com.english.ai.user.service.CheckInService;
import com.english.ai.user.service.CoinService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.time.temporal.ChronoUnit;

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
            throw new BusinessException(ErrorCode.FORBIDDEN, "无权访问其他用户数据");
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
     * 签到日历：查询日期区间内的签到记录（只读）
     * GET /user/check-in/records/{userId}?from=2026-11-01&to=2026-11-30
     *
     * 用区间而不是 month，是因为「本周」可能跨月（周一是上月最后一天），
     * 前端把「当月首尾 ∪ 本周首尾」合成一个区间，一次请求覆盖卡片与日历。
     */
    @GetMapping("/check-in/records/{userId}")
    public Result<CheckInCalendarVO> getCheckInRecords(
            @PathVariable Long userId,
            @RequestParam("from") String from,
            @RequestParam("to") String to,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        if (UserIdentityUtil.isForbidden(headerUserId, userId)) {
            throw new BusinessException(ErrorCode.FORBIDDEN, "无权访问其他用户数据");
        }
        if (!coinService.userExists(userId)) {
            return Result.error(404, "用户不存在");
        }

        LocalDate start;
        LocalDate end;
        try {
            start = LocalDate.parse(from);
            end = LocalDate.parse(to);
        } catch (DateTimeParseException e) {
            return Result.badRequest("日期格式应为 yyyy-MM-dd");
        }
        if (start.isAfter(end)) {
            return Result.badRequest("from 不能晚于 to");
        }
        if (ChronoUnit.DAYS.between(start, end) > 366) {
            return Result.badRequest("查询区间不能超过 366 天");
        }

        try {
            return Result.success(checkInService.listRecords(userId, start, end));
        } catch (RuntimeException e) {
            log.warn("查询签到记录失败: userId={}, reason={}", userId, e.getMessage());
            return Result.error("查询签到记录失败");
        }
    }

    /**
     * 每日签到
     * POST /user/check-in
     */
    @PostMapping("/check-in")
    public Result<CheckInResponse> checkIn(
            @Valid @RequestBody CheckInRequest request,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        if (request == null || request.getUserId() == null) {
            return Result.badRequest("userId不能为空");
        }
        if (UserIdentityUtil.isForbidden(headerUserId, request.getUserId())) {
            throw new BusinessException(ErrorCode.FORBIDDEN, "无权操作其他用户数据");
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
