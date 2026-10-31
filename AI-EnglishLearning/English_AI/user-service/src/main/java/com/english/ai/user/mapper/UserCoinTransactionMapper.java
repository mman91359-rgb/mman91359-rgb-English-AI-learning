package com.english.ai.user.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.english.ai.user.entity.UserCoinTransaction;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

/**
 * 金币流水 Mapper
 */
public interface UserCoinTransactionMapper extends BaseMapper<UserCoinTransaction> {

    /**
     * 回填流水发生后的余额
     */
    @Update("UPDATE user_coin_transaction SET balance_after = #{balance} WHERE id = #{id}")
    int updateBalanceAfter(@Param("id") Long id, @Param("balance") int balance);
}
