-- 由 scripts/import-exam.mjs 自动生成，请勿手工修改。
-- 版本: V1.0.37
-- 生成时间: 2026-11-09T14:51:12.498Z
-- 目标库: exercise_db
-- 执行前必须按 docs/数据库迁移规范.md 预览、备份、审批。
-- 范围：正常套 + 仅借听力套（残卷留后）；听力无音频不写 listening_audio。

START TRANSACTION;

-- ==================== cet6-2025-06-2 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-r1', 'BANKED_CLOZE', 'CET6', NULL, 'No beast on Earth is tougher than the tiny tardigrade(缓步类动物). It can __26__ being frozen at -272° Celsius, being exposed to the vacuum of outer space and even being __27__ with 500 times the dose of X- rays that would kill a human. In other words, the creature can endure conditions that don''t even exist on Earth. And researchers are looking to the microscopic animals to learn how to prepare humans and crops to handle the __28__ of space travel. The tardigrade''s indestructibility stems from its __29__ to its environment—which may seem surprising, since it lives in __30__ comfortable places, like the cool, wet patches of moss(青苔) that dot a garden wall. But it turns out that a tardigrade''s damp, mossy home can dry out many times each year. Drying is pretty __31__ for most living things. It does damage to cells in some of the same ways that freezing, vacuum and radiation do. Tardigrades, however, have __32__ special strategies for dealing with these kinds of damage. As a tardigrade dries out, its cells produce several strange proteins that are unlike anything found in other animals. In water, the proteins are shapeless. But as water disappears, the proteins self-assemble into long fibers that fill the cell''s __33__ . The fibers support the cell''s membranes(细胞膜) and proteins, preventing them from breaking or __34__ . Emulating tardigrades could one day help humans colonize outer space. Food crops could be engineered to produce tardigrade proteins, allowing these organisms to grow more efficiently on spacecraft where levels of radiation are elevated compared with on Earth. So if humans ever succeed in reaching the stars, they may accomplish this __35__ , in part, by standing on the shoulders of the tiny eight-legged endurance specialists in your backyard.', NULL, '["A) adaptations","B) blasted","C) catastrophic","D) evolved","E) feat","F) interior","G) probing","H) recurrence","I) rigors","J) seemingly","K) survive","L) tempt","M) thrill","N) unanimously","O) unfolding"]', 292, 'IMPORT', 'cet6-2025-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-2-r1'
);
SET @pg_cet6_2025_06_2_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-2-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-r2', 'MATCHING', 'CET6', 'Yes, eating meat affects the environment, but cows are not killing the climate', 'A) As the scale and impacts of climate change become increasingly alarming, meat is a popular target for action. Advocates for the protection of the natural environment from destruction or pollution urge the public to eat less meat. Some activists have even called for taxing meat to reduce consumption of it. B) A key claim underlying these arguments holds that globally, meat production generates more greenhouse gases than the entire transportation sector. However, this claim is demonstrably wrong, as I will show. And its persistence has led to false assumptions about the linkage between meat and climate change. C) My recent research focuses on ways in which animal agriculture affects air quality and climate change. In my view, there are many reasons for either choosing animal protein or opting for a vegetarian selection. However, abandoning meat and meat products is not the environmental panacea(万灵药) many would have us believe. And if taken to an extreme, it also could have harmful nutritional consequences. D) A healthy portion of meat''s negative reputation centers on the assertion that livestock is the largest source of greenhouse gases worldwide. For example, an analysis published in 2009 by the World Watch Institute based in Washington, D.C. asserted that 51 percent of global greenhouse gas emissions come from rearing and processing livestock. According to the U.S. Environmental Protection Agency, the largest sources of U.S. greenhouse gas emissions in 2016 were electricity production (28 percent of total emissions), transportation (28 percent) and industry (22 percent). All of agriculture accounted for a total of 9 percent, but all of animal agriculture contributes less than half of this amount, representing 3.9 percent of the total greenhouse emission in the U.S. That is very different from claiming that livestock represents as much as or more than transportation. E) Why is there such a misconception? In 2006 the United Nations Food and Agriculture Organization (FAO) published a study titled "Livestock''s Long Shadow," which received widespread international attention. It stated that livestock produced a staggering 18 percent of the world''s greenhouse gas emissions. The agency drew a startling conclusion that livestock was doing more to harm the climate than all modes of transportation combined. This latter claim was wrong, and has since been corrected by Henning Stenfeld, the report''s senior author. F) The problem was that analysts from the FAO used a comprehensive life-cycle assessment to study the climate impact of livestock, but a different method when they analyzed transportation. For livestock, they considered every factor associated with producing meat. This included emissions from fertilizer production, converting land from forests to pastures, growing feed, and direct emissions from animals (manure as well as expelling of gas from the stomach) from birth to death. G) However, when they looked at transportation''s carbon footprint, they ignored impacts on the climate from manufacturing vehicle materials and parts, assembling vehicles and maintaining roads, bridges and airports. Instead, they only considered the exhaust smoke emitted by finished cars, trucks, trains and planes. As a result, the FAO''s comparison of greenhouse gas emissions from livestock to those from transportation was greatly distorted. H) I pointed out this flaw during a speech to fellow scientists in San Francisco on March 22, 2010, which led to a flood of media coverage. To its credit, the FAO immediately owned up to its error. Unfortunately, the agency''s initial claim that livestock was responsible for the lion''s share of world greenhouse gas emissions had already received wide coverage. To this day, we struggle to "unring" the bell. In its most recent assessment report, the FAO estimated that livestock produces 14.5 percent of global greenhouse gas emissions from human activities. There is no comparable full life-cycle assessment for transportation. However, as Stenfeld has pointed out, direct emissions from transportation versus livestock can be compared and amount to 14 versus 5 percent, respectively. I) Many people continue to think that avoiding meat as infrequently as once a week will make a significant difference to the climate. But according to one recent study, even if Americans eliminated all animal protein from their diets, they would reduce U.S. greenhouse gas emissions by only 2.6 percent. According to our research at the University of California, Davis, if the practice of Meatless Monday were to be adopted by all Americans, we''d see a reduction of only 0.5 percent. J) Moreover, technological, genetic and management changes that have taken place in U.S. agriculture over the past 70 years have made livestock production more efficient and less greenhouse gas-intensive. According to the FAO''s statistical database, total direct greenhouse gas emissions from U.S. livestock have declined by 11.3 percent since 1961, while production of livestock meat has more than doubled. K) Demand for meat is rising in developing and emerging economies, especially in the Middle East, North Africa and Southeast Asia. For example, raising livestock such as goats in Kenya is an important source of food and income for many small-scale farmers and herders. But meat consumption per person in these regions still lags that of developed countries. In 2015, average annual meat consumption per person in developed countries was 92 kilograms, compared to 24 kilograms in the Middle East and North Africa and 18 kilograms in Southeast Asia. Still, given projected population growth in the developing world, there will certainly be an opportunity for countries such as the United States to bring their sustainable livestock rearing practices to the table. L) Removing animals from U.S. agriculture would lower national greenhouse gas emissions to a small degree, but it would also make it harder to meet people''s nutritional requirements. Many critics of animal agriculture are quick to point out that if farmers raised only plants, they could produce more pounds of food and more calories per person. But humans also need many essential micro- and macro-nutrients for good health. It''s hard to make a compelling argument that the United States has a calorie deficit, given its high national rates of adult and child obesity. Moreover, not all plant parts are edible or desirable. Raising livestock is a way to add nutritional and economic value to plant agriculture. M) As one example, the energy in plants that livestock consume is most often contained in cellulose(纤维素), which is indigestible for humans and many other mammals. But cows, sheep and other ruminant(反刍的) animals can break cellulose down and release the solar energy contained in this vast resource. According to the FAO, as much as 70 percent of all agricultural land globally is range land that can only be utilized as grazing land for ruminant livestock. N) The world population is currently projected to reach 9.8 billion by 2050. Feeding this many people will raise immense challenges. Meat is more calorie-dense per serving than vegetarian options, and ruminant animals largely thrive on feed that is not suitable for humans. Raising livestock also offers much-needed income for small-scale farmers in developing nations. Worldwide, livestock provides a livelihood for 1 billion people. O) Climate change demands urgent attention, and the livestock industry has a large overall environmental footprint that affects air, water and land. These, combined with a rapidly rising world population, give us plenty of compelling reasons to continue to work for greater efficiencies in animal agriculture. I believe the place to start is with science-based facts.', NULL, NULL, 1209, 'IMPORT', 'cet6-2025-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-2-r2'
);
SET @pg_cet6_2025_06_2_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-2-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-r3', 'CAREFUL_READING', 'CET6', NULL, 'Why are we so worried about our careers? Partly it''s to do with money, but there''s a psychological aspect to our fears as well. We worry because we suspect—not wrongly—that the world is full of a frightening sort of person ready to judge us ruthlessly and swiftly: a person we can call a snob. A snob is anyone who takes a relatively small part of us and uses it to come to a rigid conclusion about how much of their attention we deserve. In the past, that might be your ancestry and royal connections. Nowadays, the snob cares about one thing only: what you do for a living. This explains why the first question we will be asked in any new social context is ''What do you do?'' and according to how we answer, snobs will either welcome us with broad smiles, or leave us in the cold. And that is why we are fired up by such a desperate urge to achieve and impress. Sometimes our behaviour is mistaken for greed and vanity, but it is more than this. A lot of our interest in fancy cars, jobs and houses has nothing to do with materialism. It has to do with a hunger for the respect and esteem that is only available in our societies through the acquisition of material goods. It isn''t the goods themselves we seek, it is the love we stand to gain through our possession of them. The next time we see someone driving a Ferrari, we shouldn''t condemn them for their greed, we should pity them for the intensity of their need for love from the world. At the root of snobbery is a lack of imagination and confidence about how to decide who in the world is valuable. The snobs are brutally misguided and slavish in their beliefs about how the superior individuals can be identified. For snobs, it is the already acclaimed and already successful who are the only ones worthy of respect. There is no room in their timid regimented minds to imagine that someone might be clever, kind or good—and yet somehow have been overlooked entirely by society, their qualities lying hidden beneath an unfamiliar veil, and having as yet discovered no obvious outlet. The true answer to snobbery is not to say that there is no such thing as a better or worse person, but to insist that better or worse exist in constantly unexpected places and carry none of the outward signs of distinction. And because we are such poor judges of the worth of others, our ultimate duty remains to be kind, good, curious and imaginative about pretty much everyone who ever crosses our path.', NULL, NULL, 448, 'IMPORT', 'cet6-2025-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-2-r3'
);
SET @pg_cet6_2025_06_2_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-2-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-r4', 'CAREFUL_READING', 'CET6', NULL, 'Women have historically been paid less. But in the US in the 1980s, they began to catch up—fast. During that decade, the gender pay gap closed by about one percentage point a year. Had that trend continued, the gender wage gap would have been closed by 2017. But the trend didn''t continue, and the gap remains yawning. According to a new study from academics at Harvard, the stagnation can be put down, perhaps counterintuitively, to the introduction of state and federal family leave policies. The academics argue that during the 1990s, as governments began to introduce leave policies, it was mainly women who took advantage of them. Though the leave policies might have helped those women to stay in the workplace—instead of dropping out to have families—those who returned saw their wages had increased at lower rates than the men. After family leave was introduced in the US, in fact, the rate of gender wage convergence fell to just 0.03 percentage points per year, and has remained there ever since. Those monitoring the process towards salary equity at work have long watched as progress slowed in many countries around the world. In fact, that progress began to reverse during the pandemic(大流行病). The gender pay gap is one of the most outstanding examples of that lack of parity(平等), and still exists just about everywhere. The motherhood penalty has become a shorthand for describing why: In many places, especially rich countries, women earn the same as men until they reach their childbearing years. Women who have children begin to see their salaries slip behind their male counterparts. for work and energy for career advancement. But it''s also because mothers are passed over for raises and promotion, and because time out of the workplace sets women back, even if that time is taken voluntarily, and supported by company or government policy. What would have happened if leave policies hadn''t been introduced? The study doesn''t go into that question, other than to say that if the 1980s trend continued, we would have been at parity by now. It''s possible, however, that the journey towards wage parity would have stalled either way. If women''s gains in the 1980s were made through the erasure of things like bias, once those less uncontrollable problems had been addressed, there would still have been an issue with women—who are the ones to bear children and take care of them in the early weeks because of biological factors like the ability to breastfeed, forcing them to take breaks, whether or not those breaks were mandated.', NULL, NULL, 425, 'IMPORT', 'cet6-2025-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-2-r4'
);
SET @pg_cet6_2025_06_2_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-2-r4' LIMIT 1);

-- 翻译 cet6-2025-06-2
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-translation'
);
SET @q_cet6_2025_06_2_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_01, '粤港澳大湾区(Guangdong-Hong Kong-Macao Greater Bay Area)具有得天独厚的地理位置,拥有完善的交通基础设施和丰富的产业资源。大湾区是中国开放程度最高、经济活力最强的区域之一,在国家经济发展中具有重要的战略地位。大湾区不仅将建成充满活力的世界级城市群和具有全球影响力的国际科技创新中心,还将打造成适合工作、购物、旅游的优质生活圈。随着改革开放的不断深入,大湾区的建设将进一步推动区域经济发展。到2035年,大湾区将实现成为国际一流湾区的目标。', NULL, 'The Guangdong-Hong Kong-Macao Greater Bay Area boasts a favorable geographical location, well- developed transport infrastructure and abundant industrial resources. As one of the most open and economically dynamic regions in China, the Greater Bay Area holds an important strategic position in the country''s economic development. It will not only be built into a dynamic world-class city cluster and an international center for sci-tech innovation with global influence, but also be turned into a quality living circle suitable for working, shopping and traveling. With the deepening of the reform and opening- up, the construction of the Greater Bay Area will further promote regional economic development. By 2035, the Greater Bay Area will achieve its goal of becoming a world-class bay area.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_01
);

-- 听力 Q1 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q01', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q01'
);
SET @q_cet6_2025_06_2_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_02, NULL, '{"A":"A) They have to make a choice by the end of the day.","B":"B) Both candidates are very keen on getting the job.","C":"C) They hold different views on the procedure.","D":"D) Both candidates are quite competitive."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_02
);

-- 听力 Q2 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q02', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q02'
);
SET @q_cet6_2025_06_2_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_03, NULL, '{"A":"A) Both Rachel and Peter came across as respectful and professional.","B":"B) Rachel scored moderately higher grades than Peter at school.","C":"C) Both Rachel and Peter excelled in their academic pursuit.","D":"D) Peter appeared slightly stronger than Rachel physically."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_03
);

-- 听力 Q3 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q03', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q03'
);
SET @q_cet6_2025_06_2_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_04, NULL, '{"A":"A) His use of body language.","B":"B) His accumulation of experience.","C":"C) His unusual state of mind.","D":"D) His knowledge about the company."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_04
);

-- 听力 Q4 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q04', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q04'
);
SET @q_cet6_2025_06_2_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_05, NULL, '{"A":"A) Compare the candidates side by side again.","B":"B) Ask the board to cast the deciding vote.","C":"C) Find a way to break the tie next time.","D":"D) Let John make the final decision."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_05
);

-- 听力 Q5 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q05', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q05'
);
SET @q_cet6_2025_06_2_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_06, NULL, '{"A":"A) The private label \\"L''Orange\\".","B":"B) The woman''s latest collection.","C":"C) This season''s new fashion.","D":"D) The head designer''s role."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_06
);

-- 听力 Q6 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q06', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q06'
);
SET @q_cet6_2025_06_2_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_07, NULL, '{"A":"A) Something reflecting the social norms.","B":"B) Something meeting public expectations.","C":"C) Something slightly absurd.","D":"D) Something a bit ambiguous."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_07
);

-- 听力 Q7 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q07', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q07'
);
SET @q_cet6_2025_06_2_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_08, NULL, '{"A":"A) Merge styles often at opposite ends of the fashion spectrum.","B":"B) Learn from the designs of the Asian rural mountain villagers.","C":"C) Make velvet capes look both majestic and masculine.","D":"D) Draw intricate patterns onto a traditional power suit."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q08', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q08'
);
SET @q_cet6_2025_06_2_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_09, NULL, '{"A":"A) Obtaining the woman''s signature.","B":"B) Seeing the woman''s new creations.","C":"C) Incorporating indigenous aspects into his work.","D":"D) Sharing more ideas with the woman next time."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_09
);

-- 听力 Q9 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q09', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q09'
);
SET @q_cet6_2025_06_2_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_10, NULL, '{"A":"A) They could readily recognize their owner simply by looking.","B":"B) They could understand the implications of human commands.","C":"C) They could be domesticated to act as our companions.","D":"D) They could follow pointing gestures without training."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_10
);

-- 听力 Q10 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q10', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q10'
);
SET @q_cet6_2025_06_2_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_11, NULL, '{"A":"A) Cultivating them to be intelligent creatures.","B":"B) Training them to behave like domesticated dogs.","C":"C) Understanding how humans impact their behavior.","D":"D) Taking measures to reduce their numbers."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_11
);

-- 听力 Q11 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q11', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q11'
);
SET @q_cet6_2025_06_2_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_12, NULL, '{"A":"A) Tame them through repeated training.","B":"B) Treat them with sensitivity and respect.","C":"C) Make them responsive to our commands.","D":"D) Watch their behavior and try to improve it."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_12
);

-- 听力 Q12 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q12', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q12'
);
SET @q_cet6_2025_06_2_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_13, NULL, '{"A":"A) The temperature inside it varies from place to place.","B":"B) Proper placement facilitates access to food products.","C":"C) Its different shelves are designed for different purposes.","D":"D) The space in an average fridge changes from top to bottom."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_13
);

-- 听力 Q13 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q13', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q13'
);
SET @q_cet6_2025_06_2_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_14, NULL, '{"A":"A) To slow the rising of temperature in it.","B":"B) To provide a big box of evenly cold air.","C":"C) To prevent germs from growing quickly.","D":"D) To keep the food cold as long as possible."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_14
);

-- 听力 Q14 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q14', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q14'
);
SET @q_cet6_2025_06_2_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_15, NULL, '{"A":"A) On the top shelf.","B":"B) In the middle section.","C":"C) On the inside of its doors.","D":"D) At the back of its bottom shelf."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_15
);

-- 听力 Q15 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q15', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q15'
);
SET @q_cet6_2025_06_2_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_16, NULL, '{"A":"A) They will be extra-chilly.","B":"B) They will be hard to defrost.","C":"C) They will be contaminated.","D":"D) They will be ruined."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_16
);

-- 听力 Q16 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q16', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q16'
);
SET @q_cet6_2025_06_2_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_17, NULL, '{"A":"A) Chronic depression.","B":"B) Growing feebleness.","C":"C) Hip fracture.","D":"D) Fatal infections."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_17
);

-- 听力 Q17 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q17', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q17'
);
SET @q_cet6_2025_06_2_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_18, NULL, '{"A":"A) It feels real and relevant.","B":"B) It contributes to psychology.","C":"C) It outcompetes lots of academics'' research.","D":"D) It wins recognition outside of Birmingham."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_18
);

-- 听力 Q18 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q18', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q18'
);
SET @q_cet6_2025_06_2_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_19, NULL, '{"A":"A) By bringing together experts old and young.","B":"B) By counting on advanced modern technology.","C":"C) By making full use of her expertise.","D":"D) By combining multiple perspectives."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_19
);

-- 听力 Q19 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q19', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q19'
);
SET @q_cet6_2025_06_2_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_20, NULL, '{"A":"A) They don''t teach basic organization.","B":"B) They don''t focus on teaching techniques.","C":"C) They attach little importance to recipes.","D":"D) They hire very few distinguished chefs."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_20
);

-- 听力 Q20 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q20', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q20'
);
SET @q_cet6_2025_06_2_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_21, NULL, '{"A":"A) It''s unique to celebrity chefs.","B":"B) It''s a way of transformation.","C":"C) It''s too demanding for them.","D":"D) It''s a way of life to them."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_21
);

-- 听力 Q21 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q21', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q21'
);
SET @q_cet6_2025_06_2_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_22, NULL, '{"A":"A) Respect others so as to be respected.","B":"B) Use time and resources in a wise way.","C":"C) Cultivate a habit of self-discipline.","D":"D) Learn from philosophers earnestly."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_22
);

-- 听力 Q22 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q22', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q22'
);
SET @q_cet6_2025_06_2_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_23, NULL, '{"A":"A) The motive for hard work.","B":"B) The reason for stagnation.","C":"C) The basis for self-improvement.","D":"D) The justification for self-confidence."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_23
);

-- 听力 Q23 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q23', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q23'
);
SET @q_cet6_2025_06_2_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_24, NULL, '{"A":"A) Feel confidence, happiness and satisfaction.","B":"B) Believe they have achieved their life goals.","C":"C) Use a key tool for setting ambitious goals.","D":"D) Stop imagining further progress in life."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_24
);

-- 听力 Q24 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q24', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q24'
);
SET @q_cet6_2025_06_2_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_25, NULL, '{"A":"A) We feel we are always falling behind others.","B":"B) We have to adapt to the ever-changing goal.","C":"C) There are various misconceptions about goal setting.","D":"D) There are always problems with the goal originally set."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_25
);

-- 听力 Q25 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q25', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q25'
);
SET @q_cet6_2025_06_2_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_26, NULL, '{"A":"A) A noticeable change in the number of goals to achieve.","B":"B) Measuring always against the gap rather than the gain.","C":"C) Measuring where we''ve come from instead of measuring against the goal.","D":"D) A proper conception of what we fail to notice in trying to achieve our goals."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q26'
);
SET @q_cet6_2025_06_2_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_27, NULL, '{"A":"A) adaptations","B":"B) blasted","C":"C) catastrophic","D":"D) evolved","E":"E) feat","F":"F) interior","G":"G) probing","H":"H) recurrence","I":"I) rigors","J":"J) seemingly","K":"K) survive","L":"L) tempt","M":"M) thrill","N":"N) unanimously","O":"O) unfolding"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q27'
);
SET @q_cet6_2025_06_2_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_28, NULL, '{"A":"A) adaptations","B":"B) blasted","C":"C) catastrophic","D":"D) evolved","E":"E) feat","F":"F) interior","G":"G) probing","H":"H) recurrence","I":"I) rigors","J":"J) seemingly","K":"K) survive","L":"L) tempt","M":"M) thrill","N":"N) unanimously","O":"O) unfolding"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q28'
);
SET @q_cet6_2025_06_2_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_29, NULL, '{"A":"A) adaptations","B":"B) blasted","C":"C) catastrophic","D":"D) evolved","E":"E) feat","F":"F) interior","G":"G) probing","H":"H) recurrence","I":"I) rigors","J":"J) seemingly","K":"K) survive","L":"L) tempt","M":"M) thrill","N":"N) unanimously","O":"O) unfolding"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q29'
);
SET @q_cet6_2025_06_2_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_30, NULL, '{"A":"A) adaptations","B":"B) blasted","C":"C) catastrophic","D":"D) evolved","E":"E) feat","F":"F) interior","G":"G) probing","H":"H) recurrence","I":"I) rigors","J":"J) seemingly","K":"K) survive","L":"L) tempt","M":"M) thrill","N":"N) unanimously","O":"O) unfolding"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q30'
);
SET @q_cet6_2025_06_2_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_31, NULL, '{"A":"A) adaptations","B":"B) blasted","C":"C) catastrophic","D":"D) evolved","E":"E) feat","F":"F) interior","G":"G) probing","H":"H) recurrence","I":"I) rigors","J":"J) seemingly","K":"K) survive","L":"L) tempt","M":"M) thrill","N":"N) unanimously","O":"O) unfolding"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q31'
);
SET @q_cet6_2025_06_2_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_32, NULL, '{"A":"A) adaptations","B":"B) blasted","C":"C) catastrophic","D":"D) evolved","E":"E) feat","F":"F) interior","G":"G) probing","H":"H) recurrence","I":"I) rigors","J":"J) seemingly","K":"K) survive","L":"L) tempt","M":"M) thrill","N":"N) unanimously","O":"O) unfolding"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q32'
);
SET @q_cet6_2025_06_2_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_33, NULL, '{"A":"A) adaptations","B":"B) blasted","C":"C) catastrophic","D":"D) evolved","E":"E) feat","F":"F) interior","G":"G) probing","H":"H) recurrence","I":"I) rigors","J":"J) seemingly","K":"K) survive","L":"L) tempt","M":"M) thrill","N":"N) unanimously","O":"O) unfolding"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q33'
);
SET @q_cet6_2025_06_2_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_34, NULL, '{"A":"A) adaptations","B":"B) blasted","C":"C) catastrophic","D":"D) evolved","E":"E) feat","F":"F) interior","G":"G) probing","H":"H) recurrence","I":"I) rigors","J":"J) seemingly","K":"K) survive","L":"L) tempt","M":"M) thrill","N":"N) unanimously","O":"O) unfolding"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q34'
);
SET @q_cet6_2025_06_2_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_35, NULL, '{"A":"A) adaptations","B":"B) blasted","C":"C) catastrophic","D":"D) evolved","E":"E) feat","F":"F) interior","G":"G) probing","H":"H) recurrence","I":"I) rigors","J":"J) seemingly","K":"K) survive","L":"L) tempt","M":"M) thrill","N":"N) unanimously","O":"O) unfolding"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q35'
);
SET @q_cet6_2025_06_2_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_36, NULL, '{"A":"A) adaptations","B":"B) blasted","C":"C) catastrophic","D":"D) evolved","E":"E) feat","F":"F) interior","G":"G) probing","H":"H) recurrence","I":"I) rigors","J":"J) seemingly","K":"K) survive","L":"L) tempt","M":"M) thrill","N":"N) unanimously","O":"O) unfolding"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q36'
);
SET @q_cet6_2025_06_2_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_37, 'The FAO concluded that farm animals were producing more greenhouse gases than all modes of transportation combined.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q37'
);
SET @q_cet6_2025_06_2_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_38, 'Consumption of meat per person in developing countries is much less than that in countries like the U.S.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q38'
);
SET @q_cet6_2025_06_2_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_39, 'The FAO was worthy of praise in that it admitted its mistake once it was pointed out.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q39'
);
SET @q_cet6_2025_06_2_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_40, 'Environmentalists try hard to make people consume less meat to combat climate change.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q40'
);
SET @q_cet6_2025_06_2_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_41, 'Recent research has shown that even if Americans quit eating meat altogether, the resulting reduction of greenhouse gases in the U.S. would be slight.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q41'
);
SET @q_cet6_2025_06_2_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_42, 'More than half of the world''s farmland is suitable only for animals like cows to graze on.', NULL, 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q42'
);
SET @q_cet6_2025_06_2_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_43, 'The allegation that farm animals produce the world''s largest portion of greenhouse gases is responsible for meat''s bad reputation.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q43'
);
SET @q_cet6_2025_06_2_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_44, 'Raising farm animals makes it easier to meet people''s nutritional needs.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q44'
);
SET @q_cet6_2025_06_2_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_45, 'The author doesn''t believe giving up meat and meat products will be a cure-all for the environmental problem.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q45'
);
SET @q_cet6_2025_06_2_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_46, 'Changes in America''s farming technology and management in the past decades have increased efficiency and reduced greenhouse gas emissions in meat production.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q46'
);
SET @q_cet6_2025_06_2_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_47, 'What gives rise to our worry about careers apart from money?', '{"A":"A) Fear of being judged in a snobbish manner.","B":"B) The prospect of facing fault-finding managers.","C":"C) The ruthless way employees are often treated.","D":"D) Fright at the difficulty in hunting for a job."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q47'
);
SET @q_cet6_2025_06_2_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_48, 'What do we learn from the passage about today''s snobs?', '{"A":"A) They try hard to dig into a person''s past.","B":"B) They draw a rigid conclusion about people.","C":"C) They judge a person by their occupation.","D":"D) They tend to place people in a social context."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q48'
);
SET @q_cet6_2025_06_2_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_49, 'What does the author say about people''s interest in material goods?', '{"A":"A) It is the cause for condemnation of their greed.","B":"B) It has a lot to do with the comforts they provide.","C":"C) It arouses pity rather than respect from the wealthy.","D":"D) It arises from their craving for social recognition."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q49'
);
SET @q_cet6_2025_06_2_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_50, 'What kind of people do snobs deem worth respect and esteem?', '{"A":"A) Those with fame and fortune.","B":"B) Those with regimented minds.","C":"C) Those with intelligence and imagination.","D":"D) Those with qualities lying hidden in disguise."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q50'
);
SET @q_cet6_2025_06_2_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_51, 'What does the author imply we should do to avoid being snobbish?', '{"A":"A) Be aware there has never been such a thing as a better or worse person.","B":"B) Be kind to and curious about those who we happen to meet in our lives.","C":"C) Realize that better or worse keeps changing in unexpected ways.","D":"D) Judge people on the basis of their distinctive character traits."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q51'
);
SET @q_cet6_2025_06_2_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_52, 'What do we learn about the gender pay gap in the US during the 1980s?', '{"A":"A) It was being slowly closed.","B":"B) It was shrinking rapidly.","C":"C) It started to yawn.","D":"D) It remained substantial."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q52'
);
SET @q_cet6_2025_06_2_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_53, 'What happened with the introduction of state and federal family leave policies?', '{"A":"A) The process towards salary equity at work began to reverse.","B":"B) The rate of gender wage convergence started to fall noticeably.","C":"C) The trend of women returning to work after childbirth started.","D":"D) The narrowing of the gender pay gap attracted more attention."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q53'
);
SET @q_cet6_2025_06_2_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_54, 'What partly accounts for the slip in women''s salaries?', '{"A":"A) The insufficient motivation women generally have for career advancement.","B":"B) The opportunities numerous women give up for pay raise and promotion.","C":"C) The huge amounts of time and energy women spend taking care of the family.","D":"D) The lack of policy support from government and business corporations."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q54'
);
SET @q_cet6_2025_06_2_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_55, 'What does the new study say about wage parity?', '{"A":"A) It would have stalled if those controllable problems had not been addressed.","B":"B) It would have halted if company and government had not worked together.","C":"C) It would have been achieved with the complete erasure of gender biases.","D":"D) It would have been attained with the continuation of the 1980s trend."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-2-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q55'
);
SET @q_cet6_2025_06_2_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-2-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_2_56, 'What prevents women from achieving parity with men in the final analysis?', '{"A":"A) Ignoring biases against women in the workplace.","B":"B) Giving birth to children and taking care of them.","C":"C) Failing to mandate breaks for childbirth and care.","D":"D) Lacking resources to address biological problems."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_2_56
);

