-- 由 scripts/import-exam.mjs 自动生成，请勿手工修改。
-- 版本: V1.0.34
-- 生成时间: 2026-11-09T14:51:12.477Z
-- 目标库: exercise_db
-- 执行前必须按 docs/数据库迁移规范.md 预览、备份、审批。
-- 范围：正常套 + 仅借听力套（残卷留后）；听力无音频不写 listening_audio。

START TRANSACTION;

-- ==================== cet4-2025-06-2 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-r1', 'BANKED_CLOZE', 'CET4', NULL, 'Sir Alfred Hitchcock was an English movie director and producer. Famously __26__ to as ''The Master of Suspense,'' Hitchcock is one of the most influential filmmakers in the history of __27__ . He was an extraordinary director who entertained his audience with __28__ and gripping suspense movies. His fascination with crime began at an early age when he was __29__ by his father who made him spend a few minutes inside a prison for his misconduct. Hence, his movies are __30__ of the guilt and innocence of the wrongdoer and the victim. He had a gift for creating stories that consisted of deceit, robbery, murder, corruption, and other criminal __31__ with incredible plot twists in the storyline. The principal characters in his movies were often ordinary people __32__ in unwanted and unavoidable situations. He was __33__ productive and his amazing body of work is considered fascinating by the critics. Most of his movies have __34__ the test of time and are considered to be masterpieces. He is also remembered by other filmmakers, for he continues to inspire them to be passionate about their work. He is also __35__ by people around the world for his entertaining and exciting stories.', NULL, '["A) caught","B) cinema","C) engaging","D) graphically","E) highly","F) incentive","G) instincts","H) offences","I) punished","J) referred","K) stood","L) symbolic","M) tuned","N) visually","O) worshipped"]', 199, 'IMPORT', 'cet4-2025-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-2-r1'
);
SET @pg_cet4_2025_06_2_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-2-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-r2', 'MATCHING', 'CET4', 'Is juicing actually good for you?', 'A) Freshly juiced fruit has become a basic dietary item—especially for busy, health-conscious consumers who can save time on making (and perhaps even chewing) their food without missing out on nutrients. Fruit juice also has been linked to claims that it can help you both lose weight and stay healthy. All of which, of course, has made it highly profitable. The global fruit and vegetable juices market was valued at $154 billion in 2016 and is expected to grow. B) But is juicing really as healthy as we think? Most foods containing fructose—a naturally occurring sugar found in all fruits and fruit juices—don''t seem to have harmful effects as long as they''re not contributing to excess daily calories. This is because the fibre found in whole fruits is intact, and the sugar is contained within the fruit''s cells. It takes our digestive system a while to break these cells down and for fructose to enter the bloodstream. C) But this is not the case with fruit juice. Unlike whole fruit, fruit juice has most of the fibre removed. This is why the fructose in fruit juices counts as ''free sugars''—which also include honey and the sugars added to foods. It''s recommended by the World Health Organisation that adults have no more than 30g of added sugar, the equivalent of 150ml of fruit juice, per day. The problem is that, with the fibre removed, fruit juice''s fructose is absorbed more quickly. Sudden increases in blood sugar cause the release of insulin(胰岛素) to bring it back down to a stable level. Over time, this mechanism can wear out, increasing the risk of developing type 2 diabetes. In 2013, researchers analysed the health data of 100,000 people collected between 1986 and 2009 and found that fruit juice consumption was linked with increased risk of type 2 diabetes. Another study found a relationship between fruit juice and type 2 diabetes after following the diets and diabetes status of more than 70,000 nurses over 18 years. The researchers explain that the possible reason for this may partly have been the lack of the other components found in whole fruit, like fibre. D) Juices containing vegetables can provide more nutrients and less sugar than juices made up of just fruit—but they still lack valuable fibre. Diets high in fibre have been linked to a lower risk of developing heart disease, stroke, high blood pressure and diabetes, and it''s recommended adults consume 30g per day. E) Aside from the link to type 2 diabetes, many studies agree that fruit juice is harmful if it contributes to an excess in calories. In an analysis of 155 studies, John Sievenpiper, associate professor at the University of Toronto''s Department of Nutritional Sciences, set out to understand if the associations between sugary soft drinks and health—including risk of diabetes and heart disease—were applicable to the food and drink we generally consume as part of a healthy diet. He compared studies looking into the effects of fructose- containing sugars with control diets free from or lower in these sugars. His aim? To isolate the effects of consuming too many calories from the effects of foods containing different sugars. F) He found negative effects on blood sugar and insulin levels when food provided excess calories from sugars, including fruit juice. However, when the calories weren''t in excess overall, there were some advantages to consuming whole fruit—and even fruit juice. Sievenpiper concludes that the recommended 150ml of fruit juice per day, which is an average serving, is reasonable. The paper concluded that foods containing fructose may have some small benefits for long-term blood sugar control when they don''t lead to over-consumption of calories. But when they do lead to too many calories, they risk raising blood sugar and insulin levels. G) So while we know that fruit juice can cause diabetes if it''s part of a diet that has more calories overall, it''s less clear how juice affects the long-term health of those who aren''t overweight. But we have a higher risk of consuming more than the recommended daily number of calories (around 2,000 for women and 2,500 for men) on the days we drink juice, according to research. Numerous studies have shown that drinking fruit juice doesn''t make us consume any less of other foods throughout the day. H) As it is easy to consume large amounts of fruit juice quite quickly, extra calories are taken in. And extra calories can contribute to weight gain. One way we can improve the effects of fruit juice on our health is making sure we select ripe fruit to retain as much of its goodness as possible, according to Roger Clemens, professor of pharmaceutical(药物的) sciences at the University of Southern California. I) Another reason for fruit juice''s recent popularity is the argument that it can help to remove poisonous or harmful substances from the body. However, "the whole concept of a juice diet helping to remove poisonous or harmful substances from the body is completely false," says Clemens. "We consume compounds every day that may be poisonous and our bodies do a wonderful job of removing and eliminating anything harmful from our bodies." J) And juice isn''t a cure-all for getting your nutrients, either. "There are a lot of nutrients contained in the parts of the fruits, such as in apple skins, that are excluded when you juice them," says Heather Ferris, a professor of medicine. "You end up with sugary water with some vitamins." K) Plus, she adds, it''s not an ideal way to reach the advised ''five a day''. "People try to get five servings of fruit and vegetables per day and don''t realise this isn''t just about getting vitamins," she says. "It''s also about reducing the amount of grain carbs(碳水化合物) and protein and fats in our diet, and increasing fibre." So while fruit juice is better than no fruit at all, there are limits. It particularly comes with risks when we consume more than 150ml of free sugars per day, or when it puts us over our recommended calorie intake. It provides us with vitamins—but fruit juice is far from a quick fix.', NULL, NULL, 1020, 'IMPORT', 'cet4-2025-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-2-r2'
);
SET @pg_cet4_2025_06_2_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-2-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-r3', 'CAREFUL_READING', 'CET4', NULL, 'We all take a little extra effort to look nice for special occasions. But most of us have conflicting feelings about dressing up and feel guilty about taking the time to focus on clothes. Science now suggests the right dress may give ourselves the extra edge in our professional and personal lives. We hear sayings like "dress for the job you want; not the job you have". Most people don''t really believe in them, but research into the impact of clothes on behavior now suggests that there may actually be a grain of truth in these sayings. Science says that the clothes we wear affect our behavior, our mood and even the way we interact with others because of the symbolic meaning that we assign to different types of clothing. We consider some clothes to be powerful, some to be fun, and so on. We even evaluate people whom we have just met based on their clothes. We also evaluate ourselves based on what we are wearing because of the way they make us feel. This means that the experience of wearing something affects our attitudes and our choice of behavior. There''s a reason tailored jackets are associated with being ''dressed for success''. It seems that wearing formal office wear puts us in the right frame of mind to conduct business. Wearing power clothing makes us feel more confident and even increases hormones needed for displaying dominance. This in turn helps us become better negotiators and abstract thinkers. While a good suit works wonders for our performance in the boardroom, wearing formal wear isn''t a great idea when we want to socialize. Studies have found that people tend to be less open and less able to relax when they wear formal clothes. On the other hand, a casual dress helps us become more friendly and creative. These findings support the idea of wearing business casuals on a Friday; since colleagues are most likely to take out time to socialize on the last work day of the week. I mean, who wants to hang out with people in their suits?', NULL, NULL, 349, 'IMPORT', 'cet4-2025-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-2-r3'
);
SET @pg_cet4_2025_06_2_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-2-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-r4', 'CAREFUL_READING', 'CET4', NULL, 'With the rise of pop music, jazz, and electronic music, both opera and classical music started to fade away from the public eye. Some people are beginning to wonder whether opera and classical music are still relevant to the modern world of music. Granted, you will not typically see today''s teenagers lending their ears to Bach anytime soon, but there are some major indicators that both opera and classical music are now still quite alive. The most major indicator of classical music''s importance in society today is the fact that much of the popular music that is currently being produced uses similar beats, harmonies, and melodies(旋律) as those that were used in some of classical music''s best works. Even so, it can be difficult for those who do not study music theory to see this as an indicator, since it is subtle and just shows the impact symphonic(交响乐的) orchestras have had on society''s taste in music. A better example for the relevance of opera and classical music can be seen in the invention of the rock opera. Opera, in its simplest definition, is telling a story using music as its form. The art of telling a story using music has not faded in the least bit. In fact, sometimes actual orchestras are used for major parts of the opera itself. Some of the world''s greatest hits have been parts of rock operas. Fans of classical music can also tell you that there are few types of music that are more expressive. So, it should come as no surprise to anyone that classical music pieces are still used as background music in modern movies. Symphonic orchestra compositions have also been created solely for the purpose of being included in major motion pictures. These are often very well received amongst mainstream music fans. Classical music and opera are the very foundation of what our modern music is based upon. Considering the huge impact they have had on our current society, it is without doubt that we can expect them to continue to remain important for centuries to come.', NULL, NULL, 346, 'IMPORT', 'cet4-2025-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-2-r4'
);
SET @pg_cet4_2025_06_2_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-2-r4' LIMIT 1);

-- 翻译 cet4-2025-06-2
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-translation'
);
SET @q_cet4_2025_06_2_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_01, '近年来,中国东北地区正在大力开发冰雪资源。例如,哈尔滨利用丰富的冰雪资源打造了极具地方特色的"冰雪大世界",让游客在欣赏冰雪之美的同时也能体验当地独特的民俗文化。如今,曾令人畏惧的冰天雪地正吸引着四面八方的游客,成为深受欢迎的旅游胜地。冰雪旅游业正为当地的经济发展做出越来越大的贡献。', NULL, 'In recent years, Northeast China has been vigorously developing its ice and snow resources. For example, Harbin has built the Ice and Snow World with strong local characteristics by making full use of its rich ice and snow resources, allowing tourists to experience the unique local folk culture while enjoying the beauty of ice and snow. Today, the once-feared land of ice and snow is attracting tourists from all directions and has become a popular tourist destination. Ice and snow tourism is making an increasingly great contribution to the local economic development.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_01
);

-- 听力 Q1 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q01', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q01'
);
SET @q_cet4_2025_06_2_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_02, NULL, '{"A":"A) They are young teenagers from Atlanta.","B":"B) They won this year''s 7 Mile Bridge Run.","C":"C) They completed the race in less than 40 minutes.","D":"D) They are both students at Marathon High School."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_02
);

-- 听力 Q2 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q02', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q02'
);
SET @q_cet4_2025_06_2_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_03, NULL, '{"A":"A) It drew competitors from more than 40 countries.","B":"B) It is watched live online by fans all over the world.","C":"C) It closed the city of Big Pine Key to traffic for three hours.","D":"D) It is one of the most popular running events in the southeastern U.S."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_03
);

-- 听力 Q3 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q03', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q03'
);
SET @q_cet4_2025_06_2_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_04, NULL, '{"A":"A) He was once a full-time ambassador.","B":"B) He was soon to retire from the army.","C":"C) He became an astronaut in 2015.","D":"D) He used to be a helicopter pilot."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_04
);

-- 听力 Q4 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q04', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q04'
);
SET @q_cet4_2025_06_2_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_05, NULL, '{"A":"A) It has been unbelievably exciting and rewarding.","B":"B) It has been extraordinarily tough and demanding.","C":"C) It has contributed a great deal to human flights to space.","D":"D) It has given him exceptional privilege as an ambassador."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_05
);

-- 听力 Q5 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q05', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q05'
);
SET @q_cet4_2025_06_2_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_06, NULL, '{"A":"A) They are known for their loyalty to their owners.","B":"B) They are brought in by the store''s customers.","C":"C) They are regular visitors to the store.","D":"D) They are pets kept by the store staff."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_06
);

-- 听力 Q6 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q06', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q06'
);
SET @q_cet4_2025_06_2_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_07, NULL, '{"A":"A) It might be a nuisance to the loyal shoppers.","B":"B) It might have been abandoned by its owner.","C":"C) It might be 12 months old.","D":"D) It might have got lost."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_07
);

-- 听力 Q7 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q07', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q07'
);
SET @q_cet4_2025_06_2_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_08, NULL, '{"A":"A) Feed the cats.","B":"B) Remove any store signs.","C":"C) Sit in the shop aisles.","D":"D) Bring in pets with them."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q08', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q08'
);
SET @q_cet4_2025_06_2_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_09, NULL, '{"A":"A) Sharing her room with friends.","B":"B) Cutting down her living expenses.","C":"C) Living off campus.","D":"D) Moving to the city center."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_09
);

-- 听力 Q9 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q09', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q09'
);
SET @q_cet4_2025_06_2_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_10, NULL, '{"A":"A) The facilities available.","B":"B) Various costs involved.","C":"C) Changes in living conditions.","D":"D) The distance to her home."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_10
);

-- 听力 Q10 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q10', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q10'
);
SET @q_cet4_2025_06_2_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_11, NULL, '{"A":"A) Went through much trouble.","B":"B) Commuted to save money.","C":"C) Studied on the bus.","D":"D) Lived on campus."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_11
);

-- 听力 Q11 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q11', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q11'
);
SET @q_cet4_2025_06_2_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_12, NULL, '{"A":"A) Discuss the matter with the woman''s mother.","B":"B) Make a decision within a few days.","C":"C) Try his best to persuade his wife.","D":"D) Weigh the benefits against the disadvantages."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_12
);

-- 听力 Q12 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q12', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q12'
);
SET @q_cet4_2025_06_2_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_13, NULL, '{"A":"A) Interviewing the man.","B":"B) Looking for Lawrence.","C":"C) Choosing a present for her nephew.","D":"D) Helping the man with his shopping."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_13
);

-- 听力 Q13 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q13', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q13'
);
SET @q_cet4_2025_06_2_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_14, NULL, '{"A":"A) Quite educational.","B":"B) Incredibly popular.","C":"C) Driven by batteries.","D":"D) Obviously childish."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_14
);

-- 听力 Q14 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q14', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q14'
);
SET @q_cet4_2025_06_2_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_15, NULL, '{"A":"A) One he loves for helping exercise his mind.","B":"B) One he can play together with his sister.","C":"C) One he finds interesting and challenging.","D":"D) One he can play either alone or in a group."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_15
);

-- 听力 Q15 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q15', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q15'
);
SET @q_cet4_2025_06_2_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_16, NULL, '{"A":"A) It has been enjoyed by kids for decades.","B":"B) It always reminds people of times of war.","C":"C) It has been played both indoors and outdoors.","D":"D) It distinguishes itself as one of the oldest games."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_16
);

-- 听力 Q16 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q16', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q16'
);
SET @q_cet4_2025_06_2_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_17, NULL, '{"A":"A) A display of a variety of products increases consumers'' interest.","B":"B) Too many choices decrease one''s desire to buy.","C":"C) Fewer choices lead to lower customer satisfaction.","D":"D) Customers given more choices are more likely to get confused."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_17
);

-- 听力 Q17 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q17', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q17'
);
SET @q_cet4_2025_06_2_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_18, NULL, '{"A":"A) What kind of display results in more sales.","B":"B) What kind of display creates more interest.","C":"C) What kind of display attracts a greater crowd of customers.","D":"D) What kind of display leads to greater customer satisfaction."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_18
);

-- 听力 Q18 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q18', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q18'
);
SET @q_cet4_2025_06_2_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_19, NULL, '{"A":"A) There are situations where customers buy nothing.","B":"B) There are tricks to increase customer satisfaction.","C":"C) There are ways to predict customer preferences.","D":"D) There are rules that motivate customers to buy."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_19
);

-- 听力 Q19 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q19', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q19'
);
SET @q_cet4_2025_06_2_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_20, NULL, '{"A":"A) Stressful.","B":"B) Burdensome.","C":"C) Worthwhile.","D":"D) Energy-boosting."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_20
);

-- 听力 Q20 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q20', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q20'
);
SET @q_cet4_2025_06_2_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_21, NULL, '{"A":"A) By linking it with employees'' salary.","B":"B) By taking it as the New Year resolution.","C":"C) By improving work schedules.","D":"D) By making it part of the job."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_21
);

-- 听力 Q21 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q21', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q21'
);
SET @q_cet4_2025_06_2_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_22, NULL, '{"A":"A) It was very important to their well-being.","B":"B) It had taken little of their spare time.","C":"C) It was an outlet for their personal fulfillment.","D":"D) It helped improve their working environment."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_22
);

-- 听力 Q22 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q22', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q22'
);
SET @q_cet4_2025_06_2_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_23, NULL, '{"A":"A) It amounts to 2,000 tons daily.","B":"B) It mostly comes from supermarkets.","C":"C) It is estimated at 11% of the UK''s total food supply.","D":"D) It has a lot to do with independent luxury food suppliers."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_23
);

-- 听力 Q23 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q23', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q23'
);
SET @q_cet4_2025_06_2_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_24, NULL, '{"A":"A) It rents bicycles to deliver food.","B":"B) It sells sought-after coffee beans.","C":"C) It delivers luxury hand-made food.","D":"D) It recycles waste food from the city."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_24
);

-- 听力 Q24 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q24', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q24'
);
SET @q_cet4_2025_06_2_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_25, NULL, '{"A":"A) It pays special attention to the size and shape of its products.","B":"B) It tries to escape the constraints of the current food system.","C":"C) It cooperates closely with local producers.","D":"D) It aims to provide high-quality products."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_25
);

-- 听力 Q25 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q25', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q25'
);
SET @q_cet4_2025_06_2_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_26, NULL, '{"A":"A) To ensure a regular supply.","B":"B) To maintain a unique menu.","C":"C) To make up for the waste products.","D":"D) To meet customers'' urgent demand."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q26'
);
SET @q_cet4_2025_06_2_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_27, NULL, '{"A":"A) caught","B":"B) cinema","C":"C) engaging","D":"D) graphically","E":"E) highly","F":"F) incentive","G":"G) instincts","H":"H) offences","I":"I) punished","J":"J) referred","K":"K) stood","L":"L) symbolic","M":"M) tuned","N":"N) visually","O":"O) worshipped"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q27'
);
SET @q_cet4_2025_06_2_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_28, NULL, '{"A":"A) caught","B":"B) cinema","C":"C) engaging","D":"D) graphically","E":"E) highly","F":"F) incentive","G":"G) instincts","H":"H) offences","I":"I) punished","J":"J) referred","K":"K) stood","L":"L) symbolic","M":"M) tuned","N":"N) visually","O":"O) worshipped"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q28'
);
SET @q_cet4_2025_06_2_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_29, NULL, '{"A":"A) caught","B":"B) cinema","C":"C) engaging","D":"D) graphically","E":"E) highly","F":"F) incentive","G":"G) instincts","H":"H) offences","I":"I) punished","J":"J) referred","K":"K) stood","L":"L) symbolic","M":"M) tuned","N":"N) visually","O":"O) worshipped"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q29'
);
SET @q_cet4_2025_06_2_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_30, NULL, '{"A":"A) caught","B":"B) cinema","C":"C) engaging","D":"D) graphically","E":"E) highly","F":"F) incentive","G":"G) instincts","H":"H) offences","I":"I) punished","J":"J) referred","K":"K) stood","L":"L) symbolic","M":"M) tuned","N":"N) visually","O":"O) worshipped"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q30'
);
SET @q_cet4_2025_06_2_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_31, NULL, '{"A":"A) caught","B":"B) cinema","C":"C) engaging","D":"D) graphically","E":"E) highly","F":"F) incentive","G":"G) instincts","H":"H) offences","I":"I) punished","J":"J) referred","K":"K) stood","L":"L) symbolic","M":"M) tuned","N":"N) visually","O":"O) worshipped"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q31'
);
SET @q_cet4_2025_06_2_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_32, NULL, '{"A":"A) caught","B":"B) cinema","C":"C) engaging","D":"D) graphically","E":"E) highly","F":"F) incentive","G":"G) instincts","H":"H) offences","I":"I) punished","J":"J) referred","K":"K) stood","L":"L) symbolic","M":"M) tuned","N":"N) visually","O":"O) worshipped"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q32'
);
SET @q_cet4_2025_06_2_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_33, NULL, '{"A":"A) caught","B":"B) cinema","C":"C) engaging","D":"D) graphically","E":"E) highly","F":"F) incentive","G":"G) instincts","H":"H) offences","I":"I) punished","J":"J) referred","K":"K) stood","L":"L) symbolic","M":"M) tuned","N":"N) visually","O":"O) worshipped"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q33'
);
SET @q_cet4_2025_06_2_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_34, NULL, '{"A":"A) caught","B":"B) cinema","C":"C) engaging","D":"D) graphically","E":"E) highly","F":"F) incentive","G":"G) instincts","H":"H) offences","I":"I) punished","J":"J) referred","K":"K) stood","L":"L) symbolic","M":"M) tuned","N":"N) visually","O":"O) worshipped"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q34'
);
SET @q_cet4_2025_06_2_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_35, NULL, '{"A":"A) caught","B":"B) cinema","C":"C) engaging","D":"D) graphically","E":"E) highly","F":"F) incentive","G":"G) instincts","H":"H) offences","I":"I) punished","J":"J) referred","K":"K) stood","L":"L) symbolic","M":"M) tuned","N":"N) visually","O":"O) worshipped"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q35'
);
SET @q_cet4_2025_06_2_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_36, NULL, '{"A":"A) caught","B":"B) cinema","C":"C) engaging","D":"D) graphically","E":"E) highly","F":"F) incentive","G":"G) instincts","H":"H) offences","I":"I) punished","J":"J) referred","K":"K) stood","L":"L) symbolic","M":"M) tuned","N":"N) visually","O":"O) worshipped"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q36'
);
SET @q_cet4_2025_06_2_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_37, 'Fruit juice is different from whole fruit in that it contains much less fibre.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q37'
);
SET @q_cet4_2025_06_2_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_38, 'Some people believe a juice diet helps to rid our body of harmful or poisonous substances.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q38'
);
SET @q_cet4_2025_06_2_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_39, 'A lot of research comes to the same conclusion that fruit juice does harm to the human body when it leads to surplus calories.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q39'
);
SET @q_cet4_2025_06_2_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_40, 'The claimed health benefits of fruit and vegetable juices have rendered the industry very profitable.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q40'
);
SET @q_cet4_2025_06_2_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_41, 'To increase the benefits of fruit juice to our health, we''d better choose ripe fruit to make juice.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q41'
);
SET @q_cet4_2025_06_2_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_42, 'Diets containing large amounts of fibre reduce the risk of heart disease, diabetes and other health hazards.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q42'
);
SET @q_cet4_2025_06_2_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_43, 'According to a research paper, drinking fruit juice is beneficial on condition that it is consumed in reasonable amounts.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q43'
);
SET @q_cet4_2025_06_2_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_44, 'One expert claims that juicing wastes a lot of nutrients contained in fruits.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q44'
);
SET @q_cet4_2025_06_2_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_45, 'It takes some time for fruit''s cells to be digested and for fructose to be absorbed.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q45'
);
SET @q_cet4_2025_06_2_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_46, 'A lot of research has demonstrated that drinking fruit juice does not reduce our daily consumption of other foods.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q46'
);
SET @q_cet4_2025_06_2_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_47, 'What does science suggest the right dress may do?', '{"A":"A) Add to our advantage in work and life.","B":"B) Enable us to look a lot more attractive.","C":"C) Help us to enjoy a fuller personal life.","D":"D) Provide extra energy for what we do."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q47'
);
SET @q_cet4_2025_06_2_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_48, 'Why does science say the clothes one wears may affect their interaction with others?', '{"A":"A) Clothes usually represent one''s social and economic status.","B":"B) Clothes largely determine one''s likability by people around.","C":"C) Different types of clothing markedly reflect different personalities.","D":"D) Different types of clothing convey different messages symbolically."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q48'
);
SET @q_cet4_2025_06_2_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_49, 'How do the clothes we wear sway our evaluation of ourselves?', '{"A":"A) By exerting an effect on our power of judgment.","B":"B) By impacting how we feel about ourselves.","C":"C) By affecting what we take as the basis for assessment.","D":"D) By influencing our interpretation of symbolic messages."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q49'
);
SET @q_cet4_2025_06_2_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_50, 'Why does the author say tailored jackets are associated with being ''dressed for success''?', '{"A":"A) They are necessary for formal business dealings.","B":"B) They may help people concentrate on their business.","C":"C) They are vital to keeping a dominant position in business transactions.","D":"D) They may enable people to have the right mentality for doing business."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q50'
);
SET @q_cet4_2025_06_2_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_51, 'What are people advised to do when they want to socialize?', '{"A":"A) Focus on clothing.","B":"B) Wear a good suit.","C":"C) Dress casually.","D":"D) Look unusual."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q51'
);
SET @q_cet4_2025_06_2_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_52, 'What does the author think of classical music and opera in today''s world?', '{"A":"A) They still make their presence felt.","B":"B) They have given way to electronic music.","C":"C) They will not fade away from the public eye.","D":"D) They are no longer relevant to teenagers'' lives."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q52'
);
SET @q_cet4_2025_06_2_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_53, 'What do we learn about much of the popular music currently produced?', '{"A":"A) It can be difficult for many classical music fans to appreciate.","B":"B) It can be seen as an indicator of refinement on classical music.","C":"C) It caters to society''s taste in music in a more subtle way than classical music.","D":"D) It contains elements similar to those in some masterpieces of classical music."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q53'
);
SET @q_cet4_2025_06_2_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_54, 'Why does the author mention the invention of the rock opera?', '{"A":"A) To illustrate how to tell a story using music.","B":"B) To present the simplest definition of opera.","C":"C) To show the relevance of opera and classical music.","D":"D) To justify the necessity of using orchestras in opera."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q54'
);
SET @q_cet4_2025_06_2_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_55, 'Why are classical music pieces still used as background music in modern movies?', '{"A":"A) There are few types of music for movie producers to choose from.","B":"B) They are considered to be the most expressive type of music.","C":"C) They are well received by movie fans from all over the world.","D":"D) They are essential for movies to become the world''s greatest hits."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-2-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q55'
);
SET @q_cet4_2025_06_2_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-2-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_2_56, 'What do we learn about our modern music?', '{"A":"A) It could not have come into being without classical music and opera as its foundation.","B":"B) It cannot outcompete classical music and opera in its impact on our current society.","C":"C) It will not enjoy as much popularity as classical music and opera among music fans.","D":"D) It might not be able to rival classical music and opera in importance for centuries to come."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_2_56
);

