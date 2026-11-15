package com.english.ai.user.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

/**
 * 金币账户概览 + 一页流水
 *
 * 分页用 keyset（游标 = 上一页最后一条流水ID），不用 offset：
 * 流水只增不改，id 单调递增，翻页期间新增的流水不会把旧记录挤到下一页。
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CoinLedgerVO {

    private Long userId;

    /** 当前余额 */
    private Integer balance;

    /** 累计获得 */
    private Integer totalEarned;

    /** 累计消耗（amount&lt;0 的绝对值之和；补签是目前的消耗出口） */
    private Integer totalSpent;

    /** 本月消耗（按自然月统计，口径同上） */
    private Integer monthSpent;

    /** 当前页流水，按 id 倒序（最新在前） */
    private List<CoinTransactionVO> items;

    /** 各业务类型的流水总数（全量，不受当前筛选影响），供筛选胶囊显示计数 */
    private Map<String, Integer> bizTypeCounts;

    /** 下一页游标；hasMore 为 false 时返回 null */
    private Long nextCursor;

    /** 是否还有下一页 */
    private Boolean hasMore;
}
