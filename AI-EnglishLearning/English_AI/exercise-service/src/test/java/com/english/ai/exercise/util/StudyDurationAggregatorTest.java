package com.english.ai.exercise.util;

import com.english.ai.exercise.entity.UserStudySession;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Year;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * 学习时长聚合单元测试
 */
class StudyDurationAggregatorTest {

    private static final LocalDate TODAY = LocalDate.of(2026, 10, 24);

    @Test
    void totalsAndTodaySeconds() {
        List<UserStudySession> sessions = List.of(
                session(LocalDate.of(2026, 10, 23), 3600, 10),
                session(TODAY, 1800, 11),
                session(LocalDate.of(2025, 12, 31), 600, 9));

        assertEquals(6000, StudyDurationAggregator.totalSeconds(sessions));
        assertEquals(1800, StudyDurationAggregator.todaySeconds(sessions, TODAY));
    }

    @Test
    void yearlyMinutesUseSessionDate() {
        List<UserStudySession> sessions = List.of(
                session(TODAY, 1800, 11),
                session(LocalDate.of(2025, 12, 31), 600, 9));

        List<Integer> minutes = StudyDurationAggregator.yearlyMinutes(sessions, 2026);

        assertEquals(Year.of(2026).length(), minutes.size());
        int index = TODAY.getDayOfYear() - 1;
        assertEquals(30, minutes.get(index));
    }

    @Test
    void recentWeekMinutesFollowMondayToSunday() {
        List<UserStudySession> sessions = List.of(
                session(LocalDate.of(2026, 10, 23), 3600, 10),
                session(TODAY, 1800, 11));

        List<Integer> minutes = StudyDurationAggregator.recentWeekMinutes(sessions, TODAY);
        LocalDate monday = TODAY.minusDays(TODAY.getDayOfWeek().getValue() - 1L);

        assertEquals(7, minutes.size());
        assertEquals(60, minutes.get((int) ChronoUnit.DAYS.between(monday, LocalDate.of(2026, 10, 23))));
        assertEquals(30, minutes.get((int) ChronoUnit.DAYS.between(monday, TODAY)));
    }

    @Test
    void hourlyMinutesGroupBySessionStartHour() {
        List<UserStudySession> sessions = List.of(
                session(TODAY, 3600, 10),
                session(TODAY, 1800, 11));

        List<Integer> minutes = StudyDurationAggregator.hourlyMinutes(sessions);

        assertEquals(24, minutes.size());
        assertEquals(60, minutes.get(10));
        assertEquals(30, minutes.get(11));
        assertEquals(0, minutes.get(12));
    }

    @Test
    void last7DaysMinutesAreRollingAndEndToday() {
        List<UserStudySession> sessions = List.of(
                session(TODAY.minusDays(6), 600, 9),
                session(TODAY.minusDays(1), 1200, 10),
                session(TODAY, 1800, 11),
                session(TODAY.minusDays(7), 600, 9));

        List<Integer> minutes = StudyDurationAggregator.last7DaysMinutes(sessions, TODAY);
        List<String> labels = StudyDurationAggregator.last7DaysLabels(TODAY);

        assertEquals(7, minutes.size());
        assertEquals(10, minutes.get(0));
        assertEquals(20, minutes.get(5));
        assertEquals(30, minutes.get(6));
        assertEquals(List.of("10-18", "10-19", "10-20", "10-21", "10-22", "10-23", "10-24"), labels);
    }

    @Test
    void activeDaysUseUnionOfSessionAndLogDates() {
        Set<LocalDate> sessionDates = Set.of(TODAY, TODAY.minusDays(1), LocalDate.of(2025, 12, 31));
        Set<LocalDate> logDates = Set.of(TODAY, TODAY.minusDays(2));

        assertEquals(4, StudyDurationAggregator.activeDays(sessionDates, logDates));
    }

    private UserStudySession session(LocalDate date, int seconds, int hour) {
        UserStudySession session = new UserStudySession();
        session.setUserId(1L);
        session.setSessionKey("s-" + date + "-" + hour);
        session.setStatDate(date);
        session.setActiveSeconds(seconds);
        session.setStartedAt(LocalDateTime.of(date, java.time.LocalTime.of(hour, 0)));
        return session;
    }
}
