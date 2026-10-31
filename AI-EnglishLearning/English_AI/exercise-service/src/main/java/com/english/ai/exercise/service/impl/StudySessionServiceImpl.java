package com.english.ai.exercise.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.exercise.dto.StudySessionReportRequest;
import com.english.ai.exercise.dto.StudySessionReportResponse;
import com.english.ai.exercise.entity.UserStudySession;
import com.english.ai.exercise.mapper.UserStudySessionMapper;
import com.english.ai.exercise.service.StudySessionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Clock;
import java.time.Duration;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 学习会话实现：客户端上报累计活跃秒数，服务端按会话经过时间截断，只增不减。
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class StudySessionServiceImpl implements StudySessionService {

    private static final Duration MAX_SESSION_AGE = Duration.ofHours(6);
    private static final int REPORT_TOLERANCE_SECONDS = 5;

    private final UserStudySessionMapper sessionMapper;
    private final Clock clock;

    @Override
    @Transactional
    public StudySessionReportResponse report(StudySessionReportRequest request) {
        validate(request);

        long nowMs = clock.millis();
        long startMs = request.getSessionStartedAt() != null ? request.getSessionStartedAt() : nowMs;
        long earliestMs = nowMs - MAX_SESSION_AGE.toMillis();
        startMs = Math.max(earliestMs, Math.min(startMs, nowMs));

        LocalDateTime startedAt = LocalDateTime.ofInstant(Instant.ofEpochMilli(startMs), clock.getZone());
        LocalDateTime now = LocalDateTime.ofInstant(Instant.ofEpochMilli(nowMs), clock.getZone());
        LocalDate statDate = startedAt.toLocalDate();

        long elapsedSeconds = Math.max(0, (nowMs - startMs) / 1000);
        int acceptedSeconds = (int) Math.min(request.getActiveSeconds(),
                Math.min(elapsedSeconds + REPORT_TOLERANCE_SECONDS, MAX_SESSION_AGE.toSeconds()));

        UserStudySession existing = sessionMapper.selectOne(new LambdaQueryWrapper<UserStudySession>()
                .eq(UserStudySession::getUserId, request.getUserId())
                .eq(UserStudySession::getSessionKey, request.getSessionKey()));

        if (existing == null) {
            UserStudySession session = new UserStudySession();
            session.setUserId(request.getUserId());
            session.setSessionKey(request.getSessionKey());
            session.setStatDate(statDate);
            session.setActiveSeconds(acceptedSeconds);
            session.setStartedAt(startedAt);
            session.setLastReportedAt(now);
            try {
                sessionMapper.insert(session);
            } catch (DuplicateKeyException e) {
                // 并发首次上报：转为更新
                sessionMapper.updateActiveSeconds(request.getUserId(), request.getSessionKey(),
                        acceptedSeconds, now);
            }
        } else {
            sessionMapper.updateActiveSeconds(request.getUserId(), request.getSessionKey(),
                    acceptedSeconds, now);
        }

        UserStudySession saved = sessionMapper.selectOne(new LambdaQueryWrapper<UserStudySession>()
                .eq(UserStudySession::getUserId, request.getUserId())
                .eq(UserStudySession::getSessionKey, request.getSessionKey()));
        int finalSeconds = saved != null && saved.getActiveSeconds() != null
                ? saved.getActiveSeconds()
                : acceptedSeconds;
        LocalDate finalDate = saved != null && saved.getStatDate() != null
                ? saved.getStatDate()
                : statDate;

        return StudySessionReportResponse.builder()
                .activeSeconds(finalSeconds)
                .statDate(finalDate)
                .build();
    }

    @Override
    public List<UserStudySession> listByUser(Long userId) {
        if (userId == null) {
            return List.of();
        }
        return sessionMapper.selectList(new LambdaQueryWrapper<UserStudySession>()
                .eq(UserStudySession::getUserId, userId)
                .orderByAsc(UserStudySession::getStatDate));
    }

    private void validate(StudySessionReportRequest request) {
        if (request == null || request.getUserId() == null) {
            throw new IllegalArgumentException("userId不能为空");
        }
        if (request.getSessionKey() == null || request.getSessionKey().isBlank()
                || request.getSessionKey().length() > 64) {
            throw new IllegalArgumentException("sessionKey非法");
        }
        if (request.getActiveSeconds() == null || request.getActiveSeconds() < 0) {
            throw new IllegalArgumentException("activeSeconds非法");
        }
    }
}