-- ==================== cet6-2025-06-3 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-r1', 'BANKED_CLOZE', 'CET6', NULL, 'The slow progress of women in elective office is frustrating for some political observers and experts— including myself. Achieving gender equality in Congress is an important goal. This is because the number of women involved in legislative decisions has significant __26__ for all the policies that governments __27__ . Female legislators are more likely than men to introduce, speak about and work to pass policies that disproportionately affect women and girls, such as paid family leave, pay __28__ and gender-based violence. Having more women in Congress also fosters a greater sense of connection between female voters and government. In addition, it __29__ women''s sense that government cares about their concerns and inspires young women to become more politically engaged. While women are underrepresented in governments around the globe, it is a particularly __30__ problem in the United States. Currently, the U.S. ranks 73rd in the world when it comes to female representation in government. But the reason women are so __31__ underrepresented in U.S. government is not because they face resistance from voters or struggle to raise money. On the contrary, decades of research shows that female candidates raise as much money and win as often as male politicians with similar __32__ . Rather, the slow progress of women in politics is a tale of two political parties. In the next Congress, there will be 107 female Democratic lawmakers and 42 female Republican lawmakers in the Senate and House combined. In order for women to gain half of the seats in Congress, more women need to run, __33__ on Republican tickets. This will require the Republican Party as a whole to __34__ recruiting women—and not just for one election cycle, but in a __35__ way.', NULL, '["A) bolsters","B) consequences","C) credentials","D) dramatically","E) enact","F) equity","G) especially","H) evasively","I) formidable","J) impetus","K) lavish","L) prioritize","M) suffices","N) sustained","O) tenured"]', 285, 'IMPORT', 'cet6-2025-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-3-r1'
);
SET @pg_cet6_2025_06_3_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-3-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-r2', 'MATCHING', 'CET6', 'The Benefits of Solitude', 'A) I can be a reluctant socialiser. I''m sometimes secretly pleased when social plans are called off. I get restless a few hours into a hangout. I even once went on a free 10-day silent meditation(冥想) retreat—not for the meditation, but for the silence. B) So I can relate to author Anneli Rufus, who wrote in *Party of One: The Loners'' Manifesto*: "When parents on TV shows punished their kids by ordering them to go to their rooms, I was confused. I loved my room. Being there behind a locked door was a treat. To me a punishment was being ordered to play games with my cousin Louis." C) Unsocial tendencies like these are often far from ideal. Abundant research shows the harms of social isolation, considered a serious public health problem in countries that have rapidly ageing populations (though talk of a ''loneliness epidemic'' may be exaggerated). In the UK, the Royal College of General Practitioners says that loneliness has the same risk level for premature death as diabetes. Strong social connections are important for cognitive functioning, motor function and a smoothly running immune system. D) This is especially clear from cases of extreme social isolation. Examples of people kept in captivity, children kept isolated in abusive orphanages, and prisoners kept in solitary confinement all show how prolonged solitude can lead to hallucinations(幻觉) and other forms of mental instability. E) But these are severe and involuntary cases of aloneness. For those of us who just prefer plenty of alone time, emerging research suggests some good news: there are upsides to being alone—for both our work lives and our emotional well-being. F) Solitude is a time for reflection, for thinking about things more deeply. In a world increasingly focused on speed and competitiveness, solitude is precious and something to be treasured. And there are benefits in learning to love your solitude. G) One key benefit of solitude is improved creativity. Gregory Feist, who focuses on the psychology of creativity at California''s San Jose State University, has defined creativity as thinking or activity with two key elements: originality and usefulness. He has found that personality traits commonly associated with creativity are openness (receptiveness to new thoughts and experiences), self-confidence, and autonomy—which may include "a lack of concern for social norms" and "a preference for being alone". In fact, Feist''s research on both artists and scientists shows that one of the most prominent features of creative folks is their lesser interest in socialising. H) One reason for this is that such people are likely to spend sustained time alone working on their craft. Plus, Feist says, many artists "are trying to make sense of their internal world and a lot of internal personal experiences that they''re trying to give expression and meaning to through their art." Solitude allows for the reflection and observation necessary for that creative process. I) A recent justification of these ideas came from University at Buffalo psychologist Julie Bowker, who researches social withdrawal. Social withdrawal is usually categorised into three types: shyness caused by fear or anxiety; avoidance, from a dislike of socialising; and unsociability, from a preference for solitude. A paper by Bowker and her colleagues was the first to show that a type of social withdrawal could have a positive effect—they found that creativity was linked specifically to unsociability. They also found that unsociability had no correlation with aggression (shyness and avoidance did). This was significant because while previous research had suggested that unsociability might be harmless, Bowker and colleagues'' paper showed that it could actually be beneficial. Unsociable people are likely to be "having just enough interaction," Bowker says. "They have a preference for being alone, but they also don''t mind being with others." J) Still, it turns out that solitude is important for more than creativity. It''s commonly believed that leaders need to be sociable. But this depends, among other things, on the personalities of their employees. One 2011 study showed that in branches of a pizza chain where employees were more passive, outgoing bosses were associated with higher profits. But in branches where employees were more active, introverted(内向的) leaders were more effective. One reason for this is that introverted people are less likely to feel threatened by strong personalities and suggestions. They''re also more likely to listen. K) Since ancient times, meanwhile, people have been aware of a link between isolation and mental focus. After all, cultures with traditions of religious hermits(隐士) believe that solitude is important for enlightenment. Recent research has given us a better understanding of why. One benefit of unsociability is the brain''s state of active mental rest, which goes hand-in-hand with the stillness of being alone. When another person is present, your brain can''t help but pay some attention. This can be a positive distraction. But it''s still a distraction. L) Daydreaming in the absence of such distractions activates the brain''s default-mode network. Among other functions, this network helps to consolidate memory and understand others'' emotions. Giving free rein to a wandering mind not only helps with focus in the long term but strengthens your sense of both yourself and others. Paradoxically, therefore, periods of solitude actually help when it comes time to socialise once more. And the occasional absence of focus ultimately helps concentration in the long run. M) A more recent advocate of thoughtful and productive solitude is Susan Cain, author of *Quiet: The Power of Introverts in a World That Can''t Stop Talking* and founder of Quiet Revolution, a company that promotes quiet and introvert-friendly workplaces. "These days, we tend to believe that creativity emerges from a decidedly unreserved socialising process, but in fact it requires sustained attention and deep focus," she says. "Also, humans are such absorbent social beings that when we surround ourselves with others, we automatically take in their opinions and aesthetics. To truly chart our own path or vision, we have to be willing to isolate ourselves, at least for some period of time." N) Still, the line between useful solitude and dangerous isolation can be blurry. "Almost anything can be adaptive and maladaptive, depending on how extreme they get," Feist says. A disorder has to do with dysfunction. If someone stops caring about people and cuts off all contact, this could point to an irrational neglect of social relations. But creative unsociability is a far cry from this. In fact, Feist says, "there''s a real danger with people who are never alone." It''s hard to examine one''s own thoughts, feelings and motives, to be self-aware, and fully relaxed unless you have occasional solitude. In addition, introverts tend to have fewer but stronger friendships—which has been linked to greater happiness. O) As with many things, quality reigns over quantity. Nurturing a few solid relationships without feeling the need to constantly populate your life with endless chatting ultimately may be better for you. P) Thus, if your personality tends toward unsociability, you shouldn''t feel the need to change. Of course, that comes with qualifications. But as long as you have regular social contact, you are choosing solitude rather than being forced into it, you have at least a few good friends and your solitude is good for your well-being or productivity, there''s no point agonising over how to fit a square personality into a round hole.', NULL, NULL, 1213, 'IMPORT', 'cet6-2025-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-3-r2'
);
SET @pg_cet6_2025_06_3_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-3-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-r3', 'CAREFUL_READING', 'CET6', NULL, 'Simulators are most often utilized within industries such as nuclear power, aviation and surgery where failure results in disastrous consequences. To maximize the value from a simulation learning experience, participants should immediately and directly apply their learning to a specific intervention within their organization. Most organizations aspire to deploy significant change programs, only to find them nearly impossible to implement. That is largely because successful change requires more than a vision, it requires a workforce that not only doesn''t resist change, but embraces it. To achieve success, an organization must build a transformation program that will allow change to be rapidly pulled across its departments and throughout its layers. Regardless of the level of senior management commitment, unless key thought leaders at all levels embrace the change, the initiative will wither and die. To create this kind of widespread passion, learning leaders must expose the workforce to what could be, which will enable them to rethink their mental models, enable them to break free from their deep-rooted paradigms and embrace the opportunity to learn. Allowing participants to enter a simulated environment provides them with the opportunity to experience alternative realities which can prompt them to rethink their current beliefs. Behavioral change is not easy for most adults. Lectures, training programs and workshops can explain the intellectual elements of transformation, but they are seldom effective at getting to the behavioral aspects that lie at the heart of a significant change initiative. Further, under normal working conditions, managers rarely see the full effect of their employee development efforts. As such, an intervention like a simulation can provide the stimulus for change. An effective simulation can be better than experience as a learning tool because it accelerates time, compresses space, and unlike reality, is specifically designed to maximize participant learning. Simulations provide an immersive learning experience where skills, processes and knowledge all can be highlighted in a way reality cannot. The ability to explore, experiment and repeatedly apply new knowledge in unlimited, risk-free models is what makes simulation one of the most productive forms of learning. Well-designed simulations can enable individuals and groups to develop a deep level of understanding about how their decisions and intuitive responses to business stimuli affect their fellow participants and the organization as a whole. To reap the benefits, however, simulations must feel like reality. At the end of the successful simulation, participants must declare "this is us." If they don''t, they will view the experience as a game, which can be difficult to apply on the job, or worse, irrelevant to everyday work tasks. To maximize benefits from simulation, participants should immediately apply the learning from the experience to forge a smooth link between learning and doing.', NULL, NULL, 450, 'IMPORT', 'cet6-2025-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-3-r3'
);
SET @pg_cet6_2025_06_3_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-3-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-r4', 'CAREFUL_READING', 'CET6', NULL, 'GDP growth is not a good indicator of how well a country is performing, and should not be the primary goal of governments. Unlimited growth is not sustainable, and economic thinking is moving toward the idea that we should aim for sustainability in our economic models. But while a sustainable economy is vital to our future, it is a means to an end, not an end in itself. The idea that governments should focus on happiness has its critics. There are concerns about how happiness can be measured. Is happiness not a fleeting and subjective psychological state? Don''t different people experience different levels of happiness? Even on the broadest interpretation of ''happiness'' as prosperity or ''life satisfaction'', people want different things. Of course, governments cannot impose life satisfaction on citizens. But our happiness relies on collaborative efforts as a society. A government''s obligation lies in creating conditions that promote prosperity. And there is good reason to suppose that such conditions exist, are globally applicable, and are discoverable through research. In a recently published article, philosopher Julian Baggini suggests we should focus on ''real wealth'' for citizens, which does not depend on GDP growth. Access is key: people do not need to own, but rather access things that enable them to live well. Technological advances and changes in social behavior enable us to make more efficient use of the assets that we already have. And focusing on access to the resources people need to live better lives could help reduce inequality. As far as it goes, this has much in common with proposals tabled by ''happiness'' advocates. But it sets the bar far too low for what governments can and should be doing for their citizens. For example, it''s not clear how a ''real wealth'' economy would remedy the epidemic of mental ill-health that plagues our society. In Western countries, at least—poor mental health is more detrimental to wellbeing than poverty. Over and above a vastly improved provision of therapeutic mental healthcare, there are preventative measures for improving mental health that governments could and should adopt. The WHO recommends establishing institutions that facilitate community participation—educational programs and interventions that provide skills for promoting mental wellbeing. It says a lot, however, that the WHO feels the need to appeal to the economic benefits of improving mental health to persuade governments that the cost of taking proposed measures is justified. As long as the economy is their priority, governments need go no further than ensuring citizens'' continued productivity. To demand that governments set the ''happiness'' of citizens as their highest priority is to demand that they view citizens as ends in themselves.', NULL, NULL, 439, 'IMPORT', 'cet6-2025-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-3-r4'
);
SET @pg_cet6_2025_06_3_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-3-r4' LIMIT 1);

-- 翻译 cet6-2025-06-3
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-translation'
);
SET @q_cet6_2025_06_3_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_01, '自古以来,中国的水资源北缺南丰,分布极不均衡。为了有效解决北方严重缺水问题,中国政府实施了南水北调工程(the South-to-North Water Diversion Project)。这是一项跨区域配置水资源的宏大水利工程。历经数十年的规划与筹备,工程于2002年开工建设,分为东、中、西三条线路,总长4350公里,惠及人口将超过4亿。自2014年通水以来,工程向北方调水累计已超500亿立方米,为北方地区的人民提供了可靠的水资源,同时也极大地改善了这一地区的生态环境,促进了经济的可持续健康发展。', NULL, 'Since ancient times, China''s water resources have been unevenly distributed, with water scarce in the north but abundant in the south. To effectively address the severe water shortage in the north, the Chinese government launched the South-to-North Water Diversion Project. It is a massive cross-regional water conservancy project for allocating water resources. After decades of planning and preparation, the project began construction in 2002. Divided into eastern, central and western routes with a total length of 4,350 kilometers, it is expected to benefit more than 400 million people. Since the water supply began in 2014, the project has diverted over 50 billion cubic meters of water to the north, providing reliable water resources for people in the region, while greatly improving the local ecological environment and promoting sustainable and healthy economic development.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_01
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q26'
);
SET @q_cet6_2025_06_3_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_02, NULL, '{"A":"A) bolsters","B":"B) consequences","C":"C) credentials","D":"D) dramatically","E":"E) enact","F":"F) equity","G":"G) especially","H":"H) evasively","I":"I) formidable","J":"J) impetus","K":"K) lavish","L":"L) prioritize","M":"M) suffices","N":"N) sustained","O":"O) tenured"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_02
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q27'
);
SET @q_cet6_2025_06_3_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_03, NULL, '{"A":"A) bolsters","B":"B) consequences","C":"C) credentials","D":"D) dramatically","E":"E) enact","F":"F) equity","G":"G) especially","H":"H) evasively","I":"I) formidable","J":"J) impetus","K":"K) lavish","L":"L) prioritize","M":"M) suffices","N":"N) sustained","O":"O) tenured"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_03
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q28'
);
SET @q_cet6_2025_06_3_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_04, NULL, '{"A":"A) bolsters","B":"B) consequences","C":"C) credentials","D":"D) dramatically","E":"E) enact","F":"F) equity","G":"G) especially","H":"H) evasively","I":"I) formidable","J":"J) impetus","K":"K) lavish","L":"L) prioritize","M":"M) suffices","N":"N) sustained","O":"O) tenured"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_04
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q29'
);
SET @q_cet6_2025_06_3_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_05, NULL, '{"A":"A) bolsters","B":"B) consequences","C":"C) credentials","D":"D) dramatically","E":"E) enact","F":"F) equity","G":"G) especially","H":"H) evasively","I":"I) formidable","J":"J) impetus","K":"K) lavish","L":"L) prioritize","M":"M) suffices","N":"N) sustained","O":"O) tenured"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_05
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q30'
);
SET @q_cet6_2025_06_3_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_06, NULL, '{"A":"A) bolsters","B":"B) consequences","C":"C) credentials","D":"D) dramatically","E":"E) enact","F":"F) equity","G":"G) especially","H":"H) evasively","I":"I) formidable","J":"J) impetus","K":"K) lavish","L":"L) prioritize","M":"M) suffices","N":"N) sustained","O":"O) tenured"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_06
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q31'
);
SET @q_cet6_2025_06_3_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_07, NULL, '{"A":"A) bolsters","B":"B) consequences","C":"C) credentials","D":"D) dramatically","E":"E) enact","F":"F) equity","G":"G) especially","H":"H) evasively","I":"I) formidable","J":"J) impetus","K":"K) lavish","L":"L) prioritize","M":"M) suffices","N":"N) sustained","O":"O) tenured"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_07
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q32'
);
SET @q_cet6_2025_06_3_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_08, NULL, '{"A":"A) bolsters","B":"B) consequences","C":"C) credentials","D":"D) dramatically","E":"E) enact","F":"F) equity","G":"G) especially","H":"H) evasively","I":"I) formidable","J":"J) impetus","K":"K) lavish","L":"L) prioritize","M":"M) suffices","N":"N) sustained","O":"O) tenured"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_08
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q33'
);
SET @q_cet6_2025_06_3_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_09, NULL, '{"A":"A) bolsters","B":"B) consequences","C":"C) credentials","D":"D) dramatically","E":"E) enact","F":"F) equity","G":"G) especially","H":"H) evasively","I":"I) formidable","J":"J) impetus","K":"K) lavish","L":"L) prioritize","M":"M) suffices","N":"N) sustained","O":"O) tenured"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_09
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q34'
);
SET @q_cet6_2025_06_3_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_10, NULL, '{"A":"A) bolsters","B":"B) consequences","C":"C) credentials","D":"D) dramatically","E":"E) enact","F":"F) equity","G":"G) especially","H":"H) evasively","I":"I) formidable","J":"J) impetus","K":"K) lavish","L":"L) prioritize","M":"M) suffices","N":"N) sustained","O":"O) tenured"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_10
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q35'
);
SET @q_cet6_2025_06_3_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_11, NULL, '{"A":"A) bolsters","B":"B) consequences","C":"C) credentials","D":"D) dramatically","E":"E) enact","F":"F) equity","G":"G) especially","H":"H) evasively","I":"I) formidable","J":"J) impetus","K":"K) lavish","L":"L) prioritize","M":"M) suffices","N":"N) sustained","O":"O) tenured"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_11
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q36'
);
SET @q_cet6_2025_06_3_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_12, 'Lots of research demonstrates that being socially isolated is harmful to the elderly.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_12
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q37'
);
SET @q_cet6_2025_06_3_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_13, 'Being alone enables artists to think and observe, which is a must for their creation.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_13
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q38'
);
SET @q_cet6_2025_06_3_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_14, 'To one writer, being forced to play with others was a penalty while being kept alone in a room was quite a pleasure.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_14
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q39'
);
SET @q_cet6_2025_06_3_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_15, 'Recent research shows for the first time that there is a specific link between being creative and being unsociable.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_15
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q40'
);
SET @q_cet6_2025_06_3_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_16, 'We must be willing to stay alone at least for some time in order to plot our own course.', NULL, 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_16
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q41'
);
SET @q_cet6_2025_06_3_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_17, 'According to new research, for people who prefer being alone, solitude can be beneficial to their work lives and emotional health.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_17
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q42'
);
SET @q_cet6_2025_06_3_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_18, 'It may turn out to be better for one to cultivate a few steady relationships than to busy themselves socialising.', NULL, 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_18
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q43'
);
SET @q_cet6_2025_06_3_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_19, 'Allowing your mind to wander freely is conducive to sharpening your focus in the long run.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_19
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q44'
);
SET @q_cet6_2025_06_3_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_20, 'Research conducted on artists and scientists indicates that creative people are less interested in hanging out with others.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_20
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q45'
);
SET @q_cet6_2025_06_3_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_21, 'According to Feist, you will have difficulty knowing yourself if you do not stay alone occasionally.', NULL, 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_21
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q46'
);
SET @q_cet6_2025_06_3_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_22, 'What do we learn about successful changes in organizations?', '{"A":"A) They can be immediately implemented with great ease.","B":"B) They are usually led by organization leaders of vision.","C":"C) They call for enthusiastic support from the workforce.","D":"D) They often result from simulation learning experiences."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_22
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q47'
);
SET @q_cet6_2025_06_3_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_23, 'What should learning leaders do to arouse learners'' passion for change?', '{"A":"A) Allow them to see what could possibly be achieved.","B":"B) Help them break free from their old paradigms.","C":"C) Encourage them to rethink their thought models.","D":"D) Stimulate them to embrace fresh opportunities."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_23
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q48'
);
SET @q_cet6_2025_06_3_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_24, 'What does the passage say about lectures, training programs and workshops?', '{"A":"A) They are generally incapable of changing workers'' behaviors on the job.","B":"B) They are interventions different from simulations in creating stimuli for change.","C":"C) They aim at transforming the behaviors of the workers in an organization.","D":"D) They help managers achieve the full effect of employee development efforts."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_24
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q49'
);
SET @q_cet6_2025_06_3_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_25, 'What makes simulation one of the most fruitful forms of learning?', '{"A":"A) Its capability of saving time by accelerating the immersive learning experience.","B":"B) Its potential for learners to examine their skills, knowledge and learning process.","C":"C) Its capability of providing all participants with a practical learning experience.","D":"D) Its potential for learners to explore, experiment and practice without any risk."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_25
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q50'
);
SET @q_cet6_2025_06_3_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_26, 'What should participants do in a simulation to reap the greatest benefits possible?', '{"A":"A) Take the experience as a mere game.","B":"B) Apply promptly what they learn to their jobs.","C":"C) Develop a deep level of understanding.","D":"D) Strive to connect closely with their leaders."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_26
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q51'
);
SET @q_cet6_2025_06_3_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_27, 'What does the passage say is the more recent thinking of economic growth?', '{"A":"A) It should be made sustainable.","B":"B) It is vital to the future of humanity.","C":"C) It should be governments'' chief concern.","D":"D) It is an indicator of government performance."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_27
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q52'
);
SET @q_cet6_2025_06_3_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_28, 'Why are some people opposed to the idea that governments should focus on happiness?', '{"A":"A) Governments cannot impose happiness on citizens.","B":"B) People''s happiness is built upon their own endeavor.","C":"C) Happiness means different things to different people.","D":"D) Happiness depends on sustainable economic growth."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_28
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q53'
);
SET @q_cet6_2025_06_3_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_29, 'What does philosopher Julian Baggini suggest governments do in a recently published article?', '{"A":"A) Try to reduce inequality between the rich and the poor.","B":"B) Provide people with access to resources for a better life.","C":"C) Change people''s behaviors to put social wealth to better use.","D":"D) Make use of advanced technologies to improve people''s lives."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_29
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q54'
);
SET @q_cet6_2025_06_3_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_30, 'Why does the WHO feel the need to appeal to the economic benefits of improving mental health to justify its recommendations?', '{"A":"A) Mental health programs cannot be executed without GDP growth.","B":"B) Psychological interventions are conducive to people''s wellbeing.","C":"C) Poor mental health is detrimental to a nation''s economic system.","D":"D) Governments still take economic development as their priority."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_30
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-3-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q55'
);
SET @q_cet6_2025_06_3_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-3-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_3_31, 'What message does the author try to convey at the end of the passage?', '{"A":"A) Governments'' goal should be prosperity-driven.","B":"B) Governments'' goal should be people-oriented.","C":"C) Governments should consider citizens'' views in decision-making.","D":"D) Governments should set sustained productivity as their top priority."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_3_31
);

