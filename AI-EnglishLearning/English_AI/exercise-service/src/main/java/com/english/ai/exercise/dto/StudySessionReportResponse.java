package com.english.ai.exercise.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

/**
 * 学习会话上报响应
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StudySessionReportResponse {

    private Integer activeSeconds;

    private LocalDate statDate;
}