-- ==================== cet4-2025-06-3 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-r1', 'BANKED_CLOZE', 'CET4', NULL, 'The human brain has the ability to constantly form new networks and connections between brain cells. This means the brain has an almost magical ability to change. This characteristic is __26__ apparent in a new study, focusing on people who underwent a hemispherectomy, a surgical procedure in which half of the brain is removed to treat illness. The findings showed that, despite missing half of this critical __27__ , participants could function well. This was because the __28__ half of their brain strengthened. In fact, researchers found that connections and thus communication—between parts of different brain networks are actually stronger in people who had hemispherectomies than in people with intact brains. This __29__ that the brain is able to compensate for loss of certain brain structure. There are many other cases in the medical __30__ that document the brain''s amazing ability to __31__ For example, a young boy had a significant portion of his brain removed for medical reasons, which included the part of the brain __32__ for sight. But a few years after his surgery, scientists found that he could __33__ see. They determined that this was because other parts of his brain took over the missing part''s __34__ tasks. Another study involved people who could smell, despite missing the region in the brain that processes information about smells. Though they are not sure how these individuals __35__ the ability to smell, scientists believe it is possible that another part of the brain took on that task.', NULL, '["A) adapt","B) hardly","C) indicates","D) insist","E) literature","F) organ","G) particularly","H) remaining","I) responsible","J) retained","K) still","L) strategy","M) transformed","N) underlines","O) visual"]', 248, 'IMPORT', 'cet4-2025-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-3-r1'
);
SET @pg_cet4_2025_06_3_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-3-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-r2', 'MATCHING', 'CET4', '"Phantom" Traffic Jams Are Real—And Scientists Know How to Stop Them', 'A) Traffic jams are a common problem of most big cities, either in developed or in developing countries, but one kind of traffic jams in particular can be especially frustrating. These are generally known as "phantom" traffic jams, in which dense traffic crawls to a halt for no apparent reason at all. B) "When caught in such a traffic jam, it is common for drivers to assume that there must be an accident, or construction or something," said Massachusetts Institute of Technology (MIT) computer science professor Berthold Horn. "And then you drive and drive and drive… and there isn''t anything there." C) The exact cause of these phantom traffic jams has long remained a mystery. But now, new research has found the cause and researchers may have come up with a solution for this frustrating traffic pattern: maintaining equal spacing between cars on the road, rather than driving so closely behind another vehicle that a collision(碰撞) is likely if that vehicle brakes suddenly. D) Horn said phantom traffic jams are an emergent property of the flow of vehicles down a highway. A phantom jam begins when a car in dense traffic slows down even slightly, which causes the car behind that vehicle to slow even more—and the slowing action spreads backward through the lane of traffic like a wave, getting worse the farther it spreads. Eventually, the cars far behind are forced to stop completely or risk hitting the slower vehicles ahead—and so the traffic grinds to a halt over nothing, Horn said. E) Horn has been working on the problem of phantom traffic jams for years, and he has come up with a solution: By splitting the difference between the cars in front and the cars behind, the spacing of cars in a stream of traffic can act as a damper(抑制) on phantom traffic jams. That is, it can prevent the slow-down effect from being amplified(增强) by the cars that follow behind, he said. In essence, each driver would constantly make adjustments to keep their car roughly halfway between the car in front and the car behind. F) Horn calls this method of vehicle spacing bilateral(双边的) control, and he said it could be achieved with relatively simple modifications to the adaptive cruise control that many new cars already have. Adaptive cruise control is a driver assistance technology that sets a maximum speed for vehicles and automatically slows the speed of the car when traffic is sensed in front of the vehicle. The technology is also known as autonomous cruise control. Such modifications, Horn said, could help fight phantom jams within a few years, maybe decades before an alternative solution, such as networked self-driving cars, becomes a reality on the roads. G) Traffic jams are caused by a number of factors, such as roads that are poorly designed or over-capacity, localized factors like city traffic-lighting patterns, and events like accidents and construction. But phantom traffic jams can make all those problems worse, Horn said. And the researchers in the new study have calculated that solving phantom jams could save at least some of the estimated $121 billion per year that traffic jams are estimated to cost the U.S. economy, Horn told Live Science. H) New research by Horn and MIT postdoctoral associate Liang Wang, published in the journal IEEE Transactions on Intelligent Transportation Systems, shows how bilateral control can fight the problem. The researchers made computer models of real-world traffic conditions, showing how a typical U.S. freeway could benefit from cars using bilateral control. That would be in place when human drivers fail to slow down, thus avoiding tailgating( 紧跟) the car in front, Horn said. "Under reasonable conditions today, you might get 1,800 cars per lane per hour throughput (the volume of traffic passing through)," he added. "But with bilateral control, you could almost double that." I) The main alternative to increasing traffic throughput per lane has been to build more lanes and more highways, and putting in new roads is very expensive, he said. "If we can increase the throughput on major highways, even if it''s only by 50 percent, that would be a big deal," Horn said. J) With the help of engineering students at high schools in Maine, Horn and Wang have also built a robot simulation(模拟) that shows how bilateral control can suppress phantom traffic jams. Increasing the spacing of vehicles dampens the effect of slowdowns by cars in front of a given car, so that the slowing is not worsened until it becomes a phantom jam, the researchers said. K) A video from the project shows a train of autonomous robots running along a track without bilateral control; they eventually back up in phantom jams. But when the robots are switched over to bilateral control (by flashing the lights in the room), each autonomous robot tries to keep itself halfway between the robot in front and the one behind; the phantom jams disappear as a result, Horn said. L) Since starting his research on phantom traffic jams, Horn has learned that schools of fish and flocks of birds and bats use similar spacing strategies to avoid hitting each other while swimming or flying in densely packed groups. In particular, studies of millions of bats emerging at dusk from caves in Southeast Asia showed that each bat used a form of bilateral control to reduce the likelihood of collisions with other bats in the densely packed swarm(一大群), Horn said. M) Unlike bats, birds and fish, however, humans have difficulty judging distances behind them. To address that weakness, Horn is now working with the car company Toyota to enable a form of bilateral control via modifications to existing adaptive cruise control systems, which use forward-facing sensors to judge the distance to the vehicle ahead. The bilateral control approach would include adding rear-facing sensors to determine the distance to the vehicle following a car. N) But until those systems become standard, human drivers can help reduce phantom traffic jams simply by not following the car in front so closely. As Horn argues, "There''s absolutely no advantage of tailgating the car in front of you."', NULL, NULL, 1017, 'IMPORT', 'cet4-2025-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-3-r2'
);
SET @pg_cet4_2025_06_3_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-3-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-r3', 'CAREFUL_READING', 'CET4', NULL, 'Our society places a high value on physical beauty. Americans spend an average of over $722 each year on their appearance. One in ten Americans has tried to look like a star. There''s nothing wrong with trying to look our best, but excessive focus on physical appearance misses the soulful aspects of what it means to be beautiful. Trying to look like the magazine pictures can take us on a long ride away from what beauty is really about. Many of us spend far too much time, energy, and money trying to polish an image of what we think will bring attention, love, and connection. In the process, we may fail to attend to ourselves in a way that would move us toward deeper intimacy, fulfillment, and meaning. It may sound trite(老生常谈的), but beauty is only skin deep; it''s not what brings love toward us. Just read about the latest Hollywood starlets whose seeming love turns into resentment and bitter court battles. Outer beauty can be as much of a curse as a blessing. We may develop a habit of being so focused on maintaining a perfect appearance that we never cultivate the inner qualities necessary to sustain and deepen intimacy and connection. As I describe in my book, The Authentic Heart, it is the courage to be authentic that connects us in a deeper way. While our initial attraction may be based, in part, on physical chemistry, it is the meeting of our inner worlds that creates the lasting intimacy and spiritual connection for which we long. If we redirect our attention toward cultivating inner qualities, we might find a magnetic attraction that moves us from something superficial to something that connects us to our depths. The path toward cultivating inner beauty is really simple. But what is simple is not always easy. Not everyone will see us and appreciate us as we take the courageous risk to allow ourselves to be seen as we really are. But if they don''t, it is their loss, not ours. Eventually we''ll find those compatible souls who appreciate us as we are.', NULL, NULL, 350, 'IMPORT', 'cet4-2025-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-3-r3'
);
SET @pg_cet4_2025_06_3_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-3-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-r4', 'CAREFUL_READING', 'CET4', NULL, 'Plant-based meats are coming soon to a dinner table near you, but do they deserve a spot on your plate? If you tried a vegetable burger years ago and dismissed it as rubbery and flavorless, it''s a good time to give meatless meat another chance. Newer varieties imitate the look, flavor, and texture of meat. Analysts don''t expect the meat-free movement to slow anytime soon; a 2021 report predicts the market will skyrocket to $74 billion by 2030—a 957 percent surge. Plant-based meats are no longer just for vegetarians. Companies such as Impossible Foods and Beyond Meat —the current superstars of the alternative protein sector—are pursuing consumers who enjoy meat but want to reduce their meat consumption for animal rights, health, or environmental reasons. So far, it''s a winning strategy: More than nine out of ten consumers who buy Beyond Burger and Impossible Foods products also eat meat. Many vegetarians don''t actually care for food that resembles meat. When reporter Joan Solsman, a longtime vegetarian, tried a dish from Impossible Foods, she felt so sick that she couldn''t finish it. "Maybe the best sign that Impossible Foods has cracked the code to realistic fake meat is that I couldn''t stand to take another bite," she wrote. Meatless meats are generally a healthier choice than beef because they are cholesterol-free, plus they''re a good source of vitamins, minerals, protein, and fiber. If meatless meat can help you stick to a plant-based diet, that in itself can lead to better health. Not only has red meat been linked to cancer, but studies show that people who ditch meat have lower blood pressure, lower average blood sugar, and lower cholesterol levels. However, just because it''s plant-based doesn''t mean it''s health food. Most imitation meats are highly processed and contain high amounts of sodium(钠) compared to traditional beef. These new generations of alternate meat get all the attention, but don''t forget about whole grains and vegetables. Beans are an especially excellent protein substitute. They''re nutritious, inexpensive, and far more sustainable than any of the processed meatless substitutes on the market today.', NULL, NULL, 347, 'IMPORT', 'cet4-2025-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-3-r4'
);
SET @pg_cet4_2025_06_3_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-3-r4' LIMIT 1);

-- 翻译 cet4-2025-06-3
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-translation'
);
SET @q_cet4_2025_06_3_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_01, '近年来,中国越来越多的城市着力打造"15分钟便民生活圈(convenient living circles)"。社区居民步行15分钟就能享受到日常所需的公共服务。生活圈内建有便利店、公园、健身场地、图书馆、学校、社区食堂、诊所等。生活圈的建立能够为居民提供更加便利、舒适、友好、愉悦的生活环境,更好地满足城市居民多元化的日常生活服务需求,提升居民的生活品质和幸福感。', NULL, 'In recent years, an increasing number of Chinese cities have been striving to build "15-minute convenient living circles". Within such a circle, community residents can have access to the public services they need in daily life within just a 15-minute walk. There are facilities such as convenience stores, parks, fitness areas, libraries, schools, community canteens and clinics. The establishment of these living circles can provide residents with a more convenient, comfortable, friendly and pleasant living environment, thus better meeting the diverse daily-life service needs of urban residents and improving their quality of life and sense of happiness.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_01
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q26'
);
SET @q_cet4_2025_06_3_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_02, NULL, '{"A":"A) adapt","B":"B) hardly","C":"C) indicates","D":"D) insist","E":"E) literature","F":"F) organ","G":"G) particularly","H":"H) remaining","I":"I) responsible","J":"J) retained","K":"K) still","L":"L) strategy","M":"M) transformed","N":"N) underlines","O":"O) visual"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_02
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q27'
);
SET @q_cet4_2025_06_3_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_03, NULL, '{"A":"A) adapt","B":"B) hardly","C":"C) indicates","D":"D) insist","E":"E) literature","F":"F) organ","G":"G) particularly","H":"H) remaining","I":"I) responsible","J":"J) retained","K":"K) still","L":"L) strategy","M":"M) transformed","N":"N) underlines","O":"O) visual"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_03
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q28'
);
SET @q_cet4_2025_06_3_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_04, NULL, '{"A":"A) adapt","B":"B) hardly","C":"C) indicates","D":"D) insist","E":"E) literature","F":"F) organ","G":"G) particularly","H":"H) remaining","I":"I) responsible","J":"J) retained","K":"K) still","L":"L) strategy","M":"M) transformed","N":"N) underlines","O":"O) visual"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_04
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q29'
);
SET @q_cet4_2025_06_3_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_05, NULL, '{"A":"A) adapt","B":"B) hardly","C":"C) indicates","D":"D) insist","E":"E) literature","F":"F) organ","G":"G) particularly","H":"H) remaining","I":"I) responsible","J":"J) retained","K":"K) still","L":"L) strategy","M":"M) transformed","N":"N) underlines","O":"O) visual"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_05
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q30'
);
SET @q_cet4_2025_06_3_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_06, NULL, '{"A":"A) adapt","B":"B) hardly","C":"C) indicates","D":"D) insist","E":"E) literature","F":"F) organ","G":"G) particularly","H":"H) remaining","I":"I) responsible","J":"J) retained","K":"K) still","L":"L) strategy","M":"M) transformed","N":"N) underlines","O":"O) visual"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_06
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q31'
);
SET @q_cet4_2025_06_3_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_07, NULL, '{"A":"A) adapt","B":"B) hardly","C":"C) indicates","D":"D) insist","E":"E) literature","F":"F) organ","G":"G) particularly","H":"H) remaining","I":"I) responsible","J":"J) retained","K":"K) still","L":"L) strategy","M":"M) transformed","N":"N) underlines","O":"O) visual"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_07
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q32'
);
SET @q_cet4_2025_06_3_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_08, NULL, '{"A":"A) adapt","B":"B) hardly","C":"C) indicates","D":"D) insist","E":"E) literature","F":"F) organ","G":"G) particularly","H":"H) remaining","I":"I) responsible","J":"J) retained","K":"K) still","L":"L) strategy","M":"M) transformed","N":"N) underlines","O":"O) visual"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_08
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q33'
);
SET @q_cet4_2025_06_3_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_09, NULL, '{"A":"A) adapt","B":"B) hardly","C":"C) indicates","D":"D) insist","E":"E) literature","F":"F) organ","G":"G) particularly","H":"H) remaining","I":"I) responsible","J":"J) retained","K":"K) still","L":"L) strategy","M":"M) transformed","N":"N) underlines","O":"O) visual"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_09
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q34'
);
SET @q_cet4_2025_06_3_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_10, NULL, '{"A":"A) adapt","B":"B) hardly","C":"C) indicates","D":"D) insist","E":"E) literature","F":"F) organ","G":"G) particularly","H":"H) remaining","I":"I) responsible","J":"J) retained","K":"K) still","L":"L) strategy","M":"M) transformed","N":"N) underlines","O":"O) visual"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_10
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q35'
);
SET @q_cet4_2025_06_3_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_11, NULL, '{"A":"A) adapt","B":"B) hardly","C":"C) indicates","D":"D) insist","E":"E) literature","F":"F) organ","G":"G) particularly","H":"H) remaining","I":"I) responsible","J":"J) retained","K":"K) still","L":"L) strategy","M":"M) transformed","N":"N) underlines","O":"O) visual"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_11
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q36'
);
SET @q_cet4_2025_06_3_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_12, 'The age-long mystery has now been resolved as to how phantom traffic jams are caused.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_12
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q37'
);
SET @q_cet4_2025_06_3_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_13, 'It is possible to nearly double the hourly throughput per lane by adopting bilateral control.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_13
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q38'
);
SET @q_cet4_2025_06_3_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_14, 'According to Horn, drivers making constant adjustments for equal spacing between cars in a flow of traffic can help reduce phantom traffic jams.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_14
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q39'
);
SET @q_cet4_2025_06_3_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_15, 'Before systems for bilateral control are installed, drivers should not follow the car in front too closely so as to reduce phantom traffic jams.', NULL, 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_15
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q40'
);
SET @q_cet4_2025_06_3_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_16, 'Horn said with some simple modifications to the existing equipment in new vehicles, their spacing bilateral control could be accomplished.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_16
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q41'
);
SET @q_cet4_2025_06_3_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_17, 'Drivers caught up in phantom traffic jams are likely to think an accident has happened or some construction is going on.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_17
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q42'
);
SET @q_cet4_2025_06_3_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_18, 'Two sets of sensors would be used to help drivers determine the distances between cars.', NULL, 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_18
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q43'
);
SET @q_cet4_2025_06_3_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_19, 'Solving the problem of phantom jams could save America billions of dollars every year.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_19
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q44'
);
SET @q_cet4_2025_06_3_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_20, 'In a phantom traffic jam, the cars in the same lane slow down one after another, creating a wave-like effect.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_20
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q45'
);
SET @q_cet4_2025_06_3_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_21, 'Horn has found that certain creatures use strategies similar to bilateral control to avoid hitting each other while moving in dense crowds.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_21
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q46'
);
SET @q_cet4_2025_06_3_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_22, 'What do we learn about American society from the first paragraph?', '{"A":"A) It sees lots of personal income wasted on beauty products.","B":"B) It considers one''s physical appearance very important.","C":"C) It places a high value on the physical fitness of stars.","D":"D) It expects every individual to look their very best."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_22
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q47'
);
SET @q_cet4_2025_06_3_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_23, 'What happens when people strive to look better?', '{"A":"A) They have to get prepared for resentment and bitter court battles.","B":"B) They are better able to gain attention, love, and personal connection.","C":"C) They may neglect to cultivate the inner qualities that matter more.","D":"D) They feel much of their precious time, energy and resources is wasted."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_23
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q48'
);
SET @q_cet4_2025_06_3_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_24, 'What does the author say about outer beauty?', '{"A":"A) It may be inherited or cultivated.","B":"B) It may lead to bad as well as good habits.","C":"C) It may create connection or isolation.","D":"D) It may do as much harm as good."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_24
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q49'
);
SET @q_cet4_2025_06_3_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_25, 'What brings about spiritual connection?', '{"A":"A) Meeting of minds.","B":"B) Attraction at first sight.","C":"C) Physical chemistry.","D":"D) Frequent interaction."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_25
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q50'
);
SET @q_cet4_2025_06_3_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_26, 'What happens when we take the path toward cultivating inner beauty?', '{"A":"A) We may find a route toward other people''s souls.","B":"B) We may be appreciated more by people around us.","C":"C) We will meet people who value us for who we are.","D":"D) We will be discouraged from revealing our true selves."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_26
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q51'
);
SET @q_cet4_2025_06_3_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_27, 'What can we expect of plant-based meats?', '{"A":"A) An increasing interest in their analyses.","B":"B) An enormous effort in their promotion.","C":"C) A huge boost in their consumption.","D":"D) A noticeable surge in their varieties."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_27
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q52'
);
SET @q_cet4_2025_06_3_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_28, 'What do we learn about consumers buying Beyond Burger and Impossible Foods products?', '{"A":"A) They are mostly non-vegetarians.","B":"B) They are mostly animal-rights advocates.","C":"C) Most of them refrain from eating meat for health reasons.","D":"D) Most of them eat meatless meat to protect the environment."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_28
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q53'
);
SET @q_cet4_2025_06_3_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_29, 'What can we conclude about Impossible Foods'' products from Joan Solsman''s remark?', '{"A":"A) They more often appeal to meat-eaters.","B":"B) They very much resemble animal meat.","C":"C) Some have become its signature dishes.","D":"D) Most of them are sold as true fake meat."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_29
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q54'
);
SET @q_cet4_2025_06_3_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_30, 'Why can the habit of eating a plant-based diet lead to better health?', '{"A":"A) It frees people from any known link to cancer.","B":"B) It provides all the nutrients for staying healthy.","C":"C) It helps maintain normal blood pressure and blood sugar.","D":"D) It reduces various health risks posed by meat consumption."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_30
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-3-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q55'
);
SET @q_cet4_2025_06_3_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-3-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_3_31, 'What does the author recommend we eat at the end of the passage?', '{"A":"A) Naturally produced foods.","B":"B) Processed protein substitutes.","C":"C) Red meats like traditional beef.","D":"D) New generations of alternate meat."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_3_31
);

-- ==================== cet4-2025-12-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-r1', 'BANKED_CLOZE', 'CET4', NULL, 'People tend to want as many choices as possible. They believe this will maximize their __26__ of making the best decision. But research shows that, when it comes to actually making a __27__ from all of these choices, people can become __28__ and avoid making a decision altogether. Even worse, when people finally do decide, they are generally less satisfied with their decision and feel more regretful over whatever choice they made. Why does this happen? Research shows that when people choose from many options, they __29__ more in the decision, but feel less confident in their ability to decide well. In other words, when we are __30__ with more choices, making the "right" or "correct" decision begins to feel more __31__ and, at the same time, more difficult to do. This may contribute to the deep fear that we will make the wrong decision. How can we solve this problem? I believe this fear could be tempered by putting decisions into perspective. It might help to remember that many of the choices you make, such as what to have for lunch, will not __32__ much in the future and that, even more important choices, like accepting a new job, can __33__ be changed. It could also help to __34__ these situations with clear guidelines and ideas of what you want from the __35__ of options, which can narrow the possible choices, and also make you more confident about your ability to make the right decision.', NULL, '["A) approximately","B) case","C) chance","D) confused","E) crucial","F) deposited","G) enter","H) invest","I) matter","J) presented","K) range","L) regular","M) seize","N) selection","O) ultimately"]', 246, 'IMPORT', 'cet4-2025-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-1-r1'
);
SET @pg_cet4_2025_12_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-r2', 'MATCHING', 'CET4', 'The battle over bike lanes needs a mindset shift', 'A) Five years ago, the city of Queens, New York, announced that it would be putting bike lanes onto a stretch of Skillman Ave — and removing 116 parking spots. Cyclists loved the plan, but local business owners got very angry. Taking out those parking spots, as they argued at protests and in letters to the city council, would ruin stores and restaurants along Skillman. "Parking here is already a nightmare," one shouted at a protest rally. B) But the bike lanes were a done deal, and soon they were in place. Early this year, Jesse Coburn — an investigative writer with Streetsblog New York — wondered whether those predictions of economic collapse came true. So he asked the city''s Department of Finance to give him a few years'' worth of sales figures for that stretch of Skillman Ave. How had the businesses on that street fared? C) Quite well, it turns out. In the year after the bike lanes arrived, businesses on Skillman saw sales rise by 12 percent, compared to 3 percent for Queens in general. What''s more, that section of road saw new businesses open, while Queens overall had a net loss. D) The thing is, the actual merchants along Skillman? They didn''t believe it. When Coburn spoke to them and described what he''d found, only a few store owners admitted the lanes had helped. Many still insisted the lanes were killing their part of the city. And emotions ran hot: Someone scattered tacks(大头钉) on the bike lane. E) This little story turns out to be a fascinating glimpse at the challenges cities face as they try to update their urban infrastructure — to clean up the air, reduce greenhouse emissions, and speed up travel by making towns more bike-friendly. There''s a rising amount of data showing that installing bike lanes and making streets more pedestrian-friendly boosts the economic fortunes of a place. Removing cars and parking spots works. But the folks who run local businesses simply aren''t convinced, even when their own street performs. Given that sort of mess, can political fights over bike lanes ever end? F) In 2013, researchers at New York City''s Department of Transportation studied seven stretches of road that had installed bike lanes or created pedestrian-friendly areas. The city analyzed the data for businesses along those routes and found that by the third year, sales grew faster on five of the streets than in the district overall, on average — up to five times faster, in fact. G) Beyond New York, a survey of research from 23 cities found that bike lanes and pedestrian-friendly design didn''t hurt local retail and food stores. ("Fears of disastrous consequences for local businesses are unfounded," the researchers concluded.) More recent work has shown roughly the same. H) The truth is that in fairly dense areas, bikes are more efficient at moving people around. You might lose one car driver''s business — but you gain shoppers who now can arrive more easily on bikes. "Cyclists and pedestrians are consumers too," notes Professor Susan Handy. Plus, streets redesigned for bikes and pedestrians tend to become more pleasant places to hang around, so "in a lot of cases, that''s created much nicer environments that are really good for those businesses." I) Mom-and-pop shops are usually pretty quick at recognizing situations that will help their bottom lines. So why the blind spot here? Perhaps it''s that attention focuses on horror stories — and some merchants do get hit when bike lanes come in. J) I spoke to Cindy Hughes, a hairdresser(理发师) in Cambridge, Massachusetts. She said business fell by at least 40 percent when the city removed nearby parking to put in a bike lane. The majority of her customers drive, with many coming from nearby towns. Only a very few have shifted to cycling, and even those almost certainly won''t cycle in Boston''s snowy winters. So while Hughes supports bike lanes — "cyclists deserve to be safe" — she sees the parking loss as an existential risk. "Look, 90 percent of my customers drive," she told me. "For our business, the bike lanes are way worse than Covid was." K) For others, the pushback is cultural, says Henry Grabar, a writer for the Slate Magazine. Small business owners are frequently drivers who commute from other parts of the city by car, Grabar points out. They''re also often longtime locals. "They tend to be people with deep roots in the city, who have hung around since before the neighborhood became what it is today," he adds. Driving around town in a car is so normal to them that cycling seems weird and unusual — despite its boost from Covid, when bike sales exploded by 75 percent. L) Psychology beats all! Who knew, right? The fierce divide between store owners and bike-lane advocates seems similar to our larger culture wars over climate change. If we''ve learned anything about culture wars, it''s that data isn''t much good at changing minds. M) When Janette Sadik-Khan was the head of New York City''s Transportation Department back in the early 2000s, she oversaw a rollout(推出) of bike lanes — and got angry blowback from residents and business owners who claimed there weren''t enough cyclists to justify installing lanes. Now, she notes ironically, the lanes are so full of activity that opponents have turned to claiming the problem is the opposite: There are too many cyclists getting in the way of cars. N) Maybe bike lanes will always be charged with emotion, until enough of the public is finally concerned about climate change — and it seems reckless(鲁莽的) to not have them. O) Crises, after all, have a way of opening people''s eyes to possibilities. During Covid, restaurants and cafés lost so much business that cities nationwide began allowing them to build curbside seating areas where people could sit, safely, in the open air. It greatly reduced parking — but because, well, shop owners didn''t see any way around it. Customers loved the outdoor seating so much that cities are making it permanent: A New York City study of several streets closed during Covid found storeowners making more than before, and diners enjoying the outdoor lifestyle. If data won''t change minds, customers might.', NULL, NULL, 1038, 'IMPORT', 'cet4-2025-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-1-r2'
);
SET @pg_cet4_2025_12_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-r3', 'CAREFUL_READING', 'CET4', NULL, 'All living organisms on Earth are exposed to a 24-hour day-night cycle. This cycle is the reason why people rest at night and are active during the day. Consequently, all human body functions also follow this daily rhythm, and the timing of behaviors like exercise or food intake can significantly influence your health. For example, eating at night can lead to weight gain over time because food intake at night leads to increased fat storage. Many drug targets in the body follow a 24-hour cycle, too. This means that the specific proteins a drug is designed to modify can react differently to the medicine over the course of a 24-hour time period. Because how the body responds to a drug can differ depending on the time it is taken, it logically follows that taking medicines at specific times could help increase their effectiveness and reduce unwanted side effects. When doctors prescribe medicine for people, they rarely consider the best time to take it. There are two main reasons for that oversight. First, many physicians are not aware that some drugs work better during a specific time of the day. And second, most drugs have not been studied for possible different effects during a 24- hour cycle. Therefore, patients are directed to take most drugs during the morning or evening primarily to ensure compliance. Over 50 years ago, researchers found that the cholesterol drug simvastatin is more effective at lowering cholesterol levels when taken at night rather than during the day. This is because the liver enzyme(酶) these drugs target is more active at night. Taking medicine at the wrong time can even cause harm. My colleagues and I wondered whether midazolam, the most common sedative(镇静剂) used in surgical procedures worldwide, might interfere with the internal clock that protects the heart at night. Currently, there are no guidelines regarding when midazolam should be administered. More research is needed to determine the best times to administer treatments for different diseases. I believe taking drug timing into account could help make treatments more effective and help more people worldwide.', NULL, NULL, 346, 'IMPORT', 'cet4-2025-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-1-r3'
);
SET @pg_cet4_2025_12_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-r4', 'CAREFUL_READING', 'CET4', NULL, 'Katharine Abraham, an economics professor, was chatting with her hairdresser( 理发师) about retirement plans. The economist said she plans to continue working because she wants to. The hairdresser agreed but for a different reason: She needs the money. Both scenarios(情况) are contributing to a big increase in the number of people in the U.S. working into their 70s. Over the past 20 years, the share of Americans working in their 70s has risen from less than 10% to nearly 15%. In addition to people being healthier and living much longer, economists say that a combination of financial considerations such as years of slow rise in real wages and a shift away from traditional pensions in the private sector are some of the reasons people delay retirement. The decline of manufacturing and the increase in the number of people working in less labor-intensive occupations also has contributed to the trend, says Abraham, who researches work and retirement decisions of older Americans. "Which matters more depends on what your history up until that point has been in the type of work you''re doing," Abraham says. The overall trend is hitting Americans of all different levels of educational attainment, although the percentages vary by category. The share of Americans with bachelor''s degrees who were working into their 70s reached nearly 20% in 2018. For those with a high school degree or less, the proportion of those working in their 70s had risen to around 10%, while those with some college education were in the middle at around 15%. Martin Neil Baily, an economist who is leading a research project on retirement security, notes that quitting a career can lead to feelings of isolation and loneliness, particularly for men. He suggests that many college- educated workers are choosing to stay in the labor force more for social benefits than for financial reasons. They''re also more likely to be in professional occupations where they tend to enjoy their work more. Workers in more physical jobs, meanwhile, may be more likely to look forward to retiring, Baily says, suggesting those who stay on are more likely doing so for financial reasons.', NULL, NULL, 355, 'IMPORT', 'cet4-2025-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-1-r4'
);
SET @pg_cet4_2025_12_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-1-r4' LIMIT 1);

-- 翻译 cet4-2025-12-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-translation'
);
SET @q_cet4_2025_12_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_01, '近年来，中国政府高度重视民营经济(private economy)的发展，出台了一系列政策支持民营企业。截至2025 年 3 月底，全国民营企业数量超过 5700 万家，占企业总量的 92.3%。民营企业不仅数量稳步增长，质量和结构也在不断提升。民营企业的研发投入不断增加，在新一代信息技术、人工智能等领域发展迅速。民营企业核心竞争力的增强为中国经济的高质量发展提供了有力支撑。', NULL, 'In recent years, the Chinese government has attached great importance to the development of the private economy and introduced a series of policies to support private enterprises. By the end of March 2025, the number of private enterprises nationwide exceeded 57 million, accounting for 92.3% of the total number of enterprises. Private enterprises are not only growing steadily in number but also improving in quality and structure. They are also increasing their R&D investment and developing rapidly in fields such as next-generation information technology and artificial intelligence. As a result, the enhancement of private enterprises'' core competitiveness provides strong support for the high-quality development of China''s economy.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_01
);

-- 听力 Q1 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q01', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q01'
);
SET @q_cet4_2025_12_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_02, NULL, '{"A":"A) Outside the office of a charity foundation.","B":"B) Inside the car of David King''s neighbour.","C":"C) Under the engine cover of a man''s car.","D":"D) At the gate of a grade school in Kent."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_02
);

-- 听力 Q2 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q02', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q02'
);
SET @q_cet4_2025_12_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_03, NULL, '{"A":"A) It got reunited with its owner.","B":"B) It was injured during the rescue.","C":"C) It became a pet of Mr King''s grandson.","D":"D) It was placed in the care of a UK charity."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_03
);

-- 听力 Q3 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q03', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q03'
);
SET @q_cet4_2025_12_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_04, NULL, '{"A":"A) The 100th anniversary celebration of Methodist University.","B":"B) The first important political event in the next five years.","C":"C) The opening of the Special Olympics Spring Games.","D":"D) The reunion of this year''s Olympic gold medalists."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_04
);

-- 听力 Q4 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q04', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q04'
);
SET @q_cet4_2025_12_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_05, NULL, '{"A":"A) Volunteers visit the Games'' website to sign up.","B":"B) Athletes with special needs triumph in the Games.","C":"C) Organizers devote their time and energy to the Games.","D":"D) Children play in a fun tent and enjoy themselves fully."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_05
);

-- 听力 Q5 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q05', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q05'
);
SET @q_cet4_2025_12_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_06, NULL, '{"A":"A) Destroy its imitation chocolate rabbits.","B":"B) Change the wrapping of its commodities.","C":"C) Compensate for the Swiss manufacturer''s loss.","D":"D) Defend itself in the country''s commercial court."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_06
);

-- 听力 Q6 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q06', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q06'
);
SET @q_cet4_2025_12_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_07, NULL, '{"A":"A) It could be rewrapped and sold by the budget supermarket.","B":"B) It could be reshaped into animals other than rabbits.","C":"C) It could be resold cheaper to avoid waste.","D":"D) It could be reused in other products."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_07
);

-- 听力 Q7 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q07', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q07'
);
SET @q_cet4_2025_12_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_08, NULL, '{"A":"A) To be fair to the German supermarkets.","B":"B) To protect chocolate retailers'' interests.","C":"C) To boost the growth of the chocolate industry.","D":"D) To prevent consumers'' possible confusion."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q08', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q08'
);
SET @q_cet4_2025_12_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_09, NULL, '{"A":"A) Return the handbook to him.","B":"B) Make a vegetable dish.","C":"C) Pass a book to him.","D":"D) Meet his sister''s boyfriend."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_09
);

-- 听力 Q9 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q09', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q09'
);
SET @q_cet4_2025_12_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_10, NULL, '{"A":"A) It doesn''t seem to be a balanced diet.","B":"B) It would reduce one''s protein intake.","C":"C) It would do harm to one''s muscles.","D":"D) It doesn''t sound practical for her."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_10
);

-- 听力 Q10 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q10', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q10'
);
SET @q_cet4_2025_12_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_11, NULL, '{"A":"A) To improve his health.","B":"B) To protect animal rights.","C":"C) To follow a trendy lifestyle.","D":"D) To stick to his religious belief."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_11
);

-- 听力 Q11 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q11', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q11'
);
SET @q_cet4_2025_12_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_12, NULL, '{"A":"A) The torture and distress dolphins suffer in parks.","B":"B) The necessity of having zoos and eating meat.","C":"C) The gloomy environments animals are kept in.","D":"D) The urgency of joining an animal rights group."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_12
);

-- 听力 Q12 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q12', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q12'
);
SET @q_cet4_2025_12_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_13, NULL, '{"A":"A) The part about getting over jetlag.","B":"B) The part about air travel in the past.","C":"C) The part about not eating on board the plane.","D":"D) The part about avoiding sleeping on the plane."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_13
);

-- 听力 Q13 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q13', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q13'
);
SET @q_cet4_2025_12_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_14, NULL, '{"A":"A) Take a nap to adjust to a new time zone.","B":"B) Have meals as usual to stay away from hunger.","C":"C) Concentrate on reading articles recommended by experts.","D":"D) Try following the advice given by the expert on the show."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_14
);

-- 听力 Q14 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q14', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q14'
);
SET @q_cet4_2025_12_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_15, NULL, '{"A":"A) She does not have any problem flying.","B":"B) She can spend a lot of time vacationing.","C":"C) She does not have to worry about jetlag.","D":"D) She has been well treated when traveling."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_15
);

-- 听力 Q15 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q15', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q15'
);
SET @q_cet4_2025_12_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_16, NULL, '{"A":"A) It has caused heavy losses to many airlines.","B":"B) It impacts female travelers more seriously.","C":"C) It has long been ignored by many experts.","D":"D) It affects twenty-five percent of people."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_16
);

-- 听力 Q16 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q16', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q16'
);
SET @q_cet4_2025_12_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_17, NULL, '{"A":"A) Learning from skilled designers.","B":"B) Obtaining real-world experience.","C":"C) Joining a 6-month training camp.","D":"D) Anticipating actual challenges."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_17
);

-- 听力 Q17 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q17', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q17'
);
SET @q_cet4_2025_12_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_18, NULL, '{"A":"A) Core skills.","B":"B) Higher education.","C":"C) Adaptability.","D":"D) Capability."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_18
);

-- 听力 Q18 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q18', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q18'
);
SET @q_cet4_2025_12_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_19, NULL, '{"A":"A) Start anywhere.","B":"B) Face challenges.","C":"C) Pursue roles in teams.","D":"D) Follow their own path."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_19
);

-- 听力 Q19 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q19', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q19'
);
SET @q_cet4_2025_12_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_20, NULL, '{"A":"A) To respond actively to students'' requests.","B":"B) To engage students more in their learning.","C":"C) To enable teachers to interact more with their students.","D":"D) To allow students more freedom in their academic work."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_20
);

-- 听力 Q20 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q20', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q20'
);
SET @q_cet4_2025_12_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_21, NULL, '{"A":"A) Using new furniture to create a comfortable environment.","B":"B) Shifting from traditional teaching to task-based learning.","C":"C) Adopting a variety of different seating options.","D":"D) Rearranging most traditional chairs and desks."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_21
);

