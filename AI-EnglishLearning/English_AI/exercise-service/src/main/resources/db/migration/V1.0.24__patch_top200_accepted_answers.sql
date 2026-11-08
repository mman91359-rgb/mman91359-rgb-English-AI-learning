-- V1.0.24：Top200 高频填空题 accepted_answers 追加合法变体（由 scripts/patch-accepted-top200.mjs 生成，请勿手改）
-- 目标库：exercise_db
-- 风险：低（纯 UPDATE，只改 accepted_answers；新集合 = 现有 ∪ 新增，不删除历史值）
-- 回滚：accepted_answers 为 JSON 数组，可用导入前备份恢复；本脚本不新增行、不改其他字段
-- 生成时间：2026-11-08T14:55:37.220Z
-- 涉及题目：69 行

-- seed-vocab-cet4-14 (influential) 新增：influential
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('influential')
 WHERE `external_key` = 'seed-vocab-cet4-14'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('influential'))));

-- seed-vocab-cet4-05 (capacity) 新增：capacity
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('capacity')
 WHERE `external_key` = 'seed-vocab-cet4-05'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('capacity'))));

-- seed-vocab-cet4-12 (distinguish) 新增：distinguish, distinguishes, distinguished, distinguishing
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('distinguish', 'distinguishes', 'distinguished', 'distinguishing')
 WHERE `external_key` = 'seed-vocab-cet4-12'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('distinguish')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('distinguishes')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('distinguished')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('distinguishing'))));

-- seed-vocab-cet4-19 (expand) 新增：expand, expands, expanded, expanding
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('expand', 'expands', 'expanded', 'expanding')
 WHERE `external_key` = 'seed-vocab-cet4-19'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('expand')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('expands')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('expanded')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('expanding'))));

-- seed-vocab-cet4-06 (effect) 新增：effect, effects
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('effect', 'effects')
 WHERE `external_key` = 'seed-vocab-cet4-06'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('effect')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('effects'))));

-- seed-vocab-cet4-23 (due) 新增：due, dues
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('due', 'dues')
 WHERE `external_key` = 'seed-vocab-cet4-23'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('due')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('dues'))));

-- seed-vocab-cet4-18 (approach) 新增：approach, approaches
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('approach', 'approaches')
 WHERE `external_key` = 'seed-vocab-cet4-18'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('approach')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('approaches'))));

-- seed-vocab-cet4-04 (awareness) 新增：awareness
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('awareness')
 WHERE `external_key` = 'seed-vocab-cet4-04'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('awareness'))));

-- seed-vocab-cet4-26 (reach) 新增：reached, reach, reaches
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('reached', 'reach', 'reaches')
 WHERE `external_key` = 'seed-vocab-cet4-26'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('reached')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('reach')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('reaches'))));

-- seed-vocab-cet4-10 (differ) 新增：differ, differs, differed, differing
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('differ', 'differs', 'differed', 'differing')
 WHERE `external_key` = 'seed-vocab-cet4-10'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('differ')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('differs')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('differed')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('differing'))));

-- seed-vocab-cet4-01 (establish) 新增：established, establish, establishes, establishing
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('established', 'establish', 'establishes', 'establishing')
 WHERE `external_key` = 'seed-vocab-cet4-01'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('established')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('establish')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('establishes')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('establishing'))));

-- seed-vocab-cet4-07 (significant) 新增：significant
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('significant')
 WHERE `external_key` = 'seed-vocab-cet4-07'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('significant'))));

-- seed-vocab-cet4-09 (expectation) 新增：expectations, expectation
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('expectations', 'expectation')
 WHERE `external_key` = 'seed-vocab-cet4-09'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('expectations')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('expectation'))));

-- seed-vocab-cet4-03 (analyze) 新增：analyze, analyzes, analyzed, analyzing, analyses, analysed, analysing, analyse
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('analyze', 'analyzes', 'analyzed', 'analyzing', 'analyses', 'analysed', 'analysing', 'analyse')
 WHERE `external_key` = 'seed-vocab-cet4-03'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('analyze')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('analyzes')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('analyzed')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('analyzing')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('analyses')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('analysed')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('analysing')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('analyse'))));

-- seed-vocab-cet4-24 (enrich) 新增：enrich, enriches, enriched, enriching
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('enrich', 'enriches', 'enriched', 'enriching')
 WHERE `external_key` = 'seed-vocab-cet4-24'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('enrich')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('enriches')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('enriched')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('enriching'))));