-- ==================== cet6-2025-12-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-r1', 'BANKED_CLOZE', 'CET6', NULL, 'By now, it is generally accepted that regular exercise comes with an assortment of health benefits for people who maintain the habit over time. But is it __26__ too late to start? New research looked at people who increased their exercise levels after their 40s beyond levels they had when they were younger and those individuals showed declines in their risk of early __27__ which were similar to those of people who exercised consistently throughout their lives. This was a __28__ of 32% to 35% compared to people who did not exercise. Those who began exercising in middle age also saw reductions in their incidence of __29__ diseases, such as heart disease and cancer, which were similar to the steady exercisers. So why bother exercising consistently throughout your life? The authors of the study __30__ that some might interpret the study''s findings to mean that they can delay starting an exercise program but this would be a mistake. There are other benefits, both mental and physical, to staying consistently active that we should not __31__ . These real health benefits include better __32__ functioning and lowered risk of gaining weight. The latter is __33__ important given the global obesity epidemic. In addition, experts assert that starting younger is better because, if you make a habit of exercising when you are young, you are more likely to keep up those __34__ later in life. It is ideal, then, for people to start exercising when they are children or __35__ , and it is good to maintain an active lifestyle at all times regardless of your age. However, this study does indicate that, if you have not been active, you can still benefit if you start becoming active in your 40s and 50s.', NULL, '["A) adolescents","B) arbitrarily","C) chronic","D) cognitive","E) concede","F) disregard","G) drop","H) ever","I) maneuver","J) mortality","K) particularly","L) patterns","M) refute","N) stereotype","O) vocal"]', 291, 'IMPORT', 'cet6-2025-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-1-r1'
);
SET @pg_cet6_2025_12_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-r2', 'MATCHING', 'CET6', 'Restaurants Are Now Employing Robots — Should Chefs Be Worried?', 'A) Like most chefs, Flippy is not afraid of hard work. Since last summer, that has meant 11 am until 7 pm shifts at Caliburger in Pasadena, California, as well as short assignments at Chick-N-Tots at Dodger Stadium in Los Angeles. These are long hours of repetitive work, where the boss demands absolute consistency. But you won''t hear Flippy complain or say anything, in fact. For Flippy is a robot — a cloud-connected mechanical arm with 3D thermal scanners for eyes — that can flip burgers or fry 80 baskets of food an hour, monitor that food and even clean up afterwards. B) Flippy was created by Miso Robotics, part of the Cali Group, which is described by its CEO, John Miller, as: "A technology company that happens to sell cheeseburgers." Cali creates new machines that it road-tests in its Caliburger restaurants across the world, into which Flippy will be deployed this year. And Flippy is not alone. Also in California, Bear Robotics has developed a self-guiding robot, Penny, which has so far served 40,000 diners. C) Ten years ago, robot-chefs and waiters were pure science fiction. Today, they are a reality, and at prices that make them a plausible investment. From May, Penny will be shipped on a subscription basis that offers "an immediate return", says Bear Robotics'' chief operating officer, Juan Higueros. Flippy will cost a reported $60,000 to $100,000. Fully automated burger restaurants managed with minimal human oversight — where customers order at screens, pay electronically, and eat food cooked and delivered by robots — are now a possibility. D) The technology exists; it just needs knitting together cost-effectively and in a way diners buy into. In an industry keen to slash labor costs and increase profits, further automation seems inevitable. After an eight- month test at Kang Nam Tofu House in California, Bear Robotics credited Penny with driving a 28% increase in sales. Meanwhile, in US trials, the self-ordering screens that McDonald''s is currently installing at its 1,300 UK restaurants yielded a reported 30% rise in order values. E) Personalisation is seen as key to the appeal of this technology, alongside its ability to reliably push so-called "upsells" (meal deals, extras, larger drinks) to customers. Soon when you log into a restaurant app, it will be able to use your data and purchasing history to recommend dishes to you — factoring in everything from the weather to, if you are ordering at a screen that can read your face, your mood. F) "Right now people compromise on choice. We''re presented with a one-size-fits-all menu. Ultimately, technology can allow us to make personal choices. You love spicy food and chicken? Here''s the dish people like you mostly order," says Tom Weaver, CEO at the hospitality tech company Flyt. He talks enthusiastically about the Helsinki pop-up Take-In, a full-service restaurant where diners ordered dishes in from various delivery services. "For the first time in a few hundred years, digital is allowing us to create new versions of restaurants." G) If high-street fast food is automation-ready, its impact on high-end restaurants is likely to be subtler and slower. "It''ll probably be a very long time before we see a five-star robot-chef," says Noel Sharkey, professor of AI and robotics at the University of Sheffield. "Apart from the AI creativity gap, great cooking involves a subtle understanding of ingredients and delicate cooking that would be enormously challenging for robots. Placing fragile foods on plates would be incredibly slow." H) Currently, robots have limited functionality. A human needs to load Penny with plates that diners lift off themselves. At the robot-powered US pizza-delivery company Zume, the more difficult jobs, such as topping pizzas, are still done by humans. But Moley, which will launch soon, offers an idea of the sophistication to come. Modelled on the movements of a MasterChef contest winner, Tim Anderson, its robotic arms are fixed over a stove and programmed to prepare dishes from raw ingredients. It is designed for domestic use, but a commercial version is planned that opens up the possibility of restaurant kitchens automating even highly technically challenging tasks. I) For now, the kitchen technology that QSR Automations supplies to Mitchells & Butlers'' pubs or KFC is less glamorous. Rather than having a chef shouting out diners'' orders, the QSR system automatically distributes those orders across screens. The kitchen screens then tell chefs when to start cooking each dish, so that your plate of fish, chips and peas comes together at the right time. J) The restaurant industry is currently suffering a severe shortage of skilled chefs — a deficit of 11,000, according to the skills agency People 1st. "Automation systems designed to make the process more idiot-proof are trying to bridge that gap," says Stefan Chomka, the editor of Restaurant magazine. K) In terms of simplifying or enhancing the customer experience, online restaurant booking has been the easily- won success of the internet age. Automated at-table ordering and payment is seen as the next landmark. Until then, early adopters, such as the Manchester bar owner Andy Smith, who uses the Ordoo app at his venue 33 Oldham Street, may well experience growing but "lower than expected" acceptance. L) Embarrassing failures in restaurant tech frequently hit the headlines. The TGI Fridays drone(无人机) that injured a Brooklyn Daily photographer; US burger chain Shake Shack having to retreat from plans for entirely cashless ordering sites. But, says Chomka, such technology could miss the mark if it only offers "solutions to problems that don''t really exist". "Payments being automatic" could be useful, he adds. But, in an expensive restaurant, "how quick do you need dinner to be?" M) That attachment to the human art of hospitality will be heartening for staff who see automation as a threat to jobs. "Unite is concerned that without safeguards, any benefits will bypass workers in low-paying jobs, such as waiters," says the union''s London regional officer, Dave Turnbull. "We''re urging Members of Parliament to ensure automation does not just benefit a wealthy few like previous industrial revolutions." N) The industry principle is that automation will allow it to redeploy staff more effectively. Jobs will change, if not immediately decrease in number. "Self-order screens mean more demand for people front-of-house. Last year, we recruited 1,000 new managers," says McDonald''s COO, Jason Clark. Caliburger has a programme to retrain staff as robot engineers or "chef techs". O) But ultimately the chance to reduce overheads(管理费用) by employing fewer people or at lower rates will be what attracts big brands to technology. Invariably, over the next 10 years, jobs will go in conventional bricks-built restaurants, not least because automation will boost their rapidly growing rival: delivery. Companies such as Domino and Just Eat have both experimented with robot and drone delivery, which is already legal in Reykjavik, Iceland. "Robot food deliveries are the future," says Noel Sharkey. "Small, 4 mph ground robots are safe and will work 24 hours a day." P) Combined with machine learning of anticipated order volumes and the minute-by-minute cooking data generated by systems such as QSR, that robot fleet could deliver almost instantly. "Restaurants will prepare food ahead of orders coming in," predicts Just Eat''s director of engineering, Daniel Richardson. "I''ll be able to say ''Let''s have pizza'' to my family, my intelligent assistant will hear and 10 minutes later the food will be at my door." No one is putting an exact date on it yet. But in the dining room and on your doorstep, the robots are coming.', NULL, NULL, 1249, 'IMPORT', 'cet6-2025-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-1-r2'
);
SET @pg_cet6_2025_12_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-r3', 'CAREFUL_READING', 'CET6', NULL, 'Many see friendships as a comfort blanket: a shoulder to cry on, a reliable soul to confide in. However, more often than not, in our eagerness to seek individual success, we lose friends along the way and that has become part of the process. The chaos and never-ending turmoil that accompanies everyday life is an aggressive obstacle in the pursuit of stable friendships. As students, we use this excuse to shrug off losing people who we once thought to be loved ones. Instead of viewing our lives as a race, where everyone is on their own path to some form of success, we must relearn to value the connections we make along the track. We must reevaluate the harm of radical, individual freedom. Radical individualism elevates the freedom of the individual over the collective. It argues, for instance, that universal healthcare, an example of collectivism, threatened the dream of many Americans. Many of us have fallen victim to an individualistic culture. Society tends to celebrate personal achievement and commend it based on the assumption that winning or succeeding is a consequence of working harder than the next person. As a society, we idolize the concept of "losing friends on the road to success". I remember hearing in high school, "Don''t worry about losing friendships, just focus on study and getting into college. That''s all that will matter in the long run," a sentiment that is not unique to my experience. It''s preached in many success stories, and it''s embedded in the way we see growth. Motivational speakers will push their audience to be complacent to the inevitable end of losing friends. Spend too much time with friends? You''re losing time better utilized on your achievements. Invest time in your relationships? Invest time in your work instead. This constant need to succeed has blinded us from seeing through the whirlwind of change that accompanies our everyday lives. We are expected to tangibly succeed, earn awards, get higher positions, earn better grades. In order to succeed, we lose friends, and that has sadly become normalized. We cannot be complacent with losing friendships because they are our anchors. Yes, pursue success. Challenge yourself. Push limits. But contrary to all the self-proclaimed success experts, doing it alone does not make you more successful or any better than someone who achieved it with the help of others. Put effort into fostering healthy relationships, and maintaining them through your busy schedule that seems like it leaves no time for anyone else. Although we may be living in a society that treasures the independent pursuit of achievement, having people to support and love you on the way is far more important than any end result.', NULL, NULL, 448, 'IMPORT', 'cet6-2025-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-1-r3'
);
SET @pg_cet6_2025_12_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-r4', 'CAREFUL_READING', 'CET6', NULL, 'During his acceptance speech for the Nobel Peace Prize, Martin Luther King Jr. said, "I believe that unarmed truth and unconditional love will have the final word in reality." More than five decades later, our society is still struggling to separate truth from fantasy, fact from fiction. From disputes over the climate change to debates about how slavery is taught, America is at a crossroads. And the battle for equity is at the heart of these vital conversations. Study after study shows that inequity has had appalling consequences. A 2020 report by Citi indicated that "Black students could have increased their lifetime incomes $90 – $113 billion" if equity issues related to higher education had been adequately addressed over the past two decades. This statistic represents a flood of issues we''ve failed to confront as a nation. It also highlights one truth: We''re missing out on valuable opportunities to bridge the differences that divide us. However, by honoring King''s legacy, we can get our country back on the path toward true equity. Students — and adults for that matter — simply cannot understand the conflicts we have today without understanding what caused them in the first place. That means we have a responsibility to help them make connections between US history and current events. It also means giving them the tools they need to address inequity and bias in their own lives. Adherence to these principles, along with a commitment to truthful dialogue, can help every student better appreciate how far we''ve come and more clearly see the roads we have yet to travel. With more truthful analysis of the need for more qualified, diverse educators, we can improve our recruiting, training, and retention strategies for schools across the country. Unfortunately, our deeply rooted divisions are delaying these advancements. A recent survey found that 77 percent of Americans believe the nation is "more divided than ever before". But reports of increased polarization shouldn''t persuade us to look away from one another. Instead, they should compel us to address our shared issues head-on. We are not, as some would suggest, living in a "post-racial society". We simply cannot afford to keep our heads buried in the sand when it comes to racial inequity. Unless we get honest about intolerance, bias, and how these social diseases impact the ways we treat one another, injustice will continue to haunt us. But our children and our grandchildren deserve better. On this Martin Luther King Day and beyond, let''s commit to working together to disrupt the status quo. Let''s continue to build a better, more inclusive nation; and in the words of Martin Luther King Jr., "A society at peace with itself, a society that can live with its conscience."', NULL, NULL, 455, 'IMPORT', 'cet6-2025-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-1-r4'
);
SET @pg_cet6_2025_12_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-1-r4' LIMIT 1);

-- 翻译 cet6-2025-12-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-translation'
);
SET @q_cet6_2025_12_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_01, '尊老是中华民族的传统美德，深深植根于中国人的思想和行为中，是人们普遍遵守的行为规范和社会准则。在当今的中国，这种美德得到广泛传承。社会各界积极营造敬老助老的社会氛围。为老年人提供便利服务已成为社会共识，例如社区专门开设长者食堂，公共场所配置优先座位。政府还出台了一系列政策，为老年人的权益提供有力保障。尊老是社会和谐与发展的重要基石，有助于培育良好的社会氛围，推动整个社会文明进步。', NULL, 'Respecting the elderly is a traditional virtue of the Chinese nation. Deeply rooted in the thoughts and behavior of the Chinese people, it is a code of conduct and a social norm that people widely observe. In China today, this virtue is widely carried forward. People from all walks of life actively foster a social atmosphere of respecting and helping the elderly. Providing convenient services for the elderly has become a social consensus. For example, communities open special canteens for the elderly, and public places provide priority seats. The government has also introduced a series of policies, providing strong protection for the rights and interests of the elderly. Respecting the elderly is an important cornerstone of social harmony and development, helping to foster a sound social atmosphere and promote the civilized progress of the whole society.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_01
);

-- 听力 Q1 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q01', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q01'
);
SET @q_cet6_2025_12_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_02, NULL, '{"A":"A) He has distinguished himself in foreign service.","B":"B) He is his country''s ambassador to Winopia.","C":"C) He is currently an electrical engineer.","D":"D) He craves attention from the media."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_02
);

-- 听力 Q2 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q02', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q02'
);
SET @q_cet6_2025_12_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_03, NULL, '{"A":"A) A government reshuffle.","B":"B) A fundamental reform.","C":"C) Some sort of political reorientation.","D":"D) Some sort of crisis of legitimacy."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_03
);

-- 听力 Q3 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q03', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q03'
);
SET @q_cet6_2025_12_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_04, NULL, '{"A":"A) All diplomats have more or less similar stories to tell.","B":"B) It is a prerequisite to get some practice in diplomacy.","C":"C) Different people can take different paths.","D":"D) It is a must to first obtain a law degree."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_04
);

-- 听力 Q4 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q04', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q04'
);
SET @q_cet6_2025_12_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_05, NULL, '{"A":"A) Key skills required of a diplomat.","B":"B) The making of an expert diplomat.","C":"C) Diplomatic discourse and rhetoric.","D":"D) Contributions by diplomatic envoys."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_05
);

-- 听力 Q5 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q05', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q05'
);
SET @q_cet6_2025_12_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_06, NULL, '{"A":"A) They have got their work done.","B":"B) They both look tired","C":"C) They can meet again tomorrow anyway.","D":"D) They are both anxious to go home."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_06
);

-- 听力 Q6 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q06', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q06'
);
SET @q_cet6_2025_12_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_07, NULL, '{"A":"A) The board members'' insufficient support.","B":"B) Two months devoted to the same contract.","C":"C) Working two months without any progress.","D":"D) The man''s long concentration on the project."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_07
);

-- 听力 Q7 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q07', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q07'
);
SET @q_cet6_2025_12_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_08, NULL, '{"A":"A) Unprofessional.","B":"B) Inspirational.","C":"C) Exceptional.","D":"D) Delusional."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q08', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q08'
);
SET @q_cet6_2025_12_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_09, NULL, '{"A":"A) Fewer rectifications of the contract.","B":"B) More support from the board members.","C":"C) The early implementation of the project.","D":"D) The alignment of all sections of the contract."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_09
);

-- 听力 Q9 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q09', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q09'
);
SET @q_cet6_2025_12_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_10, NULL, '{"A":"A) When two employees propose contrary solutions to their dispute.","B":"B) When two employees are directed by their respective manager.","C":"C) When two people behave in an apparently clashing manner.","D":"D) When two people tell different stories of the same event."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_10
);

-- 听力 Q10 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q10', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q10'
);
SET @q_cet6_2025_12_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_11, NULL, '{"A":"A) How it got resolved.","B":"B) How it happened.","C":"C) What it was about.","D":"D) When it was settled."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_11
);

-- 听力 Q11 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q11', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q11'
);
SET @q_cet6_2025_12_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_12, NULL, '{"A":"A) They intervened promptly lest their dispute escalate.","B":"B) They tried to ascertain the actual facts of the matter.","C":"C) They assumed the best about them and moved on.","D":"D) They persuaded them to put their conflict aside."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_12
);

-- 听力 Q12 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q12', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q12'
);
SET @q_cet6_2025_12_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_13, NULL, '{"A":"A) Dine out daily.","B":"B) Budget sensibly.","C":"C) Enjoy cooking.","D":"D) Shop at groceries."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_13
);

-- 听力 Q13 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q13', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q13'
);
SET @q_cet6_2025_12_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_14, NULL, '{"A":"A) Shopping.","B":"B) Sewing.","C":"C) Entertaining oneself.","D":"D) Fashion designing."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_14
);

-- 听力 Q14 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q14', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q14'
);
SET @q_cet6_2025_12_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_15, NULL, '{"A":"A) Satisfy their taste.","B":"B) Cut down expenses.","C":"C) Eat more healthily.","D":"D) Cultivate new hobbies."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_15
);

-- 听力 Q15 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q15', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q15'
);
SET @q_cet6_2025_12_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_16, NULL, '{"A":"A) People''s intense focus on convenience.","B":"B) People''s deteriorating family finances.","C":"C) People''s strong aversion to junk foods.","D":"D) People''s increasing dislike of cooking."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_16
);

-- 听力 Q16 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q16', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q16'
);
SET @q_cet6_2025_12_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_17, NULL, '{"A":"A) Its owner''s flight is delayed because of bad weather.","B":"B) Airlines cannot find its owner without an ID tag on it.","C":"C) Airline staff have not correctly coded its destination tag.","D":"D) Its owner has forgot to pick it up from the baggage claim."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_17
);

-- 听力 Q17 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q17', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q17'
);
SET @q_cet6_2025_12_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_18, NULL, '{"A":"A) Its tag may get torn off on the conveyor belt.","B":"B) Its tag may get stuck in the sorting machine.","C":"C) It may be sent to a wrong destination.","D":"D) It may be picked up by someone else."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_18
);

-- 听力 Q18 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q18', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q18'
);
SET @q_cet6_2025_12_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_19, NULL, '{"A":"A) Purchase irretrievably lost things at auction.","B":"B) Contact the airport staff to find our missing bag.","C":"C) Get the airline agent''s phone number before boarding.","D":"D) Avoid packing valuable items in our checked baggage."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_19
);

-- 听力 Q19 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q19', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q19'
);
SET @q_cet6_2025_12_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_20, NULL, '{"A":"A) It can be behaviorally hazardous.","B":"B) It can be especially disappointing.","C":"C) It can be socially harmful.","D":"D) It can be really embarrassing."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_20
);

-- 听力 Q20 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q20', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q20'
);
SET @q_cet6_2025_12_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_21, NULL, '{"A":"A) They considered it inevitable.","B":"B) They held a negative view towards it.","C":"C) They were concerned with its effects.","D":"D) They saw it as a sign of social evolution."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_21
);

-- 听力 Q21 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q21', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q21'
);
SET @q_cet6_2025_12_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_22, NULL, '{"A":"A) Elaborate forms of social contact.","B":"B) Ill effects on one''s sense of pride.","C":"C) Poor relationships with others.","D":"D) Vicious cycles of detachment."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_22
);

-- 听力 Q22 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q22', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q22'
);
SET @q_cet6_2025_12_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_23, NULL, '{"A":"A) The ill treatment they get as tourists.","B":"B) The nonprofessional business they see.","C":"C) The impersonal accommodations.","D":"D) The many adventures on their way."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_23
);

-- 听力 Q23 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q23', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q23'
);
SET @q_cet6_2025_12_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_24, NULL, '{"A":"A) They have been the classic way to visit Europe.","B":"B) They attract tourists with location and decoration.","C":"C) They have long been competing with chain hotels.","D":"D) They are in fact a completely new idea in America."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_24
);

-- 听力 Q24 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q24', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q24'
);
SET @q_cet6_2025_12_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_25, NULL, '{"A":"A) Your financial status.","B":"B) Your family''s consent.","C":"C) Your property.","D":"D) Your personality."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_25
);

-- 听力 Q25 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q25', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q25'
);
SET @q_cet6_2025_12_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_26, NULL, '{"A":"A) Costs for starting the business.","B":"B) The number of guests to receive.","C":"C) The facilities to provide.","D":"D) Opportunities for income."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q26'
);
SET @q_cet6_2025_12_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_27, NULL, '{"A":"A) adolescents","B":"B) arbitrarily","C":"C) chronic","D":"D) cognitive","E":"E) concede","F":"F) disregard","G":"G) drop","H":"H) ever","I":"I) maneuver","J":"J) mortality","K":"K) particularly","L":"L) patterns","M":"M) refute","N":"N) stereotype","O":"O) vocal"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q27'
);
SET @q_cet6_2025_12_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_28, NULL, '{"A":"A) adolescents","B":"B) arbitrarily","C":"C) chronic","D":"D) cognitive","E":"E) concede","F":"F) disregard","G":"G) drop","H":"H) ever","I":"I) maneuver","J":"J) mortality","K":"K) particularly","L":"L) patterns","M":"M) refute","N":"N) stereotype","O":"O) vocal"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q28'
);
SET @q_cet6_2025_12_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_29, NULL, '{"A":"A) adolescents","B":"B) arbitrarily","C":"C) chronic","D":"D) cognitive","E":"E) concede","F":"F) disregard","G":"G) drop","H":"H) ever","I":"I) maneuver","J":"J) mortality","K":"K) particularly","L":"L) patterns","M":"M) refute","N":"N) stereotype","O":"O) vocal"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q29'
);
SET @q_cet6_2025_12_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_30, NULL, '{"A":"A) adolescents","B":"B) arbitrarily","C":"C) chronic","D":"D) cognitive","E":"E) concede","F":"F) disregard","G":"G) drop","H":"H) ever","I":"I) maneuver","J":"J) mortality","K":"K) particularly","L":"L) patterns","M":"M) refute","N":"N) stereotype","O":"O) vocal"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q30'
);
SET @q_cet6_2025_12_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_31, NULL, '{"A":"A) adolescents","B":"B) arbitrarily","C":"C) chronic","D":"D) cognitive","E":"E) concede","F":"F) disregard","G":"G) drop","H":"H) ever","I":"I) maneuver","J":"J) mortality","K":"K) particularly","L":"L) patterns","M":"M) refute","N":"N) stereotype","O":"O) vocal"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q31'
);
SET @q_cet6_2025_12_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_32, NULL, '{"A":"A) adolescents","B":"B) arbitrarily","C":"C) chronic","D":"D) cognitive","E":"E) concede","F":"F) disregard","G":"G) drop","H":"H) ever","I":"I) maneuver","J":"J) mortality","K":"K) particularly","L":"L) patterns","M":"M) refute","N":"N) stereotype","O":"O) vocal"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q32'
);
SET @q_cet6_2025_12_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_33, NULL, '{"A":"A) adolescents","B":"B) arbitrarily","C":"C) chronic","D":"D) cognitive","E":"E) concede","F":"F) disregard","G":"G) drop","H":"H) ever","I":"I) maneuver","J":"J) mortality","K":"K) particularly","L":"L) patterns","M":"M) refute","N":"N) stereotype","O":"O) vocal"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q33'
);
SET @q_cet6_2025_12_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_34, NULL, '{"A":"A) adolescents","B":"B) arbitrarily","C":"C) chronic","D":"D) cognitive","E":"E) concede","F":"F) disregard","G":"G) drop","H":"H) ever","I":"I) maneuver","J":"J) mortality","K":"K) particularly","L":"L) patterns","M":"M) refute","N":"N) stereotype","O":"O) vocal"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q34'
);
SET @q_cet6_2025_12_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_35, NULL, '{"A":"A) adolescents","B":"B) arbitrarily","C":"C) chronic","D":"D) cognitive","E":"E) concede","F":"F) disregard","G":"G) drop","H":"H) ever","I":"I) maneuver","J":"J) mortality","K":"K) particularly","L":"L) patterns","M":"M) refute","N":"N) stereotype","O":"O) vocal"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q35'
);
SET @q_cet6_2025_12_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_36, NULL, '{"A":"A) adolescents","B":"B) arbitrarily","C":"C) chronic","D":"D) cognitive","E":"E) concede","F":"F) disregard","G":"G) drop","H":"H) ever","I":"I) maneuver","J":"J) mortality","K":"K) particularly","L":"L) patterns","M":"M) refute","N":"N) stereotype","O":"O) vocal"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q36'
);
SET @q_cet6_2025_12_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_37, 'It is now possible to fully automate a burger restaurant with little human supervision.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q37'
);
SET @q_cet6_2025_12_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_38, 'At a robot-powered US company, complicated tasks still have to be performed by humans.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q38'
);
SET @q_cet6_2025_12_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_39, 'More automation appears to be a certainty in industries eager to cut labor costs and raise profits.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q39'
);
SET @q_cet6_2025_12_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_40, 'There are often front-page reports of failures in technological innovation of the restaurant industry.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q40'
);
SET @q_cet6_2025_12_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_41, 'Robot-chef Flippy does not fear laborious work, nor does it make any complaints.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q41'
);
SET @q_cet6_2025_12_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_42, 'Digital technology makes it possible for businesses to innovate restaurant models.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q42'
);
SET @q_cet6_2025_12_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_43, 'Fondness for human warmth in catering to customers will give hope to employees who are afraid of losing jobs to robots.', NULL, 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q43'
);
SET @q_cet6_2025_12_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_44, 'There is an acute shortage of experienced chefs in the catering industry and automated cooking is expected to fill the gap.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q44'
);
SET @q_cet6_2025_12_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_45, 'Over the coming decade, many jobs in traditional restaurants will disappear due to robot delivery.', NULL, 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q45'
);
SET @q_cet6_2025_12_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_46, 'According to an expert in AI and robotics, it may be quite some time before a master robot-chef appears.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q46'
);
SET @q_cet6_2025_12_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_47, 'What often happens when people are eager to pursue individual success?', '{"A":"A) They lack a shoulder to cry on.","B":"B) They have no soul to confide in.","C":"C) They cannot find reliable friends.","D":"D) They ignore their ties with friends."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q47'
);
SET @q_cet6_2025_12_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_48, 'What does the author advise people to do in their pursuit of radical individualism?', '{"A":"A) Reexamine its detrimental effects.","B":"B) Shrug off the loss of their loved ones.","C":"C) Avoid the chaos and turmoil involved.","D":"D) Remove aggressive obstacles in the way."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q48'
);
SET @q_cet6_2025_12_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_49, 'What is American society''s assumption of personal achievement?', '{"A":"A) It is to be duly celebrated and highly commended.","B":"B) It is a sure way to fulfill a person''s dream.","C":"C) It revolves around an individualistic culture.","D":"D) It reflects a person''s exceptional endeavor."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q49'
);
SET @q_cet6_2025_12_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_50, 'What is preached in many success stories?', '{"A":"A) Attaching importance to academic gains on the road to success.","B":"B) Investing one''s time in work instead of connecting with friends.","C":"C) Trying to strengthen friendships in one''s pursuit of personal success.","D":"D) Excelling in academic performance to get into a prestigious college."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q50'
);
SET @q_cet6_2025_12_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_51, 'What can we infer from the passage regarding the pursuit of success?', '{"A":"A) No one can succeed without pushing limits.","B":"B) No one can afford to neglect close friends.","C":"C) Collectivism is superior to individualism.","D":"D) Success experts often lead people to ruin."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q51'
);
SET @q_cet6_2025_12_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_52, 'What does the author think about today''s America?', '{"A":"A) It is struggling to transform fiction into reality.","B":"B) It has been the focus of many vital conversations.","C":"C) It still has a long way to go before equity can be truly realized.","D":"D) It has got to a point where people disagree on nearly every issue."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q52'
);
SET @q_cet6_2025_12_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_53, 'What do we learn from the passage about black students in the past 20 years?', '{"A":"A) They have been unfairly treated regarding higher education.","B":"B) They have been battling hard to address equity issues.","C":"C) They have boosted their lifetime incomes by billions of dollars.","D":"D) They have come to see the consequences of racial discrimination."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q53'
);
SET @q_cet6_2025_12_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_54, 'How can Americans bridge the differences that divide them?', '{"A":"A) By dealing with the thorny issues confronting them.","B":"B) By seizing every chance to enhance racial harmony.","C":"C) By continuing to pursue Martin Luther King Jr.''s cause.","D":"D) By striving to identify exceedingly valuable opportunities."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q54'
);
SET @q_cet6_2025_12_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_55, 'How do most Americans view America as a nation according to a recent survey?', '{"A":"A) It is compelled to address its historical social issues.","B":"B) It is delaying advancements toward racial equality.","C":"C) It has kept itself from polarization.","D":"D) It has become increasingly split."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-1-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q55'
);
SET @q_cet6_2025_12_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_1_56, 'What does the author suggest Americans do?', '{"A":"A) Ensure the well-being of their children and grandchildren.","B":"B) Make joint efforts to tackle the nation''s equity issues.","C":"C) Restrain their intolerance and discrimination.","D":"D) Restore social order for a harmonious nation."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_1_56
);

