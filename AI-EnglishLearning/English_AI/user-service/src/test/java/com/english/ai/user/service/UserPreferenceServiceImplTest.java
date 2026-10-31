package com.english.ai.user.service;

import com.english.ai.user.dto.PreferenceResponse;
import com.english.ai.user.entity.SysUser;
import com.english.ai.user.entity.UserPreference;
import com.english.ai.user.mapper.UserMapper;
import com.english.ai.user.mapper.UserPreferenceMapper;
import com.english.ai.user.service.impl.UserPreferenceServiceImpl;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

/**
 * 用户偏好服务单元测试
 */
@ExtendWith(MockitoExtension.class)
class UserPreferenceServiceImplTest {

    @Mock
    private UserPreferenceMapper preferenceMapper;

    @Mock
    private UserMapper userMapper;

    @InjectMocks
    private UserPreferenceServiceImpl service;

    @Test
    void getWithoutRecordReturnsUnconfigured() {
        when(preferenceMapper.selectOne(any())).thenReturn(null);

        PreferenceResponse response = service.get(1L);

        assertFalse(response.getConfigured());
        assertEquals(null, response.getVocabGroupSize());
        assertEquals(5, response.getMinGroupSize());
        assertEquals(50, response.getMaxGroupSize());
        assertFalse(response.getVocabularyGoalsConfigured());
        assertEquals(null, response.getDailyNewWords());
        assertEquals(null, response.getDailyReviewWords());
        assertEquals(1, response.getMinDailyNewWords());
        assertEquals(50, response.getMaxDailyNewWords());
        assertEquals(0, response.getMinDailyReviewWords());
        assertEquals(50, response.getMaxDailyReviewWords());
    }

    @Test
    void updateAcceptsBoundaryValues() {
        when(userMapper.selectById(1L)).thenReturn(new SysUser());
        when(preferenceMapper.selectOne(any())).thenReturn(null);
        when(preferenceMapper.insert(any())).thenReturn(1);

        PreferenceResponse five = service.updateVocabGroupSize(1L, 5);
        assertTrue(five.getConfigured());
        assertEquals(5, five.getVocabGroupSize());

        PreferenceResponse fifty = service.updateVocabGroupSize(1L, 50);
        assertTrue(fifty.getConfigured());
        assertEquals(50, fifty.getVocabGroupSize());
    }

    @Test
    void updateExistingRecordUsesUpdate() {
        when(userMapper.selectById(1L)).thenReturn(new SysUser());
        UserPreference preference = new UserPreference();
        preference.setId(9L);
        preference.setUserId(1L);
        preference.setVocabGroupSize(10);
        when(preferenceMapper.selectOne(any())).thenReturn(preference);
        when(preferenceMapper.updateById(any())).thenReturn(1);

        service.updateVocabGroupSize(1L, 20);

        ArgumentCaptor<UserPreference> captor = ArgumentCaptor.forClass(UserPreference.class);
        verify(preferenceMapper).updateById(captor.capture());
        assertEquals(20, captor.getValue().getVocabGroupSize());
        verify(preferenceMapper, never()).insert(any());
    }

    @Test
    void rejectsOutOfRangeValues() {
        when(userMapper.selectById(1L)).thenReturn(new SysUser());

        assertThrows(IllegalArgumentException.class, () -> service.updateVocabGroupSize(1L, 4));
        assertThrows(IllegalArgumentException.class, () -> service.updateVocabGroupSize(1L, 51));
        assertThrows(IllegalArgumentException.class, () -> service.updateVocabGroupSize(1L, null));
    }

    @Test
    void updateVocabularyGoalsAcceptsBoundaries() {
        when(userMapper.selectById(1L)).thenReturn(new SysUser());
        when(preferenceMapper.selectOne(any())).thenReturn(null);
        when(preferenceMapper.insert(any())).thenReturn(1);

        PreferenceResponse first = service.updateVocabularyGoals(1L, 1, 0);
        assertTrue(first.getVocabularyGoalsConfigured());
        assertEquals(1, first.getDailyNewWords());
        assertEquals(0, first.getDailyReviewWords());
        assertEquals(null, first.getVocabGroupSize());

        PreferenceResponse second = service.updateVocabularyGoals(1L, 50, 50);
        assertTrue(second.getVocabularyGoalsConfigured());
        assertEquals(50, second.getDailyNewWords());
        assertEquals(50, second.getDailyReviewWords());
    }

    @Test
    void updateVocabularyGoalsPreservesVocabGroupSize() {
        when(userMapper.selectById(1L)).thenReturn(new SysUser());
        UserPreference preference = new UserPreference();
        preference.setId(9L);
        preference.setUserId(1L);
        preference.setVocabGroupSize(10);
        when(preferenceMapper.selectOne(any())).thenReturn(preference);
        when(preferenceMapper.updateById(any())).thenReturn(1);

        PreferenceResponse response = service.updateVocabularyGoals(1L, 20, 5);

        ArgumentCaptor<UserPreference> captor = ArgumentCaptor.forClass(UserPreference.class);
        verify(preferenceMapper).updateById(captor.capture());
        assertEquals(10, captor.getValue().getVocabGroupSize());
        assertEquals(20, captor.getValue().getDailyNewWords());
        assertEquals(5, captor.getValue().getDailyReviewWords());
        assertEquals(10, response.getVocabGroupSize());
        assertEquals(20, response.getDailyNewWords());
        assertEquals(5, response.getDailyReviewWords());
        verify(preferenceMapper, never()).insert(any());
    }

    @Test
    void updateVocabularyGoalsRejectsOutOfRangeValues() {
        when(userMapper.selectById(1L)).thenReturn(new SysUser());

        assertThrows(IllegalArgumentException.class, () -> service.updateVocabularyGoals(1L, 0, 5));
        assertThrows(IllegalArgumentException.class, () -> service.updateVocabularyGoals(1L, 51, 5));
        assertThrows(IllegalArgumentException.class, () -> service.updateVocabularyGoals(1L, 10, -1));
        assertThrows(IllegalArgumentException.class, () -> service.updateVocabularyGoals(1L, 10, 51));
        assertThrows(IllegalArgumentException.class, () -> service.updateVocabularyGoals(1L, null, 5));
        assertThrows(IllegalArgumentException.class, () -> service.updateVocabularyGoals(1L, 10, null));
    }

    @Test
    void updateVocabularyGoalsRejectsUnknownUser() {
        when(userMapper.selectById(1L)).thenReturn(null);

        assertThrows(IllegalArgumentException.class, () -> service.updateVocabularyGoals(1L, 10, 5));
    }
}
