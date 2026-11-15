package com.english.ai.user.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 金币流水条目（只读视图）
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CoinTransactionVO {

    /** 流水ID，同时是游标分页的排序键 */
    private Long id;

    /** 变动值：正数为获得，负数为消耗 */
    private Integer amount;

    /** 业务类型：CHECK_IN / CHECK_IN_MILESTONE / VOCAB_GROUP */
    private String bizType;

    /** 描述文案，由发币方写入（中文硬编码，前端直接展示） */
    private String description;

    /** 变动后余额；极端并发下回填失败时可能为 null */
    private Integer balanceAfter;

    /** 流水发生时间（Asia/Shanghai） */
    private LocalDateTime createdAt;
}