-- ==================== cet6-2025-12-2 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-r1', 'BANKED_CLOZE', 'CET6', NULL, 'We humans love to believe we are special, but science and technology have repeatedly proved this conviction wrong. People __26__ thought that humans were the only animals to use tools, to form teams or to propagate culture, but science has shown that other animals do each of these things. Meanwhile, technology has quashed(使无效), one by one, claims that __27__ tasks require a human brain. The first adding machine was invented in 1623. This past year, a computer-generated work won an art contest. I believe the moment when computers meet and __28__ human intelligence is on the horizon. How will human intelligence and creativity be valued when machines become smarter and more creative than the brightest people? There will likely be a spectrum. In some __29__ , people still value humans doing things, even if a computer can do it better. It''s been a quarter of a century since a computer beat world champion Garry Kasparov, but human chess hasn''t gone away. In other fields, human skill will seem costly and __30__ . Take illustration for example: most readers don''t care whether the graphic __31__ a magazine article was drawn by a person or a computer — they just want it to be relevant, new and perhaps __32__ . And, of course, this question isn''t black or white. Many fields will be a __33__ , where some humans find a lucky place, but most of the work is done by computers, like in manufacturing today, where much of the work is accomplished by robots, but some humans must be there to __34__ the machines. If history is any guide, it''s almost certain that advances in AI will cause more jobs to __35__ , that creative workers with human-only skills will become richer but fewer in number, and that those who own creative technology will become the new ultra-rich.', NULL, '["A) accompanying","B) cognitive","C) domains","D) entertaining","E) evoking","F) hybrid","G) impetus","H) intuitive","I) once","J) oversee","K) redundant","L) stances","M) surpass","N) tentatively","O) vanish"]', 307, 'IMPORT', 'cet6-2025-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-2-r1'
);
SET @pg_cet6_2025_12_2_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-2-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-r2', 'MATCHING', 'CET6', 'Do You Know When to Quit Wisely?', 'A) Projects, relationships, and jobs don''t always work out as planned — and it''s not always clear when to give up. We''ve all repeatedly heard the saying that "quitters never win", but sometimes the best decision is to cut our losses. B) Think about that relationship you held on to even after it had run its course or the job you stayed in despite your boss making you miserable. Many of us try to hold onto the last ray of hope, thinking we can make it work, whatever "it" is. And while perseverance is generally an excellent quality, it may also incline you to over-invest in something that is no longer a good idea. C) As an executive coach, I work with numerous passionate and hard-working leaders who don''t want to "quit". But the smartest leaders learn to discern the difference between quitting too soon and holding onto something that they shouldn''t. D) We are all susceptible to the sunk-cost delusion, an unconscious bias that leads us to persist in an endeavor we have already invested time, effort, or money into — even when abandoning it would be more beneficial. We realize that we can''t get back the resources we''ve given, so we persevere — investing in a project that should be halted, staying in a relationship that should be over, or finishing a book we no longer enjoy and should put down, because we''re already halfway through it. If quitting is "not your thing", you may be especially susceptible to this bias. E) The sunk-cost delusion causes us to overly worry about what we''ll lose if we move on and not think enough about the costs of not moving on. To offset this bias, deliberately refocus your thinking on the gains so you can more objectively weigh the alternatives. Ask yourself: What might I gain by cutting my losses now? Will you be happier or have time for another (better) opportunity? Then ask yourself: What will it cost me to soldier on? For example, is it possible that you''ll be throwing more good money after what you''ve already lost? Or that you won''t have the energy to capitalize on other promising possibilities? F) The illusion of control can also interfere with our best judgment, leading us to overestimate our ability to control events and attain a positive outcome. This bias gives us a sense of agency and can promote mental health. However, the bias can also result in escalating commitment to a losing course of action. Especially when combined with an "I''m not a quitter" mentality, feeling like we have more control over an event or person than we do puts us at risk of doubling down when we should pull out. G) To counteract this bias, consider your situation and make a simple two-column list of what''s in your control and what''s not. Think rigorously. While you may be able to influence other people and various circumstances, you can''t force them to change or go your way. H) Getting clear on what you can control and what you can''t is essential to making a quality decision about whether to call it quits or persevere. With a written list in hand, you can ensure you focus on what you can control and better assess whether your continued efforts are worth the expense. Expending effort and emotion on things you can''t control can be both draining and disempowering. I) Research indicates that people link their self-identity and social status to their commitments. And because we identify with our commitments, withdrawing from one can feel like a threat to our identity or status. J) Take my client Ryan, a leader at a technology company. Ryan had invested two years and a lot of effort in a design project that wasn''t delivering the needed outcomes, but the thought of abandoning it after all she had put in was hard to bear. As Ryan and I explored whether she should cancel the initiative she''d been leading or continue to persevere, she stated, "The thing is, I''m not a quitter." This singular, fixed sense of self was clouding her judgment and limiting her choices for action. K) Our self-concept and identity are mental concepts that influence our behavior. If you strongly identify as not being a quitter, you can end up staying stuck in a course of action due to your narrow and rigid self- concept. To overcome this kind of internal obstacle, recall your other positive traits and personality characteristics. Ask yourself: What additional strengths do I have (or aspire to have) that would be helpful to employ here? For example, when I asked Ryan what other positive qualities from her personality she needed to leverage for decision making, she replied, "Discernment and bravery." L) Now, examine your situation through the lens of each of these facets of yourself. What does the discerning part of you say? The brave part? Considering your decision through these different characteristics will enable you to see that you have more choices. It''s also helpful to seek external sources of information, rather than relying solely on your thinking and instincts. But it''s important to think through whose opinions you solicit. M) Ideally, seek out people who are less invested in your decision than you are. If you''re considering whether to shut down your entrepreneurial venture, for instance, reach out to other founders as opposed to just your business partner. Similarly, if you''re looking for love advice, ask someone removed from the ups and downs of your relationship instead of relying only on your best friend. In all cases, I recommend describing your situation and following up with a question like: "How would you manage this situation?" N) Alternately, you could also seek out hard data that illuminates your real chance of success in whatever endeavor you are contemplating. Sticking with the example of the entrepreneurial venture, numbers are your best friend. Use them to remove yourself from the love you have for this idea and consider your burn rate relative to growth plan, industry growth rates, and other factors that predict start-up success. External sources of information can help you see angles and possibilities you might not have considered. O) When something that seemed so promising at the start doesn''t turn out the way we imagined, we can become overly self-critical. Nobody likes to feel that they''ve made a poor decision, especially if making intelligent decisions is a quality you hold in high esteem. The most effective strategy here is to give yourself a break. Practicing self-compassion increases your resilience(韧性), emotional intelligence, compassion toward others, and can boost your performance as well as help you develop a growth mindset. P) Instead of deliberating and criticizing yourself, focus instead on what you can learn from this situation. For example, Ryan recognized she had developed various new skills and leadership capabilities from leading the design project. And despite ultimately deciding to drop it, she was still happy she had tried and grateful for what the experience taught her. Q) Undeniably, perseverance can help us succeed. But for your well-being, it''s important to learn how to distinguish quitting too soon and clinging to a losing course of action. While letting go can be difficult, it will free up your time, energy, and mental space to imagine new possibilities and pursue new opportunities.', NULL, NULL, 1221, 'IMPORT', 'cet6-2025-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-2-r2'
);
SET @pg_cet6_2025_12_2_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-2-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-r3', 'CAREFUL_READING', 'CET6', NULL, 'As interdependent beings we cannot thrive independent of others. We like to work with people who are like- minded, with whom we share a common interest, or who also believe in a cause we are serious about. This is evident in how we have organized ourselves into various collective groups such as nations, regions, communities, organizations, and families. Does the group you belong to have a strong collective consciousness or shared beliefs? Is there interdependence among its members? Do you consider this group a significant part of your existence? If your answers are affirmative, then you are experiencing a micro version of solidarity. What is solidarity? Its simplest definition in the dictionary is: "… a unifying opinion, feeling, purpose or interest among a group of people." In this increasingly diverse society we live in, solidarity takes on a complex and multifaceted character as it forms bonds of interdependence among unique individuals living in a fast-changing environment and working within a complex division of labor. One facet of solidarity fits well with the principles of communitarianism( 社群主义). In this setting, individuals give up their own interests to serve the common good. However, its strict adherence to social cohesiveness and exclusiveness restricts expression and practice of individual differences and preferences. Consequently, individuality and autonomy are sacrificed to maintain the unity of the group. Solidarity is also viewed as a reaction to the extreme emphasis on individualism and freedom of choice. It goes against the liberal idea of unrestricted individuals who see society as a hindrance to their freedom to make choices and to act according to what is good for them regardless of how these will affect others. But despite its many facets, social theorists have viewed solidarity as a key factor in bringing about order and progress in society. They believe that for human society to survive as it becomes more diverse, more new bonds need to be formed based on the differences. In the light of this, they regard a genuine solidarity as more than just shallow relationships based on common interests. Solidarity is not just a product of strategic calculations of how much it will benefit the self. It is not an exclusive class founded on the you-and-me-against- the-world principle. Rather, it is inclusive and is not forced. Acting out of solidarity means supporting and standing up for each other — in recognition that one''s fate is in the fate of the other. It is a bond characterized by cooperative practices and strengthened by the concern for the well-being of others or the common good. It fights for the protection of human dignity and listens to and acts on the cries of the most vulnerable.', NULL, NULL, 446, 'IMPORT', 'cet6-2025-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-2-r3'
);
SET @pg_cet6_2025_12_2_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-2-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-r4', 'CAREFUL_READING', 'CET6', NULL, 'People who repeatedly give unwanted advice can be well-meaning and genuinely want to help. Others might do this out of a sense of self-worth around the ability to influence others. One study found that people with a high tendency to seek power were more likely to give advice than those with an opposite tendency. Under the guise( 外表) of unselfishness, people may be driven to give you unwanted advice because it makes them feel powerful or in control. They may not be fully aware of this drive, however. These people may also display a problematic degree of emotional vulnerability, becoming upset very quickly, and taking a long time to calm down. It is possible that their emotions were only validated in childhood when they were at their loudest, encouraging them to adopt responses to discomfort that are excessive in most situations. When someone is giving advice in order to make themselves feel more powerful, there is underlying anxiety to their behavior that recipients of the advice tend to notice. It can be tempting in this situation to react harshly to the advice giver and to accuse them of being manipulative, but this approach might produce an undesired result. If the act of giving advice is contributing actively to someone''s feelings of self-worth, an outright(直率的) rejection may be perceived as a threat, activating their fight-or-flight response, possibly causing them to double down on their validation-seeking behavior, or leading to a larger conflict. The key is to validate without over-identifying. You can let them know that you have heard them and appreciate where they are coming from without taking on the potentially damaging narrative that you could not have gotten by without their help. You had better say something like, "Thanks for the idea. I have my own plan for handling this, but I really appreciate your perspective and will take it into consideration. Can I let you know when I need help in the future?" If you have trouble setting boundaries tactfully, prioritize working on your own ability to self-regulate. As uncomfortable as it may be to continuously receive, if you can respond with compassion, the situation will likely defuse much faster. Though it is usually not the intended outcome of giving unsolicited advice, many who receive it often feel stressed, offended, or simply annoyed by unwanted suggestions. Setting a boundary in this regard, if you feel you need one, is perfectly reasonable and something that can bring you increased emotional safety. It is best to set boundaries in a way that takes into account the individual''s underlying reasons for doing what they are doing to avoid unnecessary conflict and more stress.', NULL, NULL, 441, 'IMPORT', 'cet6-2025-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-2-r4'
);
SET @pg_cet6_2025_12_2_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-2-r4' LIMIT 1);

-- 翻译 cet6-2025-12-2
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-translation'
);
SET @q_cet6_2025_12_2_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_01, '中华民族崇尚自强自立的精神，这一精神深植于中国文化之中，是民族生存与发展的重要支撑。改革开放以来，中国在自强自立的征程上，持续加大科研投入，在信息技术、人工智能、航天工程等领域不断取得新突破。5G 网络覆盖全国，远程医疗发展迅速，电子支付的使用全球领先，嫦娥探月工程展现了航天领域引人注目的发展。自强自主精神成为推动国家现代化进程的强大动力，激励着中国人民为实现民族复兴(rejuvenation) 的中国梦不断奋进。', NULL, 'The Chinese nation values the spirit of self-reliance and self-improvement, which is deeply rooted in Chinese culture and serves as a vital support for the survival and development of the nation. Since the reform and opening-up, China has continued to increase its investment in scientific research on its journey toward self-reliance, and has kept making new breakthroughs in such fields as information technology, artificial intelligence and aerospace engineering. For example, 5G networks now cover the whole country, telemedicine is developing rapidly, and electronic payment is used more widely than anywhere else in the world; the Chang''e lunar exploration program also demonstrates remarkable progress in China''s aerospace field. The spirit of self-reliance and self-improvement has become a powerful driving force behind the country''s modernization, inspiring the Chinese people to keep forging ahead toward the Chinese Dream of national rejuvenation.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_01
);

-- 听力 Q1 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q01', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q01'
);
SET @q_cet6_2025_12_2_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_02, NULL, '{"A":"A) It is absurdly expensive.","B":"B) It is appropriately priced.","C":"C) It brings shame on the university.","D":"D) It caters to students and teachers."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_02
);

-- 听力 Q2 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q02', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q02'
);
SET @q_cet6_2025_12_2_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_03, NULL, '{"A":"A) They never really appeal to her.","B":"B) They are never actually good value.","C":"C) They are within students'' budgets.","D":"D) They always come at a high speed."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_03
);

-- 听力 Q3 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q03', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q03'
);
SET @q_cet6_2025_12_2_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_04, NULL, '{"A":"A) The food.","B":"B) The space.","C":"C) The speed.","D":"D) The environment."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_04
);

-- 听力 Q4 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q04', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q04'
);
SET @q_cet6_2025_12_2_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_05, NULL, '{"A":"A) A complete refurnishing.","B":"B) A ruinous burning down.","C":"C) A substantial expansion.","D":"D) A massive renovation."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_05
);

-- 听力 Q5 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q05', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q05'
);
SET @q_cet6_2025_12_2_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_06, NULL, '{"A":"A) They have a poor work ethic.","B":"B) They don''t get along with managers.","C":"C) They are struggling in the workplace.","D":"D) They aren''t as varied as their predecessors."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_06
);

-- 听力 Q6 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q06', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q06'
);
SET @q_cet6_2025_12_2_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_07, NULL, '{"A":"A) Learning about the way they adhere to their own values.","B":"B) Recognizing how they try to strike a work-life balance.","C":"C) Knowing how they struggle to connect with managers.","D":"D) Understanding the way they seek career advancement."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_07
);

-- 听力 Q7 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q07', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q07'
);
SET @q_cet6_2025_12_2_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_08, NULL, '{"A":"A) In terms of the number of hours spent.","B":"B) By the amount of work they perform.","C":"C) In terms of the work done in 8 hours.","D":"D) By the quality of the work they do."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q08', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q08'
);
SET @q_cet6_2025_12_2_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_09, NULL, '{"A":"A) Those whose culture facilitates their advancement.","B":"B) Those allowing them to do projects of their choice.","C":"C) Those whose values align with their own.","D":"D) Those refraining from discrediting their perspectives."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_09
);

-- 听力 Q9 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q09', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q09'
);
SET @q_cet6_2025_12_2_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_10, NULL, '{"A":"A) They may unconsciously help customers choose greener dishes.","B":"B) They may unintentionally encourage customers to eat meat.","C":"C) They raise customers'' environmental awareness.","D":"D) They enable customers to eat in a healthy way."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_10
);

-- 听力 Q10 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q10', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q10'
);
SET @q_cet6_2025_12_2_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_11, NULL, '{"A":"A) By inviting them to taste different kinds of food.","B":"B) By observing the eating behavior of strict vegetarians.","C":"C) By comparing participants eating vegetarian food frequently with those doing so rarely.","D":"D) By requiring participants to choose a meal as if they were feasting at a family gathering."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_11
);

-- 听力 Q11 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q11', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q11'
);
SET @q_cet6_2025_12_2_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_12, NULL, '{"A":"A) They are less likely to choose a vegetarian dish.","B":"B) They find vegetarian dishes become more appealing.","C":"C) They tend to consume larger portions of unhealthy food.","D":"D) They are less likely to choose dishes recommended by chefs."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_12
);

-- 听力 Q12 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q12', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q12'
);
SET @q_cet6_2025_12_2_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_13, NULL, '{"A":"A) They have found a solution to the global problem of air pollution.","B":"B) They have managed to freeze polluting particles to around –18 °C.","C":"C) They have been seeking a way to prevent pollutants from penetrating indoors.","D":"D) They have been cooperating closely on developing a new type of air-conditioner."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_13
);

-- 听力 Q13 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q13', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q13'
);
SET @q_cet6_2025_12_2_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_14, NULL, '{"A":"A) They can be costly and inefficient.","B":"B) They are constantly being perfected.","C":"C) They are by-products of health research.","D":"D) They can save over 40,000 lives each year."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_14
);

-- 听力 Q14 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q14', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q14'
);
SET @q_cet6_2025_12_2_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_15, NULL, '{"A":"A) They keep their windows closed.","B":"B) They spend a lot more time indoors.","C":"C) They make more use of air-conditioners.","D":"D) They try various ways to purify indoor air."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_15
);

-- 听力 Q15 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q15', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q15'
);
SET @q_cet6_2025_12_2_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_16, NULL, '{"A":"A) It shows the importance of eliminating indoor pollution.","B":"B) It may change the way of future environmental research.","C":"C) It demonstrates the fruitful cooperation between UK and Chinese scientists.","D":"D) It may make household appliances serve an additional air cleaner function."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_16
);

-- 听力 Q16 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q16', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q16'
);
SET @q_cet6_2025_12_2_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_17, NULL, '{"A":"A) It distinguishes different species of animals.","B":"B) It reflects distinct traits in animal behavior.","C":"C) It demonstrates animals'' ability to recognize themselves.","D":"D) It gauges the level of intelligence of various animal species."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_17
);

-- 听力 Q17 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q17', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q17'
);
SET @q_cet6_2025_12_2_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_18, NULL, '{"A":"A) It meets few of the behavioral criteria set in the mirror test.","B":"B) It behaves similarly to animals capable of self-recognition.","C":"C) It removes marks from itself to show self-awareness.","D":"D) It matches children over 18 months in intelligence."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_18
);

-- 听力 Q18 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q18', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q18'
);
SET @q_cet6_2025_12_2_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_19, NULL, '{"A":"A) They have conclusively established the criteria of animal intelligence.","B":"B) They have advanced the concept of self-awareness to a higher level.","C":"C) They incorporate more perspectives than one.","D":"D) They raise more questions than answers."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_19
);

-- 听力 Q19 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q19', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q19'
);
SET @q_cet6_2025_12_2_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_20, NULL, '{"A":"A) Small children are even more keen on screens than their elders.","B":"B) Both parents and children preferred to read electronic books.","C":"C) Parents differed from children in reading behavior.","D":"D) Children reading electronic books learned more."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_20
);

-- 听力 Q20 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q20', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q20'
);
SET @q_cet6_2025_12_2_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_21, NULL, '{"A":"A) They came to conflicting conclusions.","B":"B) They were based on small samples.","C":"C) They yielded unanticipated findings.","D":"D) They were focused on younger kids."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_21
);

-- 听力 Q21 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q21', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q21'
);
SET @q_cet6_2025_12_2_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_22, NULL, '{"A":"A) Those that prove simple enough for them to comprehend.","B":"B) Those that produce both audio and visual effects on them.","C":"C) Those that draw their attention to the educational content.","D":"D) Those that contribute to their increased interest in reading."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_22
);

-- 听力 Q22 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q22', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q22'
);
SET @q_cet6_2025_12_2_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_23, NULL, '{"A":"A) Regret having wasted much time in making them.","B":"B) Think how different we could have made them.","C":"C) Keep ourselves from regretting them.","D":"D) Live with them for the time being."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_23
);

-- 听力 Q23 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q23', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q23'
);
SET @q_cet6_2025_12_2_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_24, NULL, '{"A":"A) It has made us the person we are now.","B":"B) It has been made with a lot of thinking.","C":"C) It stems from our valuable knowledge.","D":"D) It benefits us greatly one way or another."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_24
);

-- 听力 Q24 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q24', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q24'
);
SET @q_cet6_2025_12_2_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_25, NULL, '{"A":"A) Challenging things to do.","B":"B) Beautiful things to share.","C":"C) Choices to make.","D":"D) Lessons to learn."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_25
);

-- 听力 Q25 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q25', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q25'
);
SET @q_cet6_2025_12_2_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_26, NULL, '{"A":"A) Foreseeing the possibility for regret later.","B":"B) Making proper use of the lessons learned.","C":"C) Perfecting the decision-making strategies.","D":"D) Seeing them as obstacles to moving forward."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q26'
);
SET @q_cet6_2025_12_2_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_27, NULL, '{"A":"A) accompanying","B":"B) cognitive","C":"C) domains","D":"D) entertaining","E":"E) evoking","F":"F) hybrid","G":"G) impetus","H":"H) intuitive","I":"I) once","J":"J) oversee","K":"K) redundant","L":"L) stances","M":"M) surpass","N":"N) tentatively","O":"O) vanish"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q27'
);
SET @q_cet6_2025_12_2_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_28, NULL, '{"A":"A) accompanying","B":"B) cognitive","C":"C) domains","D":"D) entertaining","E":"E) evoking","F":"F) hybrid","G":"G) impetus","H":"H) intuitive","I":"I) once","J":"J) oversee","K":"K) redundant","L":"L) stances","M":"M) surpass","N":"N) tentatively","O":"O) vanish"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q28'
);
SET @q_cet6_2025_12_2_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_29, NULL, '{"A":"A) accompanying","B":"B) cognitive","C":"C) domains","D":"D) entertaining","E":"E) evoking","F":"F) hybrid","G":"G) impetus","H":"H) intuitive","I":"I) once","J":"J) oversee","K":"K) redundant","L":"L) stances","M":"M) surpass","N":"N) tentatively","O":"O) vanish"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q29'
);
SET @q_cet6_2025_12_2_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_30, NULL, '{"A":"A) accompanying","B":"B) cognitive","C":"C) domains","D":"D) entertaining","E":"E) evoking","F":"F) hybrid","G":"G) impetus","H":"H) intuitive","I":"I) once","J":"J) oversee","K":"K) redundant","L":"L) stances","M":"M) surpass","N":"N) tentatively","O":"O) vanish"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q30'
);
SET @q_cet6_2025_12_2_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_31, NULL, '{"A":"A) accompanying","B":"B) cognitive","C":"C) domains","D":"D) entertaining","E":"E) evoking","F":"F) hybrid","G":"G) impetus","H":"H) intuitive","I":"I) once","J":"J) oversee","K":"K) redundant","L":"L) stances","M":"M) surpass","N":"N) tentatively","O":"O) vanish"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q31'
);
SET @q_cet6_2025_12_2_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_32, NULL, '{"A":"A) accompanying","B":"B) cognitive","C":"C) domains","D":"D) entertaining","E":"E) evoking","F":"F) hybrid","G":"G) impetus","H":"H) intuitive","I":"I) once","J":"J) oversee","K":"K) redundant","L":"L) stances","M":"M) surpass","N":"N) tentatively","O":"O) vanish"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q32'
);
SET @q_cet6_2025_12_2_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_33, NULL, '{"A":"A) accompanying","B":"B) cognitive","C":"C) domains","D":"D) entertaining","E":"E) evoking","F":"F) hybrid","G":"G) impetus","H":"H) intuitive","I":"I) once","J":"J) oversee","K":"K) redundant","L":"L) stances","M":"M) surpass","N":"N) tentatively","O":"O) vanish"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q33'
);
SET @q_cet6_2025_12_2_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_34, NULL, '{"A":"A) accompanying","B":"B) cognitive","C":"C) domains","D":"D) entertaining","E":"E) evoking","F":"F) hybrid","G":"G) impetus","H":"H) intuitive","I":"I) once","J":"J) oversee","K":"K) redundant","L":"L) stances","M":"M) surpass","N":"N) tentatively","O":"O) vanish"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q34'
);
SET @q_cet6_2025_12_2_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_35, NULL, '{"A":"A) accompanying","B":"B) cognitive","C":"C) domains","D":"D) entertaining","E":"E) evoking","F":"F) hybrid","G":"G) impetus","H":"H) intuitive","I":"I) once","J":"J) oversee","K":"K) redundant","L":"L) stances","M":"M) surpass","N":"N) tentatively","O":"O) vanish"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q35'
);
SET @q_cet6_2025_12_2_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_36, NULL, '{"A":"A) accompanying","B":"B) cognitive","C":"C) domains","D":"D) entertaining","E":"E) evoking","F":"F) hybrid","G":"G) impetus","H":"H) intuitive","I":"I) once","J":"J) oversee","K":"K) redundant","L":"L) stances","M":"M) surpass","N":"N) tentatively","O":"O) vanish"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q36'
);
SET @q_cet6_2025_12_2_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_37, 'Feeling like they have more control over something or someone than they do, people get more committed to their pursuit when they should give up.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q37'
);
SET @q_cet6_2025_12_2_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_38, 'If you regard yourself as one who never quits, you may end up trapped in your course of action.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q38'
);
SET @q_cet6_2025_12_2_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_39, 'One of the author''s clients found it hard to give up a design project, in which she had put in a lot of time and effort.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q39'
);
SET @q_cet6_2025_12_2_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_40, 'The author suggests that one should direct their thoughts to the gains of quitting timely so as to move on.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q40'
);
SET @q_cet6_2025_12_2_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_41, 'When making a decision, you''d better ask for opinions of those who have less stake in your decision.', NULL, 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q41'
);
SET @q_cet6_2025_12_2_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_42, 'For people associating their identity with their commitments, quitting can feel like their identity is threatened.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q42'
);
SET @q_cet6_2025_12_2_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_43, 'People who regard highly the quality of making wise decisions do not feel good when they make a bad one.', NULL, 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q43'
);
SET @q_cet6_2025_12_2_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_44, 'The wisest leaders learn to distinguish between giving up too soon and sticking with something irrationally.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q44'
);
SET @q_cet6_2025_12_2_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_45, 'When people are thinking of an endeavor, they should dig out reliable data that tells them how likely they are to succeed.', NULL, 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q45'
);
SET @q_cet6_2025_12_2_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_46, 'Having a clear view of what''s in your control and what''s not is vital to making a good decision regarding whether to give up or stick it out.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q46'
);
SET @q_cet6_2025_12_2_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_47, 'What does the author say about human beings?', '{"A":"A) They cannot prosper without cooperating with each other.","B":"B) They share a common interest and believe in a just cause.","C":"C) They think and behave alike in different social groups.","D":"D) They cannot gain independence without fighting for it."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q47'
);
SET @q_cet6_2025_12_2_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_48, 'What do we learn about solidarity in an increasingly diverse society?', '{"A":"A) It gives rise to a complicated division of labor.","B":"B) It involves many aspects with great complexity.","C":"C) It brings individuals together as environment changes.","D":"D) It embraces the characteristics of different individuals."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q48'
);
SET @q_cet6_2025_12_2_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_49, 'What would we witness in the setting of communitarianism?', '{"A":"A) Ruling of social norms and ridding of individuality.","B":"B) Emphasis on the adherence to individual differences.","C":"C) Sacrifice of personal interests for the common good.","D":"D) Elimination of individualism and personal choices."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q49'
);
SET @q_cet6_2025_12_2_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_50, 'What does solidarity entail according to the passage?', '{"A":"A) A limit to personal differences.","B":"B) An opposition to individualism.","C":"C) A hindrance to social advancement.","D":"D) An inevitable end to liberal pursuits."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q50'
);
SET @q_cet6_2025_12_2_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_51, 'What do social theorists think of solidarity?', '{"A":"A) It is especially relevant to the most vulnerable.","B":"B) It is most effective in protecting human dignity.","C":"C) It is essential to progress and order in society.","D":"D) It is indispensable to avoiding shallow relationships."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q51'
);
SET @q_cet6_2025_12_2_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_52, 'What is the finding of one study about people who keep giving unsolicited advice?', '{"A":"A) They turn out to be well-meaning.","B":"B) They are genuinely kind-hearted.","C":"C) They are capable of influencing others.","D":"D) They are inclined to crave for power."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q52'
);
SET @q_cet6_2025_12_2_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_53, 'What is the problem with people who are driven to give you unsolicited advice?', '{"A":"A) They may be quick to upset others.","B":"B) They may be emotionally vulnerable.","C":"C) They want their voice to be the loudest.","D":"D) They respond to discomfort excessively."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q53'
);
SET @q_cet6_2025_12_2_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_54, 'What is the advice receiver tempted to do when noticing the advice giver''s underlying anxiety?', '{"A":"A) Reveal the undesired result of their approach.","B":"B) Refuse their advice in an undisguised manner.","C":"C) Bring their real motives to the surface.","D":"D) Accuse them of trying to control others."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q54'
);
SET @q_cet6_2025_12_2_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_55, 'How is the advice giver likely to react to the rejection of their advice?', '{"A":"A) They may regard it as a threat.","B":"B) They may modify their behavior.","C":"C) They get ready for a larger conflict.","D":"D) They begin to doubt their self-worth."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-2-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q55'
);
SET @q_cet6_2025_12_2_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-2-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_2_56, 'What should the advice receiver do to avoid unnecessary conflict?', '{"A":"A) Concede the advice is perfectly reasonable.","B":"B) Give their reasons for not taking the advice.","C":"C) Understand why the advice giver offers the advice.","D":"D) Explain their chosen way of handling the situation."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_2_56
);

