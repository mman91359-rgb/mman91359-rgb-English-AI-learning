-- 由 scripts/import-exam.mjs 自动生成，请勿手工修改。
-- 版本: V1.0.33
-- 生成时间: 2026-11-09T14:51:12.469Z
-- 目标库: exercise_db
-- 执行前必须按 docs/数据库迁移规范.md 预览、备份、审批。
-- 范围：正常套 + 仅借听力套（残卷留后）；听力无音频不写 listening_audio。

START TRANSACTION;

-- ==================== cet4-2023-12-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-r1', 'BANKED_CLOZE', 'CET4', NULL, 'Exercising for just 10 minutes a week is linked to a longer life, according to a new study published in The British Journal of Sports Medicine. Several recent studies have found that even low-intensity exercise, done for a short amount of time, can have a meaningful __26__ on health. Still, the idea that exercising for just 10 minutes a week may be enough to increase your lifespan is novel. It''s also somewhat __27__ , since the federal physical activity guidelines recommend getting at least 75 minutes of vigorous exercise or 150 minutes of __28__ exercise each week. The study was based on data from more than 88,000 U.S. adults who __29__ in the National Health Interview Survey between 1997 and 2008. Contrary to some research that has found an __30__ limit to the amount of exercise that is healthy, the researchers found that there was __31__ no limit to the longevity(长寿) benefits of exercise. Even the small group of people who got 10 times the amount of exercise recommended by the federal government had a 46% lower __32__ of death than the least active group. Still, observational studies like this one cannot prove cause and effect; they can only find __33__ . The researchers also were not able to __34__ for certain lifestyle factors that could affect lifespan, including dietary habits and changes in physical activity over time. Despite these __35__ , the study''s results are yet another indication of the power of physical activity, even in small amounts.', NULL, '["A) adjust","B) alter","C) approximately","D) controversial","E) coordinates","F) impact","G) limitations","H) moderate","I) participated","J) patterns","K) populated","L) risk","M) seemingly","N) type","O) upper"]', 249, 'IMPORT', 'cet4-2023-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-1-r1'
);
SET @pg_cet4_2023_12_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-r2', 'MATCHING', 'CET4', 'How Climate Change Will Affect What You Eat', 'A) Earlier this year, scientists warned that one in six animal species could go extinct(灭绝的) due to climate change. Could the same thing happen to our crops and other foodstuffs too? B) It''s clear that farmers in many parts of the world are going to find things harder in the coming decades. Last week, BBC Future explored one scientist''s efforts to help crops cope with the increased probability of droughts. By using the genes from resurrection(复活) plants, Jill Farrant of the University of Cape Town is exploring whether she can design crops to survive for much longer periods without water. C) But if we can''t find ways to protect other foods, will they survive climate change? Fortunately, there is some good news on this front. Despite alarmist headlines about "foods that are going extinct," there is no evidence that major food types like beans, chocolate, wine, corn or wheat will cease to exist. D) But that doesn''t mean it''s all good news for future food. We will probably have to change where we grow certain crops, as some regions get too hot. The disadvantage, obviously, is that local farmers will suffer under this situation. And some people may struggle to get the same access to certain foods. "Even if overall food production may be unaffected, food security can still be impacted," says Margaret Walsh, a scientist at the US Department of Agriculture''s Climate Change Program Office. In other words, even if a certain food is still grown on some corner of the Earth, it doesn''t mean that everyone will continue to have the same degree of access as today. E) Overall, the yields of many foods, from staples to life-enhancing extras such as coffee and chocolate, will likely be impacted by climate change too. How those decreases will be felt will depend on the degree of warming and the crop in question, but in general, "anything over about 30℃ is very bad for crops," says Wolfram Schlenker, an associate professor of international and public affairs at Columbia University. For example, statistical studies that he and a colleague built of corn and soybean(大豆) production in the US show a steep decline after crossing the 30℃ temperature threshold(临界点). F) In the US—the world''s largest producer of corn and soybeans—farms can move north to some degree, Schlenker says. But eventually, yields will likely suffer because the soil north of Iowa declines in quality—a legacy of glacial(冰川的) expansion. Other studies, including studies of wheat in India and corn in Africa, also found that there is a threshold above which yields sharply decline: crops can adapt and move, but only to a point. "What''s common to all studies is the finding that extreme heat is damaging to crop growth, although exact cutoffs vary by crop," Schlenker says. "If predictions for the end of the century are true, though, I think a lot of agricultural areas in the US will see significant hits." G) Under current conditions, about 4% of the world''s croplands experience drought in any given year, but by the end of the century those conditions are forecasted to jump to about 18% per year. Some studies indicate that horticulture crops—generally, everything besides staples—may be impacted most severely, largely because they tend to be confined to a smaller geographic area. Researcher Andrew Jarvis and his colleagues found that 80% of coffee-growing zones in Central America and Brazil could become unsuitable by 2050, for example, while climate change will likely have "great impacts" on cocoa(可可粉) production in West Africa. "High quality chocolate will be less available in the future, and if you want it, you''ll have to pay a lot more for it," Jarvis says. H) This means that, for those who can afford it, some foods will simply cost them more in the future. But for poorer people, those same price jumps will likely cause certain foods to go extinct from their diets. "The more you reduce, the shorter the supply, and the higher the price will jump," Schlenker says. I) Another potential climate change-induced problem is our dependence on commodity crops—wheat, soybeans, corn and rice—which currently provide humanity with 75% of its calories, either directly or indirectly through the animals we raise on those crops. Jarvis and his colleagues also found that, over the past five decades, the world has seen an increasing standardisation of diets; the foods we eat globally today are 36% more similar than they were in 1961. While this can be good news for the world''s poorest people who now consume more calories, protein and fat than in the past, homogeneity(同一性) and over-dependence on a handful of staples leave us vulnerable to threats such as drought, disease and pests—all of which are predicted to worsen in many parts of the world as a result of climate change. J) There are ways we could soften the coming blow to the global food supply, however. Like Farrant''s work with resurrection crops, a number of companies, organisations and researchers are aiming to create drought and temperature-resistant crops through genetic engineering and conventional breeding. For now, the jury is still out as to how successful those endeavours will be. "The people at Monsanto who I''ve talked to are much more optimistic that they''ll be able to engineer heat-tolerant crops," Schlenker says. "On the other hand, scientists at the USDA who I''ve spoken with are much more cautious." K) Until genetic engineering comes to fruition, other strategies might also help in some places, including applying more fertiliser, implementing better irrigation, using machinery that gets crops out of the field faster or installing storage facilities to delay spoilage. "Many places could benefit a great deal just by using technologies that already exist," Walsh says. "General farm management can go a long way toward easing changes." L) Finally, diversifying our diet away from heat-sensitive wheat, corn, rice and other crops could also help. "We''ve seen profound changes in the last decades in what we eat largely as a result of international trade, and I think that trend toward more diversification will continue," M Jarvis says. "Depending on a greater number of plant species creates a more vigorous and less risky food system—and one that provides a broader range of nutritional requirements."', NULL, NULL, 1035, 'IMPORT', 'cet4-2023-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-1-r2'
);
SET @pg_cet4_2023_12_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-r3', 'CAREFUL_READING', 'CET4', NULL, 'One of my bad habits is saying "busy" when people ask me how I''m doing. Sometimes it''s because I actually am busy, but other times it''s because that''s what I think I''m supposed to say. That''s what important people say. That''s what people who get promoted say. But working long hours doesn''t drive better results. Never taking a vacation won''t lead to a promotion. So why are we so proud to talk about how busy we are all the time? In 2016, researchers from Columbia, Harvard, and Georgetown conducted a study to figure it out. They found busy people are perceived to be of high status, and interestingly, these status attributions are heavily influenced by our own beliefs about social mobility. In other words, the more we believe that one has the opportunity for success based on hard work, the more we tend to think that people who skip leisure and work all the time are of higher standing. That''s why we feel like we have to appear busy, and there''s a real perception that if someone is knee-deep in meetings, emails, and stress, then they''re probably a big deal. This culture of busyness is making it hard for employees to find work-life balance. According to a recent study, one in five highly engaged employees is at risk of burnout(精疲力竭). Personally, I''m going to stop saying "busy" when people ask me how I am. It sounds self-righteous(自以为 是的) and sets the wrong tone. Phrases like "I have limited access to email" and "I''ll respond as soon as I get back" sound like you''re being held against your will from working as opposed to making the most of your time off. That''s why we recently launched the Out of Office Email Generator, a free tool you can use before your next long weekend or trip. You can share loud and proud that you won''t be checking email until you''re back. Managers need to think twice about emailing their teams on the weekend and talking about how busy they are. Leaders should take time off themselves and encourage employees to do the same.', NULL, NULL, 351, 'IMPORT', 'cet4-2023-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-1-r3'
);
SET @pg_cet4_2023_12_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-r4', 'CAREFUL_READING', 'CET4', NULL, 'Female employees consistently pay lower airfares than men do for the same flights because they tend to book earlier. We compared the airfare paid by employees in the same position within a company for the same class of travel and used a common statistical technique to account for other factors that might affect differences in airfares. We found that women paid on average $18 less per ticket than their male colleagues. Further investigation allowed us to conclude that this gap is largely explained by the fact that women tended to book earlier than men, 1.8 days on average. We wanted to determine what was causing these gender differences in booking business trips so we tested a variety of possible explanations, such as women choosing to plan ahead or male frequent travelers being inclined to book late. None of these explained away the gender gap, so we applied data collected from surveys that express consumer preferences that play a central role in economic decisions, such as patience and risk avoidance. We found that only the concept of "negative reciprocity"—in which an employee who feels unfairly treated engages in negative behaviors, such as spending their company''s money less carefully—explains these differences. The surveys showed men tend to exhibit more of these negative behaviors than women. This isn''t to say that all men engage in these behaviors—or that booking relatively late is a sign of abnormal behavior. It only means that the gender gap disappears when we plug in the negative reciprocity variable. Prior research on negative reciprocity among workers found that it can result in lower employee motivation, business performance and workplace morale(士气) and culture. Our results show another way these negative behaviors can manifest themselves, like in airline bookings, and add to evidence that women are less likely to engage in them. Companies spend significant sums of money on business travel. While that $18 difference per ticket may seem small, it adds up. Our analysis suggests early booking by women can translate into savings of $1 million a year for a large multinational company with 20,000 regular travelers.', NULL, NULL, 347, 'IMPORT', 'cet4-2023-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-1-r4'
);
SET @pg_cet4_2023_12_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-1-r4' LIMIT 1);

-- 翻译 cet4-2023-12-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-translation'
);
SET @q_cet4_2023_12_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_01, '中国政府十分重视人民的健康饮食(diet)。通过大力提倡健康饮食，人们对合理营养增进健康的重要性有了更加深刻的认识。"吃得安全、吃得营养、吃得健康"是人民对美好生活的基本需要，是提升人民幸福感的必然要求，也为食品产业的发展提供了新机遇。目前，各级政府都在采取多种举措确保人民饮食健康，推进健康中国的建设。', NULL, 'The Chinese government attaches great importance to people''s healthy diet. Through the vigorous promotion of a healthy diet, people have come to better understand the importance of balanced nutrition in improving health. Eating safely, nutritiously and healthily is a basic need of the people for a better life, an inevitable requirement for enhancing their sense of happiness, and also offers new opportunities for the development of the food industry. At present, governments at all levels are taking various measures to ensure people''s dietary health and promote the building of a Healthy China.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_01
);

-- 听力 Q1 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q01', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q01'
);
SET @q_cet4_2023_12_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_02, NULL, '{"A":"A) Their brains work in harmony.","B":"B) They are generally the same age.","C":"C) Their interests are quite similar.","D":"D) They have the same ethnic background."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_02
);

-- 听力 Q2 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q02', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q02'
);
SET @q_cet4_2023_12_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_03, NULL, '{"A":"A) It can be touching.","B":"B) It is hard to predict.","C":"C) It can work both ways.","D":"D) It resembles family ties."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_03
);

-- 听力 Q3 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q03', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q03'
);
SET @q_cet4_2023_12_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_04, NULL, '{"A":"A) Search for their half-brothers.","B":"B) Identify their biological fathers.","C":"C) Find out more about their ancestry.","D":"D) See whether they are actually related."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_04
);

-- 听力 Q4 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q04', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q04'
);
SET @q_cet4_2023_12_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_05, NULL, '{"A":"A) They were both given up for adoption.","B":"B) They were born to the same mother.","C":"C) They flew 737 airplanes as pilots.","D":"D) They were both 60 years of age."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_05
);

-- 听力 Q5 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q05', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q05'
);
SET @q_cet4_2023_12_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_06, NULL, '{"A":"A) One of his friends was caught littering.","B":"B) Other tourists refused to join in the cleanup.","C":"C) The beautiful beach was spoiled with lots of trash.","D":"D) The kilometer-long beach was practically deserted."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_06
);

-- 听力 Q6 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q06', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q06'
);
SET @q_cet4_2023_12_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_07, NULL, '{"A":"A) A passerby.","B":"B) A local woman.","C":"C) The beach authorities.","D":"D) One of the five tourists."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_07
);

-- 听力 Q7 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q07', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q07'
);
SET @q_cet4_2023_12_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_08, NULL, '{"A":"A) The tourists'' good deed was not noticed by the locals.","B":"B) Some natives were selling poor-quality food to tourists.","C":"C) The number of tourists to the beach is on a steady decline.","D":"D) It was tourists not natives who were cleaning up the beach."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q08', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q08'
);
SET @q_cet4_2023_12_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_09, NULL, '{"A":"A) He has to play football with workmates.","B":"B) He has got some books to read.","C":"C) He is going to visit a friend.","D":"D) He is physically unfit for it."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_09
);

-- 听力 Q9 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q09', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q09'
);
SET @q_cet4_2023_12_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_10, NULL, '{"A":"A) To teach kids about animal protection.","B":"B) To learn how popular zoos could be.","C":"C) To see some rare animals in cages.","D":"D) To give her little nephew a treat."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_10
);

-- 听力 Q10 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q10', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q10'
);
SET @q_cet4_2023_12_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_11, NULL, '{"A":"A) He enjoys excellent health.","B":"B) He is keen on extreme sports.","C":"C) He coaches tennis players every week.","D":"D) He spends most of his time in the gym."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_11
);

-- 听力 Q11 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q11', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q11'
);
SET @q_cet4_2023_12_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_12, NULL, '{"A":"A) Tending to his swollen ankle.","B":"B) Concentrating on reading.","C":"C) Writing three book reports.","D":"D) Planning Christmas celebrations."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_12
);

-- 听力 Q12 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q12', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q12'
);
SET @q_cet4_2023_12_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_13, NULL, '{"A":"A) It is being debated by hundreds of retirees.","B":"B) It is attracting many people''s attention.","C":"C) It partly records his own experience.","D":"D) It argues for postponing retirement."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_13
);

-- 听力 Q13 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q13', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q13'
);
SET @q_cet4_2023_12_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_14, NULL, '{"A":"A) One should foresee a financial crisis.","B":"B) One should trust financial planners, figures.","C":"C) One should have one million dollars to retire.","D":"D) One should start saving as early as possible."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_14
);

-- 听力 Q14 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q14', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q14'
);
SET @q_cet4_2023_12_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_15, NULL, '{"A":"A) It doesn''t need to be permanent.","B":"B) It shouldn''t be considered risky.","C":"C) It helps to reduce travel expenses.","D":"D) It is the way to quit a job one hates."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_15
);

-- 听力 Q15 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q15', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q15'
);
SET @q_cet4_2023_12_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_16, NULL, '{"A":"A) By keeping close contact with one''s employers.","B":"B) By retiring when one reaches sixty years old.","C":"C) By investing half of one''s monthly income.","D":"D) By following the counsel of financial planners."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_16
);

-- 听力 Q16 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q16', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q16'
);
SET @q_cet4_2023_12_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_17, NULL, '{"A":"A) They tended to be easily anticipated by those belonging to their own race.","B":"B) They tended to be arbitrarily judged by individuals of opposing groups.","C":"C) They were readily shared among members of the same social or racial group.","D":"D) They were influenced by the presence of someone from an outsider group."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_17
);

-- 听力 Q17 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q17', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q17'
);
SET @q_cet4_2023_12_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_18, NULL, '{"A":"A) When they tried to make a positive impression on the researchers.","B":"B) When an unknown student from another university was present.","C":"C) When an experimenter from the research team took notice.","D":"D) When they were offered both candy and fruit as a snack."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_18
);

-- 听力 Q18 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q18', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q18'
);
SET @q_cet4_2023_12_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_19, NULL, '{"A":"A) By advertising its social benefits.","B":"B) By teaching consumers diet strategies.","C":"C) By supporting struggling consumers.","D":"D) By maintaining its positive image."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_19
);

-- 听力 Q19 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q19', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q19'
);
SET @q_cet4_2023_12_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_20, NULL, '{"A":"A) The academic and learning issues struggling students encounter.","B":"B) The risk students face due to a history of mental health problems.","C":"C) The effect of interacting with therapy dogs on students under pressure.","D":"D) The work universities are doing to help students succeed academically"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_20
);

-- 听力 Q20 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q20', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q20'
);
SET @q_cet4_2023_12_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_21, NULL, '{"A":"A) Their communicative skills.","B":"B) Their executive functioning.","C":"C) Their academic networking.","D":"D) Their leadership capacities."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_21
);

-- 听力 Q21 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q21', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q21'
);
SET @q_cet4_2023_12_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_22, NULL, '{"A":"A) Rid students of their anxiety.","B":"B) Add to some students'' stress.","C":"C) Contribute little to typical students'' success.","D":"D) Help students with mental issues pull through."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_22
);

-- 听力 Q22 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q22', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q22'
);
SET @q_cet4_2023_12_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_23, NULL, '{"A":"A) Work hard and plan carefully.","B":"B) Attempt to succeed at any cost.","C":"C) Aim high and expect great results.","D":"D) Remain optimistic even in difficulty."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_23
);

-- 听力 Q23 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q23', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q23'
);
SET @q_cet4_2023_12_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_24, NULL, '{"A":"A) Regarding failure as something inevitable.","B":"B) Trying out innovative marketing strategies.","C":"C) Venturing into sectors never explored before.","D":"D) Being willing to experiment with novel ideas."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_24
);

-- 听力 Q24 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q24', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q24'
);
SET @q_cet4_2023_12_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_25, NULL, '{"A":"A) Expect future success so as to move forward.","B":"B) Learn from our failure and forge ahead.","C":"C) Distinguish between good and bad risks.","D":"D) Examine our strategies and find out weaknesses."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_25
);

-- 听力 Q25 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q25', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q25'
);
SET @q_cet4_2023_12_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_26, NULL, '{"A":"A) Fresher offers.","B":"B) Safer operation.","C":"C) More challenges.","D":"D) Less competition."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q26'
);
SET @q_cet4_2023_12_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_27, NULL, '{"A":"A) adjust","B":"B) alter","C":"C) approximately","D":"D) controversial","E":"E) coordinates","F":"F) impact","G":"G) limitations","H":"H) moderate","I":"I) participated","J":"J) patterns","K":"K) populated","L":"L) risk","M":"M) seemingly","N":"N) type","O":"O) upper"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q27'
);
SET @q_cet4_2023_12_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_28, NULL, '{"A":"A) adjust","B":"B) alter","C":"C) approximately","D":"D) controversial","E":"E) coordinates","F":"F) impact","G":"G) limitations","H":"H) moderate","I":"I) participated","J":"J) patterns","K":"K) populated","L":"L) risk","M":"M) seemingly","N":"N) type","O":"O) upper"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q28'
);
SET @q_cet4_2023_12_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_29, NULL, '{"A":"A) adjust","B":"B) alter","C":"C) approximately","D":"D) controversial","E":"E) coordinates","F":"F) impact","G":"G) limitations","H":"H) moderate","I":"I) participated","J":"J) patterns","K":"K) populated","L":"L) risk","M":"M) seemingly","N":"N) type","O":"O) upper"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q29'
);
SET @q_cet4_2023_12_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_30, NULL, '{"A":"A) adjust","B":"B) alter","C":"C) approximately","D":"D) controversial","E":"E) coordinates","F":"F) impact","G":"G) limitations","H":"H) moderate","I":"I) participated","J":"J) patterns","K":"K) populated","L":"L) risk","M":"M) seemingly","N":"N) type","O":"O) upper"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q30'
);
SET @q_cet4_2023_12_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_31, NULL, '{"A":"A) adjust","B":"B) alter","C":"C) approximately","D":"D) controversial","E":"E) coordinates","F":"F) impact","G":"G) limitations","H":"H) moderate","I":"I) participated","J":"J) patterns","K":"K) populated","L":"L) risk","M":"M) seemingly","N":"N) type","O":"O) upper"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q31'
);
SET @q_cet4_2023_12_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_32, NULL, '{"A":"A) adjust","B":"B) alter","C":"C) approximately","D":"D) controversial","E":"E) coordinates","F":"F) impact","G":"G) limitations","H":"H) moderate","I":"I) participated","J":"J) patterns","K":"K) populated","L":"L) risk","M":"M) seemingly","N":"N) type","O":"O) upper"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q32'
);
SET @q_cet4_2023_12_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_33, NULL, '{"A":"A) adjust","B":"B) alter","C":"C) approximately","D":"D) controversial","E":"E) coordinates","F":"F) impact","G":"G) limitations","H":"H) moderate","I":"I) participated","J":"J) patterns","K":"K) populated","L":"L) risk","M":"M) seemingly","N":"N) type","O":"O) upper"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q33'
);
SET @q_cet4_2023_12_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_34, NULL, '{"A":"A) adjust","B":"B) alter","C":"C) approximately","D":"D) controversial","E":"E) coordinates","F":"F) impact","G":"G) limitations","H":"H) moderate","I":"I) participated","J":"J) patterns","K":"K) populated","L":"L) risk","M":"M) seemingly","N":"N) type","O":"O) upper"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q34'
);
SET @q_cet4_2023_12_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_35, NULL, '{"A":"A) adjust","B":"B) alter","C":"C) approximately","D":"D) controversial","E":"E) coordinates","F":"F) impact","G":"G) limitations","H":"H) moderate","I":"I) participated","J":"J) patterns","K":"K) populated","L":"L) risk","M":"M) seemingly","N":"N) type","O":"O) upper"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q35'
);
SET @q_cet4_2023_12_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_36, NULL, '{"A":"A) adjust","B":"B) alter","C":"C) approximately","D":"D) controversial","E":"E) coordinates","F":"F) impact","G":"G) limitations","H":"H) moderate","I":"I) participated","J":"J) patterns","K":"K) populated","L":"L) risk","M":"M) seemingly","N":"N) type","O":"O) upper"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q36'
);
SET @q_cet4_2023_12_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_37, 'One consequence of climate change is that some people may not have adequate access to certain foods.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q37'
);
SET @q_cet4_2023_12_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_38, 'People around the world are eating foods more similar than what they used to eat.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q38'
);
SET @q_cet4_2023_12_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_39, 'A recent news report talked about scientific efforts to help crops survive droughts through genetic engineering.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q39'
);
SET @q_cet4_2023_12_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_40, 'It is predicted that climate change will affect the availability and price of quality chocolate.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q40'
);
SET @q_cet4_2023_12_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_41, 'People wonder if certain crops and foodstuffs could disappear like some animal species due to climate change.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q41'
);
SET @q_cet4_2023_12_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_42, 'Although farms in the US can move a bit northward, crop yields may decrease.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q42'
);
SET @q_cet4_2023_12_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_43, 'One possible solution to the food security problem is diversification of diet.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q43'
);
SET @q_cet4_2023_12_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_44, 'It remains unsettled whether the global food supply problem can be solved by creating heat-tolerant crops through genetic engineering.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q44'
);
SET @q_cet4_2023_12_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_45, 'Poor people may have to give up eating certain foods because of their high prices.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q45'
);
SET @q_cet4_2023_12_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_46, 'A number of existing farming technologies could be used to reduce the negative effect of climate change on food production.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q46'
);
SET @q_cet4_2023_12_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_47, 'What is a reason for the author to be in the habit of saying "busy" when asked how he is doing?', '{"A":"A) He just follows successful people''s example.","B":"B) He is actually proud to be fully occupied.","C":"C) He thinks everyone should be devoted to work.","D":"D) He believes busyness ensures accomplishments."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q47'
);
SET @q_cet4_2023_12_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_48, 'Why do we tend to think that busy people are of high status?', '{"A":"A) Our status can be attributed to our social mobility.","B":"B) We hold the belief that hard work leads to success.","C":"C) Our own opportunity for success never comes easily.","D":"D) We find few people of high status have time for leisure."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q48'
);
SET @q_cet4_2023_12_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_49, 'What do we learn about the culture of busyness from a recent study?', '{"A":"A) It places employees in endless meetings, emails and stress.","B":"B) It compels some 20% of employees to appear always busy.","C":"C) It distorts many employees'' belief of what a satisfying life is.","D":"D) It does much harm to many busy employees'' well-being."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q49'
);
SET @q_cet4_2023_12_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_50, 'What do such utterances as "I have limited access to email" sound like according to the author?', '{"A":"A) One is too busy to check all emails in time.","B":"B) One is opposed to the prevailing work culture.","C":"C) One is forced by circumstances to stop working.","D":"D) One is simply enjoying their time off work."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q50'
);
SET @q_cet4_2023_12_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_51, 'Why did the author and his colleagues launch the Out of Office Email Generator?', '{"A":"A) To enable busy employees to spend less time checking emails.","B":"B) To ensure employees as well as employers truly have time off.","C":"C) To stop managers from talking about how busy their teams usually are.","D":"D) To encourage both employers and employees to answer emails promptly."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q51'
);
SET @q_cet4_2023_12_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_52, 'What did the author''s team conclude about the gender difference in airfares from their further investigation?', '{"A":"A) It is largely attributed to women booking earlier than men.","B":"B) It is largely explained by women''s choosing cheaper flights.","C":"C) It is mainly accounted for by male employees'' readiness to pay more.","D":"D) It is due to the fact that women care more about their company''s money."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q52'
);
SET @q_cet4_2023_12_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_53, 'What did the researchers want to determine by testing a variety of possible explanations?', '{"A":"A) What made male frequent travelers book air tickets late.","B":"B) What caused women to plan ahead in booking business trips.","C":"C) What motivated women to book cheaper flights.","D":"D) What accounted for the gender gap in airfares."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q53'
);
SET @q_cet4_2023_12_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_54, 'What happened when the negative reciprocity variable was taken into account?', '{"A":"A) Both men and women were found to engage in negative behaviors.","B":"B) Neither men nor women viewed booking late as a bad behavior.","C":"C) The gender difference in airfare expenses no longer existed.","D":"D) The gender gap tended to narrow to a significant degree."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q54'
);
SET @q_cet4_2023_12_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_55, 'What did prior research on negative reciprocity among workers find?', '{"A":"A) It can do more harm to the workplace than to employees.","B":"B) It contributes to the male-female divide in the workplace.","C":"C) It proves to be counterproductive in a number of ways.","D":"D) It can result in increasing labor-management conflicts."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-1-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q55'
);
SET @q_cet4_2023_12_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_1_56, 'What does the author emphasize about their analysis in the last paragraph?', '{"A":"A) It can help companies increase their savings significantly.","B":"B) It can duly contribute to companies'' business performance.","C":"C) It can translate women''s booking practice into men''s behavior.","D":"D) It can enhance large multinational companies'' competitiveness."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_1_56
);

