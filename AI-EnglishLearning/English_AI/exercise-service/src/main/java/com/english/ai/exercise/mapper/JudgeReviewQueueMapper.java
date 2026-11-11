package com.english.ai.exercise.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.english.ai.exercise.entity.JudgeReviewQueueItem;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface JudgeReviewQueueMapper extends BaseMapper<JudgeReviewQueueItem> {

    /**
     * 幂等入队：依赖 uk_question_user_answer，重复入队时忽略并返回 0。
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
}
