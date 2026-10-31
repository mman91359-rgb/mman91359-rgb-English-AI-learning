package com.english.ai.exercise.service;

import com.english.ai.exercise.dto.StudySessionReportRequest;
import com.english.ai.exercise.dto.StudySessionReportResponse;
import com.english.ai.exercise.entity.UserStudySession;

import java.util.List;

/**
 * 学习会话服务
 */
public interface StudySessionService {

    /** 上报会话累计活跃秒数 */
    StudySessionReportResponse report(StudySessionReportRequest request);

    /** 查询用户全部会话，供统计聚合使用 */
    List<UserStudySession> listByUser(Long userId);
}