-- ==================== cet4-2023-12-2 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-r1', 'BANKED_CLOZE', 'CET4', NULL, 'A number of studies have looked at how family life can affect productivity and satisfaction in the workplace. However, there has been __26__ little research on the influence of leisure activities. So Ciara Kelly and colleagues recruited 129 hobbyists to look at how the time spent on their hobbies __27__ their work life. The researchers found that when participants spent longer than __28__ on their leisure activity, their belief in their ability to perform their job was strengthened. But this was only the __29__ when they had a serious hobby that was dissimilar to their job, or when their hobby was similar to their work but they only did it __30__ . When their hobby was both serious and similar to their job, then spending more time on it actually decreased their work __31__ . Why might that be? To maintain a serious hobby, people need to invest significant psychological resources, say the authors—so if the activity has the same kinds of demands as their work, they may be left __32__ and unable to perform well at their job. But if their hobby is quite different from their career, it may not __33__ in the same way but instead help them develop other knowledge and skills that can __34__ their confidence at work. "Consider a scientist who is a keen rock climber," says Kelly. "Since climbing is so far __35__ from their day-to-day work activities, they can still recover from the demands of their job with plenty of resources."', NULL, '["A) boost","B) case","C) casually","D) efficiency","E) estate","F) exhausted","G) faculty","H) interfere","I) normal","J) prevalent","K) relative","L) removed","M) scratch","N) shaped","O) surprisingly"]', 249, 'IMPORT', 'cet4-2023-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-2-r1'
);
SET @pg_cet4_2023_12_2_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-2-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-r2', 'MATCHING', 'CET4', 'More fathers are taking paternity leave, but mothers are still doing all the work', 'A) Attitudes towards paternity leave(陪产假) have drastically changed in America in the last five years as more fathers feel comfortable taking extended time off, but gender bias persists when it comes to career prospects and the home, according to a new study of working parents. B) Research by the Boston College Center for Work & Family, which surveyed new parents at four large US companies who were qualified for taking at least six weeks paid parental leave, found that 81% of the 1,240 employees surveyed said the notion of fathers taking leave has become more acceptable. C) Of those surveyed, 62% of fathers took the maximum amount of time off compared to 93% of mothers, and around three-quarters of workers said their employer was equally supportive of mothers and fathers taking parental leave and over half said leave policies had made workplace culture better. D) The US is one of only three countries in the world not to offer statutory(法定的) paid leave, but increasingly states and companies are starting to take up the issue. So far, eight states and the District of Columbia have their own paid family leave laws. E) Brad Harrington, executive director of the center and lead author of the study, estimates only 20% to 30% of companies in the US offer paid parental leave. He feels the research findings reflect an obvious change in corporate attitudes to new fathers taking time off. F) "We did a study on paternity leave five years ago. Compared with those findings, these numbers were shocking to me. I did not expect 80% of people to say the organisation finds dads taking this leave acceptable and three-quarters to say it''s equally supportive of women and men taking leave," Harrington said. G) The previous study found that nearly three-quarters of fathers saw two to four weeks as an appropriate duration for paternity leave and 76% said they would prefer not to take all their time off at once. H) Since then, there have been a number of legal cases against companies involving paternity leave—including cases against JPMorgan Chase and Estee Lauder—which have helped put pressure on companies to make their parental leave policies gender neutral. I) However, the study also shows how traditional gender roles endure both at work, where more women than men reported changes in their perceived career potential, and at home—even among workers who claim to have a strong desire for equality. J) The vast majority of men, 97%, said one of the top reasons to take leave was to share caregiving with their partner. But when they were asked about how caregiving and household tasks were divided, their answers painted a different picture. While about 75% of employees said both genders should give the same amount of care, the majority of men and nearly half of women admitted that in reality the female actually did most of it. A tiny fraction, 2%, of men said they did more of the childcare. K) Men and women''s experiences of the return to work following parental leave were also considerably different. Of the women surveyed, 32% reported a downturn in their job satisfaction, while 14% said it increased. In comparison, 17% of men said their job satisfaction went down and 20% said it went up. Meanwhile, more women reported an increase in their responsibilities and manager expectations after childbirth. Half of the women said they used flexible work arrangements after becoming a parent, while just 27% of men did. Similar percentages of men and women said they enjoyed their careers and that it gave them a sense of achievement, while around half of women and 44% of men said it was a key part of their identity. L) On the subject of career advancement, 59% of women and 49% of men said leave could be limiting and both genders said they feared it would have an impact on their progress long-term. But on opportunity for promotion, more than double the number of women, 30% compared with 15% of men, believed their chances to be lower after becoming a parent. Despite progress, the struggle for women to reach the highest positions of power is demonstrated in this year''s Fortune 500 list, which featured a record 33 female CEOs, but this still represents a tiny fraction of the total. M) Harrington said culture change depends on companies putting more focus on men and their responsibilities. "By that I mean companies need to give men paternity leave and encourage men to take time off to be with their kids early on in the kids'' life. They also need to recognise that men have to make significant adjustments when they become parents. Companies cannot do all these things to enhance women''s advancement and then turn around and say, ''Oh, but we don''t expect the men to take over for the women at home.''" N) In May, the American Civil Liberties Union (ACLU) and Outten & Golden LLP announced a historic class- action $5m settlement with JPMorgan Chase on behalf of male employees who claim they were illegally denied access to paid parental leave. Derek Rotondo, 35, filed the discrimination charge against his company after he was allegedly told by his HR department that mothers were considered primary caregivers. Thus, they were allowed to take 16 weeks of paid parental leave. Fathers, however, could take just two weeks. O) The father of two from Columbus, Ohio, who still works at the company as an associate and investigator, said he has witnessed a "domino effect(多米诺效应)" across companies since the settlement, but that there is still substantial progress to be made towards changing attitudes towards paternity leave. P) "I do think there''s still some way to go…there''s still going to be sort of the unstated expectation for new dads to essentially come right back to work, but I think the research is showing that''s starting to change." He said equal parental leave is an essential component to creating gender equality in the workplace. "The old standard of women staying home, having babies and cooking doesn''t apply and hasn''t applied for a long time."', NULL, NULL, 1015, 'IMPORT', 'cet4-2023-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-2-r2'
);
SET @pg_cet4_2023_12_2_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-2-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-r3', 'CAREFUL_READING', 'CET4', NULL, 'Having a rival can keep you committed to achieving your goals and enhance your overall performance. But before you go out and find an entrepreneur to outcompete, it''s important to understand and avoid the traps that often come with rivalry. After all, competitive rivalry can also hinder effective decision-making and increase your willingness to take risks, behaviors that can ultimately hurt your venture''s success. Finding someone you''re committed to outcompeting can be a great way to stay focused on your goals and push your venture to the next level. But when you''re intently focused on outperforming your rivals, you may begin to develop a "win-at-all-costs" mentality that causes you to ignore how you achieve success. One group of researchers, for example, examined the link between rivalry and unethical behavior. They found that when people compete against their rivals, they are more willing to behave unethically to win. But such behavior may stain your reputation and strain relationships important to your success. One way to avoid this trap is to stop and reflect on what''s important. While outperforming your rivals may provide short-term benefits, the loss of your integrity will have long-term consequences. One reason having a rival can enhance your venture''s performance is that it creates a level of excitement that drives you to work harder. But this eagerness to win may also hurt your venture''s success, particularly when it causes you to make impulsive, insensible decisions. But it''s possible to avoid such costly mistakes by making a habit of engaging in critical thinking, such as considering opposing viewpoints and conducting cost-benefit analyses, especially for those decisions that are complex and can determine the future of your venture. The sense of eagerness that comes with having a rival can not only cause you to make poorer decisions, but it can also lead you to take greater risks that put your venture in peril. One way you can overcome the risk- inducing effects of rivalry that stand to endanger your venture''s success is to remain attentive to your emotional state and actively monitor how such feelings are affecting your decision-making.', NULL, NULL, 349, 'IMPORT', 'cet4-2023-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-2-r3'
);
SET @pg_cet4_2023_12_2_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-2-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-r4', 'CAREFUL_READING', 'CET4', NULL, 'A multitasker is one who can perform two or more tasks effectively at the same time, which—apart from the obvious differences—is similar to what a computer does. The concept does indeed come from the realms of technology, where it is used to refer to an operating system that can execute multiple tasks at the same time. However, the question is: can a person really be a multitasker? For most scientists, the answer is no. So much so that, according to experts in neuroscience(神经系统科学), our brains do not handle multitasking situations well. As soon as two tasks require our attention, productivity suffers. What we call multitasking, therefore, is in reality the ability to move more or less quickly from one task to another. This requires two essential conditions: that one of the tasks needs to be automatic, like walking or eating, and that they both need different mental processes. Answering the phone and writing at the same time, for example. However, on the other side of the coin there are people who maintain that it is possible to be, or at least seem to be, multitasking. A recent study concluded that regardless of whether people are actually handling several tasks or not, the mere fact that they perceive this activity as multitasking has a positive effect on their performance. The business perspective offers a different view: multitasking is understood as the ability to adapt to all types of environment within a company and effectively undertake different activities within a set time frame. Indeed, many companies look for people who are skilled in multitasking to improve their productivity. From this different perspective, you can not only be multitasking but this ability can also be taught: something that is easier in fluid organisations, which favour flexibility in their working practices. The benefits of multitasking are clear. Being quicker and more efficient increases our performance and the number of tasks completed. But having to pay attention to several things at once means that the powers of concentration are reduced and that can lead to more mistakes.', NULL, NULL, 342, 'IMPORT', 'cet4-2023-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-2-r4'
);
SET @pg_cet4_2023_12_2_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-2-r4' LIMIT 1);

-- 翻译 cet4-2023-12-2
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-translation'
);
SET @q_cet4_2023_12_2_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_01, '改革开放以来，中国人的饮食(diet)发生了显著变化。过去由于经济落后，食品种类有限、数量不足 ，人们仅仅满足于吃得饱。如今中国经济快速发展，食品不仅更加丰富多样，质量也大幅提高。随着生活水平不断提升，人们对饮食的要求越来越高，更加注重吃得营养健康。因此，目前市场上推出的低脂、低糖、有机食品受到人们的普遍欢迎。', NULL, 'Since the reform and opening-up, the diet of Chinese people has undergone significant changes. In the past, due to the backward economy, food was limited in variety and insufficient in quantity, so people were content with merely having enough to eat. Today, with China''s economy developing rapidly, food is not only more abundant and diverse but also greatly improved in quality. As living standards keep rising, people have increasingly higher demands for their diet and pay more attention to eating in a nutritious and healthy way. Therefore, the low-fat, low-sugar and organic food launched on the market today is widely welcomed by people.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_01
);

-- 听力 Q1 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q01', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q01'
);
SET @q_cet4_2023_12_2_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_02, NULL, '{"A":"A) He noticed the driver was too young to drive.","B":"B) He found there was no one sitting at the wheel. driver.","C":"C) He thought something must be wrong with the","D":"D) He saw the driver changing lanes much too frequently."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_02
);

-- 听力 Q2 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q02', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q02'
);
SET @q_cet4_2023_12_2_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_03, NULL, '{"A":"A) Buy a sports car.","B":"B) Drive across town.","C":"C) Leave California.","D":"D) Visit his sister."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_03
);

-- 听力 Q3 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q03', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q03'
);
SET @q_cet4_2023_12_2_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_04, NULL, '{"A":"A) How they change the way we shop.","B":"B) How they alter human skeletons.","C":"C) How they cause increased headaches.","D":"D) How they affect our communication."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_04
);

-- 听力 Q4 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q04', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q04'
);
SET @q_cet4_2023_12_2_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_05, NULL, '{"A":"A) It loosens.","B":"B) It brightens.","C":"C) It hardens.","D":"D) It softens."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_05
);

-- 听力 Q5 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q05', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q05'
);
SET @q_cet4_2023_12_2_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_06, NULL, '{"A":"A) Create Internet pages for him.","B":"B) Ask a local pet shop to adopt him.","C":"C) Name an orange tree after him.","D":"D) Hold a birthday party for him."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_06
);

-- 听力 Q6 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q06', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q06'
);
SET @q_cet4_2023_12_2_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_07, NULL, '{"A":"A) He is a bold and aggressive pet.","B":"B) He pays regular visits to village shops.","C":"C) He once bit a doctor''s receptionist.","D":"D) He likes to sit on the hairdresser''s chair."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_07
);

-- 听力 Q7 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q07', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q07'
);
SET @q_cet4_2023_12_2_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_08, NULL, '{"A":"A) He is fond of luxury cat food.","B":"B) He likes to stay in villagers'' houses.","C":"C) He knows everybody in the village.","D":"D) He often seeks food around her pub."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q08', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q08'
);
SET @q_cet4_2023_12_2_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_09, NULL, '{"A":"A) Who to order the food.","B":"B) Whether to have sandwiches.","C":"C) When to go for their meal.","D":"D) Where to have their lunch."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_09
);

-- 听力 Q9 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q09', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q09'
);
SET @q_cet4_2023_12_2_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_10, NULL, '{"A":"A) In the shopping center nearby.","B":"B) In the expensive Italian style diner.","C":"C) At the Sandwich Place on Camden Street.","D":"D) At the American restaurant they frequent."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_10
);

-- 听力 Q10 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q10', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q10'
);
SET @q_cet4_2023_12_2_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_11, NULL, '{"A":"A) There is to be a conference call.","B":"B) She has to meet with her boss then.","C":"C) There will be crowds of people waiting for her.","D":"D) She will have a photo taken with Brigette Clark."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_11
);

-- 听力 Q11 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q11', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q11'
);
SET @q_cet4_2023_12_2_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_12, NULL, '{"A":"A) She doesn''t deem homemade soup tasty.","B":"B) She doesn''t think his wife cooks well.","C":"C) She feels Jeremy would rather dine out.","D":"D) She has found the soup smells terrible."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_12
);

-- 听力 Q12 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q12', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q12'
);
SET @q_cet4_2023_12_2_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_13, NULL, '{"A":"A) A landlady.","B":"B) A waitress.","C":"C) A receptionist.","D":"D) A saleswoman."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_13
);

-- 听力 Q13 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q13', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q13'
);
SET @q_cet4_2023_12_2_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_14, NULL, '{"A":"A) He was involved in a terrible car accident last","B":"B) He has much difficulty getting up and down stairs.","C":"C) He is expected to undergo a knee operation. April.","D":"D) He prefers to stay next door to the children."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_14
);

-- 听力 Q14 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q14', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q14'
);
SET @q_cet4_2023_12_2_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_15, NULL, '{"A":"A) To please his parents-in-law.","B":"B) To find the best trip for his kids.","C":"C) To satisfy his curiosity.","D":"D) To compare prices."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_15
);

-- 听力 Q15 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q15', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q15'
);
SET @q_cet4_2023_12_2_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_16, NULL, '{"A":"A) Visit a local art gallery.","B":"B) Go on a boat trip.","C":"C) Take some photos of the islands.","D":"D) Try her hand-made clothing."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_16
);

-- 听力 Q16 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q16', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q16'
);
SET @q_cet4_2023_12_2_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_17, NULL, '{"A":"A) They are more intelligent than many of us.","B":"B) They have already become our new friends.","C":"C) They have begun to affect our social behavior.","D":"D) They play increasingly more important roles."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_17
);

-- 听力 Q17 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q17', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q17'
);
SET @q_cet4_2023_12_2_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_18, NULL, '{"A":"A) Whether it might have any effect on the way we negotiate.","B":"B) Whether it might actually outperform human negotiators.","C":"C) Whether it can facilitate business transactions.","D":"D) Whether it can speed up legal procedures."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_18
);

-- 听力 Q18 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q18', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q18'
);
SET @q_cet4_2023_12_2_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_19, NULL, '{"A":"A) Choose to be tough.","B":"B) Sympathize with their opponent.","C":"C) Use deceptive strategies.","D":"D) Appear to be pleasant."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_19
);

-- 听力 Q19 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q19', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q19'
);
SET @q_cet4_2023_12_2_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_20, NULL, '{"A":"A) They were perceived differently by some academics.","B":"B) They still existed six months after the course ended.","C":"C) They varied greatly among the course participants.","D":"D) They were only measurable within seven weeks."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_20
);

-- 听力 Q20 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q20', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q20'
);
SET @q_cet4_2023_12_2_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_21, NULL, '{"A":"A) They can be easily seen among participants in a healthy weight range.","B":"B) They should be attributed to participants'' change in diet behaviors.","C":"C) They are linked to cooking confidence and cooking satisfaction.","D":"D) They actually result from eating more fruits and vegetables."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_21
);

-- 听力 Q21 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q21', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q21'
);
SET @q_cet4_2023_12_2_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_22, NULL, '{"A":"A) Gender.","B":"B) Confidence.","C":"C) Health.","D":"D) Practice."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_22
);

-- 听力 Q22 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q22', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q22'
);
SET @q_cet4_2023_12_2_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_23, NULL, '{"A":"A) It keeps others away.","B":"B) It causes discomfort.","C":"C) It remains visible.","D":"D) It varies in size."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_23
);

-- 听力 Q23 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q23', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q23'
);
SET @q_cet4_2023_12_2_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_24, NULL, '{"A":"A) It makes us feel uncomfortable.","B":"B) It renders the acquaintance a stranger.","C":"C) It brings the acquaintance closer to us.","D":"D) It causes the bubble around us to vanish."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_24
);

-- 听力 Q24 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q24', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q24'
);
SET @q_cet4_2023_12_2_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_25, NULL, '{"A":"A) In personal space.","B":"B) In social space.","C":"C) Within a distance of 18 inches.","D":"D) Over 2 feet away from one another."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_25
);

-- 听力 Q25 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q25', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q25'
);
SET @q_cet4_2023_12_2_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_26, NULL, '{"A":"A) When we begin to feel fear.","B":"B) When we develop a sense of space.","C":"C) When we are 3 or 4 years old.","D":"D) When we enter our teens."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q26'
);
SET @q_cet4_2023_12_2_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_27, NULL, '{"A":"A) boost","B":"B) case","C":"C) casually","D":"D) efficiency","E":"E) estate","F":"F) exhausted","G":"G) faculty","H":"H) interfere","I":"I) normal","J":"J) prevalent","K":"K) relative","L":"L) removed","M":"M) scratch","N":"N) shaped","O":"O) surprisingly"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q27'
);
SET @q_cet4_2023_12_2_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_28, NULL, '{"A":"A) boost","B":"B) case","C":"C) casually","D":"D) efficiency","E":"E) estate","F":"F) exhausted","G":"G) faculty","H":"H) interfere","I":"I) normal","J":"J) prevalent","K":"K) relative","L":"L) removed","M":"M) scratch","N":"N) shaped","O":"O) surprisingly"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q28'
);
SET @q_cet4_2023_12_2_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_29, NULL, '{"A":"A) boost","B":"B) case","C":"C) casually","D":"D) efficiency","E":"E) estate","F":"F) exhausted","G":"G) faculty","H":"H) interfere","I":"I) normal","J":"J) prevalent","K":"K) relative","L":"L) removed","M":"M) scratch","N":"N) shaped","O":"O) surprisingly"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q29'
);
SET @q_cet4_2023_12_2_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_30, NULL, '{"A":"A) boost","B":"B) case","C":"C) casually","D":"D) efficiency","E":"E) estate","F":"F) exhausted","G":"G) faculty","H":"H) interfere","I":"I) normal","J":"J) prevalent","K":"K) relative","L":"L) removed","M":"M) scratch","N":"N) shaped","O":"O) surprisingly"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q30'
);
SET @q_cet4_2023_12_2_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_31, NULL, '{"A":"A) boost","B":"B) case","C":"C) casually","D":"D) efficiency","E":"E) estate","F":"F) exhausted","G":"G) faculty","H":"H) interfere","I":"I) normal","J":"J) prevalent","K":"K) relative","L":"L) removed","M":"M) scratch","N":"N) shaped","O":"O) surprisingly"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q31'
);
SET @q_cet4_2023_12_2_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_32, NULL, '{"A":"A) boost","B":"B) case","C":"C) casually","D":"D) efficiency","E":"E) estate","F":"F) exhausted","G":"G) faculty","H":"H) interfere","I":"I) normal","J":"J) prevalent","K":"K) relative","L":"L) removed","M":"M) scratch","N":"N) shaped","O":"O) surprisingly"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q32'
);
SET @q_cet4_2023_12_2_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_33, NULL, '{"A":"A) boost","B":"B) case","C":"C) casually","D":"D) efficiency","E":"E) estate","F":"F) exhausted","G":"G) faculty","H":"H) interfere","I":"I) normal","J":"J) prevalent","K":"K) relative","L":"L) removed","M":"M) scratch","N":"N) shaped","O":"O) surprisingly"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q33'
);
SET @q_cet4_2023_12_2_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_34, NULL, '{"A":"A) boost","B":"B) case","C":"C) casually","D":"D) efficiency","E":"E) estate","F":"F) exhausted","G":"G) faculty","H":"H) interfere","I":"I) normal","J":"J) prevalent","K":"K) relative","L":"L) removed","M":"M) scratch","N":"N) shaped","O":"O) surprisingly"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q34'
);
SET @q_cet4_2023_12_2_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_35, NULL, '{"A":"A) boost","B":"B) case","C":"C) casually","D":"D) efficiency","E":"E) estate","F":"F) exhausted","G":"G) faculty","H":"H) interfere","I":"I) normal","J":"J) prevalent","K":"K) relative","L":"L) removed","M":"M) scratch","N":"N) shaped","O":"O) surprisingly"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q35'
);
SET @q_cet4_2023_12_2_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_36, NULL, '{"A":"A) boost","B":"B) case","C":"C) casually","D":"D) efficiency","E":"E) estate","F":"F) exhausted","G":"G) faculty","H":"H) interfere","I":"I) normal","J":"J) prevalent","K":"K) relative","L":"L) removed","M":"M) scratch","N":"N) shaped","O":"O) surprisingly"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q36'
);
SET @q_cet4_2023_12_2_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_37, 'In the absence of Federal legislation, some states in the US have passed laws concerning paid family leave.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q37'
);
SET @q_cet4_2023_12_2_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_38, 'Most fathers admitted that even during their paternity leave they actually did much less childcare than the mother.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q38'
);
SET @q_cet4_2023_12_2_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_39, 'According to one father, equal parental leave is indispensable to achieving gender equality in the workplace.', NULL, 'P', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q39'
);
SET @q_cet4_2023_12_2_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_40, 'One survey indicated there is now less objection to paternity leave.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q40'
);
SET @q_cet4_2023_12_2_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_41, 'Compared to five years ago, according to one researcher, many more people said their organisation gave the same support to men and women taking parental leave.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q41'
);
SET @q_cet4_2023_12_2_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_42, 'One study finds that even workers who claim to desire gender equality stick to traditional gender roles both at work and at home.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q42'
);
SET @q_cet4_2023_12_2_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_43, 'The majority of workers surveyed said parental leave policies had improved workplace culture.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q43'
);
SET @q_cet4_2023_12_2_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_44, 'In spite of progress, the number of women in top positions of big companies remains extremely small.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q44'
);
SET @q_cet4_2023_12_2_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_45, 'According to one estimate, less than one third of companies in the US provide paid parental leave.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q45'
);
SET @q_cet4_2023_12_2_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_46, 'A number of lawsuits have pressured companies to formulate gender neutral policies on parental leave.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q46'
);
SET @q_cet4_2023_12_2_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_47, 'How can competitive rivalry benefit entrepreneurs according to the passage?', '{"A":"A) By enabling them to outcompete other entrepreneurs.","B":"B) By enabling them to make their venture a success.","C":"C) By helping them to reach long-term goals.","D":"D) By helping them to stay goal-oriented."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q47'
);
SET @q_cet4_2023_12_2_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_48, 'What is one of the traps entrepreneurs may often fall into when competing with rivals?', '{"A":"A) They may adopt strategies that are bound to ruin their venture.","B":"B) They may resort to unethical means to outperform their rivals.","C":"C) They may be too eager to succeed while ignoring the huge labor cost.","D":"D) They may be intently focused on winning at the current market level."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q48'
);
SET @q_cet4_2023_12_2_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_49, 'What are entrepreneurs advised to do to avoid traps that often accompany rivalry?', '{"A":"A) Deliberate on what really matters.","B":"B) Prioritize reaping immediate benefits.","C":"C) Estimate the long-term consequences.","D":"D) Reflect on what successes are achievable."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q49'
);
SET @q_cet4_2023_12_2_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_50, 'How can entrepreneurs avoid making impulsive and insensible decisions?', '{"A":"A) By engaging themselves in critical reasoning.","B":"B) By developing a habit of keeping their integrity.","C":"C) By criticizing themselves for previous poor performances.","D":"D) By refraining from being too excited about their successes."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q50'
);
SET @q_cet4_2023_12_2_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_51, 'How can entrepreneurs overcome the risk-inducing effects of rivalry?', '{"A":"A) By paying close attention to their current performance.","B":"B) By taking steps that stand to endanger their rivals'' success.","C":"C) By monitoring how their decision-making impacts their mentality.","D":"D) By keeping their emotions in check to avoid making poor decisions."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q51'
);
SET @q_cet4_2023_12_2_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_52, 'What does a "multitasker" originally refer to?', '{"A":"A) An operating system capable of doing several tasks at once.","B":"B) A skilled worker executing more than one task at the same time.","C":"C) A sophisticated technology doing several tasks effectively at once.","D":"D) An efficient person able to perform multiple tasks at the same time."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q52'
);
SET @q_cet4_2023_12_2_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_53, 'Why can''t people really be multitaskers according to neuroscientists?', '{"A":"A) They are not sufficiently exposed to multitasking situations.","B":"B) They are not comparable to mechanical operating systems.","C":"C) Their brains do not allow them to multitask.","D":"D) Their attention span cannot be expanded."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q53'
);
SET @q_cet4_2023_12_2_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_54, 'What do we learn from the conclusion of a recent study on multitasking?', '{"A":"A) People make greater achievements by maintaining whatever they are doing is multitasking.","B":"B) People''s performance benefits from the perception of what they are doing as multitasking.","C":"C) People''s active mental processes exert a positive effect on their multitasking.","D":"D) People can improve their capabilities by handling multitasking situations."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q54'
);
SET @q_cet4_2023_12_2_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_55, 'How does the business world view multitasking?', '{"A":"A) It is a rare skill often found in fluid organisations.","B":"B) It is an adaptable capability required of all workers.","C":"C) It is an essential quality many employees lack.","D":"D) It is a desirable ability that can be developed."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-2-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q55'
);
SET @q_cet4_2023_12_2_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-2-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_2_56, 'What does the author imply we should do if we have to focus on some task and do it well?', '{"A":"A) Work in a flexible way.","B":"B) Learn from mistakes.","C":"C) Avoid multitasking.","D":"D) Increase efficiency"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_2_56
);

-- ==================== cet4-2023-12-3 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-r1', 'BANKED_CLOZE', 'CET4', NULL, 'When people set out to improve their health, they usually take a familiar path: starting a healthy diet, getting better sleep, and doing regular exercise. Each of these behaviors is important, of course, but they all __26__ on physical health—and a growing body of research suggests that social health is just as, if not more, important to __27__ well-being. One recent study published in the journal PLOS ONE, for example, found that the strength of a person''s social circle was a better __28__ of self-reported stress, happiness and well-being levels than fitness tracker data on physical activity, heart rate and sleep. That finding suggests that the " __29__ self" represented by endless amounts of health data doesn''t tell the whole __30__ . There''s also a qualified self, which is who I am, what are my activities, my social network, and all of these aspects are not __31__ in any of these measurements. This idea is supported by plenty of __32__ research. Studies have shown that social support—whether it comes from friends, family members or a spouse—is __33__ associated with better mental and physical health. A rich social life, these studies suggest, can lower stress levels, improve mood, encourage positive health behaviors and discourage damaging ones, boost heart health and improve illness __34__ rates. Social isolation, meanwhile, is linked to higher rates of physical diseases and mental health conditions. It''s a significant problem, __35__ since loneliness is emerging as a widespread public health problem in many countries.', NULL, '["A) base","B) eagerly","C) especially","D) focus","E) indicator","F) overall","G) preached","H) prior","I) prompt","J) puzzle","K) quantified","L) recovery","M) reflected","N) story","O) strongly"]', 246, 'IMPORT', 'cet4-2023-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-3-r1'
);
SET @pg_cet4_2023_12_3_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-3-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-r2', 'MATCHING', 'CET4', 'Teenagers and social networking', 'A) As a parent of two boys at primary school, I worry about the issues associated with teenagers and social media. Newspapers are constantly filled with frightening accounts of drug addiction and aggressive behaviour supposedly caused by violent video games. But even when these accounts touch on real concerns, they do not really reflect the great mass of everyday teenage social behaviour: the online chat, the texting, the surfing, and the emergence of a new teenage sphere that is conducted digitally. B) New technologies always provoke generational panic, which usually has more to do with adult fears than with the lives of teenagers. In the 1930s, parents worried that radio was gaining "an irresistible hold of their children". In the 80s, the great danger was the Sony Walkman(随身听). When you look at today''s digital activity, the facts are much more positive than you might expect. C) Indeed, social scientists who study young people have found that their digital use can be inventive and even beneficial. This is true not just in terms of their social lives, but their education too. So if you use a ton of social media, do you become unable, or unwilling, to engage in face-to-face contact? The evidence suggests not. Research by Amanda Lenhart of the Pew Research Centre, a US think tank, found that the most passionate texters are also the kids most likely to spend time with friends in person. One form of socialising doesn''t replace the other. It expands it. D) "Kids still spend time face to face," Lenhart says. Indeed, as they get older and are given more freedom, they often ease up on social networking. Early on, the web is their "third space", but by the late teens, it''s replaced in reaction to greater independence. They have to be on Facebook, to know what''s going on among friends and family, but they are ambivalent(有矛盾心理的) about it, says Rebecca Eynon, a research fellow at the Oxford Internet Institute, who has interviewed about 200 British teenagers over three years. As they gain experience with living online, they begin to adjust their behaviour, struggling with new communication skills, as they do in the real world. E) Parents are wrong to worry that kids don''t care about privacy. In fact, they spend hours changing Facebook settings or using quick-delete sharing tools, such as Snapchat, to minimise their traces. Or they post a photograph on Instagram, have a pleasant conversation with friends and then delete it so that no traces remain. F) This is not to say that kids always use good judgment. Like everyone else, they make mistakes—sometimes serious ones. But working out how to behave online is a new social skill. While there''s plenty of drama and messiness online, it is not, for most teens, a cycle of non-stop abuse: a Pew study found only 15% of teens said someone had bullied them online in the last 12 months. G) But surely all this short-form writing is affecting literacy? Certainly, teachers worry. They say that kids use overly casual language and text-speak in writing, and don''t have as much patience for long reading and complex arguments. Yet studies of first-year college papers suggest these anxieties may be partly based on misguided nostalgia(怀旧). When Stanford University scholar Andrea Lunsford gathered data on the rates of errors in "freshman composition" papers going back to 1917, she found that they were virtually identical to today. H) But even as error rates stayed stable, student essays have blossomed in size and complexity. They are now six times longer and, unlike older "what I did this summer" essays, they offer arguments supported by evidence. Why? Computers have vastly increased the ability of students to gather information, sample different points of view and write more fluidly. I) When linguist Naomi Baron studied students, instant messaging even there she found surprisingly rare usage of short forms such as "u" for "you", and as students got older, they began to write in more grammatical sentences. That is because they want to appear more adult, and they know how adults are expected to write. Clearly, teaching teens formal writing is still crucial, but texting probably isn''t destroying their ability to learn it. J) It is probably true that fewer kids are heavy readers compared with two generations ago, when cheap paperbacks boosted rates of reading. But even back then, a minority of people—perhaps 20%—were lifelong heavy readers, and it was cable TV not the internet, that struck a blow at that culture in the 1980s. Still, 15% or more of kids are found to be deeply bookish. In fact, the online world offers kids remarkable opportunities to become literate and creative because young people can now publish ideas not just to their friends, but to the world. And it turns out that when they write for strangers, their sense of "authentic audience" makes them work harder, push themselves further, and create powerful new communicative forms. K) Few would deny that too much time online can be harmful. Some of the dangers are emotional: hurting someone from a distance is not the same as hurting them face to face. If we''re lucky, the legal environment will change to make teenagers'' online lives less likely to haunt them later on. Just last week, California passed a law allowing minors to demand that internet firms erase their digital past and the EU has considered similar legislation. L) Distraction is also a serious issue. When kids switch from chat to music to homework, they are indeed likely to have trouble doing each task well. And studies show that pupils don''t fact-check information online —"smart searching" is a skill schools need to teach urgently. It''s also true that too much social networking and game playing can cut into schoolwork and sleep. This is precisely why parents still need to set firm boundaries around it, as with any other distraction. M) So what''s the best way to cope? The same boring old advice that applies to everything in parenting: moderation. Rebecca Eynon argues that it''s key to model good behaviour. Parents who stare non-stop at their phones and don''t read books are likely to breed kids who will do the same. As ever, we ought to be careful about our own behaviour.', NULL, NULL, 1043, 'IMPORT', 'cet4-2023-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-3-r2'
);
SET @pg_cet4_2023_12_3_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-3-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-r3', 'CAREFUL_READING', 'CET4', NULL, 'In the history of horse racing, few horses have captured the affection of the British public like Red Rum. Today, three decades after his retirement, he is still one of the best-known and most beloved racehorses of all time. Red Rum was passed around to several owners before being purchased for Noel Le Mar. The agent who made the purchase was the now-legendary horse trainer Donald "Ginger" McCain. It wasn''t apparent at the time, but Red Rum had a serious bone disease in his foot. For many horses (and many trainers) this would mean the end of a racing career before it even began. For Ginger and Red Rum, though, it was just an obstacle to greatness that had to be overcome. Red Rum''s true talent came out in steeplechases(障碍赛马). His power, speed and jumping ability carried him to his first Grand National title in 1973. The very next year, Red Rum returned to take his second title. He was the first horse to take successive firsts since Reynoldstown in 1935-1936. Red Rum''s spirit and grace had already begun to charm the leagues of Grand National fans. In the following two years, Red Rum lost out on the title, coming in second both times. When he returned in 1977 to try again, he was largely regarded as past his prime. He was 12 years old and not expected to place highly. He surprised sporting fans around the world when he came in a remarkable 25 lengths ahead of the nearest horse, taking his third Grand National win. To this day, Red Rum''s third win is known as one of the greatest moments in horse racing history. Red Rum was headed for the Grand National once again in 1978 but suffered an injury in one of his heels shortly before the race. He was retired soon after, but his public life and fame by no means decreased with the end of his career. Red Rum traveled all over the country for various engagements. He often led pre-race parades at Aintree Racecourse and was a popular guest at charity benefits and public events.', NULL, NULL, 351, 'IMPORT', 'cet4-2023-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-3-r3'
);
SET @pg_cet4_2023_12_3_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-3-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-r4', 'CAREFUL_READING', 'CET4', NULL, 'People in business often make decisions based on their own personal feelings or instincts. It is quite horrifying to see people being guided by some unknown force. But how wise is it, really, to let your instincts drive your decisions? In the decision-making process, relying on instincts only makes sense when you have a vast experience to support you. Simply "feeling" that something is right or should be done is highly subjective and can drown you. On the other hand, there is a more rational approach to making decisions. Data and analysis have long been associated with informed decisions. These reduce the likelihood of errors and increase the chances of success. Big, systematic data is mostly the foundation of most of our decisions, personal and business alike. But with its extreme usability comes a complication: what do you do if you strongly feel something should not be done, even if the data insists that it should? This seemingly easy question is what drives the need to understand the relationship between instincts and data in the decision-making process. Without making things complicated, the solution to this dilemma is using data and instincts in conjunction to arrive at the best possible decisions. Instinctive decisions are always backed by previous experiences or information, which acknowledges that instinctive decisions have worked in the past. Decisions are not about making the choice and braving the consequences because you want to blindly trust your instincts. They are about combining your inner wisdom with the knowledge of systematic data to make the best decisions. Sometimes, rational analysis and data are impractical to be employed in certain situations. Absence of definitive criteria, and time and resource constraints, and novel situations are instances which limit the practicality of data. The only feasible option is to rely on what your instincts tell you. In these situations, instincts can help you make effective and quick decisions. Combining instinctive and rational analysis produces well-rounded decisions. It reduces the chances of making mistakes, and has increasingly become a favorite approach to decision-making among leaders of today.', NULL, NULL, 343, 'IMPORT', 'cet4-2023-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-3-r4'
);
SET @pg_cet4_2023_12_3_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-12-3-r4' LIMIT 1);

