package com.english.ai.user.service;

import com.english.ai.user.dto.CheckInCalendarVO;
import com.english.ai.user.dto.CheckInResponse;
import com.english.ai.user.dto.CheckInStatus;
import com.english.ai.user.dto.MakeupCheckInResponse;

import java.time.LocalDate;

/**
 * 每日签到服务
 */
public interface CheckInService {

    /** 查询签到状态与下一次奖励预览 */
    CheckInStatus getStatus(Long userId);

    /** 执行签到 */
    CheckInResponse checkIn(Long userId);

    /**
     * 金币补签：扣费、写入补签记录、按日期顺序重算连续天数，三步在同一事务内完成。
     * 补签不发放签到奖励金币，也不补发里程碑奖励。
     */
    MakeupCheckInResponse makeupCheckIn(Long userId, LocalDate date);

    /**
     * 查询日期区间内的签到记录（签到日历用）。
     * 只读，不写库；区间由调用方保证 from ≤ to。
     */
    CheckInCalendarVO listRecords(Long userId, LocalDate from, LocalDate to);
}
