package com.english.ai.user.service;

import com.english.ai.user.dto.CheckInResponse;
import com.english.ai.user.dto.CheckInStatus;

/**
 * 每日签到服务
 */
public interface CheckInService {

    /** 查询签到状态与下一次奖励预览 */
    CheckInStatus getStatus(Long userId);

    /** 执行签到 */
    CheckInResponse checkIn(Long userId);
}
