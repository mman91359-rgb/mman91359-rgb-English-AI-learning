-- V1.0.28：填空题 accepted_answers 追加合法变体（范围由 --top / --only-keys / --keys-file 决定；由 scripts/patch-accepted-top200.mjs 生成，请勿手改）
-- 目标库：exercise_db
-- 风险：低（纯 UPDATE，只改 accepted_answers；新集合 = 现有 ∪ 新增，不删除历史值）
-- 回滚：accepted_answers 为 JSON 数组，可用导入前备份恢复；本脚本不新增行、不改其他字段
-- 生成时间：2026-11-08T15:48:59.691Z
-- 涉及题目：111 行

-- vocab-auto-10224-1 (eccentric) 新增：eccentrics
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('eccentric', 'eccentrics')
 WHERE `external_key` = 'vocab-auto-10224-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('eccentrics'))));

-- vocab-auto-10307-1 (exempt) 新增：exempts
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('exempt', 'exempts')
 WHERE `external_key` = 'vocab-auto-10307-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('exempts'))));

-- vocab-auto-10345-1 (fiber) 新增：fibers, fibre
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('fiber', 'fiberer', 'fiberest', 'fibers', 'fibre')
 WHERE `external_key` = 'vocab-auto-10345-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('fibers')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('fibre'))));

-- vocab-auto-10417-1 (generalization) 新增：generalisation
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('generalizations', 'generalisation')
 WHERE `external_key` = 'vocab-auto-10417-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('generalisation'))));

-- vocab-auto-10467-1 (harbor) 新增：harbour
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('harbor', 'harbors', 'harbour')
 WHERE `external_key` = 'vocab-auto-10467-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('harbour'))));

-- vocab-auto-10542-1 (immortal) 新增：immortals
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('immortal', 'immortals')
 WHERE `external_key` = 'vocab-auto-10542-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('immortals'))));

-- vocab-auto-10548-1 (imperative) 新增：imperatives
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('imperative', 'imperatives')
 WHERE `external_key` = 'vocab-auto-10548-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('imperatives'))));

-- vocab-auto-10648-1 (invalid) 新增：invalids
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('invalid', 'invalids')
 WHERE `external_key` = 'vocab-auto-10648-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('invalids'))));

-- vocab-auto-10668-1 (jeopardize) 新增：jeopardise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('jeopardize', 'jeopardizes', 'jeopardized', 'jeopardizing', 'jeopardises', 'jeopardised', 'jeopardising', 'jeopardise')
 WHERE `external_key` = 'vocab-auto-10668-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('jeopardise'))));

-- vocab-auto-10695-1 (layman) 新增：laymen
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('layman', 'laymans', 'laymen')
 WHERE `external_key` = 'vocab-auto-10695-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('laymen'))));

-- vocab-auto-10937-1 (paralyze) 新增：paralyse
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('paralysed', 'paralyses', 'paralysing', 'paralyzed', 'paralyzes', 'paralyzing', 'paralyse')
 WHERE `external_key` = 'vocab-auto-10937-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('paralyse'))));

-- vocab-auto-11063-1 (proficient) 新增：proficients
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('proficient', 'proficients')
 WHERE `external_key` = 'vocab-auto-11063-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('proficients'))));

-- vocab-auto-11295-1 (slack) 新增：slacks
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('slack', 'slacker', 'slackest', 'slacks')
 WHERE `external_key` = 'vocab-auto-11295-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('slacks'))));

-- vocab-auto-11342-1 (spiral) 新增：spirals
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('spiral', 'spirals')
 WHERE `external_key` = 'vocab-auto-11342-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('spirals'))));

-- vocab-auto-11347-1 (stabilize) 新增：stabilise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('stabilised', 'stabilises', 'stabilising', 'stabilized', 'stabilizes', 'stabilizing', 'stabilise')
 WHERE `external_key` = 'vocab-auto-11347-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('stabilise'))));

