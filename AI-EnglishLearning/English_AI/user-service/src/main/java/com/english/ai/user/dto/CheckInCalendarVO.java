package com.english.ai.user.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;

/**
 * 签到日历：指定日期区间内的签到记录
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CheckInCalendarVO {

    /** 今天是否已签到 */
    private Boolean todayCheckedIn;

    /** 当前连续签到天数 */
    private Integer streakDays;

    /**
     * 用户最早一条签到日期。
     * 无任何记录时为 null；前端据此把「注册/首签之前」的日期渲染为空白，
     * 而不是画成漏签（避免把从未存在的日子算成「未签到」）。
     */
    private LocalDate earliestDate;

    /** 区间内的签到记录，按日期升序；只含有记录的日期 */
    private List<CheckInRecordItem> records;
}