-- ==================== cet6-2025-12-3 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-r1', 'BANKED_CLOZE', 'CET6', NULL, 'It''s best to think of an accent as a distinct, systematic and rule-governed way of speaking. Accent is not a __26__ for dialect, but it''s related. Dialect is an umbrella term for the way a community pronounces words, creates words, and orders words; accent refers to that first part only. Many __27__ presume that there is a single standard way of speaking in each country, with one single standard accent, and that this perceived standard is __28__ the best form of speech, but linguists(语言学家) often point out that the concept of a standard accent is better understood as an ideal rather than a __29__ . In other words, no one speaks "standard English"; rather, it is an imagined way of using language that exists only in grammar and style books. One reason linguists agree there is no one true standard is that, through the years, there have been __30__ supposed standards, depending on time and place. The standard for English in British newsreels(新闻片) from the 1950s, for example, differs greatly from the standard found on American national news broadcasts today. In fact, there has never been a single standard that''s been fully agreed upon — and broadcast outlets across the __31__ have never consistently held to those standards anyway. Even so, this idea of a standard accent is __32__ and many workplace and educational environments perpetuate the idea that accents that __33__ from the current standard are less appropriate, or even inappropriate. Scholars have found that southern US accent features are more accepted in __34__ such as government, law and service-oriented workplaces, but less accepted in the technology sector. The acceptability of nonstandard accents may __35__ with differences in class and culture, with newer or higher prestige industries expecting more standard speech in the workplace.', NULL, '["A) affix","B) correlate","C) deviate","D) domains","E) influential","F) inherently","G) laymen","H) multiple","I) properties","J) reality","K) reciprocally","L) specimen","M) spectrum","N) synonym","O) unanimous"]', 295, 'IMPORT', 'cet6-2025-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-3-r1'
);
SET @pg_cet6_2025_12_3_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-3-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-r2', 'MATCHING', 'CET6', 'The History and Meaning of Colored Traffic Lights', 'A) Timed traffic lights are set according to schedules that are supposed to coordinate with peak traffic hours. Cities need to monitor and update signal light time schedules at least every two years to keep these systems effective. In Los Angeles, California, an ambitious project to go a step further and synchronize(使同步) every red light in Los Angeles cost over 400 million dollars. Ask a resident of the city and they are likely to agree that saving time on the road is well worth it. If implemented nationwide, synchronization could shave 10% off traffic congestion(堵塞) and 20% off air pollution. Congestion costs time, money, and lives. Big data can help improve how millions of people safely share the road. However, none of this would be possible without the traffic light! B) The first traffic light was invented in London in the 1860''s, but it was hardly recognizable — or effective. It had been adapted from the railroad signal system by a railway manager, John Peak Knight, in 1868. The railroads used red gas lights at night to signal stops and green gas lights during the daytime. Knight installed a similar gas light, semaphore(臂板信号) system near London''s Westminster Bridge in December of 1868. C) The life of the first traffic light signal was short-lived. A gas leak caused one of the signal lights to explode on its police officer operator within a month of being installed. D) Automating traffic signals stalled after the London incident. Forty years passed before cars crowding city streets urged the development of traffic lights in the United States. London would not see another traffic light until 1929. E) The United States is a car culture like no other country. Unlike most European cities that started urban planning when horses were high-tech, many cities in the United States were designed around urban sprawl, suburban tracts, and motor cars. F) As traffic and cities grew, so did the race to solve growing traffic problems. The first traffic signals were semaphores. Semaphores are towers with moving arms signaling for traffic to stop or go. They could be manual or automatic. There was no consistent design. Various models were invented and put into place in cities as the need arose. G) In 1912, Lester Wire was a police officer exhausted by traffic at Main Street and 200 South. He developed a manually switched stop light. The four-sided box, raised on a ten-foot pole, looked like a birdhouse and was operated manually by an officer. The officer would flip a switch to change between the dipped red and green lights. H) Like the 1910 semaphore, the first electric signal used words. However, the words were no longer written on arms that raised and fell. The words "stop" or "move" were on lights. The posts lit up on each of four corner-posts around an intersection(十字路口). It was not automated, though. A booth with an operator was required to flip the switches. I) The system allowed police officers to move from the middle of the street to a corner. From that vantage(有利 地位), an officer could oversee the crowd. If an emergency vehicle came, the officer could flip a switch and clear the intersection by triggering all red lights. The emergency vehicle could now pass effortlessly. Finally, in San Francisco the first red and green electric light system that could be operated automatically (or manually) was introduced in 1917. J) In 1920, the first three-color light system was introduced in Detroit — also known as Motor City, USA. The evolution of traffic light signals could not have a more appropriate context than Motor City. Ford Motor Company was founded in Detroit in 1903 (and other motor companies followed). Ford made cars affordable for more common people, rather than the wealthy, by creating larger scale factory production. K) Stop and go were insufficient for the new volumes of cars zooming through intersections. Streets were full of new numbers of cars in addition to delivery wagons, bustling crowds, bicycles, horse-drawn carriages, and street cars. The introduction of the cautionary yellow light helped increase driver safety, decreasing accidents that come from running red lights. L) Stop lights were incredibly important in chaotic city streets. Crosswalks weren''t even introduced until 1951. The first pedestrian fatality in the United States was in 1899. M) The development of the modern traffic light may have started in London, but it grew up in the United States. In Cleveland, an African-American inventor named Garrett Morgan came up with an affordable, patented traffic signal. The yellow light made intersections safer than the old stop and go system. The new design was inexpensive enough that it allowed the installation of a lot more lights. N) Morgan sold the patent to General Electric — and the spread of the traffic light was green lighted. Green means go. It is that simple, but it''s still best to check both ways for oncoming traffic that may not be paying attention or is running the light. Yellow means slow down and prepare to stop. It does not mean full- throttle(全速) ahead. While you may get away with gunning it into the intersection, running a yellow can lead to tickets and dangerous accidents. Red lights are a clear and consistent warning to stop. Even where right turns are allowed on red lights, you must come to a complete stop before turning right. You must also yield to any through traffic, which has the right of way. In most states and cities, you can take a right on red unless otherwise indicated. New York City does not allow a right on red. O) Red arrows mean you cannot turn right on a red in most states. The green arrow, in these cases, is the only time you can make the turn. However, you can take a right on a red arrow after a full stop in the states of Illinois, Kansas, Louisiana, Maryland, Michigan, New Hampshire, North Dakota, Oregon, South Carolina, Utah, Washington State and Wyoming. P) Flashing Red is the same as a stop sign, generally used at four-way intersections where there is minimal traffic. When arriving at a flashing red light, make a full and complete stop. Flashing Red Arrows similarly mean to stop and then proceed to take the turn. Flashing Yellow lights mean yield or signal caution, like outside of a fire station. There are no all-direction flashing yellow lights, since it is prohibited in the United States. If you have a flashing yellow light, you are to yield to oncoming traffic. Q) Flashing Yellow Arrows are part of a four-signal traffic light. These are used in some states after a protected green turn signal, or arrow, but before a steady yellow arrow. When a flashing yellow arrow is shown, you can take the turn after yielding to pedestrians and traffic. Steady Yellow Arrows maintain the normal yellow light caution in three-light signals, meaning to stop or prepare to stop. In a four-signal system that has a flashing yellow arrow, the steady yellow arrow is a signal that the yield period is ending. The red arrow is about to start. Vehicles should stop if safely possible. Traffic tickets are possible for running a steady yellow arrow. R) Traffic light meaning is fairly consistent across the board with various deviations. Green means it''s safe to proceed (though you should still exercise caution). Yellow means caution and yield. Red means danger and stop. Always drive defensively and obey traffic signals.', NULL, NULL, 1243, 'IMPORT', 'cet6-2025-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-3-r2'
);
SET @pg_cet6_2025_12_3_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-3-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-r3', 'CAREFUL_READING', 'CET6', NULL, 'Mindfulness has been shown to have a number of meaningful health benefits — it can help reduce anxiety and promote healing in those suffering from chronic illness. The practice is based on an insight first described in ancient Buddhist texts that human beings have the capacity to observe experience without being caught up in it. This means simply that it is possible to observe ourselves having a craving, or a happy thought, or even a scary emotion, without reacting in the moment in a way that amplifies the feeling or sends the mind spiraling off into thinking about old memories or anticipating events. This practice of mindfulness can help calm the mind and the body as we learn not to react to experience with likes and dislikes or judgments of good and bad. It does not make us cold or indifferent but more fully present. One of the challenges of practicing mindfulness in our contemporary world is that there has been a profound transformation in human attention. The artist Jenny Odell argues that in our "attention economy" human attention has been transformed into a commodity that big corporations buy and sell. This economy rests on a technological revolution of mobile phones and social media that makes it possible for corporations to target our attention with their content at every moment. The devices most people use are a perpetual diversion from the present moment. The result is that it can feel as though our ability to focus, and be fully present, has been stolen. But mindfulness can help us resist the attention economy and relish the things that make life special, like being together with those we love. Most mindfulness research focuses on the individual benefits of the practice, but some scholars assert that we can not only practice mindfulness for ourselves but also practice it for others. It can help us build stronger, healthier relationships. The sad truth is that living in the attention economy, most of us have become bad listeners. However, just as it is possible to watch ourselves having an experience without reacting, it''s possible to watch another person have an experience without getting tied up in reactivity and judgment. The gift of mindfulness is a practice of listening with compassion to others describe their experiences. To give this gift means putting away your phone, turning off social media, and setting aside other common distractions. It means practicing being fully present in another person''s presence and listening to them with complete attention without judgment, while resisting the urge to make the interaction about you. If we judge the value of gifts based on their price, this gift may seem worthless, but in a distracted world, it is a precious one.', NULL, NULL, 453, 'IMPORT', 'cet6-2025-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-3-r3'
);
SET @pg_cet6_2025_12_3_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-3-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-r4', 'CAREFUL_READING', 'CET6', NULL, 'The other day I had to log into a service I hadn''t used before. Since I was a new user, the website decided that it needed to check I wasn''t a robot and so set me a Captcha test to determine whether the user is a person or a machine. I was presented with an image of a roadside scene over which was laid a grid. My "challenge" was to click on each cell in the grid that contained a traffic sign. I did so, a bit irritated. Then I was presented with another image and another grid — also with a request to identify road signs. Like a lamb, I complied, after which the website accepted my input. And then I realised what I had been doing was adding to a dataset for training the machine-learning software that guides self-driving cars. So, to gain access to an automated service that will benefit financially from my input, I first have to do some unpaid labor to help improve the performance of autonomous vehicles. Neat, eh? But note also the delicious additional irony that the Captcha is described as an "automated Turing test". The Turing test was conceived, you may recall, as a way of enabling humans to determine whether a machine could respond in such a way that one couldn''t tell whether it was a human or a robot. So we have wandered into a world in which machines make us do tricks to prove that we are humans! The strangest aspect of this unparalleled shift is how under-discussed it has been. The metaphor of the boiling frog comes to mind. Have we become so subtly conditioned by digital technology that we don''t see what''s been happening to us? Have we been conditioned to accept a world governed by "smart" tech, trading convenience to the point where we become a bit like machines ourselves? In a recent startling and thoughtful book, two scholars — Brett Frischmann, a law professor, and Evan Selinger, a philosopher — argue that the answer to that question is "yes". And they''re right. There''s nothing technophobic(技术恐惧的) about that. We shape our tools and then our tools shape us. Technology is supposed to provide tools that serve human ends. But, as the machine-learning Captcha demonstrates, a significant proportion of digital tech now sees (and uses) humans as means to ends that are not ours. In the process, they reduce us to the status of cheery rats running on treadmills(踏车) designed by people who do not have our interests at heart. So back to the frog metaphor. Are we smart enough to jump out before it''s too late? You don''t even have to Google it to know the answer.', NULL, NULL, 451, 'IMPORT', 'cet6-2025-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-3-r4'
);
SET @pg_cet6_2025_12_3_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-12-3-r4' LIMIT 1);

-- 翻译 cet6-2025-12-3
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-translation'
);
SET @q_cet6_2025_12_3_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_01, '节俭 (frugality) 是中华民族的传统美德。在中国古代，生产力低下，先人们深知劳动成果来之不易，因而秉持节俭的理念。到了物质极大丰富的今天，中国人民依然坚持节俭的生活方式，体现了理性消费的生活理念和对劳动的尊重。近年来，中国政府持续加强节约型社会的建设，倡导"光盘行动"，减少食物浪费，提倡简约低碳的生活方式，推进资源循环利用，反对过度消费。节约型社会的建设有力地推动了中国经济的高质量发展。', NULL, 'Frugality is a traditional virtue of the Chinese nation. In ancient China, productivity was low, and our ancestors knew well that the fruits of labor did not come easily, so they upheld the idea of frugality. Today, when material wealth is abundant, the Chinese people still maintain a frugal lifestyle, reflecting their concept of rational consumption and their respect for labor. In recent years, the Chinese government has been strengthening the building of a resource-conserving society by advocating the "Clear Your Plate" campaign to reduce food waste, promoting a simple and low-carbon lifestyle, advancing the recycling of resources, and opposing excessive consumption. This building of a resource-conserving society has strongly promoted the high-quality development of China''s economy.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_01
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q26'
);
SET @q_cet6_2025_12_3_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_02, NULL, '{"A":"A) affix","B":"B) correlate","C":"C) deviate","D":"D) domains","E":"E) influential","F":"F) inherently","G":"G) laymen","H":"H) multiple","I":"I) properties","J":"J) reality","K":"K) reciprocally","L":"L) specimen","M":"M) spectrum","N":"N) synonym","O":"O) unanimous"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_02
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q27'
);
SET @q_cet6_2025_12_3_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_03, NULL, '{"A":"A) affix","B":"B) correlate","C":"C) deviate","D":"D) domains","E":"E) influential","F":"F) inherently","G":"G) laymen","H":"H) multiple","I":"I) properties","J":"J) reality","K":"K) reciprocally","L":"L) specimen","M":"M) spectrum","N":"N) synonym","O":"O) unanimous"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_03
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q28'
);
SET @q_cet6_2025_12_3_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_04, NULL, '{"A":"A) affix","B":"B) correlate","C":"C) deviate","D":"D) domains","E":"E) influential","F":"F) inherently","G":"G) laymen","H":"H) multiple","I":"I) properties","J":"J) reality","K":"K) reciprocally","L":"L) specimen","M":"M) spectrum","N":"N) synonym","O":"O) unanimous"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_04
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q29'
);
SET @q_cet6_2025_12_3_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_05, NULL, '{"A":"A) affix","B":"B) correlate","C":"C) deviate","D":"D) domains","E":"E) influential","F":"F) inherently","G":"G) laymen","H":"H) multiple","I":"I) properties","J":"J) reality","K":"K) reciprocally","L":"L) specimen","M":"M) spectrum","N":"N) synonym","O":"O) unanimous"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_05
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q30'
);
SET @q_cet6_2025_12_3_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_06, NULL, '{"A":"A) affix","B":"B) correlate","C":"C) deviate","D":"D) domains","E":"E) influential","F":"F) inherently","G":"G) laymen","H":"H) multiple","I":"I) properties","J":"J) reality","K":"K) reciprocally","L":"L) specimen","M":"M) spectrum","N":"N) synonym","O":"O) unanimous"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_06
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q31'
);
SET @q_cet6_2025_12_3_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_07, NULL, '{"A":"A) affix","B":"B) correlate","C":"C) deviate","D":"D) domains","E":"E) influential","F":"F) inherently","G":"G) laymen","H":"H) multiple","I":"I) properties","J":"J) reality","K":"K) reciprocally","L":"L) specimen","M":"M) spectrum","N":"N) synonym","O":"O) unanimous"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_07
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q32'
);
SET @q_cet6_2025_12_3_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_08, NULL, '{"A":"A) affix","B":"B) correlate","C":"C) deviate","D":"D) domains","E":"E) influential","F":"F) inherently","G":"G) laymen","H":"H) multiple","I":"I) properties","J":"J) reality","K":"K) reciprocally","L":"L) specimen","M":"M) spectrum","N":"N) synonym","O":"O) unanimous"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_08
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q33'
);
SET @q_cet6_2025_12_3_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_09, NULL, '{"A":"A) affix","B":"B) correlate","C":"C) deviate","D":"D) domains","E":"E) influential","F":"F) inherently","G":"G) laymen","H":"H) multiple","I":"I) properties","J":"J) reality","K":"K) reciprocally","L":"L) specimen","M":"M) spectrum","N":"N) synonym","O":"O) unanimous"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_09
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q34'
);
SET @q_cet6_2025_12_3_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_10, NULL, '{"A":"A) affix","B":"B) correlate","C":"C) deviate","D":"D) domains","E":"E) influential","F":"F) inherently","G":"G) laymen","H":"H) multiple","I":"I) properties","J":"J) reality","K":"K) reciprocally","L":"L) specimen","M":"M) spectrum","N":"N) synonym","O":"O) unanimous"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_10
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q35'
);
SET @q_cet6_2025_12_3_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_11, NULL, '{"A":"A) affix","B":"B) correlate","C":"C) deviate","D":"D) domains","E":"E) influential","F":"F) inherently","G":"G) laymen","H":"H) multiple","I":"I) properties","J":"J) reality","K":"K) reciprocally","L":"L) specimen","M":"M) spectrum","N":"N) synonym","O":"O) unanimous"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_11
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q36'
);
SET @q_cet6_2025_12_3_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_12, 'Upon seeing a flashing yellow arrow, a driver should let pedestrians and traffic pass first before taking the turn.', NULL, 'Q', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_12
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q37'
);
SET @q_cet6_2025_12_3_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_13, 'The red and green automatic traffic light system originated in an American city.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_13
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q38'
);
SET @q_cet6_2025_12_3_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_14, 'Residents of an American city tend to share the opinion that time saved on the road justifies the cost of upgrading its traffic light system.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_14
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q39'
);
SET @q_cet6_2025_12_3_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_15, 'Mass production of cars made it possible for ordinary people to buy them.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_15
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q40'
);
SET @q_cet6_2025_12_3_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_16, 'What a traffic light means is almost the same everywhere despite some variations.', NULL, 'R', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_16
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q41'
);
SET @q_cet6_2025_12_3_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_17, 'Pedestrian crossings came into being only in the mid-twentieth century.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_17
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q42'
);
SET @q_cet6_2025_12_3_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_18, 'People raced to address increasing traffic problems along with the expansion of cities and traffic.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_18
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q43'
);
SET @q_cet6_2025_12_3_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_19, 'When the warning yellow light was introduced, driving became safer and traffic accidents reduced.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_19
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q44'
);
SET @q_cet6_2025_12_3_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_20, 'The signal system on the railroad served as the basis for the first traffic light.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_20
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q45'
);
SET @q_cet6_2025_12_3_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_21, 'Even though a green light signals "go", attention should be paid to traffic on either side in case some driver is being careless or ignoring a red light.', NULL, 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_21
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q46'
);
SET @q_cet6_2025_12_3_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_22, 'What do we learn from the passage about practicing mindfulness?', '{"A":"A) It triggers our mind to reflect on past experiences or anticipate future events.","B":"B) It focuses our attention on the present moment without making judgments.","C":"C) It concentrates our mind on our personal feelings, happy or scary.","D":"D) It helps our mind to stay calm when facing judgments from others."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_22
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q47'
);
SET @q_cet6_2025_12_3_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_23, 'What do we see in today''s "attention economy" according to Jenny Odell?', '{"A":"A) Focus on technological advances continuously updates products and services.","B":"B) People''s attention is turned into something that can be bought and sold.","C":"C) Businesses profit from selling mobile phones and revolutionizing social media.","D":"D) People tend to purchase products and services without careful thinking."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_23
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q48'
);
SET @q_cet6_2025_12_3_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_24, 'What happens with the prevalent use of mobile phones or social media?', '{"A":"A) They keep distracting users from the here and now.","B":"B) They render users incapable of resisting temptation.","C":"C) They rob users of their ability to observe experience.","D":"D) They tempt users to endorse the attention economy."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_24
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q49'
);
SET @q_cet6_2025_12_3_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_25, 'What benefit can practicing mindfulness bring to us according to some scholars?', '{"A":"A) It prevents us from making arbitrary judgments about others.","B":"B) It shifts our attention from material things to spiritual pursuits.","C":"C) It is conducive to our forging better interpersonal relationships.","D":"D) It is helpful in regaining our ability to enjoy what we have in life."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_25
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q50'
);
SET @q_cet6_2025_12_3_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_26, 'What does the author suggest we do in another person''s presence?', '{"A":"A) Share each other''s experience frankly and compassionately.","B":"B) Pay full attention to establishing close relationships with them.","C":"C) Be attentive listeners while refraining from making judgments.","D":"D) Remind them of the distraction from mobile phones and social media."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_26
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q51'
);
SET @q_cet6_2025_12_3_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_27, 'How did the author respond to the Captcha test?', '{"A":"A) He clicked on the cells randomly.","B":"B) He accepted the challenge readily.","C":"C) He completed it confidently.","D":"D) He worked on it submissively."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_27
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q52'
);
SET @q_cet6_2025_12_3_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_28, 'What is ironic about the Captcha test?', '{"A":"A) A machine can respond to the test as well as humans do.","B":"B) A machine can outperform humans in object identification.","C":"C) A test designed to test machines is now used by machines to test humans.","D":"D) A test conceived to tell a human from a robot can now do tricks humans can''t."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_28
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q53'
);
SET @q_cet6_2025_12_3_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_29, 'Why does the author use the metaphor of the boiling frog?', '{"A":"A) To show that humans are unwilling to trade convenience for control by smart tech.","B":"B) To show that humans are unaware of the potential danger brought by smart tech.","C":"C) To question whether humans are conditioned to accept digital tech.","D":"D) To question whether humans are as vulnerable as the boiling frog."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_29
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q54'
);
SET @q_cet6_2025_12_3_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_30, 'Why does the author think that Brett Frischmann and Evan Selinger are right?', '{"A":"A) A large part of digital tech is now making use of humans to meet its own ends.","B":"B) Humans are now fast locked in a race against digital tech to control the world.","C":"C) Digital tech can serve human needs in ways previously thought impossible.","D":"D) Digital tech is now doing thinking while humans are doing repetitive work."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_30
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-12-3-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q55'
);
SET @q_cet6_2025_12_3_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-12-3-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_12_3_31, 'What does the author imply by asking "Are we smart enough to jump out before it''s too late?" at the end of the passage?', '{"A":"A) It is not sensible to expect digital tech to take humans'' interest to heart.","B":"B) It is hard to say whether technology or humans will get the upper hand.","C":"C) We may have to search the web to get the answer to the question.","D":"D) We may not awake in time to the danger digital tech poses to us."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_12_3_31
);

