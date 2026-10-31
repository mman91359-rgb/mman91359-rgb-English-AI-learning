package com.english.ai.exercise.controller;

import com.english.ai.common.Result;
import com.english.ai.exercise.dto.ExerciseOverviewVO;
import com.english.ai.exercise.dto.UserExerciseStats;
import com.english.ai.exercise.service.AdminLearningStatsService;
import com.english.ai.exercise.service.ExerciseService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 服务间管理端统计接口（/internal/** 由 InternalAuthInterceptor 校验）。
 */
@RestController
@RequestMapping("/internal/admin")
@RequiredArgsConstructor
public class InternalAdminController {

    private final AdminLearningStatsService statsService;
    private final ExerciseService exerciseService;

    @GetMapping("/overview")
    public Result<ExerciseOverviewVO> overview() {
        return Result.success(statsService.overview());
    }

    @GetMapping("/user-stats/{userId}")
    public Result<UserExerciseStats> userStats(@PathVariable Long userId) {
        return Result.success(exerciseService.getUserStats(userId));
    }
}