-- 翻译 cet4-2023-12-3
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-translation'
);
SET @q_cet4_2023_12_3_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_01, '改革开放以来，中国人民生活水平不断提高，这在人们的饮食 (diet)变化上得到充分体现 。如今，人们不再满足于吃得饱，而是追求吃得更加安全、更加营养、更加健康，食物也愈来愈丰富多样，不再限于本地的农产品。物流业 (logistics industry)的发展使人们很容易品尝到全国各地的特产。毫无疑问，食品质量与饮食结构的改善为增进人们健康提供了有力的保障。', NULL, 'Since the reform and opening-up, the living standards of the Chinese people have improved steadily, which is fully reflected in the changes in people''s diet. Today, people are no longer content with simply having enough to eat; instead, they pursue food that is safer, more nutritious and healthier. Food is also becoming more and more diverse, no longer being limited to local agricultural products. The development of the logistics industry makes it easy for people to taste specialties from all over the country. Undoubtedly, the improvement in food quality and diet structure provides a strong guarantee for improving people''s health.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_01
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q26'
);
SET @q_cet4_2023_12_3_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_02, NULL, '{"A":"A) base","B":"B) eagerly","C":"C) especially","D":"D) focus","E":"E) indicator","F":"F) overall","G":"G) preached","H":"H) prior","I":"I) prompt","J":"J) puzzle","K":"K) quantified","L":"L) recovery","M":"M) reflected","N":"N) story","O":"O) strongly"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_02
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q27'
);
SET @q_cet4_2023_12_3_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_03, NULL, '{"A":"A) base","B":"B) eagerly","C":"C) especially","D":"D) focus","E":"E) indicator","F":"F) overall","G":"G) preached","H":"H) prior","I":"I) prompt","J":"J) puzzle","K":"K) quantified","L":"L) recovery","M":"M) reflected","N":"N) story","O":"O) strongly"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_03
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q28'
);
SET @q_cet4_2023_12_3_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_04, NULL, '{"A":"A) base","B":"B) eagerly","C":"C) especially","D":"D) focus","E":"E) indicator","F":"F) overall","G":"G) preached","H":"H) prior","I":"I) prompt","J":"J) puzzle","K":"K) quantified","L":"L) recovery","M":"M) reflected","N":"N) story","O":"O) strongly"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_04
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q29'
);
SET @q_cet4_2023_12_3_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_05, NULL, '{"A":"A) base","B":"B) eagerly","C":"C) especially","D":"D) focus","E":"E) indicator","F":"F) overall","G":"G) preached","H":"H) prior","I":"I) prompt","J":"J) puzzle","K":"K) quantified","L":"L) recovery","M":"M) reflected","N":"N) story","O":"O) strongly"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_05
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q30'
);
SET @q_cet4_2023_12_3_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_06, NULL, '{"A":"A) base","B":"B) eagerly","C":"C) especially","D":"D) focus","E":"E) indicator","F":"F) overall","G":"G) preached","H":"H) prior","I":"I) prompt","J":"J) puzzle","K":"K) quantified","L":"L) recovery","M":"M) reflected","N":"N) story","O":"O) strongly"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_06
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q31'
);
SET @q_cet4_2023_12_3_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_07, NULL, '{"A":"A) base","B":"B) eagerly","C":"C) especially","D":"D) focus","E":"E) indicator","F":"F) overall","G":"G) preached","H":"H) prior","I":"I) prompt","J":"J) puzzle","K":"K) quantified","L":"L) recovery","M":"M) reflected","N":"N) story","O":"O) strongly"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_07
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q32'
);
SET @q_cet4_2023_12_3_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_08, NULL, '{"A":"A) base","B":"B) eagerly","C":"C) especially","D":"D) focus","E":"E) indicator","F":"F) overall","G":"G) preached","H":"H) prior","I":"I) prompt","J":"J) puzzle","K":"K) quantified","L":"L) recovery","M":"M) reflected","N":"N) story","O":"O) strongly"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_08
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q33'
);
SET @q_cet4_2023_12_3_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_09, NULL, '{"A":"A) base","B":"B) eagerly","C":"C) especially","D":"D) focus","E":"E) indicator","F":"F) overall","G":"G) preached","H":"H) prior","I":"I) prompt","J":"J) puzzle","K":"K) quantified","L":"L) recovery","M":"M) reflected","N":"N) story","O":"O) strongly"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_09
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q34'
);
SET @q_cet4_2023_12_3_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_10, NULL, '{"A":"A) base","B":"B) eagerly","C":"C) especially","D":"D) focus","E":"E) indicator","F":"F) overall","G":"G) preached","H":"H) prior","I":"I) prompt","J":"J) puzzle","K":"K) quantified","L":"L) recovery","M":"M) reflected","N":"N) story","O":"O) strongly"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_10
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q35'
);
SET @q_cet4_2023_12_3_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_11, NULL, '{"A":"A) base","B":"B) eagerly","C":"C) especially","D":"D) focus","E":"E) indicator","F":"F) overall","G":"G) preached","H":"H) prior","I":"I) prompt","J":"J) puzzle","K":"K) quantified","L":"L) recovery","M":"M) reflected","N":"N) story","O":"O) strongly"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_11
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q36'
);
SET @q_cet4_2023_12_3_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_12, 'Research has found the use of digital technology benefits not only teenagers'' social lives but also their studies.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_12
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q37'
);
SET @q_cet4_2023_12_3_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_13, 'It is urgent that schools teach kids how to verify online information.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_13
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q38'
);
SET @q_cet4_2023_12_3_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_14, 'Students now write longer and more complex essays than their counterparts in previous decades while the error rates remain unchanged.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_14
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q39'
);
SET @q_cet4_2023_12_3_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_15, 'Newspaper reports of teenagers give a false picture of their behaviour.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_15
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q40'
);
SET @q_cet4_2023_12_3_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_16, 'Parents are advised to mind their own digital behaviour and set a good example for their kids.', NULL, 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_16
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q41'
);
SET @q_cet4_2023_12_3_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_17, 'Contrary to parents'' belief, kids try hard to leave as few traces as possible on the web.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_17
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q42'
);
SET @q_cet4_2023_12_3_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_18, 'Students'' ability to learn formal writing is unlikely to be affected by texting.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_18
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q43'
);
SET @q_cet4_2023_12_3_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_19, 'Historically, new technologies have always caused great fears among parents.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_19
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q44'
);
SET @q_cet4_2023_12_3_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_20, 'The reading culture was seriously affected by cable television some four decades ago.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_20
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q45'
);
SET @q_cet4_2023_12_3_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_21, 'Teachers say that kids'' writing is too casual, using language characteristic of text messages.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_21
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q46'
);
SET @q_cet4_2023_12_3_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_22, 'What do we learn from the passage about Red Rum the racehorse?', '{"A":"A) He captured public affection long before he won national titles.","B":"B) He won enormous fame and love from British people.","C":"C) He became a myth three decades after his retirement.","D":"D) He owed his great success to several well-known horse trainers."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_22
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q47'
);
SET @q_cet4_2023_12_3_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_23, 'What did the serious bone disease in Red Rum''s foot mean to himself and his trainer?', '{"A":"A) It was simply a hindrance they had to get over to excel.","B":"B) It was surely a disadvantage though not considered fatal.","C":"C) It was actually the end of a racing career that had just begun.","D":"D) It was really a major obstacle hard to overcome on their own."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_23
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q48'
);
SET @q_cet4_2023_12_3_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_24, 'What does the author say Red Rum did with his power, speed and jumping ability?', '{"A":"A) He won his first Grand National title at 12.","B":"B) He took two firsts successively in 1935-1936.","C":"C) He surprised sporting fans worldwide in 1973.","D":"D) He took three Grand National wins in the 1970s."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_24
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q49'
);
SET @q_cet4_2023_12_3_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_25, 'What did people generally think of Red Rum when he returned to the racecourse in 1977?', '{"A":"A) He had already passed the peak of his racing life.","B":"B) He would have no rival in Grand National steeplechases.","C":"C) He had lost his charm with the leagues of Grand National fans.","D":"D) He could be expected to repeat his glory in the prime of his career."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_25
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q50'
);
SET @q_cet4_2023_12_3_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_26, 'What became of Red Rum after his career ended?', '{"A":"A) He suffered from severe pain in a heel.","B":"B) He spent almost all his time traveling.","C":"C) He lived on various charity benefits.","D":"D) He remained famous and popular."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_26
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q51'
);
SET @q_cet4_2023_12_3_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_27, 'What does the author say businesspeople often do?', '{"A":"A) Strive to make sense of some unknown forces.","B":"B) Avoid being driven by their own feeling.","C":"C) Draw on a vast wealth of past experience.","D":"D) Rely on instincts in decision-making."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_27
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q52'
);
SET @q_cet4_2023_12_3_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_28, 'What should we take into account in order to make informed decisions?', '{"A":"A) The likelihood of errors.","B":"B) Systematic data and analysis.","C":"C) The complexity of circumstances.","D":"D) Personal feelings and business strategies"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_28
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q53'
);
SET @q_cet4_2023_12_3_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_29, 'What should people do in a decision-making process if instincts disagree with data?', '{"A":"A) Resolve the dilemma with previous experience.","B":"B) Figure out which of the two is more reliable.","C":"C) Combine the two together.","D":"D) Prioritize instincts over data."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_29
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q54'
);
SET @q_cet4_2023_12_3_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_30, 'What should we do when facing various factors that limit the practicality of data?', '{"A":"A) Make a rational and systematic analysis.","B":"B) Explore the most feasible options.","C":"C) Resort to our inner wisdom.","D":"D) Apply definitive criteria."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_30
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-12-3-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q55'
);
SET @q_cet4_2023_12_3_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-12-3-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_12_3_31, 'What does it take for decisions to become the best according to the author?', '{"A":"A) Applying instincts and data in conjunction.","B":"B) Assessing all factors when making a choice.","C":"C) Recalling what has actually worked in the past.","D":"D) Refraining from trusting instincts arbitrarily."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_12_3_31
);

-- ==================== cet4-2024-06-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-r1', 'BANKED_CLOZE', 'CET4', NULL, 'It''s well known that physical exercise is beneficial not just to physical health but also to mental health. Yet whereas most countries have __26__ , evidence-backed guidelines on the type and intensity of exercise __27__ for various physical health benefits, such guidelines do not yet exist for exercise and mood. This is __28__ due to a lack of necessary evidence. However, a new systematic review brings us usefully up to-date on the current findings in this area. Before __29__ into some of the key take-aways, an important __30__ made in the review is between aerobic exercise and anaerobic. The former __31__ such things as walking, jogging and cycling and means exercising in such a way that your body is able to use oxygen to burn fat for energy. In contrast, anaerobic exercise—such as lifting heavy weights—is of such __32__ intensity that your body does not have time to use oxygen to create energy and so instead it breaks down glucose(葡萄糖) in your blood or muscles. Beginning first with the influence of exercise intensity on the mood benefits of aerobic exercise, the researchers, led by John Chan at Shenzhen University, found __33__ results from 19 relevant studies. Some favoured higher intensity, others low, while seven studies found that intensity made no __34__ to mood benefits. In relation to the intensity of anaerobic exercise, however, the results were far clearer—the optimum(最佳选 择) for improving mood is __35__ intensity, perhaps because low intensity is too dull while high intensity is too unpleasant.', NULL, '["A) constitutes","B) contradictory","C) decision","D) detailed","E) difference","F) dipping","G) distinction","H) falling","I) involves","J) moderate","K) notified","L) partly","M) required","N) traditionally","O) vigorous"]', 249, 'IMPORT', 'cet4-2024-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-1-r1'
);
SET @pg_cet4_2024_06_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-r2', 'MATCHING', 'CET4', 'Why Do Americans Work So Much?', 'A) How will we all keep busy when we only have to work 15 hours a week? That was the question that worried the British economist John Maynard Keynes when he wrote his short essay "Economic Possibilities for Our Grandchildren" in 1930. Over the next century, he predicted, the economy would become so productive that people would barely need to work at all. For a while, it looked like Keynes was right. In 1930 the average working week was 47 hours in the United States. But by 1970, the number of hours Americans worked on average had fallen to slightly less than 39. B) But then something changed. Instead of continuing to decline, the duration of the working week remained stable. It has stayed at just below 40 hours for nearly five decades. So what happened? Why are people working just as much today as in 1970? C) There would be no mystery in this if Keynes had been wrong about the power of technology to increase the economy''s productivity, which he thought would lead to a standard of living "between four and eight times as high as it is today." But Keynes got that right: Technology has made the economy massively more productive. According to Benjamin M.Friedman, an economist at Harvard, the U.S. economy is right on track to reach Keynes''s eight-fold(八倍) multiple by 2029. That is a century after the last data Keynes would have had access to. D) In a new paper, Friedman tries to figure out why that increased productivity has not translated into increased leisure time. Perhaps people just never feel materially satisfied, always wanting more money to buy the next new thing. This is a theory that appeals to many economists. "This argument is, at best, far from sufficient," he writes. If that were the case, why did the duration of the working week decline in the first place? E) Another theory Friedman considers is that, in an era of ever fewer settings that provide effective opportunities for personal connections and relationships, people may place more value on the socializing that happens at work. There is support for this theory. Many people today consider colleagues as friends. But Friedman argues that the evidence for this theory is far from conclusive. Many workers report that they would like to spend more time with family, rather than at work. Furthermore, this theory cannot explain the change in trend in the U.S. working week in the 1970s. F) A third possibility proves more convincing for Friedman. That is: American inequality means that the gains of increasing productivity are not widely shared by everyone. In other words, most Americans are too poor to work less. Unlike the other two explanations Friedman considers, this one fits chronologically( 按年代). Inequality declined in America during the period following World War II, along with the duration of the working week. But since the early 1970s it has risen dramatically. G) Keynes''s prediction of a shorter working week rests on the idea that the standard of living would continue rising for everyone. But Friedman says that this is not what has happened. Although Keynes''s eight-fold figure holds up for the economy as a whole, it is not at all the case for the median(中位数的) American worker. For them, output by 2029 is likely to be around 3.5 times what it was when Keynes was writing. This is a bit below his four-to eight-fold predicted range. H) This can be seen in the median worker''s income over this time period, complete with a shift in 1973 that fits in precisely with when the working week stopped shrinking. According to Friedman, between 1947 and 1973 the average hourly wage for normal workers (those who were not in management roles) in private industries other than agriculture nearly doubled in terms of what their money could buy. But by 2013 the average hourly wage for ordinary workers had fallen 5 percent from the 1973 level in terms of actual purchasing power. Thus, though American incomes may have gone up since 1973, the amount that American workers can actually buy with their money has gone down. For most Americans, then, the magic of increasing productivity stopped working around 1973. Thus, they had to keep working just as much in order to maintain their standard of living. I) What Keynes predicted was a very optimistic version of what economists call technological unemployment. This is the idea that less labor will be necessary because machines can do so much. In Keynes''s vision, the resulting unemployment would be distributed more or less evenly across society in the form of increased leisure. But Friedman says that, for Americans, reality is much darker. Americans now have a labor market in which millions of people—those with fewer skills and less education—are seeking whatever poorly paid work they can get. This is confirmed by a recent poll that found that, for half of hourly workers, their top concern is not that they work too much but that they work too little. This is most likely not because they like their jobs so much. Rather, we can assume it is because they need the money. J) This explanation leaves an important question. If the very rich—the workers who have reaped above-average gains from the increased productivity since Keynes''s time—can afford to work less, why do they continue to work so much? (Indeed, research has shown that the highest earners in America tend to work the most.) Friedman believes that for many top earners, work is a labor of love. They are doing work they care about and are interested in, and doing more of it is not necessarily a burden. For them, it may even be a pleasure. These top earners derive meaning from their jobs and work is an important part of how they think of themselves. And, of course, they are compensated for it at a level that makes it worth their while. K) Friedman concludes that the prosperity(繁荣) Keynes predicted is here. After all, the economy as a whole has grown even more brilliantly than he expected. But for most Americans, that prosperity is nowhere to be seen. And, as a result, neither are those shorter working weeks.', NULL, NULL, 1035, 'IMPORT', 'cet4-2024-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-1-r2'
);
SET @pg_cet4_2024_06_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-r3', 'CAREFUL_READING', 'CET4', NULL, 'Lao Zi once said, "Care about what other people think and you will always be their prisoner." People-pleasing, or seeking self-worth through others'' approval, is unproductive and an exhausting way to go through life. Why do we allow what others think of us to have so much power over how we feel about ourselves? If it''s true that you can''t please all people all of the time, wouldn''t it make sense to stop trying? Unfortunately, sense often isn''t driving our behavior. For social beings who desire love and belonging, wanting to be liked, and caring about the effect we have on others, is healthy and allows us to make connections. However, where we get into trouble is when our self-worth is dependent upon whether we win someone''s approval or not. This need to be liked can be traced back to when we were children and were completely dependent on others to take care of us: Small children are not just learning how to walk and communicate, they are also trying to learn how the world works. We learn about who we are and what is expected of us based on interactions with others, so, to a four-year-old, if Mommy or Daddy doesn''t like him or her, there is the danger that they will abandon them. We need to understand that when we desperately want someone to approve of us, it''s being driven by that little kid part of us that is still terrified of abandonment. As you become more capable of providing yourself with the approval you seek, your need for external validation will start to vanish, leaving you stronger, more confident, and yes, happier in your life. Imagine how much time we lose each moment we restrain our authentic selves in an effort to be liked. If we base our worth on the opinions of others, we cheat ourselves of the power to shape our experiences and embrace life not only for others but also for ourselves, because ultimately, there is no difference. So embrace the cliché(老话) and love yourself as it''s highly doubtful that you''ll regret it.', NULL, NULL, 349, 'IMPORT', 'cet4-2024-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-1-r3'
);
SET @pg_cet4_2024_06_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-r4', 'CAREFUL_READING', 'CET4', NULL, 'Some people have said aging is more a slide into forgetfulness than a journey towards wisdom. However, a growing body of research suggests that late-in-life learning is possible. In reality, education does an aging brain good. Throughout life, people''s brains constantly renovate themselves. In the late 1960s, British brain scientist Geoffrey Raisman spied growth in damaged brain regions of rats through an electron microscope; their brains were forging new connections. This meant brains may change every time a person learns something new. Of course, that doesn''t mean the brain isn''t affected by the effects of time. Just as height usually declines over the years, so does brain volume: Humans lose about 4 percent every decade starting in their 40s. But that reduction doesn''t necessarily make people think slower; as long as we are alive and functioning, we can alter our brains with new information and experiences. In fact, scientists now suspect accumulating novel experiences, facts, and skills can keep people''s minds more flexible. New pathways can strengthen our ever-changing mental structure, even as the brain shrinks. Conventional fixes like word puzzles and brain-training apps can contribute to mental durability. Even something as simple as taking a different route to the grocery store or going somewhere new on vacation can keep the brain healthy. A desire for new life challenges can further boost brainpower. Research about aging adults who take on new enterprises shows improved function and memory as well as a reduced risk of mental disease. Openness—a characteristic defined by curiosity and a desire for knowledge—may also help folks pass brain tests. Some folks are born with this take-in-the-world attitude, but those who aren''t as genetically gifted aren''t necessarily out of luck. While genes can encourage an interest in doing new things, a 2012 study in the journal Psychology and Aging found completing reasoning tasks like puzzles and number games can enhance that desire for novel experiences, which can, in turn, refresh the brain. That''s why brain scientist Richard Kennedy says "It''s not that old dogs can''t learn new tricks. It''s that maybe old dogs don''t realize why they should."', NULL, NULL, 350, 'IMPORT', 'cet4-2024-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-1-r4'
);
SET @pg_cet4_2024_06_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-1-r4' LIMIT 1);

-- 翻译 cet4-2024-06-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-translation'
);
SET @q_cet4_2024_06_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_01, '四合院(siheyuan)是中国一种传统的住宅建筑，其特点是房屋建造在一个院子的四周，将院子合围在中间。四合院通常冬暖夏凉，环境舒适，尤其适合大家庭居住。四合院在中国各地有多种类型，其中以北京的四合院最为典型。如今，随着现代城市的发展，传统的四合院已逐渐减少，但因其独特的建筑风格，四合院对中国文化的传承和中国历史的研究具有重要意义。', NULL, 'The siheyuan is a traditional Chinese residential building, characterized by houses built on the four sides of a courtyard, enclosing it in the middle. It is usually warm in winter and cool in summer, providing a comfortable environment that is especially suitable for large families. There are various types of siheyuan across China, among which the ones in Beijing are the most typical. Nowadays, with the development of modern cities, traditional siheyuan have gradually decreased; however, owing to their unique architectural style, they remain of great significance to the inheritance of Chinese culture and the study of Chinese history.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_01
);

-- 听力 Q1 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q01', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q01'
);
SET @q_cet4_2024_06_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_02, NULL, '{"A":"A) Due to a fire alarm in their apartments.","B":"B) Because of the smoke and heat damage.","C":"C) Due to the water used to extinguish the flames.","D":"D) Because of the collapse of the three-story building."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_02
);

-- 听力 Q2 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q02', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q02'
);
SET @q_cet4_2024_06_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_03, NULL, '{"A":"A) Investigating the cause of the incident.","B":"B) Helping search for the suspect of the crime.","C":"C) Rescuing the businessmen trapped in the building.","D":"D) Checking town records for the property developer."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_03
);

-- 听力 Q3 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q03', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q03'
);
SET @q_cet4_2024_06_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_04, NULL, '{"A":"A) It plays a less important role in one''s health than nutrient intake.","B":"B) It impacts people''s health to a lesser degree than sun exposure.","C":"C) It is associated with people''s mental health conditions.","D":"D) It is linked with older adults'' symptoms of depression."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_04
);

-- 听力 Q4 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q04', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q04'
);
SET @q_cet4_2024_06_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_05, NULL, '{"A":"A) It was indefinite.","B":"B) It was systematic.","C":"C) It was straightforward.","D":"D) It was insignificant."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_05
);

-- 听力 Q5 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q05', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q05'
);
SET @q_cet4_2024_06_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_06, NULL, '{"A":"A) It has helped solve several murder cases.","B":"B) It has become a star office dog in Beijing.","C":"C) It has surpassed its mother in performance.","D":"D) It has done better than naturally born dogs."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_06
);

-- 听力 Q6 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q06', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q06'
);
SET @q_cet4_2024_06_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_07, NULL, '{"A":"A) To speed up investigation into criminal cases.","B":"B) To test the feasibility of cloning technology.","C":"C) To cut down training expenses.","D":"D) To reduce their training time."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_07
);

-- 听力 Q7 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q07', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q07'
);
SET @q_cet4_2024_06_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_08, NULL, '{"A":"A) Cloning is too complicated a process.","B":"B) The technology is yet to be accepted.","C":"C) Cloning is ethically controversial.","D":"D) The technology is too expensive."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q08', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q08'
);
SET @q_cet4_2024_06_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_09, NULL, '{"A":"A) He read it somewhere online.","B":"B) He heard about it from a coworker.","C":"C) He read an article reviewing it.","D":"D) He watched a TV series based on it."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_09
);

-- 听力 Q9 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q09', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q09'
);
SET @q_cet4_2024_06_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_10, NULL, '{"A":"A) His publications.","B":"B) His first book.","C":"C) His address.","D":"D) His name."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_10
);

-- 听力 Q10 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q10', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q10'
);
SET @q_cet4_2024_06_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_11, NULL, '{"A":"A) Collect a lot more data.","B":"B) Relax a bit less often.","C":"C) Clarify many new concepts.","D":"D) Read more reference books."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_11
);

-- 听力 Q11 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q11', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q11'
);
SET @q_cet4_2024_06_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_12, NULL, '{"A":"A) Find out the show''s most interesting episodes.","B":"B) Watch the series together with the woman.","C":"C) Get an e-copy of the book to read.","D":"D) Check to see when the show starts."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_12
);

-- 听力 Q12 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q12', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q12'
);
SET @q_cet4_2024_06_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_13, NULL, '{"A":"A) To check the prices of his farm produce.","B":"B) To ask the way to the Newcastle City Hall.","C":"C) To inquire about the vegetarian food festival.","D":"D) To seek the man''s help with her work on the farm."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_13
);

-- 听力 Q13 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q13', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q13'
);
SET @q_cet4_2024_06_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_14, NULL, '{"A":"A) Bakers.","B":"B) Vendors.","C":"C) Vegetarians.","D":"D) Organisers."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_14
);

-- 听力 Q14 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q14', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q14'
);
SET @q_cet4_2024_06_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_15, NULL, '{"A":"A) The issuing of certificates to vendors.","B":"B) The completion of the baking task.","C":"C) The festival they are organising.","D":"D) The deadline for application."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_15
);

-- 听力 Q15 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q15', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q15'
);
SET @q_cet4_2024_06_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_16, NULL, '{"A":"A) The closing date of submission.","B":"B) The website of his company.","C":"C) The details of the ceremony.","D":"D) The organiser''s address."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_16
);

-- 听力 Q16 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q16', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q16'
);
SET @q_cet4_2024_06_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_17, NULL, '{"A":"A) Most scenic sites have been closed.","B":"B) Access to official campsites is limited.","C":"C) Health experts advise going outdoors.","D":"D) People have more time during the summer."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_17
);

-- 听力 Q17 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q17', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q17'
);
SET @q_cet4_2024_06_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_18, NULL, '{"A":"A) It is strongly opposed by nearby residents.","B":"B) It leads to much waste of public money.","C":"C) It has caused environmental concerns.","D":"D) It has created conflicts among campers."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_18
);

-- 听力 Q18 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q18', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q18'
);
SET @q_cet4_2024_06_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_19, NULL, '{"A":"A) Look for open land in Scotland.","B":"B) Leave no trace of their camping.","C":"C) Avoid getting close to wilderness.","D":"D) Ask for permission from authorities."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_19
);

-- 听力 Q19 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q19', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q19'
);
SET @q_cet4_2024_06_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_20, NULL, '{"A":"A) They outcompete mythical creatures.","B":"B) They usually mind their own business.","C":"C) They truly exist in the Amazon region.","D":"D) They resemble alarmingly large snakes."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_20
);

-- 听力 Q20 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q20', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q20'
);
SET @q_cet4_2024_06_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_21, NULL, '{"A":"A) Scar tissue from dolphins'' fighting.","B":"B) Skin infection from water pollution.","C":"C) Unhealed wounds from snake bites.","D":"D) Swimming along in seasonal floods."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_21
);

-- 听力 Q21 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q21', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q21'
);
SET @q_cet4_2024_06_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_22, NULL, '{"A":"A) It has been shrinking at an astonishing pace.","B":"B) It has been placed under international protection.","C":"C) It has been appealing to both freshwater and sea dolphins.","D":"D) It has been abandoned as a battleground for male dolphins."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_22
);

-- 听力 Q22 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q22', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q22'
);
SET @q_cet4_2024_06_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_23, NULL, '{"A":"A) About 58% of young adults call parental support the new normal.","B":"B) Most adult children enjoy increasing sources of financial support.","C":"C) A full 70% of the young adults cannot afford to buy a car by themselves.","D":"D) Most early adults cannot sustain their lifestyles without parental support."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_23
);

-- 听力 Q23 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q23', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q23'
);
SET @q_cet4_2024_06_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_24, NULL, '{"A":"A) It renders them dependent.","B":"B) It causes them to lose dignity.","C":"C) It makes them mentally immature.","D":"D) It hinders them from getting ahead."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_24
);

-- 听力 Q24 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q24', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q24'
);
SET @q_cet4_2024_06_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_25, NULL, '{"A":"A) It challenges one''s willpower.","B":"B) It results from education.","C":"C) It calls for due assistance.","D":"D) It defines adulthood."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_25
);