-- vocab-auto-11354-1 (standardize) 新增：standardise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('standardize', 'standardizes', 'standardized', 'standardizing', 'standardises', 'standardised', 'standardising', 'standardise')
 WHERE `external_key` = 'vocab-auto-11354-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('standardise'))));

-- vocab-auto-11550-1 (utilization) 新增：utilisation
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('utilization', 'utilizations', 'utilisation')
 WHERE `external_key` = 'vocab-auto-11550-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('utilisation'))));

-- vocab-auto-11580-1 (visualize) 新增：visualise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('visualize', 'visualizes', 'visualized', 'visualizing', 'visualises', 'visualised', 'visualising', 'visualise')
 WHERE `external_key` = 'vocab-auto-11580-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('visualise'))));

-- vocab-auto-5965-1 (analyze) 新增：analyse
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('analyze', 'analyzes', 'analyzed', 'analyzing', 'analyses', 'analysed', 'analysing', 'analyse')
 WHERE `external_key` = 'vocab-auto-5965-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('analyse'))));

-- vocab-auto-5986-1 (apologize) 新增：apologise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('apologize', 'apologizes', 'apologized', 'apologizing', 'apologises', 'apologised', 'apologising', 'apologise')
 WHERE `external_key` = 'vocab-auto-5986-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('apologise'))));

-- vocab-auto-6146-1 (behavior) 新增：behaviour
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('behavior', 'behaviors', 'behaviour')
 WHERE `external_key` = 'vocab-auto-6146-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('behaviour'))));

-- vocab-auto-6181-1 (blind) 新增：blinds
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('blind', 'blinder', 'blindest', 'blinds')
 WHERE `external_key` = 'vocab-auto-6181-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('blinds'))));

-- vocab-auto-6204-1 (bound) 新增：bounds
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('bound', 'bounder', 'boundest', 'bounds')
 WHERE `external_key` = 'vocab-auto-6204-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('bounds'))));

-- vocab-auto-6271-1 (calm) 新增：calms
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('calm', 'calmer', 'calmest', 'calms')
 WHERE `external_key` = 'vocab-auto-6271-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('calms'))));

-- vocab-auto-6310-1 (catalog) 新增：catalogue
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('catalog', 'catalogs', 'catalogue')
 WHERE `external_key` = 'vocab-auto-6310-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('catalogue'))));

-- vocab-auto-6326-1 (centre) 新增：center
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('centre', 'centres', 'center')
 WHERE `external_key` = 'vocab-auto-6326-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('center'))));

-- vocab-auto-6350-1 (characterize) 新增：characterise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('characterize', 'characterizes', 'characterized', 'characterizing', 'characterises', 'characterised', 'characterising', 'characterise')
 WHERE `external_key` = 'vocab-auto-6350-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('characterise'))));

-- vocab-auto-6358-1 (cheer) 新增：cheers
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('cheer', 'cheerer', 'cheerest', 'cheers')
 WHERE `external_key` = 'vocab-auto-6358-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('cheers'))));

-- vocab-auto-6393-1 (civilization) 新增：civilisation
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('civilization', 'civilizations', 'civilisation')
 WHERE `external_key` = 'vocab-auto-6393-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('civilisation'))));

-- vocab-auto-6394-1 (civilize) 新增：civilise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('civilize', 'civilizes', 'civilized', 'civilizing', 'civilises', 'civilised', 'civilising', 'civilise')
 WHERE `external_key` = 'vocab-auto-6394-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('civilise'))));

-- vocab-auto-6441-1 (color) 新增：colour
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('color', 'colors', 'colour')
 WHERE `external_key` = 'vocab-auto-6441-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('colour'))));

-- vocab-auto-6555-1 (content) 新增：contents
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('content', 'contents')
 WHERE `external_key` = 'vocab-auto-6555-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('contents'))));

