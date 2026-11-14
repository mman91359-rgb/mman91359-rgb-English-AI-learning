package com.english.ai.user.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 练习组积分结算结果
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PracticeSettlementResult {

    /** 本组是否正确率达到 60% 计分门槛 */
    private boolean qualified;

    /** 本次是否实际发放积分（幂等重复请求为 false） */
    private boolean awarded;

    /** 本组正确率(0~100) */
    private double accuracy;

    /** 本组总题数 */
    private int totalCount;

    /** 本组答对题数 */
    private int correctCount;

    /** 扣除每日上限前应得积分 */
    private int rawPoints;

    /** 本次实发积分 */
    private int points;

    /** 是否触发每日上限（应得 > 实发） */
    private boolean dailyLimitReached;

    /** 结算后累计积分 */
    private int totalPoints;

    /** 当前称号 */
    private String title;

    /** 下一称号；已封顶时为 null */
    private String nextTitle;

    /** 当前称号区间下界 */
    private int titleFloor;

    /** 当前称号区间上界 */
    private int titleCeil;

    /** 当前称号内进度百分比 */
    private int titleProgress;
}