-- 听力 Q25 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q25', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q25'
);
SET @q_cet4_2024_06_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_26, NULL, '{"A":"A) Current lifestyles.","B":"B) Poor budgeting.","C":"C) College loans.","D":"D) Emergency expenses."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q26'
);
SET @q_cet4_2024_06_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_27, NULL, '{"A":"A) constitutes","B":"B) contradictory","C":"C) decision","D":"D) detailed","E":"E) difference","F":"F) dipping","G":"G) distinction","H":"H) falling","I":"I) involves","J":"J) moderate","K":"K) notified","L":"L) partly","M":"M) required","N":"N) traditionally","O":"O) vigorous"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q27'
);
SET @q_cet4_2024_06_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_28, NULL, '{"A":"A) constitutes","B":"B) contradictory","C":"C) decision","D":"D) detailed","E":"E) difference","F":"F) dipping","G":"G) distinction","H":"H) falling","I":"I) involves","J":"J) moderate","K":"K) notified","L":"L) partly","M":"M) required","N":"N) traditionally","O":"O) vigorous"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q28'
);
SET @q_cet4_2024_06_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_29, NULL, '{"A":"A) constitutes","B":"B) contradictory","C":"C) decision","D":"D) detailed","E":"E) difference","F":"F) dipping","G":"G) distinction","H":"H) falling","I":"I) involves","J":"J) moderate","K":"K) notified","L":"L) partly","M":"M) required","N":"N) traditionally","O":"O) vigorous"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q29'
);
SET @q_cet4_2024_06_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_30, NULL, '{"A":"A) constitutes","B":"B) contradictory","C":"C) decision","D":"D) detailed","E":"E) difference","F":"F) dipping","G":"G) distinction","H":"H) falling","I":"I) involves","J":"J) moderate","K":"K) notified","L":"L) partly","M":"M) required","N":"N) traditionally","O":"O) vigorous"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q30'
);
SET @q_cet4_2024_06_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_31, NULL, '{"A":"A) constitutes","B":"B) contradictory","C":"C) decision","D":"D) detailed","E":"E) difference","F":"F) dipping","G":"G) distinction","H":"H) falling","I":"I) involves","J":"J) moderate","K":"K) notified","L":"L) partly","M":"M) required","N":"N) traditionally","O":"O) vigorous"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q31'
);
SET @q_cet4_2024_06_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_32, NULL, '{"A":"A) constitutes","B":"B) contradictory","C":"C) decision","D":"D) detailed","E":"E) difference","F":"F) dipping","G":"G) distinction","H":"H) falling","I":"I) involves","J":"J) moderate","K":"K) notified","L":"L) partly","M":"M) required","N":"N) traditionally","O":"O) vigorous"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q32'
);
SET @q_cet4_2024_06_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_33, NULL, '{"A":"A) constitutes","B":"B) contradictory","C":"C) decision","D":"D) detailed","E":"E) difference","F":"F) dipping","G":"G) distinction","H":"H) falling","I":"I) involves","J":"J) moderate","K":"K) notified","L":"L) partly","M":"M) required","N":"N) traditionally","O":"O) vigorous"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q33'
);
SET @q_cet4_2024_06_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_34, NULL, '{"A":"A) constitutes","B":"B) contradictory","C":"C) decision","D":"D) detailed","E":"E) difference","F":"F) dipping","G":"G) distinction","H":"H) falling","I":"I) involves","J":"J) moderate","K":"K) notified","L":"L) partly","M":"M) required","N":"N) traditionally","O":"O) vigorous"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q34'
);
SET @q_cet4_2024_06_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_35, NULL, '{"A":"A) constitutes","B":"B) contradictory","C":"C) decision","D":"D) detailed","E":"E) difference","F":"F) dipping","G":"G) distinction","H":"H) falling","I":"I) involves","J":"J) moderate","K":"K) notified","L":"L) partly","M":"M) required","N":"N) traditionally","O":"O) vigorous"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q35'
);
SET @q_cet4_2024_06_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_36, NULL, '{"A":"A) constitutes","B":"B) contradictory","C":"C) decision","D":"D) detailed","E":"E) difference","F":"F) dipping","G":"G) distinction","H":"H) falling","I":"I) involves","J":"J) moderate","K":"K) notified","L":"L) partly","M":"M) required","N":"N) traditionally","O":"O) vigorous"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q36'
);
SET @q_cet4_2024_06_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_37, 'Some people view socializing at the workplace as a chance to develop personal relationships.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q37'
);
SET @q_cet4_2024_06_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_38, 'As ordinary American workers'' average hourly pay had decreased despite increasing productivity, they had to work just as many hours as before to keep their living standards.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q38'
);
SET @q_cet4_2024_06_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_39, 'American workers'' average weekly working time has not changed for nearly half a century.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q39'
);
SET @q_cet4_2024_06_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_40, 'Friedman believes inequality in the U.S. largely explains why increasing productivity has not resulted in reduced working hours.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q40'
);
SET @q_cet4_2024_06_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_41, 'Many economists assume people''s thirst for material things has prevented them from enjoying more leisure time.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q41'
);
SET @q_cet4_2024_06_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_42, 'An economist''s prediction about a shorter average working week seemed to be correct for a time in the 20th century.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q42'
);
SET @q_cet4_2024_06_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_43, 'In the U.S. labor market, the primary concern of people with less schooling and fewer skills is to secure any employment even if it is low-paid.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q43'
);
SET @q_cet4_2024_06_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_44, 'Keynes was right in predicting that technology would make the economy much more productive.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q44'
);
SET @q_cet4_2024_06_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_45, 'Many of the highest earners have a keen interest in and love for what they are doing.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q45'
);
SET @q_cet4_2024_06_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_46, 'According to Keynes, there would be a shorter working week with everyone''s standard of living continuing to rise.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q46'
);
SET @q_cet4_2024_06_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_47, 'What can we conclude from Lao Zi''s quotation?', '{"A":"A) We should see through other people''s attempt to make a prisoner of us.","B":"B) We can never really please other people even if we try as hard as we can.","C":"C) We can never be truly free if taking to heart others'' opinion of us.","D":"D) We should care about other people''s view as much as they care about our own."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q47'
);
SET @q_cet4_2024_06_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_48, 'What will happen if we base our self-worth on other people''s approval?', '{"A":"A) Our desire to be loved will be fulfilled.","B":"B) Our life will be unfruitful and exhausting.","C":"C) Our identity as social beings will be affected.","D":"D) Our sense of self will be sharpened and enhanced."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q48'
);
SET @q_cet4_2024_06_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_49, 'What may account for our need to be liked or approved of?', '{"A":"A) Our desperate longing for interactions with others.","B":"B) Our understanding of the workings of the world.","C":"C) Our knowledge about the pain of abandonment.","D":"D) Our early childhood fear of being deserted."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q49'
);
SET @q_cet4_2024_06_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_50, 'What can we do when we become better able to provide ourselves with the desired approval?', '{"A":"A) Enjoy a happier life.","B":"B) Exercise self-restraint.","C":"C) Receive more external validation.","D":"D) Strengthen our power of imagination."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q50'
);
SET @q_cet4_2024_06_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_51, 'What does the author advise us to do in the last paragraph?', '{"A":"A) Embrace life for ourselves and for others.","B":"B) Base our worth on others'' opinions.","C":"C) See our experiences as assets.","D":"D) Love ourselves as we are."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q51'
);
SET @q_cet4_2024_06_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_52, 'What do some people think of aging adults?', '{"A":"A) Their wisdom grows as time goes by.","B":"B) Their memory gradually deteriorates.","C":"C) They can benefit from late-in-life learning.","D":"D) They are likely to have mental health issues."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q52'
);
SET @q_cet4_2024_06_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_53, 'What can we conclude from Geoffrey Raisman''s finding?', '{"A":"A) Brain damage seriously hinders one''s learning.","B":"B) Brain power weakens slower than we imagine.","C":"C) Brains can refresh and improve with learning.","D":"D) Brains forge connections under new conditions."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q53'
);
SET @q_cet4_2024_06_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_54, 'What is one thing that helps maintain the health of our brain even as it shrinks?', '{"A":"A) Doing daily routines by conventional means.","B":"B) Avoiding worrying about our mental durability.","C":"C) Imitating old dogs'' way of learning new tricks.","D":"D) Approaching everyday tasks in novel ways."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q54'
);
SET @q_cet4_2024_06_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_55, 'What does the author say can contribute to the improvement of brain function?', '{"A":"A) Being curious and desiring knowledge.","B":"B) Being eager to pass brain tests at an old age.","C":"C) Rising to life''s challenges and avoiding risks.","D":"D) Boosting immunity to serious mental diseases."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-1-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q55'
);
SET @q_cet4_2024_06_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_1_56, 'What is the finding of the 2012 study in the journal Psychology and Aging?', '{"A":"A) Wishing to solve puzzles enhances one''s reasoning power.","B":"B) Playing number games unexpectedly stimulates one''s memory.","C":"C) Desiring new experiences can help to renovate the brain.","D":"D) Learning new tricks should not be confined to old dogs only."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_1_56
);

-- ==================== cet4-2024-06-2 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-r1', 'BANKED_CLOZE', 'CET4', NULL, 'A team of researchers led by Priyanka Joshi examined the degree to which men and women relied on "communicative abstraction" to verbally convey their ideas and emotions. Communicative abstraction, according to the researchers, reflects the tendency of people to use "abstract speech that focuses on the broader picture and __26__ purpose of action rather than concrete speech focusing on details and the means of __27__ action." Interestingly, they found that men were far more likely to speak in the abstract than were women. To arrive at this __28__ , the researchers examined the linguistic(语言的) patterns of men and women in over 600,000 blog posts written on websites. To do this, the researchers computed abstractness ratings for __29__ 40,000 commonly used words in the English language. Words considered to be concrete could be easily visualized, such as "table" or "chair". Words that were more __30__ to visualize, for example, "justice" or "morality" were considered to be more abstract. They found that men used __31__ more abstract language in their blog posts. What is the __32__ of this effect? The researchers suggest that power differences between the genders— that is, men having more power in society—might be a key determinant(决定因素). For instance, in a follow-up study conducted with a sample of 300 students, the researchers __33__ power dynamics in an interpersonal setting to see if this would influence communicative abstraction. They found that participants in a high-power interviewer role were more likely to give abstract descriptions of behaviors than were participants in a low-power interviewee role. This suggests that communicating more abstractly does not reflect a __34__ tendency of men or women but rather __35__ within specific contexts.', NULL, '["A) approximately","B) attaining","C) conclusion","D) difficult","E) emerges","F) fixed","G) ignored","H) legally","I) manipulated","J) recommended","K) refraining","L) signals","M) significantly","N) source","O) ultimate"]', 276, 'IMPORT', 'cet4-2024-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-2-r1'
);
SET @pg_cet4_2024_06_2_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-2-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-r2', 'MATCHING', 'CET4', 'How to better work towards long-term goals', 'A) Hal Hershfield, a psychologist at the UCLA Anderson School of Management, wanted to know why people weren''t saving for retirement. Across the board, people are living longer. Logically, they''ll need more money to live comfortably in their post-work years. And yet, savings rates in the U.S. have gone down in recent decades, not up. B) To help explain this seemingly irrational behavior, Hershfield and his team scanned the brains of study participants while asking them to what degree various traits(特征)—like "honorable" or "funny"—applied to their current self, their future self, a current other, or a future other. As participants answered, Hershfield''s team recorded which parts of their brains lit up. Unsurprisingly, people''s brains were most active when thinking about their current selves and least active when thinking about a current other. But the team found that participants'' brain activity while considering their future selves more closely resembled their brain activity while thinking about a current other rather than the current self. C) Put in practical terms, when thinking of yourself in a month or a year or a decade, your brain registers that person in ways similar to how it would register Taylor Swift or the mailman. Understood in that way, saving for retirement is the equivalent of giving money away to someone else entirely. D) In light of Hershfield''s study, one simple question arises: Is it possible to make our present selves give a damn about our future selves? The answers are anything but simple. E) Seen through the lens of the present self versus the future self, our self-defeating actions—like choosing to watch television rather than go to the gym—suddenly make perfect sense. We get to enjoy the very concrete, immediate benefits of our actions while someone else (namely, our future selves) suffers the hypothetical(假 设的), far-off consequences. As a result, the decisions we make for our present selves often look very different from our decisions for our future selves. We believe that tomorrow will be different. We believe that we will be different tomorrow; but in doing so, we prioritize our current mood over the consequences of our inaction for the future self. F) Understanding our procrastination(拖延) through the lens of the present and future selves, we''re left with three possible solutions: The first is to force your future self to do whatever your present self doesn''t want to do. The second is to convince your present self that your future self is, in fact, still you. If the central problem is that we think of our future selves as other people, it follows that trying to identify more closely with our future selves will encourage us to make better long-term decisions. G) In a follow-up study, Hershfield wanted to explore ways to bridge the disconnect between the present and future selves and encourage people to save more for retirement. He and his team took photos of study participants, and then used image processing to visually age their faces. Participants were then placed in a virtual reality setting where they could look into a mirror and see their aged selves looking back at them. Participants who saw their aged selves said they would save 30% more of their salary for retirement than the control group. H) Whatever your long-term goals may be—getting in better shape, launching your own business, writing a book —thinking about your deadline in terms of days rather than months or years can help you wrap your mind around how close the future really is. I) The third solution is to forget about your future self and use your present self''s love of instant gratification(满 足感) to your advantage. While the two tactics(手段) above can be effective in making better long-term choices, in the end, you''re still struggling against human nature. Our brains are hard-wired for instant gratification. Instead of fighting your present self''s need for immediate rewards, why not use it to your advantage? When most of us set goals, we focus on long-term results we want to see—e.g., losing weight, getting a promotion, retiring in comfort, etc. While those visions of our future selves can be inspiring, when it comes to actually doing the day-to-day work, it may be more effective to reframe activities in terms of their immediate, or at least very near-term, rewards. J) Take writing this article, for instance. It''s easy for me to imagine how amazing it will feel at the end of the workday to have this article done. This isn''t just my opinion. Research partners Kaitlin Woolley of Cornell University and Ayelet Fishbach of the University of Chicago have made a career out of studying the differences between the goals that people achieve and the ones that fall to the wayside. K) "In one study, we asked people online about the goals they set at the beginning of the year. Most people set goals to achieve delayed, long-term benefits, such as career advancement, debt repayment, or improved health. We asked these individuals how enjoyable it was to pursue their goal, as well as how important their goal was. We also asked whether they were still working on their goals two months after setting them. We found that enjoyment predicted people''s goal persistence two months after setting the goal far more than how important they rated their goal to be," Woolley said. L) This pattern held true across a wide variety of goals from exercising to studying to eating healthier foods. For example, people ate 50% more of a healthy food when directed to focus on the good taste rather than the long-term health benefits. Other studies have shown a greater uptake of exercise in people who were told to think of the enjoyment of doing the exercise now rather than future health gains. M) These findings suggest that when it comes to achieving your goals, enjoying the process itself is more important than wanting the long-term benefits. In other words, present self trumps(战胜) future self. Who says instant gratification has to be a bad thing? By all means, set ambitious long-term goals for your future self, but when it comes to actually following through day-to-day, make sure your present self knows what''s in it for her too.', NULL, NULL, 1032, 'IMPORT', 'cet4-2024-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-2-r2'
);
SET @pg_cet4_2024_06_2_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-2-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-r3', 'CAREFUL_READING', 'CET4', NULL, 'People often wonder why some entrepreneurs have greater success than others. Is it habits, connections, luck, work ethic or any other behavior? I believe the key to success is willpower. Willpower is the ability to control yourself. It is a strong determination that allows you to do something difficult. It is a behavior we are born with more than one we learn; however, it is possible to not only learn it, but also strengthen it with constant exercise. Willpower is just like a muscle; to keep it strong you need to constantly exercise it. People with a great amount of willpower have the discipline to develop positive, successful habits. Even with an incredible amount of talent, without the discipline and motivation to create positive habits, it can be difficult to achieve success. Willpower and habits go hand in hand. It is critical to create good habits and take the actions necessary to stick to those habits day in and day out for greater success. Almost half of our daily actions are part of our habits and not decisions, so once the correct habits are in place, you will automatically perform those tasks on a day-to-day basis. The best way to create and stick to a habit is to have strong motivation. It''s easier to change your habits to lose weight if you have a health issue and you want to be around longer for your kids, or if your business is something you''re passionate about. Having a valuable outcome associated with a habit will help you stick to that habit permanently. The art of self-control is one that most successful individuals have mastered. Self-control enables you to avoid behaviors that don''t contribute to your success and adopt those that do. Because there is a delayed satisfaction associated with self-control, it can be easy to get off track. However, if you work on sticking to those small positive habits one day at a time, it becomes easier to stay strong and achieve that delayed reward. Once a reward is achieved, it is much easier to continue sticking to your habits.', NULL, NULL, 349, 'IMPORT', 'cet4-2024-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-2-r3'
);
SET @pg_cet4_2024_06_2_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-2-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-r4', 'CAREFUL_READING', 'CET4', NULL, 'Today, most scientific research is funded by government grants, companies doing research and development, and non-profit foundations. As a society, we reap the rewards from this science, but we also help pay for it. You indirectly support science through taxes you pay, products and services you purchase, and donations you make. Funding for science has changed with the times. Historically, science has been largely supported through private patronage(资助), church sponsorship, or simply paying for the research yourself. Today, researchers are likely to be funded by a mix of grants from various government agencies, institutions, and foundations. Other research is funded by private companies. Such corporate sponsorship is widespread in some fields. Almost 75% of U.S. clinical trials in medicine are paid for by private companies. And, of course, some researchers today still fund small-scale studies out of their own pockets. Most of us can''t afford to do nuclear research as a private hobby, but birdwatchers, rock collectors, and others can do real research on a limited budget. In a perfect world, money wouldn''t matter—all scientific studies would be completely objective. But in the real world, funding may introduce biases. Drug research sponsored by the pharmaceutical(制药的) industry is more likely to end up favoring the drug under consideration than studies sponsored by government grants or charitable organizations. Similarly, nutrition research sponsored by the food industry is more likely to end up favoring the food under consideration than independently funded research. So what should we make of all this? Should we ignore any research funded by companies or special interest groups? Certainly not. These groups provide invaluable funding for scientific research. Furthermore, science has many safeguards in place to catch instances of bias that affect research outcomes. Ultimately, misleading results will be corrected as science proceeds; however, this process takes time. Meanwhile, it pays to examine studies funded by industry or special interest groups with extra care. Are the results consistent with other independently funded studies? What do other scientists have to say about this research? A little examination can go a long way towards identifying bias associated with the funding source.', NULL, NULL, 350, 'IMPORT', 'cet4-2024-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-2-r4'
);
SET @pg_cet4_2024_06_2_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-2-r4' LIMIT 1);

-- 翻译 cet4-2024-06-2
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-translation'
);
SET @q_cet4_2024_06_2_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_01, '农历 (the lunar calendar) 起源于数千年前的中国，根据太阳和月亮的运行规律制定。长期以来，农历在农业生产和人们日常生活中发挥着重要作用。古人依据农历记录日期、安排农活，以便最有效地利用自然资源和气候条件，提高农作物的产量和质量。中国的春节、中秋节等传统节日的日期都基于农历。农历是中国传统文化的重要组成部分，当今依然广为使用。', NULL, 'The lunar calendar originated in China thousands of years ago and was formulated based on the movements of the sun and the moon. For a long time, it has played an important role in agricultural production and people''s daily life. In the past, ancient people recorded dates and arranged farm work according to the lunar calendar, in order to make the most effective use of natural resources and climatic conditions, thereby improving the yield and quality of crops. The dates of China''s traditional festivals, such as the Spring Festival and the Mid-Autumn Festival, are based on the lunar calendar. As an important part of traditional Chinese culture, the lunar calendar is still widely used today.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_01
);

-- 听力 Q1 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q01', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q01'
);
SET @q_cet4_2024_06_2_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_02, NULL, '{"A":"A) It hit a bird shortly after takeoff.","B":"B) Its crew members went on strike.","C":"C) It narrowly escaped a plane crash when turning around.","D":"D) Its captain got slightly injured during the forced landing."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_02
);

-- 听力 Q2 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q02', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q02'
);
SET @q_cet4_2024_06_2_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_03, NULL, '{"A":"A) Panic.","B":"B) Nervous.","C":"C) Relieved.","D":"D) Contented."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_03
);

-- 听力 Q3 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q03', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q03'
);
SET @q_cet4_2024_06_2_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_04, NULL, '{"A":"A) He is now kept in a secure area.","B":"B) He has escaped the zoo once again.","C":"C) He has been caught a second time.","D":"D) He finally disappeared six days ago."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_04
);

-- 听力 Q4 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q04', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q04'
);
SET @q_cet4_2024_06_2_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_05, NULL, '{"A":"A) Squeezed.","B":"B) Threatened.","C":"C) Disappointed.","D":"D) Frustrated."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_05
);

-- 听力 Q5 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q05', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q05'
);
SET @q_cet4_2024_06_2_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_06, NULL, '{"A":"A) It is condemned as a crazy idea.","B":"B) It is enriching the city''s night life.","C":"C) It is questioned by local residents.","D":"D) It is giving rise to safety concerns."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_06
);

-- 听力 Q6 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q06', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q06'
);
SET @q_cet4_2024_06_2_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_07, NULL, '{"A":"A) Avoid entering one-way streets.","B":"B) Ensure the safety of pedestrians.","C":"C) Follow all the traffic rules drivers do.","D":"D) Give way to automobiles at all times."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_07
);

-- 听力 Q7 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q07', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q07'
);
SET @q_cet4_2024_06_2_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_08, NULL, '{"A":"A) To ease the city''s busy traffic.","B":"B) To bring new life into the city.","C":"C) To add a new means of transport.","D":"D) To reduce the city''s air pollution."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q08', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q08'
);
SET @q_cet4_2024_06_2_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_09, NULL, '{"A":"A) Take it seriously.","B":"B) Discuss it regularly.","C":"C) Make it sound scary.","D":"D) Talk about it openly."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_09
);

-- 听力 Q9 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q09', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q09'
);
SET @q_cet4_2024_06_2_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_10, NULL, '{"A":"A) By shopping around for the best deals.","B":"B) By making abstract sums relevant.","C":"C) By citing concrete examples.","D":"D) By visiting discount stores."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_10
);

-- 听力 Q10 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q10', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q10'
);
SET @q_cet4_2024_06_2_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_11, NULL, '{"A":"A) Paying their kids to help with housework.","B":"B) Setting kids a good example by sharing chores.","C":"C) Giving kids pocket money according to their needs.","D":"D) Urging kids to deposit some of their gift money."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_11
);

-- 听力 Q11 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q11', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q11'
);
SET @q_cet4_2024_06_2_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_12, NULL, '{"A":"A) The importance of cutting down family expenses.","B":"B) The need to learn important lessons from her elders.","C":"C) The delight in seeing their savings grow.","D":"D) The necessity of saving into a pension."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_12
);

-- 听力 Q12 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q12', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q12'
);
SET @q_cet4_2024_06_2_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_13, NULL, '{"A":"A) He is a successful businessman.","B":"B) He reviews books on political affairs.","C":"C) He has published a new bestseller.","D":"D) He has worked in several banks."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_13
);

-- 听力 Q13 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q13', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q13'
);
SET @q_cet4_2024_06_2_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_14, NULL, '{"A":"A) The man''s ideas about education.","B":"B) The man''s academic background.","C":"C) The man''s attempts at drawing public attention.","D":"D) The man''s proposals to solve economic problems."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_14
);

-- 听力 Q14 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q14', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q14'
);
SET @q_cet4_2024_06_2_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_15, NULL, '{"A":"A) To reduce students'' financial burden.","B":"B) To motivate all students to be successful.","C":"C) To give students incentive to excel in economics.","D":"D) To provide remedies for students'' poor performance."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_15
);

-- 听力 Q15 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q15', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q15'
);
SET @q_cet4_2024_06_2_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_16, NULL, '{"A":"A) Improving school budgeting.","B":"B) Increasing tuition fees.","C":"C) Seeking donations.","D":"D) Raising taxes."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_16
);

-- 听力 Q16 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q16', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q16'
);
SET @q_cet4_2024_06_2_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_17, NULL, '{"A":"A) To show his sympathy towards people always being busy.","B":"B) To prevent people from complaining about being \\"busy\\".","C":"C) To call on busy people to take care of themselves.","D":"D) To help busy people to sort out their priorities."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_17
);

-- 听力 Q17 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q17', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q17'
);
SET @q_cet4_2024_06_2_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_18, NULL, '{"A":"A) Avoid saying we are busy.","B":"B) Reflect on their true purpose.","C":"C) Describe our schedule in detail.","D":"D) Respond as most busy people do."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_18
);

-- 听力 Q18 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q18', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q18'
);
SET @q_cet4_2024_06_2_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_19, NULL, '{"A":"A) To show their achievements resulted from great efforts.","B":"B) To prove they stand out as accomplished professionals.","C":"C) To cover up their failure to achieve some purpose.","D":"D) To tell others a complete lie about their inability."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_19
);

-- 听力 Q19 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q19', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q19'
);
SET @q_cet4_2024_06_2_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_20, NULL, '{"A":"A) They will help one reduce fear","B":"B) They should become so popular.","C":"C) They will be less challenging after a time.","D":"D) They should cover so many different types."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_20
);

-- 听力 Q20 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q20', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q20'
);
SET @q_cet4_2024_06_2_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_21, NULL, '{"A":"A) To break one''s ultimate limits.","B":"B) To stop being extremely afraid.","C":"C) To avoid dangerous mistakes.","D":"D) To enjoy the sports to the full."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_21
);

-- 听力 Q21 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q21', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q21'
);
SET @q_cet4_2024_06_2_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_22, NULL, '{"A":"A) By allowing our motivation to be at an all-time high.","B":"B) By stopping us hurting the same muscles repeatedly.","C":"C) By burning as many as 300 calories per hour.","D":"D) By enabling us to get an all-over workout."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_22
);

-- 听力 Q22 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q22', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q22'
);
SET @q_cet4_2024_06_2_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_23, NULL, '{"A":"A) It is natural.","B":"B) It is instrumental.","C":"C) It is personal.","D":"D) It is vital."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_23
);

-- 听力 Q23 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q23', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q23'
);
SET @q_cet4_2024_06_2_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_24, NULL, '{"A":"A) To guard against being perceived negatively.","B":"B) To prevent themselves from being isolated.","C":"C) To conceal personality preferences.","D":"D) To maintain workplace harmony."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_24
);

-- 听力 Q24 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q24', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q24'
);
SET @q_cet4_2024_06_2_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_25, NULL, '{"A":"A) It helps to enhance team spirit.","B":"B) It stimulates innovative ideas.","C":"C) It helps to resolve problems.","D":"D) It facilitates policy-making."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_25
);

-- 听力 Q25 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q25', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q25'
);
SET @q_cet4_2024_06_2_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_26, NULL, '{"A":"A) An innovative mind.","B":"B) Corporate culture.","C":"C) Mutual trust.","D":"D) A healthy mentality."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q26'
);
SET @q_cet4_2024_06_2_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_27, NULL, '{"A":"A) approximately","B":"B) attaining","C":"C) conclusion","D":"D) difficult","E":"E) emerges","F":"F) fixed","G":"G) ignored","H":"H) legally","I":"I) manipulated","J":"J) recommended","K":"K) refraining","L":"L) signals","M":"M) significantly","N":"N) source","O":"O) ultimate"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q27'
);
SET @q_cet4_2024_06_2_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_28, NULL, '{"A":"A) approximately","B":"B) attaining","C":"C) conclusion","D":"D) difficult","E":"E) emerges","F":"F) fixed","G":"G) ignored","H":"H) legally","I":"I) manipulated","J":"J) recommended","K":"K) refraining","L":"L) signals","M":"M) significantly","N":"N) source","O":"O) ultimate"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q28'
);
SET @q_cet4_2024_06_2_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_29, NULL, '{"A":"A) approximately","B":"B) attaining","C":"C) conclusion","D":"D) difficult","E":"E) emerges","F":"F) fixed","G":"G) ignored","H":"H) legally","I":"I) manipulated","J":"J) recommended","K":"K) refraining","L":"L) signals","M":"M) significantly","N":"N) source","O":"O) ultimate"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q29'
);
SET @q_cet4_2024_06_2_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_30, NULL, '{"A":"A) approximately","B":"B) attaining","C":"C) conclusion","D":"D) difficult","E":"E) emerges","F":"F) fixed","G":"G) ignored","H":"H) legally","I":"I) manipulated","J":"J) recommended","K":"K) refraining","L":"L) signals","M":"M) significantly","N":"N) source","O":"O) ultimate"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q30'
);
SET @q_cet4_2024_06_2_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_31, NULL, '{"A":"A) approximately","B":"B) attaining","C":"C) conclusion","D":"D) difficult","E":"E) emerges","F":"F) fixed","G":"G) ignored","H":"H) legally","I":"I) manipulated","J":"J) recommended","K":"K) refraining","L":"L) signals","M":"M) significantly","N":"N) source","O":"O) ultimate"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q31'
);
SET @q_cet4_2024_06_2_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_32, NULL, '{"A":"A) approximately","B":"B) attaining","C":"C) conclusion","D":"D) difficult","E":"E) emerges","F":"F) fixed","G":"G) ignored","H":"H) legally","I":"I) manipulated","J":"J) recommended","K":"K) refraining","L":"L) signals","M":"M) significantly","N":"N) source","O":"O) ultimate"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q32'
);
SET @q_cet4_2024_06_2_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_33, NULL, '{"A":"A) approximately","B":"B) attaining","C":"C) conclusion","D":"D) difficult","E":"E) emerges","F":"F) fixed","G":"G) ignored","H":"H) legally","I":"I) manipulated","J":"J) recommended","K":"K) refraining","L":"L) signals","M":"M) significantly","N":"N) source","O":"O) ultimate"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q33'
);
SET @q_cet4_2024_06_2_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_34, NULL, '{"A":"A) approximately","B":"B) attaining","C":"C) conclusion","D":"D) difficult","E":"E) emerges","F":"F) fixed","G":"G) ignored","H":"H) legally","I":"I) manipulated","J":"J) recommended","K":"K) refraining","L":"L) signals","M":"M) significantly","N":"N) source","O":"O) ultimate"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q34'
);
SET @q_cet4_2024_06_2_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_35, NULL, '{"A":"A) approximately","B":"B) attaining","C":"C) conclusion","D":"D) difficult","E":"E) emerges","F":"F) fixed","G":"G) ignored","H":"H) legally","I":"I) manipulated","J":"J) recommended","K":"K) refraining","L":"L) signals","M":"M) significantly","N":"N) source","O":"O) ultimate"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q35'
);
SET @q_cet4_2024_06_2_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_36, NULL, '{"A":"A) approximately","B":"B) attaining","C":"C) conclusion","D":"D) difficult","E":"E) emerges","F":"F) fixed","G":"G) ignored","H":"H) legally","I":"I) manipulated","J":"J) recommended","K":"K) refraining","L":"L) signals","M":"M) significantly","N":"N) source","O":"O) ultimate"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q36'
);
SET @q_cet4_2024_06_2_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_37, 'Our brains are genetically determined to satisfy immediate desires.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q37'
);
SET @q_cet4_2024_06_2_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_38, 'Taken in a practical way, saving for post-work years is like giving money away to others.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q38'
);
SET @q_cet4_2024_06_2_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_39, 'Research found that, as regards achievement of one''s goals, it is important to focus more on enjoying the process than the long-term benefits.', NULL, 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q39'
);
SET @q_cet4_2024_06_2_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_40, 'Regarding our future selves as still being ourselves will help us make better long-term decisions.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q40'
);
SET @q_cet4_2024_06_2_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_41, 'Savings rates in America have dropped in recent decades even though people''s life expectancy has increased.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q41'
);
SET @q_cet4_2024_06_2_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_42, 'Researchers found that enjoyment rather than importance enabled people to persist in their goals.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q42'
);
SET @q_cet4_2024_06_2_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_43, 'When making decisions, we give priority to our current frame of mind without thinking much of the consequences.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q43'
);
SET @q_cet4_2024_06_2_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_44, 'People ate more of a healthy food when they focused on its good taste instead of its long-term benefits.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q44'
);
SET @q_cet4_2024_06_2_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_45, 'As was expected, when people thought of their present selves, their brains were observed to become more active.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q45'
);
SET @q_cet4_2024_06_2_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_46, 'Researchers found that participants who saw the images of their aged selves would save more for their later years than those who didn''t.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q46'
);
SET @q_cet4_2024_06_2_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_47, 'What does the author say we need to do to strengthen our willpower?', '{"A":"A) Keep it under control.","B":"B) Apply it continuously.","C":"C) Learn from entrepreneurs.","D":"D) Aim at success determinedly."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q47'
);
SET @q_cet4_2024_06_2_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_48, 'How are almost half of our daily actions performed according to the passage?', '{"A":"A) Out of habit.","B":"B) With determination.","C":"C) Like muscle building.","D":"D) By self-discipline."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q48'
);
SET @q_cet4_2024_06_2_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_49, 'What will help people stick to doing something constructive automatically?', '{"A":"A) Practising it on a day-to-day basis.","B":"B) Associating it with improving health.","C":"C) Possessing a reasonable amount of talent.","D":"D) Foreseeing the desired outcome it will yield."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q49'
);
SET @q_cet4_2024_06_2_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_50, 'How does the art of self-control help us succeed?', '{"A":"A) By allowing us to remain clear-headed permanently.","B":"B) By enabling us to alter our behaviors constantly.","C":"C) By enabling us to take positive actions","D":"D) By allowing us to avoid taking risks."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q50'
);
SET @q_cet4_2024_06_2_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_51, 'Why can it be difficult for us to maintain self-control?', '{"A":"A) Most of us are not in the habit of exercising self-control.","B":"B) We may not get immediate rewards from self-control.","C":"C) Self-control tends to be associated with pains.","D":"D) Self-control only brings about small benefits."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q51'
);
SET @q_cet4_2024_06_2_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_52, 'What does the passage mainly discuss regarding scientific research?', '{"A":"A) Its foundation.","B":"B) Its rewards.","C":"C) Its prospect.","D":"D) Its funding."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q52'
);
SET @q_cet4_2024_06_2_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_53, 'What do we learn from the passage about researchers like birdwatchers and rock collectors?', '{"A":"A) They have little access to government funding.","B":"B) They can do research with limited resources.","C":"C) They can do amateur work in their own fields.","D":"D) They have no means for large-scale research."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q53'
);
SET @q_cet4_2024_06_2_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_54, 'What would scientific studies look like in a perfect world according to the author?', '{"A":"A) They would be totally unbiased.","B":"B) They would be independently funded.","C":"C) They would be responsibly conducted.","D":"D) They would be strictly supervised"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q54'
);
SET @q_cet4_2024_06_2_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_55, 'What does the author say about companies and special interest groups?', '{"A":"A) They try hard to pull down the safeguards for research.","B":"B) They make extra efforts to research their own products.","C":"C) They provide valuable resources for scientific research.","D":"D) They reap the most benefits from scientific research."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-2-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q55'
);
SET @q_cet4_2024_06_2_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-2-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_2_56, 'What does the author think of research funded by industry or special interest groups?', '{"A":"A) Its recommendations should be examined for feasibility.","B":"B) Its misleading results should be corrected in time.","C":"C) Its validity should be checked with additional care.","D":"D) Its hidden biases should be identified independently."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_2_56
);

