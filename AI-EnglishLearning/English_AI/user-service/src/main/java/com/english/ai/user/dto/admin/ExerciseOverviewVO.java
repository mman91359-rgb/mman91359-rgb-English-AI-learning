package com.english.ai.user.dto.admin;

import lombok.Data;

/**
 * 学习统计概览（exercise-service 返回）。
 */
@Data
public class ExerciseOverviewVO {

    private Long questionTotal;
    private Long pendingReview;
    private Long approvedTotal;
    private Long rejectedTotal;
    private Long answeredLast30d;
    private Long todayAnswered;
    private Long activeUsersToday;
    private Long activeUsers7d;
    private Long totalStudySeconds;
    private Integer dataWindowDays;
}
