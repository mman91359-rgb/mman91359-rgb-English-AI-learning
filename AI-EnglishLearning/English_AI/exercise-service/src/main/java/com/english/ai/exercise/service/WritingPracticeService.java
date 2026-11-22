package com.english.ai.exercise.service;

import com.english.ai.common.PageResult;
import com.english.ai.exercise.dto.WritingDraftSaveRequest;
import com.english.ai.exercise.dto.WritingDraftVO;
import com.english.ai.exercise.dto.WritingTopicVO;

import java.util.List;

/**
 * 写作练习支撑服务：题库、草稿、收藏。
 * <p>
 * 与 {@link WritingService}（提交与 AI 评分）分工：本接口只管「练习前后的数据」，不碰评分链路。
 * userId 一律由上层从 X-User-Id 取得后传入，本层不做身份校验。
 */
public interface WritingPracticeService {

    /** 分页查询题库；level、type 为空表示不限，只返回 PUBLISHED */
    PageResult<WritingTopicVO> pageTopics(String level, String type, int page, int size);

    /** 读草稿；没有则返回 null（前端判断 null 走「新题」分支） */
    WritingDraftVO getDraft(Long userId, String topicKey);

    /** 保存草稿；已有则覆盖，没有则新建。topicKey 不存在抛 TOPIC_NOT_FOUND */
    WritingDraftVO saveDraft(Long userId, String topicKey, WritingDraftSaveRequest request);

    /** 删草稿；不存在也视为成功（幂等） */
    void deleteDraft(Long userId, String topicKey);

    /** 草稿列表，按最近保存倒序 */
    List<WritingDraftVO> listDrafts(Long userId);

    /** 收藏的 topicKey 列表，按收藏时间倒序 */
    List<String> listFavoriteTopicKeys(Long userId);

    /** 加/取消收藏；重复调用同一方向幂等。收藏不存在的题目抛 TOPIC_NOT_FOUND */
    void toggleFavorite(Long userId, String topicKey, boolean favorite);
}
