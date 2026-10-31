package com.english.ai.exercise.util;

import com.english.ai.exercise.entity.UserStudySession;

import java.time.LocalDate;
import java.time.Year;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 学习时长聚合纯函数：会话秒数按日/小时汇总，并计算活跃与连续天数。
 */
public final class StudyDurationAggregator {

    private StudyDurationAggregator() {
    }

    /** 按日期汇总活跃秒数 */
    public static Map<LocalDate, Integer> secondsByDate(List<UserStudySession> sessions) {
        Map<LocalDate, Integer> result = new HashMap<>();
        if (sessions == null) {
            return result;
        }
        for (UserStudySession session : sessions) {
            if (session == null || session.getStatDate() == null) {
                continue;
            }
            int seconds = session.getActiveSeconds() != null ? session.getActiveSeconds() : 0;
            result.merge(session.getStatDate(), seconds, Integer::sum);
        }
        return result;
    }

    public static int totalSeconds(List<UserStudySession> sessions) {
        if (sessions == null) {
            return 0;
        }
        int total = 0;
        for (UserStudySession session : sessions) {
            if (session != null && session.getActiveSeconds() != null) {
                total += session.getActiveSeconds();
            }
        }
        return total;
    }

    public static int todaySeconds(List<UserStudySession> sessions, LocalDate today) {
        Integer seconds = secondsByDate(sessions).get(today);
        return seconds != null ? seconds : 0;
    }

    /** 年度每日学习分钟数，长度与当年天数一致 */
    public static List<Integer> yearlyMinutes(List<UserStudySession> sessions, int year) {
        int days = Year.of(year).length();
        List<Integer> result = new ArrayList<>(Collections.nCopies(days, 0));
        Map<LocalDate, Integer> byDate = secondsByDate(sessions);
        for (Map.Entry<LocalDate, Integer> entry : byDate.entrySet()) {
            LocalDate date = entry.getKey();
            if (date.getYear() == year) {
                result.set(date.getDayOfYear() - 1, entry.getValue() / 60);
            }
        }
        return result;
    }

    /** 本周一到周日每日学习分钟数 */
    public static List<Integer> recentWeekMinutes(List<UserStudySession> sessions, LocalDate today) {
        List<Integer> result = new ArrayList<>(Collections.nCopies(7, 0));
        Map<LocalDate, Integer> byDate = secondsByDate(sessions);
        LocalDate monday = today.minusDays(today.getDayOfWeek().getValue() - 1L);
        for (int i = 0; i < 7; i++) {
            Integer seconds = byDate.get(monday.plusDays(i));
            result.set(i, seconds != null ? seconds / 60 : 0);
        }
        return result;
    }

    /** 滚动最近 7 天（今天及前 6 天）每日学习分钟数，索引 0 是最早一天 */
    public static List<Integer> last7DaysMinutes(List<UserStudySession> sessions, LocalDate today) {
        List<Integer> result = new ArrayList<>(7);
        Map<LocalDate, Integer> byDate = secondsByDate(sessions);
        for (int i = 6; i >= 0; i--) {
            LocalDate date = today.minusDays(i);
            Integer seconds = byDate.get(date);
            result.add(seconds != null ? seconds / 60 : 0);
        }
        return result;
    }

    /** 滚动最近 7 天的日期标签（MM-dd） */
    public static List<String> last7DaysLabels(LocalDate today) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd");
        List<String> result = new ArrayList<>(7);
        for (int i = 6; i >= 0; i--) {
            result.add(today.minusDays(i).format(formatter));
        }
        return result;
    }

    /** 24 小时学习分钟分布，按会话开始小时归属 */
    public static List<Integer> hourlyMinutes(List<UserStudySession> sessions) {
        long[] secondsPerHour = new long[24];
        if (sessions != null) {
            for (UserStudySession session : sessions) {
                if (session == null || session.getStartedAt() == null) {
                    continue;
                }
                int hour = session.getStartedAt().getHour();
                int seconds = session.getActiveSeconds() != null ? session.getActiveSeconds() : 0;
                secondsPerHour[hour] += seconds;
            }
        }
        List<Integer> result = new ArrayList<>(24);
        for (long seconds : secondsPerHour) {
            result.add((int) (seconds / 60));
        }
        return result;
    }

    /** 会话日期集合 */
    public static Set<LocalDate> sessionDates(List<UserStudySession> sessions) {
        Set<LocalDate> dates = new HashSet<>();
        if (sessions != null) {
            for (UserStudySession session : sessions) {
                if (session != null && session.getStatDate() != null) {
                    dates.add(session.getStatDate());
                }
            }
        }
        return dates;
    }

    /** 活跃天数 = 会话日期 ∪ 答题日志日期 */
    public static int activeDays(Set<LocalDate> sessionDates, Set<LocalDate> logDates) {
        Set<LocalDate> union = new HashSet<>();
        if (sessionDates != null) {
            union.addAll(sessionDates);
        }
        if (logDates != null) {
            union.addAll(logDates);
        }
        return union.size();
    }

}
