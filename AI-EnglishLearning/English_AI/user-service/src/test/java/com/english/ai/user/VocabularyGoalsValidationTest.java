package com.english.ai.user;

import com.english.ai.user.dto.UpdateVocabularyGoalsRequest;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * 每日词汇目标 DTO 的边界校验。
 */
class VocabularyGoalsValidationTest {

    private final Validator validator = Validation.buildDefaultValidatorFactory().getValidator();

    @Test
    void validGoalsPass() {
        UpdateVocabularyGoalsRequest request = new UpdateVocabularyGoalsRequest();
        request.setUserId(1L);
        request.setDailyNewWords(10);
        request.setDailyReviewWords(5);

        assertTrue(validator.validate(request).isEmpty());
    }

    @Test
    void newWordsBelowMinimumIsRejected() {
        UpdateVocabularyGoalsRequest request = new UpdateVocabularyGoalsRequest();
        request.setUserId(1L);
        request.setDailyNewWords(0);
        request.setDailyReviewWords(5);

        assertFalse(validator.validate(request).isEmpty());
    }

    @Test
    void reviewWordsAboveMaximumIsRejected() {
        UpdateVocabularyGoalsRequest request = new UpdateVocabularyGoalsRequest();
        request.setUserId(1L);
        request.setDailyNewWords(10);
        request.setDailyReviewWords(51);

        assertFalse(validator.validate(request).isEmpty());
    }

    @Test
    void missingUserIdIsRejected() {
        UpdateVocabularyGoalsRequest request = new UpdateVocabularyGoalsRequest();
        request.setDailyNewWords(10);
        request.setDailyReviewWords(5);

        assertFalse(validator.validate(request).isEmpty());
    }
}
