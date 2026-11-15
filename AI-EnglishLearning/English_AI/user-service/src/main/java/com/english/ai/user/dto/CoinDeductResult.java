package com.english.ai.user.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 金币扣减结果
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CoinDeductResult {

    /** 变动值，负数 */
    private Integer amount;

    /** 扣减后的余额 */
    private Integer balance;
}
