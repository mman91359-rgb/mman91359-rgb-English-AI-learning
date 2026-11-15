package com.english.ai.user.service;

import com.english.ai.user.config.CoinRewardProperties;
import com.english.ai.user.dto.AwardCoinResponse;
import com.english.ai.user.dto.CheckInResponse;
import com.english.ai.user.dto.CheckInStatus;
import com.english.ai.user.dto.CoinDeductResult;
import com.english.ai.user.dto.MakeupCheckInResponse;
import com.english.ai.user.entity.UserCheckIn;
import com.english.ai.user.entity.UserCoinAccount;
import com.english.ai.user.mapper.UserCheckInMapper;
import com.english.ai.user.service.impl.CheckInServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.Clock;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.contains;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

/**
 * 签到服务单元测试
 */
@ExtendWith(MockitoExtension.class)
class CheckInServiceImplTest {

    private static final LocalDate TODAY = LocalDate.of(2026, 10, 24);
    private static final LocalDate YESTERDAY = TODAY.minusDays(1);

    @Mock
    private UserCheckInMapper checkInMapper;

    @Mock
    private CoinService coinService;

    private CheckInServiceImpl service;

    @BeforeEach
    void setUp() {
        CoinRewardProperties properties = new CoinRewardProperties();
        properties.getCheckIn().setBaseReward(10);
        properties.getCheckIn().setStreakStep(2);
        properties.getCheckIn().setMaxStreakBonus(20);

        CoinRewardProperties.Milestone seven = new CoinRewardProperties.Milestone();
        seven.setDays(7);
        seven.setReward(30);
        CoinRewardProperties.Milestone thirty = new CoinRewardProperties.Milestone();
        thirty.setDays(30);
        thirty.setReward(100);
        properties.getCheckIn().setMilestones(List.of(seven, thirty));

        Clock clock = Clock.fixed(Instant.parse("2026-10-24T04:00:00Z"), ZoneId.of("Asia/Shanghai"));
        service = new CheckInServiceImpl(checkInMapper, coinService,
                new CoinRewardCalculator(properties), clock, properties);
    }

    @Test
    void firstCheckInGivesBaseReward() {
        when(coinService.userExists(1L)).thenReturn(true);
        when(checkInMapper.insert(any())).thenReturn(1);
        when(coinService.award(eq(1L), eq("CHECK_IN"), anyString(), eq(10), anyString()))
                .thenReturn(award(10, 10));

        CheckInResponse response = service.checkIn(1L);

        assertFalse(response.getAlreadyCheckedIn());
        assertEquals(10, response.getReward());
        assertEquals(1, response.getStreakDays());
        assertEquals(10, response.getBalance());
        verify(checkInMapper).insert(any());
        verify(coinService, never()).award(eq(1L), eq("CHECK_IN_MILESTONE"),
                anyString(), anyInt(), anyString());
    }

    @Test
    void consecutiveCheckInIncreasesStreak() {
        when(coinService.userExists(1L)).thenReturn(true);
        when(checkInMapper.selectOne(any())).thenReturn(null, checkIn(YESTERDAY, 1));
        when(checkInMapper.insert(any())).thenReturn(1);
        when(coinService.award(eq(1L), eq("CHECK_IN"), anyString(), eq(12), anyString()))
                .thenReturn(award(12, 22));

        CheckInResponse response = service.checkIn(1L);

        assertEquals(2, response.getStreakDays());
        assertEquals(12, response.getReward());
        assertEquals(22, response.getBalance());
    }

    @Test
    void brokenStreakResetsToOne() {
        when(coinService.userExists(1L)).thenReturn(true);
        when(checkInMapper.selectOne(any())).thenReturn(null, checkIn(TODAY.minusDays(3), 5));
        when(checkInMapper.insert(any())).thenReturn(1);
        when(coinService.award(eq(1L), eq("CHECK_IN"), anyString(), eq(10), anyString()))
                .thenReturn(award(10, 10));

        CheckInResponse response = service.checkIn(1L);

        assertEquals(1, response.getStreakDays());
        assertEquals(10, response.getReward());
    }

    @Test
    void alreadyCheckedInDoesNotAwardAgain() {
        when(coinService.userExists(1L)).thenReturn(true);
        when(checkInMapper.selectOne(any())).thenReturn(checkIn(TODAY, 3));
        when(coinService.getAccount(1L)).thenReturn(account(50));

        CheckInResponse response = service.checkIn(1L);

        assertTrue(response.getAlreadyCheckedIn());
        assertEquals(3, response.getStreakDays());
        assertEquals(50, response.getBalance());
        verify(checkInMapper, never()).insert(any());
        verify(coinService, never()).award(any(), anyString(), anyString(), eq(10), anyString());
    }

    @Test
    void seventhDayAwardsMilestone() {
        when(coinService.userExists(1L)).thenReturn(true);
        when(checkInMapper.selectOne(any())).thenReturn(null, checkIn(YESTERDAY, 6));
        when(checkInMapper.insert(any())).thenReturn(1);
        when(coinService.award(eq(1L), eq("CHECK_IN"), anyString(), eq(22), anyString()))
                .thenReturn(award(22, 22));
        when(coinService.award(eq(1L), eq("CHECK_IN_MILESTONE"),
                contains(":7:2026-10-18"), eq(30), anyString()))
                .thenReturn(award(30, 52));

        CheckInResponse response = service.checkIn(1L);

        assertEquals(7, response.getStreakDays());
        assertEquals(52, response.getReward());
        assertEquals(30, response.getMilestoneReward());
        assertEquals(52, response.getBalance());
        verify(coinService).award(eq(1L), eq("CHECK_IN_MILESTONE"),
                contains(":7:2026-10-18"), eq(30), anyString());
    }

