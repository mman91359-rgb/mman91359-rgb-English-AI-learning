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

    // ---------------------------------------------------------------------
    // 补记协议（curve / elo 各一套，全部用 DB 的 NOW() 比较时间）：
    //   抢占 claimXLease → 请求 → 成功 markXDone / 失败 releaseXLease
    // *_scored_at 非空 = 已完成，永不再补；*_lease_until 未到期 = 别人正在做。
    // ---------------------------------------------------------------------

    /** 抢占遗忘曲线补记租约（5 分钟）；返回 0 表示已完成或别人正在做 */
    @Update("UPDATE `judge_review_queue` "
            + "SET `curve_lease_until` = NOW() + INTERVAL 5 MINUTE "
            + "WHERE `id` = #{id} AND `curve_scored_at` IS NULL "
            + "AND (`curve_lease_until` IS NULL OR `curve_lease_until` < NOW())")
    int claimCurveLease(@Param("id") Long id);

    /** 补记成功：写完成时间并释放租约 */
    @Update("UPDATE `judge_review_queue` "
            + "SET `curve_scored_at` = NOW(), `curve_lease_until` = NULL "
            + "WHERE `id` = #{id} AND `curve_scored_at` IS NULL")
    int markCurveDone(@Param("id") Long id);

    /** 补记失败：只释放租约，完成时间保持 NULL 等待重试 */
    @Update("UPDATE `judge_review_queue` SET `curve_lease_until` = NULL WHERE `id` = #{id}")
    int releaseCurveLease(@Param("id") Long id);

    /** 抢占 ELO 补记租约（5 分钟） */
    @Update("UPDATE `judge_review_queue` "
            + "SET `elo_lease_until` = NOW() + INTERVAL 5 MINUTE "
            + "WHERE `id` = #{id} AND `elo_scored_at` IS NULL "
            + "AND (`elo_lease_until` IS NULL OR `elo_lease_until` < NOW())")
    int claimEloLease(@Param("id") Long id);

    /** ELO 补记成功 */
    @Update("UPDATE `judge_review_queue` "
            + "SET `elo_scored_at` = NOW(), `elo_lease_until` = NULL "
            + "WHERE `id` = #{id} AND `elo_scored_at` IS NULL")
    int markEloDone(@Param("id") Long id);

    /** ELO 补记失败 */
    @Update("UPDATE `judge_review_queue` SET `elo_lease_until` = NULL WHERE `id` = #{id}")
    int releaseEloLease(@Param("id") Long id);

    /**
     * 已复核但还没补记完的队列行（定时重试用）。
     *
     * <p>只有「未完成且没有有效租约」才算待补；缺 module_type / difficulty_level
     * 的行无法补记，直接排除，避免每轮刷 error 并占用批次名额。</p>
     */
    @Select("SELECT * FROM `judge_review_queue` "
            + "WHERE `status` = 'REVIEWED' AND `log_id` IS NOT NULL "
            + "AND `module_type` IS NOT NULL AND `difficulty_level` IS NOT NULL "
            + "AND ((`curve_scored_at` IS NULL "
            + "      AND (`curve_lease_until` IS NULL OR `curve_lease_until` < NOW())) "
            + "  OR (`elo_scored_at` IS NULL "
            + "      AND (`elo_lease_until` IS NULL OR `elo_lease_until` < NOW()))) "
            + "ORDER BY `id` LIMIT #{limit}")
    List<JudgeReviewQueueItem> findUnscored(@Param("limit") int limit);
}
