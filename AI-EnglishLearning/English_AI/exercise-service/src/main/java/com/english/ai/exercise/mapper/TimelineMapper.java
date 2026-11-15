package com.english.ai.exercise.mapper;

import com.english.ai.exercise.dto.TimelineItemVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 统一学习时间线查询 — 合并答题 / 单词事件 / 写作三类记录。
 *
 * <p>为什么放一个 Mapper 而不是三次查询在 Java 合并：
 * 只有这样 count 与分页才是同一个口径，否则「全部」tab 的 total 只能是估算。</p>
 */
@Mapper
public interface TimelineMapper {

    /**
     * 分页查询统一时间线（按时间倒序）。
     *
     * <p>注意：同库内 collation 不统一（user_exercise_log/writing_essay 是 utf8mb4_unicode_ci，
     * user_vocabulary/word_dictionary 是 utf8mb4_0900_ai_ci），UNION 里字符串列必须显式
     * COLLATE，否则报 1271 Illegal mix of collations。</p>
     *
     * @param startTime 起始时间（含），可空
     * @param endTime   结束时间（不含），可空
     */
    @Select("<script>"
            + "SELECT * FROM ("
            + "  SELECT 'ANSWER' COLLATE utf8mb4_unicode_ci AS source, l.id AS id, l.created_at AS created_at, "
            + "         l.module_type AS module_type, l.is_correct AS is_correct, "
            + "         l.question_id AS question_id, "
            + "         CAST(NULL AS CHAR) COLLATE utf8mb4_unicode_ci AS word, "
            + "         CAST(NULL AS CHAR) COLLATE utf8mb4_unicode_ci AS event_type, "
            + "         CAST(NULL AS CHAR) COLLATE utf8mb4_unicode_ci AS result, "
            + "         CAST(NULL AS CHAR) COLLATE utf8mb4_unicode_ci AS book_code, "
            + "         CAST(NULL AS CHAR) COLLATE utf8mb4_unicode_ci AS topic_title, "
            + "         CAST(NULL AS DECIMAL(5,1)) AS weighted_score "
            + "  FROM user_exercise_log l WHERE l.user_id = #{userId}"
            + "  <if test='startTime != null'> AND l.created_at &gt;= #{startTime}</if>"
            + "  <if test='endTime != null'> AND l.created_at &lt; #{endTime}</if>"
            + "  UNION ALL "
            + "  SELECT 'WORD' COLLATE utf8mb4_unicode_ci, w.id, w.created_at, NULL, NULL, NULL, "
            + "         w.word COLLATE utf8mb4_unicode_ci, "
            + "         w.event_type COLLATE utf8mb4_unicode_ci, "
            + "         w.result COLLATE utf8mb4_unicode_ci, "
            + "         w.book_code COLLATE utf8mb4_unicode_ci, NULL, NULL "
            + "  FROM user_word_learn_log w WHERE w.user_id = #{userId}"
            + "  <if test='startTime != null'> AND w.created_at &gt;= #{startTime}</if>"
            + "  <if test='endTime != null'> AND w.created_at &lt; #{endTime}</if>"
            + "  UNION ALL "
            + "  SELECT 'WRITING' COLLATE utf8mb4_unicode_ci, e.id, e.created_at, NULL, NULL, NULL, "
            + "         NULL, NULL, NULL, NULL, "
            + "         e.topic_title COLLATE utf8mb4_unicode_ci, e.weighted_score "
            + "  FROM writing_essay e WHERE e.user_id = #{userId}"
            + "  <if test='startTime != null'> AND e.created_at &gt;= #{startTime}</if>"
            + "  <if test='endTime != null'> AND e.created_at &lt; #{endTime}</if>"
            + ") t ORDER BY t.created_at DESC LIMIT #{offset}, #{size}"
            + "</script>")
    List<TimelineItemVO> selectTimeline(@Param("userId") Long userId,
                                        @Param("startTime") String startTime,
                                        @Param("endTime") String endTime,
                                        @Param("offset") int offset,
                                        @Param("size") int size);

    /** 统计统一时间线总数（与 selectTimeline 同口径） */
    @Select("<script>"
            + "SELECT ("
            + "  (SELECT COUNT(*) FROM user_exercise_log l WHERE l.user_id = #{userId}"
            + "    <if test='startTime != null'> AND l.created_at &gt;= #{startTime}</if>"
            + "    <if test='endTime != null'> AND l.created_at &lt; #{endTime}</if>)"
            + "  + (SELECT COUNT(*) FROM user_word_learn_log w WHERE w.user_id = #{userId}"
            + "    <if test='startTime != null'> AND w.created_at &gt;= #{startTime}</if>"
            + "    <if test='endTime != null'> AND w.created_at &lt; #{endTime}</if>)"
            + "  + (SELECT COUNT(*) FROM writing_essay e WHERE e.user_id = #{userId}"
            + "    <if test='startTime != null'> AND e.created_at &gt;= #{startTime}</if>"
            + "    <if test='endTime != null'> AND e.created_at &lt; #{endTime}</if>)"
            + ")"
            + "</script>")
    long countTimeline(@Param("userId") Long userId,
                       @Param("startTime") String startTime,
                       @Param("endTime") String endTime);
}
