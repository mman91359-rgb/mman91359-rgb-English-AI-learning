package com.english.ai.user.service;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.english.ai.user.entity.UserAbilityRadar;
import com.english.ai.user.entity.UserModuleStats;
import com.english.ai.user.mapper.UserAbilityRadarMapper;
import com.english.ai.user.mapper.UserModuleStatsMapper;
import com.english.ai.user.service.impl.UserAbilityRadarServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.ArgumentMatchers.isNull;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

/**
 * 雷达维度映射与正确率口径测试。
 *
 * <p>口径已从「移动加权 + 答错扣分」改为「模块累计正确率」，
 * 因此断言改为：只更新维度对应的那一列，且写入值等于统计正确率。</p>
 */
@ExtendWith(MockitoExtension.class)
class UserAbilityRadarServiceImplTest {

    @Mock
    private UserAbilityRadarMapper radarMapper;

    @Mock
    private UserModuleStatsMapper moduleStatsMapper;

    @Mock
    private PracticePointService practicePointService;

    private UserAbilityRadarServiceImpl service;

    @BeforeEach
    void setUp() {
        service = new UserAbilityRadarServiceImpl(radarMapper, moduleStatsMapper, practicePointService);
    }

    @Test
    @DisplayName("听力模块只更新 listening_score，不碰其他维度")
    void listeningModuleUpdatesListeningScoreOnly() {
        when(radarMapper.selectOne(any())).thenReturn(radar());
        when(moduleStatsMapper.listByUserId(1L)).thenReturn(List.of(stat(4, 10, 8)));

        service.updateModuleScore(1L, 4, true);

        String sqlSet = captureSqlSet();
        assertTrue(sqlSet.contains("listening_score"), "应更新听力列，实际: " + sqlSet);
        assertFalse(sqlSet.contains("reading_score"), "不应更新阅读列，实际: " + sqlSet);
        assertFalse(sqlSet.contains("vocabulary_score"), "不应更新词汇列，实际: " + sqlSet);
        verify(practicePointService).recordAnswer(1L, 4, true);
    }

    @Test
    @DisplayName("翻译模块只更新 translation_score")
    void translationModuleUpdatesTranslationScoreOnly() {
        when(radarMapper.selectOne(any())).thenReturn(radar());
        when(moduleStatsMapper.listByUserId(1L)).thenReturn(List.of(stat(3, 10, 6)));

        service.updateModuleScore(1L, 3, true);

        String sqlSet = captureSqlSet();
        assertTrue(sqlSet.contains("translation_score"), "应更新翻译列，实际: " + sqlSet);
        assertFalse(sqlSet.contains("listening_score"), "不应更新听力列，实际: " + sqlSet);
    }

    @Test
    @DisplayName("语法维度合并语法(2)与造句(5)的计数")
    void grammarMergesSentenceMaking() {
        when(radarMapper.selectOne(any())).thenReturn(radar());
        when(moduleStatsMapper.listByUserId(1L)).thenReturn(List.of(stat(2, 4, 1), stat(5, 6, 5)));

        service.updateModuleScore(1L, 2, true);

        String sqlSet = captureSqlSet();
        assertTrue(sqlSet.contains("grammar_score"), "应更新语法列，实际: " + sqlSet);
        // 合并后 10 题答对 6 题 = 60%
        assertTrue(capturedValue().compareTo(BigDecimal.valueOf(60.0)) == 0,
                "语法正确率应为60%，实际: " + capturedValue());
    }

    @Test
    @DisplayName("样本不足5题时不写维度分，避免新用户显示0%")
    void insufficientSampleSkipsUpdate() {
        when(moduleStatsMapper.listByUserId(1L)).thenReturn(List.of(stat(4, 3, 3)));

        service.updateModuleScore(1L, 4, true);

        verify(radarMapper, never()).update(any(), any());
        verify(practicePointService).recordAnswer(1L, 4, true);
    }

    @Test
    @DisplayName("写作模块只累加计数，维度分由评分链路写入")
    void writingModuleOnlyCounts() {
        service.updateModuleScore(1L, 6, true);

        verify(practicePointService).recordAnswer(1L, 6, true);
        verify(radarMapper, never()).update(any(), any());
    }

    @Test
    @DisplayName("写作评分仍按移动加权写入 writing_score：0 → 80 取 10% = 8.0")
    void valueUpdateMovesWritingScoreTowardsTarget() {
        when(radarMapper.selectOne(any())).thenReturn(radar());

        service.updateModuleScoreByValue(1L, 6, 80.0);

        String sqlSet = captureSqlSet();
        assertTrue(sqlSet.contains("writing_score"), "应更新写作列，实际: " + sqlSet);
        assertTrue(capturedValue().compareTo(BigDecimal.valueOf(8.0)) == 0,
                "写作分应为8.0，实际: " + capturedValue());
    }

