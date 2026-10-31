package com.english.ai.exercise.controller;

import com.english.ai.common.Result;
import com.english.ai.exercise.dto.ExerciseOverviewVO;
import com.english.ai.exercise.service.AdminLearningStatsService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/learning-stats")
@RequiredArgsConstructor
public class AdminLearningStatsController {

    private final AdminLearningStatsService statsService;

    @GetMapping("/overview")
    public Result<ExerciseOverviewVO> overview() {
        return Result.success(statsService.overview());
    }
}
