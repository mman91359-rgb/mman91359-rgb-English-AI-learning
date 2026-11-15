package com.english.ai.user.service;

import com.english.ai.user.config.CoinRewardProperties;
import com.english.ai.user.dto.AwardCoinResponse;
import com.english.ai.user.dto.CoinDeductResult;
import com.english.ai.user.dto.CoinLedgerVO;
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
import org.mockito.ArgumentCaptor;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.dao.DuplicateKeyException;

import java.time.Clock;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNull;
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

    @Test
    void listLedgerReturnsNextCursorWhenMoreRowsExist() {
        when(accountMapper.selectOne(any())).thenReturn(account(30));
        // 多取一条（limit+1）用于判断 hasMore
        when(transactionMapper.selectPageByUser(1L, null, 3, null))
                .thenReturn(List.of(tx(9L, 5), tx(8L, 5), tx(7L, 5)));
        when(transactionMapper.sumDebit(any(), any())).thenReturn(0);

        CoinLedgerVO ledger = service.listLedger(1L, null, 2, null);

        assertEquals(2, ledger.getItems().size());
        assertEquals(9L, ledger.getItems().get(0).getId());
        assertTrue(ledger.getHasMore());
        assertEquals(8L, ledger.getNextCursor());
        assertEquals(30, ledger.getBalance());
    }

    @Test
    void listLedgerClampsPageSizeAndToleratesMissingAccount() {
        when(accountMapper.selectOne(any())).thenReturn(null);
        when(transactionMapper.selectPageByUser(1L, null, 51, null)).thenReturn(List.of());
        when(transactionMapper.sumDebit(any(), any())).thenReturn(0);

        CoinLedgerVO ledger = service.listLedger(1L, null, 999, null);

        verify(transactionMapper).selectPageByUser(1L, null, 51, null);
        assertFalse(ledger.getHasMore());
        assertEquals(0, ledger.getBalance());
        assertEquals(0, ledger.getTotalEarned());
        assertEquals(0L, ledger.getItems().size());
        assertNull(ledger.getNextCursor());
    }

    @Test
    void listLedgerPassesCursorToMapper() {
        when(accountMapper.selectOne(any())).thenReturn(account(10));
        when(transactionMapper.selectPageByUser(1L, 42L, 21, null)).thenReturn(List.of(tx(41L, 5)));
        when(transactionMapper.sumDebit(any(), any())).thenReturn(0);

        CoinLedgerVO ledger = service.listLedger(1L, 42L, 20, null);

        assertEquals(1, ledger.getItems().size());
        assertFalse(ledger.getHasMore());
        assertNull(ledger.getNextCursor());
    }

    @Test
    void listLedgerFiltersByBizTypeAndReturnsAllTypeCounts() {
        when(accountMapper.selectOne(any())).thenReturn(account(10));
        when(transactionMapper.selectPageByUser(1L, null, 21, "VOCAB_GROUP"))
                .thenReturn(List.of(tx(5L, 5)));
        when(transactionMapper.sumDebit(any(), any())).thenReturn(0);
        when(transactionMapper.countGroupByBizType(1L)).thenReturn(List.of(
                Map.<String, Object>of("biz_type", "CHECK_IN", "cnt", 3L),
                Map.<String, Object>of("biz_type", "VOCAB_GROUP", "cnt", 2L)));

        CoinLedgerVO ledger = service.listLedger(1L, null, 20, "VOCAB_GROUP");

        assertEquals(1, ledger.getItems().size());
        // 计数是全量的：筛到 VOCAB_GROUP 时 CHECK_IN 的 (3) 仍在
        assertEquals(Integer.valueOf(3), ledger.getBizTypeCounts().get("CHECK_IN"));
        assertEquals(Integer.valueOf(2), ledger.getBizTypeCounts().get("VOCAB_GROUP"));
    }

    @Test
    void deductWritesNegativeTransactionWhenBalanceIsEnough() {
        when(transactionMapper.selectOne(any())).thenReturn(null);
        when(accountMapper.deductBalance(1L, 600)).thenReturn(1);
        when(transactionMapper.insert(any())).thenReturn(1);
        when(accountMapper.selectOne(any())).thenReturn(account(100));

        CoinDeductResult result = service.deduct(1L, "CHECK_IN_MAKEUP",
                "CHECK_IN_MAKEUP:1:2026-10-24", 600, "补签");

        assertEquals(-600, result.getAmount());
        assertEquals(100, result.getBalance());
        ArgumentCaptor<UserCoinTransaction> captor = ArgumentCaptor.forClass(UserCoinTransaction.class);
        verify(transactionMapper).insert(captor.capture());
        assertEquals(-600, captor.getValue().getAmount());
        assertEquals("CHECK_IN_MAKEUP", captor.getValue().getBizType());
        verify(accountMapper, never()).addBalance(any(), anyInt());
    }

    @Test
    void deductRejectsInsufficientBalance() {
        when(transactionMapper.selectOne(any())).thenReturn(null);
        when(accountMapper.deductBalance(1L, 600)).thenReturn(0);
        when(accountMapper.selectOne(any())).thenReturn(account(206));

        IllegalArgumentException ex = assertThrows(IllegalArgumentException.class,
                () -> service.deduct(1L, "CHECK_IN_MAKEUP", "k", 600, "补签"));
        assertTrue(ex.getMessage().contains("还差 394"));
        verify(transactionMapper, never()).insert(any());
    }

    @Test
    void deductIsIdempotentByBizKey() {
        when(transactionMapper.selectOne(any())).thenReturn(tx(1L, -600));
        assertThrows(IllegalArgumentException.class,
                () -> service.deduct(1L, "CHECK_IN_MAKEUP", "k", 600, "补签"));
        verify(accountMapper, never()).deductBalance(any(), anyInt());
    }

    private UserCoinTransaction tx(long id, int amount) {
        UserCoinTransaction transaction = new UserCoinTransaction();
        transaction.setId(id);
        transaction.setUserId(1L);
        transaction.setAmount(amount);
        transaction.setBizType("CHECK_IN");
        transaction.setDescription("每日签到");
        transaction.setBalanceAfter(100);
        transaction.setCreatedAt(LocalDateTime.of(2026, 10, 24, 9, 0));
        return transaction;
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
