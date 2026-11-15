package com.english.ai.user.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * 更新「收藏词并行」开关请求
 */
@Data
public class UpdateIncludeFavoriteWordsRequest {

    @NotNull(message = "userId不能为空")
    private Long userId;

    /** 是否让收藏词优先进入新词队列 */
    @NotNull(message = "收藏词并行开关不能为空")
    private Boolean includeFavoriteWords;
}