-- ==================== cet4-2024-06-3 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-r1', 'BANKED_CLOZE', 'CET4', NULL, 'Over the coming decades, millions of jobs will be threatened by robotics and artificial intelligence. Despite intensive academic __26__ on these developments, there has been little study on how workers __27__ to being replaced through technology. To find out, business researchers at TUM and Erasmus University Rotterdam conducted 11 studies and surveys with over 2,000 persons from several countries. The findings show: In principle, most people view it more __28__ when workers are replaced by other people than by robots or intelligent software. This preference __29__ , however, when it refers to people''s own jobs. When that is the case, the majority of workers find it less upsetting to see their own jobs go to robots than to other employees. In the long term, however, the same people see machines as more threatening to their future role in the workforce. These effects can also be observed among people who have recently become unemployed. The researchers were able to identify the causes behind these __30__ paradoxical results, too: People tend to __31__ themselves less with machines than with other people. Consequently, being replaced by a robot or software __32__ less of a threat to their feeling of self-worth. This reduced self-threat could even be observed when participants assumed that they were being replaced by other employees who relied on technological abilities such as artificial intelligence in their work. "Even when unemployment results from the __33__ of new technologies, people still judge it in a social context," says Christoph Fuchs, one of the authors of the study. "It is important to understand these __34__ effects when trying to manage the massive changes in the working world to minimize __35__ in society."', NULL, '["A) compare","B) contradicts","C) conventional","D) debate","E) disruptions","F) drastically","G) favorably","H) guarantee","I) introduction","J) modifications","K) poses","L) psychological","M) react","N) reverses","O) seemingly"]', 279, 'IMPORT', 'cet4-2024-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-3-r1'
);
SET @pg_cet4_2024_06_3_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-3-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-r2', 'MATCHING', 'CET4', 'No escape as ''snow day'' becomes ''e-learning day''', 'A) Certain institutions, such as schools, are likely to close when bad weather, such as snow, flooding or extreme heat or cold, causes travel difficulties, power outages( 断供), or otherwise endangers public safety. When snowy weather arrives in the US, it means the chance of school children benefiting from the long-standing tradition of the "snow day", when schools are forced to close and students get an unexpected day off. B) The criterion for a snow day is primarily the inability of school buses to operate safely on their routes and danger to children who walk to school. Often, the school remains officially open even though buses do not run and classes are canceled. Severe weather that causes cancellation or delay is more likely in regions that are less able to handle the situation. Snow days are less common in more northern areas of the United States that are used to heavy winter snowfall, because municipalities are well equipped to clear roads and remove snow. In areas less accustomed to snow even small snowfalls of an inch or two may render roads unsafe. C) Snow days are a familiar theme in American film and TV shows, with children getting the good news and then running outside for some seasonal snowman-building and snowball throwing, against a background of joyful pop music. But the tradition is now over for pupils in several US states such as South Carolina, Nevada, Georgia and Indiana. This academic year, many school boards have introduced policies which require students to work from home if the school is shut by snow or extreme weather. They are known as "e- learning days", which certainly sounds less fun than a snow day. D) Teachers are also losing their snow days and instead will be expected to be on hand to take a virtual register and answer students'' questions online. A pilot programme in a school district in Anderson County, South Carolina, has supplied students with electronic tablets loaded with assignments to complete in the event of a school closure. If it is successful, it could be rolled out across the state. E) But some parents object to the new policy if the vigorous debate on the Facebook page of Anderson County school district is anything to go by. "When it snows, let the kids enjoy it," said one commenter. Another said the decision would "ruin school even more", and someone else called snow days "a fun part of childhood". But supporters of the policy say it means children will miss fewer days of school. It will also bring to an end a less popular US high school tradition: the "make-up day", which requires students in many states to make up the time lost due to weather by working during school holidays. F) Students in North Carolina already have several make-up days scheduled because of school closures during Hurricane Florence, which struck in September. Tom Wilson, the superintendent(主管) of Anderson County school district, said the change away from snow days makes practical and financial sense. He said technology has changed every profession, so it makes sense to use it to "eliminate" make-up days. Adam Baker of the Department of Education in Indiana said e-learning days were proving a "great success". He said most Indiana schools already use digital devices during lessons, so it was an "easy decision" to extend this to days when schools are closed. He denies the decision is depriving children of the chance to enjoy the snow. "Students are still able to enjoy snow days and outside time," he said. "Many have PE and science assignments that have them out enjoying the weather." But local school superintendents in Ohio are resisting proposals to adopt e-learning days. They fear that students without internet access at home will be disadvantaged by the policy, and superintendent Tom Roth is concerned that e-learning days will offer a lower quality of education. G) There are also so-called "blizzard bags", with assignments that children take home ahead of an expected snow closure. But Mr Roth says it is not sufficient as a replacement. "I think we still need the class time to give our kids the education that they deserve," he said. "You can''t get that with a blizzard bag or doing the work from home like that. It''s not going to be as effective." H) There is a long-running debate on whether missing days of school affects attainment. In England, there has been a focus on tackling absenteeism(旷课) from school. The Department for Education (DFE) published research in 2016 arguing that missing any days at school could have a negative impact on results. Even a few days lost in a year could be enough to miss out on getting a good exam grade, the DFE''s research concluded. This differed from the findings of a study from Harvard University in the US, which concluded that missing a few occasional days because of the weather did not damage learning. I) The Harvard study examined seven years of school results data and could not find any impact from snow closures. What caused more disruption was when schools tried to stay open in bad weather, even though many staff and pupils were absent. But weather can make a difference to school results, according to another piece of Harvard research published last summer. It''s hot weather that has the negative impact. The results of 10 million school students were examined over 13 years and researchers found a "significant" link between years with extremely hot weather and lower results. J) It''s obvious that students should go to school every day to get the most out of education. In cases of extreme weather students don''t always have that option. However, research shows that authorised absences from school such as during extreme weather are less problematic for students than absences that are not authorised. This is because unauthorised absences tend to reflect patterns and behaviours of student disengagement, or the possible negative attitudes of parents towards education that students adopt and carry with them through schooling. The level of impact on students'' educational performance is all to do with the length of time that a student is absent from school and how regularly this occurs.', NULL, NULL, 1033, 'IMPORT', 'cet4-2024-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-3-r2'
);
SET @pg_cet4_2024_06_3_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-3-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-r3', 'CAREFUL_READING', 'CET4', NULL, 'It may sound surprising, but you don''t have to be interested in fashion, or even in history, to enjoy Dress Codes: How the Laws of Fashion Made History. I happen to be interested in both, and ended up enjoying the book for completely different reasons. Richard Thompson Ford is a law professor, and you probably won''t forget that for even one page. His carefully reasoned arguments, packed with examples, sound almost like reading a court opinion, only maybe wordier. You will probably never think of fashion as a trifle again. Ford''s thesis is that the best way to understand what particular fashions meant in any given era is to look at the restrictions placed on them. Through this lens, he shows us that the first laws passed in the 1200s to ensure that only the nobility were allowed to wear certain fabrics, colors and ornaments reflected the rise of the middle class, who were now able to imitate some of these fashions. The status of the upper classes was threatened; fashion was a tool to preserve it. Ford takes the reader through the evolution of fashion while examining the underlying motivations of status, sex, power, and personality, which, he assumes, influenced all innovations in fashion in the past and which continue to influence us today. His writing is more than a little dense—dense with research, clauses, and precise adjectives and nouns. But there''s also humor and enough interesting episodes to make the writing appealing. No one is spared his sharp analysis: not the easy targets of 19th century women''s crippling(伤害身体的) fashions nor the modern uniforms of Silicon Valley T-shirts But the greatest strength of this book (on fashion!) is its intellectual profoundness. Ford asks us to question unconscious beliefs, to realize that we almost never do so, to understand that the simplest choices are charged with meaning, and yet that meaning can and does change all the time. Consider the fact that a 1918 catalog insisted that boys and girls be dressed in the appropriate color. We believe our thinking today is evolved; Ford shows us it''s not.', NULL, NULL, 348, 'IMPORT', 'cet4-2024-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-3-r3'
);
SET @pg_cet4_2024_06_3_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-3-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-r4', 'CAREFUL_READING', 'CET4', NULL, 'The art of persuasion means convincing others to agree with your point of view or to follow your course of action. For some of us, persuasion is an instinctive quality and the power of influencing comes naturally. For the rest of us, persuasion skills can be learned and developed over time. Employers place a great value on employees with persuasion skills because they can impact several aspects of job performance. Besides, teamwork and leadership rely heavily on the power of persuasion to get things done. Without persuasion skills, employees may not be as committed to or convinced of the importance of an organization''s vision and long-term mission. Effective use of persuasion skills will not only help get your coworkers excited about your ideas, it''ll also help you motivate them to achieve a common goal. In order to learn the art of persuasion at the workplace, you need to understand how to handle conflicts and reach agreements. Good communication is the first step in effective persuasion, but logic and reasoning are just as important. Before you can get somebody on-board with your goal, you should help them understand why they should pursue it. Using visual aids to back up your ideas can help communicate your ideas better and make compelling arguments so your listeners will come to a logical choice and become fully committed to your ideas and plans. Successful persuasion skills are based on your ability to have positive interactions and maintain meaningful relationships with people. In order to sustain those relationships, you must be able to work in their best interests as well. Your coworkers are more likely to agree with you when they succeed alongside you. The more they achieve and the greater progress they make, the more they trust your judgement and strength. We persuade and get persuaded every day—we''re either convincing or being convinced. A vast majority of people prefer collaboration and teamwork over traditional organizational structures; no one likes to be told what to do or to be pushed around. Therefore, organizations and leaders should adopt powerful persuasion skills to bring about necessary changes.', NULL, NULL, 349, 'IMPORT', 'cet4-2024-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-3-r4'
);
SET @pg_cet4_2024_06_3_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-06-3-r4' LIMIT 1);

-- 翻译 cet4-2024-06-3
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-translation'
);
SET @q_cet4_2024_06_3_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_01, '汉语中的 "福"字 (the character fu)表示幸福和好运,是中国传统文化中最常用的吉祥(auspicious) 符号之一。人们通常将一个大大的福字写在红纸上, 寓意期盼家庭幸福、社会安定、国家昌盛。春节贴福字是民间由来已久的习俗。为了欢庆春节, 家家户户都会将福字贴在门上或墙上, 表达对幸福生活的向往、对美好未来的期待。人们有时还将福字倒过来贴，表示幸福已到、好运已到。', NULL, 'The Chinese character "Fu" means happiness and good fortune, and is one of the most commonly used auspicious symbols in traditional Chinese culture. People usually write a large character "Fu" on red paper, expressing their wish for family happiness, social stability and national prosperity. Pasting the character "Fu" during the Spring Festival is a long-standing folk custom. To celebrate the Spring Festival, every household pastes the character "Fu" on doors or walls, expressing their longing for a happy life and their expectation for a better future. Sometimes people also paste the character "Fu" upside down to indicate that happiness and good fortune have arrived.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_01
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q26'
);
SET @q_cet4_2024_06_3_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_02, NULL, '{"A":"A) compare","B":"B) contradicts","C":"C) conventional","D":"D) debate","E":"E) disruptions","F":"F) drastically","G":"G) favorably","H":"H) guarantee","I":"I) introduction","J":"J) modifications","K":"K) poses","L":"L) psychological","M":"M) react","N":"N) reverses","O":"O) seemingly"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_02
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q27'
);
SET @q_cet4_2024_06_3_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_03, NULL, '{"A":"A) compare","B":"B) contradicts","C":"C) conventional","D":"D) debate","E":"E) disruptions","F":"F) drastically","G":"G) favorably","H":"H) guarantee","I":"I) introduction","J":"J) modifications","K":"K) poses","L":"L) psychological","M":"M) react","N":"N) reverses","O":"O) seemingly"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_03
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q28'
);
SET @q_cet4_2024_06_3_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_04, NULL, '{"A":"A) compare","B":"B) contradicts","C":"C) conventional","D":"D) debate","E":"E) disruptions","F":"F) drastically","G":"G) favorably","H":"H) guarantee","I":"I) introduction","J":"J) modifications","K":"K) poses","L":"L) psychological","M":"M) react","N":"N) reverses","O":"O) seemingly"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_04
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q29'
);
SET @q_cet4_2024_06_3_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_05, NULL, '{"A":"A) compare","B":"B) contradicts","C":"C) conventional","D":"D) debate","E":"E) disruptions","F":"F) drastically","G":"G) favorably","H":"H) guarantee","I":"I) introduction","J":"J) modifications","K":"K) poses","L":"L) psychological","M":"M) react","N":"N) reverses","O":"O) seemingly"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_05
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q30'
);
SET @q_cet4_2024_06_3_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_06, NULL, '{"A":"A) compare","B":"B) contradicts","C":"C) conventional","D":"D) debate","E":"E) disruptions","F":"F) drastically","G":"G) favorably","H":"H) guarantee","I":"I) introduction","J":"J) modifications","K":"K) poses","L":"L) psychological","M":"M) react","N":"N) reverses","O":"O) seemingly"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_06
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q31'
);
SET @q_cet4_2024_06_3_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_07, NULL, '{"A":"A) compare","B":"B) contradicts","C":"C) conventional","D":"D) debate","E":"E) disruptions","F":"F) drastically","G":"G) favorably","H":"H) guarantee","I":"I) introduction","J":"J) modifications","K":"K) poses","L":"L) psychological","M":"M) react","N":"N) reverses","O":"O) seemingly"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_07
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q32'
);
SET @q_cet4_2024_06_3_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_08, NULL, '{"A":"A) compare","B":"B) contradicts","C":"C) conventional","D":"D) debate","E":"E) disruptions","F":"F) drastically","G":"G) favorably","H":"H) guarantee","I":"I) introduction","J":"J) modifications","K":"K) poses","L":"L) psychological","M":"M) react","N":"N) reverses","O":"O) seemingly"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_08
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q33'
);
SET @q_cet4_2024_06_3_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_09, NULL, '{"A":"A) compare","B":"B) contradicts","C":"C) conventional","D":"D) debate","E":"E) disruptions","F":"F) drastically","G":"G) favorably","H":"H) guarantee","I":"I) introduction","J":"J) modifications","K":"K) poses","L":"L) psychological","M":"M) react","N":"N) reverses","O":"O) seemingly"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_09
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q34'
);
SET @q_cet4_2024_06_3_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_10, NULL, '{"A":"A) compare","B":"B) contradicts","C":"C) conventional","D":"D) debate","E":"E) disruptions","F":"F) drastically","G":"G) favorably","H":"H) guarantee","I":"I) introduction","J":"J) modifications","K":"K) poses","L":"L) psychological","M":"M) react","N":"N) reverses","O":"O) seemingly"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_10
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q35'
);
SET @q_cet4_2024_06_3_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_11, NULL, '{"A":"A) compare","B":"B) contradicts","C":"C) conventional","D":"D) debate","E":"E) disruptions","F":"F) drastically","G":"G) favorably","H":"H) guarantee","I":"I) introduction","J":"J) modifications","K":"K) poses","L":"L) psychological","M":"M) react","N":"N) reverses","O":"O) seemingly"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_11
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q36'
);
SET @q_cet4_2024_06_3_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_12, 'There is opposition to the practice of giving children assignments to take home before extreme weather forces a school closure.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_12
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q37'
);
SET @q_cet4_2024_06_3_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_13, 'New policies adopted by many US schools require students to do online learning at home in case of a school closure.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_13
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q38'
);
SET @q_cet4_2024_06_3_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_14, 'According to some research, extreme hot weather negatively affects students'' performance.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_14
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q39'
);
SET @q_cet4_2024_06_3_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_15, 'There is a time-honoured tradition in the US for school kids to stay at home on "snow days".', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_15
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q40'
);
SET @q_cet4_2024_06_3_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_16, 'Debates on social media show some parents are opposed to ending the "snow day" tradition.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_16
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q41'
);
SET @q_cet4_2024_06_3_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_17, 'In more northern regions of the US, school is less likely to be affected by snowy weather.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_17
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q42'
);
SET @q_cet4_2024_06_3_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_18, 'Research indicates absences from school with permission do not cause as many problems as those without permission.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_18
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q43'
);
SET @q_cet4_2024_06_3_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_19, 'There is objection to e-learning days owing to fear that students with no access to the Internet at home will suffer.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_19
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q44'
);
SET @q_cet4_2024_06_3_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_20, 'In a pilot programme, students are given electronic devices to do assignments when schools are closed.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_20
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q45'
);
SET @q_cet4_2024_06_3_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_21, 'Along-standing debate is going on over the impact of school absences on students'' academic performance.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_21
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q46'
);
SET @q_cet4_2024_06_3_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_22, 'What does the author think of the book Dress Codes: How the Laws of Fashion Made History?', '{"A":"A) It is read by people for entirely different reasons.","B":"B) It is meant for those interested in fashion history.","C":"C) It makes enjoyable as well as informative reading.","D":"D) It converts fashion into something for deliberation."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_22
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q47'
);
SET @q_cet4_2024_06_3_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_23, 'How can people best understand a particular fashion in an era, according to Ford?', '{"A":"A) By examining the restraints imposed on it.","B":"B) By looking at what the nobility were wearing.","C":"C) By glancing at its fabrics, colors and ornaments.","D":"D) By doing a survey of the upper and middle classes"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_23
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q48'
);
SET @q_cet4_2024_06_3_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_24, 'What was the aim of the first laws passed regarding fashion in the 1200s?', '{"A":"A) To facilitate the rise of the middle class.","B":"B) To loosen restrictions on dress codes.","C":"C) To help initiate some novel fashions","D":"D) To preserve the status of the nobles."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_24
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q49'
);
SET @q_cet4_2024_06_3_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_25, 'What does the author think of Ford''s writing?', '{"A":"A) It uses comparison and contrast in describing fashions of different eras.","B":"B) It makes heavy reading but is not lacking in humor or appeal.","C":"C) It is filled with interesting episodes to spare readers intolerable boredom.","D":"D) It is characteristic of academics in presenting arguments."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_25
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q50'
);
SET @q_cet4_2024_06_3_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_26, 'What does the author say is the greatest strength of Ford''s book?', '{"A":"A) Plentiful information.","B":"B) Meaningful choices.","C":"C) Evolved thinking.","D":"D) Intellectual depth"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_26
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q51'
);
SET @q_cet4_2024_06_3_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_27, 'What does the author say about the ability to be persuasive in the first paragraph?', '{"A":"A) People may either be born with it or be able to cultivate it.","B":"B) It proves crucial in making others follow one''s course of action.","C":"C) It refers to the natural and instinctive power of influencing one''s coworkers.","D":"D) People may view it as both a means to convince others and an art of communication."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_27
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q52'
);
SET @q_cet4_2024_06_3_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_28, 'Why are persuasion skills greatly valued in the workplace?', '{"A":"A) They enable employees to be convinced of their long-term gains.","B":"B) They enable employees to trust their leaders unconditionally.","C":"C) They help motivate coworkers to strive for a common goal.","D":"D) They help an organization to broaden its vision effectively."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_28
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q53'
);
SET @q_cet4_2024_06_3_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_29, 'What should people do to learn the art of persuasion at the workplace?', '{"A":"A) Acquire effective communication skills.","B":"B) Avoid getting involved in conflicts with others.","C":"C) Understand the reason for pursuing their goals.","D":"D) Commit themselves fully to their ideas and plans."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_29
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q54'
);
SET @q_cet4_2024_06_3_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_30, 'When are you more likely to succeed in persuading your coworkers?', '{"A":"A) When they are convinced you work in their interests while sacrificing your own","B":"B) When they become aware of the potential strength of the judgements you make","C":"C) When they become aware of the meaningful relationships you keep with them.","D":"D) When they are convinced they will make achievements together with you."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_30
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-06-3-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q55'
);
SET @q_cet4_2024_06_3_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-06-3-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_06_3_31, 'Why are organizations and leaders advised to adopt powerful persuasion skills to bring about necessary changes?', '{"A":"A) To convince employees of the value of collaboration","B":"B) To allow for the preferences of most people of today","C":"C) To improve on traditional organizational structures","D":"D) To adapt to employees'' ever-changing working styles"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_06_3_31
);

-- ==================== cet4-2024-12-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-r1', 'BANKED_CLOZE', 'CET4', NULL, 'When Toni Morrison died in 2019, the world lost one of its most influential authors. But Morrison was not an early success. Her first novel was not published until she was 39, and her last appeared when she was 84. And Morrison was not __26__ in this regard. Numerous writers produce masterpieces well into their 70s and beyond. Such __27__ accomplishments highlight an important point. Our capacity to speak, write and learn new vocabulary does not seem to __28__ with age. Our eyesight may dim and our recall may weaken, but, by comparison, our ability to produce and to __29__ language is well preserved into older adulthood. Indeed, the latest research that has emerged on language and aging shows that language mastery is a __30__ that we begin as infants and continue on for the rest of our lives. Some aspects of our language abilities, such as our knowledge of word meanings, __31__ improve during middle and late adulthood. One study, for example, found that adults over sixty had an average vocabulary size of over 21,000 words. The researchers also studied a __32__ of college students and found that their average vocabulary contained __33__ 16,000 words. In another study, older adults, with an average age of 75, __34__ better than participants in their youth or middle years on tasks that required them to determine the meaning of words. Thus, language seems to be a skill that, contrary to what many might __35__ , does not weaken with age.', NULL, '["A) actually","B) approximately","C) assume","D) component","E) comprehend","F) deteriorate","G) equivalent","H) journey","I) literary","J) performed","K) rarely","L) sample","M) undermined","N) unique","O) unit"]', 248, 'IMPORT', 'cet4-2024-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-1-r1'
);
SET @pg_cet4_2024_12_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-r2', 'MATCHING', 'CET4', 'Why it''s wrong to look at work-life balance as an achievement', 'A) Few topics have been so endlessly analysed as work-life balance. The quest to attain this mysterious state has dominated discussion around careers for years—especially for working parents. The concept is often presented as something to achieve, or a goal to reach. And once you''ve reached it, congratulations: you''ve made it; you''re a successful human being of the 21st century. B) But the problem is that we often tell ourselves: "I''m going to put in eight hours'' worth of work, and then I''m going to put in eight hours'' worth of ''me time'', which will include my family, my hobbies, my workout, my everything," says Anat Lechner, clinical associate professor of management at New York University. "I don''t think it''s such a simple formula." C) And, according to new findings, it may not be. Some researchers are now encouraging us to stop thinking about work-life balance as an achievement that you either hit or don''t. Instead, they suggest it may be more of a lifelong process—a continuous, never-ending exercise that requires self-awareness and timely adjustments. Researchers Ioana Lupu and Mayra Ruiz-Castro argue that work-life balance is "a cycle, not an achievement". In their 2020 study, the researchers interviewed nearly 80 employees at two London-based firms—an equal number of men and women between the ages of 30 and 50, all with at least one dependent child—who worked in middle or senior management roles. D) Although it sounds like the respondents had a lot in common, here''s what separated them: about 30% of the men and 50% of the women reported resisting working long hours. The other respondents, meanwhile, all worked long hours because they thought that''s what successful professionals should do. E) Lupu and Ruiz-Castro looked at those who rejected the long hours and they found that those workers actually had strikingly similar strategies for maintaining their work-life balance. They had a tendency to reflect and question assumptions in the name of self-awareness and regularly took steps to adjust the things standing in their way to work-life balance. F) Lupu and Ruiz-Castro identified five steps that the respondents in the study who had better work-life balance used in their jobs. First, they paused and reconsidered beliefs such as "I''m a professional, so I should work, work, work", and asked themselves questions like, "What''s currently causing me stress?" Second, after identifying the cause, they zeroed in on their resultant emotions. Did they feel angry, sad, energised? Third, they reprioritised, asking "Is working long hours really worth cutting back on family time?", for example. Fourth, they considered their alternatives: is there anything at work that could be changed to accommodate these new priorities? And finally, they implemented changes, like asking their supervisor for greater flexibility, or deciding not to take on every project that comes their way. G) This five-step process is something anyone can adopt. Going through the steps, and constantly checking in with yourself, can help you shift and adapt your professional life to something that will better harmonise with your personal one. "Awareness of your emotional state is essential in order to determine the changes you want to make in your work and in your life," says Lupu. H) New York University''s Lechner agrees that finding that balance is an ongoing pursuit. It''s not simply about dividing up the hours in your day between work, the gym, kids and chores. If the underlying emotional sources of stress are still there, then the time you actually spend at home may not be enjoyable. "We come home and even though physically we are there, mentally we still may be processing things that happened at work. We''re not present," she says. What we call "work-life balance" is actually just a substitute to having a sense of fulfillment and contentment. I) Of course, finding that balance probably shouldn''t be something you have to do by yourself. Research by Erin Kelly, professor of work and organisation studies at MIT, shows companies and managers can play a key role in creating a better environment for workers. For her book Overload: How Good Jobs Went Bad and What to Do about It, she and co-author Phyllis Moen split more than 1,000 employees at a Fortune 500 company into two groups, one that worked under a management redesign and one that continued working within the existing management structure. J) Under the management redesign, many steps were taken to ensure better work-life balance and prevent burnout(精疲力竭). Managers were regularly reminded to explicitly support their employees. Workers were allowed to make changes, like cancelling 9 am meetings. All of this was done in the name of increasing job satisfaction and giving workers greater flexibility, and to assure workers that it was something management was committed to. Unsurprisingly, Kelly and Moen found that employees in the redesign group reported less stress and less burnout. They were less likely to quit their jobs; indeed, over the next four years, they were 40% less likely to quit than those who kept working under the old policies. K) "Work-life balance is understood to be an individual''s response, so people think ''it''s up to me to manage the craziness of my work life''", says Kelly. But organisations need to examine the demands they''re placing on employees. "The root problem is not how the two pieces of work and life come together. It''s that we have unrealistic expectations of what we''re asked to do on the work side." If your workplace isn''t an environment where work-life balance is possible in the first place, any effort you attempt to make toward it on a personal level will be in vain. L) That''s a conversation that appears to be gathering pace. The new prevalence of remote and flexible working models will likely all play important roles in how we balance our professional and personal lives. And if it seems like finding that perfect balance remains difficult to achieve, the experts say that keeping some perspective can help. For millions of people, work is about being able to put food on the table. Talking about work-life balance "is a very privileged conversation", says Lechner. "If we''re reflecting, maybe we should also reflect on that."', NULL, NULL, 1025, 'IMPORT', 'cet4-2024-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-1-r2'
);
SET @pg_cet4_2024_12_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-r3', 'CAREFUL_READING', 'CET4', NULL, 'The weakening of the human connection to nature might be good for economic growth but is bad for people. A tipping point was reached in 2020 when human-made materials—such as steel, concrete and plastic— were found to weigh more than all life on Earth. Continuing to grow concrete forests rather than real ones is shortsighted. Simply being in the nearest wood has such health benefits that the Woodland Trust successfully lobbied for it to be prescribed by doctors. Yet slipping from popular culture is the wonder and beauty of the natural world. For every three nature- related words in hit songs of the 1950s, researchers found, there was only slightly more than one 50 years later. It is not a moment too soon that teenagers will be able to take a natural history test, given that for decades children have been able to name more video game characters than wildlife species. anyone to turn underused public spaces into vegetable and fruit gardens. The idea is for people to get back in touch with the soil—while producing food sustainably. Vegetable planting has a respectable tradition. In April 1649, locals responded to high prices and food shortages by cultivating vegetables on common land in Southern England. The practice of throwing seed bombs to turn vacant plots of land green took off in 1970s New York, and has been revived( 使复活) by green- thumbed(有园艺才能的) social media influencers who defy local US regulations in a war on ugly spots in cities. Apart from the urgent task of providing more healthy nutrients to those who increasingly can''t afford them, publicly accessible fruit and vegetable gardens connect what we eat to where it comes from—the means of production, if you will. They can make unlovely spaces lovely, and marry use and beauty as well as help promote a sense of community. Plants are also, of course, our first defence against species loss and climate change. Such planting is a small step for humanity—in the right direction.', NULL, NULL, 330, 'IMPORT', 'cet4-2024-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-1-r3'
);
SET @pg_cet4_2024_12_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-r4', 'CAREFUL_READING', 'CET4', NULL, 'Engineering in the U.S. has long been a male-dominated profession. Fifty years ago, it looked like that might change. In 1970, the percentage of women majoring in engineering was less than 1%. In 1979, that number was 9%. Many hoped women would continue to enter the field at the same rate. But that''s not what happened. Today, only 21% of engineering majors are women, a number largely unchanged since 2000. I am a historian who, along with my colleagues, surveyed 251 women engineers who graduated from college in the 1970s. These pioneers reflected on the challenges they faced—and had advice for women entering the field today. One survey taker explained, "The greatest challenge for me was continuing to believe in myself, when all the messages I was getting were that I would never be taken seriously or promoted or given raises at the same rate as men, who were clearly less qualified and not as smart as I was." A chemical engineer who worked in manufacturing agreed, "You have to prove yourself just because you are female. And you have to work twice as hard!" A civil engineer said, "We are ''women engineers.'' People don''t refer to a man as a ''man engineer''—he''s an engineer. We are constantly reminded that we don''t truly belong." Another civil engineer stated, "On many levels, you''re never quite one of the groups." Women also talked about family caregiving responsibilities. A retired vice president from a major chemical company stated, "Young women engineers are on an equal footing until they have children, then they struggle to balance work and family—and compete with men who don''t have the same household responsibilities." But over the years things have changed a lot. Young women engineers are more accepted mostly because there are just more of them. Many women engineers hailed the benefits of their chosen career. A program manager in manufacturing stated that engineering is the best degree. A mechanical engineer said, "It will give you the flexibility to do almost anything. It is also satisfying to see the effects of what you have done."', NULL, NULL, 347, 'IMPORT', 'cet4-2024-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-1-r4'
);
SET @pg_cet4_2024_12_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-1-r4' LIMIT 1);

-- 翻译 cet4-2024-12-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-translation'
);
SET @q_cet4_2024_12_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_01, '中国政府十分重视环境保护。近年来,中国在减少空气、水和土壤污染上取得了显著成效。为了不断改善人们的生活环境,中国采取了一系列有效措施,包括大力发展清洁能源,改善公共交通,推广共享单车,实施垃圾分类。通过这些措施,中国的城市和农村正在绿起来、美起来。中国还积极参与国际合作,为全球环境保护做出了重要贡献。', NULL, 'The Chinese government attaches great importance to environmental protection. In recent years, China has made remarkable progress in reducing air, water and soil pollution. To continuously improve people''s living environment, China has taken a series of effective measures, including developing clean energy, improving public transportation, promoting shared bikes and implementing garbage classification. Thanks to these measures, both urban and rural areas in China are becoming greener and more beautiful. China also actively participates in international cooperation, making important contributions to global environmental protection.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_01
);

-- 听力 Q1 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q01', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q01'
);
SET @q_cet4_2024_12_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_02, NULL, '{"A":"A) She is making a special effort to be recognized.","B":"B) She has been living in Fayetteville for 25 years.","C":"C) She has been driving a school bus ever since 2009.","D":"D) She is the longest-serving bus driver in Fayetteville."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_02
);

-- 听力 Q2 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q02', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q02'
);
SET @q_cet4_2024_12_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_03, NULL, '{"A":"A) The importance of their service to the city.","B":"B) The number of riders they serve in the city.","C":"C) The new proclamation issued early this week.","D":"D) The significance of the event to take place March 18."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_03
);

-- 听力 Q3 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q03', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q03'
);
SET @q_cet4_2024_12_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_04, NULL, '{"A":"A) Budgeted $56.7 million for the coming school year.","B":"B) Requested to raise teachers'' salaries by 3 percent.","C":"C) Proposed a spending increase by 5.99 percent.","D":"D) Kept raising funds for at least 8 budget cycles."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_04
);

-- 听力 Q4 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q04', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q04'
);
SET @q_cet4_2024_12_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_05, NULL, '{"A":"A) Decrease in salaries for school administrators.","B":"B) Reduction in federal and state funding.","C":"C) Firing of less qualified faculty members.","D":"D) Closing down of some less competitive schools."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_05
);

-- 听力 Q5 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q05', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q05'
);
SET @q_cet4_2024_12_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_06, NULL, '{"A":"A) They often take place in the Scottish highlands.","B":"B) They usually happen in the middle of the night.","C":"C) Their damage can be as serious as that of bombs.","D":"D) Their loud claps can be confused with explosions."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_06
);

-- 听力 Q6 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q06', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q06'
);
SET @q_cet4_2024_12_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_07, NULL, '{"A":"A) They sent out a message to calm them down.","B":"B) They promised to stop the construction work.","C":"C) They told them the military exercise was over.","D":"D) They set off to inspect the site of the plane crash."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_07
);

-- 听力 Q7 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q07', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q07'
);
SET @q_cet4_2024_12_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_08, NULL, '{"A":"A) Keep warm.","B":"B) Take caution.","C":"C) Avoid driving.","D":"D) Use rail service."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q08', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q08'
);
SET @q_cet4_2024_12_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_09, NULL, '{"A":"A) Why the man is so anxious to buy a new phone.","B":"B) How the man could possibly afford a new phone.","C":"C) How the man got into the habit of being wasteful.","D":"D) Why the man is so fond of using his credit card."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_09
);

-- 听力 Q9 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q09', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q09'
);
SET @q_cet4_2024_12_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_10, NULL, '{"A":"A) It is not in fashion any more.","B":"B) It goes out of order frequently.","C":"C) It is not as fancy as his colleagues''.","D":"D) It lacks functions office work requires."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_10
);

-- 听力 Q10 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q10', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q10'
);
SET @q_cet4_2024_12_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_11, NULL, '{"A":"A) It enables him to buy a new phone at a more favorable price.","B":"B) It is a special offer to recent college graduates working in offices.","C":"C) It is available to office workers who have a good enough credit score.","D":"D) It allows him to borrow money without paying interest for six months."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_11
);

-- 听力 Q11 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q11', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q11'
);
SET @q_cet4_2024_12_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_12, NULL, '{"A":"A) She borrowed money to pay her debt.","B":"B) She developed a habit of overspending.","C":"C) She enjoys buying a lot of fancy things.","D":"D) She regrets ignoring the woman''s advice."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_12
);

-- 听力 Q12 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q12', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q12'
);
SET @q_cet4_2024_12_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_13, NULL, '{"A":"A) Blog writing and natural resources saving.","B":"B) Joint efforts to improve the local community.","C":"C) Audience participation in The Morning Show.","D":"D) Home ownership and environmental protection."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_13
);

-- 听力 Q13 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q13', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q13'
);
SET @q_cet4_2024_12_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_14, NULL, '{"A":"A) Not a realistic size for families.","B":"B) Not welcomed by most Americans.","C":"C) Only fit for families of four or less.","D":"D) Only suitable for renting to the poor."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_14
);

-- 听力 Q14 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q14', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q14'
);
SET @q_cet4_2024_12_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_15, NULL, '{"A":"A) It should be changed.","B":"B) It isn''t easy to realize.","C":"C) It will come true sooner or later.","D":"D) It doesn''t appeal to average families."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_15
);

-- 听力 Q15 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q15', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q15'
);
SET @q_cet4_2024_12_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_16, NULL, '{"A":"A) They help to lower housing prices.","B":"B) They help to save up for larger houses.","C":"C) They are a good choice for many people.","D":"D) They are vital to reducing waste worldwide."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_16
);

-- 听力 Q16 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q16', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q16'
);
SET @q_cet4_2024_12_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_17, NULL, '{"A":"A) Play outdoors and enjoy themselves.","B":"B) Beat challenges and take risks.","C":"C) Take care of their well-being.","D":"D) Grow up strong and healthy."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_17
);

-- 听力 Q17 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q17', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q17'
);
SET @q_cet4_2024_12_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_18, NULL, '{"A":"A) Enable them to develop their motor skills.","B":"B) Help them to conceal their frustration.","C":"C) Reduce their stress and depression.","D":"D) Prevent them from feeling lonely."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_18
);

-- 听力 Q18 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q18', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q18'
);
SET @q_cet4_2024_12_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_19, NULL, '{"A":"A) It begins early.","B":"B) It proves demanding.","C":"C) It calls for lifelong efforts.","D":"D) It lies in nature experiences."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_19
);

-- 听力 Q19 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q19', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q19'
);
SET @q_cet4_2024_12_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_20, NULL, '{"A":"A) When companies share their information online.","B":"B) When their job search criteria are met fully.","C":"C) When companies embrace greater diversity","D":"D) When they find job postings visually attractive."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_20
);

-- 听力 Q20 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q20', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q20'
);
SET @q_cet4_2024_12_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_21, NULL, '{"A":"A) Emails in the normal format.","B":"B) Major companies in one location.","C":"C) All companies in the same sector.","D":"D) Various aspects of a company''s workforce."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_21
);

-- 听力 Q21 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q21', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q21'
);
SET @q_cet4_2024_12_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_22, NULL, '{"A":"A) Job security.","B":"B) Potential pay raises.","C":"C) Minimum base salary.","D":"D) Information about diversity."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_22
);

-- 听力 Q22 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q22', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q22'
);
SET @q_cet4_2024_12_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_23, NULL, '{"A":"A) Positive.","B":"B) Original.","C":"C) Important.","D":"D) Surprising."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_23
);

-- 听力 Q23 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q23', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q23'
);
SET @q_cet4_2024_12_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_24, NULL, '{"A":"A) Dogs match their behavior with kids as much as with adults.","B":"B) Kids and adults alike find in dogs a source of attachment.","C":"C) Kids'' attitude to dogs is influenced by adults.","D":"D) Dogs can help kids in many ways."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_24
);

-- 听力 Q24 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q24', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q24'
);
SET @q_cet4_2024_12_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_25, NULL, '{"A":"A) Dogs pay much attention to the kids they live with.","B":"B) Dogs view both adults and kids as social companions.","C":"C) Kids differ from adults in their behavior towards dogs.","D":"D) Kids need to be aware of the risks in playing with dogs."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_25
);

-- 听力 Q25 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q25', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q25'
);
SET @q_cet4_2024_12_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_26, NULL, '{"A":"A) Understanding dogs.","B":"B) Training dogs.","C":"C) Taking care of dogs.","D":"D) Associating with dogs."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q26'
);
SET @q_cet4_2024_12_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_27, NULL, '{"A":"A) actually","B":"B) approximately","C":"C) assume","D":"D) component","E":"E) comprehend","F":"F) deteriorate","G":"G) equivalent","H":"H) journey","I":"I) literary","J":"J) performed","K":"K) rarely","L":"L) sample","M":"M) undermined","N":"N) unique","O":"O) unit"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q27'
);
SET @q_cet4_2024_12_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_28, NULL, '{"A":"A) actually","B":"B) approximately","C":"C) assume","D":"D) component","E":"E) comprehend","F":"F) deteriorate","G":"G) equivalent","H":"H) journey","I":"I) literary","J":"J) performed","K":"K) rarely","L":"L) sample","M":"M) undermined","N":"N) unique","O":"O) unit"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q28'
);
SET @q_cet4_2024_12_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_29, NULL, '{"A":"A) actually","B":"B) approximately","C":"C) assume","D":"D) component","E":"E) comprehend","F":"F) deteriorate","G":"G) equivalent","H":"H) journey","I":"I) literary","J":"J) performed","K":"K) rarely","L":"L) sample","M":"M) undermined","N":"N) unique","O":"O) unit"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q29'
);
SET @q_cet4_2024_12_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_30, NULL, '{"A":"A) actually","B":"B) approximately","C":"C) assume","D":"D) component","E":"E) comprehend","F":"F) deteriorate","G":"G) equivalent","H":"H) journey","I":"I) literary","J":"J) performed","K":"K) rarely","L":"L) sample","M":"M) undermined","N":"N) unique","O":"O) unit"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q30'
);
SET @q_cet4_2024_12_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_31, NULL, '{"A":"A) actually","B":"B) approximately","C":"C) assume","D":"D) component","E":"E) comprehend","F":"F) deteriorate","G":"G) equivalent","H":"H) journey","I":"I) literary","J":"J) performed","K":"K) rarely","L":"L) sample","M":"M) undermined","N":"N) unique","O":"O) unit"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q31'
);
SET @q_cet4_2024_12_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_32, NULL, '{"A":"A) actually","B":"B) approximately","C":"C) assume","D":"D) component","E":"E) comprehend","F":"F) deteriorate","G":"G) equivalent","H":"H) journey","I":"I) literary","J":"J) performed","K":"K) rarely","L":"L) sample","M":"M) undermined","N":"N) unique","O":"O) unit"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q32'
);
SET @q_cet4_2024_12_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_33, NULL, '{"A":"A) actually","B":"B) approximately","C":"C) assume","D":"D) component","E":"E) comprehend","F":"F) deteriorate","G":"G) equivalent","H":"H) journey","I":"I) literary","J":"J) performed","K":"K) rarely","L":"L) sample","M":"M) undermined","N":"N) unique","O":"O) unit"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q33'
);
SET @q_cet4_2024_12_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_34, NULL, '{"A":"A) actually","B":"B) approximately","C":"C) assume","D":"D) component","E":"E) comprehend","F":"F) deteriorate","G":"G) equivalent","H":"H) journey","I":"I) literary","J":"J) performed","K":"K) rarely","L":"L) sample","M":"M) undermined","N":"N) unique","O":"O) unit"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q34'
);
SET @q_cet4_2024_12_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_35, NULL, '{"A":"A) actually","B":"B) approximately","C":"C) assume","D":"D) component","E":"E) comprehend","F":"F) deteriorate","G":"G) equivalent","H":"H) journey","I":"I) literary","J":"J) performed","K":"K) rarely","L":"L) sample","M":"M) undermined","N":"N) unique","O":"O) unit"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q35'
);
SET @q_cet4_2024_12_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_36, NULL, '{"A":"A) actually","B":"B) approximately","C":"C) assume","D":"D) component","E":"E) comprehend","F":"F) deteriorate","G":"G) equivalent","H":"H) journey","I":"I) literary","J":"J) performed","K":"K) rarely","L":"L) sample","M":"M) undermined","N":"N) unique","O":"O) unit"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q36'
);
SET @q_cet4_2024_12_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_37, 'According to a management expert, work-life balance is not as simple as giving equal amounts of time to work and personal life.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q37'
);
SET @q_cet4_2024_12_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_38, 'Research found that those who are given greater flexibility at work are less stressed and more likely to stay in their jobs.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q38'
);
SET @q_cet4_2024_12_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_39, 'Workers who rejected working long hours tended to make regular adjustments in order to achieve work-life balance.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q39'
);
SET @q_cet4_2024_12_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_40, 'Talking about work-life balance is said to be a privilege reserved for the better-off, not for those who barely make a living.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q40'
);
SET @q_cet4_2024_12_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_41, 'Knowing one''s emotional state is of utmost importance in deciding what changes to make for a better work- life balance.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q41'
);
SET @q_cet4_2024_12_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_42, 'More female professionals reported being reluctant to work overtime than their male counterparts.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q42'
);
SET @q_cet4_2024_12_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_43, 'Without organisational support, any personal effort to maintain work-life balance will be unsuccessful.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q43'
);
SET @q_cet4_2024_12_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_44, 'The question of how to achieve work-life balance has long been the main subject of discussion among workers.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q44'
);
SET @q_cet4_2024_12_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_45, 'You may not actually experience emotional wellbeing at home if you remain occupied with what happened at work.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q45'
);
SET @q_cet4_2024_12_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_46, 'Some researchers suggest that work-life balance is not a goal to achieve, but a process for life to be adjusted promptly.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q46'
);
SET @q_cet4_2024_12_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_47, 'What does the author want to emphasise in the first paragraph?', '{"A":"A) The year 2020 was a big turning point in human history.","B":"B) Economic growth benefits people little in the long run.","C":"C) It is unwise to weaken the human connection to nature.","D":"D) It is harmful to mankind to use human-made materials."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q47'
);
SET @q_cet4_2024_12_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_48, 'What did researchers find about popular culture?', '{"A":"A) It is increasingly detached from the natural world.","B":"B) It is filled with all kinds of video game characters.","C":"C) It is especially appealing to the taste of teenagers.","D":"D) It is still impacted by the hit songs of the 1950s."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q48'
);
SET @q_cet4_2024_12_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_49, 'What does the author propose people do?', '{"A":"A) Take measures to ensure sustainable food development.","B":"B) Reconnect with nature through the right to grow.","C":"C) Stand by the parliament in fighting social diseases.","D":"D) Cover public spaces with fruit trees and vegetable plants."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q49'
);
SET @q_cet4_2024_12_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_50, 'What do we learn from the passage about vegetable planting?', '{"A":"A) It all started in 1649 in Southern England.","B":"B) It is protected by US government regulations.","C":"C) It has long been used to increase food supply and improve urban landscape.","D":"D) It has been popularised worldwide with the increasing influence of social media."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q50'
);
SET @q_cet4_2024_12_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_51, 'What can publicly accessible fruit and vegetable gardens do apart from their practical functions?', '{"A":"A) Raise people''s environmental awareness.","B":"B) Add to the great variety of plant species.","C":"C) Act as the first defence against natural disasters.","D":"D) Enhance people''s community spirit."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q51'
);
SET @q_cet4_2024_12_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_52, 'What does the passage say about the engineering profession in the United States?', '{"A":"A) It has seen a change in attitude towards women engineers since 1979.","B":"B) It witnessed a significant increase in women engineers in the 1970s.","C":"C) It has experienced the gradual weakening of male dominance.","D":"D) It boasted the largest number of engineering majors in 2000."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q52'
);
SET @q_cet4_2024_12_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_53, 'What does one survey taker say was her greatest challenge?', '{"A":"A) Not to feel superior to less qualified male engineers.","B":"B) Not to take seriously all the messages she was getting.","C":"C) Not to think highly of her qualifications when promoted or given a pay raise.","D":"D) Not to lose self-confidence though constantly discouraged or unfairly treated."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q53'
);
SET @q_cet4_2024_12_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_54, 'How do women engineers frequently feel according to the two civil engineers?', '{"A":"A) Disqualified on many levels.","B":"B) Excluded from the group.","C":"C) Overworked by their organizations.","D":"D) Looked down upon by male colleagues."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q54'
);
SET @q_cet4_2024_12_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_55, 'What probably makes young women engineers more accepted nowadays?', '{"A":"A) Their success in gaining an equal footing.","B":"B) Their ability to balance work and family.","C":"C) The change in their responsibilities.","D":"D) The increase in their number."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-1-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q55'
);
SET @q_cet4_2024_12_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_1_56, 'What can we conclude about many female engineers from the statement of a mechanical engineer?', '{"A":"A) They take great pride in their chosen career.","B":"B) They have reaped the benefits of being flexible.","C":"C) They enjoy doing engineering to the best degree.","D":"D) They have proved capable of doing almost anything."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_1_56
);

-- ==================== cet4-2024-12-2 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-r1', 'BANKED_CLOZE', 'CET4', NULL, 'Scientists have known that depriving adult mice of vision can increase the sensitivity of individual neurons(神经元) in the part of the brain devoted to hearing. New research from biologists at the University of Maryland __26__ that sight deprivation also changes the way brain cells __27__ with one another, shifting the mice''s sensitivity to different frequencies. "This study __28__ what we are learning about how manipulating vision can have a __29__ effect on the ability of an animal to hear long after the window for auditory(听觉的) learning was thought to have __30__ ," said Patrick Kanold, senior author of the study. It was once thought that the sensory regions of the brain were not __31__ after a critical period in childhood. This is why children learn languages much more __32__ than adults. Kanold''s earlier research disproved this idea by showing that depriving adult mice of vision for a short period increased the sensitivity of individual neurons in the auditory cortex(皮质), which is devoted to hearing. Young brains wire themselves according to the sounds they hear frequently, assigning areas of the auditory cortex to __33__ frequencies based on what they are used to hearing. The researchers found that, in adult mice, a week in the dark also changed the __34__ of space to different frequencies. "We don''t know why we are seeing these patterns," Kanold said. "We __35__ that it may have to do with what the mice are paying attention to while they are in the dark."', NULL, '["A) adaptable","B) closed","C) distribution","D) interact","E) narration","F) neutral","G) permanently","H) prescribes","I) readily","J) registered","K) reinforces","L) revealed","M) significant","N) specific","O) speculate"]', 246, 'IMPORT', 'cet4-2024-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-2-r1'
);
SET @pg_cet4_2024_12_2_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-2-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-r2', 'MATCHING', 'CET4', 'If we care about plastic waste, why won''t we stop drinking bottled water?', 'We have all seen the damage plastic waste is doing around the world, but sales of bottled water have continued to grow. A) For all the innovation and choice that define the food and drink industries, if you want to make money, you could do a lot worse than fill a bottle with water and sell it. A litre of tap water, the stuff we have cleverly piped into our homes, costs less than half a penny. A litre of bottled water can cost well over a pound, especially for something fancy that has been sucked through a mountain. B) Yet the bottled water market is livelier than ever. It defies our increasing awareness of the harm plastics do to the environment and a broader, growing sense that something has to change. Sales in the UK were worth a record £558.4 million this past year, an increase of 7%, according to the latest figures from the market analyst Kantar. Separate data from other analysts show that last year the British consumed more than 2.2 billion litres of bottled water, including "take-home" and "on-the-go" products. That''s an annual rise in volume of 8.5%. C) Environmental campaigners are struggling to understand why nations blessed with clean tap water grow only fonder of the bottle. "It''s very surprising to me," says Sam Chetan-Walsh, a political adviser at Greenpeace and campaigner against ocean plastic. "Public awareness has never been higher, but the message is not quite reaching all the people it needs to." Where it is heard, the message is causing concern. Plastic water bottles require oceans of fossil fuels to make and ship. Additionally, single-use plastics of all types are polluting our cities and seas. Numerous documentaries have shown how plastic is ultimately killing wildlife. D) Moves against various plastics have gathered pace, from shopping bags to straws and plastic-lined coffee cups. Chetan-Walsh argues that bottled water is different because the alternatives are so obvious. "If a product that is so nakedly unnecessary can exist, then the whole system is failing," he says. E) Hope is not entirely out of reach. The rate of growth has begun to ease (sales were up 7% in the year, compared with 8% the previous year). F) But even if large numbers of people are quitting bottled water because of care for the environment, others are taking it up. The introduction of the "sugar tax" on juices and soda drinks has pushed more people to bottled water, while health awareness has boosted its desirability. Tap water consumption is growing at roughly the same pace (UK consumers still drink almost three times as much tap water as bottled water). G) So the plastic tide only creeps higher. The industry is quick to point out that all its bottles are recyclable. "But collection rates are, at the most generous estimates, 56%, so the actual recycling rate will be lower than that," Chetan-Walsh says. And while bottles may be recyclable, very few are made of recycled plastic. One water bottle company launched recycled half-litre "eco" bottles alongside its standard bottles. Another has pledged to use only recycled plastic across its range by 2025. Chetan-Walsh believes in a ban on single-use bottles. Bans do exist in some places. Organisers of a famous music festival announced that water bottles will not be sold this summer. San Francisco has banned them from city property and events. Last year, the UK government set out plans to ban single-use plastic from its estate. H) Water bottlers, unsurprisingly, don''t support bans. But they raise concerns about health rather than profit margins. Last month one chief executive of a water bottling company said that bans would "result in greater consumption of sugary drinks, adding to all the health dangers of obesity, diabetes and tooth decay". Kinvara Carey, general manager of an association of the biggest bottled water manufacturers, cites a survey in which people were asked what they would do if bottled water were not available. "Forty-four per cent would buy another drink, which is not great, 14% would go without and 4.5% said they would find a fountain," she says. "The choice is important." I) What if fountains were more numerous, and tap water more clearly available in cafes, restaurants and elsewhere? Dozens of fountains are being installed in London. There are similar initiatives elsewhere. Before plastic and the marketing that made people think they needed bottled water in the first place, fountains were an urban fixture. Greenpeace, among others, is also pushing for a "deposit return" scheme. This would mean tax on bottled water would be refunded to customers who returned the plastic for recycling. J) Even if bottled water sales are growing slightly more slowly, the industry is racing to adapt to changing concerns and tastes. Flavoured water is booming: sales of the sparkling variety shot up by 20%, according to the latest analyst data. Meanwhile, international water brands, as well as a range of new companies, are selling high-end reusable bottles. And if you must fill them with tap water, why not add flavouring? K) As the owner of multiple sugary drink brands and bottled water, PepsiCo is facing challenges on health and environmental fronts. Last year, the company bought SodaStream (a drinks company that sells machines for making tap water bubbly and then consumers add flavours) for $3.2 billion. It also launched a range of fancy bottles that work with tap water and flavour packets. The bottle is reusable. The packets? Not so much, and, yes, they are made of plastic, although the company invites users to post them back for recycling. L) As is so often the case, clever marketing can beat reason; awareness is rarely enough. "There is always this kind of slip between concern, intent and changed behaviour," says Giles Quick, an analyst of bottled water. "The best example is five a day, the recommendation to have at least five portions of fruit and vegetables every day. Almost everyone is aware of this, but something like 15% of us achieve it." Unless a far-reaching bottle ban does come into force, it will be up to consumers to not only demand change—but to act themselves.', NULL, NULL, 1025, 'IMPORT', 'cet4-2024-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-2-r2'
);
SET @pg_cet4_2024_12_2_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-2-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-r3', 'CAREFUL_READING', 'CET4', NULL, 'As a university student, I''ve come to realise just how little I know about money. I''ve come to the brutal realisation that Australia''s youth are being done a great disservice by not receiving any consistent financial education. Diving headfirst into the crash course of starting university, I''ve quickly tried to get myself up to speed with the financial terms of the modern era to help manage my personal finances. I''ve read some financial education books, done some online learning, and have spoken to my nearest and dearest for their pearls of financial wisdom. There are undoubtedly hundreds of great resources out there for those wishing to improve their financial literacy, but while I was researching, I still kept wishing that I didn''t have to play catch-up with the money world. I felt that I was sailing the financial seas with no skills and no life jacket! However, after talking to my friends who felt the same, I quickly realised that it wasn''t my ignorance but the lack of financial education in our schooling system that is leaving high schoolers seriously behind in the modern world of money. Let''s compare a theoretical financial education subject to the standard compulsory English class. On average, English may not be the most popular subject, but it''s consistently on the schedule throughout high school, with all students graduating fluent in English. A financial education subject should do just the same. It shouldn''t be just a one-day event but a course integrated throughout the whole of high school that would allow students to gradually expand their financial literacy, and would prevent the need for a ''catch up'' phase once we''re out on our own after graduation. In the same way that learning a language or new skills takes time, building financial skills requires practice and years to gradually accumulate bits and pieces of knowledge. Giving young people the opportunity to become familiar with the world of money would provide them with a great advantage to enter adulthood with confidence and security so that they are able to manage their own money and look after themselves.', NULL, NULL, 349, 'IMPORT', 'cet4-2024-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-2-r3'
);
SET @pg_cet4_2024_12_2_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-2-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-r4', 'CAREFUL_READING', 'CET4', NULL, 'Chocolates save us from many things, especially emotional distress. They comfort us in times of trouble, calming down a racing heart by channelling happy calories inside us. We all have faith in chocolates to delight us in an instant! Recently, chocolate lovers were heartbroken as scientists claimed that they can become extinct by 2050! But hey, we have some happy news for you. Scientists can still help save chocolates from dying out! If you are not aware as to why scientists made the statement about the death of this wonderful thing, let us tell you the facts. Chocolate trees, whose seeds are used to make chocolate, grow in the tropical plant world and require very specific weather conditions to prosper. Now, fifty percent of the world''s cocoa(可可) beans come from two countries in West Africa: Côte d''Ivoire and Ghana. Scientists believe that both of these countries will experience a 3.8°F temperature increase by 2050 due to global warming, endangering the cacao(可可树) farms in the rainforests. These farms will then have to be shifted to cooler mountainous areas, which are the natural habitat of wildlife. This will lead to some tough decisions: whether to grow chocolate or save wildlife. Unfortunately, the crisis of global warming has already had a serious negative impact on cacao farms'' yields, leading to the prices of chocolates skyrocketing. Scientists, however, are trying to find a long-term and eco-friendly solution to this problem! They are trying to modify the species with a gene-editing technology, which will transform the seedlings into a species that survives even in a drier and warmer climate. According to a report by The Business Insider, in the University of California''s new bio-sciences building, tiny green cacao seedlings are lined up in refrigerated greenhouses for a new experiment by using a technology called CRISPR. By manipulating the DNA of plants, this technology is already being used across the world to make plants tougher and cheaper. Similarly, in this unconventional experiment, scientists will make tiny, precise changes to the DNA of the seedlings to make the cocoa crops survive in warmer and drier climates.', NULL, NULL, 349, 'IMPORT', 'cet4-2024-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-2-r4'
);
SET @pg_cet4_2024_12_2_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-2-r4' LIMIT 1);

-- 翻译 cet4-2024-12-2
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-translation'
);
SET @q_cet4_2024_12_2_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_01, '近年来，中国新能源汽车产业发展迅速。目前，中国新能源汽车年产量已高达近千万辆，占全球市场份额超过 60%，出口量不断创出新高。中国政府通过加大资金投入和政策引导，鼓励新能源汽车企业进行技术创新，不断提高产品在市场上的竞争力。中国新能源汽车产业的发展不仅有力推动了国内经济发展，也为全球新能源利用和环境保护做出了积极贡献。', NULL, 'In recent years, China''s new energy vehicle industry has developed rapidly. At present, China''s annual output of new energy vehicles has reached nearly 10 million units, accounting for over 60% of the global market share, while its exports keep hitting new highs. To achieve this, the Chinese government, by increasing funding and providing policy guidance, encourages new energy vehicle enterprises to make technological innovations and continuously enhance the market competitiveness of their products. As a result, the development of this industry has not only powerfully boosted domestic economic growth, but also made positive contributions to the global use of new energy and environmental protection.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_01
);

-- 听力 Q1 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q01', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q01'
);
SET @q_cet4_2024_12_2_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_02, NULL, '{"A":"A) They will see a 27% higher price to buy natural gas.","B":"B) They will have insufficient heating oil to keep warm.","C":"C) They will have a costly bill to pay to heat their homes.","D":"D) They will experience the coldest winter in four decades."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_02
);

-- 听力 Q2 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q02', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q02'
);
SET @q_cet4_2024_12_2_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_03, NULL, '{"A":"A) Provided additional funding to Low Income Home Energy Assistance Program.","B":"B) Assured U.S. citizens of an increase in energy supplies by the end of this year.","C":"C) Predicted a 10% jump in heating bills for most U.S. households this winter.","D":"D) Decided on this year''s energy assistance package of $8 billion in total."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_03
);

-- 听力 Q3 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q03', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q03'
);
SET @q_cet4_2024_12_2_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_04, NULL, '{"A":"A) They care less about their diet now than before.","B":"B) They may lack adequate knowledge of healthy food.","C":"C) They may hold too optimistic a view about their diet.","D":"D) They pay insufficient attention to their choice of food."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_04
);

-- 听力 Q4 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q04', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q04'
);
SET @q_cet4_2024_12_2_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_05, NULL, '{"A":"A) Those who finished 24-hour food questionnaires.","B":"B) Those who fully understood the rating scale.","C":"C) Those who cared about food quality.","D":"D) Those who rated their diet as poor."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_05
);

-- 听力 Q5 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q05', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q05'
);
SET @q_cet4_2024_12_2_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_06, NULL, '{"A":"A) They experienced a heartbreaking moment.","B":"B) They gathered together to rescue an elephant.","C":"C) They heard a noise from the bottom of a well.","D":"D) They found an elephant wandering around a well."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_06
);

-- 听力 Q6 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q06', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q06'
);
SET @q_cet4_2024_12_2_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_07, NULL, '{"A":"A) To borrow their crane.","B":"B) To ask them for help.","C":"C) To report the strange noise.","D":"D) To get food for the elephant."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_07
);

-- 听力 Q7 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q07', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q07'
);
SET @q_cet4_2024_12_2_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_08, NULL, '{"A":"A) The elephant was able to return to the jungle.","B":"B) The army officers were examined for injuries.","C":"C) The army officers were rewarded for their rescue efforts.","D":"D) The elephant was given medical treatment for many days."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q08', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q08'
);
SET @q_cet4_2024_12_2_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_09, NULL, '{"A":"A) He found it had caused him much inconvenience.","B":"B) It led him to spend more money than necessary.","C":"C) It was much less secure than paying with cash.","D":"D) He wanted to be less dependent on his phone."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_09
);

-- 听力 Q9 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q09', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q09'
);
SET @q_cet4_2024_12_2_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_10, NULL, '{"A":"A) Living beyond her means.","B":"B) Lack of budgeting strategies.","C":"C) Fashion addiction.","D":"D) Impulse purchasing."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_10
);

-- 听力 Q10 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q10', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q10'
);
SET @q_cet4_2024_12_2_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_11, NULL, '{"A":"A) Eat healthier food with less money.","B":"B) Order food like burgers and chips.","C":"C) Avoid getting addicted to junk food","D":"D) Pay either in cash or with his phone."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_11
);

-- 听力 Q11 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q11', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q11'
);
SET @q_cet4_2024_12_2_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_12, NULL, '{"A":"A) Making a shopping list.","B":"B) Sticking to his budget.","C":"C) Withdrawing cash only once a month.","D":"D) Thinking twice before buying something."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_12
);

-- 听力 Q12 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q12', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q12'
);
SET @q_cet4_2024_12_2_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_13, NULL, '{"A":"A) He does not enjoy any ball games.","B":"B) He has to prepare for the future.","C":"C) He has breathing problems.","D":"D) He is not up to anything challenging."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_13
);

-- 听力 Q13 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q13', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q13'
);
SET @q_cet4_2024_12_2_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_14, NULL, '{"A":"A) Soccer.","B":"B) Badminton.","C":"C) Volleyball.","D":"D) Basketball."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_14
);

-- 听力 Q14 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q14', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q14'
);
SET @q_cet4_2024_12_2_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_15, NULL, '{"A":"A) The possibilities of joining the school sports team.","B":"B) The opportunities of winning some championships.","C":"C) The chances of getting an athletic scholarship later on.","D":"D) The odds of becoming a professional sportsman someday."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_15
);

-- 听力 Q15 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q15', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q15'
);
SET @q_cet4_2024_12_2_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_16, NULL, '{"A":"A) It differs entirely from indoor volleyball.","B":"B) It appeals to both schoolgirls and schoolboys.","C":"C) It is less popular than indoor sports in the country.","D":"D) It is completely different from other outdoor games."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_16
);

-- 听力 Q16 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q16', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q16'
);
SET @q_cet4_2024_12_2_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_17, NULL, '{"A":"A) It usually requires years of preparations.","B":"B) It does a lot of harm to the environment.","C":"C) It often burns over three hundred tonnes of refined fuel.","D":"D) It proves to be the most complicated stage of space missions."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_17
);

-- 听力 Q17 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q17', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q17'
);
SET @q_cet4_2024_12_2_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_18, NULL, '{"A":"A) They are burnt up in outer space.","B":"B) They are guided back to Earth.","C":"C) They are reused up to 100 times.","D":"D) They are treated as expendable."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_18
);

-- 听力 Q18 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q18', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q18'
);
SET @q_cet4_2024_12_2_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_19, NULL, '{"A":"A) New technologies for bringing back space vehicles for recycling.","B":"B) The technology for meeting the needs of commercial space travel.","C":"C) Many of the technologies to limit the impact of space travel on Earth.","D":"D) The technology for effectively protecting ozone from being destroyed."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_19
);

-- 听力 Q19 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q19', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q19'
);
SET @q_cet4_2024_12_2_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_20, NULL, '{"A":"A) It can help unskilled readers feel more secure.","B":"B) It can encourage reluctant readers to read aloud.","C":"C) It can strengthen children''s confidence in others.","D":"D) It can boost children''s interest in communication."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_20
);

-- 听力 Q20 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q20', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q20'
);
SET @q_cet4_2024_12_2_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_21, NULL, '{"A":"A) By motivating children to find out about their favourite pets.","B":"B) By taking children to the library to borrow books on animals.","C":"C) By allowing children to surf the internet about pets by themselves.","D":"D) By showing children how to acquire knowledge about healthy pets."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_21
);

-- 听力 Q21 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q21', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q21'
);
SET @q_cet4_2024_12_2_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_22, NULL, '{"A":"A) By learning that raising pets can do much good.","B":"B) By watching how healthy pets are brought up.","C":"C) By hearing about their peers'' passion for pets.","D":"D) By visiting friends who have household pets."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_22
);

-- 听力 Q22 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q22', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q22'
);
SET @q_cet4_2024_12_2_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_23, NULL, '{"A":"A) Send would-be students a packet of information.","B":"B) Update regularly all information on their websites.","C":"C) Inform prospective students of their yearly enrollment.","D":"D) Answer questions raised by applicants and their parents."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_23
);

-- 听力 Q23 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q23', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q23'
);
SET @q_cet4_2024_12_2_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_24, NULL, '{"A":"A) Oversee private institutions directly.","B":"B) Follow other states'' example.","C":"C) Supervise all schools consistently.","D":"D) Regulate public institutions by law."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_24
);

-- 听力 Q24 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q24', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q24'
);
SET @q_cet4_2024_12_2_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_25, NULL, '{"A":"A) They are resourceful.","B":"B) They are competitive.","C":"C) They provide the best opportunity to realize one''s dream.","D":"D) They appeal most to students from other states in the U.S."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_25
);

-- 听力 Q25 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q25', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q25'
);
SET @q_cet4_2024_12_2_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_26, NULL, '{"A":"A) Some students waste much time surfing the net.","B":"B) Students may need to visit too many websites.","C":"C) Students have to search for the information.","D":"D) Some students may lack adequate access."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q26'
);
SET @q_cet4_2024_12_2_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_27, NULL, '{"A":"A) adaptable","B":"B) closed","C":"C) distribution","D":"D) interact","E":"E) narration","F":"F) neutral","G":"G) permanently","H":"H) prescribes","I":"I) readily","J":"J) registered","K":"K) reinforces","L":"L) revealed","M":"M) significant","N":"N) specific","O":"O) speculate"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q27'
);
SET @q_cet4_2024_12_2_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_28, NULL, '{"A":"A) adaptable","B":"B) closed","C":"C) distribution","D":"D) interact","E":"E) narration","F":"F) neutral","G":"G) permanently","H":"H) prescribes","I":"I) readily","J":"J) registered","K":"K) reinforces","L":"L) revealed","M":"M) significant","N":"N) specific","O":"O) speculate"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q28'
);
SET @q_cet4_2024_12_2_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_29, NULL, '{"A":"A) adaptable","B":"B) closed","C":"C) distribution","D":"D) interact","E":"E) narration","F":"F) neutral","G":"G) permanently","H":"H) prescribes","I":"I) readily","J":"J) registered","K":"K) reinforces","L":"L) revealed","M":"M) significant","N":"N) specific","O":"O) speculate"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q29'
);
SET @q_cet4_2024_12_2_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_30, NULL, '{"A":"A) adaptable","B":"B) closed","C":"C) distribution","D":"D) interact","E":"E) narration","F":"F) neutral","G":"G) permanently","H":"H) prescribes","I":"I) readily","J":"J) registered","K":"K) reinforces","L":"L) revealed","M":"M) significant","N":"N) specific","O":"O) speculate"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q30'
);
SET @q_cet4_2024_12_2_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_31, NULL, '{"A":"A) adaptable","B":"B) closed","C":"C) distribution","D":"D) interact","E":"E) narration","F":"F) neutral","G":"G) permanently","H":"H) prescribes","I":"I) readily","J":"J) registered","K":"K) reinforces","L":"L) revealed","M":"M) significant","N":"N) specific","O":"O) speculate"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q31'
);
SET @q_cet4_2024_12_2_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_32, NULL, '{"A":"A) adaptable","B":"B) closed","C":"C) distribution","D":"D) interact","E":"E) narration","F":"F) neutral","G":"G) permanently","H":"H) prescribes","I":"I) readily","J":"J) registered","K":"K) reinforces","L":"L) revealed","M":"M) significant","N":"N) specific","O":"O) speculate"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q32'
);
SET @q_cet4_2024_12_2_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_33, NULL, '{"A":"A) adaptable","B":"B) closed","C":"C) distribution","D":"D) interact","E":"E) narration","F":"F) neutral","G":"G) permanently","H":"H) prescribes","I":"I) readily","J":"J) registered","K":"K) reinforces","L":"L) revealed","M":"M) significant","N":"N) specific","O":"O) speculate"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q33'
);
SET @q_cet4_2024_12_2_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_34, NULL, '{"A":"A) adaptable","B":"B) closed","C":"C) distribution","D":"D) interact","E":"E) narration","F":"F) neutral","G":"G) permanently","H":"H) prescribes","I":"I) readily","J":"J) registered","K":"K) reinforces","L":"L) revealed","M":"M) significant","N":"N) specific","O":"O) speculate"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q34'
);
SET @q_cet4_2024_12_2_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_35, NULL, '{"A":"A) adaptable","B":"B) closed","C":"C) distribution","D":"D) interact","E":"E) narration","F":"F) neutral","G":"G) permanently","H":"H) prescribes","I":"I) readily","J":"J) registered","K":"K) reinforces","L":"L) revealed","M":"M) significant","N":"N) specific","O":"O) speculate"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q35'
);
SET @q_cet4_2024_12_2_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_36, NULL, '{"A":"A) adaptable","B":"B) closed","C":"C) distribution","D":"D) interact","E":"E) narration","F":"F) neutral","G":"G) permanently","H":"H) prescribes","I":"I) readily","J":"J) registered","K":"K) reinforces","L":"L) revealed","M":"M) significant","N":"N) specific","O":"O) speculate"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q36'
);
SET @q_cet4_2024_12_2_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_37, 'Judging from the slowing rate of sales growth, there is still hope to combat bottled water.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q37'
);
SET @q_cet4_2024_12_2_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_38, 'Bottled water manufacturers base their arguments against bans of plastic bottles on health concerns rather than on profits.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q38'
);
SET @q_cet4_2024_12_2_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_39, 'Sales of bottled water in Britain hit a record high last year even though people are increasingly aware that plastics are environmentally unfriendly.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q39'
);
SET @q_cet4_2024_12_2_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_40, 'It often happens that people can lack reason when faced with skillful marketing.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q40'
);
SET @q_cet4_2024_12_2_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_41, 'One city on the west coast of America has banned single-use bottles from its property and events.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q41'
);
SET @q_cet4_2024_12_2_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_42, 'Manufacturing and shipping of plastic water bottles consume a tremendous amount of fossil fuels.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q42'
);
SET @q_cet4_2024_12_2_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_43, 'One large beverage company has adapted its operations when confronted with challenges from health and environmental advocates.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q43'
);
SET @q_cet4_2024_12_2_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_44, 'Bottled water is considerably more expensive than tap water.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q44'
);
SET @q_cet4_2024_12_2_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_45, 'Fountains could be seen in cities before bottled water became popular.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q45'
);
SET @q_cet4_2024_12_2_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_46, 'More people have taken to bottled water because of their health awareness.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q46'
);
SET @q_cet4_2024_12_2_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_47, 'What has the author come to realise since entering university?', '{"A":"A) He needs a crash course on financial terms.","B":"B) He is very much lacking in financial literacy.","C":"C) It requires consistent education to be financially independent.","D":"D) It is unrealistic to give all Australian youth a financial education."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q47'
);
SET @q_cet4_2024_12_2_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_48, 'How did the author feel in today''s money world?', '{"A":"A) Badly equipped to survive.","B":"B) Ignorant of financial literature.","C":"C) Barely capable of moving ahead.","D":"D) Overwhelmed by the resources online."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q48'
);
SET @q_cet4_2024_12_2_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_49, 'What did the author realise after talking to his friends?', '{"A":"A) They were as keen as he was on financial matters.","B":"B) The schooling system was to blame for his trouble.","C":"C) High schoolers knew nothing about the modern financial world.","D":"D) Financial courses were as unpopular as compulsory English classes."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q49'
);
SET @q_cet4_2024_12_2_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_50, 'What is the author''s idea of a financial education course?', '{"A":"A) It should foresee students'' needs after graduation.","B":"B) It should provide students with some basic knowledge.","C":"C) It should be taught the same way as English is taught.","D":"D) It should be integrated into high school education."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q50'
);
SET @q_cet4_2024_12_2_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_51, 'What would financial literacy do to young people?', '{"A":"A) Allow them to enter adulthood with financial security.","B":"B) Enable them to look after themselves without worrying about money.","C":"C) Render them confident and secure in terms of money management.","D":"D) Help them become familiar with the world of money."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q51'
);
SET @q_cet4_2024_12_2_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_52, 'What do people believe chocolates can do?', '{"A":"A) Cheer them up instantly.","B":"B) Create happy calories.","C":"C) Conceal emotional distress.","D":"D) Relieve them of heart trouble."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q52'
);
SET @q_cet4_2024_12_2_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_53, 'What was scientists'' recent assertion about chocolates?', '{"A":"A) They could become a rare treat in the near future.","B":"B) They could calm people down a bit in times of crisis.","C":"C) They could prevent people from getting heartbroken.","D":"D) They could become unavailable in less than 30 years."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q53'
);
SET @q_cet4_2024_12_2_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_54, 'What would happen if the cacao farms were shifted to cooler mountainous areas?', '{"A":"A) The natural habitat of wildlife there would be ruined.","B":"B) The cacao farmers would have a tough time to adapt.","C":"C) The rainforests would be shrinking dramatically.","D":"D) The quality of cocoa beans would suffer greatly."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q54'
);
SET @q_cet4_2024_12_2_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_55, 'What do we learn about the cacao farms in the crisis of global warming?', '{"A":"A) They try to seek help from gene-editing scientists.","B":"B) They decide to move to cooler mountainous areas.","C":"C) They have suffered a lot due to a decrease in produce.","D":"D) They have benefited by raising prices of cocoa beans."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-2-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q55'
);
SET @q_cet4_2024_12_2_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-2-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_2_56, 'What are scientists trying to do in the University of California''s new bio-sciences building?', '{"A":"A) Build rows of refrigerated greenhouses for research on cacao seedlings.","B":"B) Gene-edit cacao seedlings for them to withstand a drier, warmer climate.","C":"C) Produce chocolates with the latest gene-editing technology.","D":"D) Transplant the genes of tougher plants to cacao seedlings."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_2_56
);

-- ==================== cet4-2024-12-3 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-r1', 'BANKED_CLOZE', 'CET4', NULL, 'Super realistic masks are made from flexible materials such as silicone and are designed to imitate real human face—down to every last detail. In a study by the Universities of York and Kyoto, researchers asked participants to look at pairs of photographs and decide which showed a __26__ face and which showed a person wearing a mask. Surprisingly, participants made the wrong call in one-in-five cases. The 20% error rate __27__ in the study likely underestimates the extent to which people would struggle to tell an __28__ face from the real thing outside of the lab. The researchers collected data from participants from both the UK and Japan to __29__ any differences according to race. When trial participants were asked to choose between photographs of faces of a different race from theirs, response times were slower and selections were 5% less __30__ . There are now dozens of criminal cases in which offenders have __31__ themselves off as people of a different age, race or gender, sending police investigations down the wrong path. In one recent case, an international gang used an __32__ realistic mask to pose as a French minister, __33__ business executives out of millions of pounds. Dr Jet Sanders, who worked on the study while a PhD student at the University of York, said: "Failure to detect synthetic faces may have important implications for security and crime prevention as super realistic masks may __34__ the key characteristics of a person''s appearance to be __35__ identified."', NULL, '["A) accurate","B) allow","C) artificial","D) cheating","E) deserted","F) establish","G) extremely","H) immediately","I) incorrectly","J) normal","K) observed","L) passed","M) reminding","N) reparable","O) resolve"]', 248, 'IMPORT', 'cet4-2024-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-3-r1'
);
SET @pg_cet4_2024_12_3_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-3-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-r2', 'MATCHING', 'CET4', 'Stop thinking and start doing', 'A) Most people have a dream in life, a vision of who or what they''d like to be in the future. At a minimum, everyone has interests and values that determine what they want out of their lives. Even so, trying to set achievable goals that you''ll work for over the course of many years can be extremely challenging. It can be hard to know where to even begin, and the things you hope to achieve may seem impossible. But, if you''re well prepared you may be able to set goals for your life that are just as fulfilling to work toward as to achieve. B) We all have goals that we want to achieve in our lives. These goals may include learning a new language, eating healthier and losing weight, becoming a better parent, saving more money, and so on. It can be easy to assume that the gap between where you are now and where you want to be in the future is caused by a lack of knowledge. This is why we buy courses on how to start a business or how to lose weight fast or how to learn a new language in three months. We assume that if we knew about a better strategy, then we would get better results. We believe that a new result requires new knowledge. C) What I''m starting to realize, however, is that new knowledge does not necessarily drive new results. In fact, learning something new can actually be a waste of time if your goal is to make progress and not simply gain additional knowledge. D) It all comes down to the difference between learning and practicing. Thomas Sterner, in his book *The Practicing Mind*, explains the key difference between practicing and learning. He says: "When we practice something, we are involved in the deliberate repetition of a process with the intention of reaching a specific goal." Here the words "deliberate" and "intention" are key, because they define the difference between actively practicing something and passively learning it. E) Learning something new and practicing something new may seem very similar, but these two methods can have profoundly different results. Here are some additional ways to think about the difference. Let''s say your goal is to get stronger and more fit. You can research the best instructions on weight lifting technique, but the only way to build strength is to practice lifting weights. Let''s say your goal is to grow your startup. You can learn about the best way to make a sales pitch, but the only way to actually land customers is to practice making sales calls. Let''s say your goal is to write a book. You can talk to a best-selling author about writing, but the only way to become a better writer is to practice publishing consistently. F) Passive learning creates knowledge. Active practice creates skill. Let''s consider a couple more reasons to prioritize active practice over passive learning. First, passive learning can be a stick that supports inaction. In many cases, learning is actually a way to avoid taking action on the goals and interests that we say are important to us. For example, let''s say you want to learn a foreign language. Reading a book on how to learn a foreign language quickly allows you to feel like you are making progress ("Hey, I''m figuring out the best way to do this!"). Of course, you''re not actually practicing the action that would deliver your desired outcome (speaking the foreign language). G) In situations like this one, we often claim that we are preparing or researching the best method, but these rationalizations allow us to feel like we are moving forward when we are merely spinning our wheels. We make the mistake of being in motion rather than taking action. Learning is valuable until it becomes a form of procrastination(拖延). H) Another point to consider is that practice is learning, but learning is not practice. Passive learning is not a form of practice because although you gain new knowledge, you are not discovering how to apply that knowledge. Active practice, meanwhile, is one of the greatest forms of learning because the mistakes you make while practicing reveal important insights. I) Even more importantly, practice is the only way to make a meaningful contribution with your knowledge. You can watch an online course about how to build a business or read an article about a terrible disaster in a developing nation, but that knowledge is unproductive unless you actually launch your business or donate to those in need. Learning by itself can be valuable for you, but if you want to be valuable to others, then you have to express your knowledge in some way. J) The last important point to consider is that practice focuses your energy on the process. Thomas Sterner once said, "Progress is a natural result of staying focused on the process of doing anything." The state of your life right now is a result of the habits and beliefs that you have been practicing each day. When you realize this and begin to direct your focus toward practicing better habits day-in and day-out, continual progress will be the logical outcome. It is not the things we learn nor the dreams we visualize that determine our results, but rather the habits that we practice each day. Fall in love with boredom and focus your energy on the process, not the product. K) What does this all mean? Is passive learning useless? Of course not. In many cases, learning for the sake of learning can be a beautiful thing. Not to mention that soaking up new information can help you make more informed decisions when you do decide to take action. That said, the main point of this article is that learning by itself does not lead to progress. We often hide behind information and use learning as an excuse to delay the more difficult and more important choice of actually doing something. Spend less time passively learning and more time actively practicing. Stop thinking and start doing.', NULL, NULL, 1014, 'IMPORT', 'cet4-2024-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-3-r2'
);
SET @pg_cet4_2024_12_3_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-3-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-r3', 'CAREFUL_READING', 'CET4', NULL, 'Research in human-vehicle interaction has shown even systems designed to automate driving are far from being error-proof. Recent evidence points to drivers'' limited understanding of what these systems can and cannot do as a contributing factor to system misuse. A recent study tackles the issue of over-trusting drivers and the resulting system misuse from a legal viewpoint. It looks at what the manufacturers of self-driving cars should legally do to ensure that drivers understand how to use the vehicles appropriately. One solution suggested in the study involves requiring buyers to sign end-user license agreements (EULAs), similar to the terms and conditions that require agreement when using new software products. But this is far from ideal. The agreement may not provide enough information to the driver, leading to confusion about the nature of the requests for agreement and their implications. Further, most end users don''t read EULAs. A 2017 study shows 91 percent of people agree to them without reading. Among young people, 97 percent agree without reviewing the terms. The issue is that, unlike using a smartphone app, operating a car has serious safety risks, whether the driver is human or software. And human drivers need to consent to take responsibility for the outcomes of the software and hardware. "Warning fatigue" and distracted driving are also causes for concern. For example, a driver, annoyed after receiving continuous warnings, could decide to just ignore the message. Or, if the message is presented while the vehicle is in motion, it could represent a distraction. Given these limitations and concerns, even if this mode of obtaining consent is to move forward, it likely won''t fully protect automakers from their legal liability should the system malfunction(发生故障) or an accident occur. Driver training for self-driving vehicles can help ensure that drivers fully understand system capabilities and limitations. This needs to occur beyond the vehicle purchase. Recent evidence shows even relying on the information provided by the seller is not going to answer many questions. All of this considered, the road forward for self-driving cars is not going to be a smooth ride after all.', NULL, NULL, 349, 'IMPORT', 'cet4-2024-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-3-r3'
);
SET @pg_cet4_2024_12_3_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-3-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-r4', 'CAREFUL_READING', 'CET4', NULL, 'Do you ever blend up a protein drink for breakfast, or grab a protein bar following an afternoon workout? If so, you are likely among the millions of people in search of more protein-rich diets. Protein-enriched products are found everywhere. But contrary to all the publicity that everyone needs more protein, most Americans get twice as much as they need. Many of us living in the most developed countries are buying into a myth of protein deficiency created by food companies and self-identified health experts. Global retail sales of protein supplement products reached an astonishing US$18.9 billion in 2020. But are we really in need of more protein? Physicians in the U.S. have never actually examined a patient with protein deficiency because simply by eating an adequate number of daily calories we are also most likely getting enough protein. In fact, Americans currently consume almost twice the National Academy of Medicine''s recommended daily intake of protein although the most desirable protein intake may vary depending on age and activity level. For example, if you''re a dedicated athlete you might need to consume higher quantities of protein. Generally, though, a 140-pound person should not exceed 120 grams of protein per day, particularly because a high protein diet can strain kidney and liver function and increase risks of developing heart disease and cancer. While fats and sugar have taken the beating in turns since over a century ago, protein has managed to remain our red-hot favorite. In the 1970s through the 1990s, protein products remained visible but moved back somewhat with the dietary spotlight firmly fixed on low-calorie, low-fat, sugar-free snack foods and beverages following the publication of studies linking sugar and saturated(饱和的) fat consumption to heart disease. Later research in 2003, however, suggested high-protein diets could aid in weight loss, and protein quickly regained its former nutrient-superstar status. Now most people living in high-income nations are consuming enough protein. When we replace meals with a protein bar or drink, we also risk missing out on the rich sources of antioxidants(抗氧化剂), vitamins and many other benefits of real food.', NULL, NULL, 347, 'IMPORT', 'cet4-2024-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-3-r4'
);
SET @pg_cet4_2024_12_3_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2024-12-3-r4' LIMIT 1);

-- 翻译 cet4-2024-12-3
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-translation'
);
SET @q_cet4_2024_12_3_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_01, '敦煌莫高窟 (Mogao Grottoes) 数字展示中心于2014年开放启用, 是莫高窟保护利用工程的重要组成部分。展示中心采用数字技术和多媒体展示手段, 使游客进入洞窟参观之前就能了解莫高窟的历史文化, 鉴赏莫高窟的艺术经典。这将减少开放洞窟的数量, 缩短游客在洞窟内的逗留时间, 减轻参观对莫高窟造成的影响, 以使这一世界文化遗产得到妥善保护、长久利用。', NULL, 'The Mogao Grottoes Digital Exhibition Center, which opened in 2014, is an important part of the project for the protection and utilization of the Mogao Grottoes. The center adopts digital technology and multimedia means, enabling visitors to learn about the history and culture of the Mogao Grottoes and appreciate its artistic classics before they enter the caves. This will reduce the number of open caves, shorten the time visitors stay inside, and lessen the impact of visits on the Mogao Grottoes, so that this World Cultural Heritage site can be properly protected and used over the long term.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_01
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q26'
);
SET @q_cet4_2024_12_3_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_02, NULL, '{"A":"A) accurate","B":"B) allow","C":"C) artificial","D":"D) cheating","E":"E) deserted","F":"F) establish","G":"G) extremely","H":"H) immediately","I":"I) incorrectly","J":"J) normal","K":"K) observed","L":"L) passed","M":"M) reminding","N":"N) reparable","O":"O) resolve"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_02
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q27'
);
SET @q_cet4_2024_12_3_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_03, NULL, '{"A":"A) accurate","B":"B) allow","C":"C) artificial","D":"D) cheating","E":"E) deserted","F":"F) establish","G":"G) extremely","H":"H) immediately","I":"I) incorrectly","J":"J) normal","K":"K) observed","L":"L) passed","M":"M) reminding","N":"N) reparable","O":"O) resolve"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_03
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q28'
);
SET @q_cet4_2024_12_3_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_04, NULL, '{"A":"A) accurate","B":"B) allow","C":"C) artificial","D":"D) cheating","E":"E) deserted","F":"F) establish","G":"G) extremely","H":"H) immediately","I":"I) incorrectly","J":"J) normal","K":"K) observed","L":"L) passed","M":"M) reminding","N":"N) reparable","O":"O) resolve"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_04
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q29'
);
SET @q_cet4_2024_12_3_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_05, NULL, '{"A":"A) accurate","B":"B) allow","C":"C) artificial","D":"D) cheating","E":"E) deserted","F":"F) establish","G":"G) extremely","H":"H) immediately","I":"I) incorrectly","J":"J) normal","K":"K) observed","L":"L) passed","M":"M) reminding","N":"N) reparable","O":"O) resolve"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_05
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q30'
);
SET @q_cet4_2024_12_3_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_06, NULL, '{"A":"A) accurate","B":"B) allow","C":"C) artificial","D":"D) cheating","E":"E) deserted","F":"F) establish","G":"G) extremely","H":"H) immediately","I":"I) incorrectly","J":"J) normal","K":"K) observed","L":"L) passed","M":"M) reminding","N":"N) reparable","O":"O) resolve"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_06
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q31'
);
SET @q_cet4_2024_12_3_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_07, NULL, '{"A":"A) accurate","B":"B) allow","C":"C) artificial","D":"D) cheating","E":"E) deserted","F":"F) establish","G":"G) extremely","H":"H) immediately","I":"I) incorrectly","J":"J) normal","K":"K) observed","L":"L) passed","M":"M) reminding","N":"N) reparable","O":"O) resolve"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_07
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q32'
);
SET @q_cet4_2024_12_3_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_08, NULL, '{"A":"A) accurate","B":"B) allow","C":"C) artificial","D":"D) cheating","E":"E) deserted","F":"F) establish","G":"G) extremely","H":"H) immediately","I":"I) incorrectly","J":"J) normal","K":"K) observed","L":"L) passed","M":"M) reminding","N":"N) reparable","O":"O) resolve"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_08
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q33'
);
SET @q_cet4_2024_12_3_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_09, NULL, '{"A":"A) accurate","B":"B) allow","C":"C) artificial","D":"D) cheating","E":"E) deserted","F":"F) establish","G":"G) extremely","H":"H) immediately","I":"I) incorrectly","J":"J) normal","K":"K) observed","L":"L) passed","M":"M) reminding","N":"N) reparable","O":"O) resolve"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_09
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q34'
);
SET @q_cet4_2024_12_3_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_10, NULL, '{"A":"A) accurate","B":"B) allow","C":"C) artificial","D":"D) cheating","E":"E) deserted","F":"F) establish","G":"G) extremely","H":"H) immediately","I":"I) incorrectly","J":"J) normal","K":"K) observed","L":"L) passed","M":"M) reminding","N":"N) reparable","O":"O) resolve"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_10
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q35'
);
SET @q_cet4_2024_12_3_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_11, NULL, '{"A":"A) accurate","B":"B) allow","C":"C) artificial","D":"D) cheating","E":"E) deserted","F":"F) establish","G":"G) extremely","H":"H) immediately","I":"I) incorrectly","J":"J) normal","K":"K) observed","L":"L) passed","M":"M) reminding","N":"N) reparable","O":"O) resolve"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_11
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q36'
);
SET @q_cet4_2024_12_3_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_12, 'Acquisition of new knowledge may not guarantee the progress that you aim to make.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_12
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q37'
);
SET @q_cet4_2024_12_3_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_13, 'Your current situation in life is built on the beliefs and habits you have been practicing daily.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_13
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q38'
);
SET @q_cet4_2024_12_3_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_14, 'Knowing the best way to learn a foreign language will not enable you to speak it without actual practice.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_14
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q39'
);
SET @q_cet4_2024_12_3_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_15, 'People may find it demanding to create a goal which will take a long time to achieve.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_15
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q40'
);
SET @q_cet4_2024_12_3_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_16, 'Learning and practicing seem to be very much alike, but the two processes can lead to quite different outcomes.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_16
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q41'
);
SET @q_cet4_2024_12_3_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_17, 'Absorbing new information is helpful in making better decisions prior to action.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_17
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q42'
);
SET @q_cet4_2024_12_3_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_18, 'Sometimes we may feel like we are making progress by doing some research or making preparations, but actually we are staying at the starting point.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_18
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q43'
);
SET @q_cet4_2024_12_3_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_19, 'We are inclined to think that a lack of knowledge prevents us from advancing to a better future.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_19
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q44'
);
SET @q_cet4_2024_12_3_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_20, 'Learning can benefit you by itself, but only practice can turn what you learn into meaningful contributions.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_20
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q45'
);
SET @q_cet4_2024_12_3_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_21, 'Practice involves repeating a process intentionally to attain a particular objective.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_21
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q46'
);
SET @q_cet4_2024_12_3_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_22, 'What do we learn from research in human-vehicle interaction?', '{"A":"A) Automatic driving systems are by no means immune to errors.","B":"B) Driverless vehicles are likely to be misused by some people.","C":"C) Self-driving car manufacturers are not aware of the legal matters involved.","D":"D) There is a long way to go before humans can interact with driverless vehicles."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_22
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q47'
);
SET @q_cet4_2024_12_3_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_23, 'What is the problem with requiring buyers to sign end-user license agreements?', '{"A":"A) End users, young and old alike, find the terms complex to interpret.","B":"B) Most end users sign them without bothering to read the terms.","C":"C) Many people are often confused by the wording of the terms.","D":"D) Most end users do not understand the terms after reading them through."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_23
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q48'
);
SET @q_cet4_2024_12_3_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_24, 'What would drivers do when they suffer from "warning fatigue"?', '{"A":"A) Waste no time keeping the car moving.","B":"B) Rest a while to avoid fatigue driving.","C":"C) Take no action despite repeated warnings.","D":"D) Take note of the message though fatigued."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_24
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q49'
);
SET @q_cet4_2024_12_3_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_25, 'What does the author think of continuing to ask buyers to sign end-user license agreements?', '{"A":"A) It will probably not guarantee the safety of drivers in case of accidents.","B":"B) It likely won''t ensure that the automatic driving system functions properly.","C":"C) It likely won''t fully protect automakers against accusations of deliberate cheating.","D":"D) It will probably not provide manufacturers adequate protection from legal responsibilities."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_25
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q50'
);
SET @q_cet4_2024_12_3_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_26, 'What should be done to help drivers fully understand system capabilities and limitations?', '{"A":"A) Training them to be experts in vehicle automation.","B":"B) Familiarizing them with the systems through training.","C":"C) Broadening their knowledge of accident-prevention mechanisms.","D":"D) Facilitating their access to the information provided by the seller."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_26
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q51'
);
SET @q_cet4_2024_12_3_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_27, 'What do we learn about publicity over protein in America?', '{"A":"A) It has helped to create the myth of protein deficiency.","B":"B) It has helped Americans in search of protein-rich diets.","C":"C) It has raised a lot of health concerns among the public.","D":"D) It has been funded by food companies and health experts."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_27
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q52'
);
SET @q_cet4_2024_12_3_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_28, 'Why have physicians in the U.S. never actually examined a patient with protein deficiency?', '{"A":"A) Americans can purchase many kinds of protein-rich foods everywhere.","B":"B) Americans can absorb the number of calories recommended by food experts.","C":"C) Americans can get sufficient protein just by eating adequate foods daily.","D":"D) Americans can rely on food supplements to prevent protein deficiency."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_28
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q53'
);
SET @q_cet4_2024_12_3_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_29, 'What should people take into consideration in deciding on the most preferable protein intake?', '{"A":"A) How healthy they are and what food they eat.","B":"B) How old they are and what activities they do.","C":"C) How much protein they consume and what their body weight is.","D":"D) How serious their protein deficiency is and what remedies they use."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_29
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q54'
);
SET @q_cet4_2024_12_3_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_30, 'What foods have been largely out of favor for more than a century?', '{"A":"A) Sugar-free snacks.","B":"B) Protein-rich foods.","C":"C) Both red and white meats.","D":"D) Sugary and fatty foods."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_30
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2024-12-3-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2024_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q55'
);
SET @q_cet4_2024_12_3_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2024-12-3-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2024_12_3_31, 'What does the author imply people in developed countries should do to keep healthy?', '{"A":"A) Enjoy natural food.","B":"B) Eat vegetarian diets.","C":"C) Consume enough protein daily.","D":"D) Replace meals with protein bars."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2024_12_3_31
);

-- ==================== cet4-2025-06-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-r1', 'BANKED_CLOZE', 'CET4', NULL, 'Psychologists have long been interested in how we construct our identities and the sorts of strategies that we use to present ourselves in society. New findings suggest that the kinds of __26__ and strategic self- presentation behaviour we see in adults appear at a much younger age than __27__ known. Research shows that a child''s awareness of social standing comes from adults. Like grown-ups, kids want to be __28__ by those they admire. Interactive experiences may provide opportunities for children to learn about what __29__ a desirable reputation and the kinds of strategies that are effective for __30__ a good reputation in their social environment. Five-year-olds aren''t just aware of their reputations, they also behave strategically to alter their outward image. They will __31__ their behaviour in order to appear moral or socially good in the eyes of key observers. While we know that adults use a large variety of attributes to manage and create impressions, we don''t yet know whether children __32__ and use the fact that different attributes are valuable at different times to different __33__ . It''s important for us to further consider where in this process children succeed in controlling their reputation and where they __34__ . A question to think about is, "What happens even earlier than age five?" Children don''t just show up to the first day of kindergarten and have the idea of reputation pop __35__ into existence. The logical question to ask is, "What happens even earlier?"', NULL, '["A) accepted","B) audiences","C) building","D) complex","E) constitutes","F) deputies","G) previously","H) revolving","I) samples","J) selected","K) solemn","L) struggle","M) suddenly","N) understand","O) vary"]', 245, 'IMPORT', 'cet4-2025-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-1-r1'
);
SET @pg_cet4_2025_06_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-r2', 'MATCHING', 'CET4', 'Getting young minds into design', 'A) Recently, a leading design federation in the UK warned that the UK could face a creative skills shortage, after the latest figures revealed a drop of almost 10 percent in students studying Design and Technology. These figures showed that the number of pupils that sat exams in Design and Technology fell 10 percent from 204,788 to 185,279 last year. B) Chief executive John Kampfner of the Creative Industries Federation thinks that this drop in figures has worrying implications for the skills pipeline in Britain''s hugely successful arts and creative industries. He said, "We already have skills shortages in many jobs such as animation(动画制作) and special effects." He added: "Engineering, which requires a similar mix of creative and technical skills, also has recruitment problems." C) Many other designers and architects have expressed concern over the future supply of home-grown talent for UK firms, and industry bodies have pointed out that there has been a lack of roots-level support. However, if these designers had visited the Design Museum shop in London earlier this year their fears may have been eased. With £10 to spend, they could have bought a fascinating children''s toy called "Dazzle Racer". An automotive cylinder(圆柱体), it included a wind-up, elastic(有弹性的)-band-powered mechanism, minimal parts, all 100 percent recycled, and lots of stickers. It was good fun, simple, eye-catching and very original. D) Well, you''d expect the Design Museum to commission and make some interesting items, but this one was different. Designed by a group of six Year 9 and Year 10 boys from Finchley Catholic High School, the toy was the winning entry in the museum''s 2015 Design Ventura competition, which brings the business of design to life for students aged 13 to 16 by challenging them to develop a new creative, sustainable and commercially feasible product for the Design Museum shop and attracts hundreds of entries nationwide. E) "We did Design Ventura in my previous school," says Liam Hourican, Finchley Catholic High School''s design technology curriculum leader. "Then when I changed schools four years ago, I introduced it here because it helps to develop so many skills." F) The theme for last year''s competition was "Move", and Hourican began with three groups working in lunch breaks and after school before selecting the group with the most innovative idea. Each participating school may submit just one proposal. "It''s the taking part and doing the work which is important," he says. "And I never dreamt we''d win." G) Catherine Ritman Smith, head of learning at the Design Museum, is expecting around 10,000 participants aged 13 to 16 to take part this year and says that the project—funded by Deutsche Bank as part of its youth engagement programme Born To Be—is the biggest event in the museum''s calendar. "We started Design Ventura with around 800 young people in 2010 and it has grown steadily since," she says. "Teachers like it because the skills are all transferable and it helps to validate the value of design as a subject," she explains, telling me that nearly 600 schools have taken part so far. H) So how does the competition work? A single-word theme is announced in the summer. This year it is "Change". Schools work with groups to produce imaginative design ideas for a product in simple materials that could sell for £10 in the Design Museum shop. Participating schools then register by November and eventually submit their design idea. Along the way there is training and support for teachers and tutoring for students from designers. An additional bonus is when the winners see their design on sale in the spring of the following year. I) Hourican and his pupils have happy memories of spending a whole day at the museum, having been selected as one of 10 shortlisted schools to present their idea to a panel of judges, including designer Jasper Conran. Then they worked with the Kin Design Studio in Shoreditch, met designers at their school and attended a lunch with Deutsche Bank employees. The students helped to make decisions and there were plenty of discussions—they changed the product''s name, for example. J) "One of the really useful things about this competition," says Hourican, "is that there''s a commercial element because the product is going on sale for real and the boys had to learn about budgeting and marketing, as well as designing their game." Profits go to charity. "The winning team chooses where it wants the profits to go," says Ritman Smith. "The Finchley Catholic High School product raised about £1,000 for Great Ormond Street Hospital." Winning entries in past years have included a make-your-own cloth kit called Dove Bunting and a threefold, wallet-sized travel game with goals at each end, called Badoiiing. K) It costs the schools nothing to participate in Design Ventura; the professional designers provide their services for free. Among them are architect Asif Khan, a Design Museum trustee who has worked as designer-in- residence at the museum, helping emerging architects. He has recently been commissioned to design the new Museum of London building in Smithfield. L) Another is television presenter and interior designer Naomi Cleaver, who is one of the competition''s judges. "I''m very keen to encourage young people," she says, observing that design brings together other subjects such as literature, art, history, geography and science. "Now that design education is limited in the curriculum, I''m all in favour of competitions such as Design Ventura, which helps to bring the standard curriculum to life," says Cleaver. "And the judging day is terrific fun. Some of these students are very imaginative. One group presented their idea in the form of a puppet show and we see some marvelous demonstration models. I''m always impressed by the levels of confidence and the support the students get from their teachers." M) Ritman Smith adds: "Design technology has become a tricky subject to make a case for, and we''ve heard of departments closing in some schools. We find that if pupils take part in Design Ventura in Year Nine it can be the trigger which leads them to opt for it at General Certificate of Secondary Education, so we are helping to keep alive something which is crucial to industry and entrepreneurship."', NULL, NULL, 1031, 'IMPORT', 'cet4-2025-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-1-r2'
);
SET @pg_cet4_2025_06_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-r3', 'CAREFUL_READING', 'CET4', NULL, 'New research suggests that pandas may be at risk of dying out because they are too comfortable. Experts say too much happiness can stop the bears from searching for new mates. Environmentalists have long believed that building roads or homes near the bears may threaten their survival by "reducing or fragmenting their natural: habitats", The Times reported. But the new research suggests that a "modest degree of discomfort and fragmentation" may actually help preserve panda populations. The research was conducted by scientists from Michigan State University. It concluded that pandas fail to wander off in search of new mates if they find their habitat too comfortable, resulting in a lack of vital genetic diversity. For their study—outlined in a paper in the journal Conservation Biology—the team looked at genetic diversity and spread among a Chinese panda population. The ideal level of perfectly livable habitat was found to be only 80% of an area, with the remainder either too harsh or too affected by human activity. The experts concluded that pandas should ideally "be happy enough to thrive, but not so content that they don''t want to move around and find new mates". Their conclusions about what The Guardian described as this "sweet spot" are in line with the so-called Goldilocks principle: that there can be just the right amount of something. The concept has been applied to a wide range of disciplines, from developmental psychology to economics and engineering. Claudio Sillero, a professor of conservation biology at Oxford University, told the newspaper that the new findings could have implications beyond panda conservation. "Most large animals that eat meat live in increasingly fragmented landscapes," said Sillero, who was not involved in the research. "It may well be that the messy nature of their relationship with human efforts induces more animals to scatter or travel further, and might result in greater genetic connectivity and enhanced population persistence." The most recent count of pandas found that there were more than 1,800 left in the wild, putting them on the list of vulnerable, but not endangered, species.', NULL, NULL, 343, 'IMPORT', 'cet4-2025-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-1-r3'
);
SET @pg_cet4_2025_06_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-r4', 'CAREFUL_READING', 'CET4', NULL, 'With those born with natural talents, it feels as if they excel without really trying. But what about those of us who don''t have a natural talent? We''ve been told all our lives that if you work hard, you too can succeed. But with the release of Angela Duckworth''s Grit, we are given a new key to success. "As much as talent counts, effort counts twice," says Duckworth in Grit. She introduces a new concept that talent may be overrated, and if you want real success, what you need is grit, the perfect combination of passion and persistence. Even if you have natural talent, it''s nothing without grit. Duckworth says grit is the difference between success and failure. A person who has grit is more likely to succeed than a person who does not. When we think about attaining success—whether it''s landing that job or learning that new skill—our thoughts are immediately burdened by all the things we must first learn. If you want that new job, you have to learn the job skills, then the interview skills, then the dress part—and you must be perfect at all of them. Grit is different because it tells us that perfection isn''t the goal. Grit lifts the unreasonable expectations off our shoulders. Grit tells us that the door is open wider than we first thought possible. Grit allows us to redefine our goals. Think about it: what''s something you''ve always wanted to do, but gave up because you "don''t have the skills for it"? What''s something you love but aren''t good at? The real workings of grit are to have sustainable passion and continue to try. Effort means more than your natural ability. Even if you haven''t mastered a skill, grit tells you that you can still succeed if you can transform your passion into action. In a way, Duckworth is giving new hope to people who have shut the doors on their dreams. She is saying it is possible that you can accomplish anything. If at first you fail, then try one more time with grit.', NULL, NULL, 345, 'IMPORT', 'cet4-2025-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-1-r4'
);
SET @pg_cet4_2025_06_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2025-06-1-r4' LIMIT 1);

-- 翻译 cet4-2025-06-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-translation'
);
SET @q_cet4_2025_06_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_01, '被誉为"杂交水稻(hybrid rice)之父"的袁隆平和他的科研团队克服重重困难,研发出了一种超级杂交水稻。这项技术获得了举世公认的巨大成功。通过这项技术的应用,水稻抗旱抗病能力更强,能适应不同的气候和土壤条件,产量可提高20-30%。超级杂交水稻营养丰富,口感更佳。目前,这项技术已经在许多国家得到广泛应用,为全球粮食安全做出了重大贡献。', NULL, 'Yuan Longping, known as the father of hybrid rice, and his research team, overcoming numerous difficulties, developed a super hybrid rice. This technology has achieved great success recognized worldwide. With the application of this technology, the rice has stronger resistance to drought and disease and can adapt to different climates and soil conditions, and its yield can increase by 20 to 30 percent. In addition, super hybrid rice is rich in nutrition and tastes better. Currently, this technology has been widely applied in many countries, making great contributions to global food security.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_01
);

-- 听力 Q1 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q01', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q01'
);
SET @q_cet4_2025_06_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_02, NULL, '{"A":"A) By slapping some butter on it.","B":"B) By enhancing its nourishment.","C":"C) By growing it in South Dakota.","D":"D) By cooking it in vegetable oil."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_02
);

-- 听力 Q2 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q02', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q02'
);
SET @q_cet4_2025_06_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_03, NULL, '{"A":"A) To introduce their corn to tourists.","B":"B) To attend an honorary ceremony.","C":"C) To share experience with other corn growers.","D":"D) To exhibit their corn at the state''s Corn Palace."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_03
);

-- 听力 Q3 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q03', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q03'
);
SET @q_cet4_2025_06_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_04, NULL, '{"A":"A) Stole mail several times.","B":"B) Forged postal keys illegally.","C":"C) Attacked postmen on multiple occasions.","D":"D) Broke a number of postal collection boxes."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_04
);

-- 听力 Q4 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q04', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q04'
);
SET @q_cet4_2025_06_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_05, NULL, '{"A":"A) A sentence for life.","B":"B) Loss of all their possessions.","C":"C) Twenty-three years'' hard labor.","D":"D) Up to fifteen years in prison."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_05
);

-- 听力 Q5 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q05', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q05'
);
SET @q_cet4_2025_06_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_06, NULL, '{"A":"A) It escapes regulation and misleads consumers.","B":"B) It ignores economically feasible recycling options.","C":"C) It creates waste and severely impacts the environment.","D":"D) It produces clothes affordable only to a tiny minority."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_06
);

-- 听力 Q6 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q06', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q06'
);
SET @q_cet4_2025_06_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_07, NULL, '{"A":"A) To cut consumers'' expenses in buying quality clothes.","B":"B) To enable the whole fast-fashion industry to be sustainable.","C":"C) To incentivize manufacturers to be more consumer-friendly.","D":"D) To urge manufacturers and consumers to reduce waste."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_07
);

-- 听力 Q7 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q07', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q07'
);
SET @q_cet4_2025_06_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_08, NULL, '{"A":"A) Recognizing the impact on consumers.","B":"B) Identifying the source of the problem.","C":"C) Abandoning the current business model.","D":"D) Establishing powerful regulatory bodies."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q08', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q08'
);
SET @q_cet4_2025_06_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_09, NULL, '{"A":"A) The city''s rush-hour traffic is intolerable.","B":"B) She cannot avoid rush-hour traffic.","C":"C) The local government is inefficient.","D":"D) The city is too big to move around easily."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_09
);

-- 听力 Q9 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q09', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q09'
);
SET @q_cet4_2025_06_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_10, NULL, '{"A":"A) Upgrading subway carriages.","B":"B) Increasing the number of bus routes.","C":"C) Air conditioning the city''s subway.","D":"D) Learning from other big cities."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_10
);

-- 听力 Q10 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q10', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q10'
);
SET @q_cet4_2025_06_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_11, NULL, '{"A":"A) He suffers from rush-hour crowding too.","B":"B) He is fortunate to live very near to work.","C":"C) He takes a half-hour bus ride to work.","D":"D) He is going to move closer to his office."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_11
);

-- 听力 Q11 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q11', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q11'
);
SET @q_cet4_2025_06_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_12, NULL, '{"A":"A) Recommend to her a good house near his office.","B":"B) Send her his housing agent''s telephone number.","C":"C) Tell her exactly what kind of property to look for.","D":"D) Make sure the agent finds something good for her."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_12
);

-- 听力 Q12 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q12', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q12'
);
SET @q_cet4_2025_06_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_13, NULL, '{"A":"A) He was remembered for the scar on his cheek.","B":"B) He received a heart operation a few days ago.","C":"C) He used to wear a sad face in school.","D":"D) He had some plastic surgery done."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_13
);

-- 听力 Q13 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q13', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q13'
);
SET @q_cet4_2025_06_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_14, NULL, '{"A":"A) The man''s deep sympathy for Johnny.","B":"B) The man''s use of the expression ''fixed''.","C":"C) The man''s covering up of what happened.","D":"D) The man''s good memory of his childhood."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_14
);

-- 听力 Q14 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q14', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q14'
);
SET @q_cet4_2025_06_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_15, NULL, '{"A":"A) It gave him a noticeable smartness.","B":"B) It made him appear even more manly.","C":"C) It seemed to give him a certain uniqueness.","D":"D) It seemed to make up for his physical defects."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_15
);

-- 听力 Q15 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q15', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q15'
);
SET @q_cet4_2025_06_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_16, NULL, '{"A":"A) Liberal.","B":"B) Hostile.","C":"C) Indifferent.","D":"D) Critical."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_16
);

-- 听力 Q16 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q16', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q16'
);
SET @q_cet4_2025_06_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_17, NULL, '{"A":"A) Through deliberation.","B":"B) Through evolution.","C":"C) Through invention.","D":"D) Through collaboration."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_17
);

-- 听力 Q17 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q17', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q17'
);
SET @q_cet4_2025_06_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_18, NULL, '{"A":"A) With people imitating sounds around them.","B":"B) With people interacting with animals close by.","C":"C) With people showing each other things nearby.","D":"D) With people trying to string sounds together."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_18
);

-- 听力 Q18 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q18', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q18'
);
SET @q_cet4_2025_06_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_19, NULL, '{"A":"A) Making sounds can free one''s hands for doing other things.","B":"B) Making sounds proves markedly easier than sign languages.","C":"C) Making sounds enables one to express their ideas more explicitly.","D":"D) Making sounds helps one communicate with people they can''t see."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_19
);

-- 听力 Q19 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q19', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q19'
);
SET @q_cet4_2025_06_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_20, NULL, '{"A":"A) Well disciplined.","B":"B) Quite confident.","C":"C) Somewhat selfish.","D":"D) Highly intelligent."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_20
);

-- 听力 Q20 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q20', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q20'
);
SET @q_cet4_2025_06_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_21, NULL, '{"A":"A) When they wanted to have a competitive team member.","B":"B) When they were looking for a cooperative workmate.","C":"C) When they found collaboration essential to them.","D":"D) When they were seeking someone to help them."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_21
);

-- 听力 Q21 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q21', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q21'
);
SET @q_cet4_2025_06_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_22, NULL, '{"A":"A) Avoid frightening competitors.","B":"B) Make clear their social goal.","C":"C) Adopt persuasive strategies.","D":"D) Consider the consequences."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_22
);

-- 听力 Q22 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q22', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q22'
);
SET @q_cet4_2025_06_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_23, NULL, '{"A":"A) Much evidence of humans capturing animals.","B":"B) More images of animals than humans.","C":"C) Fewer images of buildings than animals.","D":"D) Little proof of human fascination with animals."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_23
);

-- 听力 Q23 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q23', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q23'
);
SET @q_cet4_2025_06_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_24, NULL, '{"A":"A) They were open to the public.","B":"B) They were primarily native.","C":"C) They were kept by royalty.","D":"D) They were hardly injured."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_24
);

-- 听力 Q24 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q24', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q24'
);
SET @q_cet4_2025_06_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_25, NULL, '{"A":"A) To enable the public to watch animals close by.","B":"B) To introduce to Egyptians animals from Punt.","C":"C) To protect the endangered animals.","D":"D) To show off her riches and power."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_25
);

-- 听力 Q25 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q25', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q25'
);
SET @q_cet4_2025_06_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_26, NULL, '{"A":"A) It was part of the royal estate.","B":"B) It was a shelter for wild animals.","C":"C) It was the kingdom''s best-equipped zoo.","D":"D) It was the first public exhibit of animals."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q26'
);
SET @q_cet4_2025_06_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_27, NULL, '{"A":"A) accepted","B":"B) audiences","C":"C) building","D":"D) complex","E":"E) constitutes","F":"F) deputies","G":"G) previously","H":"H) revolving","I":"I) samples","J":"J) selected","K":"K) solemn","L":"L) struggle","M":"M) suddenly","N":"N) understand","O":"O) vary"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q27'
);
SET @q_cet4_2025_06_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_28, NULL, '{"A":"A) accepted","B":"B) audiences","C":"C) building","D":"D) complex","E":"E) constitutes","F":"F) deputies","G":"G) previously","H":"H) revolving","I":"I) samples","J":"J) selected","K":"K) solemn","L":"L) struggle","M":"M) suddenly","N":"N) understand","O":"O) vary"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q28'
);
SET @q_cet4_2025_06_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_29, NULL, '{"A":"A) accepted","B":"B) audiences","C":"C) building","D":"D) complex","E":"E) constitutes","F":"F) deputies","G":"G) previously","H":"H) revolving","I":"I) samples","J":"J) selected","K":"K) solemn","L":"L) struggle","M":"M) suddenly","N":"N) understand","O":"O) vary"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q29'
);
SET @q_cet4_2025_06_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_30, NULL, '{"A":"A) accepted","B":"B) audiences","C":"C) building","D":"D) complex","E":"E) constitutes","F":"F) deputies","G":"G) previously","H":"H) revolving","I":"I) samples","J":"J) selected","K":"K) solemn","L":"L) struggle","M":"M) suddenly","N":"N) understand","O":"O) vary"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q30'
);
SET @q_cet4_2025_06_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_31, NULL, '{"A":"A) accepted","B":"B) audiences","C":"C) building","D":"D) complex","E":"E) constitutes","F":"F) deputies","G":"G) previously","H":"H) revolving","I":"I) samples","J":"J) selected","K":"K) solemn","L":"L) struggle","M":"M) suddenly","N":"N) understand","O":"O) vary"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q31'
);
SET @q_cet4_2025_06_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_32, NULL, '{"A":"A) accepted","B":"B) audiences","C":"C) building","D":"D) complex","E":"E) constitutes","F":"F) deputies","G":"G) previously","H":"H) revolving","I":"I) samples","J":"J) selected","K":"K) solemn","L":"L) struggle","M":"M) suddenly","N":"N) understand","O":"O) vary"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q32'
);
SET @q_cet4_2025_06_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_33, NULL, '{"A":"A) accepted","B":"B) audiences","C":"C) building","D":"D) complex","E":"E) constitutes","F":"F) deputies","G":"G) previously","H":"H) revolving","I":"I) samples","J":"J) selected","K":"K) solemn","L":"L) struggle","M":"M) suddenly","N":"N) understand","O":"O) vary"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q33'
);
SET @q_cet4_2025_06_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_34, NULL, '{"A":"A) accepted","B":"B) audiences","C":"C) building","D":"D) complex","E":"E) constitutes","F":"F) deputies","G":"G) previously","H":"H) revolving","I":"I) samples","J":"J) selected","K":"K) solemn","L":"L) struggle","M":"M) suddenly","N":"N) understand","O":"O) vary"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q34'
);
SET @q_cet4_2025_06_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_35, NULL, '{"A":"A) accepted","B":"B) audiences","C":"C) building","D":"D) complex","E":"E) constitutes","F":"F) deputies","G":"G) previously","H":"H) revolving","I":"I) samples","J":"J) selected","K":"K) solemn","L":"L) struggle","M":"M) suddenly","N":"N) understand","O":"O) vary"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q35'
);
SET @q_cet4_2025_06_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_36, NULL, '{"A":"A) accepted","B":"B) audiences","C":"C) building","D":"D) complex","E":"E) constitutes","F":"F) deputies","G":"G) previously","H":"H) revolving","I":"I) samples","J":"J) selected","K":"K) solemn","L":"L) struggle","M":"M) suddenly","N":"N) understand","O":"O) vary"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q36'
);
SET @q_cet4_2025_06_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_37, 'During the course of preparing for Design Ventura, teachers receive training and support while students get tutoring from designers.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q37'
);
SET @q_cet4_2025_06_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_38, 'A visit to the Design Museum shop in London can reduce the designers'' fears about the future supply of talents educated in Britain.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q38'
);
SET @q_cet4_2025_06_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_39, 'One of Design Ventura''s judges says the competition adds vigour to the standard curriculum in schools.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q39'
);
SET @q_cet4_2025_06_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_40, 'Enrollment in Design and Technology decreased by nearly ten percent last year in the UK.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q40'
);
SET @q_cet4_2025_06_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_41, 'Participation of ninth graders in Design Ventura can motivate them to choose design technology as their subject.', NULL, 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q41'
);
SET @q_cet4_2025_06_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_42, 'Design Ventura is welcomed by teachers because it helps to prove the worth of design as a school subject.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q42'
);
SET @q_cet4_2025_06_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_43, 'The schools don''t have to pay anything to take part in the Design Ventura competition.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q43'
);
SET @q_cet4_2025_06_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_44, 'Participants in Design Ventura are challenged to create sustainable and marketable products.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q44'
);
SET @q_cet4_2025_06_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_45, 'Students benefit from Design Ventura because they can learn about budgeting and marketing in addition to game design.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q45'
);
SET @q_cet4_2025_06_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_46, 'According to an officer of the Creative Industries Federation, there is difficulty now in recruiting engineers in the UK.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q46'
);
SET @q_cet4_2025_06_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_47, 'What do we learn from new research about pandas?', '{"A":"A) They are losing habitat due to the building of roads and houses.","B":"B) They have stopped seeking new mates for reproduction.","C":"C) They may not adapt to the fragmentation of their habitat.","D":"D) They may cease to exist as a result of enjoying too good a life."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q47'
);
SET @q_cet4_2025_06_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_48, 'What can we conclude from the new research by scientists at Michigan State University?', '{"A":"A) Environmentalists'' long-time belief regarding panda conservation may be misleading.","B":"B) Housing development near pandas'' homes may threaten their survival.","C":"C) Pandas'' natural habitats are becoming less suitable for reproduction.","D":"D) The increased panda population is attributed to the fragmentation of their habitat."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q48'
);
SET @q_cet4_2025_06_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_49, 'What is the experts'' conclusion regarding pandas?', '{"A":"A) It is urgent to provide an ideal habitat for them to thrive.","B":"B) It is very important to preserve their genetic diversity.","C":"C) Their chances of finding new mates have a lot to do with their habitat.","D":"D) Their environment for survival has been continuously worsening."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q49'
);
SET @q_cet4_2025_06_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_50, 'What can we infer from the passage about the Goldilocks principle?', '{"A":"A) It needs to be confirmed by more studies on pandas.","B":"B) It applies to the preservation of pandas too.","C":"C) It has implications for future panda research.","D":"D) It can be used to locate the right spot for pandas."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q50'
);
SET @q_cet4_2025_06_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_51, 'What can the new findings do according to Professor Sillero?', '{"A":"A) Help discover new ways for the conservation of pandas.","B":"B) Help remove pandas from the list of endangered species.","C":"C) Shed light on the conservation of most large meat-eating animals.","D":"D) Show the complexity of interactions between humans and animals."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q51'
);
SET @q_cet4_2025_06_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_52, 'What does the passage say about people born with natural talents?', '{"A":"A) They seem to outdo others without hard work.","B":"B) They appear to know all the secrets to success.","C":"C) They feel it only too logical to succeed.","D":"D) They are bound to excel effortlessly."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q52'
);
SET @q_cet4_2025_06_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_53, 'What does Duckworth say about talent?', '{"A":"A) It is a new concept much too overrated.","B":"B) It proves necessary for big achievements.","C":"C) It plays a lesser role in one''s success.","D":"D) It is a guarantee for real success in life."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q53'
);
SET @q_cet4_2025_06_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_54, 'What does the passage say about people thinking of attaining success?', '{"A":"A) They are puzzled how to present their best to the employer.","B":"B) They are burdened by their expectation of perfection.","C":"C) They will try hard to land a job that fits their skills best.","D":"D) They will find themselves lacking in all the skills they need."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q54'
);
SET @q_cet4_2025_06_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_55, 'How does the author think grit can be helpful to us?', '{"A":"A) It allows us to know what we are good at.","B":"B) It opens our eyes to new opportunities.","C":"C) It focuses our attention on what we do.","D":"D) It lets us reconsider the goals to achieve."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2025-06-1-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2025_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q55'
);
SET @q_cet4_2025_06_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2025-06-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2025_06_1_56, 'What message does Duckworth try to convey in her book Grit?', '{"A":"A) We should perfect ourselves to ensure success.","B":"B) We should stay persistent even in face of failures.","C":"C) We can never master a skill without constant practice.","D":"D) We can never expect to reach our goals without passion."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2025_06_1_56
);

COMMIT;
