-- V1.0.61__remap_writing_topic_type.sql
-- 目标库：exercise_db
-- 背景：V1.0.60 入库时我自造了五档 type（ESSAY/QUOTE_ESSAY/LETTER/REPORT/CHART_ESSAY），
--       但前端 types/writing.ts:3 早已定义五档：SHORT_ESSAY / PRACTICAL / ARGUMENTATIVE / CHART / LETTER。
--       utils/writing.ts:12-18 为每个值配了 icon 与 labelKey/descKey，i18n 里 10 条中文文案齐全
--       （writing.type.* 与 writing.typeDesc.*），换一套枚举等于重做图标映射与多语言文案。
--       故改为后端适配前端枚举：只需一条 UPDATE，而不是改前端 4 个文件 + 10 条文案。
-- 语义映射（对齐 handoff.zh-CN.ts 的文案）：
--   ESSAY(25)        -> SHORT_ESSAY    短文写作：围绕一个话题展开论述
--   QUOTE_ESSAY(32)  -> ARGUMENTATIVE  议论文：提出观点并给出理由；引语作文（给定首句）归此档
--   REPORT(2)        -> PRACTICAL      应用文：按规范格式撰写通知、邮件等实用文体
--   CHART_ESSAY(3)   -> CHART          图表作文：根据图表数据描述趋势并分析原因
--   LETTER(4)        -> LETTER         书信写作：按书信格式表达请求（本就不变）
-- 风险等级：低（仅 UPDATE 66 行的 type 字段，不动表结构，不涉 writing_draft / writing_favorite）
-- 回滚方式（限定 source 非空，避免误伤将来手工录入的练习题）：
--   UPDATE writing_topic SET type='ESSAY'       WHERE source IS NOT NULL AND type='SHORT_ESSAY';
--   UPDATE writing_topic SET type='QUOTE_ESSAY' WHERE source IS NOT NULL AND type='ARGUMENTATIVE';
--   UPDATE writing_topic SET type='REPORT'      WHERE source IS NOT NULL AND type='PRACTICAL';
--   UPDATE writing_topic SET type='CHART_ESSAY' WHERE source IS NOT NULL AND type='CHART';

UPDATE `writing_topic` SET `type` = 'SHORT_ESSAY'   WHERE `type` = 'ESSAY';
UPDATE `writing_topic` SET `type` = 'ARGUMENTATIVE' WHERE `type` = 'QUOTE_ESSAY';
UPDATE `writing_topic` SET `type` = 'PRACTICAL'     WHERE `type` = 'REPORT';
UPDATE `writing_topic` SET `type` = 'CHART'         WHERE `type` = 'CHART_ESSAY';