-- vocab-auto-6627-1 (criticize) 新增：criticise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('criticize', 'criticizes', 'criticized', 'criticizing', 'criticises', 'criticised', 'criticising', 'criticise')
 WHERE `external_key` = 'vocab-auto-6627-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('criticise'))));

-- vocab-auto-6696-1 (defence) 新增：defense
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('defence', 'defences', 'defense')
 WHERE `external_key` = 'vocab-auto-6696-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('defense'))));

-- vocab-auto-6734-1 (desert) 新增：deserts
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('desert', 'deserts')
 WHERE `external_key` = 'vocab-auto-6734-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('deserts'))));

-- vocab-auto-6760-1 (dialog) 新增：dialogue
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('dialog', 'dialogs', 'dialogue')
 WHERE `external_key` = 'vocab-auto-6760-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('dialogue'))));

-- vocab-auto-6867-1 (due) 新增：dues
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('due', 'duer', 'duest', 'dues')
 WHERE `external_key` = 'vocab-auto-6867-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('dues'))));

-- vocab-auto-6935-1 (emphasize) 新增：emphasise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('emphasize', 'emphasizes', 'emphasized', 'emphasizing', 'emphasises', 'emphasised', 'emphasising', 'emphasise')
 WHERE `external_key` = 'vocab-auto-6935-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('emphasise'))));

-- vocab-auto-7099-1 (favor) 新增：favour
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('favor', 'favors', 'favour')
 WHERE `external_key` = 'vocab-auto-7099-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('favour'))));

-- vocab-auto-7102-1 (favour) 新增：favor
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('favour', 'favours', 'favor')
 WHERE `external_key` = 'vocab-auto-7102-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('favor'))));

-- vocab-auto-7125-1 (fibre) 新增：fiber
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('fibre', 'fibres', 'fiber')
 WHERE `external_key` = 'vocab-auto-7125-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('fiber'))));

-- vocab-auto-7148-1 (flavour) 新增：flavor
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('flavour', 'flavours', 'flavor')
 WHERE `external_key` = 'vocab-auto-7148-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('flavor'))));

-- vocab-auto-7222-1 (fundamental) 新增：fundamentals
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('fundamental', 'fundamentals')
 WHERE `external_key` = 'vocab-auto-7222-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('fundamentals'))));

-- vocab-auto-7225-1 (fur) 新增：furs
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('fur', 'furer', 'furest', 'furs')
 WHERE `external_key` = 'vocab-auto-7225-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('furs'))));

-- vocab-auto-7325-1 (grey) 新增：greys
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('grey', 'greyer', 'greyest', 'greys')
 WHERE `external_key` = 'vocab-auto-7325-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('greys'))));

-- vocab-auto-7367-1 (harbour) 新增：harbor
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('harbour', 'harbours', 'harbor')
 WHERE `external_key` = 'vocab-auto-7367-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('harbor'))));

-- vocab-auto-7373-1 (harm) 新增：harms
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('harm', 'harmer', 'harmest', 'harms')
 WHERE `external_key` = 'vocab-auto-7373-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('harms'))));

-- vocab-auto-7391-1 (headmaster) 新增：headmasters
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('headmaster', 'headmasters')
 WHERE `external_key` = 'vocab-auto-7391-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('headmasters'))));

-- vocab-auto-7425-1 (hollow) 新增：hollows
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('hollow', 'hollower', 'hollowest', 'hollows')
 WHERE `external_key` = 'vocab-auto-7425-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('hollows'))));

-- vocab-auto-7431-1 (honour) 新增：honor
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('honour', 'honours', 'honor')
 WHERE `external_key` = 'vocab-auto-7431-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('honor'))));

-- vocab-auto-7434-1 (hopeful) 新增：hopefuls
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('hopeful', 'hopefuls')
 WHERE `external_key` = 'vocab-auto-7434-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('hopefuls'))));

-- vocab-auto-7437-1 (horizontal) 新增：horizontals
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('horizontal', 'horizontals')
 WHERE `external_key` = 'vocab-auto-7437-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('horizontals'))));

