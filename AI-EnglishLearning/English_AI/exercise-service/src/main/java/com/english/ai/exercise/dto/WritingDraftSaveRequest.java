package com.english.ai.exercise.dto;

import lombok.Data;

/**
 * 保存草稿请求。content 允许为空（用户清空正文但保留这一行草稿）。
 */
@Data
public class WritingDraftSaveRequest {

    /** 草稿正文，可为空 */
    private String content;

    /** 累计作答用时（秒），前端覆盖写入不作累加；为空按 0 处理 */
    private Integer elapsedSeconds;
}
