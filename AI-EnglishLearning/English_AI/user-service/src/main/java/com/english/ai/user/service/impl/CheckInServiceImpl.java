package com.english.ai.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.user.config.CoinRewardProperties;
import com.english.ai.user.dto.AwardCoinResponse;
import com.english.ai.user.dto.CheckInCalendarVO;
import com.english.ai.user.dto.CheckInRecordItem;
import com.english.ai.user.dto.CheckInResponse;
import com.english.ai.user.dto.CheckInStatus;
import com.english.ai.user.dto.CoinDeductResult;
import com.english.ai.user.dto.MakeupCheckInResponse;
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
import java.util.List;
import java.util.Objects;

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
    private final CoinRewardProperties properties;

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

    @Override
    @Transactional
    public MakeupCheckInResponse makeupCheckIn(Long userId, LocalDate date) {
        if (!coinService.userExists(userId)) {
            throw new IllegalArgumentException("用户不存在");
        }

        LocalDate today = LocalDate.now(clock);
        LocalDate monthStart = today.withDayOfMonth(1);
        // 业务边界：只补本月内、已过去、且在首次签到之后的空缺日期
        if (date == null || date.isBefore(monthStart) || !date.isBefore(today)) {
            throw new IllegalArgumentException("只能补签本月内已过去的日期");
        }
        LocalDate earliest = selectEarliestDate(userId);
        if (earliest == null) {
            throw new IllegalArgumentException("尚无签到记录，无需补签");
        }
        if (date.isBefore(earliest)) {
            throw new IllegalArgumentException("补签日期不能早于首次签到日");
        }
        if (selectByDate(userId, date) != null) {
            throw new IllegalArgumentException("该日期已签到");
        }

        int cost = properties.getMakeup().getCostCoins();
        String bizKey = CoinService.BIZ_CHECK_IN_MAKEUP + ":" + userId + ":" + date;
        // 条件扣币与幂等键失败都会抛异常，由本事务一并回滚
        CoinDeductResult deduct = coinService.deduct(userId, CoinService.BIZ_CHECK_IN_MAKEUP,
                bizKey, cost, "补签 " + date);

        UserCheckIn makeup = new UserCheckIn();
        makeup.setUserId(userId);
        makeup.setCheckInDate(date);
        makeup.setStreakDays(0);
        makeup.setRewardCoins(0);
        makeup.setIsMakeup(1);
        // 唯一键 uk_user_date 兜底并发重复补签，异常由 Controller 转成 400
        checkInMapper.insert(makeup);

        int recalculated = recalculateStreaks(userId);
        UserCheckIn latest = selectLatest(userId);
        int streak = latest != null && latest.getStreakDays() != null ? latest.getStreakDays() : 0;

        log.info("补签成功: userId={}, date={}, cost={}, recalculated={}",
                userId, date, cost, recalculated);
        return MakeupCheckInResponse.builder()
                .date(date)
                .costCoins(cost)
                .balance(deduct.getBalance())
                .streakDays(streak)
                .recalculatedCount(recalculated)
                .build();
    }

    /**
     * 按日期升序重算该用户全部签到记录的连续天数（B 方案）。
     * 纯规则：与前一条相差一天则 +1，否则重置为 1；只写值发生变化的行。
     * 不改 reward_coins、不补发金币、不动账户 total_earned。
     */
    private int recalculateStreaks(Long userId) {
        List<UserCheckIn> rows = checkInMapper.selectList(new LambdaQueryWrapper<UserCheckIn>()
                .eq(UserCheckIn::getUserId, userId)
                .orderByAsc(UserCheckIn::getCheckInDate));
        LocalDate previous = null;
        int streak = 0;
        int changed = 0;
        for (UserCheckIn row : rows) {
            streak = previous != null && previous.plusDays(1).equals(row.getCheckInDate())
                    ? streak + 1 : 1;
            previous = row.getCheckInDate();
            if (!Objects.equals(row.getStreakDays(), streak)) {
                row.setStreakDays(streak);
                checkInMapper.updateById(row);
                changed++;
            }
        }
        return changed;
    }

    @Override
    public CheckInCalendarVO listRecords(Long userId, LocalDate from, LocalDate to) {
        CheckInStatus status = getStatus(userId);

        List<UserCheckIn> rows = checkInMapper.selectList(new LambdaQueryWrapper<UserCheckIn>()
                .eq(UserCheckIn::getUserId, userId)
                .between(UserCheckIn::getCheckInDate, from, to)
                .orderByAsc(UserCheckIn::getCheckInDate));

        List<CheckInRecordItem> records = rows.stream()
                .map(row -> CheckInRecordItem.builder()
                        .date(row.getCheckInDate())
                        .rewardCoins(row.getRewardCoins())
                        .streakDays(row.getStreakDays())
                        .build())
                .toList();

        return CheckInCalendarVO.builder()
                .todayCheckedIn(status.getTodayCheckedIn())
                .streakDays(status.getStreakDays())
                .earliestDate(selectEarliestDate(userId))
                .records(records)
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

    /** 用户最早一条签到日期；无记录返回 null */
    private LocalDate selectEarliestDate(Long userId) {
        UserCheckIn earliest = checkInMapper.selectOne(new LambdaQueryWrapper<UserCheckIn>()
                .eq(UserCheckIn::getUserId, userId)
                .orderByAsc(UserCheckIn::getCheckInDate)
                .last("LIMIT 1"));
        return earliest != null ? earliest.getCheckInDate() : null;
    }
}