-- 听力 Q21 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q21', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q21'
);
SET @q_cet4_2025_12_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_22, NULL, '{"A":"A) A win for all people involved.","B":"B) A strengthened effect of its discipline.","C":"C) A harmonious relationship among its students.","D":"D) A change to teachers'' opinion of their students."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_22
);

-- 听力 Q22 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q22', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q22'
);
SET @q_cet4_2025_12_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_23, NULL, '{"A":"A) They weren''t informed of the school''s updated rules.","B":"B) They arrived late for their first day of school.","C":"C) They answered their headteacher''s email in an impolite way.","D":"D) They didn''t wear the shoes required by the school''s new policy."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_23
);

-- 听力 Q23 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q23', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q23'
);
SET @q_cet4_2025_12_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_24, NULL, '{"A":"A) Riots.","B":"B) Anger.","C":"C) Disputes.","D":"D) Panic."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_24
);

-- 听力 Q24 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q24', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q24'
);
SET @q_cet4_2025_12_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_25, NULL, '{"A":"A) They strengthened the school''s discipline and order.","B":"B) They improved student behavior and performance.","C":"C) They enhanced the positive image of the school.","D":"D) They rendered the school unique in the district."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_25
);

-- 听力 Q25 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q25', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q25'
);
SET @q_cet4_2025_12_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_26, NULL, '{"A":"A) Turn to her parents for help.","B":"B) Tighten her monthly budget.","C":"C) Borrow £65 from her friend.","D":"D) Postpone paying her other bills."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q26'
);
SET @q_cet4_2025_12_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_27, NULL, '{"A":"A) approximately","B":"B) case","C":"C) chance","D":"D) confused","E":"E) crucial","F":"F) deposited","G":"G) enter","H":"H) invest","I":"I) matter","J":"J) presented","K":"K) range","L":"L) regular","M":"M) seize","N":"N) selection","O":"O) ultimately"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q27'
);
SET @q_cet4_2025_12_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_28, NULL, '{"A":"A) approximately","B":"B) case","C":"C) chance","D":"D) confused","E":"E) crucial","F":"F) deposited","G":"G) enter","H":"H) invest","I":"I) matter","J":"J) presented","K":"K) range","L":"L) regular","M":"M) seize","N":"N) selection","O":"O) ultimately"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q28'
);
SET @q_cet4_2025_12_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_29, NULL, '{"A":"A) approximately","B":"B) case","C":"C) chance","D":"D) confused","E":"E) crucial","F":"F) deposited","G":"G) enter","H":"H) invest","I":"I) matter","J":"J) presented","K":"K) range","L":"L) regular","M":"M) seize","N":"N) selection","O":"O) ultimately"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q29'
);
SET @q_cet4_2025_12_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_30, NULL, '{"A":"A) approximately","B":"B) case","C":"C) chance","D":"D) confused","E":"E) crucial","F":"F) deposited","G":"G) enter","H":"H) invest","I":"I) matter","J":"J) presented","K":"K) range","L":"L) regular","M":"M) seize","N":"N) selection","O":"O) ultimately"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q30'
);
SET @q_cet4_2025_12_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_31, NULL, '{"A":"A) approximately","B":"B) case","C":"C) chance","D":"D) confused","E":"E) crucial","F":"F) deposited","G":"G) enter","H":"H) invest","I":"I) matter","J":"J) presented","K":"K) range","L":"L) regular","M":"M) seize","N":"N) selection","O":"O) ultimately"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q31'
);
SET @q_cet4_2025_12_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_32, NULL, '{"A":"A) approximately","B":"B) case","C":"C) chance","D":"D) confused","E":"E) crucial","F":"F) deposited","G":"G) enter","H":"H) invest","I":"I) matter","J":"J) presented","K":"K) range","L":"L) regular","M":"M) seize","N":"N) selection","O":"O) ultimately"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q32'
);
SET @q_cet4_2025_12_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_33, NULL, '{"A":"A) approximately","B":"B) case","C":"C) chance","D":"D) confused","E":"E) crucial","F":"F) deposited","G":"G) enter","H":"H) invest","I":"I) matter","J":"J) presented","K":"K) range","L":"L) regular","M":"M) seize","N":"N) selection","O":"O) ultimately"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q33'
);
SET @q_cet4_2025_12_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_34, NULL, '{"A":"A) approximately","B":"B) case","C":"C) chance","D":"D) confused","E":"E) crucial","F":"F) deposited","G":"G) enter","H":"H) invest","I":"I) matter","J":"J) presented","K":"K) range","L":"L) regular","M":"M) seize","N":"N) selection","O":"O) ultimately"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q34'
);
SET @q_cet4_2025_12_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_35, NULL, '{"A":"A) approximately","B":"B) case","C":"C) chance","D":"D) confused","E":"E) crucial","F":"F) deposited","G":"G) enter","H":"H) invest","I":"I) matter","J":"J) presented","K":"K) range","L":"L) regular","M":"M) seize","N":"N) selection","O":"O) ultimately"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q35'
);
SET @q_cet4_2025_12_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_36, NULL, '{"A":"A) approximately","B":"B) case","C":"C) chance","D":"D) confused","E":"E) crucial","F":"F) deposited","G":"G) enter","H":"H) invest","I":"I) matter","J":"J) presented","K":"K) range","L":"L) regular","M":"M) seize","N":"N) selection","O":"O) ultimately"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q36'
);
SET @q_cet4_2025_12_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_37, 'An increasing amount of data indicates that installing bike lanes raises local business revenues.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q37'
);
SET @q_cet4_2025_12_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_38, 'According to a magazine writer, some small business owners'' resistance to bike lanes arises from cultural factors.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q38'
);
SET @q_cet4_2025_12_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_39, 'A stretch of Skillman Ave witnessed not only a big increase in sales but also the opening of new businesses.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q39'
);
SET @q_cet4_2025_12_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_40, 'When people have no way out in crises, they are more likely to embrace changes.', NULL, 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q40'
);
SET @q_cet4_2025_12_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_41, 'According to one survey, city design with bike lanes and pedestrian space did not negatively impact local businesses.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q41'
);
SET @q_cet4_2025_12_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_42, 'Despite increased business activity on Skillman Ave, many store owners insisted the bike lanes were destroying their area.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q42'
);
SET @q_cet4_2025_12_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_43, 'In a war of culture, data does not help much in changing people''s minds.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q43'
);
SET @q_cet4_2025_12_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_44, 'A businesswoman said her business dropped sharply when parking space gave way to a bike lane, because most of her customers came by car.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q44'
);
SET @q_cet4_2025_12_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_45, 'Local business owners on Skillman Ave argued that their businesses would be ruined when parking spots were replaced by bike lanes.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q45'
);
SET @q_cet4_2025_12_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_46, 'People may find it more pleasant to wander around streets redesigned for cycling and walking.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q46'
);
SET @q_cet4_2025_12_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_47, 'What do we learn from the passage about the timing of our behaviors?', '{"A":"A) It has a considerable impact on our health.","B":"B) It confines us to a 24-hour day-night cycle.","C":"C) It requires us to follow a particular rhythm.","D":"D) It holds the key to all human body functions."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q47'
);
SET @q_cet4_2025_12_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_48, 'What does the author say about the proteins in our body?', '{"A":"A) They can modify the effects of medicines in different ways.","B":"B) They can reduce unwanted side effects of certain medicines.","C":"C) Their reaction to medicines changes during the day-night cycle.","D":"D) Their design determines how differently they react to medicines."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q48'
);
SET @q_cet4_2025_12_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_49, 'What do doctors do when prescribing medicine for people?', '{"A":"A) They give little thought to the time of taking it for maximum effect.","B":"B) They rarely consider which medicine works better for which patient.","C":"C) They tell patients its possible side effects during a period of 24 hours.","D":"D) They tell patients to comply with the directions of drug manufacturers."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q49'
);
SET @q_cet4_2025_12_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_50, 'Why do doctors advise patients to take most drugs in the morning or in the evening?', '{"A":"A) To discourage them from making complaints.","B":"B) To ensure they take the drugs as instructed.","C":"C) To comply with new research findings strictly.","D":"D) To guarantee the maximum effect of the drugs."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q50'
);
SET @q_cet4_2025_12_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_51, 'What does the author suggest near the end of the passage?', '{"A":"A) Considering drug-taking timing when prescribing drugs for patients.","B":"B) Making treatments less complex by taking drug timing into account.","C":"C) Conducting more studies to find out the best timing for treating different diseases.","D":"D) Finding out the most effective drugs for treating diseases through further research."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q51'
);
SET @q_cet4_2025_12_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_52, 'What do we learn from the passage about the economics professor and her hairdresser?', '{"A":"A) They differ in their reasons for continuing to work.","B":"B) They are both committed to working into their 70s.","C":"C) They are happy about their current financial situation.","D":"D) They hold different views about postponing retirement."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q52'
);
SET @q_cet4_2025_12_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_53, 'What is one of the reasons for people to delay retirement?', '{"A":"A) More and more people have switched to less intellectually challenging jobs.","B":"B) The number of jobs suitable for older people has increased in the private sector.","C":"C) The rate of wage increase in terms of purchasing power has slowed down for years.","D":"D) More and more people in the workplace find it hard to rely on traditional pensions."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q53'
);
SET @q_cet4_2025_12_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_54, 'What is the general trend in people delaying retirement?', '{"A":"A) The higher their earnings, the more likely they are tempted to delay retirement.","B":"B) Those who have more job satisfaction tend to retire later than those who have less.","C":"C) More men than women are likely to stay in the labor force until their late seventies.","D":"D) The higher their educational level, the more likely they are to delay retirement."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q54'
);
SET @q_cet4_2025_12_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_55, 'What is the chief reason for college-educated workers delaying retirement according to an economist?', '{"A":"A) Enjoying financial security.","B":"B) Staying connected socially.","C":"C) Contributing more professionally.","D":"D) Increasing social security payments."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-1-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q55'
);
SET @q_cet4_2025_12_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_1_56, 'What does the passage say about people doing manual work?', '{"A":"A) They are eager to enjoy life after retiring.","B":"B) They are likely to have financial troubles.","C":"C) They generally don''t enjoy doing it.","D":"D) They tend to anticipate retirement."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_1_56
);

-- ==================== cet4-2025-12-2 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-r1', 'BANKED_CLOZE', 'CET4', NULL, 'Some music inspires you to move your feet, some inspires you to get out there and change the world. In any case, it''s __26__ to say that music moves people in special ways. If you''re especially into a piece of music, your brain does something called Autonomous Sensory Meridian Response (ASMR), which __27__ to you like a sting in your brain. It turns out that ASMR is pretty special. According to a __28__ published study in The Journal of Prevention of Alzheimer''s Disease, the part of your brain responsible for ASMR doesn''t get lost to Alzheimer''s. Alzheimer''s __29__ to put people into layers of confusion, and the study confirms that music can sometimes __30__ lift people out of the Alzheimer''s haze and bring them back to (at least a likeness of) normality … if only for a short while. ASMR is powerful stuff! This phenomenon has been __31__ several times but rarely studied properly. One of the most famous examples of this is the story of 92-year-old Henry Dryer, who comes out of dementia(痴呆) while listening to songs from his youth. Jeff Anderson, associate professor in Radiology at the University of Utah and __32__ author on the study, says "In our society, the diagnoses of dementia are __33__ resources to the maximum. No one says playing music will be a cure for Alzheimer''s disease, but it might make the symptoms more __34__ , decrease the cost of care and improve a patient''s __35__ of life."', NULL, '["A) actually","B) consequently","C) contributing","D) fair","E) feels","F) manageable","G) mends","H) observed","I) phase","J) plotting","K) quality","L) recently","M) taxing","N) tends","O) yielded"]', 245, 'IMPORT', 'cet4-2025-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-2-r1'
);
SET @pg_cet4_2025_12_2_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-2-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-r2', 'MATCHING', 'CET4', 'Can playing video games help you get a better job?', 'A) The gaming industry is larger than films and music combined, yet few of us are likely to list our achievements in playing computer games as work experience in our résumé. But why not? Businesses are waking up to the skills gamers can bring to the workplace. B) One start-up is convinced that the skills learned by playing games — hard-won through years of training and battle — can be applied to real-life work situations. And Game Academy reckons its belief is backed up by hard data. Do you enjoy unusual puzzle games like Portal, or tower defence games like Defense Grid? The team has found that IT workers play those more than average. But if you prefer Civilization, Total War, or X-Com, where strategy and resource management are key, then you might have more in common with managers. C) Game Academy''s idea is simple: analyse gamers'' habits from their online gaming profile, and offer courses in valuable skills that reflect their aptitudes — skills they can practise and refine in-game. And there is already a growing acceptance that gaming skills are transferable. D) Even the military is hiring gamers. "The ability to absorb information, react swiftly and coordinate actions whilst remaining calm under pressure are often attributes of people that are good at gaming," according to a Royal Air Force spokesperson. Those skills are part of what the Royal Air Force is looking for "in a variety of roles". "Skills acquired through gaming can be very relevant to certain areas." E) "There are plenty of soft skills that gamers can utilise in a professional setting, such as teamwork, problem solving and strategic planning," says Ryan Gardner, a regional director with Hays recruitment. But does that really mean your top 100 ranking in Overwatch should go down in your résumé? "It''s about how you either make it relevant to the job you are applying for, or how it makes you more interesting as a potential employee," Mr Gardner says. F) Two years ago, a Glasgow University study made headlines for suggesting gaming could make students more successful. But "the research hasn''t really changed minds, at least not yet," says one of the authors of the study, Dr Matthew Barr. He''s now writing a book on the topic. "For now, I think the negative reputation around games means that telling someone you''re a determined gamer is more likely to harm your chances of getting a job. But if someone can explain how they''ve led a team in an online game, for example, they may be able to persuade an employer that this is useful," says Dr Barr. G) Playing games casually is unlikely to help your career prospects. But part of Game Academy''s suggestion is to transform casual gamers into "conscious" ones, applying critical thinking to developing their skills. "We see gameplay as a resource of talent," says co-founder David Barrie. "Why can''t we put in our résumé our gaming victories and achievements?" he asks. "If they say they want leadership — why can''t I point to my years of leading World of Warcraft raids?" H) There are already plenty of gamers out there who know that their hobby has made them who they are. Earlier this year, Matthew Ricci told gaming site Kotaku: "If you''re playing EVE Online you basically already have an MBA." Often made fun of in gaming circles as a "spreadsheet simulator(电子表格模拟)", the economy of the fictional EVE universe is driven by real market principles. If you want to build a new spaceship, the raw material has to be mined by another player. Manufacturing costs come into effect, and commodities fluctuate in price based on demand and the distance to haul the commodity. I) Mr Ricci, who had always dreamed of being the boss of his own company, ran an in-game corporation comprising hundreds of players. Eventually, he realised he could transfer his skills to real-life business — instead of doing it for free. He restructured Zentech, once a taxation vehicle for his father''s business, and it is now in its fourth year helping international brands enter the Canadian market. EVE teaches skills like creativity, leadership, organisation, and conflict resolution, he maintains. He credits his success to his family, his strong desire to run his own business — and "a damn good company in Iceland that made a damn good game". J) Digital entrepreneur and business consultant Mia Bennett says: "In more traditional settings, gaming is still imagined to be the pursuit of teenage boys — a waste of time." But there are some links to skills like "decision-making, the ability to anticipate and future planning," she says. "It also helps with meta-skills — learning how to learn, experimentation, and creative thinking." K) Twelve years into his career, Mark Long, a radiotherapy physicist with the NHS in Surrey, doesn''t get as much gaming time as he used to. "I would love to say that my gaming skills allow me to destroy cancer using linear accelerators like photon(光子) blasters, but that''s not quite the reality." Instead, he credits old- school games like Palace of Magic with exposing him to computers. Every new gaming upgrade improved his knowledge of how they worked. Gaming also encouraged a competitive spirit — and that, he believes, translates. "When creating treatment plans, the aim is to optimise the radiation dose to the tumour and restrict it as much as possible to healthy surrounding tissues and organs," he says. It''s about "repeating the process, but each time doing something slightly different to improve the result". Not unlike achieving a high score or a perfect run. "Most videogames are essentially puzzles to solve," he says. "And problem-solving is a big part of my job." L) "Over at Game Academy, Mr Barrie is aware they still have a mountain to climb. The employer community will need the science," he says, but confesses he only became a true believer when he started asking players about their biggest in-game achievements. "The scale and scope of their answers were amazing," he says. "But ask them the same about their work, and they don''t know." "The engagement and powerful skills that people get playing a game — why can''t work be like that?" he asks.', NULL, NULL, 1035, 'IMPORT', 'cet4-2025-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-2-r2'
);
SET @pg_cet4_2025_12_2_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-2-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-r3', 'CAREFUL_READING', 'CET4', NULL, 'Junk food is now a staple of many Americans'' diets. Advertising campaigns from the snack food companies, often featuring sports stars, send the message that we can neutralize any negative effects of consuming their products simply by getting more physical exercise. But recent studies show a lack of exercise is not to blame for rising obesity rates. Bad diets are. Interventions( 干预) to help reduce junk food consumption are especially important for children and teenagers. Prevention is better than cure because obesity is so difficult to treat. Unfortunately, while health education has shown some success among young children, teens have been harder to reach. Now a large-scale study has tried an innovative approach to change teenagers'' attitudes towards healthy eating, and the results are promising. The researchers argued that previous interventions have probably been unsuccessful because of a major flaw: they focused on a future, healthier you and assumed that this would be enough motivation for teenagers. In contrast, the new intervention cleverly exploits teenagers'' instinct for rebelliousness and autonomy, and the value they place on social justice. To do this, researchers had students read an article on the food industry. It revealed a secret about the manipulative and deceptive strategies used to make junk food more addictive and characterize the products as healthy. The article also explained how advertising campaigns specifically target very young and poor people, causing harm for these vulnerable groups. Afterwards, the participants read a fictional survey of teens who wanted to "fight back against the companies by buying and eating less processed food" After the intervention, participants associated healthy eating with autonomy and social justice. The teenagers also rated healthy eating as being more appealing. Importantly, there were also some promising effects of the new intervention on actual behavior. A day later the students were offered a choice of snacks and drinks in a seemingly unrelated context. The teens chose healthy snacks and drinks (such as fruit or water) more often over unhealthy options (like biscuits and soda). Apparently associating a healthy diet with teenagers'' own values seems to be a promising avenue to prevent obesity.', NULL, NULL, 351, 'IMPORT', 'cet4-2025-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-2-r3'
);
SET @pg_cet4_2025_12_2_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-2-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-r4', 'CAREFUL_READING', 'CET4', NULL, 'Adults dream during REM (rapid eye movement) sleep and infants have loads of REM. So, it might be fair to assume that babies have tons of dreams. But scientists believe REM serves a completely different purpose for newborns and infants than dreaming. When babies are in REM, it allows their brain to develop pathways, connections, and eventually, learn languages. Since your baby doesn''t dream at this stage of brain development, it''s safe to assume babies do not have nightmares, either. Nightmares stem from exposure to trauma(创伤), an overactive imagination, and the normal stresses of everyday life. Are you wondering, what do babies dream about? Good question, but the answer is nothing! So, when do babies start dreaming? The general consensus is that they start dreaming around the age of two. Psychologist David Foulkes studies children (from very small kids to teens) to bring the secrets of their dreams to the light of day. In his lab, he lets kids fall asleep and then wakes them 3 times a night and asks them to describe what they recall. Foulkes'' findings are unsurprising. Basically, little kids have little dreams. But exactly what kids see while dreaming depends on their age. As children develop and grow, their dreams do too. Dreams of very small kids are usually just snapshots(快照), looking much more like a slideshow than a movie, when compared to the dreams of adults. They heavily feature animals and other familiar sights, like images of people eating. According to Foulkes, "Children''s dream life…seems to be similar to their waking imagination and narration." Kids ages 5 – 9 begin seeing moving images and characters in action. Dreams now include multiple events strung together, one after the other. They also start developing greater ability to remember dreams. Still, that''s not always the case: When roused during REM sleep, 25% of the kids in Foulkes'' studies had no recollection of dreaming, a trend that continues through age 9. So, if your baby seems to be in a stressful state while sleeping or is upset upon waking, there may be other factors at play.', NULL, NULL, 348, 'IMPORT', 'cet4-2025-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-2-r4'
);
SET @pg_cet4_2025_12_2_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-2-r4' LIMIT 1);

-- 翻译 cet4-2025-12-2
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-translation'
);
SET @q_cet4_2025_12_2_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_01, '近年来，"城市漫步(city walk)"在中国的年轻人中悄然兴起，已成为一种旅游新潮流。与传统旅游不同，城市漫步不追求在短时间内游览尽可能多的景点。而是随意行走或按照主题路线漫步在城市的大街小巷。漫步者品尝地道小吃，欣赏特色建筑，了解当地生活方式。他们还用相机或手机记录城市的风景和人物。这种旅游方式能让城市漫步者更深入了解城市的历史与文化。', NULL, 'In recent years, city walk has quietly emerged among young people in China and has become a new travel trend. Unlike traditional travel, city walk does not seek to visit as many attractions as possible in a short time. Instead, city walkers wander randomly or stroll along themed routes through the streets and alleys of the city. They taste authentic snacks, admire distinctive buildings, and learn about local ways of life. They also record the city''s scenery and people with cameras or mobile phones. This travel style enables city walkers to gain a deeper understanding of the city''s history and culture.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_01
);

-- 听力 Q1 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q01', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q01'
);
SET @q_cet4_2025_12_2_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_02, NULL, '{"A":"A) It has gone up sharply.","B":"B) It has been fluctuating.","C":"C) It has risen because of bird flu.","D":"D) It has been consumers'' concern."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_02
);

-- 听力 Q2 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q02', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q02'
);
SET @q_cet4_2025_12_2_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_03, NULL, '{"A":"A) They don''t want to abandon their eggs.","B":"B) They don''t know they will be heavily fined.","C":"C) They don''t know they are forbidden to bring eggs.","D":"D) They don''t declare their eggs during the inspection."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_03
);

-- 听力 Q3 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q03', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q03'
);
SET @q_cet4_2025_12_2_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_04, NULL, '{"A":"A) It is no longer critical of younger customers.","B":"B) It has banned kids under 10 from dining there.","C":"C) It is no longer as noisy and crowded as before.","D":"D) It has implemented a decision to expand business."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_04
);

-- 听力 Q4 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q04', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q04'
);
SET @q_cet4_2025_12_2_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_05, NULL, '{"A":"A) It is fully aware of frequent customers'' feelings.","B":"B) It caters to the tastes of different customers.","C":"C) It is entitled to adopt any rules it wants.","D":"D) It should announce its decisions online."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_05
);

-- 听力 Q5 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q05', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q05'
);
SET @q_cet4_2025_12_2_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_06, NULL, '{"A":"A) A missing pet.","B":"B) A grown-up snake.","C":"C) A huge animal skin.","D":"D) A snake specialist."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_06
);

-- 听力 Q6 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q06', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q06'
);
SET @q_cet4_2025_12_2_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_07, NULL, '{"A":"A) In a government office.","B":"B) In a deserted house.","C":"C) At a local zoo.","D":"D) At a construction site."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_07
);

-- 听力 Q7 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q07', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q07'
);
SET @q_cet4_2025_12_2_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_08, NULL, '{"A":"A) Figuring out where it came from.","B":"B) Curing it of any possible diseases.","C":"C) Protecting its babies against harm.","D":"D) Determining how to catch it safely."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q08', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q08'
);
SET @q_cet4_2025_12_2_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_09, NULL, '{"A":"A) The man doesn''t agree Hannah is poor.","B":"B) The man doesn''t believe what she says.","C":"C) The man doesn''t think she can be a millionaire.","D":"D) The man doesn''t consider her to be trustworthy."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_09
);

-- 听力 Q9 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q09', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q09'
);
SET @q_cet4_2025_12_2_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_10, NULL, '{"A":"A) She no longer has any money left.","B":"B) She has been betrayed by her family.","C":"C) She can no longer hold on to her job.","D":"D) She has been robbed of 5 million Euros."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_10
);

-- 听力 Q10 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q10', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q10'
);
SET @q_cet4_2025_12_2_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_11, NULL, '{"A":"A) Fortune.","B":"B) Family.","C":"C) Harmony.","D":"D) Happiness."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_11
);

-- 听力 Q11 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q11', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q11'
);
SET @q_cet4_2025_12_2_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_12, NULL, '{"A":"A) Divorce her.","B":"B) Leave home.","C":"C) Buy her a more expensive model.","D":"D) Let the best thing happen to them."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_12
);

-- 听力 Q12 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q12', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q12'
);
SET @q_cet4_2025_12_2_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_13, NULL, '{"A":"A) He is not outstanding in Science and Math.","B":"B) He does not have a strong academic record.","C":"C) He is not yet mature enough to live on his own.","D":"D) He does not like Westwood Elementary School."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_13
);

-- 听力 Q13 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q13', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q13'
);
SET @q_cet4_2025_12_2_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_14, NULL, '{"A":"A) It is too far away.","B":"B) It is newly opened.","C":"C) It lacks outdoor sports facilities.","D":"D) It has too few first-class teachers."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_14
);

-- 听力 Q14 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q14', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q14'
);
SET @q_cet4_2025_12_2_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_15, NULL, '{"A":"A) It has a beautiful campus.","B":"B) It is within walking distance.","C":"C) It has a wonderful arts program.","D":"D) It is helpful to Jake''s breathing problems."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_15
);

-- 听力 Q15 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q15', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q15'
);
SET @q_cet4_2025_12_2_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_16, NULL, '{"A":"A) Asking Jake which school he himself prefers to enroll in.","B":"B) Thinking twice about what is best for Jake''s education next year.","C":"C) Consulting her mother about which school Jake is to attend.","D":"D) Sending Jake to the school near the home of the man''s mother."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_16
);

-- 听力 Q16 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q16', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q16'
);
SET @q_cet4_2025_12_2_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_17, NULL, '{"A":"A) It is time consuming.","B":"B) It is unfit for crucial issues.","C":"C) It relies too much on solid data.","D":"D) It dulls a leader''s sense of urgency."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_17
);

-- 听力 Q17 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q17', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q17'
);
SET @q_cet4_2025_12_2_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_18, NULL, '{"A":"A) Depend on digital technology.","B":"B) Make assumptions and guesses.","C":"C) Ignore others'' thoughts and ideas.","D":"D) Lay emphasis on thinking flexibly."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_18
);

-- 听力 Q18 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q18', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q18'
);
SET @q_cet4_2025_12_2_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_19, NULL, '{"A":"A) Maximizing the advantage of available resources.","B":"B) Minimizing the possibility of a wrong decision.","C":"C) Discovering new potential markets.","D":"D) Perfecting promotional strategies."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_19
);

-- 听力 Q19 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q19', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q19'
);
SET @q_cet4_2025_12_2_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_20, NULL, '{"A":"A) She is one of the world''s best-known pianists.","B":"B) She celebrated her 110th birthday this April.","C":"C) She moved to the U.S. at a young age.","D":"D) She is the world''s oldest individual."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_20
);

-- 听力 Q20 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q20', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q20'
);
SET @q_cet4_2025_12_2_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_21, NULL, '{"A":"A) Being always active on social media.","B":"B) Doing regular and vigorous exercise.","C":"C) Playing the piano from a young age.","D":"D) Following a specific diet every day."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_21
);

-- 听力 Q21 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q21', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q21'
);
SET @q_cet4_2025_12_2_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_22, NULL, '{"A":"A) Eating as little as one can possibly manage.","B":"B) Having the ability to forget things selectively.","C":"C) Figuring out the positive properties of each food item.","D":"D) Knowing how to remember major events in one''s life."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_22
);

-- 听力 Q22 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q22', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q22'
);
SET @q_cet4_2025_12_2_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_23, NULL, '{"A":"A) The ability to learn.","B":"B) The first day of school.","C":"C) How teachers perceive them.","D":"D) Where they sit in the classroom."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_23
);

-- 听力 Q23 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q23', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q23'
);
SET @q_cet4_2025_12_2_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_24, NULL, '{"A":"A) They often received close attention from the instructors.","B":"B) They obtained the highest grade average in their class.","C":"C) They actually wanted a clear vision of the blackboard.","D":"D) They scored higher than students sitting behind them."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_24
);

-- 听力 Q24 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q24', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q24'
);
SET @q_cet4_2025_12_2_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_25, NULL, '{"A":"A) A higher grade average among all students of a class.","B":"B) A better connection between instructors and students.","C":"C) A stronger support for a student-centered teaching approach.","D":"D) A more favorable atmosphere for effective classroom learning."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_25
);

