package com.english.ai.exercise.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.english.ai.exercise.entity.UserStudySession;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.time.LocalDateTime;

/**
 * 学习会话 Mapper
 */
public interface UserStudySessionMapper extends BaseMapper<UserStudySession> {

    /**
     * 只增不减地更新会话活跃秒数，抗乱序与重试
     */
    @Update("UPDATE user_study_session SET active_seconds = GREATEST(active_seconds, #{seconds}), " +
            "last_reported_at = #{now} WHERE user_id = #{userId} AND session_key = #{sessionKey}")
    int updateActiveSeconds(@Param("userId") Long userId,
                            @Param("sessionKey") String sessionKey,
                            @Param("seconds") int seconds,
                            @Param("now") LocalDateTime now);
}