-- vocab-auto-7449-1 (human) 新增：humans
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('human', 'humans')
 WHERE `external_key` = 'vocab-auto-7449-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('humans'))));

-- vocab-auto-7452-1 (humor) 新增：humour
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('humor', 'humors', 'humour')
 WHERE `external_key` = 'vocab-auto-7452-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('humour'))));

-- vocab-auto-7454-1 (humour) 新增：humor
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('humour', 'humours', 'humor')
 WHERE `external_key` = 'vocab-auto-7454-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('humor'))));

-- vocab-auto-7462-1 (ideal) 新增：ideals
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('ideal', 'ideals')
 WHERE `external_key` = 'vocab-auto-7462-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('ideals'))));

-- vocab-auto-7512-1 (independent) 新增：independents
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('independent', 'independents')
 WHERE `external_key` = 'vocab-auto-7512-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('independents'))));

-- vocab-auto-7521-1 (indispensable) 新增：indispensables
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('indispensable', 'indispensables')
 WHERE `external_key` = 'vocab-auto-7521-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('indispensables'))));

-- vocab-auto-7526-1 (industrialize) 新增：industrialise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('industrialize', 'industrializes', 'industrialized', 'industrializing', 'industrialises', 'industrialised', 'industrialising', 'industrialise')
 WHERE `external_key` = 'vocab-auto-7526-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('industrialise'))));

-- vocab-auto-7654-1 (junior) 新增：juniors
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('junior', 'juniors')
 WHERE `external_key` = 'vocab-auto-7654-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('juniors'))));

-- vocab-auto-7672-1 (knee) 新增：knees
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('knee', 'kneer', 'kneest', 'knees')
 WHERE `external_key` = 'vocab-auto-7672-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('knees'))));

-- vocab-auto-7681-1 (labour) 新增：labor
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('labour', 'labours', 'labor')
 WHERE `external_key` = 'vocab-auto-7681-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('labor'))));

-- vocab-auto-7746-1 (licence) 新增：license
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('licence', 'licences', 'license')
 WHERE `external_key` = 'vocab-auto-7746-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('license'))));

-- vocab-auto-7747-1 (license) 新增：licence
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('license', 'licenses', 'licence')
 WHERE `external_key` = 'vocab-auto-7747-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('licence'))));

-- vocab-auto-7774-1 (liter) 新增：litre
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('liter', 'liters', 'litre')
 WHERE `external_key` = 'vocab-auto-7774-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('litre'))));

-- vocab-auto-7831-1 (male) 新增：males
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('male', 'maler', 'malest', 'males')
 WHERE `external_key` = 'vocab-auto-7831-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('males'))));

-- vocab-auto-7860-1 (material) 新增：materials
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('material', 'materials')
 WHERE `external_key` = 'vocab-auto-7860-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('materials'))));

-- vocab-auto-7890-1 (mercury) 新增：mercuries
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('mercury', 'mercuries')
 WHERE `external_key` = 'vocab-auto-7890-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('mercuries'))));

-- vocab-auto-7901-1 (metre) 新增：meter
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('metre', 'metres', 'meter')
 WHERE `external_key` = 'vocab-auto-7901-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('meter'))));

-- vocab-auto-7943-1 (moisture) 新增：moistures
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('moisture', 'moistures')
 WHERE `external_key` = 'vocab-auto-7943-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('moistures'))));

-- vocab-auto-7952-1 (mortal) 新增：mortals
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('mortal', 'mortals')
 WHERE `external_key` = 'vocab-auto-7952-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('mortals'))));

-- vocab-auto-7989-1 (narrow) 新增：narrows
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('narrow', 'narrower', 'narrowest', 'narrows')
 WHERE `external_key` = 'vocab-auto-7989-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('narrows'))));

-- vocab-auto-8014-1 (neighbour) 新增：neighbor
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('neighbour', 'neighbours', 'neighbor')
 WHERE `external_key` = 'vocab-auto-8014-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('neighbor'))));

