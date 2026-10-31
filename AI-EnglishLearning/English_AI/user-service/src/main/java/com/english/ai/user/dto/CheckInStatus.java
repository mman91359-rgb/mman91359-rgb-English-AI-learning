package com.english.ai.user.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 签到状态与下一次签到奖励预览
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CheckInStatus {

    /** 今天是否已签到 */
    private Boolean todayCheckedIn;

    /** 当前连续签到天数 */
    private Integer streakDays;

    /** 如果现在签到，连续天数将变为 */
    private Integer nextStreakDays;

    /** 如果现在签到，总奖励 */
    private Integer previewReward;

    private Integer previewBaseReward;

    private Integer previewStreakBonus;

    private Integer previewMilestoneReward;
}
