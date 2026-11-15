package com.english.ai.exercise.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.english.ai.exercise.dto.LearnedWordDateVO;
import com.english.ai.exercise.entity.UserVocabulary;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserVocabularyMapper extends BaseMapper<UserVocabulary> {

    /**
     * 已学词库：按日期分组统计词条数。
     *
     * <p>分组日 = COALESCE(mastered_at, familiar_at, first_learned_at)：
     * 复习中按首次学习日、复习完成按达成已掌握的时间、已标熟按标熟的时间。</p>
     *
     * <p>数据库 datetime 无时区，日期在 SQL 层用 DATE() 截断，
     * 前端拿到的是 yyyy-MM-dd 字符串，不得再做时区二次转换（会差 8 小时）。</p>
     */
    @Select("<script>"
            + "SELECT DATE(COALESCE(mastered_at, familiar_at, first_learned_at)) AS group_date, "
            + "COUNT(*) AS cnt "
            + "FROM user_vocabulary WHERE user_id = #{userId} "
            + "<if test='statuses != null and statuses.size() > 0'>"
            + "AND status IN "
            + "<foreach collection='statuses' item='s' open='(' separator=',' close=')'>#{s}</foreach> "
            + "</if>"
            + "AND COALESCE(mastered_at, familiar_at, first_learned_at) IS NOT NULL "
            + "GROUP BY DATE(COALESCE(mastered_at, familiar_at, first_learned_at)) "
            + "ORDER BY group_date DESC"
            + "</script>")
    List<LearnedWordDateVO> selectGroupDates(@Param("userId") Long userId,
                                             @Param("statuses") List<String> statuses);

    /**
     * 已学词库：分页取词条。
     *
     * @param groupDate 分组日（yyyy-MM-dd），为空表示不限日期
     */
    @Select("<script>"
            + "SELECT * FROM user_vocabulary WHERE user_id = #{userId} "
            + "<if test='statuses != null and statuses.size() > 0'>"
            + "AND status IN "
            + "<foreach collection='statuses' item='s' open='(' separator=',' close=')'>#{s}</foreach> "
            + "</if>"
            + "<if test='groupDate != null and groupDate.length() > 0'>"
            + "AND DATE(COALESCE(mastered_at, familiar_at, first_learned_at)) = #{groupDate} "
            + "</if>"
            + "ORDER BY COALESCE(mastered_at, familiar_at, first_learned_at) DESC, id DESC "
            + "LIMIT #{offset}, #{limit}"
            + "</script>")
    List<UserVocabulary> selectLearnedWords(@Param("userId") Long userId,
                                            @Param("statuses") List<String> statuses,
                                            @Param("groupDate") String groupDate,
                                            @Param("offset") int offset,
                                            @Param("limit") int limit);

    /**
     * 已学词库：分页总数（与 selectLearnedWords 同口径）。
     */
    @Select("<script>"
            + "SELECT COUNT(*) FROM user_vocabulary WHERE user_id = #{userId} "
            + "<if test='statuses != null and statuses.size() > 0'>"
            + "AND status IN "
            + "<foreach collection='statuses' item='s' open='(' separator=',' close=')'>#{s}</foreach> "
            + "</if>"
            + "<if test='groupDate != null and groupDate.length() > 0'>"
            + "AND DATE(COALESCE(mastered_at, familiar_at, first_learned_at)) = #{groupDate} "
            + "</if>"
            + "</script>")
    long countLearnedWords(@Param("userId") Long userId,
                           @Param("statuses") List<String> statuses,
                           @Param("groupDate") String groupDate);

    /**
     * 词汇量汇总：按状态分组计数。
     *
     * <p>标熟保持 is_mastered=0，因此 MASTERED 与 FAMILIAR 两档天然互斥不重叠。</p>
     */
    @Select("SELECT status, COUNT(*) AS cnt FROM user_vocabulary "
            + "WHERE user_id = #{userId} GROUP BY status")
    List<Map<String, Object>> countByStatus(@Param("userId") Long userId);

    /**
     * 今日待复习数：到期且未掌握且未标熟。
     */
    @Select("SELECT COUNT(*) FROM user_vocabulary "
            + "WHERE user_id = #{userId} AND is_mastered = 0 AND status <> 'FAMILIAR' "
            + "AND next_review_at IS NOT NULL AND next_review_at <= NOW()")
    int countDueReview(@Param("userId") Long userId);
}
