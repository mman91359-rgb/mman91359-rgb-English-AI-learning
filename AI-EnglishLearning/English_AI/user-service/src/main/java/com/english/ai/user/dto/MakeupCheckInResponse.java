package com.english.ai.user.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

/**
 * 补签结果
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MakeupCheckInResponse {

    /** 补签日期 */
    private LocalDate date;

    /** 本次消耗金币 */
    private Integer costCoins;

    /** 扣费后的金币余额 */
    private Integer balance;

    /** 重算后的最新连续天数 */
    private Integer streakDays;

    /** 本次被重算连续天数的签到记录条数 */
    private Integer recalculatedCount;
}
