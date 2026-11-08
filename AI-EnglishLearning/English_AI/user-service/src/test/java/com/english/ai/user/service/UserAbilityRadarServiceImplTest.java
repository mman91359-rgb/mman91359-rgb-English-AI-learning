package com.english.ai.user.service;

import com.english.ai.user.entity.UserAbilityRadar;
import com.english.ai.user.mapper.UserAbilityRadarMapper;
import com.english.ai.user.service.impl.UserAbilityRadarServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

/**
 * 雷达维度映射单元测试：锁定 moduleType 3=阅读、4=听力，避免错位。
 */
@ExtendWith(MockitoExtension.class)
class UserAbilityRadarServiceImplTest {

    @Mock
    private UserAbilityRadarMapper radarMapper;

    private UserAbilityRadarServiceImpl service;

    @BeforeEach
    void setUp() {
        service = new UserAbilityRadarServiceImpl(radarMapper);
    }

    @Test
    void listeningModuleUpdatesListeningScoreOnly() {
        UserAbilityRadar radar = radar();
        when(radarMapper.selectOne(any())).thenReturn(radar);

        service.updateModuleScore(1L, 4, true);

        ArgumentCaptor<UserAbilityRadar> captor = ArgumentCaptor.forClass(UserAbilityRadar.class);
        verify(radarMapper).updateById(captor.capture());
        UserAbilityRadar updated = captor.getValue();
        assertTrue(updated.getListeningScore().compareTo(BigDecimal.ZERO) > 0);
        assertEquals(0, updated.getReadingScore().compareTo(BigDecimal.ZERO));
    }

    @Test
    void translationModuleUpdatesTranslationScoreOnly() {
        UserAbilityRadar radar = radar();
        when(radarMapper.selectOne(any())).thenReturn(radar);

        service.updateModuleScore(1L, 3, true);

        ArgumentCaptor<UserAbilityRadar> captor = ArgumentCaptor.forClass(UserAbilityRadar.class);
        verify(radarMapper).updateById(captor.capture());
        UserAbilityRadar updated = captor.getValue();
        assertTrue(updated.getTranslationScore().compareTo(BigDecimal.ZERO) > 0);
        assertEquals(0, updated.getReadingScore().compareTo(BigDecimal.ZERO));
        assertEquals(0, updated.getListeningScore().compareTo(BigDecimal.ZERO));
    }

    @Test
    void writingModuleUpdatesWritingScore() {
        UserAbilityRadar radar = radar();
        when(radarMapper.selectOne(any())).thenReturn(radar);

        service.updateModuleScore(1L, 6, true);

        ArgumentCaptor<UserAbilityRadar> captor = ArgumentCaptor.forClass(UserAbilityRadar.class);
        verify(radarMapper, times(1)).updateById(captor.capture());
        UserAbilityRadar updated = captor.getValue();
        assertTrue(updated.getWritingScore().compareTo(BigDecimal.ZERO) > 0);
    }

    @Test
    void valueUpdateMovesWritingScoreTowardsTarget() {
        UserAbilityRadar radar = radar();
        when(radarMapper.selectOne(any())).thenReturn(radar);

        service.updateModuleScoreByValue(1L, 6, 80.0);

        ArgumentCaptor<UserAbilityRadar> captor = ArgumentCaptor.forClass(UserAbilityRadar.class);
        verify(radarMapper).updateById(captor.capture());
        // 0 → 80 的移动加权 10% = 8.0
        assertEquals(0, captor.getValue().getWritingScore().compareTo(BigDecimal.valueOf(8.0)));
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
        radar.setTargetLevel("CET4");
        return radar;
    }
}