-- vocab-auto-8080-1 (official) 新增：officials
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('official', 'officials')
 WHERE `external_key` = 'vocab-auto-8080-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('officials'))));

-- vocab-auto-8113-1 (organization) 新增：organisation
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('organization', 'organizations', 'organisation')
 WHERE `external_key` = 'vocab-auto-8113-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('organisation'))));

-- vocab-auto-8114-1 (organize) 新增：organise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('organised', 'organises', 'organising', 'organized', 'organizes', 'organizing', 'organise')
 WHERE `external_key` = 'vocab-auto-8114-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('organise'))));

-- vocab-auto-8181-1 (parallel) 新增：parallels
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('parallel', 'parallels')
 WHERE `external_key` = 'vocab-auto-8181-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('parallels'))));

-- vocab-auto-8203-1 (patient) 新增：patients
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('patient', 'patients')
 WHERE `external_key` = 'vocab-auto-8203-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('patients'))));

-- vocab-auto-8217-1 (peasant) 新增：peasants
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('peasant', 'peasants')
 WHERE `external_key` = 'vocab-auto-8217-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('peasants'))));

-- vocab-auto-8252-1 (philosophy) 新增：philosophies
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('philosophy', 'philosophies')
 WHERE `external_key` = 'vocab-auto-8252-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('philosophies'))));

-- vocab-auto-8353-1 (practise) 新增：practice
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('practise', 'practises', 'practised', 'practising', 'practice')
 WHERE `external_key` = 'vocab-auto-8353-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('practice'))));

-- vocab-auto-8404-1 (prize) 新增：prise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('prize', 'prizes', 'prises', 'prise')
 WHERE `external_key` = 'vocab-auto-8404-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('prise'))));

-- vocab-auto-8474-1 (purple) 新增：purples
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('purple', 'purpler', 'purplest', 'purples')
 WHERE `external_key` = 'vocab-auto-8474-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('purples'))));

-- vocab-auto-8503-1 (radical) 新增：radicals
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('radical', 'radicals')
 WHERE `external_key` = 'vocab-auto-8503-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('radicals'))));

-- vocab-auto-8539-1 (realize) 新增：realise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('realize', 'realizes', 'realized', 'realizing', 'realises', 'realised', 'realising', 'realise')
 WHERE `external_key` = 'vocab-auto-8539-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('realise'))));

-- vocab-auto-8553-1 (recognize) 新增：recognise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('recognize', 'recognizes', 'recognized', 'recognizing', 'recognises', 'recognised', 'recognising', 'recognise')
 WHERE `external_key` = 'vocab-auto-8553-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('recognise'))));

-- vocab-auto-8710-1 (roast) 新增：roasts
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('roast', 'roaster', 'roastest', 'roasts')
 WHERE `external_key` = 'vocab-auto-8710-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('roasts'))));

-- vocab-auto-8737-1 (routine) 新增：routines
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('routine', 'routines')
 WHERE `external_key` = 'vocab-auto-8737-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('routines'))));

-- vocab-auto-8748-1 (rumour) 新增：rumor
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('rumour', 'rumours', 'rumor')
 WHERE `external_key` = 'vocab-auto-8748-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('rumor'))));

-- vocab-auto-8767-1 (salad) 新增：salads
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('salad', 'salads')
 WHERE `external_key` = 'vocab-auto-8767-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('salads'))));

-- vocab-auto-8829-1 (seize) 新增：seise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('seised', 'seises', 'seising', 'seized', 'seizes', 'seizing', 'seise')
 WHERE `external_key` = 'vocab-auto-8829-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('seise'))));

-- vocab-auto-8847-1 (separate) 新增：separates
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('separate', 'separates')
 WHERE `external_key` = 'vocab-auto-8847-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('separates'))));

