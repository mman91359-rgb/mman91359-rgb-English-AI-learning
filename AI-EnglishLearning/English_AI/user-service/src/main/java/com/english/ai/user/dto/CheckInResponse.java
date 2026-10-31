package com.english.ai.user.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 签到结果
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CheckInResponse {

    /** 今天之前已经签过到 */
    private Boolean alreadyCheckedIn;

    /** 本次签到总奖励 */
    private Integer reward;

    private Integer baseReward;

    private Integer streakBonus;

    private Integer milestoneReward;

    /** 签到后的金币余额 */
    private Integer balance;

    /** 签到后的连续天数 */
    private Integer streakDays;
}
