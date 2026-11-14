package com.english.ai.user.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.english.ai.user.entity.UserAbilityRadar;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface UserAbilityRadarMapper extends BaseMapper<UserAbilityRadar> {

    /**
     * 原子累加练习积分并封顶，避免「先读后写」在并发下丢失增量。
     *
     * @param add 本次新增积分
     * @param max 积分总上限
     * @return 受影响行数，0 表示该用户尚无雷达记录
     */
    @Update("UPDATE user_ability_radar SET practice_points = LEAST(practice_points + #{add}, #{max}) "
            + "WHERE user_id = #{userId}")
    int addPracticePoints(@Param("userId") Long userId, @Param("add") int add, @Param("max") int max);
}
