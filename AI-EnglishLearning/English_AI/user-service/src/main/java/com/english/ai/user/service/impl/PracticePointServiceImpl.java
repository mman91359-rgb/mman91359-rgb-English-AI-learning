package com.english.ai.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.user.dto.PracticeSettlementResult;
import com.english.ai.user.entity.UserAbilityRadar;
import com.english.ai.user.entity.UserPracticeSettlement;
import com.english.ai.user.mapper.UserAbilityRadarMapper;
import com.english.ai.user.mapper.UserModuleStatsMapper;
import com.english.ai.user.mapper.UserPracticeSettlementMapper;
import com.english.ai.user.service.PracticePointCalculator;
import com.english.ai.user.service.PracticePointService;
import com.english.ai.user.service.PracticeTitle;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.ZoneId;

/**
 * 练习积分实现。
 *
 * <p>结算链路：算正确率 → 判 60% 门槛 → 扣每日上限 → 落结算记录（唯一键幂等）→ 累加积分。</p>
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class PracticePointServiceImpl implements PracticePointService {

    /** 业务时区，与学习时长统计保持一致 */
    private static final ZoneId BIZ_ZONE = ZoneId.of("Asia/Shanghai");

    private static final int MAX_BATCH_KEY_LENGTH = 64;

    private final UserModuleStatsMapper moduleStatsMapper;
    private final UserPracticeSettlementMapper settlementMapper;
    private final UserAbilityRadarMapper radarMapper;

    @Override
    public void recordAnswer(Long userId, int moduleType, boolean isCorrect) {
        if (userId == null) {
            return;
        }
        moduleStatsMapper.accumulate(userId, moduleType, isCorrect ? 1 : 0);
    }

    @Override
    @Transactional
    public PracticeSettlementResult settle(Long userId, String batchKey, int moduleType,
                                           int totalCount, int correctCount, long sumDifficulty) {
        validate(userId, batchKey, totalCount, correctCount);

        // 幂等：同一练习组重复结算直接返回首次结果
        UserPracticeSettlement existed = findByBatchKey(userId, batchKey);
        if (existed != null) {
            log.info("练习组重复结算，返回首次结果: userId={}, batchKey={}", userId, batchKey);
            return buildResult(existed, currentPoints(userId), false, existed.getPoints());
        }

        LocalDate statDate = LocalDate.now(BIZ_ZONE);
        double accuracy = PracticePointCalculator.accuracy(correctCount, totalCount);
        int rawPoints = PracticePointCalculator.settlePoints(totalCount, sumDifficulty, correctCount);
        int usedToday = settlementMapper.sumPointsByDate(userId, statDate);
        int points = PracticePointCalculator.applyDailyLimit(rawPoints, usedToday);

        UserPracticeSettlement record = new UserPracticeSettlement();
        record.setUserId(userId);
        record.setBatchKey(batchKey);
        record.setModuleType(moduleType);
        record.setTotalCount(totalCount);
        record.setCorrectCount(correctCount);
        record.setAccuracy(BigDecimal.valueOf(accuracy).setScale(2, RoundingMode.HALF_UP));
        record.setPoints(points);
        record.setStatDate(statDate);

        try {
            settlementMapper.insert(record);
        } catch (DuplicateKeyException e) {
            // 并发重复结算：以先写入的记录为准，不重复加分
            UserPracticeSettlement concurrent = findByBatchKey(userId, batchKey);
            if (concurrent == null) {
                throw e;
            }
            log.info("练习组并发重复结算: userId={}, batchKey={}", userId, batchKey);
            return buildResult(concurrent, currentPoints(userId), false, concurrent.getPoints());
        }

        if (points > 0) {
            ensureRadar(userId);
            radarMapper.addPracticePoints(userId, points, PracticePointCalculator.MAX_POINTS);
        }

        int totalPoints = currentPoints(userId);
        log.info("练习组结算: userId={}, batchKey={}, total={}, correct={}, accuracy={}%, raw={}, awarded={}, totalPoints={}",
                userId, batchKey, totalCount, correctCount, accuracy, rawPoints, points, totalPoints);
        return buildResult(record, totalPoints, true, rawPoints);
    }

    @Override
    public int getPoints(Long userId) {
        return currentPoints(userId);
    }

    private void validate(Long userId, String batchKey, int totalCount, int correctCount) {
        if (userId == null) {
            throw new IllegalArgumentException("userId不能为空");
        }
        if (batchKey == null || batchKey.isBlank() || batchKey.length() > MAX_BATCH_KEY_LENGTH) {
            throw new IllegalArgumentException("batchKey非法");
        }
        if (totalCount <= 0) {
            throw new IllegalArgumentException("本组题数必须大于0");
        }
        if (correctCount < 0 || correctCount > totalCount) {
            throw new IllegalArgumentException("答对题数非法");
        }
    }

    private UserPracticeSettlement findByBatchKey(Long userId, String batchKey) {
        return settlementMapper.selectOne(new LambdaQueryWrapper<UserPracticeSettlement>()
                .eq(UserPracticeSettlement::getUserId, userId)
                .eq(UserPracticeSettlement::getBatchKey, batchKey));
    }

    private int currentPoints(Long userId) {
        UserAbilityRadar radar = radarMapper.selectOne(new LambdaQueryWrapper<UserAbilityRadar>()
                .eq(UserAbilityRadar::getUserId, userId));
        if (radar == null || radar.getPracticePoints() == null) {
            return 0;
        }
        return radar.getPracticePoints();
    }

    /**
     * 结算可能先于画像记录创建（例如注册链路未走 initRadar），按默认值补一行。
     */
    private void ensureRadar(Long userId) {
        UserAbilityRadar exist = radarMapper.selectOne(new LambdaQueryWrapper<UserAbilityRadar>()
                .eq(UserAbilityRadar::getUserId, userId));
        if (exist != null) {
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
        radar.setPracticePoints(0);
        radar.setTargetLevel("CET4");
        try {
            radarMapper.insert(radar);
        } catch (DuplicateKeyException e) {
            log.debug("并发创建雷达记录，忽略: userId={}", userId);
        }
    }

    private PracticeSettlementResult buildResult(UserPracticeSettlement record, int totalPoints,
                                                 boolean awarded, int rawPoints) {
        PracticeTitle title = PracticeTitle.of(totalPoints);
        return PracticeSettlementResult.builder()
                .qualified(record.getAccuracy() != null
                        && record.getAccuracy().doubleValue() >= PracticePointCalculator.QUALIFY_ACCURACY)
                .awarded(awarded && record.getPoints() != null && record.getPoints() > 0)
                .accuracy(record.getAccuracy() == null ? 0 : record.getAccuracy().doubleValue())
                .totalCount(record.getTotalCount() == null ? 0 : record.getTotalCount())
                .correctCount(record.getCorrectCount() == null ? 0 : record.getCorrectCount())
                .rawPoints(rawPoints)
                .points(record.getPoints() == null ? 0 : record.getPoints())
                .dailyLimitReached(rawPoints > 0 && record.getPoints() != null && rawPoints > record.getPoints())
                .totalPoints(totalPoints)
                .title(title.getLabel())
                .nextTitle(title.isMax() ? null : title.next().getLabel())
                .titleFloor(title.getFloor())
                .titleCeil(title.getCeil())
                .titleProgress(title.progressOf(totalPoints))
                .build();
    }
}
