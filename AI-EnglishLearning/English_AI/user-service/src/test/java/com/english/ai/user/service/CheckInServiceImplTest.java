package com.english.ai.user.service;

import com.english.ai.user.config.CoinRewardProperties;
import com.english.ai.user.dto.AwardCoinResponse;
import com.english.ai.user.dto.CheckInResponse;
import com.english.ai.user.dto.CheckInStatus;
import com.english.ai.user.entity.UserCheckIn;
import com.english.ai.user.entity.UserCoinAccount;
import com.english.ai.user.mapper.UserCheckInMapper;
import com.english.ai.user.service.impl.CheckInServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.Clock;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.contains;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.never;
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
                new CoinRewardCalculator(properties), clock);
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
