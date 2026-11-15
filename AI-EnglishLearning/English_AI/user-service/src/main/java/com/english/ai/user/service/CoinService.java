package com.english.ai.user.service;

import com.english.ai.user.dto.AwardCoinResponse;
import com.english.ai.user.dto.CoinLedgerVO;
import com.english.ai.user.entity.UserCoinAccount;

/**
 * 金币账户与流水服务
 */
public interface CoinService {

    String BIZ_VOCAB_GROUP = "VOCAB_GROUP";

    /** 获取账户，不存在则创建 */
    UserCoinAccount getOrCreateAccount(Long userId);

    /** 只查询账户，不存在返回 null */
    UserCoinAccount getAccount(Long userId);

    /** 幂等发币 */
    AwardCoinResponse award(Long userId, String bizType, String bizKey, int amount, String description);

    /** 发放“完成一组单词”奖励，含每日上限 */
    AwardCoinResponse awardVocabGroup(Long userId, String bizKey);

    /** 统计今日某业务类型已发放次数 */
    int countTodayByBizType(Long userId, String bizType);

    /**
     * 分页查询金币流水（keyset 分页，按 id 倒序）
     *
     * @param cursor  上一页最后一条流水ID；null 表示第一页
     * @param size    每页条数，越界由实现层夹取
     * @param bizType 业务类型筛选；null 表示全部。未知值返回空列表，不报错
     */
    CoinLedgerVO listLedger(Long userId, Long cursor, int size, String bizType);

    /** 用户是否存在 */
    boolean userExists(Long userId);
}
