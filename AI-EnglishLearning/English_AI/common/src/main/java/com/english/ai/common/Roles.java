package com.english.ai.common;

/**
 * 角色常量与判断工具。
 * 角色以逗号分隔字符串存储，例如 "ROLE_USER" 或 "ROLE_USER,ROLE_ADMIN"。
 */
public final class Roles {

    public static final String USER = "ROLE_USER";
    public static final String ADMIN = "ROLE_ADMIN";

    private Roles() {
    }

    public static boolean hasRole(String roles, String role) {
        if (roles == null || roles.isBlank() || role == null || role.isBlank()) {
            return false;
        }
        for (String item : roles.split(",")) {
            if (item.trim().equalsIgnoreCase(role.trim())) {
                return true;
            }
        }
        return false;
    }

    public static boolean isAdmin(String roles) {
        return hasRole(roles, ADMIN);
    }
}