    @Test
    void statusPreviewsNextMilestone() {
        when(checkInMapper.selectOne(any())).thenReturn(checkIn(YESTERDAY, 6));

        CheckInStatus status = service.getStatus(1L);

        assertFalse(status.getTodayCheckedIn());
        assertEquals(6, status.getStreakDays());
        assertEquals(7, status.getNextStreakDays());
        assertEquals(10, status.getPreviewBaseReward());
        assertEquals(12, status.getPreviewStreakBonus());
        assertEquals(30, status.getPreviewMilestoneReward());
        assertEquals(52, status.getPreviewReward());
    }

    @Test
    void makeupCheckInRecalculatesStreakWithoutAwardingCoins() {
        LocalDate makeupDate = TODAY.minusDays(2);
        when(coinService.userExists(1L)).thenReturn(true);
        // selectOne 调用顺序：最早签到日 → 目标日是否已签 → 重算后的最新一条
        when(checkInMapper.selectOne(any())).thenReturn(
                checkIn(TODAY.minusDays(4), 1),
                null,
                checkIn(TODAY.minusDays(1), 4));
        when(coinService.deduct(eq(1L), eq("CHECK_IN_MAKEUP"), anyString(), eq(600), anyString()))
                .thenReturn(CoinDeductResult.builder().amount(-600).balance(100).build());
        when(checkInMapper.insert(any())).thenReturn(1);
        // 补上 d-2 后，d-4 / d-3 / d-2 / d-1 连成 4 天；原本 d-2 与 d-1 的 streak 需要重算
        when(checkInMapper.selectList(any())).thenReturn(List.of(
                checkIn(TODAY.minusDays(4), 1),
                checkIn(TODAY.minusDays(3), 2),
                checkIn(makeupDate, 0),
                checkIn(TODAY.minusDays(1), 1)));

        MakeupCheckInResponse response = service.makeupCheckIn(1L, makeupDate);

        assertEquals(600, response.getCostCoins());
        assertEquals(100, response.getBalance());
        assertEquals(2, response.getRecalculatedCount());
        assertEquals(4, response.getStreakDays());
        // 补签不发放任何奖励金币
        verify(coinService, never()).award(any(), anyString(), anyString(), anyInt(), anyString());

        ArgumentCaptor<UserCheckIn> captor = ArgumentCaptor.forClass(UserCheckIn.class);
        verify(checkInMapper, times(2)).updateById(captor.capture());
        assertEquals(3, captor.getAllValues().get(0).getStreakDays());
        assertEquals(4, captor.getAllValues().get(1).getStreakDays());
    }

    @Test
    void makeupCheckInMarksRecordAsMakeup() {
        LocalDate makeupDate = TODAY.minusDays(2);
        when(coinService.userExists(1L)).thenReturn(true);
        when(checkInMapper.selectOne(any())).thenReturn(
                checkIn(TODAY.minusDays(4), 1), null, checkIn(TODAY.minusDays(1), 4));
        when(coinService.deduct(eq(1L), eq("CHECK_IN_MAKEUP"), anyString(), eq(600), anyString()))
                .thenReturn(CoinDeductResult.builder().amount(-600).balance(100).build());
        when(checkInMapper.insert(any())).thenReturn(1);
        when(checkInMapper.selectList(any())).thenReturn(List.of(checkIn(makeupDate, 0)));

        service.makeupCheckIn(1L, makeupDate);

        ArgumentCaptor<UserCheckIn> captor = ArgumentCaptor.forClass(UserCheckIn.class);
        verify(checkInMapper).insert(captor.capture());
        assertEquals(1, captor.getValue().getIsMakeup());
        assertEquals(0, captor.getValue().getRewardCoins());
    }

    @Test
    void makeupCheckInRejectsFutureDate() {
        when(coinService.userExists(1L)).thenReturn(true);
        assertThrows(IllegalArgumentException.class, () -> service.makeupCheckIn(1L, TODAY));
    }

    @Test
    void makeupCheckInRejectsAlreadyCheckedDate() {
        LocalDate makeupDate = TODAY.minusDays(2);
        when(coinService.userExists(1L)).thenReturn(true);
        when(checkInMapper.selectOne(any())).thenReturn(
                checkIn(TODAY.minusDays(4), 1), checkIn(makeupDate, 1));
        assertThrows(IllegalArgumentException.class, () -> service.makeupCheckIn(1L, makeupDate));
        verify(coinService, never()).deduct(any(), anyString(), anyString(), anyInt(), anyString());
    }

    private UserCheckIn checkIn(LocalDate date, int streak) {
        UserCheckIn row = new UserCheckIn();
        row.setUserId(1L);
        row.setCheckInDate(date);
        row.setStreakDays(streak);
        row.setRewardCoins(10);
        return row;
    }

    private UserCoinAccount account(int balance) {
        UserCoinAccount account = new UserCoinAccount();
        account.setUserId(1L);
        account.setBalance(balance);
        account.setTotalEarned(balance);
        return account;
    }

    private AwardCoinResponse award(int amount, int balance) {
        return AwardCoinResponse.builder()
                .awarded(true)
                .amount(amount)
                .balance(balance)
                .build();
    }
}
