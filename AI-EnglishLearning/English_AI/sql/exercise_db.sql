/*
 Navicat Premium Data Transfer

 Source Server         : wlgsy
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : exercise_db

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 17/10/2026 12:04:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for daily_word
-- ----------------------------
DROP TABLE IF EXISTS `daily_word`;
CREATE TABLE `daily_word`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `word_id` bigint(0) NOT NULL COMMENT 'FK to word_dictionary.id',
  `date` date NOT NULL COMMENT '鏃ユ湡',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `date`(`date`) USING BTREE,
  INDEX `idx_date`(`date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '姣忔棩鍗曡瘝' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of daily_word
-- ----------------------------
INSERT INTO `daily_word` VALUES (2, 2, '2026-06-25', '2026-06-25 15:34:39');
INSERT INTO `daily_word` VALUES (3, 3, '2026-06-26', '2026-06-26 13:54:32');
INSERT INTO `daily_word` VALUES (4, 4, '2026-06-29', '2026-06-29 08:26:39');
INSERT INTO `daily_word` VALUES (5, 5, '2026-06-30', '2026-06-30 08:22:08');
INSERT INTO `daily_word` VALUES (6, 6, '2026-07-01', '2026-07-01 08:20:09');
INSERT INTO `daily_word` VALUES (7, 7, '2026-07-02', '2026-07-02 13:50:31');
INSERT INTO `daily_word` VALUES (8, 8, '2026-07-03', '2026-07-03 13:58:35');
INSERT INTO `daily_word` VALUES (9, 9, '2026-07-04', '2026-07-04 13:42:59');

-- ----------------------------
-- Table structure for knowledge_mapping
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_mapping`;
CREATE TABLE `knowledge_mapping`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '映射ID',
  `question_id` bigint(0) NOT NULL COMMENT '题目ID',
  `knowledge_point_id` bigint(0) NOT NULL COMMENT '知识点ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_question_knowledge`(`question_id`, `knowledge_point_id`) USING BTREE,
  INDEX `idx_question_id`(`question_id`) USING BTREE,
  INDEX `idx_knowledge_point_id`(`knowledge_point_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 455 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '题目-知识点映射表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knowledge_mapping
-- ----------------------------
INSERT INTO `knowledge_mapping` VALUES (276, 284, 1);
INSERT INTO `knowledge_mapping` VALUES (277, 285, 5);
INSERT INTO `knowledge_mapping` VALUES (278, 286, 1);
INSERT INTO `knowledge_mapping` VALUES (279, 287, 3);
INSERT INTO `knowledge_mapping` VALUES (280, 288, 3);
INSERT INTO `knowledge_mapping` VALUES (281, 289, 5);
INSERT INTO `knowledge_mapping` VALUES (282, 290, 4);
INSERT INTO `knowledge_mapping` VALUES (283, 291, 5);
INSERT INTO `knowledge_mapping` VALUES (284, 292, 3);
INSERT INTO `knowledge_mapping` VALUES (285, 293, 1);
INSERT INTO `knowledge_mapping` VALUES (286, 294, 1);
INSERT INTO `knowledge_mapping` VALUES (287, 295, 6);
INSERT INTO `knowledge_mapping` VALUES (288, 296, 3);
INSERT INTO `knowledge_mapping` VALUES (289, 297, 4);
INSERT INTO `knowledge_mapping` VALUES (290, 298, 6);
INSERT INTO `knowledge_mapping` VALUES (291, 299, 1);
INSERT INTO `knowledge_mapping` VALUES (292, 300, 5);
INSERT INTO `knowledge_mapping` VALUES (293, 301, 3);
INSERT INTO `knowledge_mapping` VALUES (294, 302, 1);
INSERT INTO `knowledge_mapping` VALUES (295, 303, 4);
INSERT INTO `knowledge_mapping` VALUES (296, 304, 3);
INSERT INTO `knowledge_mapping` VALUES (297, 305, 1);
INSERT INTO `knowledge_mapping` VALUES (298, 306, 5);
INSERT INTO `knowledge_mapping` VALUES (299, 307, 1);
INSERT INTO `knowledge_mapping` VALUES (300, 308, 1);
INSERT INTO `knowledge_mapping` VALUES (301, 309, 6);
INSERT INTO `knowledge_mapping` VALUES (302, 310, 4);
INSERT INTO `knowledge_mapping` VALUES (303, 311, 1);
INSERT INTO `knowledge_mapping` VALUES (304, 312, 1);
INSERT INTO `knowledge_mapping` VALUES (305, 313, 4);
INSERT INTO `knowledge_mapping` VALUES (306, 314, 1);
INSERT INTO `knowledge_mapping` VALUES (307, 315, 1);
INSERT INTO `knowledge_mapping` VALUES (308, 316, 1);
INSERT INTO `knowledge_mapping` VALUES (309, 317, 3);
INSERT INTO `knowledge_mapping` VALUES (310, 318, 1);
INSERT INTO `knowledge_mapping` VALUES (311, 319, 1);
INSERT INTO `knowledge_mapping` VALUES (312, 320, 4);
INSERT INTO `knowledge_mapping` VALUES (313, 321, 1);
INSERT INTO `knowledge_mapping` VALUES (314, 322, 4);
INSERT INTO `knowledge_mapping` VALUES (315, 323, 4);
INSERT INTO `knowledge_mapping` VALUES (316, 324, 4);
INSERT INTO `knowledge_mapping` VALUES (317, 325, 1);
INSERT INTO `knowledge_mapping` VALUES (318, 326, 6);
INSERT INTO `knowledge_mapping` VALUES (319, 327, 6);
INSERT INTO `knowledge_mapping` VALUES (320, 328, 4);
INSERT INTO `knowledge_mapping` VALUES (321, 329, 6);
INSERT INTO `knowledge_mapping` VALUES (322, 330, 4);
INSERT INTO `knowledge_mapping` VALUES (323, 331, 3);
INSERT INTO `knowledge_mapping` VALUES (324, 332, 1);
INSERT INTO `knowledge_mapping` VALUES (325, 333, 1);
INSERT INTO `knowledge_mapping` VALUES (326, 334, 1);
INSERT INTO `knowledge_mapping` VALUES (327, 335, 5);
INSERT INTO `knowledge_mapping` VALUES (328, 336, 3);
INSERT INTO `knowledge_mapping` VALUES (329, 337, 1);
INSERT INTO `knowledge_mapping` VALUES (330, 338, 6);
INSERT INTO `knowledge_mapping` VALUES (331, 339, 1);
INSERT INTO `knowledge_mapping` VALUES (332, 340, 3);
INSERT INTO `knowledge_mapping` VALUES (333, 341, 1);
INSERT INTO `knowledge_mapping` VALUES (334, 342, 1);
INSERT INTO `knowledge_mapping` VALUES (335, 343, 1);
INSERT INTO `knowledge_mapping` VALUES (416, 424, 10);
INSERT INTO `knowledge_mapping` VALUES (417, 425, 9);
INSERT INTO `knowledge_mapping` VALUES (418, 426, 11);
INSERT INTO `knowledge_mapping` VALUES (419, 427, 8);
INSERT INTO `knowledge_mapping` VALUES (420, 428, 8);
INSERT INTO `knowledge_mapping` VALUES (421, 429, 8);
INSERT INTO `knowledge_mapping` VALUES (422, 430, 15);
INSERT INTO `knowledge_mapping` VALUES (423, 431, 10);
INSERT INTO `knowledge_mapping` VALUES (424, 432, 9);
INSERT INTO `knowledge_mapping` VALUES (425, 433, 10);
INSERT INTO `knowledge_mapping` VALUES (426, 434, 14);
INSERT INTO `knowledge_mapping` VALUES (427, 435, 9);
INSERT INTO `knowledge_mapping` VALUES (428, 436, 11);
INSERT INTO `knowledge_mapping` VALUES (429, 437, 10);
INSERT INTO `knowledge_mapping` VALUES (430, 438, 15);
INSERT INTO `knowledge_mapping` VALUES (431, 439, 10);
INSERT INTO `knowledge_mapping` VALUES (432, 440, 15);
INSERT INTO `knowledge_mapping` VALUES (433, 441, 14);
INSERT INTO `knowledge_mapping` VALUES (434, 442, 4);
INSERT INTO `knowledge_mapping` VALUES (435, 443, 10);
INSERT INTO `knowledge_mapping` VALUES (436, 444, 10);
INSERT INTO `knowledge_mapping` VALUES (437, 445, 10);
INSERT INTO `knowledge_mapping` VALUES (438, 446, 10);
INSERT INTO `knowledge_mapping` VALUES (439, 447, 10);
INSERT INTO `knowledge_mapping` VALUES (440, 448, 10);
INSERT INTO `knowledge_mapping` VALUES (441, 449, 11);
INSERT INTO `knowledge_mapping` VALUES (442, 450, 14);
INSERT INTO `knowledge_mapping` VALUES (443, 451, 10);
INSERT INTO `knowledge_mapping` VALUES (444, 452, 8);
INSERT INTO `knowledge_mapping` VALUES (445, 453, 14);
INSERT INTO `knowledge_mapping` VALUES (446, 454, 10);
INSERT INTO `knowledge_mapping` VALUES (447, 455, 10);
INSERT INTO `knowledge_mapping` VALUES (448, 456, 10);
INSERT INTO `knowledge_mapping` VALUES (449, 457, 10);
INSERT INTO `knowledge_mapping` VALUES (450, 458, 10);
INSERT INTO `knowledge_mapping` VALUES (451, 459, 14);
INSERT INTO `knowledge_mapping` VALUES (452, 460, 14);
INSERT INTO `knowledge_mapping` VALUES (453, 461, 11);
INSERT INTO `knowledge_mapping` VALUES (454, 462, 10);
INSERT INTO `knowledge_mapping` VALUES (455, 463, 10);

-- ----------------------------
-- Table structure for question_content
-- ----------------------------
DROP TABLE IF EXISTS `question_content`;
CREATE TABLE `question_content`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '内容ID',
  `question_id` bigint(0) NOT NULL COMMENT '题目ID(关联question_info)',
  `stem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '题干',
  `options` json NULL COMMENT '选项(JSON格式)',
  `correct_answer` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '正确答案',
  `analysis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '题目解析',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_question_id`(`question_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 463 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '题目内容表(前后端分离,防泄漏)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_content
-- ----------------------------
INSERT INTO `question_content` VALUES (284, 284, 'The company was ___ in 2005 and has grown rapidly since then.', '[]', 'established', '公司于2005年（成立），此后迅速发展壮大。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (285, 285, 'She is very ___ about her chances of winning the scholarship.', '[]', 'optimistic', '她对自己获得奖学金的机会非常（乐观）。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (286, 286, 'We need to ___ the problem before making a decision.', '[]', 'analyze', '在做决定之前我们需要先（分析）这个问题。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (287, 287, 'There is a growing ___ that climate change needs immediate action.', '[]', 'awareness', '人们越来越（意识到）气候变化需要立即采取行动。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (288, 288, 'He has a remarkable ___ for learning new languages.', '[]', 'capacity', '他学习新语言的（能力）非常出色。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (289, 289, 'The new policy will come into ___ next month.', '[]', 'effect', '新政策将于下个月（生效）。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (290, 290, 'The city has made ___ progress in reducing pollution.', '[]', 'significant', '该市在减少污染方面取得了（显著的）进步。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (291, 291, 'The doctor ___ him to take the medicine three times a day.', '[]', 'advised', '医生（建议）他每天服药三次。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (292, 292, 'Her performance in the exam was beyond our ___.', '[]', 'expectations', '她在考试中的表现超出了我们的（预期）。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (293, 293, 'These two words are similar in meaning but ___ in usage.', '[]', 'differ', '这两个词意思相近但用法（不同）。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (294, 294, 'The government is taking measures to ___ unemployment.', '[]', 'reduce', '政府正在采取措施（减少）失业率。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (295, 295, 'I can hardly ___ the difference between these two pictures.', '[]', 'distinguish', '我几乎无法（分辨）这两张图片的区别。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (296, 296, 'The book provides a detailed ___ of modern Chinese history.', '[]', 'account', '这本书对中国现代史提供了详细的（描述）。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (297, 297, 'He is one of the most ___ writers in contemporary literature.', '[]', 'influential', '他是当代文学中最有（影响力的）作家之一。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (298, 298, 'Many students find it difficult to ___ to college life.', '[]', 'adapt', '许多学生发现很难（适应）大学生活。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (299, 299, 'The research ___ that students who read more perform better.', '[]', 'indicates', '研究（表明）阅读量更大的学生表现更好。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (300, 300, 'We should take ___ of this opportunity to improve our skills.', '[]', 'advantage', '我们应该（利用）这个机会来提高我们的技能。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (301, 301, 'His ___ to the problem impressed all the experts.', '[]', 'approach', '他解决问题的（方法）给所有专家留下了深刻印象。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (302, 302, 'The company plans to ___ its business to overseas markets.', '[]', 'expand', '公司计划将业务（扩展到）海外市场。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (303, 303, 'A healthy diet is ___ to maintaining good health.', '[]', 'essential', '健康饮食对保持身体健康至关（重要）。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (304, 304, 'The students showed great ___ in solving the math problem.', '[]', 'enthusiasm', '学生们在解决数学问题时表现出极大的（热情）。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (305, 305, 'We cannot ___ the importance of a good education.', '[]', 'ignore', '我们不能（忽视）良好教育的重要性。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (306, 306, 'His success is largely ___ to his hard work and dedication.', '[]', 'due', '他的成功很大程度上（归功于）他的努力和奉献。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (307, 307, 'Reading can help to ___ your vocabulary significantly.', '[]', 'enrich', '阅读可以显著（丰富）你的词汇量。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (308, 308, 'The manager ___ the importance of team cooperation.', '[]', 'emphasized', '经理（强调了）团队合作的重要性。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (309, 309, 'The committee finally ___ a decision after three hours of discussion.', '[]', 'reached', '委员会经过三个小时的讨论终于（做出）了决定。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (310, 310, 'The evidence was ___ to prove his innocence beyond doubt.', '[]', 'sufficient', '证据（足以）毫无疑问地证明他的清白。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (311, 311, 'She decided to ___ English at a local university after graduation.', '[]', 'study', '她决定毕业后在当地大学（学习）英语。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (312, 312, 'We finally ___ our goal after three years of hard work.', '[]', 'achieved', '经过三年的努力，我们终于（实现）了目标。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (313, 313, 'A balanced diet is very ___ for children\'s growth.', '[]', 'important', '均衡饮食对儿童的成长非常（重要）。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (314, 314, 'The researchers sought to ___ their findings to a broader population.', '[]', 'generalize', '研究人员试图将他们的发现（推广）到更广泛的人群。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (315, 315, 'It is estimated that the project will take six months to ___.', '[]', 'complete', '据估计，这个项目需要六个月才能（完成）。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (316, 316, 'The government has pledged to ___ corruption within the public sector.', '[]', 'eliminate', '政府承诺（消除）公共部门的腐败现象。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (317, 317, 'The ___ of AI technology has transformed many industries.', '[]', 'emergence', '人工智能技术的（出现）已经改变了许多行业。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (318, 318, 'Many people tend to ___ their own achievements in the workplace.', '[]', 'overestimate', '许多人倾向于在工作中（高估）自己的成就。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (319, 319, 'Scientists are trying to ___ the mysteries of the human brain.', '[]', 'uncover', '科学家正在试图（揭开）人类大脑的奥秘。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (320, 320, '___ economic growth requires both innovation and structural reforms.', '[]', 'sustainable', '（可持续的）经济增长需要创新和结构性改革。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (321, 321, 'The professor ___ the importance of critical thinking in education.', '[]', 'emphasized', '教授（强调了）批判性思维在教育中的重要性。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (322, 322, 'The medication may have some side effects, but they are usually ___.', '[]', 'temporary', '这种药物可能有一些副作用，但通常是（暂时的）。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (323, 323, 'She has an ___ ability to understand complex philosophical concepts.', '[]', 'extraordinary', '她有一种（非凡的）能力来理解复杂的哲学概念。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (324, 324, 'The discovery was completely ___ and surprised all the scientists.', '[]', 'unexpected', '这个发现完全（出乎意料），令所有科学家感到惊讶。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (325, 325, 'The report ___ that pollution levels have increased by 30% this year.', '[]', 'indicates', '报告（表明）今年的污染水平上升了30%。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (326, 326, 'He was ___ of stealing confidential documents from the company.', '[]', 'accused', '他被（指控）从公司窃取机密文件。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (327, 327, 'The novel tells the story of a young woman ___ with her identity.', '[]', 'struggling', '这部小说讲述了一位年轻女子（挣扎于）自我认同的故事。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (328, 328, 'He delivered a ___ speech that inspired everyone in the audience.', '[]', 'compelling', '他发表了一场（令人信服的）演讲，激励了在场的每一个人。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (329, 329, 'The phenomenon described in the book is ___ to human behavior.', '[]', 'peculiar', '书中描述的现象是人类行为所（特有的）。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (330, 330, 'His argument was not ___ by any concrete evidence.', '[]', 'substantiated', '他的论点没有被任何具体证据（证实）。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (331, 331, 'The ___ distribution of resources is a major challenge for many nations.', '[]', 'unequal', '资源的（不平等）分配是许多国家面临的重大挑战。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (332, 332, 'The architect ___ a building that combines beauty with functionality.', '[]', 'designed', '建筑师（设计）了一座将美观与功能结合的建筑物。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (333, 333, 'The factory ___ over 1,000 cars every month.', '[]', 'produces', '这家工厂每月（生产）1000多辆汽车。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (334, 334, 'The museum ___ many valuable paintings from the 18th century.', '[]', 'displays', '博物馆（展示）了许多18世纪的珍贵画作。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (335, 335, 'He was ___ for his honesty and hard work by the manager.', '[]', 'praised', '他因诚实和勤奋受到了经理的（表扬）。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (336, 336, 'The two companies decided to ___ to develop new technology.', '[]', 'cooperate', '两家公司决定（合作）开发新技术。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (337, 337, 'A good teacher should be able to ___ complex ideas simply.', '[]', 'explain', '好老师应该能够简单地（解释）复杂的概念。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (338, 338, 'She was so tired that she could ___ stay awake.', '[]', 'hardly', '她太累了，（几乎）无法保持清醒。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (339, 339, 'Her dream is to ___ a famous writer one day.', '[]', 'become', '她的梦想是有一天（成为）一名著名作家。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (340, 340, 'He has a good ___ of computers and software.', '[]', 'knowledge', '他对计算机和软件有很好的（了解）。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (341, 341, 'Parents should ___ their children to read more books.', '[]', 'encourage', '家长应该（鼓励）孩子多读书。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (342, 342, 'Regular exercise can ___ the risk of heart disease significantly.', '[]', 'reduce', '定期锻炼可以显著（降低）心脏病的风险。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (343, 343, 'He spent the whole weekend ___ for the final exam.', '[]', 'preparing', '他花了整个周末（准备）期末考试。', '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_content` VALUES (424, 424, 'If I ___ you, I would accept the offer immediately.', '[\"A. am\", \"B. was\", \"C. be\", \"D. were\"]', 'D', '虚拟语气：与现在事实相反，be动词用were||如果我是你，我会立刻接受这个提议。', '2026-06-24 11:00:45', '2026-06-24 11:35:26');
INSERT INTO `question_content` VALUES (425, 425, 'The book ___ I borrowed from the library is very interesting.', '[\"A. who\", \"B. which\", \"C. what\", \"D. when\"]', 'B', '定语从句：先行词the book是物，用which引导||我从图书馆借的那本书非常有趣。', '2026-06-24 11:00:45', '2026-06-24 11:35:26');
INSERT INTO `question_content` VALUES (426, 426, 'Not until he arrived ___ the truth of the matter.', '[\"A. he knew\", \"B. he did know\", \"C. did he know\", \"D. knew he\"]', 'C', '倒装句：Not until在句首，主句部分倒装||直到他到达，他才知道事情的真相。', '2026-06-24 11:00:45', '2026-06-24 11:35:26');
INSERT INTO `question_content` VALUES (427, 427, 'She has been studying English ___ she was ten years old.', '[\"A. for\", \"B. when\", \"C. since\", \"D. while\"]', 'C', '现在完成进行时 + since + 过去时间点||她从十岁起就一直在学英语。', '2026-06-24 11:00:45', '2026-06-24 11:35:26');
INSERT INTO `question_content` VALUES (428, 428, 'It was in the library ___ I met Professor Wang yesterday.', '[\"A. where\", \"B. that\", \"C. which\", \"D. when\"]', 'B', '强调句型: It is/was…that…||我昨天是在图书馆遇见了王教授。', '2026-06-24 11:00:45', '2026-06-24 11:35:26');
INSERT INTO `question_content` VALUES (429, 429, 'By the time he arrives, we ___ for two hours.', '[\"A. will wait\", \"B. waited\", \"C. have waited\", \"D. will have been waiting\"]', 'D', '将来完成进行时: by the time + 现在时, 主句将来完成||等他到时，我们将已经等了两个小时。', '2026-06-24 11:00:45', '2026-06-24 11:35:26');
INSERT INTO `question_content` VALUES (430, 430, 'The teacher, as well as the students, ___ excited about the trip.', '[\"A. are\", \"B. is\", \"C. were\", \"D. have been\"]', 'B', '主谓一致：as well as连接时与第一个名词一致(The teacher)||老师和学生们一样对这次旅行感到兴奋。', '2026-06-24 11:00:45', '2026-06-24 11:35:26');
INSERT INTO `question_content` VALUES (431, 431, 'I wish I ___ harder when I was in college.', '[\"A. studied\", \"B. would study\", \"C. had studied\", \"D. study\"]', 'C', 'wish+虚拟语气：与过去事实相反用过去完成时||我真希望大学时能更努力学习。', '2026-06-24 11:00:45', '2026-06-24 11:35:26');
INSERT INTO `question_content` VALUES (432, 432, '___ is known to all, the earth moves around the sun.', '[\"A. It\", \"B. As\", \"C. That\", \"D. What\"]', 'B', 'as引导非限制性定语从句: 众所周知||众所周知，地球绕着太阳转。', '2026-06-24 11:00:45', '2026-06-24 11:35:26');
INSERT INTO `question_content` VALUES (433, 433, 'He talked as if he ___ everything about the project.', '[\"A. knows\", \"B. has known\", \"C. knew\", \"D. will know\"]', 'C', 'as if+虚拟语气：与现在事实相反用一般过去时||他说得好像他对这个项目了如指掌。', '2026-06-24 11:00:45', '2026-06-24 11:35:26');
INSERT INTO `question_content` VALUES (434, 434, '___ hard he tries, he never seems to satisfy his boss.', '[\"A. Whatever\", \"B. Whoever\", \"C. Whenever\", \"D. However\"]', 'D', 'However + adj/adv + 主语 + 谓语 = 无论多么||无论他多么努力，似乎都无法让老板满意。', '2026-06-24 11:00:45', '2026-06-24 11:35:26');
INSERT INTO `question_content` VALUES (435, 435, 'The house ___ roof was damaged in the storm has been repaired.', '[\"A. which\", \"B. that\", \"C. whose\", \"D. its\"]', 'C', '定语从句：whose表示所属关系||那栋屋顶在暴风雨中受损的房子已经修好了。', '2026-06-24 11:00:45', '2026-06-24 11:35:26');
INSERT INTO `question_content` VALUES (436, 436, 'Only by working together ___ solve this difficult problem.', '[\"A. we can\", \"B. we will\", \"C. can we\", \"D. will we\"]', 'C', 'Only+状语在句首，主句部分倒装||只有齐心协力，我们才能解决这个难题。', '2026-06-24 11:00:45', '2026-06-24 11:35:26');
INSERT INTO `question_content` VALUES (437, 437, 'What she said suggested that she ___ unhappy with the result.', '[\"A. be\", \"B. were\", \"C. is\", \"D. was\"]', 'D', 'suggest此处表暗示而非建议，不用虚拟语气||她的话暗示她对结果不满意。', '2026-06-24 11:00:45', '2026-06-24 11:35:26');
INSERT INTO `question_content` VALUES (438, 438, 'The number of students who ___ cars ___ increasing rapidly.', '[\"A. own ... is\", \"B. owns ... are\", \"C. own ... are\", \"D. owns ... is\"]', 'A', 'who指代students(复数)用own; The number of用单数is||拥有汽车的学生数量正在快速增长。', '2026-06-24 11:00:45', '2026-06-24 11:35:26');
INSERT INTO `question_content` VALUES (439, 439, 'Had I known the result earlier, I ___ a different decision.', '[\"A. would make\", \"B. would have made\", \"C. made\", \"D. have made\"]', 'B', '虚拟语气省略if的倒装：Had I known = If I had known||如果我早知道结果，我会做出不同的决定。', '2026-06-24 11:00:45', '2026-06-24 11:35:26');
INSERT INTO `question_content` VALUES (440, 440, 'He is the only one of the students who ___ passed the test.', '[\"A. have\", \"B. has\", \"C. had\", \"D. having\"]', 'B', 'the only one of + 复数名词 + who + 单数谓语||那些学生中只有他通过了考试。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (441, 441, '___ we have finished the course, we shall start revision.', '[\"A. Now that\", \"B. So that\", \"C. In that\", \"D. Except that\"]', 'A', 'Now that = 既然。引导原因状语从句||既然我们已完成课程，我们将开始复习。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (442, 442, 'There is no point ___ about the past; we should focus on the future.', '[\"A. to complain\", \"B. complaining\", \"C. in complaining\", \"D. complain\"]', 'C', 'There is no point in doing sth = 做某事没有意义||纠结过去没有意义，我们应该关注未来。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (443, 443, 'It is high time that we ___ actions to protect the environment.', '[\"A. take\", \"B. have taken\", \"C. will take\", \"D. took\"]', 'D', 'It is high time that + 过去时(虚拟语气)||我们早该采取行动保护环境了。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (444, 444, 'The committee recommended that measures ___ taken to address the issue.', '[\"A. are\", \"B. be\", \"C. were\", \"D. should\"]', 'B', 'recommend that + (should) + 动词原形，虚拟语气||委员会建议采取措施解决问题。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (445, 445, 'Had I known about the meeting, I ___ attended.', '[\"A. would have\", \"B. would\", \"C. will have\", \"D. should have\"]', 'A', '虚拟语气省略if倒装: Had I known = If I had known，主句would have done||要是我知道那个会议，我就参加了。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (446, 446, 'It is imperative that every student ___ a foreign language.', '[\"A. learns\", \"B. learn\", \"C. learned\", \"D. should learn\"]', 'B', 'It is imperative that + 主语 + (should) + 动词原形||每个学生都必须学习一门外语。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (447, 447, 'The professor suggested that he ___ harder.', '[\"A. studies\", \"B. study\", \"C. studied\", \"D. studying\"]', 'B', 'suggest表建议时，that从句用虚拟语气: (should) + 动词原形||教授建议他更加努力学习。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (448, 448, 'He speaks English as if he ___ a native speaker.', '[\"A. is\", \"B. were\", \"C. was\", \"D. be\"]', 'B', 'as if引导方式状语从句，与现在事实相反用were||他说英语就像母语者一样。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (449, 449, 'Not until all the data had been analyzed ___ the conclusion.', '[\"A. they reached\", \"B. did they reach\", \"C. they did reach\", \"D. reached they\"]', 'B', '否定词置于句首，主句部分倒装||直到所有数据被分析后，他们才得出结论。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (450, 450, 'The more you practice, the ___ progress you will make.', '[\"A. more\", \"B. most\", \"C. much\", \"D. many\"]', 'A', 'the + 比较级…，the + 比较级… = 越…越…||你练习越多，进步就越大。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (451, 451, '___, we would have succeeded.', '[\"A. Had we worked harder\", \"B. We had worked harder\", \"C. If we worked harder\", \"D. If we have worked harder\"]', 'A', '虚拟语气省略if倒装: Had we worked = If we had worked||如果我们更努力，我们就成功了。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (452, 452, 'It was not until midnight ___ the problem was finally solved.', '[\"A. when\", \"B. that\", \"C. which\", \"D. before\"]', 'B', '强调句型: It is/was not until…that…||直到午夜，问题才终于被解决。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (453, 453, '___ his inexperience, he performed remarkably well.', '[\"A. Considered\", \"B. Considering\", \"C. Being considered\", \"D. To consider\"]', 'B', 'considering (that) = 考虑到/鉴于，引导状语从句||考虑到他缺乏经验，他表现得异常出色。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (454, 454, 'He insisted that the meeting ___ postponed until next week.', '[\"A. will be\", \"B. is\", \"C. be\", \"D. was\"]', 'C', 'insist表坚决要求时，that从句用虚拟语气: (should) + 动词原形||他坚持会议推迟到下周。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (455, 455, 'It is essential that everyone ___ on time for the meeting.', '[\"A. arrives\", \"B. arrive\", \"C. arrived\", \"D. will arrive\"]', 'B', 'It is essential that + 主语 + (should) + 动词原形||每个人都必须准时参加会议。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (456, 456, 'Were it not for your help, I ___ the exam.', '[\"A. could not pass\", \"B. could not have passed\", \"C. can not pass\", \"D. did not pass\"]', 'B', '虚拟语气省略if倒装: Were it not = If it were not||要不是你的帮助，我考试就过不了了。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (457, 457, 'He looks as though he ___ a ghost.', '[\"A. saw\", \"B. has seen\", \"C. had seen\", \"D. sees\"]', 'C', 'as though + 虚拟语气：与过去事实相反用过去完成时||他看起来好像见了鬼一样。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (458, 458, 'My suggestion is that she ___ more time on pronunciation.', '[\"A. spends\", \"B. spend\", \"C. spent\", \"D. should spends\"]', 'B', '表建议的名词性从句用虚拟语气: (should) + 动词原形||我建议她多花时间在发音上。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (459, 459, '___ much advice you give him, he does exactly what he wants.', '[\"A. Whatever\", \"B. No matter\", \"C. However\", \"D. Although\"]', 'C', 'However + much + 名词 + 主语 + 谓语 = 无论多少||无论你给他多少建议，他都我行我素。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (460, 460, 'They climbed higher ___ they might get a better view.', '[\"A. in order\", \"B. so that\", \"C. because\", \"D. unless\"]', 'B', 'so that = 以便/为了，引导目的状语从句||他们爬得更高以便获得更好的视野。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (461, 461, 'Nowhere else in the world ___ such a beautiful sunset.', '[\"A. you can find\", \"B. you will find\", \"C. can you find\", \"D. you have found\"]', 'C', '否定词Nowhere在句首，部分倒装||世界上别处找不到这么美的日落。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (462, 462, 'He talks about Rome as if he ___ there himself.', '[\"A. has been\", \"B. was\", \"C. had been\", \"D. went\"]', 'C', 'as if + 虚拟语气：与过去事实相反用过去完成时||他谈论罗马就好像亲自去过一样。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');
INSERT INTO `question_content` VALUES (463, 463, 'It is strange that she ___ nothing about the accident.', '[\"A. knew\", \"B. knows\", \"C. should know\", \"D. has known\"]', 'C', 'It is strange that + should + 动词原形 表惊讶||真奇怪她竟然对事故一无所知。', '2026-06-24 11:00:45', '2026-06-24 11:36:07');

-- ----------------------------
-- Table structure for question_info
-- ----------------------------
DROP TABLE IF EXISTS `question_info`;
CREATE TABLE `question_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '题目ID',
  `module_type` tinyint(0) NOT NULL COMMENT '模块类型: 1=词汇, 2=语法',
  `target_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '目标等级: CET4/CET6',
  `difficulty_level` int(0) NOT NULL COMMENT '难度等级: 1~8',
  `question_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '题型: CHOICE/FILL_BLANK/TRANSLATION/WRITING',
  `knowledge_point_id` bigint(0) NULL DEFAULT NULL COMMENT '关联知识点ID',
  `source` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'MANUAL' COMMENT '来源: MANUAL/AI/IMPORT',
  `accepted_answers` json NULL COMMENT 'accepted_answers',
  `ai_generated` tinyint(0) NULL DEFAULT 0 COMMENT 'ai_generated',
  `usage_count` int(0) NULL DEFAULT 0 COMMENT '被使用次数',
  `is_deleted` tinyint(0) NULL DEFAULT 0 COMMENT '逻辑删除: 0=正常, 1=已删除',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_target_module_diff`(`target_level`, `module_type`, `difficulty_level`) USING BTREE,
  INDEX `idx_knowledge_point`(`knowledge_point_id`) USING BTREE,
  INDEX `idx_question_type`(`question_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '题目元数据表(高频查询)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_info
-- ----------------------------
INSERT INTO `question_info` VALUES (284, 1, 'CET4', 3, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 43, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (285, 1, 'CET4', 3, 'FILL_BLANK', 5, 'MANUAL', NULL, 0, 56, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (286, 1, 'CET4', 2, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 38, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (287, 1, 'CET4', 4, 'FILL_BLANK', 3, 'MANUAL', NULL, 0, 34, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (288, 1, 'CET4', 5, 'FILL_BLANK', 3, 'MANUAL', NULL, 0, 34, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (289, 1, 'CET4', 4, 'FILL_BLANK', 5, 'MANUAL', NULL, 0, 36, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (290, 1, 'CET4', 3, 'FILL_BLANK', 4, 'MANUAL', NULL, 0, 44, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (291, 1, 'CET4', 5, 'FILL_BLANK', 5, 'MANUAL', NULL, 0, 35, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (292, 1, 'CET4', 3, 'FILL_BLANK', 3, 'MANUAL', NULL, 0, 44, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (293, 1, 'CET4', 3, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 52, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (294, 1, 'CET4', 2, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 38, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (295, 1, 'CET4', 4, 'FILL_BLANK', 6, 'MANUAL', NULL, 0, 34, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (296, 1, 'CET4', 6, 'FILL_BLANK', 3, 'MANUAL', NULL, 0, 34, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (297, 1, 'CET4', 4, 'FILL_BLANK', 4, 'MANUAL', NULL, 0, 34, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (298, 1, 'CET4', 5, 'FILL_BLANK', 6, 'MANUAL', NULL, 0, 34, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (299, 1, 'CET4', 2, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 37, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (300, 1, 'CET4', 3, 'FILL_BLANK', 5, 'MANUAL', NULL, 0, 57, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (301, 1, 'CET4', 4, 'FILL_BLANK', 3, 'MANUAL', NULL, 0, 34, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (302, 1, 'CET4', 2, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 35, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (303, 1, 'CET4', 2, 'FILL_BLANK', 4, 'MANUAL', NULL, 0, 36, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (304, 1, 'CET4', 3, 'FILL_BLANK', 3, 'MANUAL', NULL, 0, 55, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (305, 1, 'CET4', 3, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 55, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (306, 1, 'CET4', 4, 'FILL_BLANK', 5, 'MANUAL', NULL, 0, 36, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (307, 1, 'CET4', 2, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 36, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (308, 1, 'CET4', 2, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 36, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (309, 1, 'CET4', 6, 'FILL_BLANK', 6, 'MANUAL', NULL, 0, 34, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (310, 1, 'CET4', 7, 'FILL_BLANK', 4, 'MANUAL', NULL, 0, 34, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (311, 1, 'CET4', 2, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 36, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (312, 1, 'CET4', 2, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 36, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (313, 1, 'CET4', 2, 'FILL_BLANK', 4, 'MANUAL', NULL, 0, 36, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (314, 1, 'CET6', 6, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 0, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (315, 1, 'CET6', 4, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 0, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (316, 1, 'CET6', 5, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 0, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (317, 1, 'CET6', 6, 'FILL_BLANK', 3, 'MANUAL', NULL, 0, 0, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (318, 1, 'CET6', 5, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 0, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (319, 1, 'CET6', 5, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 0, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (320, 1, 'CET6', 5, 'FILL_BLANK', 4, 'MANUAL', NULL, 0, 0, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (321, 1, 'CET6', 4, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 0, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (322, 1, 'CET6', 4, 'FILL_BLANK', 4, 'MANUAL', NULL, 0, 0, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (323, 1, 'CET6', 6, 'FILL_BLANK', 4, 'MANUAL', NULL, 0, 0, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (324, 1, 'CET6', 5, 'FILL_BLANK', 4, 'MANUAL', NULL, 0, 0, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (325, 1, 'CET6', 4, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 0, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (326, 1, 'CET6', 5, 'FILL_BLANK', 6, 'MANUAL', NULL, 0, 0, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (327, 1, 'CET6', 7, 'FILL_BLANK', 6, 'MANUAL', NULL, 0, 0, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (328, 1, 'CET6', 7, 'FILL_BLANK', 4, 'MANUAL', NULL, 0, 0, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (329, 1, 'CET6', 7, 'FILL_BLANK', 6, 'MANUAL', NULL, 0, 0, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (330, 1, 'CET6', 7, 'FILL_BLANK', 4, 'MANUAL', NULL, 0, 0, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (331, 1, 'CET6', 6, 'FILL_BLANK', 3, 'MANUAL', NULL, 0, 0, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (332, 1, 'CET6', 3, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 7, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (333, 1, 'CET6', 3, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 7, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (334, 1, 'CET6', 4, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 0, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (335, 1, 'CET6', 4, 'FILL_BLANK', 5, 'MANUAL', NULL, 0, 2, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (336, 1, 'CET6', 4, 'FILL_BLANK', 3, 'MANUAL', NULL, 0, 0, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (337, 1, 'CET6', 3, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 7, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (338, 1, 'CET6', 3, 'FILL_BLANK', 6, 'MANUAL', NULL, 0, 7, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (339, 1, 'CET6', 2, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 18, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (340, 1, 'CET6', 3, 'FILL_BLANK', 3, 'MANUAL', NULL, 0, 7, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (341, 1, 'CET6', 2, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 17, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (342, 1, 'CET6', 3, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 6, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (343, 1, 'CET6', 2, 'FILL_BLANK', 1, 'MANUAL', NULL, 0, 17, 0, '2026-06-22 22:06:10', '2026-06-22 22:06:10');
INSERT INTO `question_info` VALUES (424, 2, 'CET4', 4, 'SENTENCE_MAKING', 10, 'MANUAL', NULL, 0, 17, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (425, 2, 'CET4', 3, 'SENTENCE_MAKING', 9, 'MANUAL', NULL, 0, 17, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (426, 2, 'CET4', 6, 'SENTENCE_MAKING', 11, 'MANUAL', NULL, 0, 16, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (427, 2, 'CET4', 2, 'SENTENCE_MAKING', 8, 'MANUAL', NULL, 0, 17, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (428, 2, 'CET4', 5, 'SENTENCE_MAKING', 8, 'MANUAL', NULL, 0, 17, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (429, 2, 'CET4', 7, 'SENTENCE_MAKING', 8, 'MANUAL', NULL, 0, 16, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (430, 2, 'CET4', 5, 'SENTENCE_MAKING', 15, 'MANUAL', NULL, 0, 17, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (431, 2, 'CET4', 5, 'SENTENCE_MAKING', 10, 'MANUAL', NULL, 0, 17, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (432, 2, 'CET4', 4, 'SENTENCE_MAKING', 9, 'MANUAL', NULL, 0, 17, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (433, 2, 'CET4', 6, 'SENTENCE_MAKING', 10, 'MANUAL', NULL, 0, 16, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (434, 2, 'CET4', 5, 'SENTENCE_MAKING', 14, 'MANUAL', NULL, 0, 17, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (435, 2, 'CET4', 3, 'SENTENCE_MAKING', 9, 'MANUAL', NULL, 0, 17, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (436, 2, 'CET4', 5, 'SENTENCE_MAKING', 11, 'MANUAL', NULL, 0, 17, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (437, 2, 'CET4', 6, 'SENTENCE_MAKING', 10, 'MANUAL', NULL, 0, 16, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (438, 2, 'CET4', 6, 'SENTENCE_MAKING', 15, 'MANUAL', NULL, 0, 16, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (439, 2, 'CET4', 7, 'SENTENCE_MAKING', 10, 'MANUAL', NULL, 0, 16, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (440, 2, 'CET4', 6, 'SENTENCE_MAKING', 15, 'MANUAL', NULL, 0, 16, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (441, 2, 'CET4', 4, 'SENTENCE_MAKING', 14, 'MANUAL', NULL, 0, 17, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (442, 2, 'CET4', 5, 'SENTENCE_MAKING', 4, 'MANUAL', NULL, 0, 16, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (443, 2, 'CET4', 6, 'SENTENCE_MAKING', 10, 'MANUAL', NULL, 0, 16, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (444, 2, 'CET6', 6, 'SENTENCE_MAKING', 10, 'MANUAL', NULL, 0, 2, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (445, 2, 'CET6', 7, 'SENTENCE_MAKING', 10, 'MANUAL', NULL, 0, 2, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (446, 2, 'CET6', 6, 'SENTENCE_MAKING', 10, 'MANUAL', NULL, 0, 2, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (447, 2, 'CET6', 5, 'SENTENCE_MAKING', 10, 'MANUAL', NULL, 0, 2, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (448, 2, 'CET6', 6, 'SENTENCE_MAKING', 10, 'MANUAL', NULL, 0, 2, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (449, 2, 'CET6', 7, 'SENTENCE_MAKING', 11, 'MANUAL', NULL, 0, 0, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (450, 2, 'CET6', 5, 'SENTENCE_MAKING', 14, 'MANUAL', NULL, 0, 0, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (451, 2, 'CET6', 7, 'SENTENCE_MAKING', 10, 'MANUAL', NULL, 0, 2, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (452, 2, 'CET6', 6, 'SENTENCE_MAKING', 8, 'MANUAL', NULL, 0, 0, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (453, 2, 'CET6', 6, 'SENTENCE_MAKING', 14, 'MANUAL', NULL, 0, 0, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (454, 2, 'CET6', 6, 'SENTENCE_MAKING', 10, 'MANUAL', NULL, 0, 2, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (455, 2, 'CET6', 5, 'SENTENCE_MAKING', 10, 'MANUAL', NULL, 0, 1, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (456, 2, 'CET6', 7, 'SENTENCE_MAKING', 10, 'MANUAL', NULL, 0, 1, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (457, 2, 'CET6', 6, 'SENTENCE_MAKING', 10, 'MANUAL', NULL, 0, 1, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (458, 2, 'CET6', 6, 'SENTENCE_MAKING', 10, 'MANUAL', NULL, 0, 1, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (459, 2, 'CET6', 6, 'SENTENCE_MAKING', 14, 'MANUAL', NULL, 0, 0, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (460, 2, 'CET6', 4, 'SENTENCE_MAKING', 14, 'MANUAL', NULL, 0, 0, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (461, 2, 'CET6', 7, 'SENTENCE_MAKING', 11, 'MANUAL', NULL, 0, 0, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (462, 2, 'CET6', 7, 'SENTENCE_MAKING', 10, 'MANUAL', NULL, 0, 1, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');
INSERT INTO `question_info` VALUES (463, 2, 'CET6', 7, 'SENTENCE_MAKING', 10, 'MANUAL', NULL, 0, 1, 0, '2026-06-24 11:00:45', '2026-06-24 11:00:45');

-- ----------------------------
-- Table structure for sys_knowledge_point
-- ----------------------------
DROP TABLE IF EXISTS `sys_knowledge_point`;
CREATE TABLE `sys_knowledge_point`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '知识点ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '知识点名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父知识点ID(0=根节点)',
  `cet_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '考试级别: CET4/CET6',
  `sort_order` int(0) NULL DEFAULT 0 COMMENT '排序序号',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE,
  INDEX `idx_cet_level`(`cet_level`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '知识点树表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_knowledge_point
-- ----------------------------
INSERT INTO `sys_knowledge_point` VALUES (1, '词汇', 0, 'CET4', 1, '2026-06-16 11:27:11');
INSERT INTO `sys_knowledge_point` VALUES (2, '核心动词', 1, 'CET4', 1, '2026-06-16 11:27:11');
INSERT INTO `sys_knowledge_point` VALUES (3, '高频名词', 1, 'CET4', 2, '2026-06-16 11:27:11');
INSERT INTO `sys_knowledge_point` VALUES (4, '形容词副词', 1, 'CET4', 3, '2026-06-16 11:27:11');
INSERT INTO `sys_knowledge_point` VALUES (5, '固定搭配', 1, 'CET4', 4, '2026-06-16 11:27:11');
INSERT INTO `sys_knowledge_point` VALUES (6, '词义辨析', 1, 'CET4', 5, '2026-06-16 11:27:11');
INSERT INTO `sys_knowledge_point` VALUES (7, '语法', 0, 'CET4', 2, '2026-06-16 11:27:11');
INSERT INTO `sys_knowledge_point` VALUES (8, '时态语态', 7, 'CET4', 1, '2026-06-16 11:27:11');
INSERT INTO `sys_knowledge_point` VALUES (9, '定语从句', 7, 'CET4', 2, '2026-06-16 11:27:11');
INSERT INTO `sys_knowledge_point` VALUES (10, '虚拟语气', 7, 'CET4', 3, '2026-06-16 11:27:11');
INSERT INTO `sys_knowledge_point` VALUES (11, '倒装句', 7, 'CET4', 4, '2026-06-16 11:27:11');
INSERT INTO `sys_knowledge_point` VALUES (12, '非谓语动词', 7, 'CET4', 5, '2026-06-16 11:27:11');
INSERT INTO `sys_knowledge_point` VALUES (13, '名词性从句', 7, 'CET4', 6, '2026-06-16 11:27:11');
INSERT INTO `sys_knowledge_point` VALUES (14, '状语从句', 7, 'CET4', 7, '2026-06-16 11:27:11');
INSERT INTO `sys_knowledge_point` VALUES (15, '主谓一致', 7, 'CET4', 8, '2026-06-16 11:27:11');

-- ----------------------------
-- Table structure for user_error_book
-- ----------------------------
DROP TABLE IF EXISTS `user_error_book`;
CREATE TABLE `user_error_book`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `question_id` bigint(0) NOT NULL COMMENT '题目ID',
  `wrong_count` int(0) NULL DEFAULT 1 COMMENT '错误次数',
  `last_wrong_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后错误时间',
  `is_resolved` tinyint(0) NULL DEFAULT 0 COMMENT '是否已掌握: 0=未解决, 1=已解决',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_question`(`user_id`, `question_id`) USING BTREE,
  INDEX `idx_user_resolved`(`user_id`, `is_resolved`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '错题本表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_error_book
-- ----------------------------
INSERT INTO `user_error_book` VALUES (43, 6, 194, 1, '2026-06-22 21:57:22', 0, NULL, NULL);
INSERT INTO `user_error_book` VALUES (44, 6, 347, 4, '2026-06-22 22:52:38', 0, NULL, NULL);
INSERT INTO `user_error_book` VALUES (45, 6, 355, 1, '2026-06-22 22:34:54', 0, NULL, NULL);
INSERT INTO `user_error_book` VALUES (46, 6, 345, 2, '2026-06-22 22:52:40', 0, NULL, NULL);
INSERT INTO `user_error_book` VALUES (47, 6, 359, 2, '2026-06-24 10:49:37', 0, NULL, NULL);
INSERT INTO `user_error_book` VALUES (48, 6, 349, 2, '2026-06-24 10:38:09', 0, NULL, NULL);
INSERT INTO `user_error_book` VALUES (49, 6, 361, 1, '2026-06-22 22:52:04', 0, NULL, NULL);
INSERT INTO `user_error_book` VALUES (50, 6, 348, 1, '2026-06-22 22:52:07', 0, NULL, NULL);
INSERT INTO `user_error_book` VALUES (51, 6, 351, 1, '2026-06-22 22:52:12', 0, NULL, NULL);
INSERT INTO `user_error_book` VALUES (52, 6, 362, 1, '2026-06-22 22:52:21', 0, NULL, NULL);
INSERT INTO `user_error_book` VALUES (53, 6, 346, 1, '2026-06-22 22:52:24', 0, NULL, NULL);
INSERT INTO `user_error_book` VALUES (54, 6, 353, 1, '2026-06-22 22:52:26', 0, NULL, NULL);
INSERT INTO `user_error_book` VALUES (55, 6, 357, 2, '2026-06-23 09:47:12', 0, NULL, NULL);
INSERT INTO `user_error_book` VALUES (56, 6, 358, 1, '2026-06-22 22:52:31', 0, NULL, NULL);
INSERT INTO `user_error_book` VALUES (57, 6, 360, 1, '2026-06-22 22:52:34', 0, NULL, NULL);
INSERT INTO `user_error_book` VALUES (58, 6, 363, 2, '2026-06-24 10:49:18', 0, '2026-06-23 10:00:18', NULL);
INSERT INTO `user_error_book` VALUES (59, 6, 299, 1, '2026-06-24 08:43:50', 1, '2026-06-24 08:43:50', '2026-07-02 16:55:08');
INSERT INTO `user_error_book` VALUES (60, 6, 302, 2, '2026-07-01 10:44:46', 0, '2026-06-24 08:43:55', '2026-07-01 10:44:46');
INSERT INTO `user_error_book` VALUES (61, 6, 284, 1, '2026-06-24 08:45:51', 1, '2026-06-24 08:45:51', '2026-07-03 15:06:02');
INSERT INTO `user_error_book` VALUES (62, 6, 313, 1, '2026-06-24 08:47:30', 1, '2026-06-24 08:47:30', '2026-07-02 16:53:49');
INSERT INTO `user_error_book` VALUES (63, 6, 303, 1, '2026-06-24 08:49:30', 1, '2026-06-24 08:49:30', '2026-07-02 15:30:32');
INSERT INTO `user_error_book` VALUES (64, 6, 307, 1, '2026-06-24 08:50:51', 1, '2026-06-24 08:50:51', '2026-07-02 15:31:02');
INSERT INTO `user_error_book` VALUES (65, 6, 308, 2, '2026-07-02 16:32:48', 0, '2026-06-24 08:50:56', '2026-07-02 16:32:48');
INSERT INTO `user_error_book` VALUES (66, 6, 311, 1, '2026-06-24 09:01:17', 1, '2026-06-24 09:01:17', '2026-07-02 16:34:13');
INSERT INTO `user_error_book` VALUES (67, 6, 312, 1, '2026-06-24 09:02:15', 1, '2026-06-24 09:02:15', '2026-07-02 16:36:48');
INSERT INTO `user_error_book` VALUES (68, 6, 290, 1, '2026-06-24 09:06:13', 1, '2026-06-24 09:06:13', '2026-07-03 15:06:32');
INSERT INTO `user_error_book` VALUES (69, 6, 292, 2, '2026-07-03 15:07:14', 0, '2026-06-24 09:06:20', '2026-07-03 15:07:14');
INSERT INTO `user_error_book` VALUES (70, 6, 293, 1, '2026-06-24 09:06:24', 1, '2026-06-24 09:06:24', '2026-07-04 14:15:17');
INSERT INTO `user_error_book` VALUES (71, 6, 300, 1, '2026-06-24 09:06:28', 0, '2026-06-24 09:06:28', NULL);
INSERT INTO `user_error_book` VALUES (72, 6, 304, 1, '2026-06-24 09:06:33', 0, '2026-06-24 09:06:33', NULL);
INSERT INTO `user_error_book` VALUES (73, 6, 305, 1, '2026-06-24 09:06:35', 0, '2026-06-24 09:06:35', NULL);
INSERT INTO `user_error_book` VALUES (74, 6, 286, 1, '2026-06-24 09:06:40', 1, '2026-06-24 09:06:40', '2026-07-02 17:00:05');
INSERT INTO `user_error_book` VALUES (75, 6, 294, 1, '2026-06-24 09:06:43', 1, '2026-06-24 09:06:43', '2026-07-02 17:02:33');
INSERT INTO `user_error_book` VALUES (76, 6, 285, 1, '2026-06-24 09:06:47', 0, '2026-06-24 09:06:47', NULL);
INSERT INTO `user_error_book` VALUES (77, 6, 341, 1, '2026-06-24 09:06:50', 0, '2026-06-24 09:06:50', NULL);
INSERT INTO `user_error_book` VALUES (78, 6, 343, 2, '2026-06-24 09:16:59', 0, '2026-06-24 09:16:38', NULL);
INSERT INTO `user_error_book` VALUES (79, 6, 339, 2, '2026-06-24 09:17:15', 0, '2026-06-24 09:17:03', NULL);
INSERT INTO `user_error_book` VALUES (80, 6, 288, 4, '2026-06-26 14:42:23', 0, '2026-06-24 09:17:21', '2026-06-26 14:42:23');
INSERT INTO `user_error_book` VALUES (81, 6, 306, 2, '2026-06-26 14:34:58', 0, '2026-06-24 09:22:35', '2026-06-26 14:34:58');
INSERT INTO `user_error_book` VALUES (82, 6, 427, 6, '2026-07-02 14:13:00', 0, '2026-06-24 11:29:53', '2026-06-25 17:03:00');
INSERT INTO `user_error_book` VALUES (83, 6, 296, 1, '2026-06-24 11:42:58', 0, '2026-06-24 11:42:58', NULL);
INSERT INTO `user_error_book` VALUES (84, 6, 431, 5, '2026-07-01 11:18:00', 1, '2026-06-24 11:47:39', '2026-07-02 20:56:37');
INSERT INTO `user_error_book` VALUES (85, 6, 436, 3, '2026-07-02 14:33:19', 1, '2026-06-24 11:47:47', '2026-07-02 21:23:18');
INSERT INTO `user_error_book` VALUES (86, 6, 442, 3, '2026-07-02 14:31:37', 0, '2026-06-24 11:47:51', '2026-07-01 13:15:47');
INSERT INTO `user_error_book` VALUES (87, 6, 434, 5, '2026-07-01 11:18:03', 1, '2026-06-24 11:47:58', '2026-07-02 20:56:41');
INSERT INTO `user_error_book` VALUES (88, 6, 426, 5, '2026-07-02 14:31:28', 0, '2026-06-24 11:48:07', '2026-06-25 17:03:04');
INSERT INTO `user_error_book` VALUES (89, 6, 309, 3, '2026-06-25 16:08:31', 0, '2026-06-24 20:19:46', '2026-06-25 16:08:31');
INSERT INTO `user_error_book` VALUES (90, 6, 433, 5, '2026-07-02 14:31:32', 0, '2026-06-24 20:20:24', '2026-06-25 17:18:12');
INSERT INTO `user_error_book` VALUES (91, 6, 437, 6, '2026-07-02 14:31:41', 0, '2026-06-24 20:20:27', '2026-06-25 17:03:10');
INSERT INTO `user_error_book` VALUES (92, 6, 443, 7, '2026-07-02 14:42:23', 0, '2026-06-24 20:20:33', '2026-06-25 17:06:16');
INSERT INTO `user_error_book` VALUES (93, 6, 440, 7, '2026-07-01 19:36:19', 1, '2026-06-24 20:20:37', '2026-07-02 15:08:29');
INSERT INTO `user_error_book` VALUES (94, 6, 438, 7, '2026-07-02 15:08:35', 0, '2026-06-24 20:20:43', '2026-06-25 17:06:35');
INSERT INTO `user_error_book` VALUES (95, 6, 429, 9, '2026-07-02 14:54:08', 0, '2026-06-24 20:22:37', '2026-06-25 17:06:33');
INSERT INTO `user_error_book` VALUES (96, 6, 439, 6, '2026-07-02 14:13:08', 0, '2026-06-24 20:22:43', '2026-06-25 17:19:19');
INSERT INTO `user_error_book` VALUES (97, 6, 432, 5, '2026-07-02 14:13:16', 0, '2026-06-24 20:22:51', '2026-06-30 09:02:20');
INSERT INTO `user_error_book` VALUES (98, 6, 425, 5, '2026-07-01 19:36:28', 1, '2026-06-24 20:25:41', '2026-07-02 15:08:39');
INSERT INTO `user_error_book` VALUES (99, 6, 441, 3, '2026-07-01 11:18:12', 1, '2026-06-24 20:25:50', '2026-07-02 20:56:22');
INSERT INTO `user_error_book` VALUES (100, 6, 295, 2, '2026-06-26 13:59:15', 0, '2026-06-24 20:26:37', '2026-06-26 13:59:15');
INSERT INTO `user_error_book` VALUES (101, 6, 297, 2, '2026-06-26 13:59:20', 0, '2026-06-24 20:26:42', '2026-06-26 13:59:20');
INSERT INTO `user_error_book` VALUES (102, 6, 310, 1, '2026-06-24 20:26:57', 0, '2026-06-24 20:26:57', NULL);
INSERT INTO `user_error_book` VALUES (103, 6, 301, 1, '2026-06-24 20:27:04', 0, '2026-06-24 20:27:04', NULL);
INSERT INTO `user_error_book` VALUES (104, 6, 287, 2, '2026-06-25 14:00:49', 0, '2026-06-24 20:27:09', NULL);
INSERT INTO `user_error_book` VALUES (105, 6, 289, 3, '2026-06-26 13:55:20', 0, '2026-06-25 14:26:40', '2026-06-25 16:06:41');
INSERT INTO `user_error_book` VALUES (106, 15, 297, 1, '2026-06-25 14:27:23', 0, '2026-06-25 14:27:23', NULL);
INSERT INTO `user_error_book` VALUES (107, 6, 435, 4, '2026-07-02 14:13:11', 0, '2026-06-25 17:00:45', '2026-06-25 17:00:45');
INSERT INTO `user_error_book` VALUES (108, 6, 428, 2, '2026-07-01 11:18:09', 1, '2026-06-25 17:19:26', '2026-07-02 20:56:29');
INSERT INTO `user_error_book` VALUES (109, 6, 332, 1, '2026-06-26 16:26:10', 0, '2026-06-26 16:26:10', '2026-06-26 16:26:10');
INSERT INTO `user_error_book` VALUES (110, 6, 333, 1, '2026-06-26 16:30:55', 0, '2026-06-26 16:30:55', '2026-06-26 16:30:55');
INSERT INTO `user_error_book` VALUES (111, 6, 337, 1, '2026-06-26 16:50:55', 0, '2026-06-26 16:50:55', '2026-06-26 16:50:55');
INSERT INTO `user_error_book` VALUES (112, 6, 338, 1, '2026-06-26 17:09:55', 0, '2026-06-26 17:09:55', '2026-06-26 17:09:55');
INSERT INTO `user_error_book` VALUES (113, 6, 430, 2, '2026-07-01 11:18:06', 1, '2026-06-29 10:56:42', '2026-07-02 20:56:32');
INSERT INTO `user_error_book` VALUES (114, 6, 424, 4, '2026-07-02 14:13:14', 0, '2026-06-30 09:02:17', '2026-06-30 09:02:17');

-- ----------------------------
-- Table structure for user_exercise_log
-- ----------------------------
DROP TABLE IF EXISTS `user_exercise_log`;
CREATE TABLE `user_exercise_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `question_id` bigint(0) NOT NULL COMMENT '题目ID',
  `user_answer` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户答案',
  `is_correct` tinyint(0) NULL DEFAULT NULL COMMENT '是否正确: 1=正确, 0=错误',
  `duration_seconds` int(0) NULL DEFAULT NULL COMMENT '答题用时(秒)',
  `module_type` tinyint(0) NULL DEFAULT NULL COMMENT '模块类型: 1=词汇, 2=语法',
  `trace_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '全链路追踪ID',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_created`(`user_id`, `created_at`) USING BTREE,
  INDEX `idx_user_correct`(`user_id`, `is_correct`) USING BTREE,
  INDEX `idx_trace_id`(`trace_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 285 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '答题记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_exercise_log
-- ----------------------------
INSERT INTO `user_exercise_log` VALUES (74, 6, 194, 'eevb', 0, 30, 1, 'bf7f0f48', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (75, 6, 347, 'while when for since', 0, 60, 2, '48090af4', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (76, 6, 347, 'D', 0, 60, 2, 'ccc16da8', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (77, 6, 345, 'B', 1, 60, 2, '16459b21', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (78, 6, 355, 'D', 0, 60, 2, 'b82ca859', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (79, 6, 347, 'D', 0, 60, 2, 'db95d941', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (80, 6, 345, 'C', 0, 60, 2, '52792975', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (81, 6, 355, 'C', 1, 60, 2, '9ebfe0b4', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (82, 6, 359, 'C', 0, 60, 2, 'd320c135', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (83, 6, 349, 'C', 0, 60, 2, '982789e6', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (84, 6, 361, 'C', 0, 60, 2, '8a2c7442', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (85, 6, 348, 'D', 0, 60, 2, '54de4f17', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (86, 6, 350, 'B', 1, 60, 2, '82294d23', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (87, 6, 351, 'D', 0, 60, 2, '19dde51c', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (88, 6, 354, 'D', 1, 60, 2, 'c52be185', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (89, 6, 356, 'C', 1, 60, 2, '5b193fd6', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (90, 6, 362, 'B', 0, 60, 2, 'e5be9cfa', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (91, 6, 346, 'A', 0, 60, 2, '51f1f75c', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (92, 6, 353, 'D', 0, 60, 2, '8beaa8c1', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (93, 6, 357, 'C', 0, 60, 2, '2ea28504', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (94, 6, 358, 'B', 0, 60, 2, 'fb477d59', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (95, 6, 360, 'A', 0, 60, 2, 'e18186b2', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (96, 6, 363, 'D', 1, 60, 2, '238b40e0', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (97, 6, 347, 'B', 0, 60, 2, '3cc9e4ad', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (98, 6, 345, 'C', 0, 60, 2, '003915fb', '2026-06-23 09:40:04');
INSERT INTO `user_exercise_log` VALUES (99, 6, 357, 'A', 0, 2, 2, '84e1bfbb', '2026-06-23 09:47:12');
INSERT INTO `user_exercise_log` VALUES (100, 6, 360, 'B', 1, 3, 2, '16bf655f', '2026-06-23 10:00:13');
INSERT INTO `user_exercise_log` VALUES (101, 6, 363, 'B', 0, 1, 2, 'b18dc689', '2026-06-23 10:00:18');
INSERT INTO `user_exercise_log` VALUES (102, 6, 299, 'asf', 0, 7, 1, '1ec090eb', '2026-06-24 08:43:50');
INSERT INTO `user_exercise_log` VALUES (103, 6, 302, 'afaf', 0, 4, 1, 'b81b4a89', '2026-06-24 08:43:55');
INSERT INTO `user_exercise_log` VALUES (104, 6, 284, 'hh', 0, 3, 1, '02dc4144', '2026-06-24 08:45:51');
INSERT INTO `user_exercise_log` VALUES (105, 6, 313, 'hghf', 0, 3, 1, '22edf29a', '2026-06-24 08:47:30');
INSERT INTO `user_exercise_log` VALUES (106, 6, 303, 'll', 0, 11, 1, 'ac06375b', '2026-06-24 08:49:30');
INSERT INTO `user_exercise_log` VALUES (107, 6, 307, 'aga', 0, 75, 1, '578bc444', '2026-06-24 08:50:51');
INSERT INTO `user_exercise_log` VALUES (108, 6, 308, 'aga', 0, 4, 1, '94c72ff0', '2026-06-24 08:50:56');
INSERT INTO `user_exercise_log` VALUES (109, 6, 311, 'jjj', 0, 3, 1, '4d68e511', '2026-06-24 09:01:17');
INSERT INTO `user_exercise_log` VALUES (110, 6, 312, 'ggfx', 0, 4, 1, '9f6e836d', '2026-06-24 09:02:15');
INSERT INTO `user_exercise_log` VALUES (111, 6, 290, 'y', 0, 4, 1, 'e5fcbba4', '2026-06-24 09:06:13');
INSERT INTO `user_exercise_log` VALUES (112, 6, 292, 'g', 0, 6, 1, 'fa89b7a9', '2026-06-24 09:06:20');
INSERT INTO `user_exercise_log` VALUES (113, 6, 293, 'uu', 0, 2, 1, '45539a69', '2026-06-24 09:06:24');
INSERT INTO `user_exercise_log` VALUES (114, 6, 300, 'h', 0, 3, 1, '0b7fef64', '2026-06-24 09:06:28');
INSERT INTO `user_exercise_log` VALUES (115, 6, 304, 'g', 0, 3, 1, 'a90c460a', '2026-06-24 09:06:33');
INSERT INTO `user_exercise_log` VALUES (116, 6, 305, 'f', 0, 2, 1, 'a1058547', '2026-06-24 09:06:35');
INSERT INTO `user_exercise_log` VALUES (117, 6, 286, 'jv', 0, 2, 1, '6cedbbfc', '2026-06-24 09:06:40');
INSERT INTO `user_exercise_log` VALUES (118, 6, 294, 'yl', 0, 2, 1, '662139af', '2026-06-24 09:06:43');
INSERT INTO `user_exercise_log` VALUES (119, 6, 285, 'fyl', 0, 3, 1, '2da02c0e', '2026-06-24 09:06:47');
INSERT INTO `user_exercise_log` VALUES (120, 6, 341, 'tkdy', 0, 2, 1, '6e828ace', '2026-06-24 09:06:50');
INSERT INTO `user_exercise_log` VALUES (121, 6, 343, 'fdj', 0, 7, 1, 'b0ea67ef', '2026-06-24 09:16:38');
INSERT INTO `user_exercise_log` VALUES (122, 6, 343, 'jgdgd', 0, 4, 1, 'c0610fae', '2026-06-24 09:16:59');
INSERT INTO `user_exercise_log` VALUES (123, 6, 339, 'wrwrj', 0, 2, 1, '6f59bc7d', '2026-06-24 09:17:03');
INSERT INTO `user_exercise_log` VALUES (124, 6, 339, 'rsjs', 0, 6, 1, '1c42c2fd', '2026-06-24 09:17:15');
INSERT INTO `user_exercise_log` VALUES (125, 6, 288, 'sjsj', 0, 2, 1, '57994d80', '2026-06-24 09:17:21');
INSERT INTO `user_exercise_log` VALUES (126, 6, 288, 'jk;', 0, 3, 1, 'd99f1b86', '2026-06-24 09:18:44');
INSERT INTO `user_exercise_log` VALUES (127, 6, 288, 'jdf', 0, 58, 1, '0c010c21', '2026-06-24 09:22:30');
INSERT INTO `user_exercise_log` VALUES (128, 6, 306, 'zjx', 0, 3, 1, '131d215b', '2026-06-24 09:22:35');
INSERT INTO `user_exercise_log` VALUES (129, 6, 349, 'waits wait waited waited will', 0, 5, 2, 'c506695c', '2026-06-24 10:38:09');
INSERT INTO `user_exercise_log` VALUES (130, 6, 363, 'It is high time that we take actions to protect the environment.', 0, 16, 2, '703832fc', '2026-06-24 10:49:18');
INSERT INTO `user_exercise_log` VALUES (131, 6, 359, 'Had I known the result earlier, would make a different decision.', 0, 13, 2, '90046aaf', '2026-06-24 10:49:37');
INSERT INTO `user_exercise_log` VALUES (132, 6, 427, 'She has been studying English for she was years old.', 0, 185, 2, 'ea392731', '2026-06-24 11:29:53');
INSERT INTO `user_exercise_log` VALUES (133, 6, 296, 'jhj', 0, 4, 1, '903cea2d', '2026-06-24 11:42:58');
INSERT INTO `user_exercise_log` VALUES (134, 6, 431, 'I wish studied harder when was in college.', 0, 8, 2, '063e36ae', '2026-06-24 11:47:39');
INSERT INTO `user_exercise_log` VALUES (135, 6, 436, 'Only by working together we can solve this difficult problem.', 0, 5, 2, '56f5f7c1', '2026-06-24 11:47:47');
INSERT INTO `user_exercise_log` VALUES (136, 6, 442, 'There is no point to complain about the past; we should focus on future.', 0, 2, 2, '30e7b830', '2026-06-24 11:47:51');
INSERT INTO `user_exercise_log` VALUES (137, 6, 434, 'Whatever hard he tries, never seems to satisfy his boss.', 0, 2, 2, '9b6ce13c', '2026-06-24 11:47:58');
INSERT INTO `user_exercise_log` VALUES (138, 6, 426, 'Not until he arrived knew the truth of matter.', 0, 4, 2, 'f8c4004d', '2026-06-24 11:48:07');
INSERT INTO `user_exercise_log` VALUES (139, 6, 309, 'sss', 0, 29, 1, 'ad8b2498', '2026-06-24 20:19:46');
INSERT INTO `user_exercise_log` VALUES (140, 6, 433, 'he talked as if He knows everything about the project.', 0, 3, 2, '07d1091b', '2026-06-24 20:20:24');
INSERT INTO `user_exercise_log` VALUES (141, 6, 437, 'What she said suggested that be unhappy with the result.', 0, 2, 2, 'c82c7204', '2026-06-24 20:20:27');
INSERT INTO `user_exercise_log` VALUES (142, 6, 443, 'It is high time that we take actions to protect the environment.', 0, 2, 2, '74128c79', '2026-06-24 20:20:33');
INSERT INTO `user_exercise_log` VALUES (143, 6, 440, 'He is the only one of students who have passed test.', 0, 2, 2, 'fb474b4b', '2026-06-24 20:20:37');
INSERT INTO `user_exercise_log` VALUES (144, 6, 438, 'The number of students who own ... is cars increasing rapidly.', 0, 5, 2, '734988a9', '2026-06-24 20:20:43');
INSERT INTO `user_exercise_log` VALUES (145, 6, 429, 'By the time he arrives, we will wait for two hours.', 0, 119, 2, '9afbc0b6', '2026-06-24 20:22:37');
INSERT INTO `user_exercise_log` VALUES (146, 6, 431, 'I wish studied harder when was in college.', 0, 1, 2, '03332973', '2026-06-24 20:22:40');
INSERT INTO `user_exercise_log` VALUES (147, 6, 439, 'Had I known the result earlier, would make a different decision.', 0, 2, 2, 'e588a92a', '2026-06-24 20:22:43');
INSERT INTO `user_exercise_log` VALUES (148, 6, 434, 'Whatever hard he tries, never seems to satisfy his boss.', 0, 2, 2, '6b41dbff', '2026-06-24 20:22:47');
INSERT INTO `user_exercise_log` VALUES (149, 6, 432, 'It is known to all, the earth moves around sun.', 0, 2, 2, '2ed85481', '2026-06-24 20:22:51');
INSERT INTO `user_exercise_log` VALUES (150, 6, 440, 'He is the only one of students who have passed test.', 0, 4, 2, 'bb3bbf67', '2026-06-24 20:25:19');
INSERT INTO `user_exercise_log` VALUES (151, 6, 443, 'It is high time that we take actions to protect the environment.', 0, 2, 2, '2f91ecc9', '2026-06-24 20:25:23');
INSERT INTO `user_exercise_log` VALUES (152, 6, 438, 'The number of students who own ... is cars increasing rapidly.', 0, 2, 2, 'c7c2da7e', '2026-06-24 20:25:26');
INSERT INTO `user_exercise_log` VALUES (153, 6, 429, 'By the time he arrives, we will wait for two hours.', 0, 1, 2, 'c42aa9c7', '2026-06-24 20:25:29');
INSERT INTO `user_exercise_log` VALUES (154, 6, 437, 'What she said suggested that be unhappy with the result.', 0, 1, 2, '485b4af8', '2026-06-24 20:25:32');
INSERT INTO `user_exercise_log` VALUES (155, 6, 433, 'He talked as if he knows everything about the project.', 0, 5, 2, 'e8f7dba3', '2026-06-24 20:25:39');
INSERT INTO `user_exercise_log` VALUES (156, 6, 425, 'The book who I borrowed from the library is very interesting.', 0, 1, 2, '20ffe612', '2026-06-24 20:25:41');
INSERT INTO `user_exercise_log` VALUES (157, 6, 439, 'Had I known the result earlier, would make a different decision.', 0, 1, 2, '8066aa27', '2026-06-24 20:25:43');
INSERT INTO `user_exercise_log` VALUES (158, 6, 432, 'It is known to all, the earth moves around sun.', 0, 1, 2, 'a2ffc04a', '2026-06-24 20:25:47');
INSERT INTO `user_exercise_log` VALUES (159, 6, 441, 'Now that we have finished the course, shall start revision.', 0, 2, 2, 'fe3c03b4', '2026-06-24 20:25:50');
INSERT INTO `user_exercise_log` VALUES (160, 6, 427, 'she has been studying English for She was ten years old.', 0, 3, 2, '53ccb14f', '2026-06-24 20:26:14');
INSERT INTO `user_exercise_log` VALUES (161, 6, 295, 'ff', 0, 4, 1, 'de498293', '2026-06-24 20:26:37');
INSERT INTO `user_exercise_log` VALUES (162, 6, 297, 'jj', 0, 3, 1, '88ca9d36', '2026-06-24 20:26:42');
INSERT INTO `user_exercise_log` VALUES (163, 6, 310, 'gf', 0, 4, 1, '1846a400', '2026-06-24 20:26:57');
INSERT INTO `user_exercise_log` VALUES (164, 6, 301, 'fjfj', 0, 3, 1, '601f67bc', '2026-06-24 20:27:04');
INSERT INTO `user_exercise_log` VALUES (165, 6, 287, 'jfjfj', 0, 3, 1, '43827c29', '2026-06-24 20:27:09');
INSERT INTO `user_exercise_log` VALUES (166, 6, 429, 'By the time he arrives, we will wait for two hours.', 0, 2, 2, 'e9829916', '2026-06-24 20:29:32');
INSERT INTO `user_exercise_log` VALUES (167, 6, 297, 'influential', 1, 38, 1, '3c9dbcce', '2026-06-24 21:14:57');
INSERT INTO `user_exercise_log` VALUES (168, 6, 309, 'reachede', 0, 62, 1, 'ebd09a39', '2026-06-25 13:59:36');
INSERT INTO `user_exercise_log` VALUES (169, 6, 287, 'reached', 0, 135, 1, '81e7ea08', '2026-06-25 14:00:49');
INSERT INTO `user_exercise_log` VALUES (170, 6, 425, 'The book who I borrowed from the library is very interesting.', 0, 6, 2, '726ded72', '2026-06-25 14:22:35');
INSERT INTO `user_exercise_log` VALUES (171, 6, 289, 'effection', 0, 41, 1, 'ec1afca5', '2026-06-25 14:26:40');
INSERT INTO `user_exercise_log` VALUES (172, 15, 297, 'test-answer', 0, 12, 1, 'f7d96895', '2026-06-25 14:27:23');
INSERT INTO `user_exercise_log` VALUES (173, 6, 295, 'distinguish', 1, 87, 1, '6f1f818e', '2026-06-25 14:27:26');
INSERT INTO `user_exercise_log` VALUES (174, 6, 289, 'h', 0, 4, 1, '28e55aeb', '2026-06-25 16:06:41');
INSERT INTO `user_exercise_log` VALUES (175, 6, 309, 'xf', 0, 5, 1, 'b5c6d96e', '2026-06-25 16:08:31');
INSERT INTO `user_exercise_log` VALUES (176, 6, 296, 'account', 1, 35, 1, 'dfa07ca7', '2026-06-25 16:34:38');
INSERT INTO `user_exercise_log` VALUES (177, 6, 301, 'approach', 1, 153, 1, 'c224e6fd', '2026-06-25 16:52:17');
INSERT INTO `user_exercise_log` VALUES (178, 6, 288, 'capacity', 1, 56, 1, 'f88d8b73', '2026-06-25 16:53:14');
INSERT INTO `user_exercise_log` VALUES (179, 6, 306, 'due', 1, 20, 1, 'b9224cbd', '2026-06-25 16:53:36');
INSERT INTO `user_exercise_log` VALUES (180, 6, 297, 'influential', 1, 133, 1, 'a6cf82ae', '2026-06-25 16:55:50');
INSERT INTO `user_exercise_log` VALUES (181, 6, 435, 'The house whose roof was damaged in the storm has been repaired.', 0, 10, 2, '86864b23', '2026-06-25 17:00:45');
INSERT INTO `user_exercise_log` VALUES (182, 6, 427, 'she has been studying English since She was ten years old.', 0, 133, 2, '47e0fc36', '2026-06-25 17:03:00');
INSERT INTO `user_exercise_log` VALUES (183, 6, 426, 'Not until he arrived did know the truth of matter.', 0, 2, 2, '73e42db1', '2026-06-25 17:03:04');
INSERT INTO `user_exercise_log` VALUES (184, 6, 437, 'What she said suggested that was unhappy with the result.', 0, 1, 2, '8bb08ea4', '2026-06-25 17:03:10');
INSERT INTO `user_exercise_log` VALUES (185, 6, 443, 'It', 0, 5, 2, '7ac41f2e', '2026-06-25 17:06:16');
INSERT INTO `user_exercise_log` VALUES (186, 6, 440, 'He is the only one of students who has passed test.', 0, 2, 2, '26c22f00', '2026-06-25 17:06:23');
INSERT INTO `user_exercise_log` VALUES (187, 6, 429, 'By the time he arrives, we will have been waiting for two hours.', 0, 4, 2, 'ee74bc60', '2026-06-25 17:06:33');
INSERT INTO `user_exercise_log` VALUES (188, 6, 438, 'The number of students who own ... is cars increasing rapidly.', 0, 1, 2, '3c9d0f74', '2026-06-25 17:06:35');
INSERT INTO `user_exercise_log` VALUES (189, 6, 431, 'had studied', 0, 143, 2, 'cba42b7f', '2026-06-25 17:14:33');
INSERT INTO `user_exercise_log` VALUES (190, 6, 434, 'However hard he tries, never seems to satisfy his boss.', 0, 2, 2, '4473b174', '2026-06-25 17:14:39');
INSERT INTO `user_exercise_log` VALUES (191, 6, 440, 'He is the only one of students who has passed test.', 0, 8, 2, '7ac004d9', '2026-06-25 17:15:38');
INSERT INTO `user_exercise_log` VALUES (192, 6, 440, 'He is the only one of students who has passed test.', 0, 8, 2, '8f8a301b', '2026-06-25 17:15:38');
INSERT INTO `user_exercise_log` VALUES (193, 6, 433, 'He talked as if he knew everything about the project.', 0, 3, 2, 'a77631f1', '2026-06-25 17:18:12');
INSERT INTO `user_exercise_log` VALUES (194, 6, 443, 'It is high time that we took actions to protect the environment.', 0, 2, 2, '4da2d1b0', '2026-06-25 17:18:15');
INSERT INTO `user_exercise_log` VALUES (195, 6, 438, 'The number of students who own ... is cars increasing rapidly.', 0, 2, 2, 'cd637298', '2026-06-25 17:18:18');
INSERT INTO `user_exercise_log` VALUES (196, 6, 429, 'By the time he arrives, we will have been waiting for two hours.', 0, 3, 2, '0d5b21b7', '2026-06-25 17:18:22');
INSERT INTO `user_exercise_log` VALUES (197, 6, 437, 'What she said suggested that she was unhappy with the result.', 0, 1, 2, 'fbe42bd2', '2026-06-25 17:18:24');
INSERT INTO `user_exercise_log` VALUES (198, 6, 425, 'the book which I borrowed from The library is very interesting.', 0, 50, 2, '18a9d81f', '2026-06-25 17:19:16');
INSERT INTO `user_exercise_log` VALUES (199, 6, 439, 'Had I known the result earlier, I would have made a different decision.', 0, 2, 2, 'b2d8e38d', '2026-06-25 17:19:19');
INSERT INTO `user_exercise_log` VALUES (200, 6, 441, 'Now that we have finished the course, we shall start revision.', 0, 2, 2, '043c8b88', '2026-06-25 17:19:21');
INSERT INTO `user_exercise_log` VALUES (201, 6, 428, 'It was in the library that I met Professor Wang yesterday.', 0, 4, 2, '4a35b71d', '2026-06-25 17:19:26');
INSERT INTO `user_exercise_log` VALUES (202, 6, 289, 'efdsfg', 0, 8, 1, '6e842f1f', '2026-06-26 13:55:20');
INSERT INTO `user_exercise_log` VALUES (203, 6, 295, 'rrht', 0, 13, 1, '637e657e', '2026-06-26 13:59:15');
INSERT INTO `user_exercise_log` VALUES (204, 6, 297, 'dfhrsj', 0, 3, 1, '560c3c3c', '2026-06-26 13:59:20');
INSERT INTO `user_exercise_log` VALUES (205, 6, 306, 'sfd', 0, 4, 1, '458993b8', '2026-06-26 14:34:58');
INSERT INTO `user_exercise_log` VALUES (206, 6, 301, 'approach', 1, 35, 1, '17ceef98', '2026-06-26 14:41:10');
INSERT INTO `user_exercise_log` VALUES (207, 6, 288, 'ability', 0, 71, 1, '0538e5c2', '2026-06-26 14:42:23');
INSERT INTO `user_exercise_log` VALUES (208, 6, 425, 'B', 1, 2, 2, '6677b31f', '2026-06-26 16:02:39');
INSERT INTO `user_exercise_log` VALUES (209, 6, 342, 'reduce', 1, 77, 1, '2433b37d', '2026-06-26 16:25:55');
INSERT INTO `user_exercise_log` VALUES (210, 6, 332, 'yy', 0, 14, 1, '10e60a82', '2026-06-26 16:26:10');
INSERT INTO `user_exercise_log` VALUES (211, 6, 333, 'produce', 0, 16, 1, '0c15040b', '2026-06-26 16:30:55');
INSERT INTO `user_exercise_log` VALUES (212, 6, 337, 'explai', 0, 36, 1, 'ce9c5ba2', '2026-06-26 16:50:55');
INSERT INTO `user_exercise_log` VALUES (213, 6, 338, 'handly', 0, 367, 1, '9c8a556f', '2026-06-26 17:09:55');
INSERT INTO `user_exercise_log` VALUES (214, 6, 340, 'knowledge', 1, 21, 1, 'bd21f0d4', '2026-06-26 17:15:00');
INSERT INTO `user_exercise_log` VALUES (215, 6, 431, 'I wish I had studied harder when I was in college.', 0, 7, 2, 'abfb0072', '2026-06-29 10:56:33');
INSERT INTO `user_exercise_log` VALUES (216, 6, 434, 'However hard he tries, he never seems to satisfy his boss.', 0, 2, 2, '062bd507', '2026-06-29 10:56:37');
INSERT INTO `user_exercise_log` VALUES (217, 6, 430, 'the teacher, as well as The students, is excited about the trip.', 0, 5, 2, 'f02a7814', '2026-06-29 10:56:42');
INSERT INTO `user_exercise_log` VALUES (218, 6, 427, 'she has been studying English since She was ten years old.', 0, 3, 2, '9462fdf3', '2026-06-30 09:02:07');
INSERT INTO `user_exercise_log` VALUES (219, 6, 439, 'had I known the result earlier, I would have made a different decision.', 0, 2, 2, '9d0898b3', '2026-06-30 09:02:11');
INSERT INTO `user_exercise_log` VALUES (220, 6, 435, 'the house whose roof was damaged in The storm has been repaired.', 0, 2, 2, 'd47424fa', '2026-06-30 09:02:14');
INSERT INTO `user_exercise_log` VALUES (221, 6, 424, 'If I were you, I would accept the offer immediately.', 0, 2, 2, 'f0450a65', '2026-06-30 09:02:17');
INSERT INTO `user_exercise_log` VALUES (222, 6, 432, 'As is known to all, the earth moves around the sun.', 0, 2, 2, '5694d11e', '2026-06-30 09:02:20');
INSERT INTO `user_exercise_log` VALUES (223, 6, 426, 'Not until he arrived did he know the truth of the matter.', 0, 4, 2, '5136d5d3', '2026-06-30 09:12:00');
INSERT INTO `user_exercise_log` VALUES (224, 6, 429, 'C', 0, 16, 2, 'be700962', '2026-07-01 08:23:28');
INSERT INTO `user_exercise_log` VALUES (225, 6, 443, 'It is high time that we took actions to protect the environment.', 0, 9, 2, '9a61de28', '2026-07-01 09:29:13');
INSERT INTO `user_exercise_log` VALUES (226, 6, 429, 'By the time he arrives, we will have been waiting for two hours.', 0, 2, 2, '16889c0b', '2026-07-01 09:30:15');
INSERT INTO `user_exercise_log` VALUES (227, 6, 440, 'He is the only one of the students who has passed the test.', 0, 2, 2, '015c647e', '2026-07-01 09:30:19');
INSERT INTO `user_exercise_log` VALUES (228, 6, 438, 'The number of students who own ... is cars increasing rapidly.', 0, 1, 2, '9a180a7a', '2026-07-01 09:30:21');
INSERT INTO `user_exercise_log` VALUES (229, 6, 425, 'the book which I borrowed from The library is very interesting.', 0, 2, 2, 'ff676636', '2026-07-01 09:30:25');
INSERT INTO `user_exercise_log` VALUES (230, 6, 427, 'She has been studying English since she was ten years old.', 0, 5, 2, '57087a97', '2026-07-01 09:38:38');
INSERT INTO `user_exercise_log` VALUES (231, 6, 302, 'expandinto', 0, 38, 1, '4266dc04', '2026-07-01 10:44:46');
INSERT INTO `user_exercise_log` VALUES (232, 6, 439, 'had I known the result earlier, I would have made a different decision.', 0, 3, 2, 'fe793bcd', '2026-07-01 11:09:49');
INSERT INTO `user_exercise_log` VALUES (233, 6, 435, 'was', 0, 2, 2, '1899e135', '2026-07-01 11:09:53');
INSERT INTO `user_exercise_log` VALUES (234, 6, 424, 'If I were you, I would accept the offer immediately.', 0, 4, 2, 'a6e43113', '2026-07-01 11:10:05');
INSERT INTO `user_exercise_log` VALUES (235, 6, 432, 'As is known to all, the earth moves around the sun.', 0, 1, 2, '922e9896', '2026-07-01 11:10:08');
INSERT INTO `user_exercise_log` VALUES (236, 6, 431, 'I wish I had studied harder when I was in college.', 0, 3, 2, '8056551b', '2026-07-01 11:18:00');
INSERT INTO `user_exercise_log` VALUES (237, 6, 434, 'However hard he tries, he never seems to satisfy his boss.', 0, 2, 2, 'd9a67a90', '2026-07-01 11:18:03');
INSERT INTO `user_exercise_log` VALUES (238, 6, 430, 'the teacher, as well as the students, is excited about The trip.', 0, 2, 2, '5419c032', '2026-07-01 11:18:06');
INSERT INTO `user_exercise_log` VALUES (239, 6, 428, 'It was in the library that I met Professor Wang yesterday.', 0, 2, 2, '3696072c', '2026-07-01 11:18:09');
INSERT INTO `user_exercise_log` VALUES (240, 6, 441, 'Now that we have finished the course, we shall start revision.', 0, 2, 2, '2c43b922', '2026-07-01 11:18:12');
INSERT INTO `user_exercise_log` VALUES (241, 6, 426, 'Not until he arrived did he know the truth of the matter.', 0, 3, 2, '08c98125', '2026-07-01 13:15:41');
INSERT INTO `user_exercise_log` VALUES (242, 6, 433, 'He talked as if he knew everything about the project.', 0, 2, 2, '32d5a698', '2026-07-01 13:15:43');
INSERT INTO `user_exercise_log` VALUES (243, 6, 442, 'There is no point in complaining about the past; we should focus on the future.', 0, 2, 2, 'aabcc66b', '2026-07-01 13:15:47');
INSERT INTO `user_exercise_log` VALUES (244, 6, 437, 'What she said suggested that she was unhappy with the result.', 0, 3, 2, 'a2c93d52', '2026-07-01 13:15:51');
INSERT INTO `user_exercise_log` VALUES (245, 6, 436, 'Only by working together can we solve this difficult problem.', 0, 2, 2, 'fead0b02', '2026-07-01 13:15:54');
INSERT INTO `user_exercise_log` VALUES (246, 6, 443, 'It is high time that we took actions to protect the environment.', 0, 4, 2, 'fa8319f3', '2026-07-01 19:36:13');
INSERT INTO `user_exercise_log` VALUES (247, 6, 429, 'By the time he arrives, we will have been waiting for two hours.', 0, 2, 2, '6ad3f3a6', '2026-07-01 19:36:16');
INSERT INTO `user_exercise_log` VALUES (248, 6, 440, 'He is the only one of the students who has passed the test.', 0, 2, 2, 'd88aa5fe', '2026-07-01 19:36:19');
INSERT INTO `user_exercise_log` VALUES (249, 6, 438, 'The number of students who own ... is cars increasing rapidly.', 0, 4, 2, '01ad188a', '2026-07-01 19:36:25');
INSERT INTO `user_exercise_log` VALUES (250, 6, 425, 'The book which I borrowed from the library is very interesting.', 0, 2, 2, '3a38652a', '2026-07-01 19:36:28');
INSERT INTO `user_exercise_log` VALUES (251, 6, 424, 'immediately. accept were If you, the I', 0, 4, 2, '063695d1', '2026-07-01 19:46:26');
INSERT INTO `user_exercise_log` VALUES (252, 6, 427, 'She has been studying English since she was ten years old.', 0, 23, 2, '473c295e', '2026-07-02 14:13:00');
INSERT INTO `user_exercise_log` VALUES (253, 6, 439, 'had I known the result earlier, I would have made a different decision.', 0, 6, 2, 'b1eaf70e', '2026-07-02 14:13:08');
INSERT INTO `user_exercise_log` VALUES (254, 6, 435, 'The house whose roof was damaged in the storm has been repaired.', 0, 2, 2, '5e125450', '2026-07-02 14:13:11');
INSERT INTO `user_exercise_log` VALUES (255, 6, 424, 'If I were you, I would accept the offer immediately.', 0, 2, 2, 'c265efd0', '2026-07-02 14:13:14');
INSERT INTO `user_exercise_log` VALUES (256, 6, 432, 'As is known to all, the earth moves around the sun.', 0, 2, 2, '0993194b', '2026-07-02 14:13:16');
INSERT INTO `user_exercise_log` VALUES (257, 6, 426, 'Not until he arrived did he know the truth of the matter.', 0, 4, 2, 'af5efed6', '2026-07-02 14:31:28');
INSERT INTO `user_exercise_log` VALUES (258, 6, 433, 'he talked as if He knew everything about the project.', 0, 2, 2, '963b3416', '2026-07-02 14:31:32');
INSERT INTO `user_exercise_log` VALUES (259, 6, 442, 'There is no point in complaining about the past; we should focus on the future.', 0, 4, 2, '482b254e', '2026-07-02 14:31:37');
INSERT INTO `user_exercise_log` VALUES (260, 6, 437, 'What she said suggested that she was unhappy with the result.', 0, 2, 2, 'f84bac98', '2026-07-02 14:31:41');
INSERT INTO `user_exercise_log` VALUES (261, 6, 436, 'Only by working together can we solve this difficult problem.', 0, 82, 2, '2ff9ea6f', '2026-07-02 14:33:19');
INSERT INTO `user_exercise_log` VALUES (262, 6, 443, 'is to', 0, 3, 2, '6e46ddf6', '2026-07-02 14:42:23');
INSERT INTO `user_exercise_log` VALUES (263, 6, 429, 'By the time he arrives, we will have been waiting for two hours.', 0, 3, 2, '89c70523', '2026-07-02 14:54:08');
INSERT INTO `user_exercise_log` VALUES (264, 6, 440, 'He is the only one of the students who has passed the test.', 1, 3, 2, 'f0b8132a', '2026-07-02 15:08:29');
INSERT INTO `user_exercise_log` VALUES (265, 6, 438, 'The number of students who own ... is cars increasing rapidly.', 0, 3, 2, '6d4735bb', '2026-07-02 15:08:35');
INSERT INTO `user_exercise_log` VALUES (266, 6, 425, 'The book which I borrowed from the library is very interesting.', 1, 2, 2, '4f35f75f', '2026-07-02 15:08:38');
INSERT INTO `user_exercise_log` VALUES (267, 6, 303, 'essential', 1, 835, 1, '5631e800', '2026-07-02 15:30:32');
INSERT INTO `user_exercise_log` VALUES (268, 6, 307, 'enrich', 1, 25, 1, 'ed526fe2', '2026-07-02 15:31:02');
INSERT INTO `user_exercise_log` VALUES (269, 6, 308, 'emphasize', 0, 33, 1, 'c71faa39', '2026-07-02 16:32:48');
INSERT INTO `user_exercise_log` VALUES (270, 6, 311, 'study', 1, 11, 1, '3088be9a', '2026-07-02 16:34:13');
INSERT INTO `user_exercise_log` VALUES (271, 6, 312, 'achieved', 1, 39, 1, 'daaa11fc', '2026-07-02 16:36:48');
INSERT INTO `user_exercise_log` VALUES (272, 6, 313, 'important', 1, 95, 1, 'aececb48', '2026-07-02 16:53:49');
INSERT INTO `user_exercise_log` VALUES (273, 6, 299, 'indicates', 1, 77, 1, '2e42ccca', '2026-07-02 16:55:08');
INSERT INTO `user_exercise_log` VALUES (274, 6, 286, 'analyze', 1, 28, 1, '01d1db25', '2026-07-02 17:00:05');
INSERT INTO `user_exercise_log` VALUES (275, 6, 294, 'reduce', 1, 121, 1, '083c9294', '2026-07-02 17:02:33');
INSERT INTO `user_exercise_log` VALUES (276, 6, 441, 'Now that we have finished the course, we shall start revision.', 1, 4, 2, 'd13e1059', '2026-07-02 20:56:22');
INSERT INTO `user_exercise_log` VALUES (277, 6, 428, 'It was in the library that I met Professor Wang yesterday.', 1, 2, 2, 'fe4bd3a4', '2026-07-02 20:56:29');
INSERT INTO `user_exercise_log` VALUES (278, 6, 430, 'The teacher, as well as the students, is excited about the trip.', 1, 2, 2, 'ac95d574', '2026-07-02 20:56:32');
INSERT INTO `user_exercise_log` VALUES (279, 6, 431, 'I wish I had studied harder when I was in college.', 1, 2, 2, '39e7ee48', '2026-07-02 20:56:37');
INSERT INTO `user_exercise_log` VALUES (280, 6, 434, 'However hard he tries, he never seems to satisfy his boss.', 1, 3, 2, '22808f43', '2026-07-02 20:56:41');
INSERT INTO `user_exercise_log` VALUES (281, 6, 436, 'Only by working together can we solve this difficult problem.', 1, 3, 2, '404a17a6', '2026-07-02 21:23:18');
INSERT INTO `user_exercise_log` VALUES (282, 6, 284, 'established', 1, 15, 1, '737bf8e0', '2026-07-03 15:06:02');
INSERT INTO `user_exercise_log` VALUES (283, 6, 290, 'significant', 1, 20, 1, 'c0ae7925', '2026-07-03 15:06:32');
INSERT INTO `user_exercise_log` VALUES (284, 6, 292, 'expectation', 0, 33, 1, '687a1484', '2026-07-03 15:07:14');
INSERT INTO `user_exercise_log` VALUES (285, 6, 293, 'differ', 1, 67, 1, '708e0be0', '2026-07-04 14:15:17');

-- ----------------------------
-- Table structure for user_favorite
-- ----------------------------
DROP TABLE IF EXISTS `user_favorite`;
CREATE TABLE `user_favorite`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NOT NULL COMMENT '??ID',
  `sentence_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '?????/??',
  `question_id` bigint(0) NULL DEFAULT NULL COMMENT '????ID????',
  `source_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SENTENCE' COMMENT '??: SENTENCE/EXERCISE',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_favorite`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '?????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_favorite
-- ----------------------------
INSERT INTO `user_favorite` VALUES (2, 6, 'By the time he arrives, we will have been waiting for two hours.', 429, 'EXERCISE', '2026-07-02 14:54:11');
INSERT INTO `user_favorite` VALUES (3, 6, 'The company was ___ in 2005 and has grown rapidly since then.', 284, 'EXERCISE', '2026-07-03 15:06:06');
INSERT INTO `user_favorite` VALUES (4, 6, 'The company was ___ in 2005 and has grown rapidly since then.', 284, 'EXERCISE', '2026-07-03 15:06:08');
INSERT INTO `user_favorite` VALUES (5, 6, 'The number of students who own ... is cars increasing rapidly.', 438, 'EXERCISE', '2026-07-04 14:15:49');

-- ----------------------------
-- Table structure for user_vocabulary
-- ----------------------------
DROP TABLE IF EXISTS `user_vocabulary`;
CREATE TABLE `user_vocabulary`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NOT NULL COMMENT '??ID',
  `word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '??',
  `translation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '??/??',
  `phonetic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '音标',
  `pos` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '词性',
  `example` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '英文例句',
  `example_translation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '例句中文翻译',
  `collocation` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '常见搭配',
  `source` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'manual' COMMENT '来源: manual / ai',
  `review_count` int(0) NULL DEFAULT 0 COMMENT '复习次数',
  `mastery_level` int(0) NULL DEFAULT 0 COMMENT '掌握度等级',
  `last_reviewed_at` datetime(0) NULL DEFAULT NULL COMMENT '上次复习时间',
  `next_review_at` datetime(0) NULL DEFAULT NULL COMMENT '下次复习时间',
  `is_mastered` tinyint(0) NULL DEFAULT 0 COMMENT '?????: 0=???, 1=???',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_word`(`user_id`, `word`) USING BTREE,
  INDEX `idx_user_vocab`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '?????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_vocabulary
-- ----------------------------
INSERT INTO `user_vocabulary` VALUES (5, 6, 'grass', '草；草地；草坪；（美）大麻', '/ɡræs/', 'n.', 'The children are playing on the grass.', '孩子们正在草地上玩耍。', 'cut the grass；lawn grass；grass roots', 'manual', 0, 0, NULL, '2026-07-03 16:41:34', 1, '2026-07-02 16:41:34', '2026-07-02 16:41:34');
INSERT INTO `user_vocabulary` VALUES (7, 6, 'red', '红色的；红色；使变红', '/red/', 'adj./n./v.', 'The apple is red.', '这个苹果是红色的。', 'red blood cell；red flag；red light', 'manual', 0, 0, NULL, '2026-07-05 14:16:13', 1, '2026-07-04 14:16:13', '2026-07-04 14:16:13');
INSERT INTO `user_vocabulary` VALUES (8, 6, 'he', '他；（泛指）人；雄性动物', '/hiː/', 'pron.', 'He is a talented musician.', '他是一位有才华的音乐家。', 'he himself；he and I；he or she', 'manual', 0, 0, NULL, '2026-07-05 21:05:13', 0, '2026-07-04 21:05:13', '2026-07-04 21:05:13');

-- ----------------------------
-- Table structure for word_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `word_dictionary`;
CREATE TABLE `word_dictionary`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '鍗曡瘝',
  `phonetic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '闊虫爣',
  `translation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '涓?枃閲婁箟',
  `pos` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '璇嶆?',
  `example` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '渚嬪彞(鑻辨枃)',
  `example_translation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '渚嬪彞缈昏瘧',
  `level` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'CET4' COMMENT '绛夌骇: CET4/CET6',
  `usage_count` int(0) NULL DEFAULT 0 COMMENT '琚??涓烘瘡鏃ュ崟璇嶇殑娆℃暟',
  `created_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_word`(`word`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '绯荤粺鍗曡瘝璇嶅吀' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of word_dictionary
-- ----------------------------
INSERT INTO `word_dictionary` VALUES (2, 'abandon', '/əˈbændən/', 'v. 放弃；抛弃', 'verb', 'He abandoned his plan to travel.', '他放弃了旅行计划。', 'CET4', 1, '2026-06-25 15:33:29', '2026-06-25 15:36:44');
INSERT INTO `word_dictionary` VALUES (3, 'absolute', '/ˈæbsəluːt/', 'adj. 绝对的；完全的', 'adjective', 'I have absolute trust in her.', '我完全信任她。', 'CET4', 1, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (4, 'accomplish', '/əˈkɑːmplɪʃ/', 'v. 完成；实现', 'verb', 'She accomplished her goal in one year.', '她在一年内完成了目标。', 'CET4', 1, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (5, 'benefit', '/ˈbenɪfɪt/', 'n. 利益；好处 v. 有益于', 'noun', 'Exercise benefits your health.', '锻炼有益健康。', 'CET4', 1, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (6, 'brilliant', '/ˈbrɪliənt/', 'adj. 杰出的；明亮的', 'adjective', 'That was a brilliant idea.', '那是个绝妙的主意。', 'CET4', 1, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (7, 'circumstance', '/ˈsɜːrkəmstæns/', 'n. 环境；情况', 'noun', 'Under no circumstances should you lie.', '任何情况下你都不应该说谎。', 'CET4', 1, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (8, 'comprehensive', '/ˌkɑːmprɪˈhensɪv/', 'adj. 全面的；综合的', 'adjective', 'We need a comprehensive review.', '我们需要一次全面审查。', 'CET4', 1, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (9, 'demonstrate', '/ˈdemənstreɪt/', 'v. 展示；证明', 'verb', 'The experiment demonstrates the theory.', '实验证明了该理论。', 'CET4', 1, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (10, 'essential', '/ɪˈsenʃl/', 'adj. 基本的；必要的', 'adjective', 'Water is essential for life.', '水对生命至关重要。', 'CET4', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (11, 'flexible', '/ˈfleksəbl/', 'adj. 灵活的；柔韧的', 'adjective', 'We offer flexible working hours.', '我们提供灵活的工作时间。', 'CET4', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (12, 'genuine', '/ˈdʒenjuɪn/', 'adj. 真正的；真诚的', 'adjective', 'She showed genuine interest in the project.', '她对项目表现出真正的兴趣。', 'CET4', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (13, 'hesitate', '/ˈhezɪteɪt/', 'v. 犹豫；迟疑', 'verb', 'Do not hesitate to contact us.', '请随时联系我们。', 'CET4', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (14, 'inevitable', '/ɪnˈevɪtəbl/', 'adj. 不可避免的', 'adjective', 'Change is inevitable in life.', '生活中变化是不可避免的。', 'CET6', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (15, 'magnificent', '/mæɡˈnɪfɪsnt/', 'adj. 壮丽的；宏伟的', 'adjective', 'The view from the top was magnificent.', '顶上的景色十分壮丽。', 'CET6', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (16, 'negotiate', '/nɪˈɡoʊʃieɪt/', 'v. 谈判；协商', 'verb', 'They negotiated a peace agreement.', '他们谈判达成了和平协议。', 'CET4', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (17, 'obstacle', '/ˈɑːbstəkl/', 'n. 障碍；妨碍', 'noun', 'Lack of money is the main obstacle.', '缺钱是主要障碍。', 'CET6', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (18, 'phenomenon', '/fɪˈnɑːmɪnən/', 'n. 现象；杰出的人', 'noun', 'This is a natural phenomenon.', '这是一种自然现象。', 'CET6', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (19, 'prosperity', '/prɑːˈsperəti/', 'n. 繁荣；兴旺', 'noun', 'Peace brings prosperity to the nation.', '和平给国家带来繁荣。', 'CET6', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (20, 'reluctant', '/rɪˈlʌktənt/', 'adj. 不情愿的；勉强的', 'adjective', 'He was reluctant to leave his hometown.', '他不愿离开家乡。', 'CET6', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (21, 'sophisticated', '/səˈfɪstɪkeɪtɪd/', 'adj. 复杂的；精密的', 'adjective', 'This is a highly sophisticated system.', '这是一个高度精密的系统。', 'CET6', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (22, 'tremendous', '/trɪˈmendəs/', 'adj. 巨大的；极好的', 'adjective', 'We have made tremendous progress.', '我们取得了巨大进展。', 'CET4', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (23, 'ultimate', '/ˈʌltɪmət/', 'adj. 最终的；根本的', 'adjective', 'The ultimate decision rests with you.', '最终决定权在你手中。', 'CET4', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (24, 'vulnerable', '/ˈvʌlnərəbl/', 'adj. 脆弱的；易受伤害的', 'adjective', 'Children are vulnerable to diseases.', '儿童容易受到疾病侵害。', 'CET6', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (25, 'widespread', '/ˈwaɪdspred/', 'adj. 广泛的；普遍的', 'adjective', 'The news received widespread attention.', '这条新闻受到广泛关注。', 'CET4', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (26, 'accelerate', '/əkˈseləreɪt/', 'v. 加速；促进', 'verb', 'We need to accelerate the process.', '我们需要加快这一进程。', 'CET4', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (27, 'diligent', '/ˈdɪlɪdʒənt/', 'adj. 勤奋的；勤勉的', 'adjective', 'She is a diligent and hardworking student.', '她是一个勤奋刻苦的学生。', 'CET4', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (28, 'enthusiasm', '/ɪnˈθuːziæzəm/', 'n. 热情；热忱', 'noun', 'He showed great enthusiasm for the job.', '他对工作表现出极大的热情。', 'CET4', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (29, 'flourish', '/ˈflɜːrɪʃ/', 'v. 繁荣；兴旺', 'verb', 'The arts began to flourish in the city.', '艺术在这座城市开始繁荣起来。', 'CET6', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (30, 'gratitude', '/ˈɡrætɪtuːd/', 'n. 感激；感谢', 'noun', 'I would like to express my sincere gratitude.', '我想表达诚挚的感谢。', 'CET6', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');
INSERT INTO `word_dictionary` VALUES (31, 'harmony', '/ˈhɑːrməni/', 'n. 和谐；协调', 'noun', 'We should live in harmony with nature.', '我们应该与自然和谐相处。', 'CET4', 0, '2026-06-25 15:33:34', '2026-06-25 15:33:34');

SET FOREIGN_KEY_CHECKS = 1;
