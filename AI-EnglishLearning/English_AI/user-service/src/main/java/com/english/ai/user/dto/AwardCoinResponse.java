package com.english.ai.user.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 发币结果
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AwardCoinResponse {

    /** 是否成功发放 */
    private Boolean awarded;

    /** 发放金额（未发放为 0） */
    private Integer amount;

    /** 发放后的余额 */
    private Integer balance;

    /** 未发放原因：DUPLICATE / DAILY_LIMIT */
    private String reason;
}
