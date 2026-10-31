package com.english.ai.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.user.config.CoinRewardProperties;
import com.english.ai.user.dto.AwardCoinResponse;
import com.english.ai.user.entity.UserCoinAccount;
import com.english.ai.user.entity.UserCoinTransaction;
import com.english.ai.user.mapper.UserCoinAccountMapper;
import com.english.ai.user.mapper.UserCoinTransactionMapper;
import com.english.ai.user.mapper.UserMapper;
import com.english.ai.user.service.CoinService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Clock;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 金币账户与流水实现
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class CoinServiceImpl implements CoinService {

    private final UserCoinAccountMapper accountMapper;
    private final UserCoinTransactionMapper transactionMapper;
    private final UserMapper userMapper;
    private final CoinRewardProperties properties;
    private final Clock clock;

    @Override
    @Transactional
    public UserCoinAccount getOrCreateAccount(Long userId) {
        UserCoinAccount account = selectAccount(userId);
        if (account != null) {
            return account;
        }
        account = new UserCoinAccount();
        account.setUserId(userId);
        account.setBalance(0);
        account.setTotalEarned(0);
        try {
            accountMapper.insert(account);
            return account;
        } catch (DuplicateKeyException e) {
            // 并发创建时唯一键兜底，重新读取已有账户
            return selectAccount(userId);
        }
    }

    @Override
    public UserCoinAccount getAccount(Long userId) {
        return selectAccount(userId);
    }

    @Override
    @Transactional
    public AwardCoinResponse award(Long userId, String bizType, String bizKey, int amount, String description) {
        if (amount <= 0) {
            return buildResult(false, 0, getBalance(userId), "INVALID_AMOUNT");
        }

        UserCoinTransaction existing = transactionMapper.selectOne(
                new LambdaQueryWrapper<UserCoinTransaction>().eq(UserCoinTransaction::getBizKey, bizKey));
        if (existing != null) {
            return buildResult(false, 0, getBalance(userId), "DUPLICATE");
        }

        UserCoinAccount account = getOrCreateAccount(userId);

        UserCoinTransaction transaction = new UserCoinTransaction();
        transaction.setUserId(userId);
        transaction.setAmount(amount);
        transaction.setBizType(bizType);
        transaction.setBizKey(bizKey);
        transaction.setDescription(description);
        // 显式使用统一时区，避免 JVM 默认时区与 Asia/Shanghai 不一致导致每日上限误判
        transaction.setCreatedAt(LocalDateTime.now(clock));
        transactionMapper.insert(transaction);

        accountMapper.addBalance(userId, amount);
        UserCoinAccount updated = selectAccount(userId);
        int balance = updated != null && updated.getBalance() != null ? updated.getBalance() : 0;
        transactionMapper.updateBalanceAfter(transaction.getId(), balance);

        log.info("金币发放成功: userId={}, bizType={}, bizKey={}, amount={}, balance={}",
                userId, bizType, bizKey, amount, balance);
        return buildResult(true, amount, balance, null);
    }

    @Override
    @Transactional
    public AwardCoinResponse awardVocabGroup(Long userId, String bizKey) {
        if (!userExists(userId)) {
            return buildResult(false, 0, 0, "USER_NOT_FOUND");
        }
        int limit = properties.getVocabGroup().getDailyLimit();
        int todayCount = countTodayByBizType(userId, BIZ_VOCAB_GROUP);
        if (todayCount >= limit) {
            return buildResult(false, 0, getBalance(userId), "DAILY_LIMIT");
        }
        return award(userId, BIZ_VOCAB_GROUP, bizKey,
                properties.getVocabGroup().getReward(), "完成一组单词");
    }

    @Override
    public int countTodayByBizType(Long userId, String bizType) {
        LocalDate today = LocalDate.now(clock);
        LocalDateTime start = today.atStartOfDay();
        LocalDateTime end = today.plusDays(1).atStartOfDay();
        Long count = transactionMapper.selectCount(new LambdaQueryWrapper<UserCoinTransaction>()
                .eq(UserCoinTransaction::getUserId, userId)
                .eq(UserCoinTransaction::getBizType, bizType)
                .ge(UserCoinTransaction::getCreatedAt, start)
                .lt(UserCoinTransaction::getCreatedAt, end));
        return count == null ? 0 : count.intValue();
    }

    @Override
    public boolean userExists(Long userId) {
        return userId != null && userMapper.selectById(userId) != null;
    }

    private UserCoinAccount selectAccount(Long userId) {
        if (userId == null) {
            return null;
        }
        return accountMapper.selectOne(
                new LambdaQueryWrapper<UserCoinAccount>().eq(UserCoinAccount::getUserId, userId));
    }

    private int getBalance(Long userId) {
        UserCoinAccount account = selectAccount(userId);
        return account != null && account.getBalance() != null ? account.getBalance() : 0;
    }

    private AwardCoinResponse buildResult(boolean awarded, int amount, int balance, String reason) {
        return AwardCoinResponse.builder()
                .awarded(awarded)
                .amount(amount)
                .balance(balance)
                .reason(reason)
                .build();
    }
}