-- ==================== cet6-2026-06-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-r1', 'BANKED_CLOZE', 'CET6', NULL, 'Two proposals are before the state legislature that look to put some limits on ever-increasing rent prices, which some lawmakers say are contributing to rising homelessness rates. The proposals __26__ caps on rent increases, preventing landlords in the state from raising rent more than the rate of inflation in most cases. There are exceptions for buildings less than 10 years old, public housing, improvements beyond maintenance, and a hardship __27__ . In a 2020 study, researchers at the U.S. Government Accountability Office estimated that every $100 in rent increase is __28__ to a 9% rise in homelessness. Rent increases have an even more detrimental effect on some demographic groups, such as racial minorities. Representative Alex Ramel explained why he thought that this kind of legislation was so important, telling the story of a __29__ struggling to live in the community. Ramel pointed out the __30__ effect of double-digit rent increases, saying that he made the decision to introduce the legislation while talking to a young man in Bellingham. "He''s a recent graduate from Western Washington University and just got a new job," Ramel said. "He was leaving our community because his landlord __31__ him that his rent was going to go up by $600 a month." The Rental Housing Association of Washington opposes the legislation. The association __32__ that the policy won''t actually solve the problem of rental prices. Instead, it will punish small landlords and allow wealthy renters easy access to cheap housing. "The rent control policy has failed everywhere it has been __33__ in this county. It has not fixed one housing problem __34__ . It also does not distinguish between rich and poor when __35__ who gets the benefits of rent control," said Chester Baldwin with the Rental Housing Coalition.', NULL, '["A) anywhere","B) asserts","C) constituent","D) correlated","E) determining","F) devastating","G) enacted","H) entails","I) exemption","J) impose","K) notified","L) notwithstanding","M) presume","N) rehabilitation","O) reproaching"]', 293, 'IMPORT', 'cet6-2026-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-1-r1'
);
SET @pg_cet6_2026_06_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-r2', 'MATCHING', 'CET6', 'Meet the "digital nomads" who travel the world in search of fast Wi-Fi', 'A) For those "citizens of the world", the office can be anything from a beach hut in Brisbane to a Starbucks in Seattle, thanks to the growing prevalence of remote-based work. But roaming the globe from café to café is not without its challenges. B) When the average traveller lands in a city like Bangkok, Berlin, or Buenos Aires, their first step might be to drop their bags at their hotel and to log on to TripAdvisor to find out the hours of a popular tourist attraction or the best rooftop bar for happy hour. C) But people like Pieter Levels are not your average traveller. A Dutch website developer, Levels has been living and working nomadically(像游牧民那样) in places like Singapore, Hong Kong, Tokyo and Manila for two years. With just a carry-on backpack, he chooses his location at will, based on a variety of factors—Wi- Fi speed, average temperature, exotic food and cost of living—that have little bearing on the work he actually does. D) Somewhere in his nomadic journey, Levels noticed that there was a growing need to create an online infrastructure for people like himself. That''s when he created #nomads, a membership-based chat system which runs on the team communication platform known as Slack. The channel allows users to ask people in their current city the types of practical questions that a tourist would unlikely need to ask. E) Members of the geographically dispersed subculture that Levels is a part of call themselves "digital nomads". They are borderless, mostly self-employed remote workers who interact with cities in a way that''s entirely different from a tourist, but still doesn''t quite reach the status of resident. A relatively new phenomenon, there are no hard statistics on the prevalence of digital nomads or location independent workers. But thanks to the growing prevalence of freelance(自由职业的) livelihoods, a global sharing economy and numerous digital tools, the number of people who are able to live this life is growing quickly. And in a rapidly urbanising world, where a major city in Asia increasingly offers the same comforts as one in Europe, many people are reaching the realisation they don''t need to stay in one place. F) So how does a nomad differ from a tourist or resident? In many ways, Levels says, you can think of a digital nomad like a "short-term independent expat(移居国外的人)". Unlike a resident expat, they don''t work for a large multinational company in an air conditioned office building and they generally enter a country on a tourist visa, simply renewing or moving on when it expires. But unlike a tourist, they don''t arrive in a foreign city without any responsibilities. Travel isn''t necessarily required for them to do their jobs, but neither is staying in one place. G) Janet Brent is an independent ebook designer. She says many people she knows assume she travels for work, but in reality her international destinations are largely up to her, and driven by cost. "Contrary to what some people might think, I don''t get paid to travel—I simply choose the lifestyle. Rather than rent in one given city, I choose to travel and do short-term, temporary stays around the world, and my travel decisions are literally based on what makes the most sense financially for me," Brent said. "It''s completely different from vacationing—you really sink into the city life and get your feet wet in the communities." H) Bryce Adams is another such nomad. He works as a developer for a South African company WooThemes, which has a workforce that''s more than 80% remote-based. Though Adams frequently posts pictures on Instagram of his enviable cooking adventures from Seoul to Bangkok, he says nomad life in foreign cities has its downsides, including finding adequate Wi-Fi for the bandwidth-hungry work his livelihood depends on. Contrary to the perception that he works under a mango tree in a tropical haven, Adams says the reality of this life means that he often ends up staying in more western style places in globalised cities—ones that are sure to have air conditioning and a decent connection—rather than exotic beachfront cafés. I) "A fellow nomad posted quite a funny but honest message on Twitter a few days ago that stuck with me: ''It''s funny that digital nomads spend 16 hours to fly to the other side of the world to sit in Starbucks,'' and it''s completely true," Adams said. "When you''re a digital nomad, you don''t actually have as much freedom as most people think you do. We have deadlines, we all have people relying on us and a mouth (or two) that needs to be fed. It''s nice to be able to work anywhere in the world but it''s not without its challenges." J) But these challenges can often provide an opportunity for nomads to see a side of a city they may not have if they were staying in a luxury hotel for a long weekend. However inconvenient, a trip to a local doctor, immigration office or laundry—or a conflict with a local Airbnb host (the accommodation style of choice for most nomads)—can be far more culturally instructive than a trip to the national museum. And because nomads often have to stay where the strongest internet connection is, they tend to spend more time in developing cities compared to the average tourist, who often flees to more touristy destinations soon after landing at the airport. K) The nomad life is, by all accounts, one built out of privilege. You not only need a relatively powerful passport that makes tourist visas easy to attain, but also a knowledge economy job and access to the technology and devices that make remote working possible. But nomads like Adams say that while they are aware of this privilege, they believe living this way elevates what they''re able to offer, by giving them a broader perspective on what they''re building, writing, or designing and expanding their world view. L) "Being able to travel and get around makes it easy to stay inspired," he added. "I truly believe that it makes me a more sensible human being, as I tend to see and appreciate the creative solutions people come up with in other parts of the world, even though many tend to have far more constraints than we have at home." M) So when you''re constantly on the road and don''t own any property or have a fixed address, which city do you call home? It''s no surprise that many nomads are dual citizens or "third culture kids," who have grown up with a notion of identity that''s not tied to nationalism or staying in one place. Levels says that the nomad life has not only changed his notions of citizenship, but the people he chooses to spend time with as well. "Saying you''re a ''citizen of the world'' is a super cliché, right? But it''s becoming quite true," Levels said. "This global awareness has been the reason I started Nomad List and it''s affected who my friends are. It''s normal to have dinner now and sit with a Korean girl, a British-Singaporean guy, a Mexican girl and a Nigerian guy. As much as that sounds like a politically correct TV advertisement, it''s great that that''s the time we''re in now."', NULL, NULL, 1208, 'IMPORT', 'cet6-2026-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-1-r2'
);
SET @pg_cet6_2026_06_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-r3', 'CAREFUL_READING', 'CET6', NULL, 'Children''s use of social media is a problem. That doesn''t mean it should be stopped. While younger children should not be on platforms where 13 is the minimum age, it is neither practical nor desirable to imagine a world in which teenagers are prevented from accessing the platforms and messaging systems that the adults around them use to organise their lives. But the pleasure and stimulation that people of all ages find on their screens and smartphones must not blind us to the harm that spending time in this way can cause. The finding that the alarmingly high rate of depression in British teenage girls is closely correlated to time spent on social media is extremely concerning. Research found that two in five girls are on social media for at least three hours a day—with half as many boys engaged to the same extent. More than a third of depressed girls have experienced online harassment. About half of affected girls suffered disrupted sleep, compared with 20% of depressed boys. Although the research does not prove that social media causes depression, the importance of the finding that there is a connection should not be underestimated. Schools have done important work in communicating key messages about the risks of online abuse. But when it comes to broader questions about "screen time", many professionals as well as parents are confused and uncertain. The health secretary, Matt Hancock, wants official guidelines on time and age limits. This idea has the virtue of simplicity, though some experts question its effects and call for a greater degree of differentiation, arguing that time online by itself is not a bad thing and it all depends on what you are doing. Also due this year is information commissioner Elizabeth Denham''s Age Appropriate Design Code, covering the use of children''s personal data. Both initiatives are welcome. But the government is playing catch-up. Statutory regulation of the digital media giants is long overdue. The failure to protect children from data harvesting and targeted advertising thus far is as shocking as the lack of concern shown by the companies themselves with regard to children''s psychological health. Of course, social media companies are not the source of all our ills, and can offer a too-easy target for politicians keen to divert attention from inadequately resourced schools and health services. There are other reasons for the rising incidence of depression in young people, with increasing pressure to succeed in education and in life more broadly—to be famous, beautiful, rich—often cited as a source of unhappiness or anxiety which can, if aggravated by other factors and not managed, tip into ill health. Safeguarding means more than the avoidance of physical threat.', NULL, NULL, 447, 'IMPORT', 'cet6-2026-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-1-r3'
);
SET @pg_cet6_2026_06_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-r4', 'CAREFUL_READING', 'CET6', NULL, 'About a decade ago, the G-20, a forum of the world''s biggest economies, agreed to crack down on multinational corporations'' abusive use of tax havens. This resulted in a plan that aimed to curb practices that shielded a large chunk of corporate profits from tax authorities. But, instead of reining in the use of tax havens—countries such as the Bahamas and Cayman Islands with very low or no effective tax rates—the problem has only gotten worse. In a new study, we measured the excessive profits reported in tax havens that cannot be explained by ordinary economic activity such as employees, factories and research in that country. Our findings show a striking pattern of artificial shifting of paper profits to tax havens by corporations, which has been relentless since the 1980s. We found that the world''s biggest multinational businesses shifted 37% of the profits—$969 billion—they earned in other countries to tax havens in 2019. The figure was less than 2% in the 1970s. The main reasons for the large increase were the growth of the tax avoidance industry in the 1980s and U.S. policies that made it easier to shift profits from high-tax countries to tax havens. We estimate that the amount of corporate taxes lost as a result reached 10% of total corporate revenue in 2019, up from less than 0.1% in the 1970s. In 2019, the total government tax loss globally was $250 billion. U.S. multinational corporations alone accounted for about half of that, followed by the U.K. and Germany. How do policymakers fix this? So far, the world as a whole has been trying to solve this problem by cutting or scrapping corporate taxes in a very gradual way. In the past 40 years, the global effective corporate tax rate has fallen from 23% to 17%. At the same time, governments have relied more heavily on consumption taxes. But the root cause of profit-shifting is the incentives involved, such as generous or lenient corporate tax rates in other countries. If countries could agree on a global minimum corporate tax rate of, say, 20%, the problem of profit-shifting would largely disappear, as tax havens would simply cease to exist. This type of mechanism is exactly what more than 130 countries signed onto in 2021, with implementation of a 15% minimum tax set to begin soon in the EU, U.K., Japan, Indonesia and many other countries. The U.S. has notably not been able to pass this legislation. Our research suggests implementing this type of tax reform is necessary in reversing the shift of ever-greater amounts of corporate profits to tax havens—instead of being taxed by the governments where they operate and create value.', NULL, NULL, 443, 'IMPORT', 'cet6-2026-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-1-r4'
);
SET @pg_cet6_2026_06_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-1-r4' LIMIT 1);

-- 翻译 cet6-2026-06-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-translation'
);
SET @q_cet6_2026_06_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_01, '科技进步使中国的医疗事业得到快速发展。近年来，远程医疗使优质医疗资源惠及更多患者。医学专家可以通过视频为偏远地区患者提供咨询，指导当地医生制定并实施治疗方案。人工智能辅助诊 断系统帮助医生识别患者的早期症状，提高诊断准确率。电子健康档案的普及让医生能够快速了解患 者病史，避免重复检查。线上医疗咨询平台极大地方便了患者就诊。科技与医疗的深度融合更好地满足了人民的健康需求。', NULL, 'Advances in science and technology have brought about the rapid development of China''s medical services. In recent years, telemedicine has made high-quality medical resources accessible to more patients. Through video links, medical experts can provide consultations for patients in remote areas, guiding local doctors in developing and implementing treatment plans. AI-assisted diagnosis systems help doctors identify patients'' early symptoms, thereby improving the accuracy of diagnosis. The widespread adoption of electronic health records enables doctors to quickly review patients'' medical histories, thus avoiding repeated examinations. Online medical consultation platforms have also greatly facilitated patients'' access to medical care. Overall, the deep integration of technology and healthcare has better met people''s health needs.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_01
);

-- 听力 Q1 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q01', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q01'
);
SET @q_cet6_2026_06_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_02, NULL, '{"A":"A) How to run one''s business successfully.","B":"B) How to make progress in one''s career.","C":"C) Why few people can fully display their capabilities.","D":"D) Why young people seldom get the expected promotion."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_02
);

-- 听力 Q2 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q02', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q02'
);
SET @q_cet6_2026_06_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_03, NULL, '{"A":"A) To mix and interact with peers within the organization.","B":"B) To restrict their connections exclusively to colleagues.","C":"C) To limit communication only to their superiors.","D":"D) To underestimate their role in the company."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_03
);

-- 听力 Q3 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q03', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q03'
);
SET @q_cet6_2026_06_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_04, NULL, '{"A":"A) Put in quality time.","B":"B) Connect with managers.","C":"C) Make greater efforts.","D":"D) Demonstrate final results."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_04
);

-- 听力 Q4 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q04', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q04'
);
SET @q_cet6_2026_06_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_05, NULL, '{"A":"A) To show their genius.","B":"B) To gain due respect.","C":"C) To guard against humiliation.","D":"D) To avoid appearing arrogant."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_05
);

-- 听力 Q5 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q05', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q05'
);
SET @q_cet6_2026_06_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_06, NULL, '{"A":"A) Decide how to divide up the presentation tasks.","B":"B) Investigate the available background research.","C":"C) Complete the project design together.","D":"D) Find a suitable topic for their article."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_06
);

-- 听力 Q6 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q06', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q06'
);
SET @q_cet6_2026_06_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_07, NULL, '{"A":"A) He wants to devote his time to other portions.","B":"B) He believes the woman is better able to handle it.","C":"C) He claims to have done most of the work already.","D":"D) He finds the woman more meticulous about details."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_07
);

-- 听力 Q7 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q07', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q07'
);
SET @q_cet6_2026_06_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_08, NULL, '{"A":"A) Questioning.","B":"B) Complaining.","C":"C) Arguing.","D":"D) Worrying."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q08', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q08'
);
SET @q_cet6_2026_06_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_09, NULL, '{"A":"A) To avoid sounding monotonous to the listeners.","B":"B) To make the division of labor more reasonable.","C":"C) To keep himself from being overburdened.","D":"D) To bring their capabilities fully into play."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_09
);

-- 听力 Q9 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q09', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q09'
);
SET @q_cet6_2026_06_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_10, NULL, '{"A":"A) Alter others'' perceptions of the wearer.","B":"B) Win others'' admiration for the wearer.","C":"C) Enhance the wearer''s confidence.","D":"D) Change the wearer''s appearance."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_10
);

-- 听力 Q10 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q10', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q10'
);
SET @q_cet6_2026_06_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_11, NULL, '{"A":"A) As being a greater threat.","B":"B) As being of higher prestige.","C":"C) As being more dominant.","D":"D) As being more attractive."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_11
);

-- 听力 Q11 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q11', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q11'
);
SET @q_cet6_2026_06_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_12, NULL, '{"A":"A) It might influence her way of introducing herself.","B":"B) It might impact her dressing style for the occasion.","C":"C) It might affect her decision on applying cosmetics.","D":"D) It might sway her view on the interviewers'' questions."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_12
);

-- 听力 Q12 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q12', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q12'
);
SET @q_cet6_2026_06_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_13, NULL, '{"A":"A) Those involving no self-recognition.","B":"B) Those forcing us to clench our teeth.","C":"C) Those resisting various temptations.","D":"D) Those requiring no willpower at all."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_13
);

-- 听力 Q13 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q13', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q13'
);
SET @q_cet6_2026_06_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_14, NULL, '{"A":"A) Regulating one''s actions for the sake of good health.","B":"B) Controlling one''s actions with a motivating thought.","C":"C) Using practical examples to guide one''s behavior.","D":"D) Denying oneself any comfort to prevent diseases."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_14
);

-- 听力 Q14 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q14', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q14'
);
SET @q_cet6_2026_06_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_15, NULL, '{"A":"A) It equips us with an expert skill.","B":"B) It exerts an enduring force on us.","C":"C) It leads to a burning goal.","D":"D) It begins with a bright idea."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_15
);

-- 听力 Q15 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q15', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q15'
);
SET @q_cet6_2026_06_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_16, NULL, '{"A":"A) Any cherished goal.","B":"B) Any positive mindset.","C":"C) Any personal instinct.","D":"D) Any valued role model."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_16
);

-- 听力 Q16 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q16', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q16'
);
SET @q_cet6_2026_06_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_17, NULL, '{"A":"A) It has long been criticized as unclear.","B":"B) It has long been ignored by the public.","C":"C) It has caused much panic among women.","D":"D) It has resulted in different understandings."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_17
);

-- 听力 Q17 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q17', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q17'
);
SET @q_cet6_2026_06_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_18, NULL, '{"A":"A) It warned consumers not to eat fish from the Gulf of Mexico.","B":"B) It called on expectant mothers to pay attention to food safety.","C":"C) It issued an update to the advice on seafood consumption.","D":"D) It listed more than sixty species of fish as \\"choices to avoid\\"."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_18
);

-- 听力 Q18 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q18', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q18'
);
SET @q_cet6_2026_06_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_19, NULL, '{"A":"A) The impact of the FDA''s analysis.","B":"B) Multiple factors including mercury.","C":"C) Critics'' conclusions.","D":"D) The prices of seafood."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_19
);

-- 听力 Q19 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q19', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q19'
);
SET @q_cet6_2026_06_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_20, NULL, '{"A":"A) They will suffer a breakdown soon.","B":"B) They will be losing both joy and life.","C":"C) They will be putting themselves and family at risk.","D":"D) They will make things worse for people around them."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_20
);

-- 听力 Q20 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q20', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q20'
);
SET @q_cet6_2026_06_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_21, NULL, '{"A":"A) Spend 14 days for vacation every year.","B":"B) Aim for three separate vacations yearly.","C":"C) Space out their vacations evenly instead of taking one long vacation.","D":"D) Use all their days off for a long summer break to achieve full-on calm."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_21
);

-- 听力 Q21 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q21', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q21'
);
SET @q_cet6_2026_06_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_22, NULL, '{"A":"A) Expecting to have more vacations in a year will boost one''s work efficiency.","B":"B) Anticipating more vacations would reduce one''s feelings of despair at work.","C":"C) Taking more than three vacations yearly would prolong one''s excitement.","D":"D) Planning multiple breaks throughout the year will add to one''s happiness."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_22
);

-- 听力 Q22 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q22', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q22'
);
SET @q_cet6_2026_06_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_23, NULL, '{"A":"A) Surveying when drivers are caught in the heat of arguments.","B":"B) Designing devices to prevent drivers from being distracted.","C":"C) Testing models for monitoring drivers easily getting tired.","D":"D) Developing sensor-based systems for autonomous vehicles."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_23
);

-- 听力 Q23 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q23', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q23'
);
SET @q_cet6_2026_06_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_24, NULL, '{"A":"A) Make sure the autonomous vehicle operates in the simplest manner.","B":"B) Ensure the transition from the driver to the vehicle is safely made.","C":"C) Alleviate the driver''s pressure as much as possible.","D":"D) Record the driver''s state as accurately as possible."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_24
);

-- 听力 Q24 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q24', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q24'
);
SET @q_cet6_2026_06_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_25, NULL, '{"A":"A) Driver fatigue.","B":"B) Dreadful traffic.","C":"C) Drunk driving.","D":"D) Driving time."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_25
);

-- 听力 Q25 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q25', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q25'
);
SET @q_cet6_2026_06_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_26, NULL, '{"A":"A) There has been a strong debate on the feasibility of Level 3 cars.","B":"B) There have been few remarkable advances in auto technology.","C":"C) There has been a rise in attention-grabbing accidents recently.","D":"D) There have been few feasible ways to shift public sentiment."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q26'
);
SET @q_cet6_2026_06_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_27, NULL, '{"A":"A) anywhere","B":"B) asserts","C":"C) constituent","D":"D) correlated","E":"E) determining","F":"F) devastating","G":"G) enacted","H":"H) entails","I":"I) exemption","J":"J) impose","K":"K) notified","L":"L) notwithstanding","M":"M) presume","N":"N) rehabilitation","O":"O) reproaching"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q27'
);
SET @q_cet6_2026_06_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_28, NULL, '{"A":"A) anywhere","B":"B) asserts","C":"C) constituent","D":"D) correlated","E":"E) determining","F":"F) devastating","G":"G) enacted","H":"H) entails","I":"I) exemption","J":"J) impose","K":"K) notified","L":"L) notwithstanding","M":"M) presume","N":"N) rehabilitation","O":"O) reproaching"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q28'
);
SET @q_cet6_2026_06_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_29, NULL, '{"A":"A) anywhere","B":"B) asserts","C":"C) constituent","D":"D) correlated","E":"E) determining","F":"F) devastating","G":"G) enacted","H":"H) entails","I":"I) exemption","J":"J) impose","K":"K) notified","L":"L) notwithstanding","M":"M) presume","N":"N) rehabilitation","O":"O) reproaching"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q29'
);
SET @q_cet6_2026_06_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_30, NULL, '{"A":"A) anywhere","B":"B) asserts","C":"C) constituent","D":"D) correlated","E":"E) determining","F":"F) devastating","G":"G) enacted","H":"H) entails","I":"I) exemption","J":"J) impose","K":"K) notified","L":"L) notwithstanding","M":"M) presume","N":"N) rehabilitation","O":"O) reproaching"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q30'
);
SET @q_cet6_2026_06_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_31, NULL, '{"A":"A) anywhere","B":"B) asserts","C":"C) constituent","D":"D) correlated","E":"E) determining","F":"F) devastating","G":"G) enacted","H":"H) entails","I":"I) exemption","J":"J) impose","K":"K) notified","L":"L) notwithstanding","M":"M) presume","N":"N) rehabilitation","O":"O) reproaching"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q31'
);
SET @q_cet6_2026_06_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_32, NULL, '{"A":"A) anywhere","B":"B) asserts","C":"C) constituent","D":"D) correlated","E":"E) determining","F":"F) devastating","G":"G) enacted","H":"H) entails","I":"I) exemption","J":"J) impose","K":"K) notified","L":"L) notwithstanding","M":"M) presume","N":"N) rehabilitation","O":"O) reproaching"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q32'
);
SET @q_cet6_2026_06_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_33, NULL, '{"A":"A) anywhere","B":"B) asserts","C":"C) constituent","D":"D) correlated","E":"E) determining","F":"F) devastating","G":"G) enacted","H":"H) entails","I":"I) exemption","J":"J) impose","K":"K) notified","L":"L) notwithstanding","M":"M) presume","N":"N) rehabilitation","O":"O) reproaching"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q33'
);
SET @q_cet6_2026_06_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_34, NULL, '{"A":"A) anywhere","B":"B) asserts","C":"C) constituent","D":"D) correlated","E":"E) determining","F":"F) devastating","G":"G) enacted","H":"H) entails","I":"I) exemption","J":"J) impose","K":"K) notified","L":"L) notwithstanding","M":"M) presume","N":"N) rehabilitation","O":"O) reproaching"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q34'
);
SET @q_cet6_2026_06_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_35, NULL, '{"A":"A) anywhere","B":"B) asserts","C":"C) constituent","D":"D) correlated","E":"E) determining","F":"F) devastating","G":"G) enacted","H":"H) entails","I":"I) exemption","J":"J) impose","K":"K) notified","L":"L) notwithstanding","M":"M) presume","N":"N) rehabilitation","O":"O) reproaching"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q35'
);
SET @q_cet6_2026_06_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_36, NULL, '{"A":"A) anywhere","B":"B) asserts","C":"C) constituent","D":"D) correlated","E":"E) determining","F":"F) devastating","G":"G) enacted","H":"H) entails","I":"I) exemption","J":"J) impose","K":"K) notified","L":"L) notwithstanding","M":"M) presume","N":"N) rehabilitation","O":"O) reproaching"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q36'
);
SET @q_cet6_2026_06_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_37, 'Pieter Levels created a chat system to satisfy the need of digital nomads for information tourists normally don''t seek.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q37'
);
SET @q_cet6_2026_06_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_38, 'It is said that digital nomads do not enjoy as much freedom as most people suppose.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q38'
);
SET @q_cet6_2026_06_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_39, 'Different from tourists, digital nomads travel to foreign places with work to do.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q39'
);
SET @q_cet6_2026_06_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_40, 'Digital nomads believe their lifestyle enables them to broaden their vision and do a better job.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q40'
);
SET @q_cet6_2026_06_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_41, 'The first thing a typical traveller possibly does after arriving at a city is search for information online about its popular tourist attractions.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q41'
);
SET @q_cet6_2026_06_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_42, 'One digital nomad thinks their life in foreign cities has its disadvantages.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q42'
);
SET @q_cet6_2026_06_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_43, 'Travelling around helps to keep digital nomads inspired.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q43'
);
SET @q_cet6_2026_06_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_44, 'The number of self-employed remote workers living a digital nomad''s life is fast increasing.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q44'
);
SET @q_cet6_2026_06_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_45, 'Pieter Levels says his life as a nomad has transformed not only his idea of citizenship, but his choice of companions.', NULL, 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q45'
);
SET @q_cet6_2026_06_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_46, 'Interactions with local people and institutions provide nomads with far more cultural information than a visit to the national museum.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q46'
);
SET @q_cet6_2026_06_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_47, 'What does the author believe regarding social media?', '{"A":"A) To stop children using it is unrealistic and inadvisable.","B":"B) It helps both adults and children to organise their lives.","C":"C) It poses problems to both parents and children.","D":"D) A world without it is really hard to imagine."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q47'
);
SET @q_cet6_2026_06_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_48, 'What do we learn from the passage about British teenage girls?', '{"A":"A) The more frequently they interact on social media, the more they experience harassment.","B":"B) The more time they spend on social media, the more likely they suffer from depression.","C":"C) Most of them are engaged on social media for at least three hours a day.","D":"D) They spend half as many hours on social media as British teenage boys."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q48'
);
SET @q_cet6_2026_06_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_49, 'What is the author''s view on the research finding about British teenage girls?', '{"A":"A) Its implications about online abuse are obvious.","B":"B) Its key message calls for immediate attention.","C":"C) Its importance should not be undervalued.","D":"D) Its uncertainty should not go unnoticed."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q49'
);
SET @q_cet6_2026_06_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_50, 'What do experts think of health secretary Matt Hancock''s idea?', '{"A":"A) Its implementation requires prompt action.","B":"B) It is a welcome initiative but is long overdue.","C":"C) Its success depends on how it is implemented.","D":"D) It is too simplistic to produce the desired effect."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q50'
);
SET @q_cet6_2026_06_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_51, 'Besides social media companies, what factors contribute to young people''s psychological health problems?', '{"A":"A) Poorly financed schools and health services.","B":"B) Politicians'' eagerness to divert public attention.","C":"C) Bad statutory regulation of digital media giants.","D":"D) Their parents'' educational background and life."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q51'
);
SET @q_cet6_2026_06_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_52, 'What do we learn about the G-20''s agreement on curbing the use of tax havens?', '{"A":"A) It has aggravated the problem in non-G-20 countries.","B":"B) It has taken a toll on countries such as Cayman Islands.","C":"C) It has failed to achieve the expected outcome.","D":"D) It has failed to result in any long-term plan."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q52'
);
SET @q_cet6_2026_06_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_53, 'What mainly accounted for the large increase in the world''s biggest multinational corporations'' shift of profits to tax havens?', '{"A":"A) Fluctuating tax rates globally.","B":"B) Lenient policies of the U.S.","C":"C) Heavy taxes imposed on them.","D":"D) Rapid growth of their business."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q53'
);
SET @q_cet6_2026_06_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_54, 'What have policymakers been doing to prevent government tax loss?', '{"A":"A) Reducing corporate taxes step by step.","B":"B) Scrapping consumption taxes gradually.","C":"C) Making joint efforts to levy corporate taxes.","D":"D) Adjusting global effective corporate tax rates."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q54'
);
SET @q_cet6_2026_06_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_55, 'What does the author say would bring tax havens to an end?', '{"A":"A) The alignment of corporate taxes with consumption taxes.","B":"B) The implementation of generous tax rates in all countries.","C":"C) The agreement on the root cause of global profit-shifting.","D":"D) The imposition of a global minimum corporate tax rate."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-1-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q55'
);
SET @q_cet6_2026_06_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_1_56, 'What could be expected of the global problem of profit-shifting in the near future?', '{"A":"A) It would be solved with more countries cutting tax rates.","B":"B) It would end with governments'' awareness of its severity.","C":"C) It would cease to exist with worldwide corporate support.","D":"D) It would continue because of noncooperation from the U.S."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_1_56
);

