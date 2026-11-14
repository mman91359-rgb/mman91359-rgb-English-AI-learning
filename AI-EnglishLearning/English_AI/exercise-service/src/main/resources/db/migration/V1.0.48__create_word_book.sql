-- V1.0.48：词书体系建表
-- 目标库：exercise_db
-- 风险：低（纯 DDL，两张新表，不影响存量数据）
-- 回滚：
--   DROP TABLE `word_book_item`;
--   DROP TABLE `word_book`;
-- 说明：
--   1. word_book 为词书主表，code 唯一标识一本词书，level 为词书对应的目标等级。
--   2. word_book_item 表达「词 → 词书」的多对多归属，一个词可以进多本词书；
--      归属只由本表表达，不使用 word_dictionary.level。
--   3. rank_no 为「词书内名次」（由 ECDICT book_word.sort_no 书内升序排名而来），
--      1 为词书内词频最高；用于种子 basic_500 / cet4_high / cet6_high 的「前 N」切分。
--   4. word 统一小写，与 question_info.answer_word 对齐；
--      排除 sort_no=999999999 的哨兵值（哨兵词不进入任何词书）。

CREATE TABLE `word_book` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '词书编码，如 basic_500',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '词书名称',
  `level` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '目标等级：CET4/CET6',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '词书说明',
  `sort_order` int DEFAULT '0' COMMENT '展示排序',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_book_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='词书主表';

CREATE TABLE `word_book_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `book_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '词书编码',
  `word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '单词（小写）',
  `rank_no` int NOT NULL DEFAULT '0' COMMENT '词书内名次，1 为词频最高',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_book_word` (`book_code`,`word`),
  KEY `idx_word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='词书明细（词→词书多对多）';
