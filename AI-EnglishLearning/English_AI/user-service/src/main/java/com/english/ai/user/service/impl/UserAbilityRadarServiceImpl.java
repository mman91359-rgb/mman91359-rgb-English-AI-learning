package com.english.ai.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.common.ModuleType;
import com.english.ai.common.RadarDimension;
import com.english.ai.user.entity.UserAbilityRadar;
import com.english.ai.user.mapper.UserAbilityRadarMapper;
import com.english.ai.user.service.EloCalculator;
import com.english.ai.user.service.UserAbilityRadarService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.LinkedHashMap;
import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserAbilityRadarServiceImpl implements UserAbilityRadarService {

    private final UserAbilityRadarMapper radarMapper;

    @Override
    public void initRadar(Long userId, String targetLevel) {
        UserAbilityRadar exist = getByUserId(userId);
        if (exist != null) {
            log.info("雷达记录已存在: userId={}", userId);
            return;
        }
        UserAbilityRadar radar = new UserAbilityRadar();
        radar.setUserId(userId);
        radar.setVocabularyScore(BigDecimal.ZERO);
        radar.setGrammarScore(BigDecimal.ZERO);
        radar.setListeningScore(BigDecimal.ZERO);
        radar.setReadingScore(BigDecimal.ZERO);
        radar.setTranslationScore(BigDecimal.ZERO);
        radar.setWritingScore(BigDecimal.ZERO);
        radar.setEloScore(1000);
        radar.setTargetLevel(targetLevel);
        radarMapper.insert(radar);
        log.info("初始化雷达记录: userId={}, targetLevel={}, elo=1000", userId, targetLevel);
    }

    @Override
    public UserAbilityRadar getByUserId(Long userId) {
        return radarMapper.selectOne(
                new LambdaQueryWrapper<UserAbilityRadar>()
                        .eq(UserAbilityRadar::getUserId, userId));
    }

    @Override
    public int updateElo(Long userId, int questionDifficulty, boolean isCorrect, boolean isAssess) {
        UserAbilityRadar radar = getOrCreateRadar(userId);
        int oldElo = radar.getEloScore();
        int newElo = isAssess
                ? EloCalculator.calculateAssess(oldElo, questionDifficulty, isCorrect)
                : EloCalculator.calculatePractice(oldElo, questionDifficulty, isCorrect);

        radar.setEloScore(newElo);
        radarMapper.updateById(radar);

        log.info("ELO更新: userId={}, difficulty={}, correct={}, isAssess={}, {}→{}",
                userId, questionDifficulty, isCorrect, isAssess, oldElo, newElo);
        return newElo;
    }

    @Override
    public void updateModuleScore(Long userId, int moduleType, boolean isCorrect) {
        RadarDimension dimension = ModuleType.radarDimensionOf(moduleType);
        if (dimension == null) {
            // 未知模块没有对应雷达列，只更新 ELO/日志，不写模块分
            log.warn("模块无对应雷达维度，跳过模块分更新: userId={}, moduleType={}", userId, moduleType);
            return;
        }
        UserAbilityRadar radar = getOrCreateRadar(userId);
        BigDecimal current = getModuleScore(radar, dimension);
        // 移动加权平均: 正确+10%剩余距离, 错误-10%当前值
        double rate = 0.1;
        double newVal = isCorrect
                ? current.doubleValue() + (100.0 - current.doubleValue()) * rate
                : current.doubleValue() * (1.0 - rate);
        newVal = Math.max(0, Math.min(100, newVal));
        BigDecimal newScore = BigDecimal.valueOf(Math.round(newVal * 10) / 10.0);
        setModuleScore(radar, dimension, newScore);
        radarMapper.updateById(radar);
        log.info("模块分更新: userId={}, moduleType={}, dimension={}, correct={}, {}→{}",
                userId, moduleType, dimension, isCorrect, current, newScore);
    }

    @Override
    public void updateModuleScoreByValue(Long userId, int moduleType, double score0to100) {
        RadarDimension dimension = ModuleType.radarDimensionOf(moduleType);
        if (dimension == null) {
            log.warn("模块无对应雷达维度，跳过模块分更新: userId={}, moduleType={}", userId, moduleType);
            return;
        }
        double target = Math.max(0, Math.min(100, score0to100));
        UserAbilityRadar radar = getOrCreateRadar(userId);
        BigDecimal current = getModuleScore(radar, dimension);
        BigDecimal newScore = movingWeighted(current, target);
        setModuleScore(radar, dimension, newScore);
        radarMapper.updateById(radar);
        log.info("模块分更新(按分值): userId={}, moduleType={}, dimension={}, target={}, {}→{}",
                userId, moduleType, dimension, target, current, newScore);
    }

    /**
     * 移动加权：向目标值靠近 10%，与对错二值累计保持同一手感。
     */
    private BigDecimal movingWeighted(BigDecimal current, double target) {
        double base = current == null ? 0 : current.doubleValue();
        double newVal = base + (target - base) * 0.1;
        newVal = Math.max(0, Math.min(100, newVal));
        return BigDecimal.valueOf(Math.round(newVal * 10) / 10.0);
    }

    private UserAbilityRadar getOrCreateRadar(Long userId) {
        UserAbilityRadar radar = getByUserId(userId);
        if (radar == null) {
            log.warn("雷达记录不存在, 自动创建: userId={}", userId);
            initRadar(userId, "CET4");
            radar = getByUserId(userId);
        }
        return radar;
    }

    private BigDecimal getModuleScore(UserAbilityRadar radar, RadarDimension dimension) {
        return switch (dimension) {
            case VOCABULARY -> radar.getVocabularyScore();
            case GRAMMAR -> radar.getGrammarScore();
            case LISTENING -> radar.getListeningScore();
            case READING -> radar.getReadingScore();
            case TRANSLATION -> radar.getTranslationScore();
            case WRITING -> radar.getWritingScore();
        };
    }

    private void setModuleScore(UserAbilityRadar radar, RadarDimension dimension, BigDecimal score) {
        switch (dimension) {
            case VOCABULARY -> radar.setVocabularyScore(score);
            case GRAMMAR -> radar.setGrammarScore(score);
            case LISTENING -> radar.setListeningScore(score);
            case READING -> radar.setReadingScore(score);
            case TRANSLATION -> radar.setTranslationScore(score);
            case WRITING -> radar.setWritingScore(score);
        }
    }

    @Override
    public Map<String, Object> getRadarData(Long userId) {
        UserAbilityRadar radar = getByUserId(userId);
        if (radar == null) {
            return defaultRadarData();
        }

        Map<String, Object> data = new LinkedHashMap<>();
        data.put("userId", userId);
        data.put("eloScore", radar.getEloScore());
        data.put("eloLevel", eloToLevel(radar.getEloScore()));
        data.put("targetLevel", radar.getTargetLevel());

        data.put("vocabularyScore", radar.getVocabularyScore() != null
                ? radar.getVocabularyScore().setScale(1, RoundingMode.HALF_UP) : BigDecimal.ZERO);
        data.put("grammarScore", radar.getGrammarScore() != null
                ? radar.getGrammarScore().setScale(1, RoundingMode.HALF_UP) : BigDecimal.ZERO);
        data.put("listeningScore", radar.getListeningScore() != null
                ? radar.getListeningScore().setScale(1, RoundingMode.HALF_UP) : BigDecimal.ZERO);
        data.put("readingScore", radar.getReadingScore() != null
                ? radar.getReadingScore().setScale(1, RoundingMode.HALF_UP) : BigDecimal.ZERO);
        data.put("translationScore", radar.getTranslationScore() != null
                ? radar.getTranslationScore().setScale(1, RoundingMode.HALF_UP) : BigDecimal.ZERO);
        data.put("writingScore", radar.getWritingScore() != null
                ? radar.getWritingScore().setScale(1, RoundingMode.HALF_UP) : BigDecimal.ZERO);

        // 雷达图最大值100，计算归一化比例
        double maxRadar = 100.0;
        data.put("vocabularyPercent", calcPercent(radar.getVocabularyScore(), maxRadar));
        data.put("grammarPercent", calcPercent(radar.getGrammarScore(), maxRadar));
        data.put("listeningPercent", calcPercent(radar.getListeningScore(), maxRadar));
        data.put("readingPercent", calcPercent(radar.getReadingScore(), maxRadar));
        data.put("translationPercent", calcPercent(radar.getTranslationScore(), maxRadar));
        data.put("writingPercent", calcPercent(radar.getWritingScore(), maxRadar));

        // ELO等级进度环数据
        int[] range = eloRange(radar.getEloScore());
        data.put("eloFloor", range[0]);
        data.put("eloCeil", range[1]);
        data.put("eloProgress", Math.round((radar.getEloScore() - range[0]) * 100.0 / (range[1] - range[0])));

        return data;
    }

    private Map<String, Object> defaultRadarData() {
        Map<String, Object> data = new LinkedHashMap<>();
        data.put("eloScore", 1000);
        data.put("eloLevel", "初心者");
        data.put("vocabularyScore", 0);
        data.put("grammarScore", 0);
        data.put("listeningScore", 0);
        data.put("readingScore", 0);
        data.put("translationScore", 0);
        data.put("writingScore", 0);
        data.put("vocabularyPercent", 0);
        data.put("grammarPercent", 0);
        data.put("listeningPercent", 0);
        data.put("readingPercent", 0);
        data.put("translationPercent", 0);
        data.put("writingPercent", 0);
        data.put("eloFloor", 0);
        data.put("eloCeil", 1250);
        data.put("eloProgress", 80);
        return data;
    }

    private double calcPercent(BigDecimal score, double max) {
        if (score == null) return 0;
        return Math.min(100, Math.round(score.doubleValue() / max * 1000.0) / 10.0);
    }

    /** ELO分→等级名称 */
    private String eloToLevel(int elo) {
        if (elo >= 2000) return "宗师";
        if (elo >= 1750) return "大师";
        if (elo >= 1500) return "高手";
        if (elo >= 1250) return "进阶";
        if (elo >= 1000) return "入门";
        return "初心者";
    }

    /** ELO分所在等级区间 */
    private int[] eloRange(int elo) {
        if (elo >= 2000) return new int[]{2000, 2500};
        if (elo >= 1750) return new int[]{1750, 2000};
        if (elo >= 1500) return new int[]{1500, 1750};
        if (elo >= 1250) return new int[]{1250, 1500};
        if (elo >= 1000) return new int[]{1000, 1250};
        return new int[]{0, 1000};
    }
}
