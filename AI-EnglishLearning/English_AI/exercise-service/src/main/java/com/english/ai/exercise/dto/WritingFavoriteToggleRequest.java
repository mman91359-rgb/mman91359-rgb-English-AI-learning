package com.english.ai.exercise.dto;

import lombok.Data;

/**
 * 加/取消收藏请求。favorite=true 收藏、false 取消，由服务端保证幂等。
 */
@Data
public class WritingFavoriteToggleRequest {

    /** 题目key */
    private String topicKey;

    /** true=收藏, false=取消收藏 */
    private Boolean favorite;
}
