package com.english.ai.user.dto.admin;

import lombok.Builder;
import lombok.Data;

import java.util.Map;

/**
 * 管理员用户详情。
 */
@Data
@Builder
public class AdminUserDetailVO {

    private AdminUserListItem user;
    private Map<String, Object> radar;
    private Map<String, Object> coin;
    private Map<String, Object> preference;
    /** 学习统计；exercise-service 不可用时为 null */
    private Object stats;
}