-- seed-vocab-cet4-11 (reduce) 新增：reduce, reduces, reduced, reducing
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('reduce', 'reduces', 'reduced', 'reducing')
 WHERE `external_key` = 'seed-vocab-cet4-11'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('reduce')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('reduces')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('reduced')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('reducing'))));

-- seed-vocab-cet4-16 (indicate) 新增：indicates, indicate, indicated, indicating
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('indicates', 'indicate', 'indicated', 'indicating')
 WHERE `external_key` = 'seed-vocab-cet4-16'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('indicates')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('indicate')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('indicated')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('indicating'))));

-- seed-vocab-cet4-20 (essential) 新增：essential
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('essential')
 WHERE `external_key` = 'seed-vocab-cet4-20'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('essential'))));

-- seed-vocab-cet4-25 (emphasize) 新增：emphasized, emphasize, emphasizes, emphasizing, emphasises, emphasised, emphasising, emphasise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('emphasized', 'emphasize', 'emphasizes', 'emphasizing', 'emphasises', 'emphasised', 'emphasising', 'emphasise')
 WHERE `external_key` = 'seed-vocab-cet4-25'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('emphasized')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('emphasize')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('emphasizes')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('emphasizing')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('emphasises')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('emphasised')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('emphasising')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('emphasise'))));

-- seed-vocab-cet4-28 (study) 新增：study
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('study')
 WHERE `external_key` = 'seed-vocab-cet4-28'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('study'))));

-- seed-vocab-cet4-29 (achieve) 新增：achieved, achieve, achieves, achieving
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('achieved', 'achieve', 'achieves', 'achieving')
 WHERE `external_key` = 'seed-vocab-cet4-29'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('achieved')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('achieve')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('achieves')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('achieving'))));

-- seed-vocab-cet4-30 (important) 新增：important
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('important')
 WHERE `external_key` = 'seed-vocab-cet4-30'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('important'))));

-- seed-vocab-cet4-13 (account) 新增：account, accounts
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('account', 'accounts')
 WHERE `external_key` = 'seed-vocab-cet4-13'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('account')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('accounts'))));

-- seed-vocab-cet6-26 (become) 新增：become
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('become')
 WHERE `external_key` = 'seed-vocab-cet6-26'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('become'))));

-- seed-vocab-cet6-30 (prepare) 新增：preparing, prepare, prepares, prepared
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('preparing', 'prepare', 'prepares', 'prepared')
 WHERE `external_key` = 'seed-vocab-cet6-30'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('preparing')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('prepare')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('prepares')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('prepared'))));

-- seed-vocab-cet4-17 (advantage) 新增：advantage, advantages
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('advantage', 'advantages')
 WHERE `external_key` = 'seed-vocab-cet4-17'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('advantage')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('advantages'))));

-- seed-vocab-cet4-02 (optimistic) 新增：optimistic
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('optimistic')
 WHERE `external_key` = 'seed-vocab-cet4-02'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('optimistic'))));

-- seed-vocab-cet4-22 (ignore) 新增：ignore, ignores, ignored, ignoring
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('ignore', 'ignores', 'ignored', 'ignoring')
 WHERE `external_key` = 'seed-vocab-cet4-22'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('ignore')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('ignores')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('ignored')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('ignoring'))));

-- seed-vocab-cet4-21 (enthusiasm) 新增：enthusiasm, enthusiasms
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('enthusiasm', 'enthusiasms')
 WHERE `external_key` = 'seed-vocab-cet4-21'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('enthusiasm')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('enthusiasms'))));

-- seed-vocab-cet4-27 (sufficient) 新增：sufficient
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('sufficient')
 WHERE `external_key` = 'seed-vocab-cet4-27'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('sufficient'))));

-- seed-vocab-cet6-28 (encourage) 新增：encourage, encourages, encouraged, encouraging
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('encourage', 'encourages', 'encouraged', 'encouraging')
 WHERE `external_key` = 'seed-vocab-cet6-28'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('encourage')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('encourages')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('encouraged')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('encouraging'))));

-- seed-vocab-cet6-19 (design) 新增：designed, design, designs
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('designed', 'design', 'designs')
 WHERE `external_key` = 'seed-vocab-cet6-19'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('designed')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('design')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('designs'))));

-- seed-vocab-cet6-20 (produce) 新增：produces, produce
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('produces', 'produce')
 WHERE `external_key` = 'seed-vocab-cet6-20'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('produces')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('produce'))));

