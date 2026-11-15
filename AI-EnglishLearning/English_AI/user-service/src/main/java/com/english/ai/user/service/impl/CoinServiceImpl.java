package com.english.ai.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.user.config.CoinRewardProperties;
import com.english.ai.user.dto.AwardCoinResponse;
import com.english.ai.user.dto.CoinDeductResult;
import com.english.ai.user.dto.CoinLedgerVO;
import com.english.ai.user.dto.CoinTransactionVO;
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
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 金币账户与流水实现
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class CoinServiceImpl implements CoinService {

    /** 流水默认每页条数 */
    private static final int DEFAULT_LEDGER_SIZE = 20;

    /** 流水每页上限，防止前端传大数拖库 */
    private static final int MAX_LEDGER_SIZE = 50;

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
        try {
            transactionMapper.insert(transaction);
        } catch (DuplicateKeyException e) {
            // 并发重复请求：唯一键是幂等唯一真相，直接返回当前余额
            log.info("金币流水已存在，按幂等返回: userId={}, bizKey={}", userId, bizKey);
            return buildResult(false, 0, getBalance(userId), "DUPLICATE");
        }

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
    @Transactional
    public CoinDeductResult deduct(Long userId, String bizType, String bizKey, int amount, String description) {
        if (amount <= 0) {
            throw new IllegalArgumentException("扣减金额必须为正数");
        }

        // 幂等键：同一笔补签只允许扣一次
        UserCoinTransaction existing = transactionMapper.selectOne(
                new LambdaQueryWrapper<UserCoinTransaction>().eq(UserCoinTransaction::getBizKey, bizKey));
        if (existing != null) {
            throw new IllegalArgumentException("该笔补签已扣费");
        }

        // 条件更新：余额不足时影响行数为 0，避免「先查后改」在并发下超扣
        int affected = accountMapper.deductBalance(userId, amount);
        if (affected == 0) {
            UserCoinAccount account = selectAccount(userId);
            int current = account != null && account.getBalance() != null ? account.getBalance() : 0;
            throw new IllegalArgumentException("金币余额不足，还差 " + (amount - current) + " 个金币");
        }

        UserCoinTransaction transaction = new UserCoinTransaction();
        transaction.setUserId(userId);
        transaction.setAmount(-amount);
        transaction.setBizType(bizType);
        transaction.setBizKey(bizKey);
        transaction.setDescription(description);
        transaction.setCreatedAt(LocalDateTime.now(clock));
        try {
            transactionMapper.insert(transaction);
        } catch (DuplicateKeyException e) {
            // 并发重复扣费：抛异常让外层事务回滚条件更新，避免扣了钱却没有流水
            throw new IllegalArgumentException("该笔补签已扣费");
        }

        UserCoinAccount updated = selectAccount(userId);
        int balance = updated != null && updated.getBalance() != null ? updated.getBalance() : 0;
        transactionMapper.updateBalanceAfter(transaction.getId(), balance);
        log.info("金币扣减成功: userId={}, bizType={}, amount={}, balance={}",
                userId, bizType, -amount, balance);
        return CoinDeductResult.builder().amount(-amount).balance(balance).build();
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

    @Override
    public CoinLedgerVO listLedger(Long userId, Long cursor, int size, String bizType) {
        int limit = size <= 0 ? DEFAULT_LEDGER_SIZE : Math.min(size, MAX_LEDGER_SIZE);

        UserCoinAccount account = selectAccount(userId);
        int balance = account != null && account.getBalance() != null ? account.getBalance() : 0;
        int totalEarned = account != null && account.getTotalEarned() != null ? account.getTotalEarned() : 0;

        // 多取一条用于判断是否还有下一页，省掉一次 count 查询
        List<UserCoinTransaction> rows = transactionMapper.selectPageByUser(userId, cursor, limit + 1, bizType);
        boolean hasMore = rows.size() > limit;
        List<UserCoinTransaction> page = hasMore ? rows.subList(0, limit) : rows;

        List<CoinTransactionVO> items = page.stream().map(this::toVO).collect(Collectors.toList());
        Long nextCursor = hasMore && !page.isEmpty() ? page.get(page.size() - 1).getId() : null;

        // 本月按 Asia/Shanghai 自然月统计，与签到、每日上限同一时区口径
        LocalDateTime monthStart = LocalDate.now(clock).withDayOfMonth(1).atStartOfDay();

        return CoinLedgerVO.builder()
                .userId(userId)
                .balance(balance)
                .totalEarned(totalEarned)
                .totalSpent(transactionMapper.sumDebit(userId, null))
                .monthSpent(transactionMapper.sumDebit(userId, monthStart))
                .items(items)
                .bizTypeCounts(countByBizType(userId))
                .nextCursor(nextCursor)
                .hasMore(hasMore)
                .build();
    }

    /**
     * 分组计数转 Map。计数是全量的，不受当前 bizType 筛选影响，
     * 这样切换筛选后每颗胶囊的 (n) 不会跟着变。
     * Mapper 在单测未 stub 时返回 null，按空 Map 处理。
     */
    private Map<String, Integer> countByBizType(Long userId) {
        Map<String, Integer> counts = new LinkedHashMap<>();
        List<Map<String, Object>> rows = transactionMapper.countGroupByBizType(userId);
        if (rows == null) {
            return counts;
        }
        for (Map<String, Object> row : rows) {
            Object type = row.get("biz_type");
            if (type == null) {
                type = row.get("bizType");
            }
            Object cnt = row.get("cnt");
            if (type != null && cnt instanceof Number number) {
                counts.put(String.valueOf(type), number.intValue());
            }
        }
        return counts;
    }

    private CoinTransactionVO toVO(UserCoinTransaction transaction) {
        return CoinTransactionVO.builder()
                .id(transaction.getId())
                .amount(transaction.getAmount())
                .bizType(transaction.getBizType())
                .description(transaction.getDescription())
                .balanceAfter(transaction.getBalanceAfter())
                .createdAt(transaction.getCreatedAt())
                .build();
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
