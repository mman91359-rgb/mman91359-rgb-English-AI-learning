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

    /**
     * 抢占遗忘曲线补记标记；返回 0 表示已被其他请求抢占（且仍在租约内）。
     *
     * <p>租约 5 分钟：claim 后进程若被拉掉，标记会停在那里；超过租约即视为"从没抢过"，
     * 由下一次扫描重新抢占，避免永久漏记。租约必须远大于单次 HTTP 时长（当前 2s 超时）。</p>
     */
    @Update("UPDATE `judge_review_queue` SET `curve_scored_at` = NOW() "
            + "WHERE `id` = #{id} AND (`curve_scored_at` IS NULL "
            + "OR `curve_scored_at` < NOW() - INTERVAL 5 MINUTE)")
    int claimCurveScored(@Param("id") Long id);

    /** 补记失败时清回标记，等待重试 */
    @Update("UPDATE `judge_review_queue` SET `curve_scored_at` = NULL WHERE `id` = #{id}")
    int clearCurveScored(@Param("id") Long id);

    /** 抢占 ELO 补记标记（同样带 5 分钟租约） */
    @Update("UPDATE `judge_review_queue` SET `elo_scored_at` = NOW() "
            + "WHERE `id` = #{id} AND (`elo_scored_at` IS NULL "
            + "OR `elo_scored_at` < NOW() - INTERVAL 5 MINUTE)")
    int claimEloScored(@Param("id") Long id);

    /** 补记失败时清回标记 */
    @Update("UPDATE `judge_review_queue` SET `elo_scored_at` = NULL WHERE `id` = #{id}")
    int clearEloScored(@Param("id") Long id);

    /**
     * 已复核但还没补记完的队列行（定时重试用）。
     *
     * <p>标记为空或已超过 5 分钟租约都算"没补完"；缺少 module_type / difficulty_level
     * 的行无法补记，直接排除，避免每轮刷 error 并占用批次名额。</p>
     */
    @Select("SELECT * FROM `judge_review_queue` "
            + "WHERE `status` = 'REVIEWED' AND `log_id` IS NOT NULL "
            + "AND `module_type` IS NOT NULL AND `difficulty_level` IS NOT NULL "
            + "AND ((`curve_scored_at` IS NULL OR `curve_scored_at` < NOW() - INTERVAL 5 MINUTE) "
            + "  OR (`elo_scored_at` IS NULL OR `elo_scored_at` < NOW() - INTERVAL 5 MINUTE)) "
            + "ORDER BY `id` LIMIT #{limit}")
    List<JudgeReviewQueueItem> findUnscored(@Param("limit") int limit);
}
