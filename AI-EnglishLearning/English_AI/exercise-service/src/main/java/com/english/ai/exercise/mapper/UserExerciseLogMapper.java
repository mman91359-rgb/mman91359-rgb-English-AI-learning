package com.english.ai.exercise.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.english.ai.exercise.dto.BatchAggregate;
import com.english.ai.exercise.entity.UserExerciseLog;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserExerciseLogMapper extends BaseMapper<UserExerciseLog> {

    /**
     * 按练习组聚合本组答题结果：总题数、答对数、难度之和、模块类型。
     *
     * <p>以服务端日志为准，前端无法通过构造 isCorrect 影响结算口径。
     * 使用 INNER JOIN 是因为题目缺失时该次作答本就无法计分，不应计入分母。</p>
     */
    @Select("SELECT COUNT(*) AS totalCount, "
            + "COALESCE(SUM(l.is_correct), 0) AS correctCount, "
            + "COALESCE(SUM(q.difficulty_level), 0) AS sumDifficulty, "
            + "MAX(l.module_type) AS moduleType "
            + "FROM user_exercise_log l "
            + "INNER JOIN question_info q ON q.id = l.question_id "
            + "WHERE l.user_id = #{userId} AND l.batch_key = #{batchKey}")
    BatchAggregate aggregateByBatch(@Param("userId") Long userId, @Param("batchKey") String batchKey);
}