-- 听力 Q25 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q25', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q25'
);
SET @q_cet4_2025_12_2_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_26, NULL, '{"A":"A) They may experience some unwanted stress.","B":"B) They may try hard to show their preparedness.","C":"C) They may receive extra attention from the instructor.","D":"D) They may feel helpless when called on by the instructor."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q26'
);
SET @q_cet4_2025_12_2_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_27, NULL, '{"A":"A) actually","B":"B) consequently","C":"C) contributing","D":"D) fair","E":"E) feels","F":"F) manageable","G":"G) mends","H":"H) observed","I":"I) phase","J":"J) plotting","K":"K) quality","L":"L) recently","M":"M) taxing","N":"N) tends","O":"O) yielded"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q27'
);
SET @q_cet4_2025_12_2_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_28, NULL, '{"A":"A) actually","B":"B) consequently","C":"C) contributing","D":"D) fair","E":"E) feels","F":"F) manageable","G":"G) mends","H":"H) observed","I":"I) phase","J":"J) plotting","K":"K) quality","L":"L) recently","M":"M) taxing","N":"N) tends","O":"O) yielded"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q28'
);
SET @q_cet4_2025_12_2_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_29, NULL, '{"A":"A) actually","B":"B) consequently","C":"C) contributing","D":"D) fair","E":"E) feels","F":"F) manageable","G":"G) mends","H":"H) observed","I":"I) phase","J":"J) plotting","K":"K) quality","L":"L) recently","M":"M) taxing","N":"N) tends","O":"O) yielded"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q29'
);
SET @q_cet4_2025_12_2_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_30, NULL, '{"A":"A) actually","B":"B) consequently","C":"C) contributing","D":"D) fair","E":"E) feels","F":"F) manageable","G":"G) mends","H":"H) observed","I":"I) phase","J":"J) plotting","K":"K) quality","L":"L) recently","M":"M) taxing","N":"N) tends","O":"O) yielded"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q30'
);
SET @q_cet4_2025_12_2_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_31, NULL, '{"A":"A) actually","B":"B) consequently","C":"C) contributing","D":"D) fair","E":"E) feels","F":"F) manageable","G":"G) mends","H":"H) observed","I":"I) phase","J":"J) plotting","K":"K) quality","L":"L) recently","M":"M) taxing","N":"N) tends","O":"O) yielded"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q31'
);
SET @q_cet4_2025_12_2_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_32, NULL, '{"A":"A) actually","B":"B) consequently","C":"C) contributing","D":"D) fair","E":"E) feels","F":"F) manageable","G":"G) mends","H":"H) observed","I":"I) phase","J":"J) plotting","K":"K) quality","L":"L) recently","M":"M) taxing","N":"N) tends","O":"O) yielded"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q32'
);
SET @q_cet4_2025_12_2_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_33, NULL, '{"A":"A) actually","B":"B) consequently","C":"C) contributing","D":"D) fair","E":"E) feels","F":"F) manageable","G":"G) mends","H":"H) observed","I":"I) phase","J":"J) plotting","K":"K) quality","L":"L) recently","M":"M) taxing","N":"N) tends","O":"O) yielded"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q33'
);
SET @q_cet4_2025_12_2_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_34, NULL, '{"A":"A) actually","B":"B) consequently","C":"C) contributing","D":"D) fair","E":"E) feels","F":"F) manageable","G":"G) mends","H":"H) observed","I":"I) phase","J":"J) plotting","K":"K) quality","L":"L) recently","M":"M) taxing","N":"N) tends","O":"O) yielded"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q34'
);
SET @q_cet4_2025_12_2_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_35, NULL, '{"A":"A) actually","B":"B) consequently","C":"C) contributing","D":"D) fair","E":"E) feels","F":"F) manageable","G":"G) mends","H":"H) observed","I":"I) phase","J":"J) plotting","K":"K) quality","L":"L) recently","M":"M) taxing","N":"N) tends","O":"O) yielded"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q35'
);
SET @q_cet4_2025_12_2_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_36, NULL, '{"A":"A) actually","B":"B) consequently","C":"C) contributing","D":"D) fair","E":"E) feels","F":"F) manageable","G":"G) mends","H":"H) observed","I":"I) phase","J":"J) plotting","K":"K) quality","L":"L) recently","M":"M) taxing","N":"N) tends","O":"O) yielded"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q36'
);
SET @q_cet4_2025_12_2_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_37, 'Certain gaming skills meet the requirements of the armed forces in Britain.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q37'
);
SET @q_cet4_2025_12_2_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_38, 'One veteran player has applied his gaming skills to his real-world business and owes his success partly to a game company.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q38'
);
SET @q_cet4_2025_12_2_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_39, 'According to a researcher, bad reputation about games will probably limit a gamer''s chances of landing a job.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q39'
);
SET @q_cet4_2025_12_2_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_40, 'Businesses are beginning to realise gaming skills are applicable to their employees'' work.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q40'
);
SET @q_cet4_2025_12_2_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_41, 'A physicist admits gaming has contributed to his computer knowledge and skills of solving problems.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q41'
);
SET @q_cet4_2025_12_2_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_42, 'Game Academy proposes to help gamers develop their skills using critical thinking.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q42'
);
SET @q_cet4_2025_12_2_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_43, 'One who enjoys playing games that require management skills to win might possess more qualities of a manager.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q43'
);
SET @q_cet4_2025_12_2_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_44, 'In more conventional views, gaming is a time-wasting activity pursued by young boys.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q44'
);
SET @q_cet4_2025_12_2_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_45, 'It is suggested that gaming skills be included in a résumé if they enhance a job applicant''s appeal.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q45'
);
SET @q_cet4_2025_12_2_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_46, 'Many gamers know their passion for playing games has shaped their identity.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q46'
);
SET @q_cet4_2025_12_2_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_47, 'What do we learn about advertising campaigns from the snack food companies?', '{"A":"A) They convey the idea that their products are ok if consumers exercise more.","B":"B) They send the message that bad diets are responsible for Americans'' obesity.","C":"C) They usually feature sports stars to emphasize the benefits of their snack foods.","D":"D) They claim that lack of exercise is to blame for the increasing obesity rates."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q47'
);
SET @q_cet4_2025_12_2_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_48, 'What does the passage say about health education?', '{"A":"A) It has shed light on teens'' instinct for rebellion and autonomy.","B":"B) It has placed much more emphasis on cure than on prevention.","C":"C) It has contributed little to the campaigns against obesity.","D":"D) It has largely failed to turn teens away from junk food."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q48'
);
SET @q_cet4_2025_12_2_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_49, 'What is a major flaw in previous interventions to help reduce junk food consumption?', '{"A":"A) They motivated teens to stay away from junk food only temporarily.","B":"B) They focused on the benefits young people would reap in the future.","C":"C) They were based on the assumption that motivation was the only key.","D":"D) They were incapable of appealing to teens'' instinct for rebelliousness."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q49'
);
SET @q_cet4_2025_12_2_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_50, 'In what way is the new intervention innovative?', '{"A":"A) It emphasizes people''s sense of social responsibility.","B":"B) It cleverly exploits teenagers'' personal weaknesses.","C":"C) It takes advantage of teenagers'' natural inclination.","D":"D) It promises immediate rather than future benefits."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q50'
);
SET @q_cet4_2025_12_2_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_51, 'What conclusion can be drawn from the new research?', '{"A":"A) A totally different approach could be adopted to combat advertising campaigns for snack food.","B":"B) An effective intervention has to be found to persuade teenagers to switch to a healthier lifestyle.","C":"C) Obesity can be hopefully prevented by building links between teenagers'' values and healthy eating.","D":"D) An innovative way to beat obesity is to expose food companies'' manipulative and deceptive practices."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q51'
);
SET @q_cet4_2025_12_2_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_52, 'What do scientists think of REM?', '{"A":"A) It is a sign of dreaming in adults and infants alike.","B":"B) It is essential to human beings'' language learning.","C":"C) It determines the formation of connections in the brain.","D":"D) It performs a different function in babies than in adults."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q52'
);
SET @q_cet4_2025_12_2_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_53, 'What can we infer about nightmares from the passage?', '{"A":"A) They occur often in people with an active imagination.","B":"B) They occur in people suffering from emotional stress.","C":"C) They vary in different stages of brain development.","D":"D) They appear in the sleep of both adults and infants."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q53'
);
SET @q_cet4_2025_12_2_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_54, 'What is the aim of psychologist David Foulkes'' study?', '{"A":"A) To reveal the secrets of children''s dreams.","B":"B) To see if children start dreaming at age two.","C":"C) To solve the mystery of dreaming and brain growth.","D":"D) To confirm the general consensus on when kids dream."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q54'
);
SET @q_cet4_2025_12_2_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_55, 'What are Foulkes'' findings about kids'' dreams?', '{"A":"A) They feature strange animals.","B":"B) They are unsurprising to adults.","C":"C) They grow and evolve with age.","D":"D) They reflect kids'' waking life."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-2-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q55'
);
SET @q_cet4_2025_12_2_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-2-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_2_56, 'What can we assume about babies who appear upset upon waking?', '{"A":"A) They have been roused against their will.","B":"B) They have been disturbed by a nightmare.","C":"C) They have trouble recollecting the images of their dreams.","D":"D) They have been affected by something other than dreaming."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_2_56
);

-- ==================== cet4-2025-12-3 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-r1', 'BANKED_CLOZE', 'CET4', NULL, 'Earth Day is an annual celebration that honors the achievements of the environmental movement and raises awareness of the need to protect Earth''s natural resources for future generations. Earth Day is celebrated on April 22 in the United States and on either April 22 or the day the spring equinox(春分) occurs throughout the __26__ of the world. Environmental activism during the 1960s __27__ Wisconsin Senator Gaylord Nelson to create a __28__ celebration uniting the environmental movement. With the help of Denis Hayes, a graduate student at Harvard University, Nelson organized the first Earth Day on April 22, 1970, educating participants in the __29__ of environmental protection. Attended by 20 million people across the United States, the event __30__ support for legislation such as the Clean Air Act and the Endangered Species Act. In 1990, Hayes organized a global Earth Day, with more than 200 million participants in 140 countries. Earth Day now brings __31__ citizens and activists from around the world to raise awareness and take action regarding such environmental __32__ as global warming and renewable energy. Today, the Earth Day Network, which rallies more than 20,000 __33__ and organizations in 190 countries, supports the Earth Day mission year-round. This mission is founded on the proposition that all people, regardless of race, gender, income, or __34__ , have a moral right to a healthy, sustainable environment. The Earth Day Network __35__ this mission through education, public policy, and activism campaigns.', NULL, '["A) concerns","B) expansion","C) forth","D) geography","E) importance","F) imposed","G) inspired","H) national","I) partners","J) potential","K) pursues","L) rescues","M) rest","N) strengthened","O) together"]', 240, 'IMPORT', 'cet4-2025-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-3-r1'
);
SET @pg_cet4_2025_12_3_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-3-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-r2', 'MATCHING', 'CET4', 'Looking for a job after 45', 'A) Ageism and long-term unemployment are most damaging for those in the second half of their careers. Changing careers is hard. Getting back into work after you''ve been laid off is even harder. Those over 45 make up the bulk of the long-term unemployed, in America and elsewhere. Hiring managers admit they are reluctant to hire those over 40 or 45, arguing they probably won''t be a good "fit," their experience won''t be relevant to the workplace, and they''ll be unable or unwilling to learn new skills. B) But the one thing that can really make a difference? More education and training. These are the results from a new study by Generation, a nonprofit founded by former McKinsey consultants. They''ve just published a global survey on midcareer employment, based on surveys of over 5,000 workers and managers in seven countries. C) "Older midcareer workers … make up the bulk of the long-term unemployed in many countries," Generation''s analysts write in their report. Those over 45 comprise over 40% of the long-term unemployed, for example. And if you''re out of work past the age of 45, there''s nearly a two in three chance you''ll be out of work for over a year, they find. "Midcareer individuals are finding it harder to get jobs," they write. "People age 45+ face persistent and rising pressure in the global job market. They are unemployed for much longer than the average, and their age is indeed one of the greatest barriers to their finding a job." D) A substantial part of this, they report, is "widespread ageism" on the part of hiring managers. Although such managers admit that post-45 hires turn out on average to be just as good as or better than younger workers, they still don''t want to hire them. "Hiring managers have a strong perception bias against 45+ job candidates — they believe that members of this age group have poor skills and low adaptability," Generation''s analysts report. E) The survey results are remarkable. Hiring managers are three times as likely to rate job applicants age 35 – 44 as a better "fit" than those over 45. They rate the post-45 job seekers lower on average on all three measures — even experience — than those ages 18 to 34. This is true even though nearly nine managers in 10 also said their post-45 workers were as good as or better than younger employees in the same jobs. F) Their biggest fears about hiring those over 45? Managers said they worry that older hires will be reluctant to try new technologies, and will be unable to learn new skills. Besides, the majority of hiring managers are under 45 — and seem reluctant to hire people older than themselves. G) But here''s the good news. Older workers who''ve actively engaged in more education and training relevant to their jobs turn this pretty much on its head. Three-quarters of hiring managers said they''d be more likely to hire an over-45 who had relevant education, training or credentials( 文凭). Among those over 45 who''d successfully switched careers, 74% said training helped them get their new job. H) "Midcareer switchers overwhelmingly say that training enabled them to shift to a new career path," the analysts write. And when they asked over-45 candidates about their attitudes, they found that "those who are excited by training are unemployed for less time, receive more job offers, and are more satisfied by the job offers they receive." I) Hiring managers said training was three times more likely to get them to hire applicants over age 45 than, say, government subsidies(补贴). What training are we talking about? Obviously it depends on the job. And, yes, managers are most likely to be impressed by industry qualifications you get in school. These things cost money, and time. But these aren''t the only things helpful. Those who had successfully changed careers after 45 told Generation that education and training had been a big help — and that included in-person, on-the-job training, "informal learning," and online courses — with or without certification. J) If they think we''re too old to learn new skills after we''re 45, just learning some new skills may have an effect on its own. There''s a downside to this. The people least interested in retraining are more likely to come from historically disadvantaged communities, more likely to have low incomes, and are more likely to have the least schooling after getting their high-school diploma or earlier. On average, post-45 job switchers with higher incomes participate in 2.5 training programs each. Those with lower incomes: 0.9 programs on average. K) Many years ago, I wrote about a study which found that employers are much more likely to hire a college graduate who has some work experience in the industry than a college graduate who took the "right" degree. A bank is more likely to hire a literature graduate who spent their summers working in their local bank than a finance or economics graduate who spent their summers surfing or traveling around Italy. They''ve learned through long experience. The person who worked in the bank is more likely ready, willing and able to be part of the team and do the job from day 1. L) We can rail against "ageism" all we like. It gets us nowhere. And it''s easy to forget that employers, like everyone else, are under time pressure and are just trying to solve problems. Any and all "training," including inexpensive and informal training, is going to help resolve their worries about hiring someone over 45. And it has never been easier or cheaper to gain instruction in new skills, thanks to the internet. Online schools like Udemy and Lynda.com offer sweet deals at sign-up. And courses on YouTube are free. M) Bottom line? Yes, it really can be difficult getting a new job after age 45, let alone changing careers. One of the best things we can do to help ourselves is to go online and learn new, relevant skills. Sadly, the people who most need the help are least likely to take it — which raises a challenge for society as a whole. Not only do we not want to see lives go to waste, but we all benefit if more people are working and fewer are unemployed.', NULL, NULL, 1051, 'IMPORT', 'cet4-2025-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-3-r2'
);
SET @pg_cet4_2025_12_3_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-3-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-r3', 'CAREFUL_READING', 'CET4', NULL, 'New York''s Eleven Madison Park has become the first vegan(素食主义的) restaurant to be awarded three Michelin stars. The fine dining establishment received its first three-star Michelin rating in 2011 when the menu was famed for its fancy animal-based dishes. However, last year, the restaurant''s co-owner and famous chef, Daniel Humm, made the bold decision to remove meat from the menu, citing our unsustainable food system. While cow milk is still served for tea and coffee, the menu is almost 100 percent vegan. At the time, Humm acknowledged the move was risky, admitting that "it wasn''t clear if guests would come", but called the gamble "a risk worth taking." "In view of the climate crisis, I didn''t want to open the same restaurant," Humm told the Financial Times in an interview. "If we can show the possibilities of eating plant-based food in this setting, it can open a lot of doors" for others to follow. Now, this impressive new accomplishment validates Eleven Madison Park''s decision to take meat off the menu and embrace plant-based foods, with Michelin''s 2022 New York guide branding it ''a bold vision of luxury dining''. "We took the jump to transform Eleven Madison Park into a plant-based fine dining restaurant knowing in our hearts this is what we believed in," stated Humm on Instagram. "Last night, we were honored to be awarded three Michelin stars for the 11th year in a row. I am so grateful to the team members who contributed through its nearly 25-year history. We are also grateful to our guests and partners who believed in our vision and encouraged us to push harder." Three Michelin stars is the highest award, given to chefs who are at the peak of their profession. "Their cooking is elevated to an art form and some of their dishes are destined to become classics," reads Michelin''s website, in a clear nod to plant-based foods'' growing significance in the culinary(烹饪的) world. "I think luxury companies have a real role to play and a responsibility," says Humm. "The more creative we are, the more beautiful and delicious our future will be."', NULL, NULL, 351, 'IMPORT', 'cet4-2025-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-3-r3'
);
SET @pg_cet4_2025_12_3_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-3-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-r4', 'CAREFUL_READING', 'CET4', NULL, 'With genetic testing becoming increasingly popular, many people are left wondering exactly how accurate it is. Whether you are taking a DNA test to build your extended DNA family tree, or want precise information on inborn( 先天的) health conditions, it is important to understand how accurate genetic tests are, and what information we can rely upon. How accurate DNA tests are relies greatly upon the kind of test being taken, on the specific question you ask, and on how complex the genetics behind a trait(特征) is. For example, tests for traits that depend on a single gene provide much more reliable results, because you can see whether a disease-causing trait is present. Ancestry tests claim to reveal our genetic identities. But saying you are 30 percent East Asian or American hardly reflects your real ancestry. What about using DNA tests to discover distant family members? There are tools to compare one''s DNA with others'' to find distant relatives based on their genetic identification. These kinds of applications are generally accurate. It''s relatively easy to tell whether two DNA samples belong to close relatives. With distant relatives, results become hazier. Genetic health tests claim to be able to detect certain hereditary(遗传的) diseases, or other health conditions. While certain rare diseases can be easily identified, most potential health conditions cannot be identified by genetic testing alone. The large majority of our traits and diseases also depend upon non-genetic factors, such as lifestyle, the environment, and many others. Genetic tests for multi-factorial traits are often very tricky to interpret. Height, for example, depends on hundreds of genes, each contributing a little to the outcome, together with a bunch of environmental factors. A test can look at many genes at once, but it''s difficult to predict how they will play together. Then you should also account for non-genetic factors that are not written in the DNA. Tests that offer to find your perfect romantic match and those claiming to predict personality or talents based on your DNA are pure nonsense. At the moment, the scientific bases for these applications are non-existent or incredibly weak.', NULL, NULL, 350, 'IMPORT', 'cet4-2025-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-3-r4'
);
SET @pg_cet4_2025_12_3_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-12-3-r4' LIMIT 1);

-- 翻译 cet4-2025-12-3
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-translation'
);
SET @q_cet4_2025_12_3_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_01, '中国政府十分重视绿色经济的发展。通过加强森林资源保护、加大污染治理力度等一系列措施，许多地区的生态环境得到了显著改善。绿水青山 (lucid waters and lush mountains) 促进了当地的旅游、健康等产业的发展，创造了可观的经济效益。如今，生态环境与人类社会和谐共存的观念在中国已深入人心。绿色经济的推进不仅能为中国可持续发展做出贡献，也为全球环境保护提供了宝贵经验。', NULL, 'The Chinese government attaches great importance to the development of the green economy. Through a series of measures such as strengthening forest resource protection and intensifying pollution control, the ecological environment in many regions has improved remarkably. Lucid waters and lush mountains have promoted the development of local industries such as tourism and health care, generating considerable economic benefits. Today, the idea that ecology and human society can coexist in harmony has taken deep root in China. The promotion of the green economy not only contributes to China''s sustainable development but also provides valuable experience for global environmental protection.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_01
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q26'
);
SET @q_cet4_2025_12_3_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_02, NULL, '{"A":"A) concerns","B":"B) expansion","C":"C) forth","D":"D) geography","E":"E) importance","F":"F) imposed","G":"G) inspired","H":"H) national","I":"I) partners","J":"J) potential","K":"K) pursues","L":"L) rescues","M":"M) rest","N":"N) strengthened","O":"O) together"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_02
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q27'
);
SET @q_cet4_2025_12_3_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_03, NULL, '{"A":"A) concerns","B":"B) expansion","C":"C) forth","D":"D) geography","E":"E) importance","F":"F) imposed","G":"G) inspired","H":"H) national","I":"I) partners","J":"J) potential","K":"K) pursues","L":"L) rescues","M":"M) rest","N":"N) strengthened","O":"O) together"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_03
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q28'
);
SET @q_cet4_2025_12_3_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_04, NULL, '{"A":"A) concerns","B":"B) expansion","C":"C) forth","D":"D) geography","E":"E) importance","F":"F) imposed","G":"G) inspired","H":"H) national","I":"I) partners","J":"J) potential","K":"K) pursues","L":"L) rescues","M":"M) rest","N":"N) strengthened","O":"O) together"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_04
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q29'
);
SET @q_cet4_2025_12_3_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_05, NULL, '{"A":"A) concerns","B":"B) expansion","C":"C) forth","D":"D) geography","E":"E) importance","F":"F) imposed","G":"G) inspired","H":"H) national","I":"I) partners","J":"J) potential","K":"K) pursues","L":"L) rescues","M":"M) rest","N":"N) strengthened","O":"O) together"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_05
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q30'
);
SET @q_cet4_2025_12_3_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_06, NULL, '{"A":"A) concerns","B":"B) expansion","C":"C) forth","D":"D) geography","E":"E) importance","F":"F) imposed","G":"G) inspired","H":"H) national","I":"I) partners","J":"J) potential","K":"K) pursues","L":"L) rescues","M":"M) rest","N":"N) strengthened","O":"O) together"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_06
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q31'
);
SET @q_cet4_2025_12_3_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_07, NULL, '{"A":"A) concerns","B":"B) expansion","C":"C) forth","D":"D) geography","E":"E) importance","F":"F) imposed","G":"G) inspired","H":"H) national","I":"I) partners","J":"J) potential","K":"K) pursues","L":"L) rescues","M":"M) rest","N":"N) strengthened","O":"O) together"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_07
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q32'
);
SET @q_cet4_2025_12_3_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_08, NULL, '{"A":"A) concerns","B":"B) expansion","C":"C) forth","D":"D) geography","E":"E) importance","F":"F) imposed","G":"G) inspired","H":"H) national","I":"I) partners","J":"J) potential","K":"K) pursues","L":"L) rescues","M":"M) rest","N":"N) strengthened","O":"O) together"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_08
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q33'
);
SET @q_cet4_2025_12_3_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_09, NULL, '{"A":"A) concerns","B":"B) expansion","C":"C) forth","D":"D) geography","E":"E) importance","F":"F) imposed","G":"G) inspired","H":"H) national","I":"I) partners","J":"J) potential","K":"K) pursues","L":"L) rescues","M":"M) rest","N":"N) strengthened","O":"O) together"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_09
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q34'
);
SET @q_cet4_2025_12_3_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_10, NULL, '{"A":"A) concerns","B":"B) expansion","C":"C) forth","D":"D) geography","E":"E) importance","F":"F) imposed","G":"G) inspired","H":"H) national","I":"I) partners","J":"J) potential","K":"K) pursues","L":"L) rescues","M":"M) rest","N":"N) strengthened","O":"O) together"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_10
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q35'
);
SET @q_cet4_2025_12_3_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_11, NULL, '{"A":"A) concerns","B":"B) expansion","C":"C) forth","D":"D) geography","E":"E) importance","F":"F) imposed","G":"G) inspired","H":"H) national","I":"I) partners","J":"J) potential","K":"K) pursues","L":"L) rescues","M":"M) rest","N":"N) strengthened","O":"O) together"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_11
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q36'
);
SET @q_cet4_2025_12_3_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_12, 'Hiring managers believe unemployed workers over 45 lack good skills and are less adaptable.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_12
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q37'
);
SET @q_cet4_2025_12_3_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_13, 'Switching to a new career is difficult and getting reemployed after a layoff is even tougher.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_13
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q38'
);
SET @q_cet4_2025_12_3_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_14, 'People from poor neighborhoods tend to have the least interest in retraining.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_14
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q39'
);
SET @q_cet4_2025_12_3_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_15, 'Hiring managers who are not yet 45 years old seem unwilling to hire people their senior.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_15
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q40'
);
SET @q_cet4_2025_12_3_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_16, 'Some analysts find age 45+ jobless workers are most likely to be unemployed for more than a year.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_16
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q41'
);
SET @q_cet4_2025_12_3_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_17, 'People who had succeeded in career change after 45 told a nonprofit organization they owed a great deal to the education and training they had received.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_17
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q42'
);
SET @q_cet4_2025_12_3_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_18, 'Older workers who actively pursue more education and training have a good chance of being hired.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_18
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q43'
);
SET @q_cet4_2025_12_3_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_19, 'A new study finds that more education and training helps midcareer individuals find a new job.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_19
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q44'
);
SET @q_cet4_2025_12_3_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_20, 'Owing to the internet, it is now more convenient than ever to receive training in new skills.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_20
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q45'
);
SET @q_cet4_2025_12_3_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_21, 'People over 45 stimulated by training suffer shorter periods of unemployment, get more job offers and have greater satisfaction in them.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_21
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q46'
);
SET @q_cet4_2025_12_3_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_22, 'What do we learn about New York''s Eleven Madison Park?', '{"A":"A) It is the first vegan restaurant to receive the highest Michelin rating.","B":"B) It is the first restaurant in the city to remove meat from its menu.","C":"C) It was famed throughout the U.S. for its fancy regional dishes.","D":"D) It was established as a three-star Michelin restaurant in 2011."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_22
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q47'
);
SET @q_cet4_2025_12_3_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_23, 'Why did Daniel Humm decide to remove meat from the menu of his restaurant?', '{"A":"A) To encourage more customers to be vegan.","B":"B) To contribute to a sustainable food system.","C":"C) To show the appeal of a plant-based menu.","D":"D) To strive for the three-star Michelin rating."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_23
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q48'
);
SET @q_cet4_2025_12_3_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_24, 'What did Daniel Humm think of his move to a meat-free menu?', '{"A":"A) It was a worthwhile effort even though he was unsure of its success.","B":"B) It would set a model for many more restaurants to follow.","C":"C) It was a mad gamble few chefs in the fine dining world would risk taking.","D":"D) It would prove a right step to take in today''s catering business."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_24
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q49'
);
SET @q_cet4_2025_12_3_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_25, 'What does Michelin''s 2022 New York guide say about Eleven Madison Park''s decision?', '{"A":"A) It elevates the restaurant''s cooking to an art form.","B":"B) It proves the validity of ratings awarded by Michelin.","C":"C) It shows a daring foresight regarding future fine dining.","D":"D) It is an effort to transform the restaurant into a luxury one."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_25
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q50'
);
SET @q_cet4_2025_12_3_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_26, 'What does the awarding of three Michelin stars to Eleven Madison Park indicate?', '{"A":"A) An optimistic vision of vegan foods becoming mainstream.","B":"B) A greater responsibility for the culinary world to undertake.","C":"C) A strong incentive for more restaurants to offer healthier foods to their customers.","D":"D) An explicit recognition of the rising importance of restaurants serving vegan foods."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_26
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q51'
);
SET @q_cet4_2025_12_3_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_27, 'What does the passage say is of importance regarding genetic tests?', '{"A":"A) Knowing their accuracy.","B":"B) Evaluating their applicability.","C":"C) Utilizing the information they provide.","D":"D) Weighing the consequences they have."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_27
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q52'
);
SET @q_cet4_2025_12_3_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_28, 'What kind of genetic tests tend to be comparatively reliable?', '{"A":"A) Those complex enough to reveal the genetics behind a trait.","B":"B) Those looking for traits responsible for certain diseases.","C":"C) Those focusing on the specific questions being asked.","D":"D) Those looking for traits determined by a single gene."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_28
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q53'
);
SET @q_cet4_2025_12_3_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_29, 'What do we learn about genetic health tests from the passage?', '{"A":"A) They are unable to identify certain hereditary diseases by themselves.","B":"B) They are generally unable to separate genetic and non-genetic factors.","C":"C) They cannot independently identify the majority of potential diseases.","D":"D) They cannot tell apart the impact of lifestyle and that of the environment."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_29
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q54'
);
SET @q_cet4_2025_12_3_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_30, 'What makes genetic tests for multi-factorial traits tricky to interpret?', '{"A":"A) The challenge in determining the role of each individual gene.","B":"B) The difficulty of foretelling how the various genes will interact.","C":"C) The difficulty of telling genetic factors from environmental ones.","D":"D) The enormous work to identify the hundreds of genes involved."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_30
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-12-3-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q55'
);
SET @q_cet4_2025_12_3_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-12-3-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_12_3_31, 'What does the passage say about DNA tests to predict personality or talents?', '{"A":"A) They are solid scientific bases for application.","B":"B) They are helpful in finding a romantic match.","C":"C) They do not look promising at the moment.","D":"D) They do not make any sense at present."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_12_3_31
);

-- ==================== cet4-2026-06-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-r1', 'BANKED_CLOZE', 'CET4', NULL, 'One of the biggest controversies over the Industrial Revolution is how it affected the working class. The oldest debates were over whether the standards of living rose or fell. Those that believed they fell claimed that the capitalists __26__ every ounce of surplus they could from the working class. Those that believed the standards of living rose claimed that the environment was consumer-friendly, with more and more goods __27__ to the working class every year. Today''s historians agree that overall, the standards of living __28__ . They do not agree, however, on when this improvement __29__ . In an effort to solve this controversy, historians have attempted to define __30__ what "standard of living" means. They all seem to agree that it should mean happiness, but happiness is impossible to measure. Instead, historians __31__ use "real income" as the measure for the standards of living. Real income is money __32__ and then adjusted according to the cost of living. However, it does not take into account unemployment, pollution, health, life expectancy, or free time. After __33__ debate and analysis of the average income, historians have agreed to disagree on whether there was rapid or slow economic growth during the Industrial Revolution. Instead, they have decided to __34__ how the Industrial Revolution was affected by other events. They have determined that the Industrial Revolution had an overall positive __35__ , but it quite possibly was neutralized by negative events such as wars, high taxes, and rapid population growth.', NULL, '["A) available","B) deteriorating","C) earned","D) effect","E) enhance","F) exactly","G) exhausting","H) experience","I) increased","J) interpret","K) occurred","L) peculiar","M) probably","N) squeezed","O) typically"]', 247, 'IMPORT', 'cet4-2026-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-1-r1'
);
SET @pg_cet4_2026_06_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-r2', 'MATCHING', 'CET4', 'The Star Quality of New Zealand''s Great Barrier Island', 'A) I was glad I had such terrible jetlag. Wide awake at 3:30 am with our nine-year-old daughter on our lodge balcony, I stared for hours at the most incredible night sky I''ve ever seen before the dawn slowly started to rub out the stars on the horizon and the multiple shooting stars faded away. B) We were going to my wife''s big family reunion in Auckland, New Zealand, but when we found out that Great Barrier Island, just off the coast, had been recently awarded Dark Sky Sanctuary status—a typically remote area that has an "exceptional or distinguished quality of starry nights"—we thought it would be the perfect place to relax before our busy schedule. It''s the first island and only the fourth location in the world to achieve this status. C) After a 28-hour flight with two travel-sick children, our hearts sank when we saw the tiny twin engine 10- seater that was to take us the 90km across the Hauraki Gulf to Great Barrier Island. But we needn''t have worried. Whether it was the gravity force of the plane climbing or the noise of the engine, it put our three- year-old daughter instantly to sleep until we bumped down on the grass at Claris Airport. Our first empty sick bag against all the odds…Things were looking up. D) Great Barrier Island has no public facilities and the 950 people living there (though only about half permanently) rely on solar and wind energy, and bottled gas for cooking. There are no streetlights. There are no cash machines or banks. The police force comprises a husband and wife, and there''s one postman. It''s not just the lack of light but the lack of noise that''s so delightful on this unique and gorgeous scene. It was first discovered by East Polynesians about 700 years ago and the Maori name for the island is Aotea. Captain Cook gave the island its European name, because it acts as a barrier between the Pacific and the Hauraki Gulf. E) The climate here is subtropical(亚热带的) like Auckland''s. The island boasts a beautiful wilderness with dense forests, glorious, unspoilt sandy beaches and plenty of bays and a few mountainous areas where there are good walking tracks among the wetlands and valleys. You can birdwatch, dive, surf and boat. The best beaches are on the eastern side of the island where the surf is better, too. The sheltered western side is where you''ll find the best diving and boating. Lots of people come here for the fantastic fishing spots around the island. Like a lot of spots in New Zealand, there are whale-watching trips and you might just catch sight of sharks. F) It''s rare to find an island that really does feel undiscovered—but this is it. When one of my wife''s relations, who comes here regularly, found out that we''d been there, he whispered to us, only half-joking: "Shh—don''t tell anyone!" The locals are a relaxed and friendly bunch—a lot of them told us that it''s like what Waiheke Island (now in effect a suburb of Auckland) was in the 1970s when it was a commune of artists and people wanting to escape the city. G) Our guide for some of our stay was the inestimable Hilde Hoven, a Dark Sky ambassador who runs Good Heavens with Deborah Kilgallon and Orla Cumisky. They bring their Dobsonian telescope and beanbags (it''s hard work staring up wide-eyed in wonder without neck support) and, our elder daughter was glad to hear, hot chocolate to wherever you are on the island. "It''s odd but when the light readings were done," said Hilde, explaining how the island was awarded its special status, "they found there was more light pollution on the northern side coming from Fiji, which is about 3,000km away, than Auckland to the south. It''s pretty dark!" H) Beginning their astronomical PowerPoint demonstration using a green laser pointer, Hilde and Orla showed us the Messier 4 spherical cluster(星团) with white dwarf stars(白矮星), Saturn and its rings, the Southern Cross and the Milky Way, which stretched across the sky. Our daughter was especially taken with Hilde''s narrating of the Maori myth of Māui''s fish hook to explain the shape of Scorpius. In the fable, Māui hauled the North Island of New Zealand from the bottom of the ocean with his hook. I) We stayed at Mount St Paul''s Estate, a luxurious lodge run by the friendly Chris and Teara, both from Canada. Teara used to be a chef at the Langham in Auckland and so dinner, eaten around a huge circular table (made of one of the most ancient trees in the world), was every bit as mouth-watering as you''d expect. Eating pancakes on the balcony overlooking the unspoilt white sandy beach was a great way to start the day. J) Another highlight was an hour-long walk to Kaitoke hot pools in the centre of the island, through wetlands and a forest, where we whiled away a good hour sitting in the pools shaded from the heat by layers of delicate umbrella-like plants. K) We also loved visiting the potter(陶艺家) Sarah Harrison, who showed us round her studio at Shoal Bay harbour, and her many pots and jugs, plates and bowls and colourful mosaics(马赛克). In her work, she also uses a lot of materials found on the beach. Our elder daughter loved the gorgeous hidden pool at Medlands beach where the water is separated from the sea in a private rock pool. Other high points were the ancient pōhutukawa trees and the incredible views of Okiwi Basin and Whangapoua beach from the top of Windy Canyon, just a 10-minute hike through a narrow valley up some steep wooden steps on the eastern side of the island. L) Apparently the island council turned down famous musician Paul McCartney''s application to buy a property at Great Barrier Island because of the unwelcome attention he would have brought. You can see why he wanted to come here; equally, the island knows exactly what kind of star watching it prefers.', NULL, NULL, 1007, 'IMPORT', 'cet4-2026-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-1-r2'
);
SET @pg_cet4_2026_06_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-r3', 'CAREFUL_READING', 'CET4', NULL, 'Is organic food worth the higher price? It''s the classic grocery store dilemma. On the one hand, your family dinner table deserves only the best. On the other hand, your wallet can only stretch so far. Whether or not to buy organic is a personal decision, said Mike von Massow, professor of Food Agriculture. Science won''t give a clear-cut answer to the question of whether organic food is "better". There are often trade-offs(权衡) and answers become less definitive depending on the product under consideration. One thing is definitive: Organic and conventionally grown food are equally nutritious. From a nutrition point of view, there is no difference between organic and traditionally grown products. Organic products don''t necessarily have fewer pesticides(杀虫剂)—in fact, they may have more. There is also no big difference between organic and non-organic products from a food-safety perspective. Even organic growers use pesticides. Testing shows little if any pesticide remains on conventionally grown products. In fact, organic farmers often use larger quantities of pesticide because they can only use the natural variety of insect-killers. Chemical pesticides generally kill a much wider range of pests(害虫) than any single natural pesticide. The use of animal waste in organic agriculture can also be a factor in the spread of bacteria like E. coli and salmonella. Over the past 10 years, Canada has seen more food-safety recalls for organic products, proportionally, than for conventional products. On the whole, organic agriculture may have a smaller environmental footprint. That''s mostly because the risk of groundwater contamination from organic farming is lower. Organic farmers never use neonics, the controversial pesticides that have been linked to shrinking bee populations worldwide. Traditional agriculture has been making "dramatic improvements" to reduce its impact on the environment. It isn''t a black-and-white picture, though. Organic farming is much less efficient when it comes to land use, although yields vary considerably depending on the crop. On the other hand, advocates of organic farming argue yields and efficiency could be significantly improved if the food industry devoted as much research and money to organic farming as it does conventional agriculture.', NULL, NULL, 347, 'IMPORT', 'cet4-2026-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-1-r3'
);
SET @pg_cet4_2026_06_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-r4', 'CAREFUL_READING', 'CET4', NULL, 'It is still controversial whether we are fundamentally generous or selfish and whether these tendencies are shaped by our genes or environment. Some evidence points to humans being born cooperative. At later stages in life we routinely work together to reach goals and help out in times of need. Yet instances of selfish behavior are also plenty. One recent study tested people''s willingness to set aside selfish interests to reach a greater good. It found that being selfish was more advantageous than cooperating. The benefit may be short-lived, however. Another study showed that players who cooperated did better in the long run. It seems that human nature supports both pro-social and selfish traits(特征). Genetic studies have made some progress toward identifying their biological roots. By comparing identical twins, who share nearly 100 percent of their genes, and non-identical twins, who share about half, researchers have found overwhelming evidence for genetic effects on behaviors. In these twin studies, identical and non-identical twins are asked, for example, to split a sum of money with a peer. Such studies often also rely on careful psychological assessments and DNA analysis. Other work highlights specific genes as key players. My colleagues and I recently identified a gene linked to altruistic(利他的) behavior and found that a particular variant of it was associated with more selfish behavior in preschoolers. According to evolutionary scientists, cooperative behavior may have evolved first among relatives to promote the continuation of their genetic line. As communities diversified, mutual support could have broadened to include individuals not linked by blood. Another possibility is that humans cooperate to gain some advantage, such as boosting reputation. Finally, evolutionary processes take place at the group level. Groups of highly cooperative individuals have higher chances of survival because they can work together to reach goals that are unattainable to less cooperative groups. Yet almost no behavior is entirely genetic, even among identical twins. Culture, schooling and parenting are important determinants of cooperation. Thus, the degree to which we act cooperatively or selfishly is unique to each individual and depends on a variety of genetic and environmental influences.', NULL, NULL, 350, 'IMPORT', 'cet4-2026-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-1-r4'
);
SET @pg_cet4_2026_06_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-1-r4' LIMIT 1);