-- ==================== cet6-2026-06-2 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-r1', 'BANKED_CLOZE', 'CET6', NULL, 'Most financial crises have plenty in common: they tend to start in the banking sector and involve excessive borrowing, together with an asset bubble. The __26__ crisis of 2008 was no different, with the asset bubble focused on US real estate. But my research suggests this crisis had another __27__ cause—that some people in the banking sector were playing or "gaming" the system for their own financial gain. The game being played had several important features. The first was the deliberate complexity of the financial products at its core. Then there are the __28__ biases that permeate decision-making at all levels of the banking industry. Banking often attracts people with certain personality __29__ , including those who are overconfident and take excessive risks. Such people tend to like complexity for its own sake, but they often do not fully understand the __30__ of that complexity for the stability of the financial system as a whole. Often they do not care—they are primarily interested in gaming the system to __31__ their bonuses. The next element is risk. There are parts of the banking sector that will always be __32__ to risk, but many bankers have come to feel immune to its potential impact, because they __33__ that, however recklessly banks behave, governments will always be there to bail them out. Gaming in the banking sector seems virtually impossible to __34__ . The only effective measure to end it would be to make bankers __35__ liable for losses, but no government has ever passed such a law, and no single government could do so on its own, since this would immediately cause their entire national banking sector to move wholesale to another jurisdiction.', NULL, '["A) behavioural","B) eliminate","C) fragile","D) global","E) implications","F) maximise","G) overlapping","H) personally","I) presume","J) prone","K) prototypes","L) reassure","M) skeptically","N) traits","O) underlying"]', 281, 'IMPORT', 'cet6-2026-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-2-r1'
);
SET @pg_cet6_2026_06_2_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-2-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-r2', 'MATCHING', 'CET6', 'How do you bring a forest back to life?', 'A) Five hundred years ago, forests covered much of the Iberian peninsula. But that soon changed. Centuries of wars and invasions, agricultural expansion and woodcutting for firewood and shipping wiped out most of the woods and transformed places like Matamorisca, a small village in northern Spain, into degraded landscapes. B) The region''s dry climate and depleted soils would be a recipe for disaster in your average program to replant trees, but for the Amsterdam-based Land Life Company it''s an ideal place. "We typically operate where nature does not come back by itself," says Jurrian Ruys, its CEO. "We go where there are rougher conditions in terms of weather, with rough or very hot summers." In Matamorisca, they intervened in 17 barren hectares owned by the regional government and peppered them with their signature device: a biodegradable(可生物降 解的) cardboard container they call the cocoon which can hold 25 litres of water underground to aid a seedling''s first year. Around 16,000 trees, including oaks, ashes, walnuts, rowans, and whitebeams, were planted in May 2018, and the company reports that 96% of them survived that year''s burning hot summer without extra irrigation, a critical milestone for a young tree. C) "Does nature return by itself?" asks Arnout Asjes, Land Life Company''s chief technology officer, who oversees a mix of drone(无人机) and satellite imagery, big data analysis, soil enhancement, QR(二维码) tagging and site-specific tree configuration designs. "Probably, but it can take decades or hundreds of years, so we are speeding things up." D) His company belongs to a global movement of organisations trying to save degraded or deforested areas, ranging from fertile tropical lowlands to dry hills in temperate( 温带的) regions. Spurred by global biodiversity loss and climate change, these groups are pushing the boundary of how to revive forest cover. "It''s not a theoretical proposition," says Walter Vergara, a forest and climate specialist at the World Resources Institute(WRI). "It requires the right incentives, the right stakeholders, the right analysis and sufficient capital, but it can happen." E) How these factors come together for a particular project—and whether saving destroyed woods is even possible—depends on what kind of ecosystem you have in mind. Secondary forests in the Amazon are different from Texas pines recovering after wildfires or the Arctic timber woods that cover much of Sweden. Each provides different reasons for reforestation programs and each has particular needs. In the dry conditions around Matamorisca and similar areas in Spain, Land Life Company worries about rapid desertification(沙漠 化). As its focus is on restoring an ecosystem, it works with organisations that don''t expect their money back. F) With around 600 hectares replanted around the world since 2015 and another 1,100 planned for this year, the company''s drive fits into the Bonn Challenge, a global effort to restore 150 million hectares of the world''s deforested and degraded land by 2020. That''s an area roughly the size of Iran or Mongolia. By 2030, the goal is to reach 350 million hectares—20% more land than India. These targets include both the rehabilitation of forested areas that have lost density or look a bit weak (a process known as ''restoration'' in forestry jargon) and the recovery of forest cover in areas where it was completely cleared (what''s known as ''reforestation''). G) That global target is broken into smaller pieces and takes shape in Latin America as the 20x20 Initiative, an effort to contribute 20 million hectares to the overall goal by initiating small to medium projects with the political backing of governments. Unlike Land Life Company, this region-wide project makes the economic and business case for reforestation, even though they are after biodiversity conservation. "You need to bring in private sector money," says WRI''s Vergara, who leads the initiative, "and that capital needs to see a return on their investment." A study he led predicts Latin America would see an estimated net present value of about $23bn over a 50-year period if it reaches its goal. H) Money can come from timber sales in sustainably managed forests or from harvesting ''non-wood products'' like nuts, oils and fruits from the trees. You can take note of how much carbon dioxide your forest is capturing and sell carbon credits to companies keen to offset their emissions. Or you can even grow the forest hoping that biodiversity will attract ecotourists who''d pay for lodging, birdwatching tours and meals. I) Still, these backers are not your high-street bank. Money for the 20x20 Initiative comes mostly from financial organisations with triple goal—a modest return on their investment, environmental benefits and social gains— known as impact investors. Take the German fund 12Tree for instance, one of the 20x20 partners. It put $9.5 million into Cuango, a 1,455-hectare property on the Caribbean coast of Panama that combines a commercial cocoa tree plantation with timber extraction from a sustainably managed secondary forest. With their money, they reforested a former cattle ranch, provided high-quality jobs for the surrounding communities and made a return on their investment. J) Even on land cleared decades ago and currently used by farmers, some crops can coexist with the forest, if you find the right balance. Although not technically reforestation, agroforestry (a system of land use in which harvestable trees or shrubs are grown among or around crops or on pasture land, as a means of preserving or enhancing the productivity of the land) provides an opportunity for small-holder farmers to sustain their livelihoods while adding some forest cover to their farms. K) A global project called Breedcafs is studying how trees behave in coffee farms, hoping to find crop varieties that manage to grow under the shade of trees. Coffee grows naturally in such forests, so copying that in farms is taking the crop back to its roots. "By reintroducing trees in the landscape, we impact positively humidity, rain capture, soil conservation and biodiversity preservation," says coffee expert Benoit Bertrand, who leads the project from the French Agricultural Research Centre for International Development. Bertrand is analysing which of dozens of coffee varieties fits better for this system. A similar approach can be applied to land with cocoa, vanilla and fruit trees. L) Not every piece of land is fit for reforestation. Vergara''s partners look for safe investments, and even Land Life Company only runs major projects in what they consider "low-risk" countries. "We tend to avoid large- scale operations in countries in some parts of the Middle East or Africa where the permanence is not secured," says Ruys. M) But in the right location, perhaps all you need is time. In the Central Pacific of Costa Rica, the 330-hectare National Wildlife Refuge Baru looks nothing like the cattle ranch it was before 1987, when Jack Ewing decided to turn this large estate into an ecotourism destination. Instead of intervening, a friend told him to let nature have its way. Baru''s former grazing lands are now thriving woods and the property boasts over 150 hectares of secondary forests with no intervention from humans. In the past 10 years, animals such as howling monkeys, scarlet macaws and even migratory cougars have returned to the refuge''s land, boosting tourism and revitalising the ecosystem. Ewing, now 75, explains this success using the words his friend chose three decades ago: "In Costa Rica, when you stop managing the shrubs, the jungle comes back for its revenge."', NULL, NULL, 1219, 'IMPORT', 'cet6-2026-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-2-r2'
);
SET @pg_cet6_2026_06_2_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-2-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-r3', 'CAREFUL_READING', 'CET6', NULL, 'What does self-discipline look like at work? Sometimes, it''s the ability to resist temptation, such as distractions to avoid a particular task. Other times it''s the ability to persist with a task when your energy and motivation seem low. What do you believe about the nature of your own self-discipline? Is it something that runs on internal energy that is spent with use? Or is it something that is bolstered as you apply it and persist? Your answer matters, as it determines how much self-discipline you experience. For years, research in psychology pointed to self-control as a resource that is depleted with use and needs to be restored through breaks, rest, or sleep. More recently, however, research points to the importance of mindset. If you view self- discipline as an expendable resource, your willpower tends to fade with use. If you believe that exercising your self-control strengthens and fuels it, that is more likely to be your experience as you resist temptation or push yourself to get something done that is not appealing. If you don''t already view self-discipline as a force that feeds itself, what might you do? Reflect on times that you had initial difficulty resisting temptation, getting started on something, or sticking with it, but pushed ahead and accomplished the task or met the goal. That''s the kind of experience we''re talking about with this particular belief about self-discipline, and you''ve already had such an experience, so you''ve shown that it''s possible. When you feel your willpower and motivation fading, remind yourself of those previous experiences and imagine the same happening now. What if your experiences have always seemed to indicate that your self-control diminishes with use, and you need breaks to recharge? There''s nothing wrong with that as long as you can afford to take those breaks. If not, remind yourself that not everyone experiences self-discipline as a depletable resource and that your experience might be different if you focus on gathering more energy at this point rather than focusing on how difficult it is to continue or the need for a break. Also, if you know someone who is a role model of self-discipline, picture that person in your situation, persisting in the task. Regardless of how you do it, as you push forward to continue to accomplish progress, be sure to mentally reinforce yourself by taking pride in your ability to exert more willpower as you persist. The benefits of exerting willpower are cumulative. Your self-discipline is akin to a muscle, and each time you resist temptation or persist in a task despite a lack of motivation, you strengthen that muscle, leading to less effort and resistance in similar instances in the future.', NULL, NULL, 449, 'IMPORT', 'cet6-2026-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-2-r3'
);
SET @pg_cet6_2026_06_2_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-2-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-r4', 'CAREFUL_READING', 'CET6', NULL, 'Smartphones have always posed challenges for parents of teens. From social media apps to excessive screen time, the digital world is as threatening as the physical. A new study shows that about half of parents of teens are worried about their teens being exposed to explicit content online. This is a valid concern, of course. But there are ways to alleviate the spread of explicit content, from changing the settings in their kids'' phone to monitoring such content with apps like Bark. Just as alarming, if not more so, is that the amount of time teens spend on social media can lead to anxiety and depression. Excessive screen time has detrimental effects, for a lot of obvious reasons. Constant media consumption inhibits healthy activities associated with childhood, like spending time outside, exercising, talking to friends and family. If it interferes with sleep, that''s even worse. Ample research shows too much smartphone use produces significant anxiety, depression, and feelings of isolation in teens. Teens log on to social media or spend time online trying to make connections, but end up feeling more alone and sad than ever. Faceless communication not only produces feelings of isolation and loneliness but increases instances of online bullying and susceptibility to criminal conducts. Though I''ve banned most social media, I''ve still battled smartphone time with my own kids. A lot of the time I wish I could throw my kids'' smartphones into the nearest lake. The convenience of communication—when they need a ride home from school after practice, for instance—often feels like it isn''t worth the battle to keep their screen time low and productive, and continue to encourage "real-life" activities outside and with friends and family. I understand the addiction and often tell them I''m not sure how I would have handled having a smartphone as a teen. As an adult, I too, struggle with overuse. In a recent TV interview to promote a new film about a mother and daughter navigating social media use, actress Kate Winslet expressed her view on teens and social media—and her concern mirrors the trends. "I do definitely feel that the world of social media is frightening to parents because we don''t really know what''s there," she said. "We don''t know how our children are using it. We don''t know the effects that it''s really having on them." I don''t think the U.S. government should regulate social media and teen smartphone use, but it is a vital topic for parents to understand and take seriously. Unfortunately, now, parents don''t just have to worry about real-world dangers, but all the ones sneaking online and the effects they have on teenagers and their mental health.', NULL, NULL, 444, 'IMPORT', 'cet6-2026-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-2-r4'
);
SET @pg_cet6_2026_06_2_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-2-r4' LIMIT 1);

-- 翻译 cet6-2026-06-2
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-translation'
);
SET @q_cet6_2026_06_2_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_01, '电子商务的蓬勃发展正在深刻改变中国农村的面貌。随着互联网和物流网络快速向农村延伸， 越来越多的农村居民通过电子商务平台将农产品直接销售给城市消费者。近年来，直播带货 ( live- streamingcommerce) 使城市消费者能够与卖家实时互动，已成为促进农村发展的一种新方式。电子商务打破了城乡之间的信息壁垒，拓宽了农产品销售渠道，帮助农村居民增收致富。数字经济与乡村振兴的深度融合，正在为中国农村发展注入前所未有的活力。', NULL, 'The booming development of e-commerce is profoundly changing the face of rural China. As the Internet and logistics networks rapidly extend into rural areas, more and more rural residents are selling their agricultural products directly to urban consumers through e-commerce platforms. In recent years, live-streaming commerce, which enables urban consumers to interact with sellers in real time, has become a new way to promote rural development. E-commerce has broken down the information barriers between urban and rural areas and expanded sales channels for agricultural products, helping rural residents increase their incomes and achieve prosperity. The deep integration of the digital economy with rural revitalization is injecting unprecedented vitality into China''s rural development.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_01
);

-- 听力 Q1 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q01', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q01'
);
SET @q_cet6_2026_06_2_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_02, NULL, '{"A":"A) Celebrate his 10th wedding anniversary.","B":"B) Celebrate his promotion in Barcelona.","C":"C) Give his wife a pleasant surprise.","D":"D) Ask for leave to visit Barcelona."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_02
);

-- 听力 Q2 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q02', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q02'
);
SET @q_cet6_2026_06_2_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_03, NULL, '{"A":"A) He is unable to find some inexpensive accommodation.","B":"B) There are few warm places to go at this time of the year.","C":"C) There is so much for him to do before going on vacation.","D":"D) He is afraid Barcelona may not be so fabulous as expected."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_03
);

-- 听力 Q3 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q03', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q03'
);
SET @q_cet6_2026_06_2_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_04, NULL, '{"A":"A) Rent a car to drive into the city and scenic spots so as to save the expenses on transportation.","B":"B) Spend a couple of nights in a glamorous hotel and the rest of the week in inexpensive places.","C":"C) Find all-inclusive accommodation to eliminate the need to pay for food and drinks.","D":"D) Stay in a hotel away from the coast where the accommodation is less expensive."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_04
);

-- 听力 Q4 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q04', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q04'
);
SET @q_cet6_2026_06_2_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_05, NULL, '{"A":"A) She is sure to like the cathedral.","B":"B) She is a romantic at heart.","C":"C) She is no good at logistics.","D":"D) She is scared of heights."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_05
);

-- 听力 Q5 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q05', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q05'
);
SET @q_cet6_2026_06_2_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_06, NULL, '{"A":"A) They often share each other''s experiences.","B":"B) They enjoy interacting with patients.","C":"C) They always do things tricky.","D":"D) They are both pharmacists."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_06
);

-- 听力 Q6 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q06', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q06'
);
SET @q_cet6_2026_06_2_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_07, NULL, '{"A":"A) The doctor ended up admitting his mistake.","B":"B) The patient consulted another doctor.","C":"C) The patient actually took her advice.","D":"D) The doctor double-checked with her."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_07
);

-- 听力 Q7 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q07', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q07'
);
SET @q_cet6_2026_06_2_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_08, NULL, '{"A":"A) A proposal for applying flu shots more effectively.","B":"B) A new medication therapy management program.","C":"C) A novel strategy to persuade stubborn patients.","D":"D) A therapy for patients with similar conditions."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q08', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q08'
);
SET @q_cet6_2026_06_2_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_09, NULL, '{"A":"A) Inability to send text messages.","B":"B) Distrust in pharmaceutical experts.","C":"C) Medication non-adherence.","D":"D) Need for constant reminding."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_09
);

-- 听力 Q9 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q09', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q09'
);
SET @q_cet6_2026_06_2_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_10, NULL, '{"A":"A) Accomplish their goals.","B":"B) View things positively.","C":"C) Overstate their importance.","D":"D) Dominate job interviews."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_10
);

-- 听力 Q10 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q10', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q10'
);
SET @q_cet6_2026_06_2_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_11, NULL, '{"A":"A) It reflects a strong sense of obligation to others.","B":"B) It signifies a universal model of motivation.","C":"C) It may differ in various cultures.","D":"D) It may have been underestimated."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_11
);

-- 听力 Q11 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q11', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q11'
);
SET @q_cet6_2026_06_2_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_12, NULL, '{"A":"A) It was under-investigated.","B":"B) It was more predictable.","C":"C) It was taken for granted.","D":"D) It was more subtle."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_12
);

-- 听力 Q12 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q12', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q12'
);
SET @q_cet6_2026_06_2_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_13, NULL, '{"A":"A) It is any incidental happening in plants and animals or ice crystals.","B":"B) It is any basic physical or chemical work in designing substances.","C":"C) It is any symmetrical and colorful stripes or spots on organisms.","D":"D) It is any regularly repeated arrangement of shapes or colors."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_13
);

-- 听力 Q13 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q13', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q13'
);
SET @q_cet6_2026_06_2_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_14, NULL, '{"A":"A) Materials undergoing certain processes.","B":"B) Materials exposed to various natural forces.","C":"C) Materials impacted by any change of molecules.","D":"D) Materials going through extremely radical transformations."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_14
);

-- 听力 Q14 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q14', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q14'
);
SET @q_cet6_2026_06_2_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_15, NULL, '{"A":"A) The beauty of molecular clustering.","B":"B) The way for appreciating patterns.","C":"C) The creation of patterns.","D":"D) The factors affecting clusters."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_15
);

-- 听力 Q15 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q15', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q15'
);
SET @q_cet6_2026_06_2_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_16, NULL, '{"A":"A) A pattern by accident.","B":"B) Patterns for specific purposes.","C":"C) Patterns with random imperfections.","D":"D) A pattern with artificial intervention."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_16
);

-- 听力 Q16 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q16', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q16'
);
SET @q_cet6_2026_06_2_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_17, NULL, '{"A":"A) Eliminating all the old habits at once.","B":"B) Making a permanent lifestyle change.","C":"C) Realizing all the life goals one has set.","D":"D) Improving multiple areas of one''s life."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_17
);

-- 听力 Q17 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q17', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q17'
);
SET @q_cet6_2026_06_2_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_18, NULL, '{"A":"A) They were more likely to implement a particular behavior.","B":"B) They were more likely to make plans for their future.","C":"C) They tended to be committed to a single goal.","D":"D) They tended to focus on one thing at a time."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_18
);

-- 听力 Q18 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q18', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q18'
);
SET @q_cet6_2026_06_2_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_19, NULL, '{"A":"A) The ability to make the process automatic.","B":"B) A practical timetable for implementation.","C":"C) A lot of conscious effort to remember to do it.","D":"D) Concentration on the benefits it will provide."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_19
);

-- 听力 Q19 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q19', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q19'
);
SET @q_cet6_2026_06_2_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_20, NULL, '{"A":"A) It resembles that of Earth in many inconceivable ways.","B":"B) It has a haze much thicker than previously believed.","C":"C) It is 333.4°F cooler than earlier estimates.","D":"D) It is far beyond any quick measurements."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_20
);

-- 听力 Q20 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q20', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q20'
);
SET @q_cet6_2026_06_2_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_21, NULL, '{"A":"A) The accumulation of solid particles in the air.","B":"B) The distribution of gases in its atmosphere.","C":"C) The clouds of particles reflecting sun rays.","D":"D) The aggravated effects of climate change."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_21
);

-- 听力 Q21 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q21', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q21'
);
SET @q_cet6_2026_06_2_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_22, NULL, '{"A":"A) If spectrums of light can be better detected by telescope.","B":"B) If Pluto''s hazy atmosphere can be more easily observed.","C":"C) If Pluto''s hazy atmosphere scatters strong sunlight.","D":"D) If the light from the telescope confirms their idea."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_22
);

-- 听力 Q22 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q22', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q22'
);
SET @q_cet6_2026_06_2_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_23, NULL, '{"A":"A) Parents can play a decisive role in cultivating their children''s musical talent.","B":"B) Children are embarrassed by parents'' failure to appreciate their music.","C":"C) Parents can mould their 8- to 10-year-old children''s music taste.","D":"D) Children aged 8 to 10 are old enough to produce poetic lyrics."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_23
);

-- 听力 Q23 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q23', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q23'
);
SET @q_cet6_2026_06_2_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_24, NULL, '{"A":"A) They start to show their own musical preference.","B":"B) They tend to be more influenced by their peers.","C":"C) They tend to gravitate away from their homes.","D":"D) They are more open to new genres of music."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_24
);

-- 听力 Q24 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q24', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q24'
);
SET @q_cet6_2026_06_2_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_25, NULL, '{"A":"A) Enabling children to be receptive to music experts'' suggestions.","B":"B) Helping children develop the ability to manage their emotions.","C":"C) Familiarising children with different schools of music.","D":"D) Introducing children to a variety of musical styles."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_25
);

