package com.english.ai.exercise.dto;

import lombok.Data;

/**
 * 练习组结算结果（回传前端）。
 *
 * <p>字段与 user-service 的 PracticeSettlementResult 一一对应，
 * exercise-service 只做透传，不重复实现计分规则。</p>
 */
@Data
public class PracticeSettleResponse {

    /** 本组是否正确率达到 60% 计分门槛 */
    private Boolean qualified;

    /** 本次是否实际发放积分（幂等重复请求为 false） */
    private Boolean awarded;

    /** 本组正确率(0~100) */
    private Double accuracy;

    /** 本组总题数 */
    private Integer totalCount;

    /** 本组答对题数 */
    private Integer correctCount;

    /** 扣除每日上限前应得积分 */
    private Integer rawPoints;

    /** 本次实发积分 */
    private Integer points;

    /** 是否触发每日上限 */
    private Boolean dailyLimitReached;

    /** 结算后累计积分 */
    private Integer totalPoints;

    /** 当前称号 */
    private String title;

    /** 下一称号；已封顶时为 null */
    private String nextTitle;

    /** 当前称号区间下界 */
    private Integer titleFloor;

    /** 当前称号区间上界 */
    private Integer titleCeil;

    /** 当前称号内进度百分比 */
    private Integer titleProgress;

    /** 未结算原因：NO_RECORD / SETTLE_FAILED；正常结算为 null */
    private String reason;
}
