package com.english.ai.user.service;

import com.english.ai.user.config.CoinRewardProperties;
import com.english.ai.user.dto.AwardCoinResponse;
import com.english.ai.user.entity.SysUser;
import com.english.ai.user.entity.UserCoinAccount;
import com.english.ai.user.entity.UserCoinTransaction;
import com.english.ai.user.mapper.UserCoinAccountMapper;
import com.english.ai.user.mapper.UserCoinTransactionMapper;
import com.english.ai.user.mapper.UserMapper;
import com.english.ai.user.service.impl.CoinServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.dao.DuplicateKeyException;

import java.time.Clock;
import java.time.Instant;
import java.time.ZoneId;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

/**
 * 金币服务单元测试
 */
@ExtendWith(MockitoExtension.class)
class CoinServiceImplTest {

    @Mock
    private UserCoinAccountMapper accountMapper;

    @Mock
    private UserCoinTransactionMapper transactionMapper;

    @Mock
    private UserMapper userMapper;

    private CoinServiceImpl service;

    @BeforeEach
    void setUp() {
        CoinRewardProperties properties = new CoinRewardProperties();
        properties.getVocabGroup().setReward(5);
        properties.getVocabGroup().setDailyLimit(3);
        Clock clock = Clock.fixed(Instant.parse("2026-10-24T04:00:00Z"), ZoneId.of("Asia/Shanghai"));
        service = new CoinServiceImpl(accountMapper, transactionMapper, userMapper, properties, clock);
    }

    @Test
    void duplicateBizKeyDoesNotAddBalance() {
        when(transactionMapper.selectOne(any())).thenReturn(new UserCoinTransaction());
        when(accountMapper.selectOne(any())).thenReturn(account(100));

        AwardCoinResponse response = service.award(1L, "VOCAB_GROUP",
                "VOCAB_GROUP:1:2026-10-24:1", 5, "完成一组单词");

        assertFalse(response.getAwarded());
        assertEquals("DUPLICATE", response.getReason());
        assertEquals(100, response.getBalance());
        verify(accountMapper, never()).addBalance(any(), anyInt());
    }

    @Test
    void concurrentDuplicateInsertReturnsDuplicateWithoutAddingBalance() {
        when(transactionMapper.selectOne(any())).thenReturn(null);
        when(accountMapper.selectOne(any())).thenReturn(account(100));
        doThrow(new DuplicateKeyException("uk_biz_key"))
                .when(transactionMapper).insert(any());

        AwardCoinResponse response = service.award(1L, "VOCAB_GROUP",
                "VOCAB_GROUP:1:2026-10-24:1", 5, "完成一组单词");

        assertFalse(response.getAwarded());
        assertEquals("DUPLICATE", response.getReason());
        assertEquals(100, response.getBalance());
        verify(accountMapper, never()).addBalance(any(), anyInt());
    }

    @Test
    void dailyLimitBlocksFourthGroup() {
        when(userMapper.selectById(1L)).thenReturn(new SysUser());
        when(transactionMapper.selectCount(any())).thenReturn(3L);
        when(accountMapper.selectOne(any())).thenReturn(account(100));

        AwardCoinResponse response = service.awardVocabGroup(1L,
                "VOCAB_GROUP:1:2026-10-24:4");

        assertFalse(response.getAwarded());
        assertEquals("DAILY_LIMIT", response.getReason());
        verify(transactionMapper, never()).insert(any());
    }

    @Test
    void normalAwardInsertsLedgerAndAddsBalance() {
        UserCoinAccount before = account(0);
        UserCoinAccount after = account(5);
        when(transactionMapper.selectOne(any())).thenReturn(null);
        when(accountMapper.selectOne(any())).thenReturn(before, after);

        AwardCoinResponse response = service.award(1L, "VOCAB_GROUP",
                "VOCAB_GROUP:1:2026-10-24:1", 5, "完成一组单词");

        assertTrue(response.getAwarded());
        assertEquals(5, response.getAmount());
        assertEquals(5, response.getBalance());
        verify(transactionMapper).insert(any());
        verify(accountMapper).addBalance(1L, 5);
    }

    @Test
    void accountIsCreatedWhenMissing() {
        UserCoinAccount after = account(5);
        when(transactionMapper.selectOne(any())).thenReturn(null);
        when(accountMapper.selectOne(any())).thenReturn(null, after);

        AwardCoinResponse response = service.award(1L, "VOCAB_GROUP",
                "VOCAB_GROUP:1:2026-10-24:1", 5, "完成一组单词");

        assertTrue(response.getAwarded());
        assertEquals(5, response.getBalance());
        verify(accountMapper).insert(any());
    }

    @Test
    void nonPositiveAmountIsRejected() {
        when(accountMapper.selectOne(any())).thenReturn(account(0));

        AwardCoinResponse response = service.award(1L, "VOCAB_GROUP",
                "VOCAB_GROUP:1:2026-10-24:1", 0, "非法金额");

        assertFalse(response.getAwarded());
        assertEquals("INVALID_AMOUNT", response.getReason());
        verify(transactionMapper, never()).insert(any());
    }

    @Test
    void unknownUserCannotReceiveVocabGroupAward() {
        when(userMapper.selectById(1L)).thenReturn(null);

        AwardCoinResponse response = service.awardVocabGroup(1L,
                "VOCAB_GROUP:1:2026-10-24:1");

        assertFalse(response.getAwarded());
        assertEquals("USER_NOT_FOUND", response.getReason());
        verify(transactionMapper, never()).insert(any());
    }

    private UserCoinAccount account(int balance) {
        UserCoinAccount account = new UserCoinAccount();
        account.setId(1L);
        account.setUserId(1L);
        account.setBalance(balance);
        account.setTotalEarned(balance);
        return account;
    }
}