-- seed-vocab-cet6-24 (explain) 新增：explain, explains, explained, explaining
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('explain', 'explains', 'explained', 'explaining')
 WHERE `external_key` = 'seed-vocab-cet6-24'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('explain')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('explains')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('explained')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('explaining'))));

-- seed-vocab-cet6-25 (hardly) 新增：hardly
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('hardly')
 WHERE `external_key` = 'seed-vocab-cet6-25'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('hardly'))));

-- seed-vocab-cet6-27 (knowledge) 新增：knowledge
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('knowledge')
 WHERE `external_key` = 'seed-vocab-cet6-27'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('knowledge'))));

-- seed-vocab-cet6-29 (reduce) 新增：reduce, reduces, reduced, reducing
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('reduce', 'reduces', 'reduced', 'reducing')
 WHERE `external_key` = 'seed-vocab-cet6-29'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('reduce')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('reduces')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('reduced')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('reducing'))));

-- seed-vocab-cet4-08 (advise) 新增：advised, advise, advises, advising
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('advised', 'advise', 'advises', 'advising')
 WHERE `external_key` = 'seed-vocab-cet4-08'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('advised')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('advise')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('advises')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('advising'))));

-- seed-vocab-cet4-15 (adapt) 新增：adapt, adapts, adapted, adapting
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('adapt', 'adapts', 'adapted', 'adapting')
 WHERE `external_key` = 'seed-vocab-cet4-15'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('adapt')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('adapts')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('adapted')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('adapting'))));

-- seed-vocab-cet6-02 (complete) 新增：complete
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('complete')
 WHERE `external_key` = 'seed-vocab-cet6-02'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('complete'))));

-- seed-vocab-cet6-08 (emphasize) 新增：emphasized, emphasize, emphasizes, emphasizing, emphasises, emphasised, emphasising, emphasise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('emphasized', 'emphasize', 'emphasizes', 'emphasizing', 'emphasises', 'emphasised', 'emphasising', 'emphasise')
 WHERE `external_key` = 'seed-vocab-cet6-08'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('emphasized')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('emphasize')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('emphasizes')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('emphasizing')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('emphasises')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('emphasised')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('emphasising')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('emphasise'))));

-- seed-vocab-cet6-09 (temporary) 新增：temporary
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('temporary')
 WHERE `external_key` = 'seed-vocab-cet6-09'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('temporary'))));

-- seed-vocab-cet6-12 (indicate) 新增：indicates, indicate, indicated, indicating
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('indicates', 'indicate', 'indicated', 'indicating')
 WHERE `external_key` = 'seed-vocab-cet6-12'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('indicates')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('indicate')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('indicated')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('indicating'))));

-- seed-vocab-cet6-21 (display) 新增：displays, display
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('displays', 'display')
 WHERE `external_key` = 'seed-vocab-cet6-21'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('displays')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('display'))));

-- seed-vocab-cet6-22 (praise) 新增：praised, praise, praises
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('praised', 'praise', 'praises')
 WHERE `external_key` = 'seed-vocab-cet6-22'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('praised')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('praise')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('praises'))));

-- seed-vocab-cet6-23 (cooperate) 新增：cooperate, cooperates, cooperated, cooperating
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('cooperate', 'cooperates', 'cooperated', 'cooperating')
 WHERE `external_key` = 'seed-vocab-cet6-23'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('cooperate')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('cooperates')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('cooperated')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('cooperating'))));

-- seed-vocab-cet6-01 (generalize) 新增：generalize, generalizes, generalized, generalizing, generalises, generalised, generalising, generalise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('generalize', 'generalizes', 'generalized', 'generalizing', 'generalises', 'generalised', 'generalising', 'generalise')
 WHERE `external_key` = 'seed-vocab-cet6-01'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('generalize')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('generalizes')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('generalized')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('generalizing')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('generalises')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('generalised')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('generalising')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('generalise'))));

-- seed-vocab-cet6-03 (eliminate) 新增：eliminate, eliminates, eliminated, eliminating
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('eliminate', 'eliminates', 'eliminated', 'eliminating')
 WHERE `external_key` = 'seed-vocab-cet6-03'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('eliminate')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('eliminates')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('eliminated')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('eliminating'))));

-- seed-vocab-cet6-04 (emergence) 新增：emergence
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('emergence')
 WHERE `external_key` = 'seed-vocab-cet6-04'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('emergence'))));

