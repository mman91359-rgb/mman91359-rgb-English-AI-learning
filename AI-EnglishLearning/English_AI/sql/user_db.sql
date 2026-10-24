/*
 Navicat Premium Data Transfer

 Source Server         : wlgsy
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : user_db

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 17/10/2026 12:04:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码(BCrypt加密)',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像URL',
  `cet_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '考试级别: CET4/CET6',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `roles` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'ROLE_USER' COMMENT '角色: ROLE_USER/ROLE_ADMIN',
  `status` tinyint(0) NULL DEFAULT 1 COMMENT '状态: 1=正常, 0=禁用',
  `last_login_at` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户账户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '张三', '$2b$12$D4J1dFB/mzD.dDeUfNHv0eNeJ4M6D4Zu.Xu89LQAPeuY9cz0iZ2O6', '张三', NULL, 'CET4', NULL, 'ROLE_USER', 1, '2026-06-22 09:24:38', '2026-06-16 10:40:46', '2026-06-16 10:40:46');
INSERT INTO `sys_user` VALUES (2, 'testuser', '$2a$12$Sp.HfVSz9sWLI1GTsb41tuuKrKOwHHOQuzmn3XB0Do/U0w.f2DmEa', 'testuser', NULL, 'CET6', NULL, 'ROLE_USER', 1, '2026-06-22 20:53:02', NULL, '2026-06-16 11:41:54');
INSERT INTO `sys_user` VALUES (3, 'newuser', '$2a$12$9P2.OCiwz60DkGAzMddf1OloT5vGNsBIAOATaFrdubu/uK1Nz17Su', 'newuser', NULL, 'CET4', NULL, 'ROLE_USER', 1, NULL, '2026-06-16 11:20:24', '2026-06-16 11:20:24');
INSERT INTO `sys_user` VALUES (4, 'elotest', '$2a$12$YPdPzp0pBlqR8gGxsEwa0e0wbwQBUno96CXxYYEkHtra22BKc8pvq', 'elotest', NULL, 'CET6', NULL, 'ROLE_USER', 1, NULL, '2026-06-17 08:43:00', '2026-06-17 08:43:00');
INSERT INTO `sys_user` VALUES (5, '雄安', '$2a$12$4rp1jw4YyxoKxllPwGNjT.QGr9BS2TkZQuzo1JbBjgFceuAnqLV7a', '雄安', NULL, 'CET4', NULL, 'ROLE_USER', 1, '2026-06-20 14:18:43', '2026-06-17 11:29:36', '2026-06-17 11:29:36');
INSERT INTO `sys_user` VALUES (6, '马艺', '$2a$12$qXC1HJakaJMNZRkzMPswwu5MSgo6Dmi1IbylCe8W3/nL1NxtMhcBm', '蛮夷', '/user/avatar/6_de564176709349b5a791d6cee7f9b28e.jpg', 'CET4', '18516666665', 'ROLE_USER', 1, '2026-07-04 20:58:49', '2026-06-18 16:15:22', '2026-06-18 16:15:22');
INSERT INTO `sys_user` VALUES (7, 'debuguser', '$2a$12$gaS67EW/SWQAihksuoAFeOsidHwOukY0hC/WsAJtVoqeg0GwVEy.G', 'debuguser', NULL, 'CET4', NULL, 'ROLE_USER', 1, '2026-06-22 09:35:16', '2026-06-22 09:33:56', '2026-06-22 09:33:56');
INSERT INTO `sys_user` VALUES (8, 'newtest', '$2a$12$PmiqpKBt9LvXBTYPA2WxjuWSTT2oA.UF1KxngnzK9ailroW/zQFoS', 'newtest', NULL, 'CET4', NULL, 'ROLE_USER', 1, NULL, '2026-06-22 20:46:03', '2026-06-22 20:46:03');
INSERT INTO `sys_user` VALUES (9, 'testreg2', '$2a$12$nbymr9Jz4kYndmNKtloObuQAVnjVTiJGpN5vSXeMVkFQL9wpE1R7q', 'testreg2', NULL, 'CET6', NULL, 'ROLE_USER', 1, NULL, '2026-06-22 20:46:56', '2026-06-22 20:46:56');
INSERT INTO `sys_user` VALUES (10, 'codex_user_1782368688', '$2a$12$.lor7m1dN/TNT9jJb6fFb.VP8CGL3wRs6z0EuraD18WpGc9/.I3l.', 'codex_user_1782368688', NULL, 'CET4', NULL, 'ROLE_USER', 1, '2026-06-25 14:24:49', '2026-06-25 14:24:49', '2026-06-25 14:24:49');
INSERT INTO `sys_user` VALUES (11, 'codex_direct_1782368704', '$2a$12$LHIkHMrMEiWNrpOCeaclWOCbzpHX.kN4PUF2/5wrVRGwX3RqCaubC', 'codex_direct_1782368704', NULL, 'CET4', NULL, 'ROLE_USER', 1, NULL, '2026-06-25 14:25:06', '2026-06-25 14:25:06');
INSERT INTO `sys_user` VALUES (13, 'codex_fetch_1782368750008', '$2a$12$Sf1On3C80YFwXGXNlqbM/ujVIqWlDPLv8o9FbGdg4haKPlJMNqona', 'codex_fetch_1782368750008', NULL, 'CET4', NULL, 'ROLE_USER', 1, NULL, '2026-06-25 14:25:50', '2026-06-25 14:25:50');
INSERT INTO `sys_user` VALUES (14, 'codex_fetch_direct_1782368750050', '$2a$12$ONgSQgL1lF5.WYWLLT6/OOMXbnS3OATR5kyNXTbuDjqzA97/4hp9G', 'codex_fetch_direct_1782368750050', NULL, 'CET4', NULL, 'ROLE_USER', 1, NULL, '2026-06-25 14:25:50', '2026-06-25 14:25:50');
INSERT INTO `sys_user` VALUES (15, 'codex_flow_1782368842180', '$2a$12$t6jtUCWDEhWOWFEmtu7IOu8yyCkH8ByGK3ZJGh0WKt77YjrTMJ65O', 'codex_flow_1782368842180', NULL, 'CET4', NULL, 'ROLE_USER', 1, '2026-06-25 14:35:05', '2026-06-25 14:27:23', '2026-06-25 14:27:23');
INSERT INTO `sys_user` VALUES (16, 'codex_fix_1782370514572', '$2a$12$2odnDJQtRwnyDCcaPyDSmOElx5Ki8eGjG6tdBJRg.Jcv01wKxKHAu', 'codex_fix_1782370514572', NULL, 'CET4', '13800000000', 'ROLE_USER', 1, '2026-06-25 14:55:15', '2026-06-25 14:55:15', '2026-06-25 14:55:15');
INSERT INTO `sys_user` VALUES (17, 'aitest', '$2a$12$53cT4lCBPVSqwc3E8Qoyn.p20hAbEUcwIxMuOrOIoUCIsuZQ.96/C', 'aitest', NULL, NULL, NULL, 'ROLE_USER', 1, '2026-07-02 20:55:05', '2026-07-02 20:54:40', '2026-07-02 20:54:40');

-- ----------------------------
-- Table structure for user_ability_radar
-- ----------------------------
DROP TABLE IF EXISTS `user_ability_radar`;
CREATE TABLE `user_ability_radar`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `vocabulary_score` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '词汇能力分',
  `grammar_score` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '语法能力分',
  `listening_score` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '听力能力分',
  `reading_score` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '阅读能力分',
  `elo_score` int(0) NULL DEFAULT 1000 COMMENT 'ELO能力总分',
  `target_level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '目标等级/能力评级',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_id`(`user_id`) USING BTREE,
  INDEX `idx_elo_score`(`elo_score`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户能力雷达图表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_ability_radar
-- ----------------------------
INSERT INTO `user_ability_radar` VALUES (1, 1, 0.00, 0.00, 0.00, 0.00, 1000, 'CET4', '2026-06-17 08:38:17', '2026-06-17 08:38:17');
INSERT INTO `user_ability_radar` VALUES (2, 2, 10.00, 0.00, 0.00, 0.00, 882, 'CET6', '2026-06-17 08:38:17', '2026-06-17 08:38:17');
INSERT INTO `user_ability_radar` VALUES (3, 3, 10.00, 0.00, 0.00, 0.00, 1005, 'CET4', '2026-06-17 08:38:17', '2026-06-17 08:38:17');
INSERT INTO `user_ability_radar` VALUES (4, 4, 0.00, 0.00, 0.00, 0.00, 1000, 'CET6', '2026-06-17 08:43:00', '2026-06-17 08:43:00');
INSERT INTO `user_ability_radar` VALUES (5, 5, 5.00, 0.00, 0.00, 0.00, 309, 'CET4', '2026-06-17 11:29:36', '2026-06-17 11:29:36');
INSERT INTO `user_ability_radar` VALUES (6, 6, 70.10, 56.70, 0.00, 0.00, 760, 'CET4', '2026-06-18 16:15:22', '2026-06-18 16:15:22');
INSERT INTO `user_ability_radar` VALUES (7, 7, 0.00, 0.00, 0.00, 0.00, 988, 'CET4', '2026-06-22 09:33:56', '2026-06-22 09:33:56');
INSERT INTO `user_ability_radar` VALUES (8, 8, 0.00, 0.00, 0.00, 0.00, 1000, 'CET4', '2026-06-22 20:46:03', '2026-06-22 20:46:03');
INSERT INTO `user_ability_radar` VALUES (9, 9, 0.00, 0.00, 0.00, 0.00, 1000, 'CET6', '2026-06-22 20:46:56', '2026-06-22 20:46:56');
INSERT INTO `user_ability_radar` VALUES (10, 10, 0.00, 0.00, 0.00, 0.00, 1000, 'CET4', '2026-06-25 14:24:49', '2026-06-25 14:24:49');
INSERT INTO `user_ability_radar` VALUES (11, 11, 0.00, 0.00, 0.00, 0.00, 1000, 'CET4', '2026-06-25 14:25:06', '2026-06-25 14:25:06');
INSERT INTO `user_ability_radar` VALUES (12, 13, 0.00, 0.00, 0.00, 0.00, 1000, 'CET4', '2026-06-25 14:25:50', '2026-06-25 14:25:50');
INSERT INTO `user_ability_radar` VALUES (13, 14, 0.00, 0.00, 0.00, 0.00, 1000, 'CET4', '2026-06-25 14:25:50', '2026-06-25 14:25:50');
INSERT INTO `user_ability_radar` VALUES (14, 15, 0.00, 0.00, 0.00, 0.00, 988, 'CET4', '2026-06-25 14:27:23', '2026-06-25 14:27:23');
INSERT INTO `user_ability_radar` VALUES (15, 16, 0.00, 0.00, 0.00, 0.00, 1000, 'CET4', '2026-06-25 14:55:15', '2026-06-25 14:55:15');
INSERT INTO `user_ability_radar` VALUES (16, 17, 0.00, 0.00, 0.00, 0.00, 1000, NULL, '2026-07-02 20:54:40', '2026-07-02 20:54:40');
