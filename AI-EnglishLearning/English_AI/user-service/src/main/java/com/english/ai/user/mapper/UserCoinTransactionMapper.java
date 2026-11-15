package com.english.ai.user.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.english.ai.user.entity.UserCoinTransaction;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

/**
 * 金币流水 Mapper
 */
public interface UserCoinTransactionMapper extends BaseMapper<UserCoinTransaction> {

    /**
     * 回填流水发生后的余额
     */
    @Update("UPDATE user_coin_transaction SET balance_after = #{balance} WHERE id = #{id}")
    int updateBalanceAfter(@Param("id") Long id, @Param("balance") int balance);

    /**
     * keyset 分页：按 id 倒序取一页
     * cursor 为上一页最后一条 id，为 null 时从最新一条开始；
     * bizType 为 null 时不加类型条件，否则按类型过滤（参数绑定，不拼 SQL）
     */
    @Select("""
            SELECT id, user_id, amount, biz_type, biz_key, description, balance_after, created_at
            FROM user_coin_transaction
            WHERE user_id = #{userId}
              AND (#{cursor} IS NULL OR id < #{cursor})
              AND (#{bizType} IS NULL OR biz_type = #{bizType})
            ORDER BY id DESC
            LIMIT #{limit}
            """)
    List<UserCoinTransaction> selectPageByUser(@Param("userId") Long userId,
                                               @Param("cursor") Long cursor,
                                               @Param("limit") int limit,
                                               @Param("bizType") String bizType);

    /**
     * 按业务类型统计全量流水笔数，供筛选胶囊显示 (n)。
     * 不受当前筛选影响，只按 userId 分组。
     */
    @Select("""
            SELECT biz_type, COUNT(*) AS cnt
            FROM user_coin_transaction
            WHERE user_id = #{userId}
            GROUP BY biz_type
            """)
    List<Map<String, Object>> countGroupByBizType(@Param("userId") Long userId);

    /**
     * 消耗合计（amount &lt; 0 的绝对值之和）
     * from 为 null 时统计全部历史，否则统计 from 之后
     */
    @Select("""
            SELECT COALESCE(SUM(-amount), 0)
            FROM user_coin_transaction
            WHERE user_id = #{userId}
              AND amount < 0
              AND (#{from} IS NULL OR created_at >= #{from})
            """)
    int sumDebit(@Param("userId") Long userId, @Param("from") LocalDateTime from);
}
