package com.english.ai.user.dto.admin;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder
public class AdminOverviewVO {

    private LocalDateTime generatedAt;
    private boolean exerciseDegraded;
    private long totalUsers;
    private long enabledUsers;
    private long disabledUsers;
    private long newUsersToday;
    private long newUsers7d;
    private long adminUsers;
    private long totalCoinBalance;
    private long todayCheckIns;
    private long activeNotices;
    private long activeActivities;
    private ExerciseOverviewVO exercise;
}
