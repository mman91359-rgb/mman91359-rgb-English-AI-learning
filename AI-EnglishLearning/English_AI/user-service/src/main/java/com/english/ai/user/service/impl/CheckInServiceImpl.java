package com.english.ai.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.user.dto.AwardCoinResponse;
import com.english.ai.user.dto.CheckInResponse;
import com.english.ai.user.dto.CheckInStatus;
import com.english.ai.user.entity.UserCheckIn;
import com.english.ai.user.entity.UserCoinAccount;
import com.english.ai.user.mapper.UserCheckInMapper;
import com.english.ai.user.service.CheckInService;
import com.english.ai.user.service.CoinRewardCalculator;
import com.english.ai.user.service.CoinService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Clock;
import java.time.LocalDate;

/**
 * 每日签到实现
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class CheckInServiceImpl implements CheckInService {

    private final UserCheckInMapper checkInMapper;
    private final CoinService coinService;
    private final CoinRewardCalculator rewardCalculator;
    private final Clock clock;

    @Override
    public CheckInStatus getStatus(Long userId) {
        LocalDate today = LocalDate.now(clock);
        UserCheckIn latest = selectLatest(userId);

        boolean todayCheckedIn = latest != null && today.equals(latest.getCheckInDate());
        int currentStreak;
        int nextStreak;
        if (todayCheckedIn) {
            currentStreak = latest.getStreakDays();
            nextStreak = currentStreak;
        } else if (latest != null && today.minusDays(1).equals(latest.getCheckInDate())) {
            currentStreak = latest.getStreakDays();
            nextStreak = currentStreak + 1;
        } else {
            currentStreak = 0;
            nextStreak = 1;
        }

        int baseReward = todayCheckedIn ? 0 : rewardCalculator.baseReward();
        int streakBonus = todayCheckedIn ? 0 : rewardCalculator.streakBonus(nextStreak);
        int milestoneReward = todayCheckedIn ? 0 : rewardCalculator.milestoneReward(nextStreak);

        return CheckInStatus.builder()
                .todayCheckedIn(todayCheckedIn)
                .streakDays(currentStreak)
                .nextStreakDays(nextStreak)
                .previewBaseReward(baseReward)
                .previewStreakBonus(streakBonus)
                .previewMilestoneReward(milestoneReward)
                .previewReward(baseReward + streakBonus + milestoneReward)
                .build();
    }

    @Override
    @Transactional
    public CheckInResponse checkIn(Long userId) {
        if (!coinService.userExists(userId)) {
            throw new IllegalArgumentException("用户不存在");
        }

        LocalDate today = LocalDate.now(clock);
        UserCheckIn existing = selectByDate(userId, today);
        if (existing != null) {
            return buildAlreadyCheckedIn(existing);
        }

        UserCheckIn latest = selectLatest(userId);
        int streakDays = latest != null && today.minusDays(1).equals(latest.getCheckInDate())
                ? latest.getStreakDays() + 1
                : 1;

        int baseReward = rewardCalculator.baseReward();
        int streakBonus = rewardCalculator.streakBonus(streakDays);
        int milestoneReward = rewardCalculator.milestoneReward(streakDays);

        UserCheckIn checkIn = new UserCheckIn();
        checkIn.setUserId(userId);
        checkIn.setCheckInDate(today);
        checkIn.setStreakDays(streakDays);
        checkIn.setRewardCoins(baseReward + streakBonus + milestoneReward);
        // 唯一键 uk_user_date 兜底，并发重复签到会由 Controller 捕获
        checkInMapper.insert(checkIn);

        AwardCoinResponse baseAward = coinService.award(userId, "CHECK_IN",
                "CHECK_IN:" + userId + ":" + today,
                baseReward + streakBonus, "每日签到");
        int balance = baseAward.getBalance();

        if (milestoneReward > 0) {
            String cycleStart = today.minusDays(streakDays - 1L).toString();
            AwardCoinResponse milestoneAward = coinService.award(userId, "CHECK_IN_MILESTONE",
                    "CHECK_IN_MILESTONE:" + userId + ":" + streakDays + ":" + cycleStart,
                    milestoneReward, "连续签到 " + streakDays + " 天里程碑");
            balance = milestoneAward.getBalance();
        }

        log.info("签到成功: userId={}, date={}, streak={}, reward={}",
                userId, today, streakDays, baseReward + streakBonus + milestoneReward);

        return CheckInResponse.builder()
                .alreadyCheckedIn(false)
                .reward(baseReward + streakBonus + milestoneReward)
                .baseReward(baseReward)
                .streakBonus(streakBonus)
                .milestoneReward(milestoneReward)
                .balance(balance)
                .streakDays(streakDays)
                .build();
    }

    private CheckInResponse buildAlreadyCheckedIn(UserCheckIn existing) {
        UserCoinAccount account = coinService.getAccount(existing.getUserId());
        int balance = account != null && account.getBalance() != null ? account.getBalance() : 0;
        return CheckInResponse.builder()
                .alreadyCheckedIn(true)
                .reward(0)
                .baseReward(0)
                .streakBonus(0)
                .milestoneReward(0)
                .balance(balance)
                .streakDays(existing.getStreakDays())
                .build();
    }

    private UserCheckIn selectByDate(Long userId, LocalDate date) {
        return checkInMapper.selectOne(new LambdaQueryWrapper<UserCheckIn>()
                .eq(UserCheckIn::getUserId, userId)
                .eq(UserCheckIn::getCheckInDate, date));
    }

    private UserCheckIn selectLatest(Long userId) {
        return checkInMapper.selectOne(new LambdaQueryWrapper<UserCheckIn>()
                .eq(UserCheckIn::getUserId, userId)
                .orderByDesc(UserCheckIn::getCheckInDate)
                .last("LIMIT 1"));
    }
}
