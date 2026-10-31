package com.english.ai.user.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 金币信息响应：余额、签到状态与奖励规则
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CoinInfoResponse {

    private Long userId;

    private Integer balance;

    private Integer totalEarned;

    /** 今天是否已签到 */
    private Boolean todayCheckedIn;

    /** 当前连续签到天数（今天未签但昨天签过时仍保留） */
    private Integer checkInStreak;

    /** 如果现在签到可获得的预览奖励（已签到则为 0） */
    private Integer previewSignInReward;

    /** 完成一组单词的奖励 */
    private Integer vocabGroupReward;

    /** 每日词汇组奖励上限 */
    private Integer vocabGroupDailyLimit;

    /** 今日已发放的词汇组奖励次数 */
    private Integer vocabGroupTodayCount;
}
