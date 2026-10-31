package com.english.ai.exercise.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
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