-- seed-vocab-cet6-05 (overestimate) 新增：overestimate, overestimates, overestimated, overestimating
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('overestimate', 'overestimates', 'overestimated', 'overestimating')
 WHERE `external_key` = 'seed-vocab-cet6-05'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('overestimate')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('overestimates')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('overestimated')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('overestimating'))));

-- seed-vocab-cet6-06 (uncover) 新增：uncover, uncovers, uncovered, uncovering
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('uncover', 'uncovers', 'uncovered', 'uncovering')
 WHERE `external_key` = 'seed-vocab-cet6-06'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('uncover')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('uncovers')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('uncovered')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('uncovering'))));

-- seed-vocab-cet6-07 (sustainable) 新增：sustainable
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('sustainable')
 WHERE `external_key` = 'seed-vocab-cet6-07'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('sustainable'))));

-- seed-vocab-cet6-10 (extraordinary) 新增：extraordinary
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('extraordinary')
 WHERE `external_key` = 'seed-vocab-cet6-10'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('extraordinary'))));

-- seed-vocab-cet6-11 (unexpected) 新增：unexpected
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('unexpected')
 WHERE `external_key` = 'seed-vocab-cet6-11'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('unexpected'))));

-- seed-vocab-cet6-13 (accuse) 新增：accused, accuse, accuses, accusing
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('accused', 'accuse', 'accuses', 'accusing')
 WHERE `external_key` = 'seed-vocab-cet6-13'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('accused')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('accuse')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('accuses')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('accusing'))));

-- seed-vocab-cet6-14 (struggle) 新增：struggling, struggle, struggles
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('struggling', 'struggle', 'struggles')
 WHERE `external_key` = 'seed-vocab-cet6-14'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('struggling')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('struggle')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('struggles'))));

-- seed-vocab-cet6-15 (compel) 新增：compelling, compel, compels, compelled
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('compelling', 'compel', 'compels', 'compelled')
 WHERE `external_key` = 'seed-vocab-cet6-15'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('compelling')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('compel')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('compels')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('compelled'))));

-- seed-vocab-cet6-16 (peculiar) 新增：peculiar
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('peculiar')
 WHERE `external_key` = 'seed-vocab-cet6-16'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('peculiar'))));

-- seed-vocab-cet6-17 (substantiated) 新增：substantiated
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('substantiated')
 WHERE `external_key` = 'seed-vocab-cet6-17'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('substantiated'))));

-- seed-vocab-cet6-18 (unequal) 新增：unequal
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('unequal')
 WHERE `external_key` = 'seed-vocab-cet6-18'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('unequal'))));

-- vocab-auto-2-1 (abandon) 新增：abandon
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('abandoned', 'abandoning', 'abandons', 'abandon')
 WHERE `external_key` = 'vocab-auto-2-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('abandon'))));

-- vocab-auto-4-1 (accomplish) 新增：accomplish
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('accomplished', 'accomplishes', 'accomplishing', 'accomplish')
 WHERE `external_key` = 'vocab-auto-4-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('accomplish'))));

-- vocab-auto-5-1 (benefit) 新增：benefit
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('benefits', 'benefit')
 WHERE `external_key` = 'vocab-auto-5-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('benefit'))));

-- vocab-auto-7-1 (circumstance) 新增：circumstance
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('circumstances', 'circumstance')
 WHERE `external_key` = 'vocab-auto-7-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('circumstance'))));

-- vocab-auto-9-1 (demonstrate) 新增：demonstrate
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('demonstrated', 'demonstrates', 'demonstrating', 'demonstrate')
 WHERE `external_key` = 'vocab-auto-9-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('demonstrate'))));

-- vocab-auto-16-1 (negotiate) 新增：negotiate
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('negotiated', 'negotiates', 'negotiating', 'negotiate')
 WHERE `external_key` = 'vocab-auto-16-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('negotiate'))));

-- vocab-auto-5880-1 (acre) 新增：acre
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('acres', 'acre')
 WHERE `external_key` = 'vocab-auto-5880-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('acre'))));

-- vocab-auto-5948-1 (alter) 新增：alter
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('altered', 'altering', 'alters', 'alter')
 WHERE `external_key` = 'vocab-auto-5948-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('alter'))));

-- vocab-auto-5955-1 (amaze) 新增：amaze
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('amased', 'amases', 'amasing', 'amazed', 'amazes', 'amazing', 'amaze')
 WHERE `external_key` = 'vocab-auto-5955-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('amaze'))));