-- 翻译 cet4-2026-06-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-translation'
);
SET @q_cet4_2026_06_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_01, '中国有句老话："一日为师，终身为父"。在中国人的观念里，老师不仅传授知识，更教给学生做人的道理。在古代，学生初次见老师时要举行隆重的仪式，足见老师地位之高。为弘扬尊师的优良传统，中国从1985年开始将每年的9月10日定为教师节。在这一天，学生以各种方式表达对老师的敬意。尊师是中华民族的传统美德，在当今社会得到了发扬光大。', NULL, 'There is an old Chinese saying: "A teacher for a day is a father for a lifetime." In the eyes of Chinese people, teachers not only impart knowledge, but also teach students how to be a good person. In ancient times, students had to hold a grand ceremony when they met their teacher for the first time, which was enough to show the high status of teachers. To carry forward the fine tradition of respecting teachers, China has observed September 10 of each year as Teachers'' Day since 1985. On this day, students express their respect for teachers in various ways. Respecting teachers is a traditional virtue of the Chinese nation, and it has been carried forward in today''s society.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_01
);

-- 听力 Q1 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q01', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q01'
);
SET @q_cet4_2026_06_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_02, NULL, '{"A":"A) He had bought meals with his online food ordering account.","B":"B) His son had used his cell phone to pay for playing a game.","C":"C) His son had ordered food from several restaurants.","D":"D) He had dined out at a famous five-star restaurant."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_02
);

-- 听力 Q2 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q02', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q02'
);
SET @q_cet4_2026_06_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_03, NULL, '{"A":"A) Teach his son a lesson.","B":"B) Change his password.","C":"C) Ask his neighbors for help.","D":"D) Buy a bigger refrigerator."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_03
);

-- 听力 Q3 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q03', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q03'
);
SET @q_cet4_2026_06_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_04, NULL, '{"A":"A) They examined how visitors affected animal behaviour in zoos.","B":"B) They studied when the best time to feed animals in public was.","C":"C) They studied how animals adapted themselves to life in zoos.","D":"D) They examined what behaviours indicated animal boredom."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_04
);

-- 听力 Q4 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q04', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q04'
);
SET @q_cet4_2026_06_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_05, NULL, '{"A":"A) They socialise with zookeepers as well as with each other.","B":"B) They show good adaptability to living with humans.","C":"C) They have been kept as pets by humans.","D":"D) They have been born and raised in zoos."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_05
);

-- 听力 Q5 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q05', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q05'
);
SET @q_cet4_2026_06_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_06, NULL, '{"A":"A) Adjusting it.","B":"B) Suspending it.","C":"C) Reevaluating it.","D":"D) Expanding it."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_06
);

-- 听力 Q6 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q06', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q06'
);
SET @q_cet4_2026_06_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_07, NULL, '{"A":"A) They could buy an electric bike for $400 in April.","B":"B) They could buy their first electric bike at a discount.","C":"C) They could enjoy free after-sale service for their purchase.","D":"D) They could get $1,200 from government funds if they qualified."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_07
);

-- 听力 Q7 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q07', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q07'
);
SET @q_cet4_2026_06_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_08, NULL, '{"A":"A) Put 400 more electric bikes on its streets.","B":"B) Increase the program funding by 8 percent.","C":"C) Resume its electric bike incentive program.","D":"D) Invest millions of dollars into the local economy."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q08', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q08'
);
SET @q_cet4_2026_06_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_09, NULL, '{"A":"A) The coin collection.","B":"B) The primitive tools.","C":"C) The ancient ornaments.","D":"D) The 2,000-year-old clothes."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_09
);

-- 听力 Q9 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q09', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q09'
);
SET @q_cet4_2026_06_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_10, NULL, '{"A":"A) It is charming with narrow but beautiful streets.","B":"B) It attracts visitors from every corner of the world.","C":"C) It has flowers displayed around the Trevi Fountain.","D":"D) It is more attractive than the pictures in guidebooks."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_10
);

-- 听力 Q10 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q10', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q10'
);
SET @q_cet4_2026_06_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_11, NULL, '{"A":"A) It is covered with wild grass.","B":"B) It is very famous and pretty.","C":"C) It is located away from an old church.","D":"D) It is surrounded by Spanish-style houses."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_11
);

-- 听力 Q11 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q11', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q11'
);
SET @q_cet4_2026_06_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_12, NULL, '{"A":"A) Ask Kathy what her plan is.","B":"B) Tell Kathy Mike will join them.","C":"C) Ask Kathy if she''d like to see the square.","D":"D) Tell Kathy Mike would like to have a change."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_12
);

-- 听力 Q12 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q12', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q12'
);
SET @q_cet4_2026_06_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_13, NULL, '{"A":"A) How to fit into the bigger picture.","B":"B) How to get on with colleagues.","C":"C) How to create a solid first impression.","D":"D) How to succeed in a new job."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_13
);

-- 听力 Q13 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q13', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q13'
);
SET @q_cet4_2026_06_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_14, NULL, '{"A":"A) Get familiar with all the details of his job description.","B":"B) Learn about the relations within the organization.","C":"C) Recognize his own limitations and weaknesses.","D":"D) Understand his role from various perspectives."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_14
);

-- 听力 Q14 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q14', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q14'
);
SET @q_cet4_2026_06_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_15, NULL, '{"A":"A) Learning history.","B":"B) Meeting his boss.","C":"C) Creating reports for other departments to use.","D":"D) Leaving his coworkers in the present company."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_15
);

-- 听力 Q15 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q15', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q15'
);
SET @q_cet4_2026_06_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_16, NULL, '{"A":"A) Get to know the decision-makers.","B":"B) Acquire decision-making authority.","C":"C) Promote its products and services.","D":"D) Observe its overall management."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_16
);

-- 听力 Q16 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q16', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q16'
);
SET @q_cet4_2026_06_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_17, NULL, '{"A":"A) They do not tell marketers their feeling about a product.","B":"B) They do not compare competing brands and prices.","C":"C) They are not hesitant to contradict themselves.","D":"D) They are not sure what they really like to buy."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_17
);

-- 听力 Q17 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q17', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q17'
);
SET @q_cet4_2026_06_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_18, NULL, '{"A":"A) Consumers are often attracted by new products.","B":"B) Consumers tend to make decisions on the spot.","C":"C) Consumers find it hard to resist temptation.","D":"D) Consumers are actually driven by emotion."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_18
);

-- 听力 Q18 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q18', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q18'
);
SET @q_cet4_2026_06_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_19, NULL, '{"A":"A) Draw consumers'' attention to the luxury goods symbolizing quality life.","B":"B) Leave consumers the impression they are doing nothing manipulative.","C":"C) Highlight the emotional response it will trigger in the consumer.","D":"D) Remind consumers of the wide connections it can help to build."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_19
);

-- 听力 Q19 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q19', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q19'
);
SET @q_cet4_2026_06_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_20, NULL, '{"A":"A) They are taking in a lot of plastic.","B":"B) They are polluting the environment.","C":"C) They consume much processed food.","D":"D) They make everything with plastics."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_20
);

-- 听力 Q20 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q20', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q20'
);
SET @q_cet4_2026_06_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_21, NULL, '{"A":"A) Beer, salts and added sugars.","B":"B) Tap water and take-away food.","C":"C) Food packages and plastic bags.","D":"D) Air, bottled water and seafood."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_21
);

-- 听力 Q21 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q21', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q21'
);
SET @q_cet4_2026_06_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_22, NULL, '{"A":"A) How much plastic there is in the remaining 85% of Americans'' typical diet.","B":"B) What measures can be taken to prevent plastic objects from fragmenting.","C":"C) What harm microplastics may actually do to the average Americans.","D":"D) How many ways there are for microplastics to get into food and air."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_22
);

-- 听力 Q22 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q22', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q22'
);
SET @q_cet4_2026_06_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_23, NULL, '{"A":"A) They planned to adopt a pet animal.","B":"B) They kept not only a dog but a cat.","C":"C) They had at least one pet.","D":"D) They liked cats more than dogs."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_23
);

-- 听力 Q23 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q23', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q23'
);
SET @q_cet4_2026_06_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_24, NULL, '{"A":"A) A sense of pride.","B":"B) A sense of duty.","C":"C) A sense of purpose.","D":"D) A sense of security."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_24
);

-- 听力 Q24 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q24', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q24'
);
SET @q_cet4_2026_06_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_25, NULL, '{"A":"A) A few problems with keeping big animals.","B":"B) Some disadvantages related to pet ownership.","C":"C) A few cases of getting attacked by pet animals.","D":"D) Some conflicts with neighbors due to pet keeping."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_25
);

-- 听力 Q25 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q25', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q25'
);
SET @q_cet4_2026_06_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_26, NULL, '{"A":"A) Reduce as many symptoms of depression as medical help.","B":"B) Improve people''s health as much as physical activities.","C":"C) Lower older people''s stress as effectively as exercising.","D":"D) Bring many of the same benefits as human social support."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q26'
);
SET @q_cet4_2026_06_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_27, NULL, '{"A":"A) available","B":"B) deteriorating","C":"C) earned","D":"D) effect","E":"E) enhance","F":"F) exactly","G":"G) exhausting","H":"H) experience","I":"I) increased","J":"J) interpret","K":"K) occurred","L":"L) peculiar","M":"M) probably","N":"N) squeezed","O":"O) typically"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q27'
);
SET @q_cet4_2026_06_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_28, NULL, '{"A":"A) available","B":"B) deteriorating","C":"C) earned","D":"D) effect","E":"E) enhance","F":"F) exactly","G":"G) exhausting","H":"H) experience","I":"I) increased","J":"J) interpret","K":"K) occurred","L":"L) peculiar","M":"M) probably","N":"N) squeezed","O":"O) typically"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q28'
);
SET @q_cet4_2026_06_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_29, NULL, '{"A":"A) available","B":"B) deteriorating","C":"C) earned","D":"D) effect","E":"E) enhance","F":"F) exactly","G":"G) exhausting","H":"H) experience","I":"I) increased","J":"J) interpret","K":"K) occurred","L":"L) peculiar","M":"M) probably","N":"N) squeezed","O":"O) typically"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q29'
);
SET @q_cet4_2026_06_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_30, NULL, '{"A":"A) available","B":"B) deteriorating","C":"C) earned","D":"D) effect","E":"E) enhance","F":"F) exactly","G":"G) exhausting","H":"H) experience","I":"I) increased","J":"J) interpret","K":"K) occurred","L":"L) peculiar","M":"M) probably","N":"N) squeezed","O":"O) typically"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q30'
);
SET @q_cet4_2026_06_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_31, NULL, '{"A":"A) available","B":"B) deteriorating","C":"C) earned","D":"D) effect","E":"E) enhance","F":"F) exactly","G":"G) exhausting","H":"H) experience","I":"I) increased","J":"J) interpret","K":"K) occurred","L":"L) peculiar","M":"M) probably","N":"N) squeezed","O":"O) typically"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q31'
);
SET @q_cet4_2026_06_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_32, NULL, '{"A":"A) available","B":"B) deteriorating","C":"C) earned","D":"D) effect","E":"E) enhance","F":"F) exactly","G":"G) exhausting","H":"H) experience","I":"I) increased","J":"J) interpret","K":"K) occurred","L":"L) peculiar","M":"M) probably","N":"N) squeezed","O":"O) typically"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q32'
);
SET @q_cet4_2026_06_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_33, NULL, '{"A":"A) available","B":"B) deteriorating","C":"C) earned","D":"D) effect","E":"E) enhance","F":"F) exactly","G":"G) exhausting","H":"H) experience","I":"I) increased","J":"J) interpret","K":"K) occurred","L":"L) peculiar","M":"M) probably","N":"N) squeezed","O":"O) typically"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q33'
);
SET @q_cet4_2026_06_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_34, NULL, '{"A":"A) available","B":"B) deteriorating","C":"C) earned","D":"D) effect","E":"E) enhance","F":"F) exactly","G":"G) exhausting","H":"H) experience","I":"I) increased","J":"J) interpret","K":"K) occurred","L":"L) peculiar","M":"M) probably","N":"N) squeezed","O":"O) typically"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q34'
);
SET @q_cet4_2026_06_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_35, NULL, '{"A":"A) available","B":"B) deteriorating","C":"C) earned","D":"D) effect","E":"E) enhance","F":"F) exactly","G":"G) exhausting","H":"H) experience","I":"I) increased","J":"J) interpret","K":"K) occurred","L":"L) peculiar","M":"M) probably","N":"N) squeezed","O":"O) typically"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q35'
);
SET @q_cet4_2026_06_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_36, NULL, '{"A":"A) available","B":"B) deteriorating","C":"C) earned","D":"D) effect","E":"E) enhance","F":"F) exactly","G":"G) exhausting","H":"H) experience","I":"I) increased","J":"J) interpret","K":"K) occurred","L":"L) peculiar","M":"M) probably","N":"N) squeezed","O":"O) typically"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q36'
);
SET @q_cet4_2026_06_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_37, 'The author''s daughter slept throughout the last leg of their flight to Great Barrier Island.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q37'
);
SET @q_cet4_2026_06_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_38, 'The lodge where the author stayed provided very delicious food.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q38'
);
SET @q_cet4_2026_06_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_39, 'Many people are attracted to Great Barrier Island because of the incredible fishing sites around it.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q39'
);
SET @q_cet4_2026_06_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_40, 'A well-known artist failed to purchase a house on Great Barrier Island.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q40'
);
SET @q_cet4_2026_06_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_41, 'Unable to fall asleep after a long flight, the author was pleased to enjoy the most gorgeous view of the night sky in his life.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q41'
);
SET @q_cet4_2026_06_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_42, 'Great Barrier Island is compared to another island which attracted a lot of artists and people who wished to stay away from city life half a century ago.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q42'
);
SET @q_cet4_2026_06_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_43, 'One most memorable part of the author''s visit to Great Barrier Island was a one-hour walk to its centre''s hot springs.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q43'
);
SET @q_cet4_2026_06_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_44, 'Great Barrier Island has officially been recognized for its extraordinary starry nights.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q44'
);
SET @q_cet4_2026_06_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_45, 'Great Barrier Island is not connected to any public power supply lines.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q45'
);
SET @q_cet4_2026_06_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_46, 'It is strange that light pollution on Great Barrier Island mainly comes from a faraway island to the north.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q46'
);
SET @q_cet4_2026_06_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_47, 'What is the classic grocery store dilemma?', '{"A":"A) Whether or not one should eat organic food.","B":"B) Whether or not one can stretch their wallet far.","C":"C) Organic food costs more but it certainly tastes better.","D":"D) One wants the best food but their budget is limited."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q47'
);
SET @q_cet4_2026_06_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_48, 'What do we learn about organic food from science?', '{"A":"A) Whether it is any better remains uncertain.","B":"B) Whether it is healthier is under consideration.","C":"C) Whether it is more nutritious than conventional food is arguable.","D":"D) Whether it is going to replace conventional food is still unclear."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q48'
);
SET @q_cet4_2026_06_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_49, 'What does the passage say about organic and non-organic products as far as food safety is concerned?', '{"A":"A) Their difference is the conventions used to test them.","B":"B) They differ in how much pesticide remains on them.","C":"C) One relies on pesticides whereas the other does not.","D":"D) There is no substantial difference between the two."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q49'
);
SET @q_cet4_2026_06_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_50, 'What does the author say about organic farming?', '{"A":"A) It may be blamed for the shrinking bee populations in the world.","B":"B) It minimizes the use of controversial pesticides in its operations.","C":"C) It may impact the environment less than conventional farming.","D":"D) It contaminates groundwater as much as conventional farming."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q50'
);
SET @q_cet4_2026_06_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_51, 'What do advocates of organic farming argue about its yields and efficiency?', '{"A":"A) They would increase quickly with the emergence of new technologies.","B":"B) They would improve remarkably with more research and investment.","C":"C) They would be achieved along with enormous health benefits.","D":"D) They would considerably lower the cost to the environment."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q51'
);
SET @q_cet4_2026_06_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_52, 'What is the finding of one recent study about being selfish?', '{"A":"A) It may bring certain benefits in the short term.","B":"B) It usually yields more disadvantages than advantages.","C":"C) It serves individual interest rather than a collective''s.","D":"D) It may give way to cooperating in the long run."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q52'
);
SET @q_cet4_2026_06_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_53, 'What have researchers found by studying identical and non-identical twins?', '{"A":"A) They are overwhelmingly different in the amounts of genes.","B":"B) One''s behavior is largely determined by their genetic traits.","C":"C) One''s biological roots can be identified by their genes.","D":"D) They differ from each other in their behavior patterns."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q53'
);
SET @q_cet4_2026_06_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_54, 'What did the author and colleagues identify in their recent research?', '{"A":"A) A gene-related selfish behavior in preschool children.","B":"B) Key factors that determine one''s altruistic behavior.","C":"C) A specific gene associated with altruistic behavior.","D":"D) Roles played by genes in shaping one''s character."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q54'
);
SET @q_cet4_2026_06_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_55, 'What do we learn from evolutionary scientists about cooperative behavior?', '{"A":"A) It may have initially originated in individuals linked by blood.","B":"B) It may have caused the diversification of communities.","C":"C) It helps to build relationships among blood-related people.","D":"D) It guarantees the achievement of goals otherwise unattainable."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-1-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q55'
);
SET @q_cet4_2026_06_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_1_56, 'What can we infer from the last paragraph?', '{"A":"A) Cooperative behavior is evident among identical twins.","B":"B) One is born either cooperative or non-cooperative.","C":"C) Genes determine one''s tendency to cooperate.","D":"D) Cooperative behavior may be cultivated."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_1_56
);

-- ==================== cet4-2026-06-2 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-r1', 'BANKED_CLOZE', 'CET4', NULL, 'It may sound surprising, but people who are supersensitive to coffee''s bitter taste actually drink more of it, a new study finds. This sensitivity isn''t __26__ a matter of taste, either, but rather is influenced by a person''s genetic makeup, the researchers said in the study. "You''d expect that people who are particularly sensitive to the bitter taste of caffeine would drink less coffee," said study senior researcher Marilyn Cornelis. "The __27__ results of our study suggest coffee consumers acquire a taste for or an ability to detect the bitterness of caffeine due to the learned positive __28__ brought out by caffeine." Put another way, people who have a __29__ ability to taste the bitterness of coffee learn to associate "good things with it," Cornelis said. This finding is surprising, given that bitterness often serves as a warning mechanism to __30__ people to spit out harmful substances, the scientists said. Researchers conducted the study to understand how genetics influences people''s __31__ of tea, coffee and alcohol which tend to taste bitter, said lead researcher Jue Sheng Ong. "While all bitter flavors may seem the same, we __32__ the bitterness of Brussels sprouts(抱子甘蓝), quinine(奎宁) and caffeine __33__ ," Ong told Live Science. "The degree to which we find these flavors bitter is, in part, determined by your genes." People with the genes to taste the bitterness of green vegetables are more likely to prefer tea to coffee. In __34__ , people who were more sensitive to quinine''s bitter flavors and those found in green vegetables tended to __35__ coffee.', NULL, '["A) addition","B) approximately","C) avoid","D) consumption","E) converted","F) convince","G) heightened","H) omission","I) opposite","J) perceive","K) prospect","L) reinforcement","M) separately","N) simply","O) targeted"]', 258, 'IMPORT', 'cet4-2026-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-2-r1'
);
SET @pg_cet4_2026_06_2_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-2-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-r2', 'MATCHING', 'CET4', 'Exercise and Dementia', 'A) If this doesn''t encourage you to squeeze in a workout today, nothing will: a new study from Sweden shows that women who were highly fit in mid-life were nearly 90% less likely to get dementia(失智) decades later. B) After initial exercise tests in middle age, researchers followed the women for 44 years. Both groups lived just as long, but those who could ride an exercise bike at a fast rate for 6 minutes in the initial test had a much lower risk of dementia later on than those who couldn''t complete the workout. C) The study, published Wednesday in the journal Neurology, couldn''t prove that exercise prevented dementia, and the findings aren''t a surprise—it''s long been known there''s a correlation between exercise and decreased dementia risk—but the results were particularly dramatic. About 5% of the women with the highest peak workload—those who were able to bike the hardest over those 6 minutes—developed dementia, compared to 25% of those with medium fitness and 45% who weren''t fit enough to finish the test, the study found. Overall, women who were highly fit compared to those who were moderately fit decreased their risk of dementia by 88%. The few highly fit women who did develop dementia became symptomatic at age 90 on average, 11 years later than the moderately fit. D) "I''m very surprised that the finding was so strong," said Ingmar Skoog, the paper''s senior author and a psychiatry(精神病学) professor at The University of Gothenburg in Sweden. "It really shows the importance of exercise." E) Dementia, as defined in medical dictionaries, is a broad term that describes a loss of thinking ability, memory, attention, logical reasoning, and other mental abilities. These changes are severe enough to interfere with social or occupational functioning. Dementia isn''t a disease. Instead, it''s a group of symptoms caused by other conditions. It happens when the parts of your brain used for learning, memory, decision making, and language are damaged or diseased. About 5%-8% of adults over age 65 have some form of dementia. This percentage doubles every 5 years after 65. As many as half of people in their 80s have some form of dementia. F) Dementia is not temporary confusion or forgetfulness that might result from an infection that heals without treatment. It can also come from an underlying( 潜在的) illness or side effects of medications. Dementia typically gets worse over time. People with dementia have problems with thinking and remembering that affect their ability to manage their daily life. G) Dementia is typically associated with declines in cognitive function. Yet researchers have found an association between dementia and declines in hearing and other basic sensory functions. H) Though the study mentioned above was fairly small (only 191 women took the initial fitness test, which means it''s hard to maintain statistical significance while breaking the group down into sub-categories of more or less fit), it does give us hope that dementia can be prevented or delayed through exercise in one''s middle age. I) Alzheimer''s(阿尔茨海默症) and other dementias are believed to begin 15-20 years before symptoms even appear, so it makes sense that exercising in mid-life would affect the risk, Skoog said. Exercise alone is not likely to prevent Alzheimer''s, but the study shows people are not helpless in the face of one of the most feared, costliest and common diseases of old age, he added. And the same activities that help prevent Alzheimer''s—including avoiding smoking, getting adequate exercise and sleep and eating a healthy diet—also prevent heart disease, he said, making them even more worthwhile. "You can do something yourself to decrease your odds," Skoog said. J) Maintaining a healthy lifestyle in mid-life, decades before disease sets in, makes sense, said David Knopman, a fellow of the American Academy of Neurology, who was not involved in the study. "I suspect it''s a dose," said Knopman, also associate director of the Alzheimer''s Disease Research Center at Mayo Clinic in Rochester, Minnesota. "Starting in late life is better than not starting at all, but starting in mid-life seems to offer a larger benefit." K) Although it is not entirely clear why exercise helps put off or prevent Alzheimer''s, Knopman said it''s likely that exercise maintains good blood flow to the brain. "When the brain is healthier from a vascular(血管的) point of view, it can absorb more Alzheimer''s pathogen(病原体) before people become symptomatic," he said. L) The message isn''t that everyone needs to run marathons in middle age, Knopman said, but a healthy lifestyle pays off. M) This type of study can''t say exactly what kind of exercise is best, or how much is needed—only a study that has a placebo(安慰剂) group and tracks people going forward can do that, said Keith Fargo, director of scientific programs and outreach at the non-profit Alzheimer''s Association. "The literature has not yet settled on an amount or type of exercise that is going to be key, although the bulk of literature has suggested that aerobic(有氧的) exercise is what you need to be doing," he said. That doesn''t mean you have to compete in marathons but "more than a 10-min dog walk" would be a good idea, Fargo said. N) Several lifestyle studies are getting underway soon, including one backed by the Alzheimer''s Association called the US POINTER study, which will offer at-risk adults, ages 60-79, a series of lifestyle interventions( 干预) to see if they impact Alzheimer''s risk. That and other Alzheimer''s-related studies are always looking for volunteers to participate, he said. O) In the next three to five years, these studies should allow researchers to provide clearer recommendations for exercise and other lifestyle modifications that might reduce Alzheimer''s risk, such as sleep, diet and social activities, Fargo said. But it''s already quite clear that exercising at any point in life is better for your brain than not exercising at all, Fargo added. P) "If you don''t want to have dementia when you''re 80, the time to start getting fit is now," he said. "It may not necessarily give you a longer life, but there''s a compelling body of work that it will give you more good years."', NULL, NULL, 1017, 'IMPORT', 'cet4-2026-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-2-r2'
);
SET @pg_cet4_2026_06_2_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-2-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-r3', 'CAREFUL_READING', 'CET4', NULL, 'People who systematically underestimate themselves and their own performance suffer from the so-called Impostor Phenomenon. They think that any success is due to external circumstances or just luck and chance. Those people live in constant fear that their "deception" will be exposed. It is common for people to question their abilities now and again. A healthy amount of reflection and self- doubt can protect a person from acting impulsively. However, there are people who are permanently plagued by a massive amount of self-doubt despite delivering a good performance. They think that all of their successes are not a product of their skill or hard work, instead they attribute their own successes to external circumstances, for example, to luck and chance, or believe that their performance is massively overestimated by others. Failures, on the other hand, are always internalised as the result of their own shortcomings. Psychologists from Martin Luther University Halle-Wittenberg examined the topic for the first time under real-life conditions. Seventy-six participants completed a range of intelligence tests and received positive feedback on them, regardless of their actual performance. They were then asked why they think they did so well. The study showed two things: First, the self-reported degree of Impostor Phenomenon is not related to actual measured intelligence or performance. Secondly, the test supported the assumption that people with a tendency to exhibit the Impostor Phenomenon devalue their objectively measured performance and attribute positive results to external causes such as luck and chance, but not to their own abilities. These results are also completely unrelated to age and gender. A permanent underestimation of one''s own abilities is often accompanied by the fear that this supposed intellectual deception will be exposed sooner or later and that they will pay the price for this. The Impostor Phenomenon was first described in 1978 by US psychologists Pauline Clance and Suzanne Imes. They observed that there is a particularly high number of successful women who do not think they are very intelligent. The Impostor Phenomenon is not defined as a mental illness. However, people who suffer from it show a higher vulnerability to depression.', NULL, NULL, 352, 'IMPORT', 'cet4-2026-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-2-r3'
);
SET @pg_cet4_2026_06_2_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-2-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-r4', 'CAREFUL_READING', 'CET4', NULL, 'Music is a universal language. In every culture and country, you will find music. It is vitally important across the globe and has the potential to bring people together in peace and harmony. One of my favorite experiences in music is seeing musicians from different cultures come together and perform as a group. When each culture brings its own unique qualities to the group, an entirely new sound is achieved. This can create extraordinary results. People can communicate with each other using music as the common language. One common musical thread between cultures is known as the pentatonic scale. It is astonishing how many cultures share this tool in approaching music. The pentatonic scale consists of five notes; "penta-" meaning 5, and "tonic" meaning tone or note. This scale can be found in music everywhere including that of Native Americans, Africans, and Asians. It is also found in popular music, blues, jazz, and rock. Using this five-note scale, musicians from around the globe have a medium through which they can relate, communicate, perform, and ultimately understand each other. Music is tied to specific perceptual( 感知的), mental, and emotional faculties, including language (all societies put words to their songs), motor control (people in all societies dance), sound analysis (all musical systems have a distinct pitch and quality), and aesthetics(美感) (their tunes and rhythms are balanced between repetitiveness and chaos). There is no known society that existed without music. Although each culture has their own specific style and approach to music, you will find that the purposes behind music are very similar across the board. Music essentially serves to express or change emotions. It can cheer you up, sadden you, anger you or excite you. Music is often ceremonial: used in religion, ceremony, and celebration. Music can simply be recreational: entertaining, joyful and fun. Any way you have used music, it is almost certain that every other culture has used music in the very same way. And that is something that bonds all of us. We all share a deep love for music and it has the power to unite us.', NULL, NULL, 349, 'IMPORT', 'cet4-2026-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-2-r4'
);
SET @pg_cet4_2026_06_2_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-2-r4' LIMIT 1);

