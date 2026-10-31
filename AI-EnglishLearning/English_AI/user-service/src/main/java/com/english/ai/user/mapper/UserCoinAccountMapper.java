package com.english.ai.user.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.english.ai.user.entity.UserCoinAccount;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

/**
 * 金币账户 Mapper
 */
public interface UserCoinAccountMapper extends BaseMapper<UserCoinAccount> {

    /**
     * 原子增加余额与累计获得金币
     */
    @Update("UPDATE user_coin_account SET balance = balance + #{amount}, " +
            "total_earned = total_earned + #{amount} WHERE user_id = #{userId}")
    int addBalance(@Param("userId") Long userId, @Param("amount") int amount);
}
