package com.english.ai.exercise.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.common.BusinessException;
import com.english.ai.common.ErrorCode;
import com.english.ai.exercise.dto.WritingScoreDTO;
import com.english.ai.exercise.dto.WritingSubmitRequest;
import com.english.ai.exercise.dto.WritingSubmitResponse;
import com.english.ai.exercise.entity.WritingEssay;
import com.english.ai.exercise.mapper.WritingEssayMapper;
import com.english.ai.exercise.service.WritingService;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 写作模块服务实现：作文"先落库后评分"。
 * AI 评分失败时保留原文并标记 ai_scored=0，支持重新评分，不阻塞作文保存。
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class WritingServiceImpl implements WritingService {

    private final WritingEssayMapper writingEssayMapper;
    private final RestTemplate restTemplate;
    private final ObjectMapper objectMapper;

    @Value("${service.ai.url}")
    private String aiServiceUrl;

    @Value("${service.user.url:http://localhost:8081}")
    private String userServiceUrl;

    @Override
    public WritingSubmitResponse submit(WritingSubmitRequest request) {
        // 1. 先落库（AI 评分前，保证作文不丢）
        WritingEssay essay = new WritingEssay();
        essay.setUserId(request.getUserId());
        essay.setTopicKey(request.getTopicKey());
        essay.setTopicTitle(request.getTopicTitle());
        essay.setContent(request.getContent());
        essay.setWordCount(request.getWordCount());
        essay.setDurationSeconds(request.getDurationSeconds());
        essay.setAiScored(0);
        essay.setCreatedAt(LocalDateTime.now());
        writingEssayMapper.insert(essay);

        // 2. 尝试 AI 评分
        WritingScoreDTO score = tryScore(essay);
        if (score != null) {
            // 评分成功，回写
            essay.setAiScored(1);
            essay.setRawScore(BigDecimal.valueOf(score.getRawScore()));
            essay.setWeightedScore(BigDecimal.valueOf(score.getWeightedScore()));
            try {
                essay.setScoreJson(objectMapper.writeValueAsString(score));
            } catch (Exception e) {
                log.warn("评分 JSON 序列化失败: {}", e.getMessage());
            }
            writingEssayMapper.updateById(essay);
            syncWritingScore(essay, score);
            return buildResponse(essay, score, true, null);
        }

        // 3. 评分失败，保留未评分状态，返回降级提示
        return buildResponse(essay, null, false, "作文已保存，AI 评分暂不可用，可稍后重新评分");
    }

    @Override
    public WritingSubmitResponse rescore(Long userId, Long essayId) {
        WritingEssay essay = writingEssayMapper.selectById(essayId);
        if (essay == null || !essay.getUserId().equals(userId)) {
            throw new BusinessException(ErrorCode.NOT_FOUND, "作文不存在");
        }
        WritingScoreDTO score = tryScore(essay);
        if (score == null) {
            return buildResponse(essay, null, false, "AI 评分仍不可用，请稍后再试");
        }
        essay.setAiScored(1);
        essay.setRawScore(BigDecimal.valueOf(score.getRawScore()));
        essay.setWeightedScore(BigDecimal.valueOf(score.getWeightedScore()));
        try {
            essay.setScoreJson(objectMapper.writeValueAsString(score));
        } catch (Exception e) {
            log.warn("评分 JSON 序列化失败: {}", e.getMessage());
        }
        writingEssayMapper.updateById(essay);
        syncWritingScore(essay, score);
        return buildResponse(essay, score, true, null);
    }

    @Override
    public List<WritingSubmitResponse> listSubmissions(Long userId) {
        List<WritingEssay> list = writingEssayMapper.selectList(
                new LambdaQueryWrapper<WritingEssay>()
                        .eq(WritingEssay::getUserId, userId)
                        .orderByDesc(WritingEssay::getCreatedAt));
        return list.stream().map(e -> toResponse(e, e.getAiScored() != null && e.getAiScored() == 1)).toList();
    }

    @Override
    public WritingSubmitResponse getSubmission(Long userId, Long essayId) {
        WritingEssay essay = writingEssayMapper.selectById(essayId);
        if (essay == null || !essay.getUserId().equals(userId)) {
            throw new BusinessException(ErrorCode.NOT_FOUND, "作文不存在");
        }
        return toResponse(essay, essay.getAiScored() != null && essay.getAiScored() == 1);
    }

    /**
     * 评分成功后把作文得分率回写到能力雷达的写作维度（moduleType=6）。
     * 跨服务失败只告警，不影响作文保存与评分结果。
     */
    private void syncWritingScore(WritingEssay essay, WritingScoreDTO score) {
        Double percent = writingPercent(score);
        if (percent == null || essay.getUserId() == null) {
            return;
        }
        try {
            String url = userServiceUrl + "/user/radar/update-module-score";
            Map<String, Object> body = new HashMap<>();
            body.put("userId", essay.getUserId());
            body.put("moduleType", 6);
            body.put("score", Math.round(percent * 10) / 10.0);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);
            restTemplate.postForEntity(url, entity, String.class);
        } catch (Exception e) {
            log.warn("回写作文能力分失败（不影响作文保存）: essayId={}, reason={}",
                    essay.getId(), e.getMessage());
        }
    }

    /**
     * 得分率折算到 0~100：优先按原始分/满分，缺失时退回 weightedScore，都没有则返回 null。
     */
    private Double writingPercent(WritingScoreDTO score) {
        if (score == null) {
            return null;
        }
        double percent;
        if (score.getRawScore() != null && score.getMaxRawScore() != null && score.getMaxRawScore() > 0) {
            percent = score.getRawScore() * 100.0 / score.getMaxRawScore();
        } else if (score.getWeightedScore() != null) {
            percent = score.getWeightedScore();
        } else {
            return null;
        }
        return Math.max(0, Math.min(100, percent));
    }

    /**
     * 调用 ai-service 评分，失败返回 null。
     */
    private WritingScoreDTO tryScore(WritingEssay essay) {
        try {
            String url = aiServiceUrl + "/ai/score-writing";
            Map<String, Object> body = new HashMap<>();
            body.put("topicTitle", essay.getTopicTitle());
            body.put("topic", essay.getTopicKey());
            body.put("content", essay.getContent());
            body.put("wordCount", essay.getWordCount() == null ? 0 : essay.getWordCount());

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);

            ResponseEntity<Map> resp = restTemplate.postForEntity(url, entity, Map.class);
            if (resp.getBody() != null && resp.getBody().get("data") != null) {
                // Result.success(data) 包装：data 字段是评分对象
                return objectMapper.convertValue(resp.getBody().get("data"), WritingScoreDTO.class);
            }
        } catch (Exception e) {
            log.warn("调用 AI 评分服务失败: {}", e.getMessage());
        }
        return null;
    }

    private WritingSubmitResponse buildResponse(WritingEssay essay, WritingScoreDTO score, boolean scored, String message) {
        WritingSubmitResponse resp = toResponse(essay, scored);
        resp.setMessage(message);
        return resp;
    }

    private WritingSubmitResponse toResponse(WritingEssay essay, boolean scored) {
        WritingSubmitResponse resp = new WritingSubmitResponse();
        resp.setEssayId(essay.getId());
        resp.setTopicKey(essay.getTopicKey());
        resp.setContent(essay.getContent());
        resp.setWordCount(essay.getWordCount());
        resp.setAiScored(scored);
        resp.setCreatedAt(essay.getCreatedAt());
        if (scored && essay.getScoreJson() != null && !essay.getScoreJson().isBlank()) {
            try {
                resp.setScore(objectMapper.readValue(essay.getScoreJson(), WritingScoreDTO.class));
            } catch (Exception e) {
                log.warn("评分 JSON 反序列化失败: {}", e.getMessage());
            }
        }
        return resp;
    }
}