-- 翻译 cet4-2026-06-2
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-translation'
);
SET @q_cet4_2026_06_2_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_01, '餐桌礼仪 (dining etiquette) 是中华传统文化的重要组成部分，蕴含着热情有礼的待客之道。为了招待客人，主人会根据客人的口味和喜好准备丰富精致的菜肴。就餐座位的安排非常讲究，主人坐在正对大门的位置，在主人身边就座的是最重要的客人。进餐时，主人会不时地为客人添酒加菜。这种独特的餐桌礼仪已延续了数千年，对促进和谐的人际交往起到了重要的作用。', NULL, 'Dining etiquette is an important part of traditional Chinese culture, embodying the warm and courteous way of treating guests. To entertain guests, the host prepares rich and exquisite dishes according to their tastes and preferences. The seating arrangement is very particular: the host sits in the seat directly facing the gate, while the most important guest sits beside him. During the meal, he refills wine and adds more dishes for the guests from time to time. This unique dining etiquette has lasted for thousands of years and has played an important role in promoting harmonious interpersonal relationships.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_01
);

-- 听力 Q1 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q01', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q01'
);
SET @q_cet4_2026_06_2_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_02, NULL, '{"A":"A) She was born months after the end of World War I.","B":"B) She has been living in her house throughout her life.","C":"C) She suffered a great deal during the Second World War.","D":"D) She is a 102-year-old woman living in Somerset Village."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_02
);

-- 听力 Q2 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q02', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q02'
);
SET @q_cet4_2026_06_2_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_03, NULL, '{"A":"A) She has been persuaded by the estate agent.","B":"B) She needs the money badly for her health.","C":"C) She is leaving Glastonbury Village.","D":"D) She is moving to a nursing home."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_03
);

-- 听力 Q3 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q03', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q03'
);
SET @q_cet4_2026_06_2_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_04, NULL, '{"A":"A) The navy''s timely arrival.","B":"B) His rich sailing experience.","C":"C) The word HELP written on the boat.","D":"D) His use of a mirror to send a signal."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_04
);

-- 听力 Q4 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q04', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q04'
);
SET @q_cet4_2026_06_2_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_05, NULL, '{"A":"A) He lost all consciousness.","B":"B) He was in good condition.","C":"C) He was too distressed to pick himself up.","D":"D) He entirely abandoned himself to despair."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_05
);

-- 听力 Q5 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q05', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q05'
);
SET @q_cet4_2026_06_2_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_06, NULL, '{"A":"A) Their efforts to provide social services have been ignored.","B":"B) They have been criticized by the Denver school board.","C":"C) They have taken various steps to get more funding.","D":"D) Their enrollment has been on a noticeable decline."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_06
);

-- 听力 Q6 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q06', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q06'
);
SET @q_cet4_2026_06_2_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_07, NULL, '{"A":"A) Approve criteria for closing schools with decreased funding.","B":"B) Enroll 3,000 fewer elementary and middle school students.","C":"C) Decide which elementary and middle schools to close.","D":"D) Alter its per-pupil funding policy on a rational basis."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_07
);

-- 听力 Q7 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q07', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q07'
);
SET @q_cet4_2026_06_2_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_08, NULL, '{"A":"A) To enable the district to remain competitive.","B":"B) To avoid a negative impact on its economy.","C":"C) To keep the district free of debt.","D":"D) To obtain the expected funding."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q08', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q08'
);
SET @q_cet4_2026_06_2_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_09, NULL, '{"A":"A) To book tickets for a musical.","B":"B) To enquire about the price of cats.","C":"C) To pay for her afternoon flight to London.","D":"D) To have her personal computer repaired."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_09
);

-- 听力 Q9 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q09', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q09'
);
SET @q_cet4_2026_06_2_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_10, NULL, '{"A":"A) He frequents the Lion Theatre.","B":"B) He knows how to sell things well.","C":"C) He is a computer science expert.","D":"D) He is away on a business trip."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_10
);

-- 听力 Q10 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q10', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q10'
);
SET @q_cet4_2026_06_2_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_11, NULL, '{"A":"A) They are sold at a discount.","B":"B) They are in low demand.","C":"C) They are no longer available.","D":"D) They are not too expensive."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_11
);

-- 听力 Q11 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q11', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q11'
);
SET @q_cet4_2026_06_2_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_12, NULL, '{"A":"A) Heights.","B":"B) Circus.","C":"C) Wild animals.","D":"D) Dark nights."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_12
);

-- 听力 Q12 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q12', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q12'
);
SET @q_cet4_2026_06_2_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_13, NULL, '{"A":"A) He finds it bothersome to reply.","B":"B) He has switched off his phone.","C":"C) He hasn''t got the time to text back.","D":"D) He doesn''t know how to respond."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_13
);

-- 听力 Q13 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q13', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q13'
);
SET @q_cet4_2026_06_2_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_14, NULL, '{"A":"A) His lack of sufficient sleep at night.","B":"B) His addiction to mobile phone games.","C":"C) His excessive use of the mobile phone.","D":"D) His high frequency of surfing the net."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_14
);

-- 听力 Q14 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q14', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q14'
);
SET @q_cet4_2026_06_2_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_15, NULL, '{"A":"A) Shopping online and paying for his purchases.","B":"B) Communicating with friends on social media.","C":"C) Exploring whatever content to his liking.","D":"D) Sharing and posting pictures and videos."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_15
);

-- 听力 Q15 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q15', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q15'
);
SET @q_cet4_2026_06_2_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_16, NULL, '{"A":"A) She prefers chatting with others online to meeting them.","B":"B) There are few physical stores near where she lives.","C":"C) Ordering meals online is a great convenience to her.","D":"D) She needs to talk with her friends and family far away."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_16
);

-- 听力 Q16 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q16', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q16'
);
SET @q_cet4_2026_06_2_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_17, NULL, '{"A":"A) It is now narrowing.","B":"B) It keeps increasing.","C":"C) It has remained huge.","D":"D) It will soon disappear."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_17
);

-- 听力 Q17 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q17', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q17'
);
SET @q_cet4_2026_06_2_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_18, NULL, '{"A":"A) It is fluctuating between 5-7%.","B":"B) It is slowing down for everyone.","C":"C) It is faster for those who stay in their jobs.","D":"D) It is inadequate for dealing with inflation."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_18
);

-- 听力 Q18 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q18', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q18'
);
SET @q_cet4_2026_06_2_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_19, NULL, '{"A":"A) Booming.","B":"B) Stabilizing.","C":"C) Struggling.","D":"D) Cooling."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_19
);

-- 听力 Q19 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q19', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q19'
);
SET @q_cet4_2026_06_2_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_20, NULL, '{"A":"A) They have smaller amounts of nutrients than unprocessed diets.","B":"B) Their contribution to calorie consumption is hard to determine.","C":"C) They account for nearly half of the average American diet.","D":"D) Their low price and convenience negatively impact health."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_20
);

-- 听力 Q20 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q20', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q20'
);
SET @q_cet4_2026_06_2_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_21, NULL, '{"A":"A) A strong desire to overeat.","B":"B) A lack of nutrients like fiber.","C":"C) A higher risk of cancer and obesity.","D":"D) A greater intake of sugar and salt."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_21
);

-- 听力 Q21 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q21', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q21'
);
SET @q_cet4_2026_06_2_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_22, NULL, '{"A":"A) Eat more quickly.","B":"B) Feel full sooner.","C":"C) Chew thoroughly.","D":"D) Swallow bit by bit."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_22
);

-- 听力 Q22 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q22', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q22'
);
SET @q_cet4_2026_06_2_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_23, NULL, '{"A":"A) By attributing them to current cultural influences.","B":"B) By attributing them to conservative thinking.","C":"C) In terms of new genetic findings.","D":"D) In terms of personal preferences."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_23
);

-- 听力 Q23 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q23', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q23'
);
SET @q_cet4_2026_06_2_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_24, NULL, '{"A":"A) Sharing with women the chores they see necessary.","B":"B) Dividing housework that is demanding for women.","C":"C) Performing household tasks that they enjoy.","D":"D) Doing tasks that are physically challenging."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_24
);

-- 听力 Q24 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q24', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q24'
);
SET @q_cet4_2026_06_2_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_25, NULL, '{"A":"A) The large within-group differences.","B":"B) The great similarities across groups.","C":"C) The researchers'' subjective biases.","D":"D) The noticeable overgeneralizations."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_25
);

-- 听力 Q25 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q25', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q25'
);
SET @q_cet4_2026_06_2_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_26, NULL, '{"A":"A) They seem to be universal.","B":"B) They impact people''s whole life.","C":"C) They shape one''s role in society.","D":"D) They appear at an early age."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q26'
);
SET @q_cet4_2026_06_2_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_27, NULL, '{"A":"A) addition","B":"B) approximately","C":"C) avoid","D":"D) consumption","E":"E) converted","F":"F) convince","G":"G) heightened","H":"H) omission","I":"I) opposite","J":"J) perceive","K":"K) prospect","L":"L) reinforcement","M":"M) separately","N":"N) simply","O":"O) targeted"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q27'
);
SET @q_cet4_2026_06_2_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_28, NULL, '{"A":"A) addition","B":"B) approximately","C":"C) avoid","D":"D) consumption","E":"E) converted","F":"F) convince","G":"G) heightened","H":"H) omission","I":"I) opposite","J":"J) perceive","K":"K) prospect","L":"L) reinforcement","M":"M) separately","N":"N) simply","O":"O) targeted"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q28'
);
SET @q_cet4_2026_06_2_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_29, NULL, '{"A":"A) addition","B":"B) approximately","C":"C) avoid","D":"D) consumption","E":"E) converted","F":"F) convince","G":"G) heightened","H":"H) omission","I":"I) opposite","J":"J) perceive","K":"K) prospect","L":"L) reinforcement","M":"M) separately","N":"N) simply","O":"O) targeted"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q29'
);
SET @q_cet4_2026_06_2_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_30, NULL, '{"A":"A) addition","B":"B) approximately","C":"C) avoid","D":"D) consumption","E":"E) converted","F":"F) convince","G":"G) heightened","H":"H) omission","I":"I) opposite","J":"J) perceive","K":"K) prospect","L":"L) reinforcement","M":"M) separately","N":"N) simply","O":"O) targeted"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q30'
);
SET @q_cet4_2026_06_2_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_31, NULL, '{"A":"A) addition","B":"B) approximately","C":"C) avoid","D":"D) consumption","E":"E) converted","F":"F) convince","G":"G) heightened","H":"H) omission","I":"I) opposite","J":"J) perceive","K":"K) prospect","L":"L) reinforcement","M":"M) separately","N":"N) simply","O":"O) targeted"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q31'
);
SET @q_cet4_2026_06_2_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_32, NULL, '{"A":"A) addition","B":"B) approximately","C":"C) avoid","D":"D) consumption","E":"E) converted","F":"F) convince","G":"G) heightened","H":"H) omission","I":"I) opposite","J":"J) perceive","K":"K) prospect","L":"L) reinforcement","M":"M) separately","N":"N) simply","O":"O) targeted"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q32'
);
SET @q_cet4_2026_06_2_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_33, NULL, '{"A":"A) addition","B":"B) approximately","C":"C) avoid","D":"D) consumption","E":"E) converted","F":"F) convince","G":"G) heightened","H":"H) omission","I":"I) opposite","J":"J) perceive","K":"K) prospect","L":"L) reinforcement","M":"M) separately","N":"N) simply","O":"O) targeted"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q33'
);
SET @q_cet4_2026_06_2_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_34, NULL, '{"A":"A) addition","B":"B) approximately","C":"C) avoid","D":"D) consumption","E":"E) converted","F":"F) convince","G":"G) heightened","H":"H) omission","I":"I) opposite","J":"J) perceive","K":"K) prospect","L":"L) reinforcement","M":"M) separately","N":"N) simply","O":"O) targeted"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q34'
);
SET @q_cet4_2026_06_2_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_35, NULL, '{"A":"A) addition","B":"B) approximately","C":"C) avoid","D":"D) consumption","E":"E) converted","F":"F) convince","G":"G) heightened","H":"H) omission","I":"I) opposite","J":"J) perceive","K":"K) prospect","L":"L) reinforcement","M":"M) separately","N":"N) simply","O":"O) targeted"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q35'
);
SET @q_cet4_2026_06_2_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_36, NULL, '{"A":"A) addition","B":"B) approximately","C":"C) avoid","D":"D) consumption","E":"E) converted","F":"F) convince","G":"G) heightened","H":"H) omission","I":"I) opposite","J":"J) perceive","K":"K) prospect","L":"L) reinforcement","M":"M) separately","N":"N) simply","O":"O) targeted"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q36'
);
SET @q_cet4_2026_06_2_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_37, 'It is typical for dementia to worsen with the passage of time.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q37'
);
SET @q_cet4_2026_06_2_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_38, 'According to Knopman, the study gives the message that a healthy lifestyle is beneficial, but not that all the middle-aged need heavy exercise.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q38'
);
SET @q_cet4_2026_06_2_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_39, 'The results of a new study will encourage middle-aged women to find time exercising however busy they are.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q39'
);
SET @q_cet4_2026_06_2_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_40, 'Hopefully, one can postpone or prevent dementia by exercising in their mid-life.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q40'
);
SET @q_cet4_2026_06_2_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_41, 'In a few years, researchers should be able to offer clearer advice on exercise and other lifestyle changes for reducing the incidence of Alzheimer''s.', NULL, 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q41'
);
SET @q_cet4_2026_06_2_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_42, 'Dementia refers to a loss of multiple mental abilities such as memory and logical reasoning.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q42'
);
SET @q_cet4_2026_06_2_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_43, 'One researcher believes that exercise may keep the brain well supplied with blood.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q43'
);
SET @q_cet4_2026_06_2_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_44, 'Medical literature has not concluded as to what exercise or how much exercise is crucial, although it generally agrees that people should do aerobic exercise.', NULL, 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q44'
);
SET @q_cet4_2026_06_2_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_45, 'It has long been common knowledge that exercise correlates with reduced risk of dementia.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q45'
);
SET @q_cet4_2026_06_2_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_46, 'Activities helpful in the prevention of Alzheimer''s also prevent heart disease.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q46'
);
SET @q_cet4_2026_06_2_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_47, 'What do we learn from the passage about people who suffer from the so-called Impostor Phenomenon?', '{"A":"A) They systematically underestimate their chances of success.","B":"B) They tend to attribute their achievements to good fortune.","C":"C) They seem to live in constant fear of being deceived.","D":"D) They generally rely on luck and chance for success."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q47'
);
SET @q_cet4_2026_06_2_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_48, 'What do people with a healthy amount of reflection and self-doubt tend to do?', '{"A":"A) Credit all their successes to hard work.","B":"B) Strive hard to perfect their skills.","C":"C) Refrain from acting on impulse.","D":"D) Deliver a better performance."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q48'
);
SET @q_cet4_2026_06_2_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_49, 'What do Impostor Phenomenon sufferers often do according to psychologists from Martin Luther University Halle-Wittenberg?', '{"A":"A) Attribute their accomplishments to others.","B":"B) Deny their actual measured intelligence.","C":"C) Claim to have confidence in their own abilities.","D":"D) Mark down their objectively rated performance."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q49'
);
SET @q_cet4_2026_06_2_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_50, 'What happens when a person permanently underestimates their own abilities?', '{"A":"A) They will focus their attention on external factors.","B":"B) They will be fearful of potential consequences.","C":"C) They will count on good fortune for success.","D":"D) They will keep improving their own skills."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q50'
);
SET @q_cet4_2026_06_2_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_51, 'What did US psychologists Pauline Clance and Suzanne Imes say about Impostor Phenomenon sufferers?', '{"A":"A) They are more liable to have depression.","B":"B) They seldom realise their potential fully.","C":"C) They will develop mental illnesses.","D":"D) They will pay higher prices one day."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q51'
);
SET @q_cet4_2026_06_2_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_52, 'In what way is music important?', '{"A":"A) It is able to create novel and extraordinary emotions.","B":"B) It has the power to unite people throughout the world.","C":"C) It allows different cultural groups to sing in harmony.","D":"D) It is the only language favored by all peoples of the world."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q52'
);
SET @q_cet4_2026_06_2_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_53, 'Why does the author like to see musicians from different cultures perform together?', '{"A":"A) Their musical experience can be compared.","B":"B) A novel language can be created.","C":"C) Their unique skills can be displayed.","D":"D) Fantastic results can be achieved."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q53'
);
SET @q_cet4_2026_06_2_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_54, 'What does the passage say about the pentatonic scale?', '{"A":"A) It is present in music all around the world.","B":"B) It is helpful to understanding music.","C":"C) It is the basis for musicians'' creation.","D":"D) It is a medium for ordinary people to relate."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q54'
);
SET @q_cet4_2026_06_2_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_55, 'What is the fundamental role of music in people''s life?', '{"A":"A) To bring them together.","B":"B) To show their identity.","C":"C) To express their emotions.","D":"D) To keep them entertained."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-2-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q55'
);
SET @q_cet4_2026_06_2_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-2-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_2_56, 'In what aspect is music similar throughout the world?', '{"A":"A) The way people respond to it.","B":"B) The role it plays in society.","C":"C) The joy it brings to people.","D":"D) The way it is made use of."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_2_56
);

-- ==================== cet4-2026-06-3 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-r1', 'BANKED_CLOZE', 'CET4', NULL, 'Junk-food lovers who try to cut back on fries or chocolate may experience symptoms similar to drug withdrawal, a new study suggests. Researchers found that people attempting to cut down on eating highly processed foods experience some of the same __26__ and psychological symptoms—such as mood swings, anxiety, headaches and poor sleep—as those __27__ smoking cigarettes or using drugs, according to the study. The new study __28__ the first evidence that these withdrawal-like symptoms can occur when people cut down on highly processed foods, said lead study author Erica Schulte. Based on the participants'' self-reported symptoms, withdrawal symptoms were __29__ more intense between the second and fifth days after attempting to reduce junk-food consumption, which __30__ the time span people live through during drug withdrawal. The idea that food may be addictive after "heavy" use by some individuals is a __31__ subject, Schulte said. Although prior studies in animals and humans have shown some biological and behavioral similarities between substance-use disorders and addictive-like consumption of highly processed foods, no studies have looked at whether reducing junk food can __32__ withdrawal symptoms in people, she noted. Raising __33__ that people may experience irritability(烦躁) or headaches when cutting down on junk food can help individuals __34__ coping strategies in advance, Schulte noted. The findings may also __35__ light on the barriers people face when changing eating habits—barriers that may play a role in people dropping out of treatments, she said.', NULL, '["A) awareness","B) canceling","C) controversial","D) emptiness","E) monstrous","F) offers","G) parallels","H) permanently","I) physical","J) prepare","K) prospects","L) quitting","M) shed","N) significantly","O) trigger"]', 238, 'IMPORT', 'cet4-2026-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-3-r1'
);
SET @pg_cet4_2026_06_3_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-3-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-r2', 'MATCHING', 'CET4', 'Giving a better phone interview', 'A) These days, phone interviews are an unavoidable part of the job interview process, and for good reason: They save time and effort. But that doesn''t mean that phone calls require zero energy on the part of the candidate. Many companies treat phone screening as the official first round of the hiring process. That means candidates are expected to go into them prepared with as much information as possible about the company, position, and their own skills and strengths. B) A big mistake people often make is talking about their personal lives. Don''t talk about your personal life unless you''re directly asked a question about what you like to do in your off-hours. "The point of a phone interview is to focus on getting to know a candidate''s professional experience and goals," says Mckenzie Roark, campus talent specialist at Lithko Contracting. "A recruiter is trying to see if they are the best fit for a role, and learning about their personal life doesn''t help. For example, when asked where you see yourself in five years, we don''t want to know that you hope to be married or that you want to buy a new house. That is nice, but that isn''t relative to anything professional." C) It might be tempting to cross something off your to-do list while on a phone interview, but recruiters and hiring managers can easily tell if your attention is elsewhere. Many interviewers are annoyed to see people who decide to multitask while on the phone interview. There are candidates who wash dishes, go for walks, or do grocery shopping during the interview. Needless to say, this doesn''t reflect well on your level of interest in the position you''re interviewing for. D) The question regarding pay is also best avoided. To be frank, it''s simply too early in the process for you to be the one who brings up salary expectations. "Chances are if a candidate is participating in a phone interview, this is the first time they have talked with the company, and the first call isn''t the appropriate time to talk about ''what''s in it for you,''" says Justina Strnad, the Talent Acquisition Manager for Shiftgig. "Trust me, if you are a great candidate and make it to the next step, the hiring team is going to be very transparent about what''s in it for you later on." E) "After wrapping up a phone interview, it is typical that the interviewer will ask the candidate if they have any questions. I can''t stress this enough: ALWAYS ask questions," says Roark. "If we have had a great phone interview and then we wrap up and they don''t have any questions for me, it pretty much ruins the whole interview. It tells me that the candidate is uninterested in the role, which in reality might not be the case at all," she notes. But surely, if you''re interested in a job, you can think of something to ask your interviewer. F) It seems basic, but surprisingly, a lot of people are late to phone interviews. "About a quarter of the people with whom I schedule phone interviews aren''t on time," says Sophie Cikovsky, who handles U.S. recruiting for Infinite Global. "While this bothers me personally, it''s also indicative of someone who isn''t very detail- oriented," she explains. "In order to identify this early in the hiring process, I started asking all candidates a few years ago to call me as opposed to calling them at an agreed-upon time. That way, if I hear from them at 1:13 p.m. or 12:49 p.m. instead of our planned 1:00 p.m. interview time, I have an early indicator that they might not be a great fit." G) "Make sure you test your headset and connection before dialing in," recommends Roark. "There is nothing more frustrating for a recruiter who has a structured interview guide in place having to repeatedly ask the same question over and over because they could not understand your answer due to dropped signals." Test- call a friend beforehand, or even call yourself from a landline if necessary; it will take less than a minute. H) You might be eager to get your point across or talk about your experience, but interrupting the interviewer is awkward and rude. "Interviewing can be stressful, and sometimes that stress manifests itself in speaking too fast, speaking too loud, talking over the interviewer, or attempting to answer the interviewer''s question before they have actually finished asking the question," says Chris Dardis, a recruiting expert. "Don''t do this." There''s a big difference between being assertive(自信的) and being aggressive, and interviewers can always recognize it. I) It''s tough not to say things like "um," "uh," and "like" in everyday speech, but these verbal habits become much more pronounced when speaking on the phone, says Dardis. "In face-to-face interviews, they''re not as noticeable, because there are other things like your hair, suit, or body language to distract people." But in a phone interview, the only thing you have to go on is what you say and how you say it. "That''s why it''s so important to eliminate these words from your speech when doing a phone interview." J) Not knowing anything about the company or job you''re interviewing for is way more obvious than you''d think. "Many people think that they don''t have to put as much effort into researching the role or the company," says Steve Pritchard, an HR consultant. And if you have your laptop in front of you during the interview to do a few quick searches, they won''t know the difference, right? Not exactly. "Seasoned interviewers will know whether an interviewee is researching while on the phone. The interviewer can often even hear the typing as they ask the question," he adds. K) "The key to success during a phone interview is clear and concise answers," says Dardis. "People''s attention spans tend to be shorter over the phone. You don''t want your future employer to lose interest in the conversation." He recommends practicing answers to questions you know will be asked ahead of time in order to be clear on what you''re going to say. That way, you can prevent talking in an aimless manner.', NULL, NULL, 1035, 'IMPORT', 'cet4-2026-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-3-r2'
);
SET @pg_cet4_2026_06_3_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-3-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-r3', 'CAREFUL_READING', 'CET4', NULL, 'Disgust is a universal human emotion. One type of disgust is called physical disgust, which protects us from eating or touching things that could be dangerous for us, such as raw meat or insects. Children experience physical disgust from a very early age, but do not achieve an understanding of the concept until they are around four years old. Some researchers maintain that there is another type of disgust, called moral disgust, that protects us from engaging in activities that can be perceived as morally wrong. Examples of moral disgust are stealing, lying or cheating. However, not all academics think that moral disgust really exists. Some say that when we refer to disgust in relation to moral issues, we are using disgust as a metaphor(隐喻), and what we are feeling is in reality anger. If moral disgust appears quite late in development, it makes sense to think that there is actually a social component to it. Children learn about emotions in many different ways. Of special relevance are parents-children conversations about emotions. Indeed, children whose parents talk about emotions often have a better emotional understanding than children whose parents do not discuss emotions often. However, there are no studies that have examined how parents and children talk about disgust. This is what we set up to examine in our study. We asked 68 English-speaking mothers and their four-, six- or eight-year-old children to discuss some stories about moral and physical disgust. Our preliminary findings show mothers and children do talk about disgust, but mainly about physical disgust and not so much about moral disgust. When we asked mothers and children to discuss moral issues, such as whether it is OK to play with a child who has stolen someone else''s snack, they linked this type of moral wrongdoing with the emotion of anger and not disgust. Does this mean that moral disgust does not exist? Some researchers suggest moral disgust exists in adults. Our findings suggest that moral disgust is either understood at a later age or is only used metaphorically, if at all, in children as old as eight years.', NULL, NULL, 351, 'IMPORT', 'cet4-2026-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-3-r3'
);
SET @pg_cet4_2026_06_3_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-3-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-r4', 'CAREFUL_READING', 'CET4', NULL, 'After finding out details about a stranger, we mistakenly think that they also know about us. As a result, we act more honestly around them, according to a recent study in Nature. Past research has found that we tend to assume social relationships are reciprocal(相互的). Most of the time, this assumption is accurate: someone you think of as a friend will usually consider you a friend too. But sometimes our social ties are more one-sided: for example, you might learn something about a stranger who doesn''t know you at all. Researchers Anuj Shah and Michael LaForest wondered whether our tendency to believe that social ties are reciprocal could lead us to mistakenly feel that a stranger does actually know us. In a series of lab-based studies, this is exactly what the researchers found. When we know about strangers, we erroneously think they also know about us. But the really interesting finding came when the researchers stepped out of the lab, to conduct a field experiment. The team developed leaflets( 传单) containing fairly ordinary information about local community police officers, such as their favourite food, hobbies, or reasons for joining the police force. They then sent out these leaflets to every apartment in a number of housing developments in disadvantaged areas. The officers themselves also dropped off cards to local residents containing similar information. Two months later, the researchers surveyed residents at these housing developments as well as control areas that did not receive leaflets or outreach cards. Residents were asked to imagine that they had committed a crime and how likely it would be that local officers would find out about it. They also rated how well the officers in the area knew them. The team found that residents of the developments that had received the leaflets believed it more likely that local officers would find out about illegal activity than residents of the control areas. Even more strikingly, the team found that immediately after the leaflet distribution, there were fewer criminal complaints and arrests in the areas around the developments that had received the leaflets than around the control developments.', NULL, NULL, 351, 'IMPORT', 'cet4-2026-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-3-r4'
);
SET @pg_cet4_2026_06_3_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2026-06-3-r4' LIMIT 1);

-- 翻译 cet4-2026-06-3
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-translation'
);
SET @q_cet4_2026_06_3_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_01, '在中国传统文化中，亲朋好友之间互赠礼物是人际交往的一种重要礼节 (etiquette) 。赠送礼物不仅是物质的馈赠，更是情感的表达，是维系人际关系的重要纽带。一份精心挑选、符合接受者喜好的礼物，往往能加深彼此的感情。中国人遵循"礼尚往来" (mutually exchanging courtesies)的传统，接受礼物时会表达谢意，并适时回赠礼物，以增进彼此的融洽关系。', NULL, 'In traditional Chinese culture, exchanging gifts among relatives and close friends is an important form of etiquette in interpersonal communication. Giving gifts is not only a material offering, but also an expression of affection, and an important bond that maintains interpersonal relationships. Such a carefully chosen gift that suits the recipient''s preferences can often deepen mutual affection. Chinese people follow the tradition of reciprocity (mutually exchanging courtesies): when receiving gifts, they express their gratitude and return gifts at an appropriate time, so as to enhance their harmonious relationship.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_01
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q26'
);
SET @q_cet4_2026_06_3_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_02, NULL, '{"A":"A) awareness","B":"B) canceling","C":"C) controversial","D":"D) emptiness","E":"E) monstrous","F":"F) offers","G":"G) parallels","H":"H) permanently","I":"I) physical","J":"J) prepare","K":"K) prospects","L":"L) quitting","M":"M) shed","N":"N) significantly","O":"O) trigger"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_02
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q27'
);
SET @q_cet4_2026_06_3_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_03, NULL, '{"A":"A) awareness","B":"B) canceling","C":"C) controversial","D":"D) emptiness","E":"E) monstrous","F":"F) offers","G":"G) parallels","H":"H) permanently","I":"I) physical","J":"J) prepare","K":"K) prospects","L":"L) quitting","M":"M) shed","N":"N) significantly","O":"O) trigger"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_03
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q28'
);
SET @q_cet4_2026_06_3_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_04, NULL, '{"A":"A) awareness","B":"B) canceling","C":"C) controversial","D":"D) emptiness","E":"E) monstrous","F":"F) offers","G":"G) parallels","H":"H) permanently","I":"I) physical","J":"J) prepare","K":"K) prospects","L":"L) quitting","M":"M) shed","N":"N) significantly","O":"O) trigger"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_04
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q29'
);
SET @q_cet4_2026_06_3_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_05, NULL, '{"A":"A) awareness","B":"B) canceling","C":"C) controversial","D":"D) emptiness","E":"E) monstrous","F":"F) offers","G":"G) parallels","H":"H) permanently","I":"I) physical","J":"J) prepare","K":"K) prospects","L":"L) quitting","M":"M) shed","N":"N) significantly","O":"O) trigger"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_05
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q30'
);
SET @q_cet4_2026_06_3_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_06, NULL, '{"A":"A) awareness","B":"B) canceling","C":"C) controversial","D":"D) emptiness","E":"E) monstrous","F":"F) offers","G":"G) parallels","H":"H) permanently","I":"I) physical","J":"J) prepare","K":"K) prospects","L":"L) quitting","M":"M) shed","N":"N) significantly","O":"O) trigger"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_06
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q31'
);
SET @q_cet4_2026_06_3_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_07, NULL, '{"A":"A) awareness","B":"B) canceling","C":"C) controversial","D":"D) emptiness","E":"E) monstrous","F":"F) offers","G":"G) parallels","H":"H) permanently","I":"I) physical","J":"J) prepare","K":"K) prospects","L":"L) quitting","M":"M) shed","N":"N) significantly","O":"O) trigger"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_07
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q32'
);
SET @q_cet4_2026_06_3_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_08, NULL, '{"A":"A) awareness","B":"B) canceling","C":"C) controversial","D":"D) emptiness","E":"E) monstrous","F":"F) offers","G":"G) parallels","H":"H) permanently","I":"I) physical","J":"J) prepare","K":"K) prospects","L":"L) quitting","M":"M) shed","N":"N) significantly","O":"O) trigger"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_08
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q33'
);
SET @q_cet4_2026_06_3_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_09, NULL, '{"A":"A) awareness","B":"B) canceling","C":"C) controversial","D":"D) emptiness","E":"E) monstrous","F":"F) offers","G":"G) parallels","H":"H) permanently","I":"I) physical","J":"J) prepare","K":"K) prospects","L":"L) quitting","M":"M) shed","N":"N) significantly","O":"O) trigger"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_09
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q34'
);
SET @q_cet4_2026_06_3_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_10, NULL, '{"A":"A) awareness","B":"B) canceling","C":"C) controversial","D":"D) emptiness","E":"E) monstrous","F":"F) offers","G":"G) parallels","H":"H) permanently","I":"I) physical","J":"J) prepare","K":"K) prospects","L":"L) quitting","M":"M) shed","N":"N) significantly","O":"O) trigger"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_10
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q35'
);
SET @q_cet4_2026_06_3_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_11, NULL, '{"A":"A) awareness","B":"B) canceling","C":"C) controversial","D":"D) emptiness","E":"E) monstrous","F":"F) offers","G":"G) parallels","H":"H) permanently","I":"I) physical","J":"J) prepare","K":"K) prospects","L":"L) quitting","M":"M) shed","N":"N) significantly","O":"O) trigger"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_11
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q36'
);
SET @q_cet4_2026_06_3_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_12, 'Interviewees are advised not to ask questions about pay during a phone interview.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_12
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q37'
);
SET @q_cet4_2026_06_3_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_13, 'Experienced interviewers will know if an applicant is searching for information online while talking on the phone.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_13
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q38'
);
SET @q_cet4_2026_06_3_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_14, 'Many employers regard the phone interview as the first step of the official recruiting process.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_14
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q39'
);
SET @q_cet4_2026_06_3_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_15, 'Applicants who don''t ask questions at the end of an interview most probably ruin their chance of getting the position.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_15
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q40'
);
SET @q_cet4_2026_06_3_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_16, 'The interviewee should test their phone connection before they call the interviewer.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_16
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q41'
);
SET @q_cet4_2026_06_3_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_17, 'It is annoying to the interviewer to find the applicant doing other tasks while being interviewed.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_17
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q42'
);
SET @q_cet4_2026_06_3_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_18, 'To pass a phone interview, the most important thing is to answer questions clearly and concisely.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_18
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q43'
);
SET @q_cet4_2026_06_3_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_19, 'If you fail to call the interviewer on time, they might not see you as a suitable candidate.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_19
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q44'
);
SET @q_cet4_2026_06_3_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_20, 'Applicants should avoid talking about their personal lives if the interviewer has only asked about their professional background and goals.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_20
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q45'
);
SET @q_cet4_2026_06_3_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_21, 'It is impolite for an interviewee to interrupt the interviewer in the phone conversation.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_21
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q46'
);
SET @q_cet4_2026_06_3_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_22, 'What does the passage tell us about physical disgust?', '{"A":"A) It is an emotion as contrasted with thoughts.","B":"B) It is a concept beyond children''s understanding.","C":"C) It is a mechanism to keep us from being harmed.","D":"D) It is an experience gained from any form of danger."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_22
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q47'
);
SET @q_cet4_2026_06_3_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_23, 'How do some researchers perceive moral disgust?', '{"A":"A) It tends to appear in various forms of wrongdoing.","B":"B) It is just as annoying to people as physical disgust.","C":"C) It is a term used by common folk to describe anger.","D":"D) It stops people from doing anything morally wrong."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_23
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q48'
);
SET @q_cet4_2026_06_3_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_24, 'Why does moral disgust appear quite late in children''s development?', '{"A":"A) It needs to be learnt through social interactions.","B":"B) They have little control over its learning process.","C":"C) It is too complex for them to acquire.","D":"D) Their parents seldom talk about emotions."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_24
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q49'
);
SET @q_cet4_2026_06_3_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_25, 'What did the author and his colleagues want to examine in their experiment?', '{"A":"A) What parents tell children against moral wrongdoing.","B":"B) What parents and children link moral wrongdoing to.","C":"C) How moral disgust is seen by children aged 4, 6 and 8.","D":"D) How disgust is discussed between parents and children."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_25
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q50'
);
SET @q_cet4_2026_06_3_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_26, 'What can we infer about moral disgust from the author and his colleagues'' findings?', '{"A":"A) It is a notion hardly comprehensible to children.","B":"B) It rarely exists in children younger than eight.","C":"C) It is a term most parents use when talking to children.","D":"D) It exists in adults with a strong sense of justice."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_26
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q51'
);
SET @q_cet4_2026_06_3_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_27, 'What is the finding of a recent study in Nature?', '{"A":"A) People are more honest with those who know them than with total strangers.","B":"B) People we want to have detailed information about are keen to know about us.","C":"C) People who get to know about a person wrongly assume the person knows them too.","D":"D) People who are familiar with each other tend to behave honestly in their everyday dealings."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_27
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q52'
);
SET @q_cet4_2026_06_3_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_28, 'What does the passage say about the assumption that social relationships are reciprocal?', '{"A":"A) It is more the exception than the rule.","B":"B) It does not hold true in every situation.","C":"C) It does not apply to complex relationships.","D":"D) It is more accurate in one-sided social ties."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_28
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q53'
);
SET @q_cet4_2026_06_3_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_29, 'What did Anuj Shah and Michael LaForest want to find out about the belief that social relationships are reciprocal?', '{"A":"A) Whether it may resolve misunderstandings about social ties.","B":"B) Whether it could help develop one''s relationships with strangers.","C":"C) Whether it could help strengthen interpersonal relationships.","D":"D) Whether it may lead to false assumptions about a stranger."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_29
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q54'
);
SET @q_cet4_2026_06_3_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_30, 'When did Anuj Shah and Michael LaForest find something really interesting in their research?', '{"A":"A) During lab-based studies.","B":"B) During a field experiment.","C":"C) While investigating local residents'' crime.","D":"D) While talking to police officers nearby."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_30
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2026-06-3-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2026_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q55'
);
SET @q_cet4_2026_06_3_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2026-06-3-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2026_06_3_31, 'What happened in the areas around the housing developments subjected to the studies?', '{"A":"A) They saw fewer crimes than the control developments.","B":"B) They witnessed a swifter elimination of illegal activities.","C":"C) Local police responded more quickly to criminal complaints than before.","D":"D) Local police related better to residents there than to those in other areas."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2026_06_3_31
);

