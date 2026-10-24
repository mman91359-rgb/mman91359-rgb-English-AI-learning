/*
 Navicat Premium Data Transfer

 Source Server         : wlgsy
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : learning_db

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 17/10/2026 12:04:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user_memory_curve
-- ----------------------------
DROP TABLE IF EXISTS `user_memory_curve`;
CREATE TABLE `user_memory_curve`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `question_id` bigint(0) NOT NULL COMMENT '题目ID',
  `mastery_level` int(0) NULL DEFAULT 1 COMMENT '掌握等级: 1=陌生, 2=模糊, 3=熟悉, 4=熟练, 5=精通',
  `next_review_time` datetime(0) NOT NULL COMMENT '下次复习时间',
  `review_count` int(0) NULL DEFAULT 0 COMMENT '已复习次数',
  `last_review_at` datetime(0) NULL DEFAULT NULL COMMENT '最后复习时间',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_question`(`user_id`, `question_id`) USING BTREE,
  INDEX `idx_user_review`(`user_id`, `next_review_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '艾宾浩斯遗忘曲线表(系统核心表)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_memory_curve
-- ----------------------------
INSERT INTO `user_memory_curve` VALUES (1, 1, 1, 2, '2026-06-19 11:30:40', 1, '2026-06-16 11:30:40', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (2, 2, 3, 3, '2026-06-24 11:44:28', 5, '2026-06-17 11:44:28', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (3, 2, 28, 1, '2026-06-18 09:12:04', 0, '2026-06-17 09:12:04', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (4, 2, 2, 1, '2026-06-18 09:18:03', 0, '2026-06-17 09:18:03', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (5, 2, 18, 1, '2026-06-18 09:21:26', 0, '2026-06-17 09:21:26', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (6, 2, 23, 1, '2026-06-18 09:23:21', 0, '2026-06-17 09:23:21', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (7, 2, 27, 1, '2026-06-18 09:25:11', 0, '2026-06-17 09:25:11', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (8, 2, 13, 1, '2026-06-18 09:34:08', 1, '2026-06-17 09:34:08', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (9, 5, 3, 1, '2026-06-18 11:47:29', 7, '2026-06-17 11:47:29', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (10, 5, 34, 1, '2026-06-18 11:32:13', 1, '2026-06-17 11:32:13', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (11, 5, 18, 1, '2026-06-18 16:38:19', 2, '2026-06-17 16:38:19', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (12, 5, 19, 1, '2026-06-18 11:35:42', 1, '2026-06-17 11:35:42', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (13, 5, 13, 1, '2026-06-18 11:47:41', 3, '2026-06-17 11:47:41', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (14, 5, 21, 1, '2026-06-18 16:38:23', 4, '2026-06-17 16:38:23', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (15, 5, 27, 1, '2026-06-18 11:47:47', 3, '2026-06-17 11:47:47', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (16, 5, 1, 1, '2026-06-18 11:47:48', 3, '2026-06-17 11:47:48', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (17, 2, 30, 1, '2026-06-18 11:44:28', 1, '2026-06-17 11:44:28', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (18, 5, 8, 1, '2026-06-18 11:47:50', 1, '2026-06-17 11:47:50', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (19, 5, 11, 1, '2026-06-18 11:47:52', 1, '2026-06-17 11:47:52', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (20, 5, 23, 1, '2026-06-18 16:38:24', 0, '2026-06-17 16:38:24', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (21, 5, 53, 1, '2026-06-18 19:09:36', 2, '2026-06-17 19:09:36', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (22, 5, 63, 1, '2026-06-18 19:09:42', 2, '2026-06-17 19:09:42', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (23, 5, 71, 1, '2026-06-18 17:01:49', 0, '2026-06-17 17:01:49', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (24, 5, 77, 1, '2026-06-18 17:01:51', 0, '2026-06-17 17:01:51', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (25, 5, 51, 1, '2026-06-18 17:01:53', 0, '2026-06-17 17:01:53', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (26, 5, 58, 1, '2026-06-18 17:01:58', 0, '2026-06-17 17:01:58', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (27, 5, 57, 1, '2026-06-18 19:09:38', 1, '2026-06-17 19:09:38', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (28, 5, 68, 1, '2026-06-18 19:09:14', 0, '2026-06-17 19:09:14', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (29, 5, 127, 1, '2026-06-21 14:19:18', 0, '2026-06-20 14:19:18', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (30, 5, 128, 1, '2026-06-21 14:19:25', 0, '2026-06-20 14:19:25', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (31, 6, 108, 1, '2026-06-21 14:51:43', 0, '2026-06-20 14:51:43', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (32, 6, 109, 1, '2026-06-21 14:51:48', 0, '2026-06-20 14:51:48', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (33, 6, 112, 1, '2026-06-21 14:52:02', 0, '2026-06-20 14:52:02', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (34, 6, 119, 1, '2026-06-23 09:00:38', 1, '2026-06-22 09:00:38', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (35, 6, 124, 1, '2026-06-21 14:52:15', 0, '2026-06-20 14:52:15', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (36, 6, 125, 1, '2026-06-23 09:00:42', 1, '2026-06-22 09:00:42', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (37, 6, 134, 1, '2026-06-23 21:02:15', 3, '2026-06-22 21:02:15', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (38, 6, 102, 1, '2026-06-21 17:25:14', 0, '2026-06-20 17:25:14', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (39, 6, 103, 2, '2026-06-25 09:38:09', 2, '2026-06-22 09:38:09', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (40, 6, 104, 1, '2026-06-23 08:59:04', 1, '2026-06-22 08:59:04', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (41, 6, 118, 1, '2026-06-23 10:32:26', 1, '2026-06-22 10:32:26', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (42, 3, 101, 1, '2026-06-23 09:24:07', 0, '2026-06-22 09:24:07', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (43, 6, 107, 1, '2026-06-23 09:30:24', 0, '2026-06-22 09:30:24', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (44, 6, 123, 1, '2026-06-23 09:30:27', 0, '2026-06-22 09:30:27', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (45, 2, 153, 1, '2026-06-23 09:32:44', 0, '2026-06-22 09:32:44', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (46, 7, 114, 1, '2026-06-23 09:35:16', 0, '2026-06-22 09:35:16', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (47, 6, 113, 1, '2026-06-23 21:22:08', 0, '2026-06-22 21:22:08', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (48, 6, 194, 1, '2026-06-23 21:57:22', 0, '2026-06-22 21:57:22', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (49, 6, 347, 1, '2026-06-23 22:52:38', 3, '2026-06-22 22:52:38', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (50, 6, 345, 1, '2026-06-23 22:52:40', 2, '2026-06-22 22:52:40', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (51, 6, 355, 2, '2026-06-25 22:51:53', 1, '2026-06-22 22:51:53', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (52, 6, 359, 1, '2026-06-25 10:49:37', 1, '2026-06-24 10:49:37', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (53, 6, 349, 1, '2026-06-25 10:38:09', 1, '2026-06-24 10:38:09', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (54, 6, 361, 1, '2026-06-23 22:52:04', 0, '2026-06-22 22:52:04', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (55, 6, 348, 1, '2026-06-23 22:52:07', 0, '2026-06-22 22:52:07', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (56, 6, 350, 1, '2026-06-23 22:52:10', 0, '2026-06-22 22:52:10', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (57, 6, 351, 1, '2026-06-23 22:52:12', 0, '2026-06-22 22:52:12', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (58, 6, 354, 1, '2026-06-23 22:52:15', 0, '2026-06-22 22:52:15', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (59, 6, 356, 1, '2026-06-23 22:52:18', 0, '2026-06-22 22:52:18', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (60, 6, 362, 1, '2026-06-23 22:52:21', 0, '2026-06-22 22:52:21', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (61, 6, 346, 1, '2026-06-23 22:52:24', 0, '2026-06-22 22:52:24', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (62, 6, 353, 1, '2026-06-23 22:52:26', 0, '2026-06-22 22:52:26', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (63, 6, 357, 1, '2026-06-24 09:47:12', 1, '2026-06-23 09:47:12', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (64, 6, 358, 1, '2026-06-23 22:52:31', 0, '2026-06-22 22:52:31', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (65, 6, 360, 2, '2026-06-26 10:00:13', 1, '2026-06-23 10:00:13', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (66, 6, 363, 1, '2026-06-25 10:49:19', 2, '2026-06-24 10:49:19', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (67, 6, 299, 2, '2026-07-05 16:55:08', 1, '2026-07-02 16:55:08', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (68, 6, 302, 1, '2026-07-02 10:44:46', 1, '2026-07-01 10:44:46', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (69, 6, 284, 2, '2026-07-06 15:06:02', 1, '2026-07-03 15:06:02', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (70, 6, 313, 2, '2026-07-05 16:53:49', 1, '2026-07-02 16:53:49', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (71, 6, 303, 2, '2026-07-05 15:30:32', 1, '2026-07-02 15:30:32', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (72, 6, 307, 2, '2026-07-05 15:31:02', 1, '2026-07-02 15:31:02', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (73, 6, 308, 1, '2026-07-03 16:32:48', 1, '2026-07-02 16:32:48', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (74, 6, 311, 2, '2026-07-05 16:34:13', 1, '2026-07-02 16:34:13', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (75, 6, 312, 2, '2026-07-05 16:36:48', 1, '2026-07-02 16:36:48', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (76, 6, 290, 2, '2026-07-06 15:06:33', 1, '2026-07-03 15:06:33', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (77, 6, 292, 1, '2026-07-04 15:07:14', 1, '2026-07-03 15:07:14', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (78, 6, 293, 2, '2026-07-07 14:15:17', 1, '2026-07-04 14:15:17', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (79, 6, 300, 1, '2026-06-25 09:06:29', 0, '2026-06-24 09:06:29', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (80, 6, 304, 1, '2026-06-25 09:06:33', 0, '2026-06-24 09:06:33', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (81, 6, 305, 1, '2026-06-25 09:06:35', 0, '2026-06-24 09:06:35', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (82, 6, 286, 2, '2026-07-05 17:00:05', 1, '2026-07-02 17:00:05', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (83, 6, 294, 2, '2026-07-05 17:02:33', 1, '2026-07-02 17:02:33', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (84, 6, 285, 1, '2026-06-25 09:06:47', 0, '2026-06-24 09:06:47', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (85, 6, 341, 1, '2026-06-25 09:06:50', 0, '2026-06-24 09:06:50', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (86, 6, 343, 1, '2026-06-25 09:16:59', 1, '2026-06-24 09:16:59', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (87, 6, 339, 1, '2026-06-25 09:17:15', 1, '2026-06-24 09:17:15', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (88, 6, 288, 1, '2026-06-27 14:42:23', 4, '2026-06-26 14:42:23', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (89, 6, 306, 1, '2026-06-27 14:34:58', 2, '2026-06-26 14:34:58', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (90, 6, 427, 1, '2026-07-03 14:13:00', 5, '2026-07-02 14:13:00', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (91, 6, 296, 2, '2026-06-28 16:34:38', 1, '2026-06-25 16:34:38', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (92, 6, 431, 2, '2026-07-05 20:56:37', 5, '2026-07-02 20:56:37', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (93, 6, 436, 2, '2026-07-05 21:23:18', 3, '2026-07-02 21:23:18', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (94, 6, 442, 1, '2026-07-03 14:31:37', 2, '2026-07-02 14:31:37', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (95, 6, 434, 2, '2026-07-05 20:56:41', 5, '2026-07-02 20:56:41', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (96, 6, 426, 1, '2026-07-03 14:31:28', 4, '2026-07-02 14:31:28', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (97, 6, 309, 1, '2026-06-26 16:08:31', 2, '2026-06-25 16:08:31', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (98, 6, 433, 1, '2026-07-03 14:31:32', 4, '2026-07-02 14:31:32', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (99, 6, 437, 1, '2026-07-03 14:31:41', 5, '2026-07-02 14:31:41', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (100, 6, 443, 1, '2026-07-03 14:42:23', 6, '2026-07-02 14:42:23', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (101, 6, 440, 2, '2026-07-05 15:08:29', 7, '2026-07-02 15:08:29', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (102, 6, 438, 1, '2026-07-03 15:08:35', 6, '2026-07-02 15:08:35', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (103, 6, 429, 1, '2026-07-03 14:54:08', 8, '2026-07-02 14:54:08', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (104, 6, 439, 1, '2026-07-03 14:13:09', 5, '2026-07-02 14:13:09', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (105, 6, 432, 1, '2026-07-03 14:13:16', 4, '2026-07-02 14:13:16', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (106, 6, 425, 2, '2026-07-05 15:08:39', 6, '2026-07-02 15:08:39', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (107, 6, 441, 2, '2026-07-05 20:56:22', 3, '2026-07-02 20:56:22', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (108, 6, 295, 1, '2026-06-27 13:59:15', 2, '2026-06-26 13:59:15', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (109, 6, 297, 2, '2026-06-29 13:59:20', 3, '2026-06-26 13:59:20', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (110, 6, 310, 1, '2026-06-25 20:26:57', 0, '2026-06-24 20:26:57', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (111, 6, 301, 3, '2026-07-03 14:41:10', 2, '2026-06-26 14:41:10', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (112, 6, 287, 1, '2026-06-26 14:00:49', 1, '2026-06-25 14:00:49', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (113, 6, 289, 1, '2026-06-27 13:55:20', 2, '2026-06-26 13:55:20', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (114, 15, 297, 1, '2026-06-26 14:27:23', 0, '2026-06-25 14:27:23', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (115, 6, 435, 1, '2026-07-03 14:13:11', 3, '2026-07-02 14:13:11', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (116, 6, 428, 2, '2026-07-05 20:56:29', 2, '2026-07-02 20:56:29', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (117, 6, 342, 1, '2026-06-27 16:25:55', 0, '2026-06-26 16:25:55', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (118, 6, 332, 1, '2026-06-27 16:26:10', 0, '2026-06-26 16:26:10', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (119, 6, 333, 1, '2026-06-27 16:30:55', 0, '2026-06-26 16:30:55', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (120, 6, 337, 1, '2026-06-27 16:50:55', 0, '2026-06-26 16:50:55', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (121, 6, 338, 1, '2026-06-27 17:09:55', 0, '2026-06-26 17:09:55', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (122, 6, 340, 1, '2026-06-27 17:15:00', 0, '2026-06-26 17:15:00', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (123, 6, 430, 2, '2026-07-05 20:56:32', 2, '2026-07-02 20:56:32', NULL, NULL);
INSERT INTO `user_memory_curve` VALUES (124, 6, 424, 1, '2026-07-03 14:13:14', 3, '2026-07-02 14:13:14', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
