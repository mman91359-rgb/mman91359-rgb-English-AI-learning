package com.english.ai.exercise.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.english.ai.exercise.entity.QuestionBuggyPath;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface QuestionBuggyPathMapper extends BaseMapper<QuestionBuggyPath> {

    @Select("SELECT * FROM question_buggy_path WHERE question_id = #{questionId} " +
            "AND wrong_answer = #{wrongAnswer} LIMIT 1")
    QuestionBuggyPath findByQuestionAndAnswer(@Param("questionId") Long questionId,
                                               @Param("wrongAnswer") String wrongAnswer);

    /**
     * 取某题的全部错因行，用于"查询侧归一化"兜底匹配历史脏数据。
     * 单题错因行通常个位数，LIMIT 200 只作防御上限。
     */
    @Select("SELECT * FROM question_buggy_path WHERE question_id = #{questionId} LIMIT 200")
    List<QuestionBuggyPath> findByQuestionId(@Param("questionId") Long questionId);
}