-- ==================== cet6-2021-06-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-r1', 'BANKED_CLOZE', 'CET6', NULL, 'A new study has drawn a bleak picture of cultural inclusiveness reflected in the children''s literature available in Australia. Dr. Helen Adam from Edith Cowan University''s School of Education __26__ the cultural diversity of children''s books. She examined the books __27__ in the kindergarten rooms of four day-care centers in Western Australia. Just 18 percent of 2,413 books in the total collection contained any __28__ of non-white people. Minority cultures were often featured in stereotypical or tokenistic ways, for example, by __29__ Asian culture with chopsticks and traditional dress. Characters that did represent a minority culture usually had __30__ roles in the books. The main characters were mostly Caucasian. This causes concern as it can lead to an impression that whiteness is of greater value. Dr. Adam said children formed impressions about "difference" and identity from a very young age. Evidence has shown they develop own-race __31__ from as young as three months of age. The books we share with young children can be a valuable opportunity to develop children''s understanding of themselves and others. Books can also allow children to see diversity. They discover both similarities and differences between themselves and others. This can help develop understanding, acceptance and __32__ of diversity. Census data has shown Australians come from more than 200 countries. They speak over 300 languages at home. Additionally, Australians belong to more than 100 different religious groups. They also work in more than 1,000 different occupations. "Australia is a multicultural society. The current __33__ promotion of white middle-class ideas and lifestyles risks __34__ children from minority groups. This can give white middle-class children a sense of __35__ or privilege," Dr. Adam said.', NULL, '["A) alienating","B) appreciation","C) bias","D) fraud","E) housed","F) investigated","G) overwhelming","H) portraying","I) representation","J) safeguarded","K) secondary","L) superiority","M) temperament","N) tentative","O) threshold"]', 276, 'IMPORT', 'cet6-2021-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-1-r1'
);
SET @pg_cet6_2021_06_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-r2', 'MATCHING', 'CET6', 'How Marconi Gave Us the Wireless World', 'A) A hundred years before iconic figures like Bill Gates and Steve Jobs permeated our lives, an Irish-Italian inventor laid the foundation of the communication explosion of the 21st century. Guglielmo Marconi was arguably the first truly global figure in modern communication. Not only was he the first to communicate globally, he was the first to think globally about communication. Marconi may not have been the greatest inventor of his time, but more than anyone else, he brought about a fundamental shift in the way we communicate. B) Today''s globally networked media and communication system has its origins in the 19th century, when, for the first time, messages were sent electronically across great distances. The telegraph, the telephone, and radio were the obvious predecessors of the Internet, iPods, and mobile phones. What made the link from then to now was the development of wireless communication. Marconi was the first to develop and perfect this system, using the recently-discovered "air waves" that make up the electromagnetic spectrum. C) Between 1896, when he applied for his first patent in England at the age of 22, and his death in Italy in 1937, Marconi was at the center of every major innovation in electronic communication. He was also a skilled and sophisticated organizer, an entrepreneurial innovator, who mastered the use of corporate strategy, media relations, government lobbying, international diplomacy, patents, and prosecution. Marconi was really interested in only one thing: the extension of mobile, personal, long-distance communication to the ends of the earth (and beyond, if we can believe some reports). Some like to refer to him as a genius, but if there was any genius to Marconi it was this vision. D) In 1901 he succeeded in signaling across the Atlantic, from the west coast of England to Newfoundland in the USA, despite the claims of science that it could not be done. In 1924 he convinced the British government to encircle the world with a chain of wireless stations using the latest technology that he had devised, shortwave radio. There are some who say Marconi lost his edge when commercial broadcasting came along; he didn''t see that radio could or should be used to frivolous(无聊的) ends. In one of his last public speeches, a radio broadcast to the United States in March 1937, he deplored that broadcasting had become a one-way means of communication and foresaw it moving in another direction, toward communication as a means of exchange. That was visionary genius. E) Marconi''s career was devoted to making wireless communication happen cheaply, efficiently, smoothly, and with an elegance that would appear to be intuitive and uncomplicated to the user-friendly, if you will. There is a direct connection from Marconi to today''s social media, search engines, and program streaming that can best be summed up by an admittedly provocative exclamation: the 20th century did not exist. In a sense, Marconi''s vision jumped from his time to our own. F) Marconi invented the idea of global communication—or, more straightforwardly, globally networked, mobile, wireless communication. Initially, this was wireless Morse code telegraphy( 电报通讯), the principal communication technology of his day. Marconi was the first to develop a practical method for wireless telegraphy using radio waves. He borrowed technical details from many sources, but what set him apart was a self-confident vision of the power of communication technology on the one hand, and, on the other, of the steps that needed to be taken to consolidate his own position as a player in that field. Tracing Marconi''s lifeline leads us into the story of modern communication itself. There were other important figures, but Marconi towered over them all in reach, power, and influence, as well as in the grip he had on the popular imagination of his time. Marconi was quite simply the central figure in the emergence of a modern understanding of communication. G) In his lifetime, Marconi foresaw the development of television and the fax machine, GPS, radar, and the portable hand-held telephone. Two months before he died, newspapers were reporting that he was working on a "death ray," and that he had "killed a rat with an intricate device at a distance of three feet." By then, anything Marconi said or did was newsworthy. Stock prices rose or sank according to his pronouncements. If Marconi said he thought it might rain, there was likely to be a run on umbrellas. H) Marconi''s biography is also a story about choices and the motivations behind them. At one level, Marconi could be fiercely autonomous and independent of the constraints of his own social class. On another scale, he was a perpetual outsider. Wherever he went, he was never "of" the group; he was always the "other," considered foreign in Britain, British in Italy, and "not American" in the United States. At the same time, he also suffered tremendously from a need for acceptance that drove, and sometimes stained, every one of his relationships. I) Marconi placed a permanent stamp on the way we live. He was the first person to imagine a practical application for the wireless spectrum, and to develop it successfully into a global communication system—in both terms of the word; that is, worldwide and all-inclusive. He was able to do this because of a combination of factors—most important, timing and opportunity—but the single-mindedness and determination with which he carried out his self-imposed mission was fundamentally character-based; millions of Marconi''s contemporaries had the same class, gender, race, and colonial privilege as he, but only a handful did anything with it. Marconi needed to achieve the goal that was set in his mind as an adolescent; by the time he reached adulthood, he understood, intuitively, that in order to have an impact he had to both develop an independent economic base and align himself with political power. Disciplined, uncritical loyalty to political power became his compass for the choices he had to make. J) At the same time, Marconi was uncompromisingly independent intellectually. Shortly after Marconi''s death, the nuclear physicist Enrico Fermi—soon to be the developer of the Manhattan Project—wrote that Marconi proved that theory and experimentation were complementary features of progress. "Experience can rarely, unless guided by a theoretical concept, arrive at results of any great significance…on the other hand, an excessive trust in theoretical conviction would have prevented Marconi from persisting in experiments which were destined to bring about a revolution in the technique of radio-communications." In other words, Marconi had the advantage of not being burdened by preconceived assumptions. K) The most controversial aspect of Marconi''s life—and the reason why there has been no satisfying biography of Marconi until now—was his uncritical embrace of Benito Mussolini. At first this was not problematic for him. But as the regressive(倒退的) nature of Mussolini''s regime became clear, he began to suffer a crisis of conscience. However, after a lifetime of moving within the circles of power, he was unable to break with authority, and served Mussolini faithfully (as president of Italy''s national research council and royal academy, as well as a member of the Fascist Grand Council) until the day he died—conveniently—in 1937, shortly before he would have had to take a stand in the conflict that consumed a world that he had, in part, created.', NULL, NULL, 1204, 'IMPORT', 'cet6-2021-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-1-r2'
);
SET @pg_cet6_2021_06_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-r3', 'CAREFUL_READING', 'CET6', NULL, 'Humans are fascinated by the source of their failings and virtues: This preoccupation inevitably leads to an old debate: whether nature or nurture moulds us more. A revolution in genetics has poised this as a modern political question about the character of our society: if personalities are hard-wired into our genes, what can governments do to help us? It feels morally questionable, yet claims of genetic selection by intelligence are making headlines. This is down to "hereditarian"( 遗传论的) science and a recent paper claimed "differences in exam performance between pupils attending selective and non-selective schools mirror the genetic differences between them". With such an assertion, the work was predictably greeted by a lot of absurd claims about "genetics determining academic success". What the research revealed was the rather less surprising result: the educational benefits of selective schools largely disappear once pupils'' inborn ability and socio-economic background were taken into account. It is a glimpse of the blindingly obvious—and there''s nothing to back strongly either a hereditary or environmental argument. Yet the paper does say children are "unintentionally genetically selected" by the school system. Central to hereditarian science is a tall claim: that identifiable variations in genetic sequences can predict an individual''s aptness to learn, reason and solve problems. This is problematic on many levels. A teacher could not seriously tell a parent their child has a low genetic tendency to study when external factors clearly exist. Unlike-minded academics say the inheritability of human traits is scientifically unsound. At best there is a weak statistical association and not a causal link between DNA and intelligence. Yet sophisticated statistics are used to create an intimidatory atmosphere of scientific certainty. While there''s an undoubted genetic basis to individual difference, it is wrong to think that socially defined groups can be genetically accounted for. The fixation on genes as destiny is surely false too. Medical predictability can rarely be based on DNA alone; the environment matters too. Something as complex as intellect is likely to be affected by many factors beyond genes. If hereditarians want to advance their cause it will require more balanced interpretation and not just acts of advocacy. Genetic selection is a way of exerting influence over others, "the ultimate collective control of human destinies," as writer H. G. Wells put it. Knowledge becomes power and power requires a sense of responsibility. In understanding cognitive ability, we must not elevate discrimination to a science, allowing people to climb the ladder of life only as far as their cells might suggest. This will need a more sceptical eye on the science. As technology progresses, we all have a duty to make sure that we shape a future that we would want to find ourselves in.', NULL, NULL, 453, 'IMPORT', 'cet6-2021-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-1-r3'
);
SET @pg_cet6_2021_06_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-r4', 'CAREFUL_READING', 'CET6', NULL, 'Nicola Sturgeon''s speech last Tuesday setting out the Scottish government''s legislative programme for the year ahead confirmed what was already pretty clear. Scottish councils are set to be the first in the UK with the power to levy charges on visitors, with Edinburgh likely to lead the way. Tourist taxes are not new. The Himalayan kingdom of Bhutan has a longstanding policy of charging visitors a daily fee. France''s tax on overnight stays was introduced to assist thermal spa(温泉) towns to develop, and around half of French local authorities use it today. But such levies are on the rise. Moves by Barcelona and Venice to deal with the phenomenon of "over- tourism" through the use of charges have recently gained prominence. Japan and Greece are among the countries to have recently introduced tourist taxes. That the UK lags behind is due to our weak, by international standards, local government, as well as the opposition to taxes and regulation of our aggressively pro-market ruling party. Some UK cities have lobbied without success for the power to levy a charge on visitors. Such levies are no universal remedy as the amounts raised would be tiny compared with what has been taken away by central government since 2010. Still, it is to be hoped that the Scottish government''s bold move will prompt others to act. There is no reason why visitors to the UK, or domestic tourists on holiday in hotspots such as Cornwall, should be exempt from taxation- particularly when vital local services including waste collection, park maintenance and arts and culture spending are under unprecedented strain. On the contrary, compelling tourists to make a financial contribution to the places they visit beyond their personal consumption should be part of a wider cultural shift. Westerners with disposable incomes have often behaved as if they have a right to go wherever they choose with little regard for the consequences. Just as the environmental harm caused by aviation and other transport must come under far greater scrutiny, the social cost of tourism must also be confronted. This includes the impact of short-term lets on housing costs and quality of life for residents. Several European capitals, including Paris and Berlin, are leading a campaign for tougher regulation by the European Union. It also includes the impact of overcrowding, litter and the kinds of behaviour associated with noisy parties. There is no "one size fits all" solution to this problem. The existence of new revenue streams for some but not all councils is complicated, and businesses are often opposed, fearing higher costs will make them uncompetitive. But those places that want them must be given the chance to make tourist taxes work.', NULL, NULL, 446, 'IMPORT', 'cet6-2021-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-1-r4'
);
SET @pg_cet6_2021_06_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-1-r4' LIMIT 1);

-- 翻译 cet6-2021-06-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-translation'
);
SET @q_cet6_2021_06_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_01, '海南是仅次于台湾的中国第二大岛，是位于中国最南端的省份。海南岛风景秀丽，气候宜人，阳光充足,生物多样，温泉密布，海水清澈，大部分海滩几乎全年都是游泳和日光浴的理想场所，因而被誉为中国的四季花园和度假胜地，每年都吸引了大批中外游客。 海南1988年建省以来，旅游业、服务业、高新技术产业飞速发展,是中国唯一的省级经济特区。在中央政府和全国人民的大力支持下，海南将建成中国最大的自由贸易试验区。', NULL, 'Hainan is China''s second-largest island after Taiwan, as well as the southernmost province of the country. Hainan Island boasts beautiful scenery, a pleasant climate, abundant sunshine, rich biodiversity, numerous hot springs and crystal-clear seawater, and most of its beaches are ideal places for swimming and sunbathing almost all year round. As a result, it is praised as China''s garden of all seasons and a holiday resort, attracting large numbers of tourists from home and abroad every year. Since it was established as a province in 1988, Hainan''s tourism, service industry and high-tech industry have developed rapidly, making it China''s only provincial-level special economic zone. With the strong support of the central government and people across the country, Hainan will be built into the largest free trade pilot zone in China.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_01
);

-- 听力 Q1 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q01', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q01'
);
SET @q_cet6_2021_06_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_02, NULL, '{"A":"A) He will tell the management how he really feels.","B":"B) He will meet his new manager in two weeks.","C":"C) He is going to attend a job interview.","D":"D) He is going to leave his present job."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_02
);

-- 听力 Q2 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q02', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q02'
);
SET @q_cet6_2021_06_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_03, NULL, '{"A":"A) It should be kept private.","B":"B) It should be carefully analyzed.","C":"C) It can be quite useful to senior managers.","D":"D) It can improve interviewees'' job prospects."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_03
);

-- 听力 Q3 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q03', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q03'
);
SET @q_cet6_2021_06_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_04, NULL, '{"A":"A) It may leave a negative impression on the interviewer.","B":"B) It may adversely affect his future career prospects.","C":"C) It may displease his immediate superiors.","D":"D) It may do harm to his fellow employees."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_04
);

-- 听力 Q4 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q04', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q04'
);
SET @q_cet6_2021_06_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_05, NULL, '{"A":"A) Prepare a comprehensive exit report.","B":"B) Do some practice for the exit interview.","C":"C) Network with his close friends to find a better employer.","D":"D) Pour out his frustrations on a rate-your-employer website."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_05
);

-- 听力 Q5 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q05', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q05'
);
SET @q_cet6_2021_06_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_06, NULL, '{"A":"A) Her unsuccessful journey.","B":"B) Her month-long expedition.","C":"C) Her latest documentary.","D":"D) Her career as a botanist."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_06
);

-- 听力 Q6 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q06', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q06'
);
SET @q_cet6_2021_06_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_07, NULL, '{"A":"A) She had to live like a vegetarian.","B":"B) She was caught in a hurricane.","C":"C) She had to endure many hardships.","D":"D) She suffered from water shortage."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_07
);

-- 听力 Q7 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q07', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q07'
);
SET @q_cet6_2021_06_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_08, NULL, '{"A":"A) A hurricane was coming.","B":"B) A flood was approaching.","C":"C) They had no more food in the canoe.","D":"D) They could no longer bear the humidity."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q08', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q08'
);
SET @q_cet6_2021_06_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_09, NULL, '{"A":"A) It was memorable.","B":"B) It was unbearable.","C":"C) It was uneventful.","D":"D) It was fruitful."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_09
);

-- 听力 Q9 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q09', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q09'
);
SET @q_cet6_2021_06_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_10, NULL, '{"A":"A) It diminishes laymen''s interest in science.","B":"B) It ensures the accuracy of their arguments.","C":"C) It makes their expressions more explicit.","D":"D) It hurts laymen''s dignity and self-esteem."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_10
);

-- 听力 Q10 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q10', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q10'
);
SET @q_cet6_2021_06_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_11, NULL, '{"A":"A) They can learn to communicate with scientists.","B":"B) They tend to disbelieve the actual science.","C":"C) They feel great respect towards scientists.","D":"D) They will see the complexity of science."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_11
);

-- 听力 Q11 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q11', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q11'
);
SET @q_cet6_2021_06_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_12, NULL, '{"A":"A) Find appropriate topics.","B":"B) Stimulate their interest.","C":"C) Explain all the jargon terms.","D":"D) Do away with jargon terms."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_12
);

-- 听力 Q12 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q12', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q12'
);
SET @q_cet6_2021_06_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_13, NULL, '{"A":"A) The local gassy hill might start a huge fire.","B":"B) There was oil leakage along the Gulf Coast.","C":"C) The erupting gas might endanger local children.","D":"D) There were oil deposits below a local gassy hill."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_13
);

-- 听力 Q13 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q13', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q13'
);
SET @q_cet6_2021_06_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_14, NULL, '{"A":"A) The massive gas underground.","B":"B) Their lack of the needed skill.","C":"C) The sand under the hill.","D":"D) Their lack of suitable tools."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_14
);

-- 听力 Q14 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q14', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q14'
);
SET @q_cet6_2021_06_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_15, NULL, '{"A":"A) It rendered many oil workers jobless.","B":"B) It was not as effective as he claimed.","C":"C) It gave birth to the oil drilling industry.","D":"D) It was not popularized until years later."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_15
);

-- 听力 Q15 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q15', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q15'
);
SET @q_cet6_2021_06_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_16, NULL, '{"A":"A) It radically transformed the state''s economy.","B":"B) It resulted in an oil surplus all over the world.","C":"C) It totally destroyed the state''s rural landscape.","D":"D) It ruined the state''s cotton and beef industries."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_16
);

-- 听力 Q16 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q16', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q16'
);
SET @q_cet6_2021_06_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_17, NULL, '{"A":"A) Unsuitable jobs.","B":"B) Bad managers.","C":"C) Insufficient motivation.","D":"D) Tough regulations."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_17
);

-- 听力 Q17 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q17', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q17'
);
SET @q_cet6_2021_06_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_18, NULL, '{"A":"A) Ineffective training.","B":"B) Toxic company culture.","C":"C) Lack of regular evaluation.","D":"D) Overburdening of managers."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_18
);

-- 听力 Q18 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q18', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q18'
);
SET @q_cet6_2021_06_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_19, NULL, '{"A":"A) It collected feedback from both employers and employees.","B":"B) It was conducted from frontline managers'' point of view.","C":"C) It provided meaningful clues to solving the problem.","D":"D) It was based only on the perspective of employees."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_19
);

-- 听力 Q19 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q19', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q19'
);
SET @q_cet6_2021_06_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_20, NULL, '{"A":"A) It is seeing an automation revolution.","B":"B) It is bringing prosperity to the region.","C":"C) It is yielding an unprecedented profit.","D":"D) It is expanding at an accelerating speed."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_20
);

-- 听力 Q20 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q20', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q20'
);
SET @q_cet6_2021_06_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_21, NULL, '{"A":"A) It exhausts resources sooner.","B":"B) It creates a lot of new jobs.","C":"C) It causes conflicts between employers and employees.","D":"D) It calls for the retraining of unskilled mining workers."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_21
);

-- 听力 Q21 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q21', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q21'
);
SET @q_cet6_2021_06_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_22, NULL, '{"A":"A) They welcome it with open arms.","B":"B) They will wait to see its effect.","C":"C) They are strongly opposed to it.","D":"D) They accept it with reservations."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_22
);

-- 听力 Q22 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q22', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q22'
);
SET @q_cet6_2021_06_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_23, NULL, '{"A":"A) Their cost to the nation''s economy is incalculable.","B":"B) They kill more people than any infectious disease.","C":"C) Their annual death rate is about twice that of the global average.","D":"D) They have experienced a gradual decline since the year of 2017."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_23
);

-- 听力 Q23 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q23', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q23'
);
SET @q_cet6_2021_06_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_24, NULL, '{"A":"A) They show a difference between rich and poor nations.","B":"B) They don''t reflect the changes in individual countries.","C":"C) They rise and fall from year to year.","D":"D) They are not as reliable as claimed."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_24
);

-- 听力 Q24 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q24', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q24'
);
SET @q_cet6_2021_06_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_25, NULL, '{"A":"A) Many of them have increasing numbers of cars on the road.","B":"B) Many of them are following the example set by Thailand.","C":"C) Many of them have seen a decline in road-death rates.","D":"D) Many of them are investing heavily in infrastructure."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_25
);

-- 听力 Q25 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q25', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q25'
);
SET @q_cet6_2021_06_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_26, NULL, '{"A":"A) Foster better driving behavior.","B":"B) Provide better training for drivers.","C":"C) Abolish all outdated traffic rules.","D":"D) Impose heavier penalties on speeding."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q26'
);
SET @q_cet6_2021_06_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_27, NULL, '{"A":"A) alienating","B":"B) appreciation","C":"C) bias","D":"D) fraud","E":"E) housed","F":"F) investigated","G":"G) overwhelming","H":"H) portraying","I":"I) representation","J":"J) safeguarded","K":"K) secondary","L":"L) superiority","M":"M) temperament","N":"N) tentative","O":"O) threshold"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q27'
);
SET @q_cet6_2021_06_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_28, NULL, '{"A":"A) alienating","B":"B) appreciation","C":"C) bias","D":"D) fraud","E":"E) housed","F":"F) investigated","G":"G) overwhelming","H":"H) portraying","I":"I) representation","J":"J) safeguarded","K":"K) secondary","L":"L) superiority","M":"M) temperament","N":"N) tentative","O":"O) threshold"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q28'
);
SET @q_cet6_2021_06_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_29, NULL, '{"A":"A) alienating","B":"B) appreciation","C":"C) bias","D":"D) fraud","E":"E) housed","F":"F) investigated","G":"G) overwhelming","H":"H) portraying","I":"I) representation","J":"J) safeguarded","K":"K) secondary","L":"L) superiority","M":"M) temperament","N":"N) tentative","O":"O) threshold"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q29'
);
SET @q_cet6_2021_06_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_30, NULL, '{"A":"A) alienating","B":"B) appreciation","C":"C) bias","D":"D) fraud","E":"E) housed","F":"F) investigated","G":"G) overwhelming","H":"H) portraying","I":"I) representation","J":"J) safeguarded","K":"K) secondary","L":"L) superiority","M":"M) temperament","N":"N) tentative","O":"O) threshold"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q30'
);
SET @q_cet6_2021_06_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_31, NULL, '{"A":"A) alienating","B":"B) appreciation","C":"C) bias","D":"D) fraud","E":"E) housed","F":"F) investigated","G":"G) overwhelming","H":"H) portraying","I":"I) representation","J":"J) safeguarded","K":"K) secondary","L":"L) superiority","M":"M) temperament","N":"N) tentative","O":"O) threshold"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q31'
);
SET @q_cet6_2021_06_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_32, NULL, '{"A":"A) alienating","B":"B) appreciation","C":"C) bias","D":"D) fraud","E":"E) housed","F":"F) investigated","G":"G) overwhelming","H":"H) portraying","I":"I) representation","J":"J) safeguarded","K":"K) secondary","L":"L) superiority","M":"M) temperament","N":"N) tentative","O":"O) threshold"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q32'
);
SET @q_cet6_2021_06_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_33, NULL, '{"A":"A) alienating","B":"B) appreciation","C":"C) bias","D":"D) fraud","E":"E) housed","F":"F) investigated","G":"G) overwhelming","H":"H) portraying","I":"I) representation","J":"J) safeguarded","K":"K) secondary","L":"L) superiority","M":"M) temperament","N":"N) tentative","O":"O) threshold"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q33'
);
SET @q_cet6_2021_06_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_34, NULL, '{"A":"A) alienating","B":"B) appreciation","C":"C) bias","D":"D) fraud","E":"E) housed","F":"F) investigated","G":"G) overwhelming","H":"H) portraying","I":"I) representation","J":"J) safeguarded","K":"K) secondary","L":"L) superiority","M":"M) temperament","N":"N) tentative","O":"O) threshold"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q34'
);
SET @q_cet6_2021_06_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_35, NULL, '{"A":"A) alienating","B":"B) appreciation","C":"C) bias","D":"D) fraud","E":"E) housed","F":"F) investigated","G":"G) overwhelming","H":"H) portraying","I":"I) representation","J":"J) safeguarded","K":"K) secondary","L":"L) superiority","M":"M) temperament","N":"N) tentative","O":"O) threshold"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q35'
);
SET @q_cet6_2021_06_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_36, NULL, '{"A":"A) alienating","B":"B) appreciation","C":"C) bias","D":"D) fraud","E":"E) housed","F":"F) investigated","G":"G) overwhelming","H":"H) portraying","I":"I) representation","J":"J) safeguarded","K":"K) secondary","L":"L) superiority","M":"M) temperament","N":"N) tentative","O":"O) threshold"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q36'
);
SET @q_cet6_2021_06_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_37, 'Marconi was central to our present-day understanding of communication.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q37'
);
SET @q_cet6_2021_06_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_38, 'As an adult, Marconi had an intuition that he had to be loyal to politicians in order to be influential.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q38'
);
SET @q_cet6_2021_06_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_39, 'Marconi disapproved of the use of wireless communication for commercial broadcasting.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q39'
);
SET @q_cet6_2021_06_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_40, 'Marconi''s example demonstrates that theoretical concepts and experiments complement each other in making progress in science and technology.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q40'
);
SET @q_cet6_2021_06_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_41, 'Marconi''s real interest lay in the development of worldwide wireless communication.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q41'
);
SET @q_cet6_2021_06_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_42, 'Marconi spent his whole life making wireless communication simple to use.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q42'
);
SET @q_cet6_2021_06_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_43, 'Because of his long-time connection with people in power, Marconi was unable to cut himself off from the fascist regime in Italy.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q43'
);
SET @q_cet6_2021_06_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_44, 'In his later years, Marconi exerted a tremendous influence on all aspects of people''s life.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q44'
);
SET @q_cet6_2021_06_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_45, 'What connected the 19th century and our present time was the development of wireless communication.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q45'
);
SET @q_cet6_2021_06_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_46, 'Despite his autonomy, Marconi felt alienated and suffered from a lack of acceptance.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q46'
);
SET @q_cet6_2021_06_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_47, 'What did a recent research paper claim?', '{"A":"A) The type of school students attend makes a difference to their future.","B":"B) Genetic differences between students are far greater than supposed.","C":"C) The advantages of selective schools are too obvious to ignore.","D":"D) Students'' academic performance is determined by their genes."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q47'
);
SET @q_cet6_2021_06_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_48, 'What does the author think of the recent research?', '{"A":"A) Its result was questionable.","B":"B) Its implication was positive.","C":"C) Its influence was rather negligible.","D":"D) Its conclusions were enlightening."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q48'
);
SET @q_cet6_2021_06_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_49, 'What does the author say about the relationship between DNA and intelligence?', '{"A":"A) It is one of scientific certainty.","B":"B) It is not one of cause and effect.","C":"C) It is subject to interpretation of statistics.","D":"D) It is not fully examined by gene scientists."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q49'
);
SET @q_cet6_2021_06_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_50, 'What do hereditarians need to do to make their claims convincing?', '{"A":"A) Take all relevant factors into account in interpreting their data.","B":"B) Conduct their research using more sophisticated technology.","C":"C) Gather gene data from people of all social classes.","D":"D) Cooperate with social scientists in their research."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q50'
);
SET @q_cet6_2021_06_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_51, 'What does the author warn against in the passage?', '{"A":"A) Exaggerating the power of technology in shaping the world.","B":"B) Losing sight of professional ethics in conducting research.","C":"C) Misunderstanding the findings of human cognition research.","D":"D) Promoting discrimination in the name of science."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q51'
);
SET @q_cet6_2021_06_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_52, 'What do we learn from Nicola Sturgeon''s speech?', '{"A":"A) The UK is set to adjust its policy on taxation.","B":"B) Tourists will have to pay a tax to visit Scotland.","C":"C) The UK will take new measures to boost tourism.","D":"D) Edinburgh contributes most to Scotland''s tourism."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q52'
);
SET @q_cet6_2021_06_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_53, 'How come the UK has been slow in imposing the tourist tax?', '{"A":"A) Its government wants to attract more tourists.","B":"B) The tax is unlikely to add much to its revenue.","C":"C) Its ruling party is opposed to taxes and regulation.","D":"D) It takes time for local governments to reach consensus."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q53'
);
SET @q_cet6_2021_06_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_54, 'Both international and domestic visitors in the UK should pay tourist tax so as to ______.', '{"A":"A) elevate its tourism to international standards","B":"B) improve the welfare of its maintenance workers","C":"C) promote its cultural exchange with other nations","D":"D) ease its financial burden of providing local services"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q54'
);
SET @q_cet6_2021_06_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_55, 'What does the author say about Western tourists?', '{"A":"A) They don''t seem to care about the social cost of tourism.","B":"B) They don''t seem to mind paying for additional services.","C":"C) They deem travel an important part of their life.","D":"D) They subject the effects of tourism to scrutiny."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-1-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q55'
);
SET @q_cet6_2021_06_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_1_56, 'What are UK people''s opinions about the levy of tourist tax?', '{"A":"A) Supportive.","B":"B) Skeptical.","C":"C) Divided.","D":"D) Unclear."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_1_56
);