-- vocab-auto-8906-1 (shy) 新增：shies
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('shier', 'shiest', 'shy', 'shies')
 WHERE `external_key` = 'vocab-auto-8906-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('shies'))));

-- vocab-auto-8920-1 (silver) 新增：silvers
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('silver', 'silverer', 'silverest', 'silvers')
 WHERE `external_key` = 'vocab-auto-8920-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('silvers'))));

-- vocab-auto-8994-1 (somewhat) 新增：somewhats
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('somewhat', 'somewhats')
 WHERE `external_key` = 'vocab-auto-8994-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('somewhats'))));

-- vocab-auto-9021-1 (specialize) 新增：specialise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('specialised', 'specialises', 'specialising', 'specialized', 'specializes', 'specializing', 'specialise')
 WHERE `external_key` = 'vocab-auto-9021-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('specialise'))));

-- vocab-auto-9080-1 (static) 新增：statics
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('static', 'statics')
 WHERE `external_key` = 'vocab-auto-9080-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('statics'))));

-- vocab-auto-9173-1 (summarize) 新增：summarise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('summarize', 'summarizes', 'summarized', 'summarizing', 'summarises', 'summarised', 'summarising', 'summarise')
 WHERE `external_key` = 'vocab-auto-9173-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('summarise'))));

-- vocab-auto-9182-1 (superior) 新增：superiors
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('superior', 'superiors')
 WHERE `external_key` = 'vocab-auto-9182-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('superiors'))));

-- vocab-auto-9216-1 (swift) 新增：swifts
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('swift', 'swifter', 'swiftest', 'swifts')
 WHERE `external_key` = 'vocab-auto-9216-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('swifts'))));

-- vocab-auto-9223-1 (sympathize) 新增：sympathise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('sympathize', 'sympathizes', 'sympathized', 'sympathizing', 'sympathises', 'sympathised', 'sympathising', 'sympathise')
 WHERE `external_key` = 'vocab-auto-9223-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('sympathise'))));

-- vocab-auto-9278-1 (theatre) 新增：theater
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('theatre', 'theatres', 'theater')
 WHERE `external_key` = 'vocab-auto-9278-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('theater'))));

-- vocab-auto-9340-1 (torture) 新增：tortures
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('torture', 'tortures')
 WHERE `external_key` = 'vocab-auto-9340-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('tortures'))));

-- vocab-auto-9401-1 (trust) 新增：trusts
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('trust', 'truster', 'trustest', 'trusts')
 WHERE `external_key` = 'vocab-auto-9401-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('trusts'))));

-- vocab-auto-9493-1 (utilize) 新增：utilise
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('utilize', 'utilizes', 'utilized', 'utilizing', 'utilises', 'utilised', 'utilising', 'utilise')
 WHERE `external_key` = 'vocab-auto-9493-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('utilise'))));

-- vocab-auto-9545-1 (violet) 新增：violets
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('violet', 'violets')
 WHERE `external_key` = 'vocab-auto-9545-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('violets'))));

-- vocab-auto-9583-1 (waterproof) 新增：waterproofs
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('waterproof', 'waterproofs')
 WHERE `external_key` = 'vocab-auto-9583-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('waterproofs'))));

-- vocab-auto-9657-1 (worse) 新增：worses
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('worse', 'worses')
 WHERE `external_key` = 'vocab-auto-9657-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('worses'))));

-- vocab-auto-9662-1 (worthy) 新增：worthies
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('worthier', 'worthiest', 'worthy', 'worthies')
 WHERE `external_key` = 'vocab-auto-9662-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('worthies'))));

-- vocab-auto-9703-1 (admiration) 新增：admirations
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('admiration', 'admirations')
 WHERE `external_key` = 'vocab-auto-9703-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('admirations'))));

-- vocab-auto-9960-1 (commonplace) 新增：commonplaces
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('commonplace', 'commonplaces')
 WHERE `external_key` = 'vocab-auto-9960-1'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('commonplaces'))));
