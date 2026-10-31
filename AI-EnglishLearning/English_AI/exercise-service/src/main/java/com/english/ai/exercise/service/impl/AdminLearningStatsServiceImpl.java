package com.english.ai.exercise.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.exercise.dto.ExerciseOverviewVO;
import com.english.ai.exercise.entity.QuestionPending;
import com.english.ai.exercise.entity.UserExerciseLog;
import com.english.ai.exercise.mapper.QuestionInfoMapper;
import com.english.ai.exercise.mapper.QuestionPendingMapper;
import com.english.ai.exercise.mapper.UserExerciseLogMapper;
import com.english.ai.exercise.mapper.UserStudySessionMapper;
import com.english.ai.exercise.service.AdminLearningStatsService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class AdminLearningStatsServiceImpl implements AdminLearningStatsService {

    private static final int WINDOW_DAYS = 30;

    private final QuestionInfoMapper questionInfoMapper;
    private final QuestionPendingMapper pendingMapper;
    private final UserExerciseLogMapper exerciseLogMapper;
    private final UserStudySessionMapper studySessionMapper;

    @Override
    public ExerciseOverviewVO overview() {
        LocalDate today = LocalDate.now();
        LocalDateTime todayStart = today.atStartOfDay();
        LocalDateTime windowStart = todayStart.minusDays(WINDOW_DAYS);

        Long questionTotal = questionInfoMapper.selectCount(new LambdaQueryWrapper<>());
        Long pending = pendingMapper.selectCount(new LambdaQueryWrapper<QuestionPending>()
                .eq(QuestionPending::getStatus, "PENDING"));
        Long approved = pendingMapper.selectCount(new LambdaQueryWrapper<QuestionPending>()
                .eq(QuestionPending::getStatus, "APPROVED"));
        Long rejected = pendingMapper.selectCount(new LambdaQueryWrapper<QuestionPending>()
                .eq(QuestionPending::getStatus, "REJECTED"));
        Long answeredLast30d = exerciseLogMapper.selectCount(new LambdaQueryWrapper<UserExerciseLog>()
                .ge(UserExerciseLog::getCreatedAt, windowStart));
        Long todayAnswered = exerciseLogMapper.selectCount(new LambdaQueryWrapper<UserExerciseLog>()
                .ge(UserExerciseLog::getCreatedAt, todayStart));
        Long activeToday = studySessionMapper.countActiveUsersSince(today);
        Long active7d = studySessionMapper.countActiveUsersSince(today.minusDays(6));
        Long studySeconds = studySessionMapper.sumActiveSeconds();

        return ExerciseOverviewVO.builder()
                .questionTotal(zero(questionTotal))
                .pendingReview(zero(pending))
                .approvedTotal(zero(approved))
                .rejectedTotal(zero(rejected))
                .answeredLast30d(zero(answeredLast30d))
                .todayAnswered(zero(todayAnswered))
                .activeUsersToday(zero(activeToday))
                .activeUsers7d(zero(active7d))
                .totalStudySeconds(zero(studySeconds))
                .dataWindowDays(WINDOW_DAYS)
                .build();
    }

    private Long zero(Long value) {
        return value == null ? 0L : value;
    }
}