-- ==================== cet6-2021-06-2 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-r1', 'BANKED_CLOZE', 'CET6', NULL, 'I''m always baffled when I walk into a pharmacy and see shelves bursting with various vitamins, extracts and other supplements, all promising to accelerate or promote weight loss. Aisles of marketing genius belie(掩饰) the fact that, __26__ , weight loss is dictated by the laws of arithmetic. Economist Jessica Irvine wrote a book about how she used math to help her lose more than 18 kilograms. If calories taken in are less than calories __27__ , weight shall be lost, and so it is with money. Despite the __28__ of financial products, services and solutions geared towards accumulating wealth, it all begins with the same __29__ : getting ahead financially requires a reduction of spending, so that income is greater than expenses. I was reminded of this again recently listening to an interview with Nicole Haddow, the author of Smashed Avocado, explaining how she cracked the property market at 31. It was quite a __30__ , given where she had been two years earlier. Nicole didn''t celebrate her 30th birthday as she had __31__ . She was sobbing at the dinner table with her parents, with whom she had just moved back in. She had no stable income, $12,000 in credit-card debt and no plan, but to her __32__ , her father, an accountant, told her that her financial __33__ wasn''t as bad as she thought. He said, on her income, with some changes, she would be able to buy an investment unit within two years, which she did. Nicole admitted she was fortunate, as she was able to live with her parents and __34__ her spending— and life—to get herself on track financially. Creating a gap between her income and spending required a paradigm shift and __35__ sacrifice and commitment, but by going into financial lockdown, Nicole gained financial independence.', NULL, '["A) abundance","B) astonishment","C) entailed","D) envisaged","E) equation","F) expended","G) feat","H) fiscally","I) impetus","J) overhaul","K) permanently","L) plight","M) prosper","N) shatter","O) ultimately"]', 301, 'IMPORT', 'cet6-2021-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-2-r1'
);
SET @pg_cet6_2021_06_2_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-2-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-r2', 'MATCHING', 'CET6', 'France''s beloved cathedral only minutes away from complete destruction', 'A) Notre Dame Cathedral in the heart of Paris was within "15 to 30 minutes" of complete destruction as firefighters battled to stop flames reaching its bell towers on Monday evening, French authorities have revealed. A greater disaster was averted by members of the Paris fire brigade, who risked their lives to remain inside the burning monument to create a wall of water between the raging fire and the two towers on the west of the building. B) The revelation of how close France came to losing its most famous cathedral emerged as police investigators questioned workers involved in the restoration of the monument to try to establish the cause of the devastating blaze. Paris prosecutor Remy Heitz said that an initial fire alert was sounded at 6:20 pm on Monday evening but no fire was found. The second alert was sounded at 6:43 pm, and the blaze was discovered on the roof. C) More than €650 million was raised in a few hours on Tuesday as French business leaders and global corporations announced they would donate to a restoration campaign launched by the president, Emmanuel Macron. But as the emergency services picked through the burnt debris, a row was resurfacing over accusations that the beloved cathedral, immortalised in Victor Hugo''s novel, was already crumbling before the fire. D) The cathedral is owned by the French state and has been at the centre of a years-long dispute over who should finance restoration work of the collapsing staircases, crumbling statues and cracked walls. Jean-Michel Leniaud, the president of the scientific council at the National Heritage Institute, said: "What happened was bound to happen. The lack of adequate maintenance and daily attention to such a majestic building is the cause of this catastrophe." After the blaze was declared completely extinguished, 15 hours after it started, the junior interior minister, Laurent Nunez, said the structure had been saved but remained vulnerable. He praised the actions of the firefighters but admitted the fate of the cathedral had been uncertain. "They saved the main structure, but it all came down to 15-30 minutes," Nunez said. E) In a surprise televised address on Tuesday evening, Macron said he wanted to see the cathedral rebuilt within five years. "The fire at Notre Dame reminds us that we will always have challenges to overcome," Macron said, "Notre Dame is our history, our literature, the centre of our life. It is the standard by which we measure our distances. It''s so many books, so many paintings. It''s the cathedral of every French person, even those who have never visited it. This history is ours and so we will rebuild Notre Dame. It is what the French people expect; it is what our history deserves. It is our deep destiny. We will rebuild Notre Dame so it is even more beautiful than before. I want it done in the next five years. We can do it. After the time of testing comes a time of reflection and then of action." F) The fire, which had started at the base of the 93-metre spire(尖塔) at about 6:40 pm on Monday, spread through the cathedral''s roof, made up of hundreds of oak beams, some dating back to the 13th century. These beams, known as la forêt (the forest) because of their density, formed the cross-shaped roof that ran the length of the central part of the cathedral. As hundreds of tourists and Parisians stood and watched the flames leaping from the roof, there was shock and tears as the cathedral spire caught fire, burned and then collapsed into itself. G) A collection of dramatic videos and photos quickly spread across social media, showing the horrifying destruction, and attracting emotional responses from people all over the world. Indeed, within minutes the fire occupied headlines of every major global newspaper and television network. This is not surprising given Notre Dame Cathedral, meaning "Our Lady", is one of the most recognised symbols of the city of Paris attracting millions of tourists every year. H) While the world looked on, the 500 firefighters at the scene then battled to prevent the flames from reaching the two main towers, where the cathedral bells hang. If the wooden frame of the towers had caught fire, it could have sent the bells—the largest of which, the Emmanuel Bell, weighs 13 tons—crashing down, potentially causing the collapse of both towers. Police and fire services will spend the next 48 hours assessing the "security and safety" of the 850-year-old structure. Nunez said: "We have identified vulnerabilities throughout the structure, all of which still need securing." As a result, residents of five buildings around the northern side of the cathedral were being temporarily evacuated, he added. Architects have identified three main holes in the structure, in the locations of the spire, the main hall and the upper rooms to the north of the central aisle. Most of the wooden roof beams have been burned, and parts of the concrete holding up the roof have collapsed. I) The interior minister, Christophe Castaner, visited the cathedral on Tuesday afternoon to see the extent of the devastation. Ash covered the marble diamond-patterned floor and floated in large pools of grey water from the fire hoses. Behind a heap of blackened oak beams that lay piled up where they had fallen, daylight from vast holes in the cathedral roof lit a golden cross over a statue by Nicolas Coustou, which appeared to have escaped damage. Preliminary inspections also suggested the three ornate(装饰华丽的) stained glass "rose" windows appeared to have survived the fire, officials said. However, fire officers have said a complete inventory of the damage will not be possible until the cathedral structure has been deemed safe. J) The culture minister, Franck Riester, said religious relics saved from the cathedral were being securely held at the Hotel de Ville, and works of art that sustained smoke damage were being taken to the Louvre, the world''s largest art museum, where they would be dried out, repaired and stored. Sixteen copper statues that decorated the spire had been removed for restoration only a few days before the fire. Relics at the top of the spire are believed lost as the spire was destroyed. As well as damage from the heat, which firefighters said reached more than 800 ℃, experts also need to assess damage from the vast quantities of water firefighters poured into the cathedral. One casualty of this was The Great Organ constructed in the 1730s, which was said to have escaped the flames but been significantly damaged by water. K) French political commentators noted the devastating fire had succeeded where Macron had failed in uniting the country. But criticism over the original state of the building is likely to intensify over coming days. Leniaud told La Croix newspaper: "This is not about looking for people to blame. The responsibility is collective because this is the most loved monument in the country." Alexandre Gady, an art historian, agreed. "We''ve been saying for years that the budget for maintaining historic monuments is too low," Gady said. The Paris prosecutor''s office has opened an inquiry into "involuntary destruction by fire", indicating they believe the cause of the blaze was accidental rather than criminal.', NULL, NULL, 1204, 'IMPORT', 'cet6-2021-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-2-r2'
);
SET @pg_cet6_2021_06_2_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-2-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-r3', 'CAREFUL_READING', 'CET6', NULL, 'We often think of drawing as something that takes inborn talent, but this kind of thinking stems from our misclassification of drawing as, primarily, an art form rather than a tool for learning. Researchers, teachers, and artists are starting to see how drawing can positively impact a wide variety of skills and disciplines. Most of us have spent some time drawing before, but at some point, most of us stop drawing. There are people who don''t, obviously, and thank God for that: a world without designers and artists would be a very shabby one indeed. Some argue that so many adults have abandoned drawing because we''ve miscategorized it and given it a very narrow definition. In his book, Stick Figures: Drawing as a Human Practice, Professor D. B. Dowd argues that we have misfiled the significance of drawing because we see it as a professional skill instead of a personal capacity. We mistakenly think of "good" drawings as those which work as recreations of the real world, as realistic illusions. Rather, drawing should be recategorized as a symbolic tool. Human beings have been drawing for 73,000 years. It''s part of what it means to be human. We don''t have the strength of chimpanzees(大猩猩) because we''ve given up animal strength to manipulate subtle instruments, like hammers, spears, and—later—pens and pencils. The human hand is an extremely dense network of nerve endings. In many ways, human beings are built to draw. Some researchers argue that doodling(涂画) activates the brain''s so-called default circuit—essentially, the areas of the brain responsible for maintaining a baseline level of activity in the absence of other stimuli. Because of this, some believe that doodling during a boring lecture can help students pay attention. In one study, participants were asked to listen to a list of names while either doodling or sitting still. Those who doodled remembered 29 percent more of the names than those who did not. There''s also evidence that drawing talent is based on how accurately someone perceives the world. The human visual system tends to misjudge size, shape, color, and angles but artists perceive these qualities more accurately than non-artists. Cultivating drawing talent can become an essential tool to improve people''s observational skills in fields where the visual is important. Rather than think of drawing as a talent that some creative people are gifted in, we should consider it as a tool for seeing and understanding the world better—one that just so happens to double as an art form. Both absent-minded doodling and copying from life have been shown to positively affect your memory and visual perception, so complain loudly the next time your school board slashes the art department''s budget.', NULL, NULL, 446, 'IMPORT', 'cet6-2021-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-2-r3'
);
SET @pg_cet6_2021_06_2_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-2-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-r4', 'CAREFUL_READING', 'CET6', NULL, 'The car has reshaped our cities. It seems to offer autonomy for everyone. There is something almost delightful in the detachment from reality of advertisements showing mass-produced cars marketed as symbols of individuality and of freedom when most of their lives will be spent making short journeys on choked roads. For all the fuss made about top speeds, cornering ability and acceleration, the most useful gadgets on a modern car are those which work when you''re going very slowly: parking sensors, sound systems, and navigation apps which will show a way around upcoming traffic jams. This seems to be one of the few areas where the benefit of sharing personal information comes straight back to the sharer: because these apps know where almost all the users are, and how fast they are moving almost all the time, they can spot traffic congestion(堵塞) very quickly and suggest ways round it. The problem comes when everyone is using a navigation app which tells them to avoid everyone else using the same gadget. Traffic jams often appear where no one has enough information to avoid them. When a lucky few have access to the knowledge, they will benefit greatly. But when everyone has perfect information, traffic jams simply spread onto the side roads that seem to offer a way round them. This new congestion teaches us two things. The first is that the promises of technology will never be realised as fully as we hope; they will be limited by their unforeseen and unintended consequences. Sitting in a more comfortable car in a different traffic jam is pleasant but hardly the liberation that once seemed to be promised. The second is that self-organisation will not get us where we want to go. The efforts of millions of drivers to get ahead do not miraculously produce a situation in which everyone does better than before, but one in which almost everyone does rather worse. Central control and collective organisation can produce smoother and fairer outcomes, though even that much is never guaranteed. Similar limits can be foreseen for the much greater advances promised by self-driving cars. Last week, one operated by the taxi company Uber struck and killed a woman pushing her bicycle across a wide road in Arizona. This was the first recorded death involving a car which was supposed to be fully autonomous. Experts have said that it suggests a "catastrophic failure" of technology. Increasingly, even Silicon Valley has to acknowledge the costs of the intoxicating(令人陶醉的) hurry that characterises its culture. What traffic teaches us is that reckless and uncontrolled change is as likely to harm us as it is to benefit us, and that thoughtful regulation is necessary for a better future.', NULL, NULL, 451, 'IMPORT', 'cet6-2021-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-2-r4'
);
SET @pg_cet6_2021_06_2_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-2-r4' LIMIT 1);

-- 翻译 cet6-2021-06-2
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-translation'
);
SET @q_cet6_2021_06_2_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_01, '青海是中国西北部的一个省份，平均海拔3000米以上，大部分地区为高山和高原。青海省得名于全国最大的咸水湖青海湖。青海湖被誉为"中国最美的湖泊",是最受欢迎的旅游景点之一,也是摄影师和艺术家的天堂。青海山川壮丽,地大物博,石油和天然气储量丰富,省内许多城市的经济在石油和天然气工业带动下得到了长足发展。青海尤以水资源丰富而闻名,是中国三大河流长江、黄河和澜沧江的发源地,在中国的水生态中发挥着重要作用。', NULL, 'Qinghai is a province in northwest China, with an average elevation of over 3,000 meters, and most of its area is covered by mountains and plateaus. The province is named after Qinghai Lake, the largest saltwater lake in China. Qinghai Lake is praised as "the most beautiful lake in China". It is one of the most popular tourist attractions and a paradise for photographers and artists. Qinghai is blessed with magnificent mountains and rivers, a vast territory rich in natural resources, and abundant reserves of oil and natural gas. Driven by the oil and natural gas industry, the economy of many cities in the province has developed rapidly. Qinghai is especially famous for its abundant water resources. It is the source of China''s three major rivers, namely the Yangtze, the Yellow River and the Lancang River, playing an important role in China''s water ecology.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_01
);

-- 听力 Q1 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q01', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q01'
);
SET @q_cet6_2021_06_2_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_02, NULL, '{"A":"A) Weird.","B":"B) Efficient.","C":"C) Tolerant.","D":"D) Toxic."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_02
);

-- 听力 Q2 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q02', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q02'
);
SET @q_cet6_2021_06_2_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_03, NULL, '{"A":"A) They are arrogant.","B":"B) They are ignorant.","C":"C) They are ambitious.","D":"D) They are accommodating."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_03
);

-- 听力 Q3 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q03', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q03'
);
SET @q_cet6_2021_06_2_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_04, NULL, '{"A":"A) They can think big.","B":"B) They can air their views.","C":"C) They can break conventions.","D":"D) They can work flexible hours."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_04
);

-- 听力 Q4 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q04', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q04'
);
SET @q_cet6_2021_06_2_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_05, NULL, '{"A":"A) It can alter people''s mindsets.","B":"B) It can lead to new discoveries.","C":"C) It enables people to learn and grow.","D":"D) It is conducive to critical thinking."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_05
);

-- 听力 Q5 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q05', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q05'
);
SET @q_cet6_2021_06_2_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_06, NULL, '{"A":"A) He kept looking for the best place to stay.","B":"B) He met many tourists from other countries.","C":"C) He had a great time sightseeing and relaxing.","D":"D) He managed to visit a different city each day."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_06
);

-- 听力 Q6 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q06', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q06'
);
SET @q_cet6_2021_06_2_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_07, NULL, '{"A":"A) Prioritize what is essential to their best advantage.","B":"B) Stretch out the process in search of the optimal.","C":"C) Deliberate the consequences that may occur.","D":"D) Take all relevant factors into consideration."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_07
);

-- 听力 Q7 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q07', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q07'
);
SET @q_cet6_2021_06_2_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_08, NULL, '{"A":"A) Time pressure.","B":"B) Tight budget.","C":"C) Modern technology.","D":"D) Fierce competition."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q08', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q08'
);
SET @q_cet6_2021_06_2_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_09, NULL, '{"A":"A) Research as many different options as possible.","B":"B) Avoid going over the same options repeatedly.","C":"C) Focus on what is practical.","D":"D) Trust their gut instinct."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_09
);

-- 听力 Q9 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q09', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q09'
);
SET @q_cet6_2021_06_2_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_10, NULL, '{"A":"A) It is beneficial to poor as well as rich communities.","B":"B) It is conducive to children''s future development.","C":"C) It is welcome to parents but not to children.","D":"D) It is not of much help to younger children."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_10
);

-- 听力 Q10 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q10', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q10'
);
SET @q_cet6_2021_06_2_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_11, NULL, '{"A":"A) It may put some students in remote areas at a disadvantage.","B":"B) It gives the majority of students ready access to their teachers.","C":"C) It effectively improves the learning quality of students in rural areas.","D":"D) It can bridge the learning gap between kids of different backgrounds."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_11
);

-- 听力 Q11 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q11', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q11'
);
SET @q_cet6_2021_06_2_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_12, NULL, '{"A":"A) Diligent students tend to do their homework independently.","B":"B) The focus of homework should always be on school subjects.","C":"C) Doing homework exerts a positive effect on kids'' personality development.","D":"D) The benefits of doing homework vary widely from individual to individual."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_12
);

-- 听力 Q12 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q12', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q12'
);
SET @q_cet6_2021_06_2_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_13, NULL, '{"A":"A) It was something he apologized for later.","B":"B) It was ridiculed by the New York Times.","C":"C) It was a forty-nine-year plan.","D":"D) It was considered visionary."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_13
);

-- 听力 Q13 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q13', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q13'
);
SET @q_cet6_2021_06_2_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_14, NULL, '{"A":"A) It was of great significance to rocket science.","B":"B) It was completed in the state of New Mexico.","C":"C) It was somehow delayed about 12 minutes.","D":"D) It failed due to a sudden change of weather."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_14
);

-- 听力 Q14 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q14', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q14'
);
SET @q_cet6_2021_06_2_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_15, NULL, '{"A":"A) A laboratory and test range was already set up there.","B":"B) Its climate was ideal for year-round rocket launching.","C":"C) A weather expert invited him to go there for his mission.","D":"D) Its remote valleys were appealing to him and his family."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_15
);

-- 听力 Q15 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q15', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q15'
);
SET @q_cet6_2021_06_2_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_16, NULL, '{"A":"A) He won an award from the US government for his work.","B":"B) He gained recognition from rocket scientists worldwide.","C":"C) He was granted over 200 patents in rocket technology.","D":"D) He boosted the military strength of the United States."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_16
);

-- 听力 Q16 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q16', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q16'
);
SET @q_cet6_2021_06_2_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_17, NULL, '{"A":"A) It requires entrepreneurial experience.","B":"B) It is usually financially rewarding.","C":"C) It can be quite frustrating.","D":"D) It can be rather risky."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_17
);

-- 听力 Q17 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q17', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q17'
);
SET @q_cet6_2021_06_2_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_18, NULL, '{"A":"A) It contributes to rapid business expansion.","B":"B) It inspires willingness to make sacrifices.","C":"C) It reduces conflict among team members.","D":"D) It encourages creation and innovation."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_18
);

-- 听力 Q18 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q18', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q18'
);
SET @q_cet6_2021_06_2_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_19, NULL, '{"A":"A) They have unrealistic expectations.","B":"B) They often work without any pay.","C":"C) Few can find willing investors.","D":"D) Many are idealistic dreamers."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_19
);

-- 听力 Q19 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q19', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q19'
);
SET @q_cet6_2021_06_2_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_20, NULL, '{"A":"A) They have better dietary habits.","B":"B) They bear fewer social responsibilities.","C":"C) They are born with a stronger ability to socialize.","D":"D) They are better able to survive or handle disease."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_20
);

-- 听力 Q20 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q20', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q20'
);
SET @q_cet6_2021_06_2_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_21, NULL, '{"A":"A) They have a limited reproductive ability.","B":"B) They depend on adequate sleep to thrive.","C":"C) They keep dividing throughout one''s life.","D":"D) They strengthen with regular exercise."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_21
);

-- 听力 Q21 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q21', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q21'
);
SET @q_cet6_2021_06_2_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_22, NULL, '{"A":"A) The process of ageing can ultimately be brought under control.","B":"B) Improved health care for the elderly will contribute to longevity.","C":"C) Prevention of heart disease and stroke will increase life expectancy.","D":"D) The resolution of age-related diseases will solve the mystery of ageing."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_22
);

-- 听力 Q22 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q22', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q22'
);
SET @q_cet6_2021_06_2_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_23, NULL, '{"A":"A) They are reluctant to follow instructions.","B":"B) They fail to answer emails promptly.","C":"C) They cannot understand directives.","D":"D) They do not show due respect."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_23
);

-- 听力 Q23 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q23', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q23'
);
SET @q_cet6_2021_06_2_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_24, NULL, '{"A":"A) They have not been trained to follow the rules.","B":"B) They are not satisfied with the management.","C":"C) They want to avoid unnecessary losses.","D":"D) They find their voice go unheeded."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_24
);

-- 听力 Q24 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q24', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q24'
);
SET @q_cet6_2021_06_2_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_25, NULL, '{"A":"A) When they are on good terms with their managers.","B":"B) When they find their job goals easily attainable.","C":"C) When they find their supervisors helpful.","D":"D) When they are financially motivated."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_25
);

-- 听力 Q25 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q25', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q25'
);
SET @q_cet6_2021_06_2_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_26, NULL, '{"A":"A) They are a useless tool for managers to change employee behavior.","B":"B) They prove to be a good means for managers to give instructions.","C":"C) They should be reserved for urgent communication.","D":"D) They are seldom used for sharing confidential data."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q26'
);
SET @q_cet6_2021_06_2_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_27, NULL, '{"A":"A) abundance","B":"B) astonishment","C":"C) entailed","D":"D) envisaged","E":"E) equation","F":"F) expended","G":"G) feat","H":"H) fiscally","I":"I) impetus","J":"J) overhaul","K":"K) permanently","L":"L) plight","M":"M) prosper","N":"N) shatter","O":"O) ultimately"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q27'
);
SET @q_cet6_2021_06_2_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_28, NULL, '{"A":"A) abundance","B":"B) astonishment","C":"C) entailed","D":"D) envisaged","E":"E) equation","F":"F) expended","G":"G) feat","H":"H) fiscally","I":"I) impetus","J":"J) overhaul","K":"K) permanently","L":"L) plight","M":"M) prosper","N":"N) shatter","O":"O) ultimately"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q28'
);
SET @q_cet6_2021_06_2_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_29, NULL, '{"A":"A) abundance","B":"B) astonishment","C":"C) entailed","D":"D) envisaged","E":"E) equation","F":"F) expended","G":"G) feat","H":"H) fiscally","I":"I) impetus","J":"J) overhaul","K":"K) permanently","L":"L) plight","M":"M) prosper","N":"N) shatter","O":"O) ultimately"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q29'
);
SET @q_cet6_2021_06_2_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_30, NULL, '{"A":"A) abundance","B":"B) astonishment","C":"C) entailed","D":"D) envisaged","E":"E) equation","F":"F) expended","G":"G) feat","H":"H) fiscally","I":"I) impetus","J":"J) overhaul","K":"K) permanently","L":"L) plight","M":"M) prosper","N":"N) shatter","O":"O) ultimately"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q30'
);
SET @q_cet6_2021_06_2_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_31, NULL, '{"A":"A) abundance","B":"B) astonishment","C":"C) entailed","D":"D) envisaged","E":"E) equation","F":"F) expended","G":"G) feat","H":"H) fiscally","I":"I) impetus","J":"J) overhaul","K":"K) permanently","L":"L) plight","M":"M) prosper","N":"N) shatter","O":"O) ultimately"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q31'
);
SET @q_cet6_2021_06_2_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_32, NULL, '{"A":"A) abundance","B":"B) astonishment","C":"C) entailed","D":"D) envisaged","E":"E) equation","F":"F) expended","G":"G) feat","H":"H) fiscally","I":"I) impetus","J":"J) overhaul","K":"K) permanently","L":"L) plight","M":"M) prosper","N":"N) shatter","O":"O) ultimately"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q32'
);
SET @q_cet6_2021_06_2_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_33, NULL, '{"A":"A) abundance","B":"B) astonishment","C":"C) entailed","D":"D) envisaged","E":"E) equation","F":"F) expended","G":"G) feat","H":"H) fiscally","I":"I) impetus","J":"J) overhaul","K":"K) permanently","L":"L) plight","M":"M) prosper","N":"N) shatter","O":"O) ultimately"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q33'
);
SET @q_cet6_2021_06_2_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_34, NULL, '{"A":"A) abundance","B":"B) astonishment","C":"C) entailed","D":"D) envisaged","E":"E) equation","F":"F) expended","G":"G) feat","H":"H) fiscally","I":"I) impetus","J":"J) overhaul","K":"K) permanently","L":"L) plight","M":"M) prosper","N":"N) shatter","O":"O) ultimately"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q34'
);
SET @q_cet6_2021_06_2_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_35, NULL, '{"A":"A) abundance","B":"B) astonishment","C":"C) entailed","D":"D) envisaged","E":"E) equation","F":"F) expended","G":"G) feat","H":"H) fiscally","I":"I) impetus","J":"J) overhaul","K":"K) permanently","L":"L) plight","M":"M) prosper","N":"N) shatter","O":"O) ultimately"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q35'
);
SET @q_cet6_2021_06_2_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_36, NULL, '{"A":"A) abundance","B":"B) astonishment","C":"C) entailed","D":"D) envisaged","E":"E) equation","F":"F) expended","G":"G) feat","H":"H) fiscally","I":"I) impetus","J":"J) overhaul","K":"K) permanently","L":"L) plight","M":"M) prosper","N":"N) shatter","O":"O) ultimately"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q36'
);
SET @q_cet6_2021_06_2_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_37, 'The total amount of damage to Notre Dame Cathedral can be assessed only when its structure is considered safe.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q37'
);
SET @q_cet6_2021_06_2_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_38, 'Once again people began to argue whether Notre Dame Cathedral was going to collapse even without the fire.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q38'
);
SET @q_cet6_2021_06_2_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_39, 'The Notre Dame Cathedral catastrophe was said to have helped unite the French nation.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q39'
);
SET @q_cet6_2021_06_2_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_40, 'The roof of Notre Dame Cathedral was built with large numbers of densely laid-out wood beams.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q40'
);
SET @q_cet6_2021_06_2_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_41, 'Renovation workers of Notre Dame Cathedral were questioned to find out the cause of the accident.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q41'
);
SET @q_cet6_2021_06_2_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_42, 'Had the bell towers'' wooden frames burned down, the heavy bells would have crashed down.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q42'
);
SET @q_cet6_2021_06_2_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_43, 'The timely action of the firefighters prevented the fire from reaching the Cathedral''s bell towers.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q43'
);
SET @q_cet6_2021_06_2_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_44, 'Apart from the fire, the water used to extinguish it also caused a lot of damage to Notre Dame Cathedral.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q44'
);
SET @q_cet6_2021_06_2_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_45, 'There has been argument over the years as to who should pay for the restoration of Notre Dame Cathedral.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q45'
);
SET @q_cet6_2021_06_2_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_46, 'News of the Notre Dame Cathedral catastrophe instantly caught media attention throughout the world.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q46'
);
SET @q_cet6_2021_06_2_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_47, 'What do people generally think about drawing?', '{"A":"A) It is a gift creative people are endowed with.","B":"B) It is a skill that is acquired with practice.","C":"C) It is an art form that is appreciated by all.","D":"D) It is an ability everyone should cultivate."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q47'
);
SET @q_cet6_2021_06_2_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_48, 'What do we learn about designers and artists?', '{"A":"A) They are declining gradually in number.","B":"B) They are keen on changing shabby surroundings.","C":"C) They add beauty and charm to the world.","D":"D) They spend most of their lives drawing."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q48'
);
SET @q_cet6_2021_06_2_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_49, 'What does Professor D. B. Dowd argue in his book?', '{"A":"A) Everybody is born with the capacity to draw.","B":"B) Drawing is a skill that requires special training.","C":"C) The value of drawing tends to be overestimated.","D":"D) Drawing should be redefined as a realistic illusion."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q49'
);
SET @q_cet6_2021_06_2_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_50, 'What have some researchers found from one study about doodling?', '{"A":"A) It is a must for maintaining a base level of brain activity.","B":"B) It is the most reliable stimulant to activate the brain.","C":"C) It can turn something boring into something interesting.","D":"D) It helps improve concentration and memory."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q50'
);
SET @q_cet6_2021_06_2_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_51, 'What is characteristic of people with drawing talent?', '{"A":"A) Sensitivity to cognitive stimulation.","B":"B) Subtlety of representation.","C":"C) Accuracy in categorization.","D":"D) Precision in visual perception."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q51'
);
SET @q_cet6_2021_06_2_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_52, 'What does the author say about car advertisements?', '{"A":"A) They portray drivers who enjoy speed on the road.","B":"B) They present a false picture of the autonomy cars provide.","C":"C) They pursue individuality and originality in design concept.","D":"D) They overestimate the potential market of autonomous cars."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q52'
);
SET @q_cet6_2021_06_2_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_53, 'What does the author imply about the various gadgets on cars?', '{"A":"A) They can help to alleviate traffic jams.","B":"B) Most of them are as effective as advertised.","C":"C) Only some can be put to use under current traffic conditions.","D":"D) They are constantly upgraded to make driving easier and safer."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q53'
);
SET @q_cet6_2021_06_2_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_54, 'What does the author say about the use of navigation apps?', '{"A":"A) It is likely to create traffic jams in other places.","B":"B) It helps a great deal in easing traffic congestion.","C":"C) It sharply reduces the incidence of traffic accidents.","D":"D) It benefits those who are learning to drive."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q54'
);
SET @q_cet6_2021_06_2_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_55, 'What does the author say about technology?', '{"A":"A) Its consequences are usually difficult to assess.","B":"B) It seldom delivers all the benefits as promised.","C":"C) It depends on the required knowledge for application.","D":"D) Its benefits are guaranteed by collective wisdom."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-2-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q55'
);
SET @q_cet6_2021_06_2_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-2-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_2_56, 'What key message does the author try to convey in the passage?', '{"A":"A) The consequences of technological innovation need not be exaggerated.","B":"B) There is always a price to pay to develop technology for a better world.","C":"C) Technological innovation should be properly regulated.","D":"D) The culture of Silicon Valley ought not to be emulated."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_2_56
);

COMMIT;