    @Test
    @DisplayName("更新ELO只写 elo_score 列，不覆盖并发累加的积分")
    void updateEloWritesEloColumnOnly() {
        when(radarMapper.selectOne(any())).thenReturn(radar());

        service.updateElo(1L, 4, true, false);

        String sqlSet = captureSqlSet();
        assertTrue(sqlSet.contains("elo_score"), "应更新ELO列，实际: " + sqlSet);
        assertFalse(sqlSet.contains("practice_points"), "不应写入积分列，实际: " + sqlSet);
        verify(radarMapper, never()).updateById(any());
    }

    @Test
    @DisplayName("画像展示真实正确率，综合分为有数据维度的平均值（不设60%门槛）")
    void radarDataAveragesAllDimensionsWithData() {
        UserAbilityRadar radar = radar();
        radar.setPracticePoints(1200);
        when(radarMapper.selectOne(any())).thenReturn(radar);
        // 词汇 8/10=80%；语法 3/10=30%；两个维度都应有数据，低分维度不被剔除
        when(moduleStatsMapper.listByUserId(1L)).thenReturn(List.of(
                stat(1, 10, 8), stat(2, 10, 3)));

        Map<String, Object> data = service.getRadarData(1L);

        assertEquals(80.0, ((Number) data.get("vocabularyScore")).doubleValue(), 1e-9);
        assertEquals(true, data.get("vocabularyHasData"));
        assertEquals(30.0, ((Number) data.get("grammarScore")).doubleValue(), 1e-9);
        assertEquals(true, data.get("grammarHasData"));
        // (80 + 30) / 2 = 55.0
        assertEquals(55.0, ((BigDecimal) data.get("overallAbilityScore")).doubleValue(), 1e-9);
        // 称号按积分定位：1200 落在筑基者
        assertEquals("筑基者", data.get("practiceTitle"));
        assertEquals(1200, data.get("practicePoints"));
    }

    @Test
    @DisplayName("所有维度都无数据时综合能力分为 null，展示「—」")
    void radarDataReturnsNullWhenNoDimensionHasData() {
        UserAbilityRadar radar = radar();
        when(radarMapper.selectOne(any())).thenReturn(radar);
        when(moduleStatsMapper.listByUserId(1L)).thenReturn(List.of());

        Map<String, Object> data = service.getRadarData(1L);

        assertEquals(false, data.get("vocabularyHasData"));
        assertNull(data.get("overallAbilityScore"));
    }

    @Test
    @DisplayName("样本不足5题时 hasData 为 false，避免展示误导性百分比")
    void radarDataMarksInsufficientSample() {
        UserAbilityRadar radar = radar();
        when(radarMapper.selectOne(any())).thenReturn(radar);
        when(moduleStatsMapper.listByUserId(1L)).thenReturn(List.of(stat(1, 3, 3)));

        Map<String, Object> data = service.getRadarData(1L);

        assertEquals(false, data.get("vocabularyHasData"));
        assertEquals(3, data.get("vocabularyTotal"));
    }

    private String captureSqlSet() {
        ArgumentCaptor<UpdateWrapper<UserAbilityRadar>> captor = wrapperCaptor();
        verify(radarMapper).update(isNull(), captor.capture());
        return captor.getValue().getSqlSet();
    }

    private BigDecimal capturedValue() {
        ArgumentCaptor<UpdateWrapper<UserAbilityRadar>> captor = wrapperCaptor();
        verify(radarMapper).update(isNull(), captor.capture());
        return captor.getValue().getParamNameValuePairs().values().stream()
                .filter(BigDecimal.class::isInstance)
                .map(BigDecimal.class::cast)
                .findFirst()
                .orElse(BigDecimal.valueOf(-1));
    }

    @SuppressWarnings("unchecked")
    private ArgumentCaptor<UpdateWrapper<UserAbilityRadar>> wrapperCaptor() {
        return ArgumentCaptor.forClass(UpdateWrapper.class);
    }

    private UserModuleStats stat(int moduleType, int total, int correct) {
        UserModuleStats stat = new UserModuleStats();
        stat.setUserId(1L);
        stat.setModuleType(moduleType);
        stat.setTotalCount(total);
        stat.setCorrectCount(correct);
        return stat;
    }

    private UserAbilityRadar radar() {
        UserAbilityRadar radar = new UserAbilityRadar();
        radar.setUserId(1L);
        radar.setVocabularyScore(BigDecimal.ZERO);
        radar.setGrammarScore(BigDecimal.ZERO);
        radar.setListeningScore(BigDecimal.ZERO);
        radar.setReadingScore(BigDecimal.ZERO);
        radar.setTranslationScore(BigDecimal.ZERO);
        radar.setWritingScore(BigDecimal.ZERO);
        radar.setEloScore(1000);
        radar.setPracticePoints(0);
        radar.setTargetLevel("CET4");
        return radar;
    }
}