-- 听力 Q25 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q25', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q25'
);
SET @q_cet6_2026_06_2_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_26, NULL, '{"A":"A) By enhancing children''s appreciation of their music.","B":"B) By pushing their music hard enough upon children.","C":"C) By attending their concerts and live music events with children.","D":"D) By introducing their music to children as early as possible."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q26'
);
SET @q_cet6_2026_06_2_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_27, NULL, '{"A":"A) behavioural","B":"B) eliminate","C":"C) fragile","D":"D) global","E":"E) implications","F":"F) maximise","G":"G) overlapping","H":"H) personally","I":"I) presume","J":"J) prone","K":"K) prototypes","L":"L) reassure","M":"M) skeptically","N":"N) traits","O":"O) underlying"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q27'
);
SET @q_cet6_2026_06_2_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_28, NULL, '{"A":"A) behavioural","B":"B) eliminate","C":"C) fragile","D":"D) global","E":"E) implications","F":"F) maximise","G":"G) overlapping","H":"H) personally","I":"I) presume","J":"J) prone","K":"K) prototypes","L":"L) reassure","M":"M) skeptically","N":"N) traits","O":"O) underlying"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q28'
);
SET @q_cet6_2026_06_2_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_29, NULL, '{"A":"A) behavioural","B":"B) eliminate","C":"C) fragile","D":"D) global","E":"E) implications","F":"F) maximise","G":"G) overlapping","H":"H) personally","I":"I) presume","J":"J) prone","K":"K) prototypes","L":"L) reassure","M":"M) skeptically","N":"N) traits","O":"O) underlying"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q29'
);
SET @q_cet6_2026_06_2_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_30, NULL, '{"A":"A) behavioural","B":"B) eliminate","C":"C) fragile","D":"D) global","E":"E) implications","F":"F) maximise","G":"G) overlapping","H":"H) personally","I":"I) presume","J":"J) prone","K":"K) prototypes","L":"L) reassure","M":"M) skeptically","N":"N) traits","O":"O) underlying"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q30'
);
SET @q_cet6_2026_06_2_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_31, NULL, '{"A":"A) behavioural","B":"B) eliminate","C":"C) fragile","D":"D) global","E":"E) implications","F":"F) maximise","G":"G) overlapping","H":"H) personally","I":"I) presume","J":"J) prone","K":"K) prototypes","L":"L) reassure","M":"M) skeptically","N":"N) traits","O":"O) underlying"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q31'
);
SET @q_cet6_2026_06_2_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_32, NULL, '{"A":"A) behavioural","B":"B) eliminate","C":"C) fragile","D":"D) global","E":"E) implications","F":"F) maximise","G":"G) overlapping","H":"H) personally","I":"I) presume","J":"J) prone","K":"K) prototypes","L":"L) reassure","M":"M) skeptically","N":"N) traits","O":"O) underlying"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q32'
);
SET @q_cet6_2026_06_2_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_33, NULL, '{"A":"A) behavioural","B":"B) eliminate","C":"C) fragile","D":"D) global","E":"E) implications","F":"F) maximise","G":"G) overlapping","H":"H) personally","I":"I) presume","J":"J) prone","K":"K) prototypes","L":"L) reassure","M":"M) skeptically","N":"N) traits","O":"O) underlying"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q33'
);
SET @q_cet6_2026_06_2_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_34, NULL, '{"A":"A) behavioural","B":"B) eliminate","C":"C) fragile","D":"D) global","E":"E) implications","F":"F) maximise","G":"G) overlapping","H":"H) personally","I":"I) presume","J":"J) prone","K":"K) prototypes","L":"L) reassure","M":"M) skeptically","N":"N) traits","O":"O) underlying"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q34'
);
SET @q_cet6_2026_06_2_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_35, NULL, '{"A":"A) behavioural","B":"B) eliminate","C":"C) fragile","D":"D) global","E":"E) implications","F":"F) maximise","G":"G) overlapping","H":"H) personally","I":"I) presume","J":"J) prone","K":"K) prototypes","L":"L) reassure","M":"M) skeptically","N":"N) traits","O":"O) underlying"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q35'
);
SET @q_cet6_2026_06_2_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_36, NULL, '{"A":"A) behavioural","B":"B) eliminate","C":"C) fragile","D":"D) global","E":"E) implications","F":"F) maximise","G":"G) overlapping","H":"H) personally","I":"I) presume","J":"J) prone","K":"K) prototypes","L":"L) reassure","M":"M) skeptically","N":"N) traits","O":"O) underlying"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q36'
);
SET @q_cet6_2026_06_2_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_37, 'Land Life Company''s efforts fit into the global goal to restore millions of hectares of the world''s deforested and degraded land.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q37'
);
SET @q_cet6_2026_06_2_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_38, 'Planting trees or shrubs together with crops can help improve the yield of the land, while offering small-scale farmers a chance to make a living.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q38'
);
SET @q_cet6_2026_06_2_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_39, 'One reforestation project bases its argument on economic benefits and investment returns.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q39'
);
SET @q_cet6_2026_06_2_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_40, 'With time, nature may return to its original state without human intervention if the location is appropriate.', NULL, 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q40'
);
SET @q_cet6_2026_06_2_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_41, 'According to a forest and climate expert, the revival of forest cover can take place under the necessary conditions.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q41'
);
SET @q_cet6_2026_06_2_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_42, 'One company runs its major operations exclusively in countries where risks are not high.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q42'
);
SET @q_cet6_2026_06_2_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_43, 'Left alone, nature may take scores of years or even centuries to repair itself.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q43'
);
SET @q_cet6_2026_06_2_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_44, 'Economic returns can be derived from selling timber and non-wood products as well as carbon credits.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q44'
);
SET @q_cet6_2026_06_2_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_45, 'A study is under way across the world to look for crops that can grow among trees.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q45'
);
SET @q_cet6_2026_06_2_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_46, 'Land Life Company''s operations are usually located where reforestation is impossible without human intervention.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q46'
);
SET @q_cet6_2026_06_2_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_47, 'What plays an important role in determining how much self-discipline people experience?', '{"A":"A) Their belief about the nature of motivation.","B":"B) Their use of internal energy for persisting.","C":"C) Their conception of self-discipline.","D":"D) Their ability to resist temptation."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q47'
);
SET @q_cet6_2026_06_2_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_48, 'What did years of research suggest about self-discipline?', '{"A":"A) It is a depletable resource.","B":"B) It is bolstered through use.","C":"C) Its strength is dependent on willpower.","D":"D) Its exercise is an exhausting experience."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q48'
);
SET @q_cet6_2026_06_2_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_49, 'Why does the author ask us to reflect on our experience of meeting the goal despite initial difficulty?', '{"A":"A) To show the urgency of abandoning outdated beliefs about self-control.","B":"B) To show the feasibility of viewing self-discipline as a force fueling itself.","C":"C) To support the argument for persistence in workplace accomplishments.","D":"D) To add evidence to consistent findings in previous psychological research."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q49'
);
SET @q_cet6_2026_06_2_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_50, 'What are we advised to do if we cannot afford to take breaks to recharge?', '{"A":"A) Figure out what has gone wrong.","B":"B) Focus on the hardest part of our task.","C":"C) Exert ourselves to go on with the work.","D":"D) Gather new energy from people around."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q50'
);
SET @q_cet6_2026_06_2_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_51, 'Why does the author compare our self-discipline to a muscle?', '{"A":"A) The more it is applied, the more resistance it encounters.","B":"B) The more it is exerted, the more proud we become.","C":"C) The more it is enforced, the stronger our willpower proves.","D":"D) The more it is exercised, the more strengthened it gets."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q51'
);
SET @q_cet6_2026_06_2_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_52, 'What do around half of parents of teens do according to a new study?', '{"A":"A) They set their kids'' phones to filter out obscene information.","B":"B) They try to alleviate the spread of explicit scenes on the internet.","C":"C) They feel concerned about their kids'' viewing indecent content online.","D":"D) They strive to prevent their kids from spending excessive screen time."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q52'
);
SET @q_cet6_2026_06_2_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_53, 'What does a large amount of research show about teens'' excessive smartphone use?', '{"A":"A) It allows them less time for meaningful activities.","B":"B) It renders them more lonely and low-spirited.","C":"C) It gives them less time for social interactions.","D":"D) It makes them more alert to online bullying."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q53'
);
SET @q_cet6_2026_06_2_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_54, 'What do we learn about the author''s feelings regarding smartphones and screen time?', '{"A":"A) They are deep-seated.","B":"B) They are instinctive.","C":"C) They are unique.","D":"D) They are mixed."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q54'
);
SET @q_cet6_2026_06_2_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_55, 'What does actress Kate Winslet think about the world of social media?', '{"A":"A) It poses increasing challenges to parents trying to ensure internet safety.","B":"B) It scares parents because they don''t really know what is on the screen.","C":"C) It is a sphere difficult for parents and their teens to navigate.","D":"D) It is full of uncertainties frightful to parents and their teens."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-2-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q55'
);
SET @q_cet6_2026_06_2_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-2-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_2_56, 'What message does the author try to convey in the last paragraph?', '{"A":"A) Parents have to be concerned about dangers to their teens in both real and virtual worlds.","B":"B) Governments have responsibilities in regulating social media and teens'' smartphone use.","C":"C) Parents should provide guidance to their teens in the use of social media.","D":"D) Online dangers are as serious as problems with teenagers'' mental health."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_2_56
);

-- ==================== cet6-2026-06-3 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-r1', 'BANKED_CLOZE', 'CET6', NULL, 'Imagine you and a stranger are sitting on a couch. How close would you sit to them? It turns out that how much of a __26__ zone you prefer may reveal a lot about your personality. In one study, researchers sought to __27__ how our personality may be linked to our preferred amount of personal space. The researchers found that people who scored higher in the __28__ of agreeableness tended to sit closer to others, as did people who were more open and outgoing. Other individual differences, such as gender and age, can also affect how much personal space we __29__ . Women tend to prefer more physical distance from strangers or acquaintances and older adults also generally tend to prefer to keep more distance between themselves and others. Beyond reflecting our personality and __30__ , the amount of personal space we prefer is also linked to our cultural backgrounds. In a study involving participants from 42 countries, researchers found that around the world people''s desired amount of personal space varied __31__ . For example, in Romania, the average amount of personal space people said they would prefer from a stranger was more than 4 feet, whereas in Argentina it was roughly half that. What might __32__ this variation? The researchers looked at a number of __33__ factors, but the only one that was significantly __34__ with preferred interpersonal distance was average temperature. The warmer the place, it seems, the "warmer" the people and the less space they needed between them and others. Personal space may also reflect interpersonal attraction. Researchers have found that our chosen physical __35__ also appears to reflect how much we like others. The more people would like to be friends with the other person, the closer they sat to them.', NULL, '["A) ascertain","B) buffer","C) correlated","D) crave","E) demographics","F) entail","G) legitimately","H) mandated","I) potential","J) proximity","K) rigid","L) statistics","M) substantially","N) trait","O) underlie"]', 295, 'IMPORT', 'cet6-2026-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-3-r1'
);
SET @pg_cet6_2026_06_3_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-3-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-r2', 'MATCHING', 'CET6', 'It''s never too early to teach children about money', 'A) The cost of a mortgage or rents, meeting monthly utility bills, paying for a new car—all headaches most people get to worry about from their 20s. But while some may struggle to pay their bills after a few too many nights out at the start of the month, others will have a tightly followed plan for their repayments. So what is the difference between the shrewd saver and the more reckless spender? B) Experts believe it is all about the age you learn how to spend responsibly. Adult money habits are typically set by the age of seven, according to a large-scale study by the government''s Money Advice Service and behaviour experts at Cambridge University. By then, most children have grasped how to recognise the value of money and are capable of complex functions such as planning ahead, delaying a decision until later and understanding that some choices are irreversible. C) Tomorrow marks the start of Global Money Week, a worldwide initiative to help children make smart financial decisions and learn that "money matters matter". But for many young people in the UK, it''s a matter of too little, too late. "The habits of mind which influence the ways children approach complex problems and decisions, including financial ones, are largely determined in the first few years of life," says Dr David Whitebread, the co-author of the study. And this core behaviour is very likely to influence their financial decisions when they are adults, he says. D) The study also urges parents not to underestimate their own good and bad money habits. "Since young children have few monetary resources they control independently, it is the basic approaches and skills which are modelled, discussed and demonstrated by parents that are likely to be influential levers, breeding efficient habits and practices," it says. E) Parents who choose to help their children learn how to plan ahead, reflect on the past and self-regulate can make a huge difference in promoting good financial behaviour in the future, explains Whitebread. According to a survey by M&G Investments, the vast majority (83%) of parents recognise the value of teaching their children about money. However, this concern does not always carry through to practice—one in six do not feel confident enough to do it. More than one in every four parents think children should take responsibility for understanding money themselves. F) "There''s joy in the fact that young children are spontaneous and live life in the moment, unrestrained by adult problems. But teaching children about money when they are young is a good way for parents to help them learn to delay satisfaction, so that the child thinks: ''I''d like to do this but I''m not going to''. Hard evidence suggests, if you want your child to do well in life, the earlier you can start trying to teach them inhibition and self-discipline, the better," says Whitebread, pointing to research that has shown people in prison frequently have poor impulse control, a personality trait that can affect relationships and long-term health. G) But how should a parent try to teach their child to spend responsibly? One simple way is to give them pocket money and then help them to analyse and learn from any foolish spending decisions. H) Another is through board games which can help teach financial responsibility. Pop to the Shops, a shopping board game for five-to-nine-year-olds, has been one of Orchard Toys'' top 10 bestselling board games every year for the past 15 years. To win, players must use fake coins to purchase everyday grocery items from various shops around the board, and give the other players who visit their shop the correct change. If they don''t have enough money, they must purchase a cheaper item. "It acts as a conversation starter about money —parents can fill in the gaps," says Orchard Toys product manager Rachael Sutcliffe. I) There are also some pocket-money-tracking and payment apps, such as RoosterMoney and goHenry, which are designed to be used by under-sevens, and which boast that they can help children develop good money habits. This is dependent on the children receiving enough pocket money to need an app to track their spending, which research suggests is not always the case. J) Surprisingly, given the research about habit-forming in young children, there are very few gaming apps that can help under-sevens—Pigby''s Fair, developed by NatWest, being a notable exception. In this, children who solve basic puzzles will earn virtual money selling what they have made at different stalls in a fair, then spend or save it. But the need to shift virtual money around, and take into account interest payments and pocket money bonuses, makes it a complex financial education tool. K) There are plenty of online games which focus on coin recognition and counting with money, such as the Igloo Shopping game or Top Marks'' Coins Game. So what if children find such games boring? An exciting (and free) real-world option for parents to use is a visit to Metro Bank. Although, like most banks, it does not allow children to open an account until they turn 11, it specifically tries to offer young children a chance to learn about money inside its branches by inviting kids to use the "magic money machines" to count their coins. Children who accurately guess how much was in their piggy bank(猪形储钱罐) get a prize, and free candies are handed out when the coins are exchanged for banknotes. The bank does not take a commission from the transaction. L) At six years old, my daughter Flora is getting to grips with her finances early. She tested out a number of games aimed at teaching children her age the value of money. She enjoyed them all, but best, in her view, is Money Match Cafe, a board game where she must work out the value of different denominations(面额) of coin in her imaginary restaurant, her "customers" being her stuffed toys. "It was really fun because you get to serve food to your own toys on a little tray with a napkin on it, and then you can hug them," she says. M) "If you''re six and you play this game, you''ll learn that you might not have the right amount of money for what you want to buy. You just have to cross your fingers and hope. It''s a good challenge, and I enjoyed adding the coins up to see how much they made. But I don''t like the name. Money Match Cafe is not a good name for a cafe. I would have liked it more if it had been Flora''s Cafe or Fantastically Baked Lunches." N) Seven out of ten teachers think children are now faced with financial decisions earlier. On Wednesday, Lifesavers—a new project which promotes financial education in primary schools—is hosting a conference to encourage teachers to join its programme and get free classroom resources and training. Almost two-thirds of millennials(千禧一代) wish they had received more money advice at a younger age, according to a Santander survey. O) Only a third of parents involve their children in discussions about their household finances, even though less than half of young people aged seven to seventeen receive financial education at school, another survey shows. P) Most adults believe their parents have had the biggest influence on their money behaviour. So when should they start trying to instil(灌输) good habits? As early as possible before the age of seven, research suggests.', NULL, NULL, 1240, 'IMPORT', 'cet6-2026-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-3-r2'
);
SET @pg_cet6_2026_06_3_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-3-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-r3', 'CAREFUL_READING', 'CET6', NULL, 'Three artists have brought a lawsuit against Stability AI, DeviantArt, and Midjourney, alleging that the text- to-image AI tools have infringed the rights of thousands of artists. The lawsuit claims that the Stable Diffusion tool used by Stability AI, DeviantArt, and Midjourney was trained on billions of copyrighted images downloaded from the internet and used by the companies "without compensation or consent from the artists." The artists are represented by The Joseph Saveri Law Firm and Matthew Butterick. "If Stable Diffusion and similar products are allowed to continue to operate as they do now, the foreseeable result is they will replace the very artists whose stolen works power these AI products with whom they are competing," the law firm wrote in a press release. "AI image products are not just an infringement of artists'' rights; they will eliminate ''artist'' as a viable career path. In addition to obtaining compensation for the wrongful conduct, this lawsuit seeks to prevent that outcome and ensure these products follow the same rules as any other new technology that involves the use of massive amounts of intellectual property. If streaming music can be accomplished within the law, so can AI products." Since text-to-image generators have increased in popularity in the past year, many artists have been vocalizing their opposition to AI art after seeing their own distorted signatures appear in AI art and finding out that their work was used to train the tools without their permission. Not only are many artists furious at the possible copyright violations of AI art, but they have also been frustrated by how AI tools are able to sidestep the labor and art processes they are required to go through. As a result, many artists have been trying to ban AI art from art-sharing platforms. As AI innovation continues at a rapid speed, it seems that artists and lawmakers are trying to put a brake on further developments before it''s too late. Many tech enthusiasts are still rallying around the promise of AI tools to create detailed images cheaply and quickly—anonymous tech supporters have already published a response to Butterick and Joseph Saveri''s lawsuit on a website, using the "fair use" clause as the basis for why copyrighted images could be used by the tool. Fair use, a legal doctrine that allows for a limited usage of copyrighted materials without permission by the original creators for purposes such as teaching and news sharing, is what a lot of generative model creators claim that their training data is covered by. However, since fair use applies differently to each case, it''s hard to make a blanket statement about all works in a dataset as being applicable.', NULL, NULL, 445, 'IMPORT', 'cet6-2026-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-3-r3'
);
SET @pg_cet6_2026_06_3_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-3-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-r4', 'CAREFUL_READING', 'CET6', NULL, 'On a warm October morning, Daniel Agok woke up to another disappointing day at his school in Wanyjok, South Sudan. The classes he had planned teaching computer skills to aspiring young professionals were canceled, due to an unreliable diesel generator and the absence of a municipal power grid in his area. Now, he would be losing frustrated customers as well as income. Agok is just one of the hundreds of millions of people in sub- Saharan Africa, many of whom are business owners, who still do not have dependable electricity. This inequitable access to energy continues to put their livelihood and future at risk. The current system keeps a lid on the economic talents of people like Agok and his students. We must instead unleash their abilities and let Africa reach its true economic potential. That means wiring Africa with clean, dependable energy. Historically, national governments on the continent have led electrification efforts, but fewer than half of the people surveyed say that the national grid is providing a reliable supply of electricity. This has led to expensive and harmful temporary "solutions". In Nigeria alone experts estimate people spend $13 billion every year on fuel for toxic, polluting generators. That number will only grow as the continent''s population hits 2.5 billion people by 2050. Deploying modern grid infrastructure with speed and at scale is essential to replacing these temporary solutions with reliable and affordable alternatives. The rapidly growing private power sector in Africa holds the key to achieving the speed and scale necessary to close the continent''s energy access gap. Private companies today are building world-class infrastructure and driving forward economic growth with sustainable business models. In fact, many governments agree and have begun to embrace the private sector as partners in providing reliable power at scale. In South Africa, President Cyril Ramaphosa has streamlined licensing requirements and enlisted the private sector to play a key role. South Africa is just one example. Across the continent, the private sector has delivered power faster and more reliably, and governments are increasingly turning to private partners. With the right funding and structure in place, the private sector will come together to provide this essential service. After all, electrifying sub-Saharan Africa is a $350 billion opportunity. Today, Daniel Agok is steadily growing his business in South Sudan. His town of Wanyjok was electrified by a private company, providing clean, reliable, and affordable power to his business and his neighbors. Agok now operates his growing computer skills training business smoothly. His classes are no longer affected by the smell and the constant noise of the diesel generator, and he saves money with more affordable power. His students are developing hardware and software skills.', NULL, NULL, 449, 'IMPORT', 'cet6-2026-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-3-r4'
);
SET @pg_cet6_2026_06_3_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2026-06-3-r4' LIMIT 1);

-- 翻译 cet6-2026-06-3
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-translation'
);
SET @q_cet6_2026_06_3_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_01, '近年来，中国无人机(drone) 产业蓬勃发展，出口量跃升为全球第一。中国的无人机以出色的稳 定性、高清 (high-definition)拍摄能力和便捷的操作，受到全球消费者的喜爱，在民用领域得到广泛应用。无人机已被国家纳入战略性新兴产业，逐步成为能满足多种场景需求的智能助手。在农村，无人机可精准识别农作物病虫害，高效喷洒农药。在城市，无人机可快速运送生鲜食品。在不久的将来， 无人机能够在更多领域实现其独特价值，为经济社会发展注入新动能。', NULL, 'In recent years, China''s drone industry has been booming, with its export volume ranking first in the world. Chinese drones are popular with consumers around the world for their excellent stability, high- definition shooting capability and convenient operation, and have been widely used in civilian fields. Drones have been included by the state in strategic emerging industries, and are gradually becoming intelligent assistants that can meet the needs of various scenarios. In rural areas, drones can accurately identify crop diseases and pests, and efficiently spray pesticides. In cities, drones can quickly deliver fresh food. In the near future, drones will be able to realize their unique value in more fields, injecting new momentum into economic and social development.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_01
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q26'
);
SET @q_cet6_2026_06_3_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_02, NULL, '{"A":"A) ascertain","B":"B) buffer","C":"C) correlated","D":"D) crave","E":"E) demographics","F":"F) entail","G":"G) legitimately","H":"H) mandated","I":"I) potential","J":"J) proximity","K":"K) rigid","L":"L) statistics","M":"M) substantially","N":"N) trait","O":"O) underlie"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_02
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q27'
);
SET @q_cet6_2026_06_3_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_03, NULL, '{"A":"A) ascertain","B":"B) buffer","C":"C) correlated","D":"D) crave","E":"E) demographics","F":"F) entail","G":"G) legitimately","H":"H) mandated","I":"I) potential","J":"J) proximity","K":"K) rigid","L":"L) statistics","M":"M) substantially","N":"N) trait","O":"O) underlie"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_03
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q28'
);
SET @q_cet6_2026_06_3_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_04, NULL, '{"A":"A) ascertain","B":"B) buffer","C":"C) correlated","D":"D) crave","E":"E) demographics","F":"F) entail","G":"G) legitimately","H":"H) mandated","I":"I) potential","J":"J) proximity","K":"K) rigid","L":"L) statistics","M":"M) substantially","N":"N) trait","O":"O) underlie"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_04
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q29'
);
SET @q_cet6_2026_06_3_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_05, NULL, '{"A":"A) ascertain","B":"B) buffer","C":"C) correlated","D":"D) crave","E":"E) demographics","F":"F) entail","G":"G) legitimately","H":"H) mandated","I":"I) potential","J":"J) proximity","K":"K) rigid","L":"L) statistics","M":"M) substantially","N":"N) trait","O":"O) underlie"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_05
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q30'
);
SET @q_cet6_2026_06_3_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_06, NULL, '{"A":"A) ascertain","B":"B) buffer","C":"C) correlated","D":"D) crave","E":"E) demographics","F":"F) entail","G":"G) legitimately","H":"H) mandated","I":"I) potential","J":"J) proximity","K":"K) rigid","L":"L) statistics","M":"M) substantially","N":"N) trait","O":"O) underlie"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_06
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q31'
);
SET @q_cet6_2026_06_3_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_07, NULL, '{"A":"A) ascertain","B":"B) buffer","C":"C) correlated","D":"D) crave","E":"E) demographics","F":"F) entail","G":"G) legitimately","H":"H) mandated","I":"I) potential","J":"J) proximity","K":"K) rigid","L":"L) statistics","M":"M) substantially","N":"N) trait","O":"O) underlie"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_07
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q32'
);
SET @q_cet6_2026_06_3_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_08, NULL, '{"A":"A) ascertain","B":"B) buffer","C":"C) correlated","D":"D) crave","E":"E) demographics","F":"F) entail","G":"G) legitimately","H":"H) mandated","I":"I) potential","J":"J) proximity","K":"K) rigid","L":"L) statistics","M":"M) substantially","N":"N) trait","O":"O) underlie"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_08
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q33'
);
SET @q_cet6_2026_06_3_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_09, NULL, '{"A":"A) ascertain","B":"B) buffer","C":"C) correlated","D":"D) crave","E":"E) demographics","F":"F) entail","G":"G) legitimately","H":"H) mandated","I":"I) potential","J":"J) proximity","K":"K) rigid","L":"L) statistics","M":"M) substantially","N":"N) trait","O":"O) underlie"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_09
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q34'
);
SET @q_cet6_2026_06_3_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_10, NULL, '{"A":"A) ascertain","B":"B) buffer","C":"C) correlated","D":"D) crave","E":"E) demographics","F":"F) entail","G":"G) legitimately","H":"H) mandated","I":"I) potential","J":"J) proximity","K":"K) rigid","L":"L) statistics","M":"M) substantially","N":"N) trait","O":"O) underlie"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_10
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q35'
);
SET @q_cet6_2026_06_3_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_11, NULL, '{"A":"A) ascertain","B":"B) buffer","C":"C) correlated","D":"D) crave","E":"E) demographics","F":"F) entail","G":"G) legitimately","H":"H) mandated","I":"I) potential","J":"J) proximity","K":"K) rigid","L":"L) statistics","M":"M) substantially","N":"N) trait","O":"O) underlie"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_11
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q36'
);
SET @q_cet6_2026_06_3_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_12, 'Most parents realise the importance of teaching their children how to handle money, but many of them actually don''t do much in this respect.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_12
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q37'
);
SET @q_cet6_2026_06_3_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_13, 'People differ substantially in their way of managing finance.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_13
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q38'
);
SET @q_cet6_2026_06_3_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_14, 'Parents can easily teach children how to spend responsibly by helping them draw lessons from bad decisions on spending.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_14
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q39'
);
SET @q_cet6_2026_06_3_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_15, 'Many young British people badly lack money management skills and they don''t learn them early enough.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_15
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q40'
);
SET @q_cet6_2026_06_3_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_16, 'The majority of adults believe that their spending habits have been influenced the most by their parents.', NULL, 'P', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_16
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q41'
);
SET @q_cet6_2026_06_3_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_17, 'There are apps designed specifically for children under 7 to help them track pocket money spending.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_17
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q42'
);
SET @q_cet6_2026_06_3_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_18, 'According to experts, the age a person learns to manage finance responsibly determines the way they handle money thereafter.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_18
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q43'
);
SET @q_cet6_2026_06_3_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_19, 'Most teachers are of the opinion that children today need to make financial decisions at a younger age.', NULL, 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_19
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q44'
);
SET @q_cet6_2026_06_3_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_20, 'Parents serve as effective role models in shaping children''s money management habits.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_20
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q45'
);
SET @q_cet6_2026_06_3_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_21, 'According to one study, about 30% of parents allow their children to participate in discussions on their family finances.', NULL, 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_21
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q46'
);
SET @q_cet6_2026_06_3_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_22, 'Why have three artists brought a lawsuit against Stability AI, DeviantArt, and Midjourney?', '{"A":"A) They claim that the use of the Stable Diffusion tool is a violation of law.","B":"B) They claim these companies infringed their intellectual property rights.","C":"C) They want to stop the use of all AI tools in the creation of art works.","D":"D) They want to prevent artists from being compelled to rely on AI tools."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_22
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q47'
);
SET @q_cet6_2026_06_3_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_23, 'What will happen if Stable Diffusion and similar products are allowed to continue to operate as they do now, according to the law firm?', '{"A":"A) Intellectual property laws will be hard to enforce.","B":"B) Fewer artists will invest talent in artistic creation.","C":"C) Artists will lose their means of subsistence.","D":"D) Copied works will flood the art market."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_23
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q48'
);
SET @q_cet6_2026_06_3_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_24, 'What makes artists furious aside from copyright infringement?', '{"A":"A) Art works produced with AI tools are not banned from art-sharing platforms.","B":"B) Text-to-image generators have won such great popularity in the past year.","C":"C) Their distorted signatures appear more and more frequently in AI art.","D":"D) AI tools can bypass the considerable labor involved in creating art works."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_24
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q49'
);
SET @q_cet6_2026_06_3_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_25, 'What do we learn from the passage about many AI enthusiasts?', '{"A":"A) They look forward to AI tools creating good-quality art works.","B":"B) They claim artists can use copyrighted materials just as teachers do.","C":"C) They support AI''s limited use of copyrighted images without permission.","D":"D) They wish the \\"fair use\\" clause would be applicable to all works in a dataset."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_25
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q50'
);
SET @q_cet6_2026_06_3_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_26, 'What does the author think of the "fair use" clause in copyright law?', '{"A":"A) It may determine the final verdict of the case.","B":"B) It may not apply to the present legal case.","C":"C) It does not cover the works of all artists.","D":"D) It is subject to different interpretations."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_26
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q51'
);
SET @q_cet6_2026_06_3_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_27, 'What do we learn about the current electric supply system in Africa?', '{"A":"A) It curbs the economic development of the continent.","B":"B) It mainly depends on the polluting diesel generators.","C":"C) It is the primary cause of inequitable distribution of wealth.","D":"D) It deprives many Africans of the opportunity to use computers."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_27
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q52'
);
SET @q_cet6_2026_06_3_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_28, 'What do we learn from the passage about Africa''s past electrification efforts?', '{"A":"A) They have failed to meet most Africans'' need of a reliable power supply.","B":"B) They have failed to build a national grid to provide electric power.","C":"C) They have unleashed the true economic potential of the continent.","D":"D) They have aimed at wiring Africa with clean, dependable energy."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_28
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q53'
);
SET @q_cet6_2026_06_3_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_29, 'What is essential to tackling the power supply shortage in Africa?', '{"A":"A) Replacing temporary solutions with long-term strategies.","B":"B) Accelerating economic growth with sustainable policies.","C":"C) Restructuring national power generation companies.","D":"D) Putting in place a large-scale modern power grid speedily."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_29
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q54'
);
SET @q_cet6_2026_06_3_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_30, 'What are many governments in Africa doing to solve the electricity supply problem?', '{"A":"A) Focusing on building world-class infrastructures.","B":"B) Relying on the private sector for scale economy.","C":"C) Launching sustainable business models.","D":"D) Cooperating with private companies."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_30
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2026-06-3-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2026_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2026-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q55'
);
SET @q_cet6_2026_06_3_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2026-06-3-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2026_06_3_31, 'Why will private companies be motivated to join the effort of electrifying sub-Saharan Africa?', '{"A":"A) There is big money to be made.","B":"B) They have enough funding in place.","C":"C) South Africa has set a successful example.","D":"D) Governments are turning to them for help."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2026_06_3_31
);

COMMIT;
