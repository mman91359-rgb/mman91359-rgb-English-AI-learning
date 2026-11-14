package com.english.ai.user.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

/**
 * 单日签到记录（签到日历用）
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CheckInRecordItem {

    /** 签到日期 yyyy-MM-dd */
    private LocalDate date;

    /** 当日获得金币（含连续奖励与里程碑） */
    private Integer rewardCoins;

    /** 签到时的连续天数 */
    private Integer streakDays;
}
