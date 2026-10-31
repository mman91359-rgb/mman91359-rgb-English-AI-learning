package com.english.ai.exercise.service;

import com.english.ai.exercise.dto.StudySessionReportRequest;
import com.english.ai.exercise.dto.StudySessionReportResponse;
import com.english.ai.exercise.entity.UserStudySession;
import com.english.ai.exercise.mapper.UserStudySessionMapper;
import com.english.ai.exercise.service.impl.StudySessionServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.dao.DuplicateKeyException;

import java.time.Clock;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

/**
 * 学习会话上报单元测试
 */
@ExtendWith(MockitoExtension.class)
class StudySessionServiceImplTest {

    private static final LocalDate TODAY = LocalDate.of(2026, 10, 24);

    @Mock
    private UserStudySessionMapper sessionMapper;

    private Clock clock;
    private StudySessionServiceImpl service;

    @BeforeEach
    void setUp() {
        clock = Clock.fixed(Instant.parse("2026-10-24T04:00:00Z"), ZoneId.of("Asia/Shanghai"));
        service = new StudySessionServiceImpl(sessionMapper, clock);
    }

    @Test
    void firstReportCreatesSession() {
        long now = clock.millis();
        StudySessionReportRequest request = request(30, now - 30_000);
        when(sessionMapper.selectOne(any())).thenReturn(null, saved(30));
        when(sessionMapper.insert(any())).thenReturn(1);

        StudySessionReportResponse response = service.report(request);

        assertEquals(30, response.getActiveSeconds());
        assertEquals(TODAY, response.getStatDate());
        verify(sessionMapper).insert(any());
    }

    @Test
    void reportedSecondsAreClampedByElapsedTime() {
        long now = clock.millis();
        StudySessionReportRequest request = request(100, now - 10_000);
        when(sessionMapper.selectOne(any())).thenReturn(null, saved(15));
        when(sessionMapper.insert(any())).thenReturn(1);

        StudySessionReportResponse response = service.report(request);

        assertEquals(15, response.getActiveSeconds());
    }

    @Test
    void smallerReportDoesNotReduceActiveSeconds() {
        long now = clock.millis();
        StudySessionReportRequest request = request(10, now - 60_000);
        when(sessionMapper.selectOne(any())).thenReturn(saved(30), saved(30));

        StudySessionReportResponse response = service.report(request);

        assertEquals(30, response.getActiveSeconds());
        verify(sessionMapper).updateActiveSeconds(eq(1L), eq("session-1"), eq(10), any());
    }

    @Test
    void largerReportIncreasesActiveSeconds() {
        long now = clock.millis();
        StudySessionReportRequest request = request(45, now - 60_000);
        when(sessionMapper.selectOne(any())).thenReturn(saved(30), saved(45));

        StudySessionReportResponse response = service.report(request);

        assertEquals(45, response.getActiveSeconds());
        verify(sessionMapper).updateActiveSeconds(eq(1L), eq("session-1"), eq(45), any());
    }

    @Test
    void sessionStartIsClampedToSixHours() {
        long now = clock.millis();
        StudySessionReportRequest request = request(30_000, now - 7 * 60 * 60 * 1000L);
        when(sessionMapper.selectOne(any())).thenReturn(null, saved(21_600));
        when(sessionMapper.insert(any())).thenReturn(1);

        StudySessionReportResponse response = service.report(request);

        assertEquals(21_600, response.getActiveSeconds());
    }

    @Test
    void duplicateInsertFallsBackToUpdate() {
        long now = clock.millis();
        StudySessionReportRequest request = request(30, now - 30_000);
        when(sessionMapper.selectOne(any())).thenReturn(null, saved(30));
        when(sessionMapper.insert(any())).thenThrow(new DuplicateKeyException("duplicate"));

        StudySessionReportResponse response = service.report(request);

        assertEquals(30, response.getActiveSeconds());
        verify(sessionMapper).updateActiveSeconds(eq(1L), eq("session-1"), eq(30), any());
    }

    @Test
    void invalidRequestsAreRejected() {
        StudySessionReportRequest nullKey = request(10, clock.millis());
        nullKey.setSessionKey(null);
        assertThrows(IllegalArgumentException.class, () -> service.report(nullKey));

        StudySessionReportRequest negative = request(-1, clock.millis());
        assertThrows(IllegalArgumentException.class, () -> service.report(negative));

        StudySessionReportRequest longKey = request(10, clock.millis());
        longKey.setSessionKey("x".repeat(65));
        assertThrows(IllegalArgumentException.class, () -> service.report(longKey));

        verify(sessionMapper, times(0)).insert(any());
        verify(sessionMapper, times(0)).updateActiveSeconds(any(), anyString(), anyInt(), any());
    }

    private StudySessionReportRequest request(int activeSeconds, long sessionStartedAt) {
        StudySessionReportRequest request = new StudySessionReportRequest();
        request.setUserId(1L);
        request.setSessionKey("session-1");
        request.setActiveSeconds(activeSeconds);
        request.setSessionStartedAt(sessionStartedAt);
        return request;
    }

    private UserStudySession saved(int activeSeconds) {
        UserStudySession session = new UserStudySession();
        session.setUserId(1L);
        session.setSessionKey("session-1");
        session.setStatDate(TODAY);
        session.setActiveSeconds(activeSeconds);
        session.setStartedAt(LocalDateTime.of(TODAY, java.time.LocalTime.of(11, 59)));
        session.setLastReportedAt(LocalDateTime.of(TODAY, java.time.LocalTime.of(12, 0)));
        return session;
    }
}
