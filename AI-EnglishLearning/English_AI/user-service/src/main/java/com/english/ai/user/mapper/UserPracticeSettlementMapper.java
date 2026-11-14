package com.english.ai.user.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.english.ai.user.entity.UserPracticeSettlement;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.time.LocalDate;

/**
 * 练习积分结算记录 Mapper
 */
@Mapper
public interface UserPracticeSettlementMapper extends BaseMapper<UserPracticeSettlement> {

    /**
     * 统计某用户某日已发放的积分，用于每日上限判断。
     */
    @Select("SELECT COALESCE(SUM(points), 0) FROM user_practice_settlement "
            + "WHERE user_id = #{userId} AND stat_date = #{statDate}")
    int sumPointsByDate(@Param("userId") Long userId, @Param("statDate") LocalDate statDate);
}
