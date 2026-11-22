package com.english.ai.exercise.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.english.ai.common.BizCode;
import com.english.ai.common.BusinessException;
import com.english.ai.common.PageResult;
import com.english.ai.exercise.dto.WritingDraftSaveRequest;
import com.english.ai.exercise.dto.WritingDraftVO;
import com.english.ai.exercise.dto.WritingTopicVO;
import com.english.ai.exercise.entity.WritingDraft;
import com.english.ai.exercise.entity.WritingFavorite;
import com.english.ai.exercise.entity.WritingTopic;
import com.english.ai.exercise.mapper.WritingDraftMapper;
import com.english.ai.exercise.mapper.WritingFavoriteMapper;
import com.english.ai.exercise.mapper.WritingTopicMapper;
import com.english.ai.exercise.service.WritingPracticeService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * 写作练习支撑服务实现：题库 / 草稿 / 收藏。
 * <p>
 * 并发口径：草稿与收藏都靠 DDL 里的 (user_id, topic_key) 唯一键兜底，
 * 应用层捕获 DuplicateKeyException 后退化为「已存在」语义，不靠先查后插来判重，
 * 因为先查后插在并发下仍会插出两条。
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class WritingPracticeServiceImpl implements WritingPracticeService {

    private static final String STATUS_PUBLISHED = "PUBLISHED";
    private static final int DEFAULT_SIZE = 20;
    private static final int MAX_SIZE = 100;

    private final WritingTopicMapper writingTopicMapper;
    private final WritingDraftMapper writingDraftMapper;
    private final WritingFavoriteMapper writingFavoriteMapper;
    private final ObjectMapper objectMapper;

    @Override
    public PageResult<WritingTopicVO> pageTopics(String level, String type, int page, int size) {
        int safePage = page < 1 ? 1 : page;
        int safeSize = size < 1 ? DEFAULT_SIZE : Math.min(size, MAX_SIZE);

        LambdaQueryWrapper<WritingTopic> q = new LambdaQueryWrapper<WritingTopic>()
                .eq(WritingTopic::getStatus, STATUS_PUBLISHED);
        if (StringUtils.hasText(level)) {
            q.eq(WritingTopic::getLevel, level.trim().toUpperCase());
        }
        if (StringUtils.hasText(type)) {
            q.eq(WritingTopic::getType, type.trim().toUpperCase());
        }
        q.orderByAsc(WritingTopic::getSortOrder).orderByAsc(WritingTopic::getId);

        Page<WritingTopic> result = writingTopicMapper.selectPage(new Page<>(safePage, safeSize), q);
        List<WritingTopicVO> records = result.getRecords().stream().map(this::toVO).toList();
        return PageResult.of(records, result.getTotal(), safePage, safeSize);
    }

    @Override
    public WritingDraftVO getDraft(Long userId, String topicKey) {
        WritingDraft draft = findDraft(userId, requireTopicKey(topicKey));
        return draft == null ? null : toVO(draft);
    }

    @Override
    public WritingDraftVO saveDraft(Long userId, String topicKey, WritingDraftSaveRequest request) {
        String key = requireTopicKey(topicKey);
        if (findTopic(key) == null) {
            throw new BusinessException(BizCode.TOPIC_NOT_FOUND);
        }

        String content = request == null ? null : request.getContent();
        int elapsed = request == null || request.getElapsedSeconds() == null
                ? 0 : Math.max(request.getElapsedSeconds(), 0);
        LocalDateTime now = LocalDateTime.now();

        WritingDraft existing = findDraft(userId, key);
        if (existing != null) {
            return updateDraft(existing, content, elapsed, now);
        }

        WritingDraft draft = new WritingDraft();
        draft.setUserId(userId);
        draft.setTopicKey(key);
        draft.setContent(content);
        draft.setElapsedSeconds(elapsed);
        draft.setCreatedAt(now);
        draft.setUpdatedAt(now);
        try {
            writingDraftMapper.insert(draft);
            return toVO(draft);
        } catch (DuplicateKeyException e) {
            // 并发下另一请求刚插入同一行，退化为更新，结果仍一致
            log.info("草稿并发插入命中唯一键，转为更新: userId={}, topicKey={}", userId, key);
            WritingDraft concurrent = findDraft(userId, key);
            if (concurrent == null) {
                throw new BusinessException(BizCode.DRAFT_SAVE_FAILED);
            }
            return updateDraft(concurrent, content, elapsed, now);
        } catch (Exception e) {
            log.error("草稿保存失败: userId={}, topicKey={}", userId, key, e);
            throw new BusinessException(BizCode.DRAFT_SAVE_FAILED);
        }
    }

    @Override
    public void deleteDraft(Long userId, String topicKey) {
        writingDraftMapper.delete(new LambdaQueryWrapper<WritingDraft>()
                .eq(WritingDraft::getUserId, userId)
                .eq(WritingDraft::getTopicKey, requireTopicKey(topicKey)));
    }

    @Override
    public List<WritingDraftVO> listDrafts(Long userId) {
        List<WritingDraft> drafts = writingDraftMapper.selectList(new LambdaQueryWrapper<WritingDraft>()
                .eq(WritingDraft::getUserId, userId)
                .orderByDesc(WritingDraft::getUpdatedAt));
        return drafts.stream().map(this::toVO).toList();
    }

    @Override
    public List<String> listFavoriteTopicKeys(Long userId) {
        List<WritingFavorite> favorites = writingFavoriteMapper.selectList(new LambdaQueryWrapper<WritingFavorite>()
                .eq(WritingFavorite::getUserId, userId)
                .orderByDesc(WritingFavorite::getCreatedAt));
        return favorites.stream().map(WritingFavorite::getTopicKey).toList();
    }

    @Override
    public void toggleFavorite(Long userId, String topicKey, boolean favorite) {
        String key = requireTopicKey(topicKey);
        if (!favorite) {
            writingFavoriteMapper.delete(new LambdaQueryWrapper<WritingFavorite>()
                    .eq(WritingFavorite::getUserId, userId)
                    .eq(WritingFavorite::getTopicKey, key));
            return;
        }

        if (findFavorite(userId, key) != null) {
            return;
        }
        if (findTopic(key) == null) {
            throw new BusinessException(BizCode.TOPIC_NOT_FOUND);
        }

        WritingFavorite entity = new WritingFavorite();
        entity.setUserId(userId);
        entity.setTopicKey(key);
        entity.setCreatedAt(LocalDateTime.now());
        try {
            writingFavoriteMapper.insert(entity);
        } catch (DuplicateKeyException e) {
            // 并发重复收藏，唯一键已拦住，按已收藏处理
            log.info("收藏并发插入命中唯一键，按已收藏处理: userId={}, topicKey={}", userId, key);
        }
    }

    // ========== 内部方法 ==========

    private WritingDraft findDraft(Long userId, String topicKey) {
        return writingDraftMapper.selectOne(new LambdaQueryWrapper<WritingDraft>()
                .eq(WritingDraft::getUserId, userId)
                .eq(WritingDraft::getTopicKey, topicKey));
    }

    private WritingFavorite findFavorite(Long userId, String topicKey) {
        return writingFavoriteMapper.selectOne(new LambdaQueryWrapper<WritingFavorite>()
                .eq(WritingFavorite::getUserId, userId)
                .eq(WritingFavorite::getTopicKey, topicKey));
    }

    private WritingTopic findTopic(String topicKey) {
        return writingTopicMapper.selectOne(new LambdaQueryWrapper<WritingTopic>()
                .eq(WritingTopic::getTopicKey, topicKey));
    }

    private WritingDraftVO updateDraft(WritingDraft draft, String content, int elapsed, LocalDateTime now) {
        draft.setContent(content);
        draft.setElapsedSeconds(elapsed);
        draft.setUpdatedAt(now);
        writingDraftMapper.updateById(draft);
        return toVO(draft);
    }

    private String requireTopicKey(String topicKey) {
        if (!StringUtils.hasText(topicKey)) {
            throw new BusinessException(BizCode.PARAM_INVALID);
        }
        return topicKey.trim();
    }

    private WritingTopicVO toVO(WritingTopic topic) {
        WritingTopicVO vo = new WritingTopicVO();
        vo.setId(topic.getTopicKey());
        vo.setType(topic.getType());
        vo.setLevel(topic.getLevel());
        vo.setTitle(topic.getTitle());
        vo.setDirections(topic.getDirections());
        vo.setTopic(topic.getTopic());
        vo.setRequirements(parseStringList(topic.getRequirements()));
        vo.setWordRange(Arrays.asList(topic.getWordRangeMin(), topic.getWordRangeMax()));
        vo.setTimeLimitSeconds(topic.getTimeLimitSeconds());
        vo.setSource(topic.getSource());
        vo.setOutlineHints(parseStringList(topic.getOutlineHints()));
        vo.setUsefulExpressions(parseStringList(topic.getUsefulExpressions()));
        if (vo.getWordRange().get(0) == null) {
            vo.setWordRange(null);
        }
        return vo;
    }

    private WritingDraftVO toVO(WritingDraft draft) {
        WritingDraftVO vo = new WritingDraftVO();
        vo.setTopicId(draft.getTopicKey());
        vo.setContent(draft.getContent());
        vo.setUpdatedAt(draft.getUpdatedAt());
        vo.setElapsedSeconds(draft.getElapsedSeconds());
        return vo;
    }

    /** JSON 数组文本转 List；为空或解析失败一律返回空数组，不让前端处理 null */
    private List<String> parseStringList(String json) {
        if (!StringUtils.hasText(json)) {
            return Collections.emptyList();
        }
        try {
            return objectMapper.readValue(json, new TypeReference<List<String>>() {
            });
        } catch (Exception e) {
            log.warn("写作题目 JSON 数组解析失败，按空数组处理: {}", e.getMessage());
            return Collections.emptyList();
        }
    }
}
