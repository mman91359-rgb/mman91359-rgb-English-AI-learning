package com.english.ai.exercise.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.english.ai.exercise.entity.JudgeReviewQueueItem;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface JudgeReviewQueueMapper extends BaseMapper<JudgeReviewQueueItem> {

    /**
     * 幂等入队：依赖 uk_review_log(log_id)，同一 log 重复入队时忽略并返回 0。
     * 无 log_id 的手工入队不参与去重（MySQL 唯一键允许 NULL 重复）。
     */
    @Insert("INSERT IGNORE INTO `judge_review_queue` "
            + "(`question_id`, `user_id`, `log_id`, `difficulty_level`, `module_type`, "
            + "`user_answer`, `correct_answer`, `matched_level`, "
            + "`ai_confidence`, `ai_result`, `judge_context`, `reason`, `status`) "
            + "VALUES (#{item.questionId}, #{item.userId}, #{item.logId}, "
            + "#{item.difficultyLevel}, #{item.moduleType}, "
            + "#{item.userAnswer}, #{item.correctAnswer}, #{item.matchedLevel}, "
            + "#{item.aiConfidence}, #{item.aiResult}, #{item.judgeContext}, "
            + "#{item.reason}, #{item.status})")
    int enqueueIgnoreDuplicate(@Param("item") JudgeReviewQueueItem item);

    /** 抢占遗忘曲线补记标记；返回 0 表示已被其他请求抢占 */
    @Update("UPDATE `judge_review_queue` SET `curve_scored_at` = NOW() "
            + "WHERE `id` = #{id} AND `curve_scored_at` IS NULL")
    int claimCurveScored(@Param("id") Long id);

    /** 补记失败时清回标记，等待重试 */
    @Update("UPDATE `judge_review_queue` SET `curve_scored_at` = NULL WHERE `id` = #{id}")
    int clearCurveScored(@Param("id") Long id);

    /** 抢占 ELO 补记标记 */
    @Update("UPDATE `judge_review_queue` SET `elo_scored_at` = NOW() "
            + "WHERE `id` = #{id} AND `elo_scored_at` IS NULL")
    int claimEloScored(@Param("id") Long id);

    /** 补记失败时清回标记 */
    @Update("UPDATE `judge_review_queue` SET `elo_scored_at` = NULL WHERE `id` = #{id}")
    int clearEloScored(@Param("id") Long id);

    /** 已复核但还没补记完的队列行（定时重试用） */
    @Select("SELECT * FROM `judge_review_queue` "
            + "WHERE `status` = 'REVIEWED' AND `log_id` IS NOT NULL "
            + "AND (`curve_scored_at` IS NULL OR `elo_scored_at` IS NULL) "
            + "ORDER BY `id` LIMIT #{limit}")
    List<JudgeReviewQueueItem> findUnscored(@Param("limit") int limit);
}
