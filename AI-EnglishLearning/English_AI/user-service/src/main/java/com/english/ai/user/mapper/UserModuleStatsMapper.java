package com.english.ai.user.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.english.ai.user.entity.UserModuleStats;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 模块答题统计 Mapper
 */
@Mapper
public interface UserModuleStatsMapper extends BaseMapper<UserModuleStats> {

    /**
     * 增量累加一次作答：总题数 +1，答对时正确数 +1。
     * 依赖 uk_user_module 唯一键，首次作答自动插入。
     */
    @Insert("INSERT INTO user_module_stats (user_id, module_type, total_count, correct_count) "
            + "VALUES (#{userId}, #{moduleType}, 1, #{correct}) "
            + "ON DUPLICATE KEY UPDATE total_count = total_count + 1, "
            + "correct_count = correct_count + #{correct}")
    int accumulate(@Param("userId") Long userId,
                   @Param("moduleType") int moduleType,
                   @Param("correct") int correct);

    /**
     * 批量查询某用户全部模块的统计（画像页一次取齐）。
     */
    default List<UserModuleStats> listByUserId(Long userId) {
        return selectList(new com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper<UserModuleStats>()
                .eq(UserModuleStats::getUserId, userId));
    }
}
