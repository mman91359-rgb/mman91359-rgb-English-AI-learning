-- 由 scripts/import-exam.mjs 自动生成，请勿手工修改。
-- 版本: V1.0.36
-- 生成时间: 2026-11-09T14:51:12.491Z
-- 目标库: exercise_db
-- 执行前必须按 docs/数据库迁移规范.md 预览、备份、审批。
-- 范围：正常套 + 仅借听力套（残卷留后）；听力无音频不写 listening_audio。

START TRANSACTION;

-- ==================== cet6-2023-12-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-r1', 'BANKED_CLOZE', 'CET6', NULL, 'The desert is deceiving. At first glance it looks lifeless, barren, and bone-dry. For most passersby humming through the Mojave on their way to try their luck in Las Vegas or heading towards the Grand Canyon, it''s just a __26__ stretch of land with some mountains in the distance and more __27__ to be a setting for a movie that takes place on Mars. The desert, however, is __28__ with life, mystery, and magic. The Mojave desert sees less than two inches of rain a year, and like most deserts, is a land of __29__ . Temperature fluctuations vary from freezing to __30__ hot, not only between seasons, but even within the same day. At the heart of this vast, 25,000-square-mile desert is Mojave National Preserve. The folks managing and working there wear the wide-brimmed(宽边的) hats that have become __31__ with places like Yosemite. The preserve is rich with history, culture, biodiversity, and endless opportunities to __32__ your interest, especially for anyone who loves the outdoors. For a photographer, it requires patience and __33__ a few spare tires to maneuver the network of unpaved "roads", but the rewards are plenty. Photographing here requires a good, __34__ pair of shoes and a lot of preparation. Plenty of water, spare tires, and a full tank of gas are needed to explore this unit of the national park system, which is the third largest in the country. Like all deserts, though, if you are patient, you will be rewarded, as they often reveal their secrets slowly. During my last outing, I was surprised to see how much of the area was shaped by ancient volcanoes and geological forces, much of which remains today, giving the area a __35__ feel and painting a colorful background for great photographs.', NULL, '["A) apt","B) burning","C) extremes","D) flat","E) fractions","F) overflowing","G) parasites","H) probably","I) sparingly","J) sprinkle","K) steer","L) stimulate","M) sturdy","N) synonymous","O) unique"]', 294, 'IMPORT', 'cet6-2023-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-1-r1'
);
SET @pg_cet6_2023_12_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-r2', 'MATCHING', 'CET6', 'African countries must get smarter with their agriculture', 'A) On the hills of central Kenya, almost lime-green with the sparkle of tea bushes in the sunlight, farmers know all about climate change. "The rainy season is no longer predictable," says one. "When it is supposed to rain it doesn''t, then it all comes at once." Climate change is an issue that will affect everyone on the planet. For Africans its consequences will be particularly bitter: whereas other regions were able to grow rich by burning coal and oil, Africa will pay much of the human price without having enjoyed the benefits. "Africa only represents 2% of global greenhouse-gas emissions but it is the continent that is expected to suffer the most from climate impacts," says Mafalda Duarte, who runs the World Bank''s $8bn Climate Investment Funds. B) Although there are huge uncertainties as to the precise impacts of climate change, enough is known to say that global warming represents one of the main threats to Africa''s prosperity. Parts of the continent are already warming much more quickly than the average: temperatures in southern Africa have increased by about twice the global rate over the past 50 years. Even if the world were to cut emissions enough to keep global warming below 1.5℃, heat-waves would intensify in Africa and diseases would spread to areas not currently affected. Farming would also be hit hard. About 40% of the land now used to grow maize(玉米) would no longer be suitable for it. Overall, it is estimated that maize yields would fall by 18-22%. C) Africa is particularly vulnerable, in part because it is already struggling to feed itself and it will have to vastly increase yields and productivity if it is to put food on the plates of a fast-growing population, even without climate change. The UN''s Food and Agriculture Organisation reckons that by 2050 global food production would have to rise by about 70% over its level of 2009 to meet demand from a population that is growing in numbers and appetite. Much of this new demand will be in Africa. Yet the continent already imports about $50bn-worth of food a year and that figure is expected to more than double over the next five years. Self-sufficiency is not Africa''s goal, but the fact that it spends more money importing food than it does buying capital goods suggests it has room for improvement. D) Finding out why is not hard. Most farms are tiny, ploughed by hand and reliant on rain. More than half of Africa''s people make their living from farming. Although its total harvest has climbed over the past few decades, this is mainly because there are more people farming more land. But in many places there is no spare land to farm. Plots in Rwanda are so small that you could fit 250 of them onto the average American farm. And although output per worker has improved by more than half over the past 30 years in Africa, that is still far behind the 2.5 times improvement in Asia. Yields of maize are generally less than two tonnes per hectare, a fifth the level in America. E) The low productivity of African farmers is reflected in national economic statistics—despite absorbing so much labour, farming generates just 15% of GDP. "They can''t even feed their families," says Jennifer Blanke, a vice-president of the African Development Bank in charge of agriculture. "Farm productivity hasn''t improved in many parts of Africa for 100 years." F) One reason is that in the first few decades of independence, many African governments neglected farming as they focused on industrialising their economies. Others damaged it by pushing down the prices that state monopolies paid for their crops in order to subsidise workers in cities with cheap food. Ghana taxed cocoa(可 可粉) exports so heavily that production collapsed by half between the 1960s and 1980s, despite a jump in the global price of cocoa. Yet over the past two decades or so governments and donors have begun to look again at farming as a way of providing jobs for the 13 million young people entering the workforce each year. Much of the focus has been on getting small farmers to use fertiliser and, more important, better seeds. The results can be impressive. Improved varieties of sorghum(高梁), for instance, can produce a crop that is 40% larger than the usual variety. Infrastructure is important. A World Bank irrigation project in Ethiopia helped farmers increase their potato harvest from about 8 tonnes per hectare to 35 tonnes. G) Better techniques help, too. Small coffee farmers in Kenya are able to increase their incomes by 40% by following a few simple guidelines on caring for their bushes, such as trimming all but three of their stems. Many of their neighbours do not follow the advice, because it seems counter-intuitive. More stems ought to lead to more coffee beans, they say. Yet after seeing those following the advice get bigger harvests for a season or two, many others start doing the same. H) One way of spreading knowledge is to link farms to big buyers of their harvests. When Diageo, a British drinks giant, built a brewery in western Kenya, it wanted to use local crops to make a beer cheap enough to compete with illicit home brew. It organised farmers into groups, improved supply chains for them to get seeds and fertiliser and then agreed to buy their grain. It now provides a market to about 17,000 farmers. Across the region it has doubled its use of local raw material to about 80% over five years, says John O''Keeffe, who runs its Africa business. I) An even more important change is the move from traditional farming to building businesses that can profitably bring technology and investment to small farmers. Taita Ngetich, a young Kenyan, was studying engineering when he wanted to earn a little money on the side. He scraped together 20,000 Kenyan shillings (about $200) to plant tomatoes. Everything went wrong. The crop was attacked by pests. "Then there was a massive flood that swallowed all our capital," he says. Mr Ngetich persevered by looking into buying a greenhouse to protect his plants from bugs and rain. The cheapest ones cost more than $2,500 each, so he designed his own for half the price. Soon neighbouring farmers started placing orders with him, and now his firm, Illuminum Greenhouses, has sold more than 1,400 greenhouses that provide livelihoods to about 6,000 people. The business does not stop there; he also supplies fertiliser, high-quality seedlings and smart sensors that increase yields. J) Illuminum''s success shows how technology can help even small farms become more productive. Because such a large share of Africa''s population earns a living from agriculture, even small improvements in productivity can lift the incomes of millions of people. But over the longer run small-scale farming can go only so far, especially in the face of climate change and population pressure. K) "If we really want to lift people out of poverty we have to finance projects that will get them an income of at least $100 a month so that they can pay for health care and education," says Mr Ngetich. "Projects that give them an extra $2 a month from growing beans or maize aren''t going to get them there." Getting those big jumps will need better jobs in factories and cities.', NULL, NULL, 1227, 'IMPORT', 'cet6-2023-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-1-r2'
);
SET @pg_cet6_2023_12_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-r3', 'CAREFUL_READING', 'CET6', NULL, 'One of the great successes of the Republican Party in recent decades is the relentless propagation of a simple formula for economic growth: tax cuts. The formula doesn''t work, but that has not affected its popularity. And while the cult of tax cuts has attracted many critics, it lacks for obvious rivals. Democratic politicians have tended to campaign on helping people left behind by economic growth. When Democrats do talk about encouraging economic growth, they often sound like Republicans. This is not just a political problem for Democrats; it is an economic problem for the United States. The nation needs a better story about the drivers of economic growth. The painful lessons of recent decades point to a promising candidate: higher wages. Raising the wages of American workers ought to be the priority of economic policymakers. We''d all be better off paying less attention to quarterly updates on the growth of the nation''s gross domestic product (GDP) and focusing instead on the growth of workers'' paychecks. Set aside, for the moment, the familiar argument for higher wages: fairness. The argument here is that higher wages can fuel the engine of economic growth. Perhaps the most famous illustration of the benefits is the story of Henry Ford''s decision in 1914 to pay $5 a day to workers on his Model T assembly lines. He did it to increase production—he was paying a premium to maintain a reliable workforce. The unexpected benefit was that Ford''s factory workers became Ford customers, too. The same logic still holds: Consumption drives the American economy, and workers who are paid more can spend more. Mainstream economists insist that it is impossible to order up a sustainable increase in wages because compensation levels reflect the unerring judgment of market forces. The conventional wisdom held that productivity growth was the only route to higher wages. Through that lens, efforts to negotiate higher wages were counterproductive. Minimum-wage laws would raise unemployment because there was only so much money in the wage pool, and if some people got more, others would get none. It was in the context of this worldview that it became popular to argue that tax cuts would drive prosperity. Rich people would invest, productivity would increase, wages would rise. In the real world, things are more complicated. Wages are influenced by a tug of war between employers and workers, and employers have been winning. One clear piece of evidence is the widening gap between productivity growth and wage growth since roughly 1970. Productivity has more than doubled; wages have lagged far behind. A focus on wage growth would provide an antidote(矫正方法) to the attractive simplicity of the belief in the magical power of tax cuts.', NULL, NULL, 449, 'IMPORT', 'cet6-2023-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-1-r3'
);
SET @pg_cet6_2023_12_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-r4', 'CAREFUL_READING', 'CET6', NULL, 'Journal editors decide what gets published and what doesn''t, affecting the careers of other academics and influencing the direction that a field takes. You''d hope, then, that journals would do everything they can to establish a diverse editorial board, reflecting a variety of voices, experiences, and identities. Unfortunately a new study in Nature Neuroscience makes for disheartening reading. The team finds that the majority of editors in top psychology and neuroscience journals are male and based in the United States: a situation that may be amplifying existing gender inequalities in the field and influencing the kind of research that gets published. Men were found to account for 60% of the editors of psychology journals. There were significantly more male than female editors at each level of seniority, and men made up the majority of editors in over three quarters of the journals. Crucially, the proportion of female editors was significantly lower than the overall proportion of women psychology researchers. The differences were even starker in the neuroscience journals: 70% of editors were male, and men held the majority of editorial positions in 88% of journals. In this case, the proportion of female editors was not significantly lower than the proportion of female researchers working in neuroscience—a finding that reveals enduring gender disparities in the field more broadly. Based on their results, the team concludes that "the ideas, values and decision-making biases of men are overrepresented in the editorial positions of the most recognized academic journals in psychology and neuroscience." Gender inequality in science is often attributed to the fact that senior academics are more likely to be male, because historically science was male-dominated: it''s argued that as time goes on and more women rise to senior roles, the field will become more equal. Yet this study showed that even the junior roles in psychology journals tended to be held disproportionately by men, despite the fact that there are actually more female than male junior psychology faculty. This implies that a lack of female academics is not the problem. Instead, there are structural reasons that women are disadvantaged in science. Women receive lower salaries and face greater childcare demands, for instance, which can result in fewer publications and grants—the kinds of things that journals look for when deciding who to appoint. Rather than simply blaming the inequality of editorial boards on tradition, we should be actively breaking down these existing barriers. A lack of diversity among journal editors also likely contributes to psychology''s WEIRD problem. If journal editors are largely men from the United States, then they will probably place higher value on papers that are relevant to Western, male populations, whether consciously or not.', NULL, NULL, 444, 'IMPORT', 'cet6-2023-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-1-r4'
);
SET @pg_cet6_2023_12_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-1-r4' LIMIT 1);

-- 翻译 cet6-2023-12-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-translation'
);
SET @q_cet6_2023_12_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_01, '在中国，随着老龄化社会的到来，养老受到普遍关注。人们谈论最多的是应当采取什么样的养老模式。多数人认为，养老模式需要多元化。可以通过政府引导和社会参与，建立更多更好的养老服务机构，改进社区服务中心，鼓励居家自助养老，还可以推行家庭养老与社会养老相结合的模式。随着政府和社会对养老服务事业投入的持续增加，养老设施将不断升级，服务质量逐步改进，老年人的生活将会更加方便舒适、健康快乐。', NULL, 'In China, with the arrival of an aging society, elderly care has drawn widespread attention. What people talk about most is what model of elderly care should be adopted. Most people believe that the elderly-care model needs to be diversified. To achieve this, through governmental guidance and social participation, we can build more and better elderly-care institutions, improve community service centers, encourage self-supported home-based elderly care, and promote a combination of family-based and society-based elderly care. With the continuous increase in government and social investment in elderly- care services, elderly-care facilities will be steadily upgraded, service quality will gradually improve, and the elderly will live a more convenient, comfortable, healthy and happy life.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_01
);

-- 听力 Q1 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q01', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q01'
);
SET @q_cet6_2023_12_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_02, NULL, '{"A":"A) It is clear that he is expected to enjoy a healthy life.","B":"B) There is nothing wrong with his digestive system.","C":"C) There is some indication of an issue with his blood circulation.","D":"D) He doesn''t know he has long been suffering from poor health."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_02
);

-- 听力 Q2 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q02', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q02'
);
SET @q_cet6_2023_12_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_03, NULL, '{"A":"A) Mistaking symptoms of illness for stress.","B":"B) Complaining they are being overworked.","C":"C) Being unaware of the stress they are under.","D":"D) Suffering from illness without recognising it."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_03
);

-- 听力 Q3 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q03', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q03'
);
SET @q_cet6_2023_12_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_04, NULL, '{"A":"A) Prescribe some medication for him.","B":"B) Give him another physical check-up.","C":"C) Explain to him the common consequence of stress.","D":"D) Buy some sleeping pills for him from the drugstore."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_04
);

-- 听力 Q4 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q04', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q04'
);
SET @q_cet6_2023_12_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_05, NULL, '{"A":"A) It calls for responsible management.","B":"B) It proves to be quite profitable.","C":"C) It is remarkably promising.","D":"D) It is full of competition."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_05
);

-- 听力 Q5 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q05', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q05'
);
SET @q_cet6_2023_12_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_06, NULL, '{"A":"A) To avoid being in the limelight.","B":"B) To seek medical help for his injury.","C":"C) To pursue a less competitive career.","D":"D) To stay away from his hostile teammates."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_06
);

-- 听力 Q6 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q06', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q06'
);
SET @q_cet6_2023_12_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_07, NULL, '{"A":"A) It has ups and downs.","B":"B) It proves rewarding.","C":"C) It does not last long.","D":"D) It is not so profitable."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_07
);

-- 听力 Q7 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q07', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q07'
);
SET @q_cet6_2023_12_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_08, NULL, '{"A":"A) He was a financial advisor.","B":"B) He suffered from poor health.","C":"C) He became a basketball coach.","D":"D) He was back in the news."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q08', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q08'
);
SET @q_cet6_2023_12_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_09, NULL, '{"A":"A) Study issues of public health.","B":"B) Alleviate the obesity problem.","C":"C) Raise sufficient public funding.","D":"D) Train young basketball players."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_09
);

-- 听力 Q9 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q09', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q09'
);
SET @q_cet6_2023_12_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_10, NULL, '{"A":"A) When she started teaching at Edinburgh University in Scotland.","B":"B) While she was doing her doctoral studies on American Literature.","C":"C) After publishing her first novel Behind the Scenes at the Museum.","D":"D) After winning the 1986 Woman''s Own Short Story Competition."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_10
);

-- 听力 Q10 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q10', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q10'
);
SET @q_cet6_2023_12_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_11, NULL, '{"A":"A) The themes of love and loss.","B":"B) The code of human behaviour.","C":"C) The sins and flaws of eccentrics.","D":"D) The manners of fashionable circles."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_11
);

-- 听力 Q11 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q11', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q11'
);
SET @q_cet6_2023_12_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_12, NULL, '{"A":"A) They are usually ignorant of complex human relations.","B":"B) They successfully imitate the manners of celebrities.","C":"C) They often get rewarded instead of being punished.","D":"D) They are generally looked down upon in society."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_12
);

-- 听力 Q12 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q12', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q12'
);
SET @q_cet6_2023_12_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_13, NULL, '{"A":"A) It is what members use to alleviate tension in a team.","B":"B) It is what employers are increasingly seeking after.","C":"C) It is conducive to getting over a recession.","D":"D) It is necessary for learning a new task."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_13
);

-- 听力 Q13 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q13', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q13'
);
SET @q_cet6_2023_12_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_14, NULL, '{"A":"A) Make better choices.","B":"B) Follow innovative ideas.","C":"C) Achieve recognition duly.","D":"D) Accumulate work experience."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_14
);

-- 听力 Q14 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q14', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q14'
);
SET @q_cet6_2023_12_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_15, NULL, '{"A":"A) Workers show more emotional intelligence.","B":"B) Workers use brains more than muscles.","C":"C) People usually work flexible hours.","D":"D) People often work in teams."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_15
);

-- 听力 Q15 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q15', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q15'
);
SET @q_cet6_2023_12_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_16, NULL, '{"A":"A) Leave the group as soon as possible.","B":"B) Anticipate setbacks well in advance.","C":"C) Decide on new priorities speedily.","D":"D) Stick to original goals confidently."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_16
);

-- 听力 Q16 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q16', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q16'
);
SET @q_cet6_2023_12_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_17, NULL, '{"A":"A) What differentiates people from animals.","B":"B) Why philosophers disagree with scientists.","C":"C) Where humans'' great cognitive capacity originates.","D":"D) When being creative becomes a biological mandate."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_17
);

-- 听力 Q17 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q17', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q17'
);
SET @q_cet6_2023_12_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_18, NULL, '{"A":"A) It is what tells apart two adjacent generations.","B":"B) It is what sharpens our appetite for novelty.","C":"C) It is something only geniuses can achieve.","D":"D) It is something every human being can do."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_18
);

-- 听力 Q18 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q18', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q18'
);
SET @q_cet6_2023_12_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_19, NULL, '{"A":"A) It seeks inspiration for novel inventions.","B":"B) It constantly absorbs new information.","C":"C) It uses existing ideas to create new ones.","D":"D) It repeats precedent on a regular basis."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_19
);

-- 听力 Q19 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q19', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q19'
);
SET @q_cet6_2023_12_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_20, NULL, '{"A":"A) Dogs know when their owners are not feeling well.","B":"B) Dogs have the cognition for telling right from wrong.","C":"C) Dogs have an aptitude for developing skills to interact with humans.","D":"D) Dogs know when their human companions can no longer stand them."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_20
);

-- 听力 Q20 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q20', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q20'
);
SET @q_cet6_2023_12_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_21, NULL, '{"A":"A) They can readily detect different ill smells of viruses.","B":"B) They can easily tell what bacteria cause odor change.","C":"C) They are particularly sensitive to strange smells.","D":"D) They have an extremely powerful sense of smell."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_21
);

-- 听力 Q21 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q21', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q21'
);
SET @q_cet6_2023_12_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_22, NULL, '{"A":"A) It can ensure owners suffer fewer chronic diseases.","B":"B) It can benefit owners both physically and mentally.","C":"C) It can reduce owners'' risk of getting cancer or diabetes.","D":"D) It can alert owners to the seriousness of their conditions."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_22
);

-- 听力 Q22 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q22', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q22'
);
SET @q_cet6_2023_12_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_23, NULL, '{"A":"A) Crack down on courses like science, technology, engineering and math.","B":"B) Restrict the ability of creative arts courses to recruit new students.","C":"C) Look at how to reform technical and vocational education.","D":"D) Ensure creative arts students get better value for money."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_23
);

-- 听力 Q23 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q23', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q23'
);
SET @q_cet6_2023_12_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_24, NULL, '{"A":"A) Seemingly reasonable.","B":"B) Clearly well-grounded.","C":"C) Extremely irrational.","D":"D) Apparently simplistic."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_24
);

-- 听力 Q24 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q24', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q24'
);
SET @q_cet6_2023_12_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_25, NULL, '{"A":"A) A high proportion of them haven''t tried to save money.","B":"B) Most of them never hope to buy a house or to retire.","C":"C) Forty percent of them earn less than ￡25,000 a year.","D":"D) The majority of them have fairly well-paying jobs."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_25
);

-- 听力 Q25 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q25', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q25'
);
SET @q_cet6_2023_12_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_26, NULL, '{"A":"A) The context of a bank balance.","B":"B) Britain''s economy as a whole.","C":"C) The specific degree a student earns.","D":"D) Britain''s defective educational system."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q26'
);
SET @q_cet6_2023_12_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_27, NULL, '{"A":"A) apt","B":"B) burning","C":"C) extremes","D":"D) flat","E":"E) fractions","F":"F) overflowing","G":"G) parasites","H":"H) probably","I":"I) sparingly","J":"J) sprinkle","K":"K) steer","L":"L) stimulate","M":"M) sturdy","N":"N) synonymous","O":"O) unique"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q27'
);
SET @q_cet6_2023_12_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_28, NULL, '{"A":"A) apt","B":"B) burning","C":"C) extremes","D":"D) flat","E":"E) fractions","F":"F) overflowing","G":"G) parasites","H":"H) probably","I":"I) sparingly","J":"J) sprinkle","K":"K) steer","L":"L) stimulate","M":"M) sturdy","N":"N) synonymous","O":"O) unique"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q28'
);
SET @q_cet6_2023_12_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_29, NULL, '{"A":"A) apt","B":"B) burning","C":"C) extremes","D":"D) flat","E":"E) fractions","F":"F) overflowing","G":"G) parasites","H":"H) probably","I":"I) sparingly","J":"J) sprinkle","K":"K) steer","L":"L) stimulate","M":"M) sturdy","N":"N) synonymous","O":"O) unique"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q29'
);
SET @q_cet6_2023_12_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_30, NULL, '{"A":"A) apt","B":"B) burning","C":"C) extremes","D":"D) flat","E":"E) fractions","F":"F) overflowing","G":"G) parasites","H":"H) probably","I":"I) sparingly","J":"J) sprinkle","K":"K) steer","L":"L) stimulate","M":"M) sturdy","N":"N) synonymous","O":"O) unique"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q30'
);
SET @q_cet6_2023_12_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_31, NULL, '{"A":"A) apt","B":"B) burning","C":"C) extremes","D":"D) flat","E":"E) fractions","F":"F) overflowing","G":"G) parasites","H":"H) probably","I":"I) sparingly","J":"J) sprinkle","K":"K) steer","L":"L) stimulate","M":"M) sturdy","N":"N) synonymous","O":"O) unique"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q31'
);
SET @q_cet6_2023_12_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_32, NULL, '{"A":"A) apt","B":"B) burning","C":"C) extremes","D":"D) flat","E":"E) fractions","F":"F) overflowing","G":"G) parasites","H":"H) probably","I":"I) sparingly","J":"J) sprinkle","K":"K) steer","L":"L) stimulate","M":"M) sturdy","N":"N) synonymous","O":"O) unique"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q32'
);
SET @q_cet6_2023_12_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_33, NULL, '{"A":"A) apt","B":"B) burning","C":"C) extremes","D":"D) flat","E":"E) fractions","F":"F) overflowing","G":"G) parasites","H":"H) probably","I":"I) sparingly","J":"J) sprinkle","K":"K) steer","L":"L) stimulate","M":"M) sturdy","N":"N) synonymous","O":"O) unique"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q33'
);
SET @q_cet6_2023_12_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_34, NULL, '{"A":"A) apt","B":"B) burning","C":"C) extremes","D":"D) flat","E":"E) fractions","F":"F) overflowing","G":"G) parasites","H":"H) probably","I":"I) sparingly","J":"J) sprinkle","K":"K) steer","L":"L) stimulate","M":"M) sturdy","N":"N) synonymous","O":"O) unique"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q34'
);
SET @q_cet6_2023_12_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_35, NULL, '{"A":"A) apt","B":"B) burning","C":"C) extremes","D":"D) flat","E":"E) fractions","F":"F) overflowing","G":"G) parasites","H":"H) probably","I":"I) sparingly","J":"J) sprinkle","K":"K) steer","L":"L) stimulate","M":"M) sturdy","N":"N) synonymous","O":"O) unique"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q35'
);
SET @q_cet6_2023_12_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_36, NULL, '{"A":"A) apt","B":"B) burning","C":"C) extremes","D":"D) flat","E":"E) fractions","F":"F) overflowing","G":"G) parasites","H":"H) probably","I":"I) sparingly","J":"J) sprinkle","K":"K) steer","L":"L) stimulate","M":"M) sturdy","N":"N) synonymous","O":"O) unique"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q36'
);
SET @q_cet6_2023_12_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_37, 'It is said that agricultural productivity in many African countries has remained low for a century.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q37'
);
SET @q_cet6_2023_12_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_38, 'Building connections between farms and major purchasers of their produce can promote African farmers'' use of advanced farming techniques.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q38'
);
SET @q_cet6_2023_12_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_39, 'Parts of Africa are getting warmer much faster than the average, with southern Africa witnessing roughly twice the global warming rate over the last half century.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q39'
);
SET @q_cet6_2023_12_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_40, 'Improved farming practices have enabled Kenyan farmers to increase farm produce remarkably.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q40'
);
SET @q_cet6_2023_12_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_41, 'Africa is especially susceptible to the effects of global warming partly because it has difficulty feeding its increasing population even without climate change.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q41'
);
SET @q_cet6_2023_12_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_42, 'The use of fertiliser and improved seeds can help Africa''s small farmers impressively increase crop yields.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q42'
);
SET @q_cet6_2023_12_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_43, 'It has proved even more important to shift from traditional farming to setting up businesses that can bring technology and investment to small farmers in Africa.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q43'
);
SET @q_cet6_2023_12_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_44, 'Everyone in the world will have to bear the consequences of climate change, especially Africans.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q44'
);
SET @q_cet6_2023_12_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_45, 'Improvement in farm output per worker in Africa falls far short of that in Asia.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q45'
);
SET @q_cet6_2023_12_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_46, 'In the long term, the potential for small farms in Africa to increase productivity is quite limited, especially owing to the warming climate and a growing population.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q46'
);
SET @q_cet6_2023_12_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_47, 'Why does the formula of tax cuts remain popular though ineffective?', '{"A":"A) Its critics'' voice has not been heard throughout the country.","B":"B) There seem to be no other options available to replace it.","C":"C) The cult of tax cuts has been relentlessly propagated by all policymakers.","D":"D) There appears to be a misunderstanding of the formula among the public."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q47'
);
SET @q_cet6_2023_12_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_48, 'What does the author think is a more effective measure for driving economic growth in the U.S.?', '{"A":"A) Aiding people left behind by economic growth.","B":"B) Prioritizing the growth of the nation''s GDP.","C":"C) Increasing the compensation for labor.","D":"D) Introducing even more extensive tax cuts."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q48'
);
SET @q_cet6_2023_12_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_49, 'What is the logic underlying the author''s viewpoint?', '{"A":"A) The growth of workers'' paychecks ultimately boosts the nation''s economy.","B":"B) Paying a premium to maintain a reliable workforce attracts more customers.","C":"C) Consumption stimulates the desire for higher wages.","D":"D) Familiar arguments for higher wages are outdated."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q49'
);
SET @q_cet6_2023_12_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_50, 'What is the basis for higher wages according to the conventional wisdom?', '{"A":"A) Fairness in distribution.","B":"B) Increase in productivity.","C":"C) The priority of economic policymakers.","D":"D) The unerring judgment of market forces."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q50'
);
SET @q_cet6_2023_12_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_51, 'What do we learn about things in the real world in America for the past 50 years or so?', '{"A":"A) People have failed to see a corresponding increase in wages and in productivity.","B":"B) People have been disheartened by the widening gap between the haves and have-nots.","C":"C) People have witnessed a tug of war between Republicans and Democrats over tax cuts.","D":"D) People have seen the link disappearing between productivity and workers'' well-being."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q51'
);
SET @q_cet6_2023_12_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_52, 'What would we expect an editorial board of an academic journal to exhibit in view of its important responsibilities?', '{"A":"A) Insight.","B":"B) Expertise.","C":"C) Integrity.","D":"D) Diversity."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q52'
);
SET @q_cet6_2023_12_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_53, 'What do we learn from the findings of a new study in Nature Neuroscience?', '{"A":"A) The majority of top psychology and neuroscience journals reflect a variety of voices, experiences and identities.","B":"B) The editorial boards of most psychology and neuroscience journals do influence the direction their field takes.","C":"C) The editorial boards of the most important journals in psychology and neuroscience are male-dominated.","D":"D) The majority of editors in top psychology and neuroscience journals have relevant backgrounds."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q53'
);
SET @q_cet6_2023_12_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_54, 'What fact does the author highlight concerning the gender differences in editors of psychology journals?', '{"A":"A) There were quite a few female editors who also distinguished themselves as influential psychology researchers.","B":"B) The number of female editors was simply disproportionate to that of women engaged in psychology research.","C":"C) The proportion of female editors was increasingly lower at senior levels.","D":"D) There were few female editors who could move up to senior positions."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q54'
);
SET @q_cet6_2023_12_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_55, 'What can we infer from the conclusion drawn by the team of the new study on the basis of their findings?', '{"A":"A) Women''s views are underrepresented in the editorial boards of top psychology and neuroscience journals.","B":"B) Male editors of top psychology and neuroscience journals tend to be biased against their female colleagues.","C":"C) Male researchers have enough representation in the editorial boards to ensure their publications.","D":"D) Female editors have to struggle to get women''s research articles published in academic journals."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-1-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q55'
);
SET @q_cet6_2023_12_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_1_56, 'What does the author suggest we do instead of simply blaming the inequality of editorial boards on tradition?', '{"A":"A) Strike a balance between male and female editors.","B":"B) Increase women''s employment in senior positions.","C":"C) Enlarge the body of female academics.","D":"D) Implement overall structural reforms."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_1_56
);

-- ==================== cet6-2023-12-2 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-r1', 'BANKED_CLOZE', 'CET6', NULL, 'Our brains respond to language expressing facts differently than they do to words conveying possibility, scientists at New York University have recently found. Their work offers new insights into the impact word choice has on how we __26__ between statements expressing what is real versus what is merely possible. The researchers assert their findings are important because we are presented with false information all the time. Some of this is __27__ , as is the case with deceptive advertisements, but the problem is __28__ by individuals who believe they are sharing correct information. Thus, it is more important than ever to separate the factual from the possible or merely __29__ in how we communicate. This is especially true as the study makes clear that information presented as fact __30__ special responses in our brains, which are distinct from when we process the same content with clear indicators of __31__ . In their new study, the scientists intended to __32__ how the brain computes possibilities as expressed by words such as "may," "might," and "if." The researchers compared brain responses to statements expressing factual __33__ and those expressing possibility. "There is a monster under my bed" exemplifies a factual statement. "I will stay home," is also factual. This is opposed to statements that express possibility, like "There might be a monster under my bed," or "If it rains, I will stay home." The results of the study showed that factual language __34__ a rapid increase in brain activity, with the brain responding more powerfully and showing more engagement with factual phrases compared to those communicating possibility. Thus, facts rule when it comes to the brain. Brain regions involved in processing __35__ rapidly distinguish facts from possibilities. Further, these regions respond in a much more robust fashion to factual statements.', NULL, '["A) activated","B) aggravated","C) ascertain","D) deliberate","E) differentiate","F) discourse","G) evokes","H) inhibit","I) manuscript","J) marvels","K) remnants","L) scenarios","M) speculative","N) unanimous","O) uncertainty"]', 298, 'IMPORT', 'cet6-2023-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-2-r1'
);
SET @pg_cet6_2023_12_2_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-2-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-r2', 'MATCHING', 'CET6', 'Treasure Fever', 'A) Most visitors come to Cape Canaveral, on the northeast coast of Florida, for the tourist attractions. It''s home to the second-busiest cruise ship port in the world and is a gateway to the cosmos. Nearly 1.5 million visitors flock here every year to watch rockets, spacecraft, and satellites blast off into the solar system from Kennedy Space Center Visitor Complex. Nearly 64 kilometers of undeveloped beach and 648 square kilometers of protected refuge fan out from the cape''s sandy shores. B) Yet some of Cape Canaveral''s most legendary attractions lie unseen, wedged under the sea''s surface in mud and sand, for this part of the world has a reputation as a deadly ship trap. Over the centuries, dozens of majestic Old World sailing ships smashed and sank on this irregular stretch of windy Florida coast. They were vessels built for war and commerce, crossing the globe carrying everything from coins to cannons, boxes of silver and gold, chests of jewels and porcelain, and pearls from the Caribbean. C) Cape Canaveral contains one of the greatest concentrations of colonial shipwrecks in the world. In recent years, advances in radar, diving, detection equipment, computers, and GPS have transformed the hunt. The naked eye might see a pile of rocks, but technology can reveal the precious artifacts(人工制品) that lie hidden on the ocean floor. D) As technology renders the seabed more accessible, the hunt for treasure-filled ships has drawn a fresh tide of salvors(打捞人员) and their investors—as well as marine archaeologists(考古学家) wanting to bring to light the lost relics. But of late, when salvors have found vessels, their rights have been challenged in court. The big question: who should have control of these treasures? E) High-stakes fights over shipwrecks pit archaeologists against treasure hunters in a vicious cycle of accusations. Archaeologists regard themselves as protectors of history, and they see salvors as careless destroyers. Salvors feel they do the hard work of searching for ships, only to have them stolen from under them when discovered. This kind of clash inevitably takes place on a grand scale. Aside from the salvors, their investors, and the maritime archaeologists who serve as expert witnesses, the battles sweep in local and international governments and organizations like UNESCO that work to protect under-water heritage. The court cases that ensue stretch on for years. Are finders keepers, or do the ships belong to the countries that made them and sent them sailing centuries ago? Where once salvors and archaeologists worked side by side, now they belong to opposing, and equally contemptuous, tribes. F) Nearly three million vessels lie wrecked on the Earth''s ocean floor—from old canoes to the Titanic—and likely less than one percent have been explored. Some—like an ancient Roman ship found off Antikythera, Greece, dated between 70 and 60 BC and carrying astonishingly sophisticated gears and dials for navigating by the sun—are critical to a new understanding of our past. No wonder there is an eternal stirring among everybody from salvors to scholars to find them. G) In May 2016, a salvor named Bobby Pritchett, president of Global Marine Exploration (GME) in Tampa, Florida, announced that he had discovered scattered remains of a ship buried a kilometer off Cape Canaveral. Over the prior three years, he and his crew had obtained 14 state permits to survey a nearly 260-square- kilometer area off the cape; they worked 250 days a year, backed by investor funds of, he claims, US $4 million. It was hard work. Crew members were up at dawn, dragging sensors from their expedition vessels back and forth, day in and day out, year after year, to detect metal of any kind. Using computer technology, Pritchett and his crew created intricate, color-coded maps marked with the GPS coordinates of thousands of finds, all invisible under a meter of sand. H) One day in 2015, the magnetometer(磁力计) picked up metal that turned out to be an iron cannon; when the divers blew the sand away, they also discovered a more precious bronze cannon with markings indicating French royalty and, not far off, a famous marble column carved with the coat of arms of France, known from historical paintings. The discovery was cause for celebration. The artifacts indicated the divers had likely found the wreck of La Trinité, a 16th-century French vessel that had been at the center of a bloody battle between France and Spain that changed the fate of the United States of America. I) And then the legal storm began, with GME and Pritchett pitted against Florida and France. The Sunken Military Craft Act of 2004, a US federal act, protects any vessel that was on a military mission, allowing the originating country to claim their ship even centuries later. In 2018, two long years after Pritchett''s discovery, the federal district court ruled in favor of France. For Pritchett, the decision was devastating. Millions of dollars of investor funding and years of labor were lost. J) But this is far from the first time a salvor has lost all rights to a discovery. In 2012, for instance, Spain won a five-year legal battle against Odyssey Marine Exploration, which had hauled 594,000 gold and silver coins from a Spanish wreck off the coast of Portugal across the Atlantic to the United States. "Treasure hunters can be naive," says attorney David Concannon, who has had several maritime archaeologists as clients and represented two sides in the battles over the Titanic for 20 years. "Many treasure hunters don''t understand they are going to have to fight for their rights against a government that has an endless supply of money for legal battles that treasure hunters are likely to lose." K) Putting an inflated price on artifacts rather than viewing them as cultural and historical treasures that transcend any price is what irritates many archaeologists. For the archaeologist, everything in a wreck matters —hair, fabric, a fragment of a newspaper, rat bones-all things speak volumes. Archaeologists don''t want artifacts ending up in a private collection instead of taking humanity on a journey of understanding. L) George Bass is one of the pioneers of under-water archaeology, and a researcher at Texas A&M University. He has testified in court against treasure hunters, but says archaeology is not without its own serious problems. He believes archaeologists need to do a better job themselves instead of routinely criticizing treasure hunters. "Archaeology has a terrible reputation for not publishing enough on its excavations(发掘) and finds," he says. Gathering data, unearthing and meticulously preserving and examining finds, verifying identity and origin, piecing together the larger story, and writing and publishing a comprehensive paper or book can take decades. A bit cynically, Bass describes colleagues who never published because they waited so long they became ill or died. Who is more at fault, Bass asks, the professional archaeologist who carefully excavates a site and never publishes on it or the treasure hunter who locates a submerged wreck, salvages part, conserves part, and publishes a book on the operation? M) Pritchett concedes that his find deserves careful excavation and preservation. "I think what I found should go in a museum," he says. "But I also think I should get paid for what I found." Indeed, it''s a bit of a mystery why governments, archaeologists, and treasure hunters can''t work together—and why salvors aren''t at least given a substantial finder''s fee before the original owner takes possession of the vessel and its artifacts.', NULL, NULL, 1236, 'IMPORT', 'cet6-2023-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-2-r2'
);
SET @pg_cet6_2023_12_2_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-2-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-r3', 'CAREFUL_READING', 'CET6', NULL, 'Could you get by without using the internet for four and a half years? That''s exactly what singer and actress Selena Gomez has done in a bid to improve her mental health. She has spoken extensively about the relationship between her social media usage and her mental wellbeing, recalling feeling like "an addict" when she became Instagram''s most followed user in 2016. "Taking a break from social media was the best decision that I''ve ever made for my mental health", says she. "The unnecessary hate and comparisons went away once I put my phone down." Ditching the web at large, however, is a far more subtle and complicated prospect. The increasing digitisation of our society means that everything from paying a gas bill to plotting a route to a friend''s house and even making a phone call is at the mercy of your internet connection. Actively opting out of using the internet becomes a matter of privilege. Ms Gomez''s multi-millionaire status has allowed her to take the "social" out of social media, so she can continue to leverage her enormous fame while keeping the trolls(恶意挑衅的帖子) at bay. The fact that she''s still the second most-followed woman on Instagram suggests it''s entirely possible to maintain a significant web profile to promote various projects—by way of a dedicated team—without being exposed to the cruel comments, hate mail and rape or death threats. It goes without saying that this is fundamentally different from how the rest of us without beauty deals and films to publicise use the likes of Instagram, TikTok and Twitter, but even the concept of a digital detox(戒瘾) requires having a device and connectivity to choose to disconnect from. The UK''s digital divide has worsened over the past two years, leaving poorer families without broadband connections in their homes. Digital exclusion is a major threat to wider societal equality in the UK, so witnessing companies like Facebook championing the metaverse(元宇宙) as the next great frontier when school children are struggling to complete their homework feels particularly irritating. Consequently, it''s worth bearing in mind that while deleting all social media accounts will undoubtedly make some feel infinitely better, many other people benefit from the strong sense of community that sharing platforms can breed. Internet access will continue to grow in importance as we edge further towards web 3.0, and greater resources and initiatives are needed to provide the underprivileged with the connectivity they desperately need to learn, work and live. It''s crucial that people who feel that social media is having a detrimental effect on their mental health are allowed to switch off and for those living in digital exclusion to be able to switch on in the first place.', NULL, NULL, 449, 'IMPORT', 'cet6-2023-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-2-r3'
);
SET @pg_cet6_2023_12_2_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-2-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-r4', 'CAREFUL_READING', 'CET6', NULL, 'Psychologists have long been in disagreement as to whether competition is a learned or a genetic component of human behavior. Whatever it is, you cannot but recognize the effect competition is exerting in academics and many other areas of contemporary life. Psychologically speaking, competition has been seen as an inevitable consequence of human drives. According to Sigmund Freud, humans are born screaming for attention and full of organic drives for fulfillment in various areas. Initially, we compete for the attention of our parents. Thereafter, we are at the mercy of a battle between our base impulses for self-fulfillment and social and cultural norms which prohibit pure indulgence. Current work in anthropology(人类学) has suggested, however, that this view of the role of competition in human behavior may be incorrect. Thomas Hobbes, one of the great philosophers of the seventeenth century, is perhaps best remembered for his characterization of the "natural world," that is, the world before the imposition of the will of humanity, as being "nasty, brutish, and short." This image of the pre-rational world is still widely held, reinforced by Charles Darwin''s highly influential work, The Origin of Species, which established the doctrine of natural selection. This doctrine, which takes for granted that those species best able to adapt to and master the natural environment in which they live will survive, has suggested that the struggle for survival is an inherent human trait which determines a person''s success. Darwin''s theory has even been summarized as "survival of the fittest"—a phrase Darwin himself never used—further highlighting competition''s role in success. As it has often been pointed out, however, there is nothing in the concept of natural selection that suggests that competition is the most successful strategy for "survival of the fittest." Darwin asserted in The Origin of Species that the struggles he was describing should be viewed as metaphors and could easily include dependence and cooperation. Many studies have been conducted to test the importance placed on competition as opposed to other values, such as cooperation—by various cultures, and generally conclude that Americans uniquely praise competition as natural, inevitable, and desirable. In 1937, the world-renowned anthropologist Margaret Mead published Cooperation and Competition among Primitive Peoples, based on her studies of several societies that did not prize competition, and, in fact, seemed at times to place a negative value on it. One such society was the Zuni Indians of Arizona, and they, Mead found, valued cooperation far more than competition. After studying dozens of such cultures, Mead''s final conclusion was that competitiveness is a culturally created aspect of human behavior, and that its prevalence in a particular society is relative to how that society values it.', NULL, NULL, 444, 'IMPORT', 'cet6-2023-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-2-r4'
);
SET @pg_cet6_2023_12_2_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-2-r4' LIMIT 1);

-- 翻译 cet6-2023-12-2
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-translation'
);
SET @q_cet6_2023_12_2_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_01, '随着经济与社会的发展，中国人口结构发生了显著变化，逐渐步入老龄化社会。中国老年人口将持续增加，人口老龄化趋势将更加明显。为了应对人口老龄化带来的种种挑战，国家正积极采取措施，加大对养老的支持。通过改革社会保障(social security)制度，政府不断增加社会保障经费，逐步扩大社会保障覆盖范围，使更多老年人受益。政府还鼓励各种社会团体为老年人提供服务。在政府和社会团体的共同努力下，老年人将生活得更加幸福。', NULL, 'With the development of the economy and society, China’s population structure has undergone remarkable changes and is gradually entering an aging society. China’s elderly population will continue to increase, and the trend of population aging will become more pronounced. To cope with the various challenges brought by population aging, the country is actively taking measures to increase its support for elderly care. By reforming the social security system, the government keeps increasing social security funding and gradually expanding its coverage, so that more elderly people can benefit. In addition, the government encourages various social organizations to provide services for the elderly. With the joint efforts of the government and social organizations, the elderly will live a happier life.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_01
);

-- 听力 Q1 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q01', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q01'
);
SET @q_cet6_2023_12_2_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_02, NULL, '{"A":"A) Renting a car instead of driving their own.","B":"B) Surfing online to check out the best deals.","C":"C) Exploring more summer holiday resorts.","D":"D) Spending their holidays in a novel way."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_02
);

-- 听力 Q2 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q02', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q02'
);
SET @q_cet6_2023_12_2_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_03, NULL, '{"A":"A) He once owned a van.","B":"B) He was well travelled.","C":"C) He did not find holiday homes appealing.","D":"D) He did not like to be locked into one place."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_03
);

-- 听力 Q3 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q03', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q03'
);
SET @q_cet6_2023_12_2_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_04, NULL, '{"A":"A) Ensure the safety of passengers.","B":"B) Drive under any weather condition.","C":"C) Receive instructions via computers.","D":"D) Generate their own electricity."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_04
);

-- 听力 Q4 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q04', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q04'
);
SET @q_cet6_2023_12_2_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_05, NULL, '{"A":"A) Having one''s basic needs covered while away from home.","B":"B) Enjoying the freedom to choose where to go and work.","C":"C) Slowing down in one''s increasingly hectic life.","D":"D) Riding one''s mountain bike on vacation."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_05
);

-- 听力 Q5 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q05', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q05'
);
SET @q_cet6_2023_12_2_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_06, NULL, '{"A":"A) She has missed several important appointments lately.","B":"B) Her job performance has worsened over the past month.","C":"C) She has lagged behind most of her co-workers in output.","D":"D) Her physical health has deteriorated these past few weeks."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_06
);

-- 听力 Q6 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q06', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q06'
);
SET @q_cet6_2023_12_2_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_07, NULL, '{"A":"A) Serious health issues.","B":"B) Disturbance of her mind.","C":"C) Some problems at home.","D":"D) Penalty for curtailed output."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_07
);

-- 听力 Q7 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q07', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q07'
);
SET @q_cet6_2023_12_2_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_08, NULL, '{"A":"A) The woman''s work proficiency.","B":"B) The woman''s whole-hearted support.","C":"C) His engaging personality.","D":"D) His management capability."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q08', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q08'
);
SET @q_cet6_2023_12_2_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_09, NULL, '{"A":"A) The woman will resume her work in two weeks.","B":"B) The man will be back at his 100% in a couple of weeks.","C":"C) The woman will be off work on the next two Mondays.","D":"D) The man will help the woman get back to her usual self."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_09
);

-- 听力 Q9 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q09', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q09'
);
SET @q_cet6_2023_12_2_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_10, NULL, '{"A":"A) It can have an impact on our moods and emotions.","B":"B) It can enable us to live a healthier and longer life.","C":"C) It can improve our financial status significantly.","D":"D) It can help us achieve better work performance."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_10
);

-- 听力 Q10 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q10', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q10'
);
SET @q_cet6_2023_12_2_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_11, NULL, '{"A":"A) One''s health tends to differ before and after marriage.","B":"B) One''s health status is related to one''s social background.","C":"C) The wealthier one''s spouse is, the healthier one becomes.","D":"D) The spouse''s level of education can impact one''s health."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_11
);

-- 听力 Q11 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q11', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q11'
);
SET @q_cet6_2023_12_2_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_12, NULL, '{"A":"A) They benefited a lot from their career achievements.","B":"B) They showed interest in their spouse''s occupations.","C":"C) They had much in common with their spouses.","D":"D) They had more education than their spouses."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_12
);

-- 听力 Q12 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q12', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q12'
);
SET @q_cet6_2023_12_2_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_13, NULL, '{"A":"A) Eliminating their root cause.","B":"B) Forecasting flood risks accurately.","C":"C) Identifying the cities'' geological features.","D":"D) Finding out the changing climate patterns."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_13
);

-- 听力 Q13 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q13', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q13'
);
SET @q_cet6_2023_12_2_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_14, NULL, '{"A":"A) To validate his hypothesis about the gravity of floods.","B":"B) To determine the frequency of high tides causing floods.","C":"C) To improve his mathematical flooding model.","D":"D) To see the feasibility of his project on flooding."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_14
);

-- 听力 Q14 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q14', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q14'
);
SET @q_cet6_2023_12_2_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_15, NULL, '{"A":"A) To study the consequences of high tides on flooded areas.","B":"B) To teach local citizens how to collect data of incoming floods.","C":"C) To forecast rapid floods in real time.","D":"D) To classify the flooding data processed."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_15
);

-- 听力 Q15 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q15', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q15'
);
SET @q_cet6_2023_12_2_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_16, NULL, '{"A":"A) They set up Internet-connected water-level sensors.","B":"B) They tracked the rising tides with video-cameras.","C":"C) They used newly-developed supercomputing facilities.","D":"D) They observed the direction of water flow on the spot."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_16
);

-- 听力 Q16 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q16', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q16'
);
SET @q_cet6_2023_12_2_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_17, NULL, '{"A":"A) To argue about the value of a college degree.","B":"B) To debate the validity of current survey data.","C":"C) To account for the drastic decline in employment among men.","D":"D) To compare men without college degrees with those who have."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_17
);

-- 听力 Q17 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q17', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q17'
);
SET @q_cet6_2023_12_2_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_18, NULL, '{"A":"A) The increase in women taking up jobs.","B":"B) The issue of changing job requirements.","C":"C) The factor of wages.","D":"D) The impact of inflation."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_18
);

-- 听力 Q18 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q18', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q18'
);
SET @q_cet6_2023_12_2_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_19, NULL, '{"A":"A) Men''s unwillingness to accept low wages in times of growing inflation.","B":"B) The wage gap between those with college degrees and those without.","C":"C) More jobs requiring their holders to have a college degree nowadays.","D":"D) The sharp decline in marriage among men with no college degrees."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_19
);

-- 听力 Q19 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q19', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q19'
);
SET @q_cet6_2023_12_2_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_20, NULL, '{"A":"A) More and more people attach importance to protecting endangered animals.","B":"B) More and more people prioritize animal welfare when buying things to wear.","C":"C) An increasing number of people demand to free animals being kept in cages.","D":"D) An increasing number of people follow the latest trend of becoming vegetarians."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_20
);

-- 听力 Q20 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q20', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q20'
);
SET @q_cet6_2023_12_2_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_21, NULL, '{"A":"A) Avoided the use of leather and fur.","B":"B) Labelled all their products as vegan.","C":"C) Refrained from using chemicals in their products.","D":"D) Utilized a silk substitute made from mushrooms."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_21
);

-- 听力 Q21 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q21', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q21'
);
SET @q_cet6_2023_12_2_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_22, NULL, '{"A":"A) Whether they actually signify a substantial change.","B":"B) Whether they effectively protect animals at large.","C":"C) Whether they can be considered sustainable.","D":"D) Whether they can be regarded as ethical."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_22
);

-- 听力 Q22 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q22', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q22'
);
SET @q_cet6_2023_12_2_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_23, NULL, '{"A":"A) The era we live in is the most peaceful in history.","B":"B) The world has seen more violence in recent years.","C":"C) The environmental welfare has worsened in the world.","D":"D) The belief is less prevalent that the world is going to hell."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_23
);

-- 听力 Q23 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q23', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q23'
);
SET @q_cet6_2023_12_2_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_24, NULL, '{"A":"A) They were actually not in their right mind.","B":"B) They believed the world was deteriorating.","C":"C) They did not wish to live in the previous century.","D":"D) They were convinced by the statistics presented to them."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_24
);

-- 听力 Q24 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q24', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q24'
);
SET @q_cet6_2023_12_2_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_25, NULL, '{"A":"A) The subjectivity of mass media.","B":"B) The current state of affairs.","C":"C) Our psychological biases.","D":"D) Our ancestors'' influence."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_25
);

-- 听力 Q25 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q25', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q25'
);
SET @q_cet6_2023_12_2_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_26, NULL, '{"A":"A) Spreading exciting news around us far and wide.","B":"B) Vacuuming up depressing or enraging stories.","C":"C) Calculating dangerous risks to our survival.","D":"D) Paying attention to negative information."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q26'
);
SET @q_cet6_2023_12_2_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_27, NULL, '{"A":"A) activated","B":"B) aggravated","C":"C) ascertain","D":"D) deliberate","E":"E) differentiate","F":"F) discourse","G":"G) evokes","H":"H) inhibit","I":"I) manuscript","J":"J) marvels","K":"K) remnants","L":"L) scenarios","M":"M) speculative","N":"N) unanimous","O":"O) uncertainty"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q27'
);
SET @q_cet6_2023_12_2_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_28, NULL, '{"A":"A) activated","B":"B) aggravated","C":"C) ascertain","D":"D) deliberate","E":"E) differentiate","F":"F) discourse","G":"G) evokes","H":"H) inhibit","I":"I) manuscript","J":"J) marvels","K":"K) remnants","L":"L) scenarios","M":"M) speculative","N":"N) unanimous","O":"O) uncertainty"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q28'
);
SET @q_cet6_2023_12_2_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_29, NULL, '{"A":"A) activated","B":"B) aggravated","C":"C) ascertain","D":"D) deliberate","E":"E) differentiate","F":"F) discourse","G":"G) evokes","H":"H) inhibit","I":"I) manuscript","J":"J) marvels","K":"K) remnants","L":"L) scenarios","M":"M) speculative","N":"N) unanimous","O":"O) uncertainty"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q29'
);
SET @q_cet6_2023_12_2_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_30, NULL, '{"A":"A) activated","B":"B) aggravated","C":"C) ascertain","D":"D) deliberate","E":"E) differentiate","F":"F) discourse","G":"G) evokes","H":"H) inhibit","I":"I) manuscript","J":"J) marvels","K":"K) remnants","L":"L) scenarios","M":"M) speculative","N":"N) unanimous","O":"O) uncertainty"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q30'
);
SET @q_cet6_2023_12_2_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_31, NULL, '{"A":"A) activated","B":"B) aggravated","C":"C) ascertain","D":"D) deliberate","E":"E) differentiate","F":"F) discourse","G":"G) evokes","H":"H) inhibit","I":"I) manuscript","J":"J) marvels","K":"K) remnants","L":"L) scenarios","M":"M) speculative","N":"N) unanimous","O":"O) uncertainty"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q31'
);
SET @q_cet6_2023_12_2_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_32, NULL, '{"A":"A) activated","B":"B) aggravated","C":"C) ascertain","D":"D) deliberate","E":"E) differentiate","F":"F) discourse","G":"G) evokes","H":"H) inhibit","I":"I) manuscript","J":"J) marvels","K":"K) remnants","L":"L) scenarios","M":"M) speculative","N":"N) unanimous","O":"O) uncertainty"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q32'
);
SET @q_cet6_2023_12_2_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_33, NULL, '{"A":"A) activated","B":"B) aggravated","C":"C) ascertain","D":"D) deliberate","E":"E) differentiate","F":"F) discourse","G":"G) evokes","H":"H) inhibit","I":"I) manuscript","J":"J) marvels","K":"K) remnants","L":"L) scenarios","M":"M) speculative","N":"N) unanimous","O":"O) uncertainty"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q33'
);
SET @q_cet6_2023_12_2_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_34, NULL, '{"A":"A) activated","B":"B) aggravated","C":"C) ascertain","D":"D) deliberate","E":"E) differentiate","F":"F) discourse","G":"G) evokes","H":"H) inhibit","I":"I) manuscript","J":"J) marvels","K":"K) remnants","L":"L) scenarios","M":"M) speculative","N":"N) unanimous","O":"O) uncertainty"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q34'
);
SET @q_cet6_2023_12_2_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_35, NULL, '{"A":"A) activated","B":"B) aggravated","C":"C) ascertain","D":"D) deliberate","E":"E) differentiate","F":"F) discourse","G":"G) evokes","H":"H) inhibit","I":"I) manuscript","J":"J) marvels","K":"K) remnants","L":"L) scenarios","M":"M) speculative","N":"N) unanimous","O":"O) uncertainty"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q35'
);
SET @q_cet6_2023_12_2_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_36, NULL, '{"A":"A) activated","B":"B) aggravated","C":"C) ascertain","D":"D) deliberate","E":"E) differentiate","F":"F) discourse","G":"G) evokes","H":"H) inhibit","I":"I) manuscript","J":"J) marvels","K":"K) remnants","L":"L) scenarios","M":"M) speculative","N":"N) unanimous","O":"O) uncertainty"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q36'
);
SET @q_cet6_2023_12_2_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_37, 'Exploration of shipwrecks on the sea floor is crucial in updating our understanding of humanity''s past.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q37'
);
SET @q_cet6_2023_12_2_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_38, 'Quite a number of majestic ships sailing from Europe to America were wrecked off the Florida coast over the centuries.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q38'
);
SET @q_cet6_2023_12_2_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_39, 'Pritchett suffered a heavy loss when a US district court ruled against him.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q39'
);
SET @q_cet6_2023_12_2_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_40, 'Recently, people who found treasures in shipwrecks have been sued over their rights to own them.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q40'
);
SET @q_cet6_2023_12_2_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_41, 'Pritchett claims he got support of millions of dollars from investors for his shipwreck exploration.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q41'
);
SET @q_cet6_2023_12_2_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_42, 'One pioneer marine scientist thinks archaeologists should make greater efforts to publish their findings.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q42'
);
SET @q_cet6_2023_12_2_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_43, 'With technological advancement in recent years, salvors now can detect the invaluable man-made objects lying buried under the sea.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q43'
);
SET @q_cet6_2023_12_2_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_44, 'According to a lawyer, many treasure hunters are susceptible to loss because they are unaware they face a financially stronger opponent in court.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q44'
);
SET @q_cet6_2023_12_2_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_45, 'Salvors of treasures in sunken ships and marine archaeologists are now hostile to each other.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q45'
);
SET @q_cet6_2023_12_2_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_46, 'Archaeologists want to see artifacts help humans understand their past instead of being sold to private collectors at an outrageous price.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q46'
);
SET @q_cet6_2023_12_2_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_47, 'What do we learn about singer and actress Selena Gomez in the past four and a half years?', '{"A":"A) She has had worsening mental problems.","B":"B) She has won Instagram''s most followers.","C":"C) She has refrained from using social media.","D":"D) She has succeeded in a bid on the internet."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q47'
);
SET @q_cet6_2023_12_2_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_48, 'Why does actively opting out of using the internet become a matter of privilege?', '{"A":"A) Most people find it subtle and complicated to give up using the internet.","B":"B) Most people can hardly ditch the web while avoiding hate and comparisons.","C":"C) Most people can hardly get by without the internet due to growing digitisation.","D":"D) Most people have been seriously addicted to the web without being aware of it."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q48'
);
SET @q_cet6_2023_12_2_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_49, 'Why does the author say "witnessing companies…feels particularly irritating"(Lines 2-4, Para. 6)?', '{"A":"A) The UK digital divide would further worsen due to the metaverse.","B":"B) The concept of the metaverse is believed to be still quite illusory.","C":"C) School children would be drawn farther away from the real world.","D":"D) Most families in the UK do not have stable broadband connections."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q49'
);
SET @q_cet6_2023_12_2_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_50, 'What is worth bearing in mind concerning social media platforms?', '{"A":"A) They are conducive to promoting societal equality.","B":"B) They help many people feel connected with others.","C":"C) They provide a necessary device for a digital detox.","D":"D) They create a virtual community on the internet."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q50'
);
SET @q_cet6_2023_12_2_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_51, 'What does the author think is really important for those living in digital exclusion?', '{"A":"A) Having access to the internet.","B":"B) Edging further towards web 3.0.","C":"C) Getting more educational resources.","D":"D) Opening more social media accounts."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q51'
);
SET @q_cet6_2023_12_2_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_52, 'What does the author think is easy to see in many areas of contemporary life?', '{"A":"A) The disagreement on the inevitability of competition.","B":"B) The consequence of psychological investigation.","C":"C) The effect of human drives.","D":"D) The impact of competition."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q52'
);
SET @q_cet6_2023_12_2_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_53, 'According to psychology, what do people strive to do following the initial stage of their life?', '{"A":"A) Fulfill individual needs without incurring adverse effects of human drives.","B":"B) Indulge in cultural pursuits while keeping their base impulses at bay.","C":"C) Gain extensive recognition without exposing pure indulgence.","D":"D) Satisfy their own desires while observing social conventions."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q53'
);
SET @q_cet6_2023_12_2_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_54, 'What do we learn about the "natural world" characterized by Thomas Hobbes?', '{"A":"A) It gets misrepresented by philosophers and anthropologists.","B":"B) It gets distorted in Darwin''s The Origin of Species.","C":"C) It is free from the rational intervention of humans.","D":"D) It is the pre-rational world rarely appreciated nowadays."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q54'
);
SET @q_cet6_2023_12_2_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_55, 'What can we conclude from Darwin''s assertion in The Origin of Species?', '{"A":"A) All species inherently depend on others for survival.","B":"B) Struggles for survival do not exclude mutual support.","C":"C) Competition weighs as much as cooperation as a survival strategy.","D":"D) The strongest species proves to be the fittest in natural selection."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-2-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q55'
);
SET @q_cet6_2023_12_2_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-2-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_2_56, 'What conclusion did Margaret Mead reach after studying dozens of different cultures?', '{"A":"A) It is characteristic of humans to be competitive.","B":"B) Americans are uniquely opposed to cooperation.","C":"C) Competition is relatively more prevalent in Western societies.","D":"D) People''s attitude towards competition is actually culture-bound."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_2_56
);

-- ==================== cet6-2023-12-3 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-r1', 'BANKED_CLOZE', 'CET6', NULL, 'Modern U.S. cities were designed to make exercise unnecessary. Cars and elevators once symbolized urban areas as machines for more efficient living. Now it is clear that these improvements provide great benefits but also __26__ health costs. Recent studies show that urban __27__ encourages more driving and is associated with heavier weight. This __28__ suggests that the layout and design of cities can hinder or promote healthier lifestyle choices and it is __29__ that urban planners bear this in mind. Unfortunately, urban planning still centers in large part on solving the problems of the past. Of course cities still need to __30__ standard public health practices, such as separating toxic facilities from homes and restricting heavy truck traffic through __31__ residential areas. But it''s also important to create healthier cities —and the discussion is already underway. More and more city planners are paying increasing attention to encouraging physical activity by making it easier and safer for people to recreate, walk, bike and take public transportation. Many studies of __32__ show that people live the longest in environments where physical activity is part of everyday life. Providing more walkable spaces, better protected bike lanes and more __33__ spaces are important steps. But even smaller changes can be effective. Cities can close off streets on weekends to encourage communities to get out and walk. They also can provide more seating in public places, so that less-fit residents can rest during their journeys. Using public spaces in cities as places where people can exercise promotes __34__ , rather than allowing physical activity to become restricted to private gyms with often-expensive monthly fees that __35__ less wealthy people from joining.', NULL, '["A) correlation","B) dense","C) deter","D) equity","E) foster","F) imperative","G) impose","H) irrespective","I) longevity","J) navigate","K) recreational","L) rotten","M) sprawl","N) vibrate","O) vicinity"]', 276, 'IMPORT', 'cet6-2023-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-3-r1'
);
SET @pg_cet6_2023_12_3_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-3-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-r2', 'MATCHING', 'CET6', 'Can Learning a Foreign Language Prevent Dementia?', 'A) You may have heard that learning another language is one method for preventing or at least postponing the onset of dementia. Dementia refers to the loss of cognitive abilities, and one of its most common forms is Alzheimer''s disease(阿尔茨海默氏病). At this time, the causes of the disease are not well understood, and consequently, there are no proven steps that people can take to prevent it. Nonetheless, some researchers have suggested that learning a foreign language might help delay the onset of dementia. B) To explore this possibility more deeply, let''s look at some of the common misconceptions about dementia and the aging brain. First of all, dementia is not an inevitable part of the normal aging process. Most older adults do not develop Alzheimer''s disease or other forms of dementia. It is also important to remember that dementia is not the same thing as normal forgetfulness. At any age, we might experience difficulty finding the exact word we want or have trouble remembering the name of the person we just met. People with dementia have more serious problems, like feeling confused or getting lost in a familiar place. Think of it this way: If you forget where you parked your car at the mall, that''s normal; if you forget how to drive a car, that may be a signal that something more serious is going on. C) The idea that dementia can be prevented is based on the comparison of the brain to a muscle. When people talk about the brain, they sometimes say things like "It is important to exercise your brain" or "To stay mentally fit, you have to give your brain a workout." Although these are colorful analogies, in reality the brain is not a muscle. Unlike muscles, the brain is always active and works even during periods of rest and sleep. In addition, although some muscle cells have a lifespan of only a few days, brain cells last a lifetime. Not only that, but it has been shown that new brain cells are being created throughout one''s lifespan. D) While it makes for a colorful analogy, comparing the brain to a muscle is inaccurate and misleading. So, if the brain is not a muscle, can it still be exercised? Once again, researchers don''t know for sure. There are now many computer, online, and mobile device applications that claim to be able to "train your brain," and they typically tap into a variety of cognitive abilities. However, research suggests that although this type of training may improve one''s abilities at the tasks themselves, they don''t seem to improve other abilities. In other words, practicing a letter-detection task will, over time, improve your letter-detection skills, but it will not necessarily enhance your other perceptual abilities. E) However, there is some reason to believe that learning languages might be different. The best evidence that foreign language learning confers cognitive benefits comes from research with those who are already bilingual(双语的). Bilingualism most commonly occurs when children are exposed to two languages, either in the home (mom speaks Dutch, dad speaks Spanish) or more formally in early schooling. But bilingualism certainly occurs in adulthood as well. F) Bilingualism and multilingualism are actually more common than you might think. In fact, it has been estimated that there are fewer monolingual speakers in the world than bilinguals and multilinguals. Although in many countries most inhabitants share just one language, other countries have several official languages. Switzerland, for example, has four official languages: German, French, Italian, and Romansh. Throughout large parts of Africa, Arabic, Swahili, French, and English are often known and used by individuals who speak a different, native language in their home than they do in the marketplace. So bilingualism and multilingualism are to be found throughout the world. And with regard to cognitive abilities, the research on those who speak more than one language paints an encouraging picture. G) For one thing, bilinguals are better at multitasking. One explanation of this superiority is that speakers of two languages are continually inhibiting one of their languages, and this process of inhibition confers general cognitive benefits to other activities. In fact, bilingual individuals outperform their monolingual counterparts on a variety of cognitive tasks, such as following complex instructions, and switching to new instructions. For the sake of completeness, it should be noted that the advantages of being bilingual are not universal across all cognitive domains. Bilingual individuals have been shown to have smaller vocabularies and to take longer in retrieving words from memory when compared to monolinguals. In the long run, however, the cognitive and linguistic advantages of being bilingual far outweigh these two drawbacks. H) If the benefits of being bilingual spill over to other aspects of cognition, then we would expect to see a lower incidence of Alzheimer''s disease in bilinguals than in monolinguals, or at least a later onset of Alzheimer''s for bilinguals. In fact, there is evidence to support this claim. The psychologist Ellen Bialystok and her colleagues obtained the histories of 184 individuals who had made use of a memory clinic in Toronto. For those who showed signs of dementia, the monolinguals in the sample had an average age of 71.4 years at time of onset. The bilinguals, in contrast, received their diagnosis at 75.5 years, on average. In a study of this sort, a difference of four years is highly significant, and could not be explained by other systematic differences between the two groups. For example, the monolinguals reported, on average, a year and a half more schooling than their bilingual counterparts, so the effect was clearly not due to formal education. I) A separate study, conducted in India, found strikingly similar results: bilingual patients developed symptoms of dementia 4.5 years later than monolinguals, even after other potential factors, such as gender and occupation, were controlled for. In addition, researchers have reported other positive effects of bilingualism for cognitive abilities in later life, even when the person acquired the language in adulthood. Crucially, Bialystok suggested that the positive benefits of being bilingual were only found in those who used both languages all the time. J) But encouraging as these kinds of studies are, they still have not established exactly how or why differences between bilinguals and monolinguals exist. Because these studies looked back at the histories of people who were already bilingual, the results can only say that a difference between the two groups was found, but not why that difference occurred. Further research is needed to determine what caused the differences in age of onset between the two groups. K) Other studies of successful aging suggest that being connected to one''s community and having plenty of social interaction is also important in delaying or even preventing the onset of dementia. Once again, however, the results are far less clear than the popular media might lead you to believe. Older individuals who lead active social lives are, almost by definition, healthier than their counterparts who rarely leave their homes or interact with others. So we can''t really say whether being socially active prevents the onset of dementia, or if people who don''t have dementia are more likely to be socially active. L) But even if studying a foreign language is not a magical cure-all, there is one thing it will do: It will make you a better speaker of a foreign language. Doing that confers a whole host of advantages we do know about.', NULL, NULL, 1238, 'IMPORT', 'cet6-2023-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-3-r2'
);
SET @pg_cet6_2023_12_3_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-3-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-r3', 'CAREFUL_READING', 'CET6', NULL, 'Research is meant to benefit society by raising public awareness and creating products and innovations that enhance development. For research to serve its full purpose, the results must leave the confines of research laboratories and academic journals. Findings effectively communicated can go a long way to serve the interests of the public. They can help address social injustices or improve treatments offered to patients. Many researchers seem to be content with sharing the results of their studies in academic journals or at conferences. But few journals allow everybody to read the findings. Even articles freely available are usually written in academic language incomprehensible to the average reader. For researchers in the tenure-track system, their main goal is winning tenure, which in part can be achieved by getting a number of papers published in prominent journals. Pressures like this mean community-level outreach is not prioritised. Many researchers lack the writing skills to describe their results to a general audience. They may also worry about whether the public will understand their findings, or about findings being used to influence controversial policies. These concerns cause some researchers to shy away from communicating their findings outside the academic community. Propagating research findings beyond academic publications is particularly crucial for addressing certain social discrepancies. It can help families, communities, healthcare providers, policymakers, government agencies and other stakeholders to understand and respond to crises that plague society. The benefits of sharing findings flow both ways. Engaging with other researchers and the public can lead to unexpected new connections and new ideas that could suggest fruitful new directions for research. To benefit both researchers and the communities, the need to find innovative, accessible ways to share the work cannot be overstated. Institutions and funding organisations should support more researchers to publish in open access journals so that the public doesn''t have to pay to read them. Institutions and researchers should invest in partnerships that expand capacity for sharing results more broadly. Furthermore, ethics committees should make it mandatory for researchers to share their results with the public. Every research participant should opt in or out of receiving results, as part of the process of giving informed consent. There could be misunderstanding of the findings presented by the researcher because of technical terms. But this can be resolved by researchers engaging the services of professional writers or communication officers to help with translating their study into more accessible language and share it widely with media outlets and the public. Sharing results with the people who are most affected by them makes us better researchers and ensures that our work can be used to improve people''s lives. Institutions and collaborators must recognise the value of doing so.', NULL, NULL, 448, 'IMPORT', 'cet6-2023-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-3-r3'
);
SET @pg_cet6_2023_12_3_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-3-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-r4', 'CAREFUL_READING', 'CET6', NULL, 'Spiders make their presence felt in late August and through early autumn. This is the mating season of some of the most common varieties, when male house spiders come out of hidden corners to look for females, and garden spiders reach adult size and spin their most dazzling webs. Yet while the spider is a familiar fixture of nursery poems or songs and Halloween decorations, its relationship with humans is complicated. Fear of spiders is common and has serious impacts on the lives of sufferers. Its prevalence appears unrelated to any rational assessment of risk. Spiders in the UK are almost all harmless. Farmland species perform valuable ecosystem services, by preying on insects that are our competitors for crops. But they are a constant source of human anxieties—with a cultural association with witches and wickedness dating back to the middle ages. Does this perhaps explain, in part, the lack of data about how spiders are faring in our age of ecological crisis? British butterflies are the most studied group of insects in the world, due to the long tradition of collecting and observing them. But spider conservationists point out that it was only in the 1980s that the classification of house spiders was properly sorted out. And while information about insect populations is gathered by experiments that measure the numbers hitting windscreens or traps, there have been few attempts to count spiders. The huge reductions in the numbers of flying insects can only mean a reduction in spiders'' food supply. A recent landmark study identified a 75% fall in insect populations between 1989 and 2016, with pesticide use thought to be to blame along with the destruction of wild areas for development. This means the overall picture for spiders is worrying, as it is for most creatures. But conservationists are most concerned about those varieties that are threatened due to habitat loss and fragmentation, which makes it impossible for them to migrate. Of around 650 spider species regularly recorded in the UK, the majority thrive in marshes and wasteland. Conservation efforts, often led by determined individuals, have helped some species to recover by reintroducing them to new areas. With rewilding now firmly on the environmental policy agenda, the hope is that in future, spiders will be enabled to migrate by themselves, adapting to climate change by moving along wildlife corridors. It seems unlikely that spiders will ever attract the same level of human enthusiasm as bees, birds or butterflies, in spite of their unique status as nature''s spinners. But as they reveal themselves in all their splendour this autumn, it would be a good thing if more animal lovers recognised the ways in which spiders are simply terrific.', NULL, NULL, 448, 'IMPORT', 'cet6-2023-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-3-r4'
);
SET @pg_cet6_2023_12_3_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-12-3-r4' LIMIT 1);

-- 翻译 cet6-2023-12-3
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-translation'
);
SET @q_cet6_2023_12_3_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_01, '近年来，中国老龄人口持续增长。中国政府正采取各种措施，推进养老服务体系建设，使老年人晚年生活健康幸福。全国兴建了各类养老服务机构。为了提升养老机构的服务质量，政府颁布了一系列标准，加强对养老机构的监管。许多城市为方便老年人用餐，开设了社区食堂，为他们提供价格实惠的饭菜。行动不便的老年人还能享受上门送餐服务。同时，中国还在积极探索居家和社区养老等其他养老模式，以确保所有老年人老有所养。', NULL, 'In recent years, the elderly population in China has been growing continuously. In response, the Chinese government is taking various measures to promote the development of the elderly care service system, so that the elderly can enjoy a healthy and happy life in their later years. Various elderly care institutions have been built across the country. To improve the service quality of these institutions, the government has issued a series of standards, strengthening the supervision of them. To make dining more convenient for the elderly, many cities have opened community canteens, which provide affordable meals for them. In addition, elderly people with limited mobility can also enjoy home meal delivery services. At the same time, China is also actively exploring other elderly care models, such as home-based and community-based care, to ensure that all the elderly are well cared for in their old age.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_01
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q26'
);
SET @q_cet6_2023_12_3_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_02, NULL, '{"A":"A) correlation","B":"B) dense","C":"C) deter","D":"D) equity","E":"E) foster","F":"F) imperative","G":"G) impose","H":"H) irrespective","I":"I) longevity","J":"J) navigate","K":"K) recreational","L":"L) rotten","M":"M) sprawl","N":"N) vibrate","O":"O) vicinity"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_02
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q27'
);
SET @q_cet6_2023_12_3_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_03, NULL, '{"A":"A) correlation","B":"B) dense","C":"C) deter","D":"D) equity","E":"E) foster","F":"F) imperative","G":"G) impose","H":"H) irrespective","I":"I) longevity","J":"J) navigate","K":"K) recreational","L":"L) rotten","M":"M) sprawl","N":"N) vibrate","O":"O) vicinity"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_03
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q28'
);
SET @q_cet6_2023_12_3_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_04, NULL, '{"A":"A) correlation","B":"B) dense","C":"C) deter","D":"D) equity","E":"E) foster","F":"F) imperative","G":"G) impose","H":"H) irrespective","I":"I) longevity","J":"J) navigate","K":"K) recreational","L":"L) rotten","M":"M) sprawl","N":"N) vibrate","O":"O) vicinity"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_04
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q29'
);
SET @q_cet6_2023_12_3_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_05, NULL, '{"A":"A) correlation","B":"B) dense","C":"C) deter","D":"D) equity","E":"E) foster","F":"F) imperative","G":"G) impose","H":"H) irrespective","I":"I) longevity","J":"J) navigate","K":"K) recreational","L":"L) rotten","M":"M) sprawl","N":"N) vibrate","O":"O) vicinity"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_05
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q30'
);
SET @q_cet6_2023_12_3_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_06, NULL, '{"A":"A) correlation","B":"B) dense","C":"C) deter","D":"D) equity","E":"E) foster","F":"F) imperative","G":"G) impose","H":"H) irrespective","I":"I) longevity","J":"J) navigate","K":"K) recreational","L":"L) rotten","M":"M) sprawl","N":"N) vibrate","O":"O) vicinity"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_06
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q31'
);
SET @q_cet6_2023_12_3_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_07, NULL, '{"A":"A) correlation","B":"B) dense","C":"C) deter","D":"D) equity","E":"E) foster","F":"F) imperative","G":"G) impose","H":"H) irrespective","I":"I) longevity","J":"J) navigate","K":"K) recreational","L":"L) rotten","M":"M) sprawl","N":"N) vibrate","O":"O) vicinity"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_07
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q32'
);
SET @q_cet6_2023_12_3_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_08, NULL, '{"A":"A) correlation","B":"B) dense","C":"C) deter","D":"D) equity","E":"E) foster","F":"F) imperative","G":"G) impose","H":"H) irrespective","I":"I) longevity","J":"J) navigate","K":"K) recreational","L":"L) rotten","M":"M) sprawl","N":"N) vibrate","O":"O) vicinity"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_08
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q33'
);
SET @q_cet6_2023_12_3_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_09, NULL, '{"A":"A) correlation","B":"B) dense","C":"C) deter","D":"D) equity","E":"E) foster","F":"F) imperative","G":"G) impose","H":"H) irrespective","I":"I) longevity","J":"J) navigate","K":"K) recreational","L":"L) rotten","M":"M) sprawl","N":"N) vibrate","O":"O) vicinity"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_09
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q34'
);
SET @q_cet6_2023_12_3_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_10, NULL, '{"A":"A) correlation","B":"B) dense","C":"C) deter","D":"D) equity","E":"E) foster","F":"F) imperative","G":"G) impose","H":"H) irrespective","I":"I) longevity","J":"J) navigate","K":"K) recreational","L":"L) rotten","M":"M) sprawl","N":"N) vibrate","O":"O) vicinity"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_10
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q35'
);
SET @q_cet6_2023_12_3_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_11, NULL, '{"A":"A) correlation","B":"B) dense","C":"C) deter","D":"D) equity","E":"E) foster","F":"F) imperative","G":"G) impose","H":"H) irrespective","I":"I) longevity","J":"J) navigate","K":"K) recreational","L":"L) rotten","M":"M) sprawl","N":"N) vibrate","O":"O) vicinity"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_11
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q36'
);
SET @q_cet6_2023_12_3_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_12, 'Research indicates that brain training is likely to boost one''s ability at specific tasks, but not one''s other cognitive abilities.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_12
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q37'
);
SET @q_cet6_2023_12_3_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_13, 'According to estimates, the number of people who speak two languages or more is greater than those who speak one language only.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_13
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q38'
);
SET @q_cet6_2023_12_3_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_14, 'For the time being, we do not know what causes people to lose their cognitive abilities, or what we can do to prevent it.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_14
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q39'
);
SET @q_cet6_2023_12_3_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_15, 'It is hard to determine whether people who are free from dementia tend to have more social activities, or more social activities keep people away from dementia.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_15
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q40'
);
SET @q_cet6_2023_12_3_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_16, 'There is evidence that learning foreign languages might be beneficial to boosting one''s cognitive abilities.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_16
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q41'
);
SET @q_cet6_2023_12_3_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_17, 'It was suggested that only those who always spoke two languages could benefit from bilingualism.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_17
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q42'
);
SET @q_cet6_2023_12_3_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_18, 'The brain is different from muscles in that it keeps working even when the body is at rest.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_18
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q43'
);
SET @q_cet6_2023_12_3_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_19, 'People who speak two languages do better at a number of cognitive tasks than those who speak only one language.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_19
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q44'
);
SET @q_cet6_2023_12_3_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_20, 'Dementia is different from being merely forgetful and entails more serious trouble.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_20
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q45'
);
SET @q_cet6_2023_12_3_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_21, 'It is claimed that more monolinguals suffer from Alzheimer''s disease than bilinguals.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_21
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q46'
);
SET @q_cet6_2023_12_3_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_22, 'How can research serve its full purpose according to the author?', '{"A":"A) With researchers being aware of public interests.","B":"B) With its findings published in prominent journals.","C":"C) With researchers creating products that enhance social development.","D":"D) With its findings properly communicated beyond the academic circle."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_22
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q47'
);
SET @q_cet6_2023_12_3_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_23, 'Why do ordinary readers find it difficult to access the results of researchers'' studies?', '{"A":"A) They cannot understand the academic language used for reporting these results.","B":"B) They feel intimidated by the jargon researchers use to describe their findings.","C":"C) They do not attend conferences where these results are freely available.","D":"D) They have few chances to locate the journals that publish these findings."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_23
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q48'
);
SET @q_cet6_2023_12_3_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_24, 'What is one of the reasons some researchers won''t prioritise communicating their findings to the public?', '{"A":"A) They can thrive on the papers published.","B":"B) Their top consideration is to win tenure","C":"C) Their main goal is gaining recognition in their field.","D":"D) They have to struggle to reach out to the community."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_24
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q49'
);
SET @q_cet6_2023_12_3_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_25, 'How can sharing findings benefit researchers themselves?', '{"A":"A) By helping them to identify new research directions.","B":"B) By enabling them to understand crises plaguing society.","C":"C) By enabling them to effectively address social discrepancies.","D":"D) By helping them to forge ties with government agencies."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_25
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q50'
);
SET @q_cet6_2023_12_3_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_26, 'Why are researchers advised to engage the services of professional writers or communication officers?', '{"A":"A) To satisfy ethics committees'' mandatory requirements of researchers.","B":"B) To translate their study into languages accessible to readers overseas.","C":"C) To make their publications correctly understood by the public.","D":"D) To render their findings acceptable by prominent journals."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_26
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q51'
);
SET @q_cet6_2023_12_3_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_27, 'What do we learn about spiders in the UK since the middle ages?', '{"A":"A) They have been generally misconceived.","B":"B) They have adversely impacted crop growth.","C":"C) They have been a constant reminder of bad luck.","D":"D) They have made their presence felt when spinning webs."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_27
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q52'
);
SET @q_cet6_2023_12_3_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_28, 'What have spiders been associated with in the UK for centuries?', '{"A":"A) Harm.","B":"B) Evil.","C":"C) Suffering.","D":"D) Aggression."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_28
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q53'
);
SET @q_cet6_2023_12_3_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_29, 'What partly accounts for the reduction in spiders'' food supply?', '{"A":"A) The long tradition of collecting insects.","B":"B) Fast reproduction of their competitors.","C":"C) Chemicals used for killing insects.","D":"D) The extinction of a lot of wildlife"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_29
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q54'
);
SET @q_cet6_2023_12_3_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_30, 'What does the passage say is conservationists'' biggest worry?', '{"A":"A) A variety of spiders are threatened due to pollution of marshes and wasteland.","B":"B) Certain species of spiders are endangered due to loss of their natural homes.","C":"C) An increasing number of spiders are being killed by deadly pesticides.","D":"D) More and more spider species are found losing their ability to migrate."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_30
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-12-3-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q55'
);
SET @q_cet6_2023_12_3_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-12-3-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_12_3_31, 'What wish does the author express close to the end of the passage?', '{"A":"A) More people would recognise spiders'' unique status in the ecosystem.","B":"B) People would show greater enthusiasm for spiders than for butterflies.","C":"C) There would be sufficient corridors for spiders to move along.","D":"D) There would be more people appreciating spiders'' splendour."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_12_3_31
);

-- ==================== cet6-2024-06-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-r1', 'BANKED_CLOZE', 'CET6', NULL, 'It''s quite remarkable how different genres of music can spark unique feelings, emotions, and memories. Studies have shown that music can reduce stress and anxiety before surgeries and we are all attracted toward our own unique life soundtrack. If you''re looking to __26__ stress, you might want to give classical music a try. The sounds of classical music produce a calming effect letting __27__ pleasure-inducing dopamine(多巴 胺) in the brain that helps control attention, learning and emotional responses. It can also turn down the body''s stress response, resulting in an overall happier mood. It turns out a pleasant mood can lead to __28__ in a person''s thinking. Although there are many great __29__ of classical music like Bach, Beethoven and Handel, none of these artists'' music seems to have the same health effects as Mozart''s does. According to researchers, listening to Mozart can increase brain wave activity and improve __30__ function. Another study found that the distinctive features of Mozart''s music trigger parts of the brain that are responsible for high-level mental functions. Even maternity __31__ use Mozart to help newborn babies adapt to life outside of the mother''s belly. It has been found that listening to classical music __32__ reduces a person''s blood pressure. Researchers believe that the calming sounds of classical music may help your heart __33__ from stress. Classical music can also be a great tool to help people who have trouble sleeping. One study found that students who had trouble sleeping slept better while they were listening to classical music. Whether classical music is something that you listen to on a regular basis or not, it wouldn''t __34__ to take time out of your day to listen to music that you find __35__ . You will be surprised at how good it makes you feel and the potentially positive change in your health.', NULL, '["A) alleviate","B) clarity","C) cognitive","D) composers","E) hurt","F) inhibiting","G) interrogation","H) intrinsically","I) loose","J) majestic","K) mandatory","L) recover","M) significantly","N) soothing","O) wards"]', 307, 'IMPORT', 'cet6-2024-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-1-r1'
);
SET @pg_cet6_2024_06_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-r2', 'MATCHING', 'CET6', 'The Curious Case of the Tree That Owns Itself', 'A) In the city of Athens, Georgia, there exists a rather curious local landmark—a large white oak that is almost universally stated to own itself. Because of this, it is considered one of the most famous trees in the world. So how did this tree come to own itself and the land around it? B) Sometime in the 19th century a Georgian called Colonel William Jackson reportedly took a liking to the said tree and endeavored to protect it from any danger. As to why he loved it so, the earliest documented account of this story is an anonymously written front page article in the Athens Weekly Banner published on August 12, 1890. It states, "Col. Jackson had watched the tree grow from his childhood, and grew to love it almost as he would a human. Its luxuriant leaves and sturdy limbs had often protected him from the heavy rains, and out of its highest branches he had many a time gotten the eggs of the feathered singers. He watched its growth, and when reaching a ripe old age he saw the tree standing in its magnificent proportions, he was pained to think that after his death it would fall into the hands of those who might destroy it." C) Towards this end, Jackson transferred by means of a deed ownership of the tree and a little land around it to the tree itself. The deed read, "W. H. Jackson for and in consideration of the great affection which he bears the said tree, and his great desire to see it protected has conveyed unto the said oak tree entire possession of itself and of all land within eight feet of it on all sides." D) In time, the tree came to be something of a tourist attraction, known as The Tree That Owns Itself. However, in the early 20th century, the tree started showing signs of its slow death, with little that could be done about it. Father time comes for us all eventually, even our often long lived, tall and leafy fellow custodians(看管者) of Earth. Finally, on October 9, 1942, the over 30 meter tall and 200-400 year old tree fell, rumor has it, as a result of a severe windstorm and/or via having previously died and its roots rotted. E) About four years later, members of the Junior Ladies Garden Club (who''d tended to the tree before its unfortunate death) tracked down a small tree grown from a nut taken from the original tree. And so it was that on October 9, 1946, under the direction of Professor Roy Bowden of the College of Agriculture at the University of Georgia, this little tree was transplanted to the location of its ancestor. A couple of months later, an official ceremony was held featuring none other than the Mayor of Athens, Robert L McWhorter, to commemorate the occasion. F) This new tree became known as The Son of the Tree That Owns Itself and it was assumed that, as the original tree''s heir, it naturally inherited the land it stood on. Of course, there are many dozens of other trees known to exist descending from the original, as people taking a nut from it to grow elsewhere was a certainty. That said, to date, none of the original tree''s other children have petitioned the courts for their share of the land, so it seems all good. In any event, The Son of the Tree That Owns Itself still stands today, though often referred to simply as The Tree That Owns Itself. G) This all brings us around to whether Jackson ever actually gave legal ownership of the tree to itself in the first place and whether such a deed is legally binding. H) Well, to begin with, it turns out Jackson only spent about three years of his life in Athens, starting at the age of 43 from 1829 to 1832, sort of dismissing the idea that he loved the tree from spending time under it as a child and watching it grow, and then worrying about what would happen to it after he died. Further, an extensive search of land ownership records in Athens does not seem to indicate Jackson ever owned the land the tree sits on. I) He did live on a lot of land directly next to it for those three years, but whether he owned that land or not isn''t clear. Whatever the case, in 1832 a four acre parcel, which included the land the tree was on and the neighboring land Jackson lived on, among others, was sold to University professor Malthus A Ward. In the transaction, Ward was required to pay Jackson a sum of $1,200 (about $31, 000 today), either for the property itself or simply in compensation for improvements Jackson had made on the lot. In the end, whether he ever owned the neighboring lot or was simply allowed to use it while he allegedly worked at the University, he definitely never owned the lot the tree grew on, which is the most important bit for the topic at hand. J) After Professor Ward purchased the land, Jackson and his family purchased a 655 acre parcel a few miles away and moved there. Ten years later, in 1844, Jackson seemed to have come into financial difficulties and had his little plantation seized by the Clarke County Sheriff''s office and auctioned off to settle the mortgage. Thus, had he owned some land in Athens itself, including the land the tree sat on, presumably he would have sold it to raise funds or otherwise had it taken as well. K) And whatever the case there, Jackson would have known property taxes needed to be paid on the deeded land for the tree to be truly secure in its future. Yet no account or record indicates any trust or the like was set up to facilitate this. L) On top of all this, there is no hard evidence such a deed ever existed, despite the fact that deed records in Athens go back many decades before Jackson''s death in 1876 and that it was supposed to have existed in 1890 in the archives according to the original anonymous news reporter who claims to have seen it. M) As you might imagine from all of this, few give credit to this side of the story. So how did all of this come about then? N) It is speculated to have been invented by the imagination of the said anonymous author at the Athens Weekly Banner in the aforementioned 1890 front page article titled "Deeded to Itself", which by the way contained several elements that are much more easily proved to be false. As to why the author would do this, it''s speculated perhaps it was a 19th century version of a click-bait thought exercise on whether it would be legal for someone to deed such a non-conscious living thing to itself or not. O) Whatever the case, the next known instance of the Tree That Owns Itself being mentioned wasn''t until 1901 in the Centennial Edition of that same paper, the Athens Weekly Banner. This featured another account very clearly just copying the original article published about a decade before, only slightly reworded. The next account was in 1906, again in the Athens Weekly Banner, again very clearly copying the original account, only slightly reworded, the 19th century equivalent of re-posts when the audience has forgotten about the original.', NULL, NULL, 1245, 'IMPORT', 'cet6-2024-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-1-r2'
);
SET @pg_cet6_2024_06_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-r3', 'CAREFUL_READING', 'CET6', NULL, 'It is irrefutable that employees know the difference between right and wrong. So why don''t more employees intervene when they see someone exhibiting at-risk behavior in the workplace? There are a number of factors that influence whether people intervene. First, they need to be able to see a risky situation beginning to unfold. Second, the company''s culture needs to make them feel safe to speak up. And third, they need to have the communication skills to say something effectively. This is not strictly a workplace problem; it''s a growing problem off the job too. Every day people witness things on the street and choose to stand idly by. This is known as the bystander effect—the more people who witness an event, the less likely anyone in that group is to help the victim. The psychology behind this is called diffusion of responsibility. Basically, the larger the crowd, the more people assume that someone else will take care of it—meaning no one effectively intervenes or acts in a moment of need. This crowd mentality is strong enough for people to evade their known responsibilities. But it''s not only frontline workers who don''t make safety interventions in the workplace. There are also instances where supervisors do not intervene either. When a group of employees sees unsafe behavior not being addressed at a leadership level it creates the precedent that this is how these situations should be addressed, thus defining the safety culture for everyone. Despite the fact that workers are encouraged to intervene when they observe unsafe operations, this happens less than half of the time. Fear is the ultimate factor in not intervening. There is a fear of penalty, a fear that they''ll have to do more work if they intervene. Unsuccessful attempts in the past are another strong contributing factor to why people don''t intervene—they tend to prefer to defer that action to someone else for all future situations. On many worksites, competent workers must be appointed. Part of their job is to intervene when workers perform a task without the proper equipment or if the conditions are unsafe. Competent workers are also required to stop work from continuing when there''s a danger. Supervisors also play a critical role. Even if a competent person isn''t required, supervisors need a broad set of skills to not only identify and alleviate workplace hazards but also build a safety climate within their team that supports intervening and open communication among them. Beyond competent workers and supervisors, it''s important to educate everyone within the organization that they are obliged to intervene if they witness a possible unsafe act, whether you''re a designated competent person, a supervisor or a frontline worker.', NULL, NULL, 446, 'IMPORT', 'cet6-2024-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-1-r3'
);
SET @pg_cet6_2024_06_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-r4', 'CAREFUL_READING', 'CET6', NULL, 'The term "environmentalist" can mean different things. It used to refer to people trying to protect wildlife and natural ecosystems. In the 21st century, the term has evolved to capture the need to combat human-made climate change. The distinction between these two strands of environmentalism is the cause of a split within the scientific community about nuclear energy. On one side are purists who believe nuclear power isn''t worth the risk and the exclusive solution to the climate crisis is renewable energy. The opposing side agrees that renewables are crucial, but says society needs an amount of power available to meet consumers'' basic demands when the sun isn''t shining and the wind isn''t blowing. Nuclear energy, being far cleaner than oil, gas and coal, is a natural option, especially where hydroelectric capacity is limited. Leon Clarke, who helped author reports for the UN''s Intergovernmental Panel on Climate Change, isn''t an uncritical supporter of nuclear energy, but says it''s a valuable option to have if we''re serious about reaching carbon neutrality. "Core to all of this is the degree to which you think we can actually meet climate goals with 100% renewables," he said. "If you don''t believe we can do it, and you care about the climate, you are forced to think about something like nuclear." The achievability of universal 100% renewability is similarly contentious. Cities such as Burlington, Vermont, have been "100% renewable" for years. But these cities often have small populations, occasionally still rely on fossil fuel energy and have significant renewable resources at their immediate disposal. Meanwhile, countries that manage to run off renewables typically do so thanks to extraordinary hydroelectric capabilities. Germany stands as the best case study for a large, industrialized country pushing into green energy. Chancellor Angela Merkel in 2011 announced Energiewende, an energy transition that would phase out nuclear and coal while phasing in renewables. Wind and solar power generation has increased over 400% since 2010, and renewables provided 46% of the country''s electricity in 2019. But progress has halted in recent years. The instability of renewables doesn''t just mean energy is often not produced at night, but also that solar and wind can overwhelm the grid during the day, forcing utilities to pay customers to use their electricity. Lagging grid infrastructure struggles to transport this overabundance of green energy from Germany''s north to its industrial south, meaning many factories still run on coal and gas. The political limit has also been reached in some places, with citizens meeting the construction of new wind turbines with loud protests. The result is that Germany''s greenhouse gas emissions have fallen by around 11.5% since 2010—slower than the EU average of 13.5%.', NULL, NULL, 446, 'IMPORT', 'cet6-2024-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-1-r4'
);
SET @pg_cet6_2024_06_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-1-r4' LIMIT 1);

-- 翻译 cet6-2024-06-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-translation'
);
SET @q_cet6_2024_06_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_01, '中国的传统婚礼习俗历史悠久，从周朝开始就逐渐形成了一套完整的婚礼仪式，有些一直沿用至今。如今的中式婚礼习俗已有很大变化，但婚礼庆典仍然十分隆重。婚礼场地经过精心装饰，以象征喜庆 (jubilance)的红色为主色调，摆放着许多祝愿新人幸福的物件。在婚礼上，新人要拜天地 (bow to Heaven and Earth)、拜父母和相互对拜，然后设宴招待宾客，并向宾客敬酒致谢。今天，许多年轻人依然钟情于传统的中式婚礼，体验独特而美好的中国式浪漫。', NULL, 'China''s traditional wedding customs have a long history. A complete set of wedding ceremonies gradually took shape as early as the Zhou Dynasty, some of which have been followed to this day. Today''s Chinese wedding customs have changed greatly, but the wedding celebration remains very grand. The wedding venue is elaborately decorated, with red—the color symbolizing jubilance—as the main tone, and many objects wishing the couple happiness are placed around it. At the wedding, the couple bow to Heaven and Earth, to their parents and to each other, then hold a banquet to entertain the guests and propose a toast to thank them. Today, many young people are still fond of traditional Chinese weddings, experiencing the unique and wonderful Chinese-style romance.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_01
);

-- 听力 Q1 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q01', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q01'
);
SET @q_cet6_2024_06_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_02, NULL, '{"A":"A) Reply to the man''s last proposal within a short time.","B":"B) Sign the agreement if one small change is made to it.","C":"C) Make a sponsorship deal for her client at the meeting.","D":"D) Give the man some good news regarding the contract."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_02
);

-- 听力 Q2 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q02', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q02'
);
SET @q_cet6_2024_06_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_03, NULL, '{"A":"A) They are becoming impatient.","B":"B) They are afraid time is running out.","C":"C) They are used to making alterations.","D":"D) They are concerned about the details."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_03
);

-- 听力 Q3 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q03', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q03'
);
SET @q_cet6_2024_06_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_04, NULL, '{"A":"A) To prevent geographical discrimination.","B":"B) To tap the food and beverage market.","C":"C) To avoid any conflict of interest.","D":"D) To reduce unfair competition."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_04
);

-- 听力 Q4 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q04', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q04'
);
SET @q_cet6_2024_06_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_05, NULL, '{"A":"A) It is a potential market for food and beverage.","B":"B) It is very attractive for real estate developers.","C":"C) It is a negligible market for his company.","D":"D) It is very different from other markets."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_05
);

-- 听力 Q5 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q05', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q05'
);
SET @q_cet6_2024_06_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_06, NULL, '{"A":"A) They are thrilled by a rare astronomic phenomenon.","B":"B) They are celebrating a big event on mountain tops.","C":"C) They are enthusiastic about big science-related stories.","D":"D) They are joined by astronomers all across North America."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_06
);

-- 听力 Q6 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q06', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q06'
);
SET @q_cet6_2024_06_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_07, NULL, '{"A":"A) It will be the most formidable of its kind in over a century.","B":"B) It will come closest to Earth in more than one hundred years.","C":"C) It will eclipse many other such events in human history.","D":"D) It will be seen most clearly from Denver''s mountain tops."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_07
);

-- 听力 Q7 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q07', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q07'
);
SET @q_cet6_2024_06_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_08, NULL, '{"A":"A) blur.","B":"B) Stars.","C":"C) The edge of our galaxy.","D":"D) An ordinary flying object."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q08', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q08'
);
SET @q_cet6_2024_06_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_09, NULL, '{"A":"A) Use professional equipment.","B":"B) Climb to the nearby heights.","C":"C) Fix their eyes due north.","D":"D) Make use of phone apps."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_09
);

-- 听力 Q9 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q09', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q09'
);
SET @q_cet6_2024_06_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_10, NULL, '{"A":"A) Whether consumers should be warned against ultra-processed foods.","B":"B) Whether there is sufficient scientific consensus on dietary guidelines.","C":"C) Whether guidelines can form the basis for nutrition advice to consumers.","D":"D) Whether food scientists will agree on the concept of ultra-processed foods."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_10
);

-- 听力 Q10 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q10', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q10'
);
SET @q_cet6_2024_06_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_11, NULL, '{"A":"A) By the labor cost for the final products.","B":"B) By the degree of industrial processing.","C":"C) By the extent of chemical alteration.","D":"D) By the convention of classification."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_11
);

-- 听力 Q11 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q11', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q11'
);
SET @q_cet6_2024_06_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_12, NULL, '{"A":"A) Increased consumers'' expenses.","B":"B) Greater risk of chronic diseases.","C":"C) People''s misunderstanding of nutrition.","D":"D) Children''s dislike for unprocessed foods."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_12
);

-- 听力 Q12 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q12', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q12'
);
SET @q_cet6_2024_06_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_13, NULL, '{"A":"A) They begin to think of the benefits of constraints.","B":"B) They try to seek solutions from creative people.","C":"C) They try hard to maximize their mental energy.","D":"D) They begin to see the world in a different way."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_13
);

-- 听力 Q13 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q13', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q13'
);
SET @q_cet6_2024_06_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_14, NULL, '{"A":"A) It is characteristic of all creative people.","B":"B) It is essential to pushing society forward.","C":"C) It is a creative person''s response to limitation.","D":"D) It is an impetus to socio-economic development."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_14
);

-- 听力 Q14 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q14', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q14'
);
SET @q_cet6_2024_06_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_15, NULL, '{"A":"A) Scarcity or abundance of resources has little impact on people''s creativity.","B":"B) Innovative people are not constrained in connecting unrelated concepts.","C":"C) People have no incentive to use available resources in new ways.","D":"D) Creative people tend to consume more available resources."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_15
);

-- 听力 Q15 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q15', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q15'
);
SET @q_cet6_2024_06_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_16, NULL, '{"A":"A) It is key to a company''s survival.","B":"B) It shapes and focuses problems.","C":"C) It is essential to meeting challenges","D":"D) It thrives best when constrained."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_16
);

-- 听力 Q16 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q16', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q16'
);
SET @q_cet6_2024_06_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_17, NULL, '{"A":"A) Because they are learned.","B":"B) Because they come naturally.","C":"C) Because they have to be properly personalized.","D":"D) Because there can be more effective strategies."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_17
);

-- 听力 Q17 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q17', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q17'
);
SET @q_cet6_2024_06_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_18, NULL, '{"A":"A) The extent of difference and of similarity between the two sides.","B":"B) The knowledge of the specific expectation the other side holds.","C":"C) The importance of one''s goals and of the relationship.","D":"D) The approaches one adopts to conflict management."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_18
);

-- 听力 Q18 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q18', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q18'
);
SET @q_cet6_2024_06_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_19, NULL, '{"A":"A) The fox.","B":"B) The owl.","C":"C) The shark.","D":"D) The turtle."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_19
);

-- 听力 Q19 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q19', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q19'
);
SET @q_cet6_2024_06_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_20, NULL, '{"A":"A) Help save species from extinction and boost human health.","B":"B) Understand how plants and animals perished over the past.","C":"C) Help gather information publicly available to researchers.","D":"D) Find out the cause of extinction of Britain''s 66, 000 species."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_20
);

-- 听力 Q20 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q20', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q20'
);
SET @q_cet6_2024_06_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_21, NULL, '{"A":"A) It was once dominated by dinosaurs.","B":"B) It has entered the sixth mass extinction.","C":"C) Its prospects depend on future human behaviour.","D":"D) Its climate change is aggravated by humans."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_21
);

-- 听力 Q21 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q21', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q21'
);
SET @q_cet6_2024_06_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_22, NULL, '{"A":"A) It dwarfs all other efforts to conserve, protect and restore biodiversity on earth.","B":"B) It is costly to get started and requires the joint efforts of thousands of scientists.","C":"C) It can help to bring back the large numbers of plants and animals that have gone extinct.","D":"D) It is the most exciting, most relevant, most timely and most internationally inspirational."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_22
);

-- 听力 Q22 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q22', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q22'
);
SET @q_cet6_2024_06_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_23, NULL, '{"A":"A) Cultural identity.","B":"B) Social evolution.","C":"C) The Copernican revolution.","D":"D) Human individuality."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_23
);

-- 听力 Q23 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q23', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q23'
);
SET @q_cet6_2024_06_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_24, NULL, '{"A":"A) It is a delusion to be disposed of.","B":"B) It is prevalent even among academics.","C":"C) It is a myth spread by John Donne''s poem.","D":"D) It is rooted in the mindset of the 17th century."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_24
);

-- 听力 Q24 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q24', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q24'
);
SET @q_cet6_2024_06_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_25, NULL, '{"A":"A) He believes in Copernican philosophical doctrines about the universe.","B":"B) He has gained ample scientific evidence at the University of Reading.","C":"C) He has found that our inner self and material self are interconnected.","D":"D) He contends most of our body cells can only live a few days or weeks."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_25
);

-- 听力 Q25 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q25', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q25'
);
SET @q_cet6_2024_06_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_26, NULL, '{"A":"A) By coming to see how disruptive such problems have got to be.","B":"B) By realising that we all can do our own bit in such endeavours.","C":"C) By becoming aware that we are part of a bigger world.","D":"D) By making joint efforts resolutely and persistently."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q26'
);
SET @q_cet6_2024_06_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_27, NULL, '{"A":"A) alleviate","B":"B) clarity","C":"C) cognitive","D":"D) composers","E":"E) hurt","F":"F) inhibiting","G":"G) interrogation","H":"H) intrinsically","I":"I) loose","J":"J) majestic","K":"K) mandatory","L":"L) recover","M":"M) significantly","N":"N) soothing","O":"O) wards"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q27'
);
SET @q_cet6_2024_06_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_28, NULL, '{"A":"A) alleviate","B":"B) clarity","C":"C) cognitive","D":"D) composers","E":"E) hurt","F":"F) inhibiting","G":"G) interrogation","H":"H) intrinsically","I":"I) loose","J":"J) majestic","K":"K) mandatory","L":"L) recover","M":"M) significantly","N":"N) soothing","O":"O) wards"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q28'
);
SET @q_cet6_2024_06_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_29, NULL, '{"A":"A) alleviate","B":"B) clarity","C":"C) cognitive","D":"D) composers","E":"E) hurt","F":"F) inhibiting","G":"G) interrogation","H":"H) intrinsically","I":"I) loose","J":"J) majestic","K":"K) mandatory","L":"L) recover","M":"M) significantly","N":"N) soothing","O":"O) wards"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q29'
);
SET @q_cet6_2024_06_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_30, NULL, '{"A":"A) alleviate","B":"B) clarity","C":"C) cognitive","D":"D) composers","E":"E) hurt","F":"F) inhibiting","G":"G) interrogation","H":"H) intrinsically","I":"I) loose","J":"J) majestic","K":"K) mandatory","L":"L) recover","M":"M) significantly","N":"N) soothing","O":"O) wards"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q30'
);
SET @q_cet6_2024_06_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_31, NULL, '{"A":"A) alleviate","B":"B) clarity","C":"C) cognitive","D":"D) composers","E":"E) hurt","F":"F) inhibiting","G":"G) interrogation","H":"H) intrinsically","I":"I) loose","J":"J) majestic","K":"K) mandatory","L":"L) recover","M":"M) significantly","N":"N) soothing","O":"O) wards"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q31'
);
SET @q_cet6_2024_06_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_32, NULL, '{"A":"A) alleviate","B":"B) clarity","C":"C) cognitive","D":"D) composers","E":"E) hurt","F":"F) inhibiting","G":"G) interrogation","H":"H) intrinsically","I":"I) loose","J":"J) majestic","K":"K) mandatory","L":"L) recover","M":"M) significantly","N":"N) soothing","O":"O) wards"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q32'
);
SET @q_cet6_2024_06_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_33, NULL, '{"A":"A) alleviate","B":"B) clarity","C":"C) cognitive","D":"D) composers","E":"E) hurt","F":"F) inhibiting","G":"G) interrogation","H":"H) intrinsically","I":"I) loose","J":"J) majestic","K":"K) mandatory","L":"L) recover","M":"M) significantly","N":"N) soothing","O":"O) wards"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q33'
);
SET @q_cet6_2024_06_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_34, NULL, '{"A":"A) alleviate","B":"B) clarity","C":"C) cognitive","D":"D) composers","E":"E) hurt","F":"F) inhibiting","G":"G) interrogation","H":"H) intrinsically","I":"I) loose","J":"J) majestic","K":"K) mandatory","L":"L) recover","M":"M) significantly","N":"N) soothing","O":"O) wards"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q34'
);
SET @q_cet6_2024_06_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_35, NULL, '{"A":"A) alleviate","B":"B) clarity","C":"C) cognitive","D":"D) composers","E":"E) hurt","F":"F) inhibiting","G":"G) interrogation","H":"H) intrinsically","I":"I) loose","J":"J) majestic","K":"K) mandatory","L":"L) recover","M":"M) significantly","N":"N) soothing","O":"O) wards"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q35'
);
SET @q_cet6_2024_06_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_36, NULL, '{"A":"A) alleviate","B":"B) clarity","C":"C) cognitive","D":"D) composers","E":"E) hurt","F":"F) inhibiting","G":"G) interrogation","H":"H) intrinsically","I":"I) loose","J":"J) majestic","K":"K) mandatory","L":"L) recover","M":"M) significantly","N":"N) soothing","O":"O) wards"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q36'
);
SET @q_cet6_2024_06_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_37, 'Jackson was said to have transferred his ownership of the oak tree to itself in order to protect it from being destroyed.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q37'
);
SET @q_cet6_2024_06_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_38, 'No proof has been found from an extensive search that Jackson had ever owned the land where the oak tree grew.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q38'
);
SET @q_cet6_2024_06_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_39, 'When it was raining heavily, Jackson often took shelter under a big tree that is said to own itself.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q39'
);
SET @q_cet6_2024_06_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_40, 'There is no evidence that Jackson had made arrangements to pay property taxes for the land on which the oak tree sat.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q40'
);
SET @q_cet6_2024_06_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_41, 'Professor Ward paid Jackson over one thousand dollars when purchasing a piece of land from him.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q41'
);
SET @q_cet6_2024_06_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_42, 'It is said the tree that owned itself fell in a heavy windstorm.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q42'
);
SET @q_cet6_2024_06_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_43, 'The story of the oak tree is suspected to have been invented as a thought exercise.', NULL, 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q43'
);
SET @q_cet6_2024_06_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_44, 'Jackson''s little plantation was auctioned off to settle his debt in the mid-19th century.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q44'
);
SET @q_cet6_2024_06_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_45, 'An official ceremony was held to celebrate the transplanting of a small tree to where its ancestor had stood.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q45'
);
SET @q_cet6_2024_06_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_46, 'The story of the Tree That Owns Itself appeared in the local paper several times, with slight alterations in wording.', NULL, 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q46'
);
SET @q_cet6_2024_06_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_47, 'What is one of the factors contributing to failure of intervention in face of risky behavior in the workplace?', '{"A":"A) Slack supervision style.","B":"B) Unfavorable workplace culture.","C":"C) Unforeseeable risk.","D":"D) Blocked communication."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q47'
);
SET @q_cet6_2024_06_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_48, 'What does the author mean by "diffusion of responsibility" (Para. 3)?', '{"A":"A) The more people are around, the more they need to worry about their personal safety.","B":"B) The more people who witness an event, the less likely anyone will venture to","C":"C) The more people idling around on the street, the more likely they need taking care of.","D":"D) The more people are around, the less chance someone will step forward to intervene."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q48'
);
SET @q_cet6_2024_06_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_49, 'What happens when unsafe behavior at the workplace is not addressed by the leaders?', '{"A":"A) No one will intervene when they see similar behaviors.","B":"B) Everyone will see it as the easiest way to deal with crisis.","C":"C) Workers have to take extra caution executing their duties.","D":"D) Workers are left to take care of the emergency themselves."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q49'
);
SET @q_cet6_2024_06_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_50, 'What is the ultimate reason workers won''t act when they see unsafe operations?', '{"A":"A) Preference of deferring the action to others.","B":"B) Anticipation of leadership intervention.","C":"C) Fear of being isolated by coworkers.","D":"D) Fear of having to do more work."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q50'
);
SET @q_cet6_2024_06_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_51, 'What is critical to ensuring workplace safety?', '{"A":"A) Workers be trained to operate their equipment properly.","B":"B) Workers exhibiting at-risk behavior be strictly disciplined.","C":"C) Supervisors create a safety environment for timely intervention.","D":"D) Supervisors conduct effective communication with frontline workers."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q51'
);
SET @q_cet6_2024_06_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_52, 'What accounts for the divide within the scientific community about nuclear energy?', '{"A":"A) Attention to combating human-made climate change.","B":"B) Emphasis on protecting wildlife and natural ecosystems.","C":"C) Evolution of the term \\"green energy\\" over the last century.","D":"D) Adherence to different interpretations of environmentalism."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q52'
);
SET @q_cet6_2024_06_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_53, 'What is the solution to energy shortage proposed by purists'' opponents?', '{"A":"A) Relying on renewables firmly and exclusively.","B":"B) Using fossil fuel and green energy alternately.","C":"C) Opting for nuclear energy when necessary.","D":"D) Limiting people''s non-basic consumption."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q53'
);
SET @q_cet6_2024_06_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_54, 'What point does the author want to make with cities like Burlington as an example?', '{"A":"A) It is controversial whether the goal of the whole world''s exclusive dependence on renewables is attainable.","B":"B) It is contentious whether cities with large populations have renewable resources at their immediate disposal.","C":"C) It is arguable whether cities that manage to run off renewables have sustainable hydroelectric capabilities.","D":"D) It is debatable whether traditional fossil fuel energy can be done away with entirely throughout the world."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q54'
);
SET @q_cet6_2024_06_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_55, 'What do we learn about Germany regarding renewable energy?', '{"A":"A) It has increased its wind and solar power generation four times over the last two decades.","B":"B) It represents a good example of a major industrialized country promoting green energy.","C":"C) It relies on renewable energy to generate more than half of its electricity.","D":"D) It has succeeded in reaching the goal of energy transition set by Merkel."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-1-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q55'
);
SET @q_cet6_2024_06_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_1_56, 'What may be one of the reasons for Germany''s progress having halted in recent years?', '{"A":"A) Its grid infrastructure''s capacity has fallen behind its development of green energy.","B":"B) Its overabundance of green energy has forced power plants to suspend operation during daytime.","C":"C) Its industrial south is used to running factories on conventional energy supplies.","D":"D) Its renewable energy supplies are unstable both at night and during the day."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_1_56
);

-- ==================== cet6-2024-06-2 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-r1', 'BANKED_CLOZE', 'CET6', NULL, 'The Sun Is Also a Star is a truly lovely story of love, romance, fate, and destiny. Natasha is a Jamaican-born immigrant living __26__ in America, not by choice exactly. Her parents brought her over and created the situation she __27__ to be out of. Daniel is an American born of Korean immigrants. He believes in true love, fate, and all that other nonsense that Natasha __28__ through scientific reasoning. Daniel and Natasha meet by __29__ on the streets of New York on the day that she is to be __30__ . She doesn''t tell him that but does allow him to keep her company while he tries to get her to fall in love with him over the course of the day. Natasha is me. I found her so similar to myself. She''s scientifically-minded, practical, somewhat cynical, and always __31__ . Her obsession with the universe through a scientific lens is infectious and I __32__ Daniel seeing that too. Daniel is charming and passionate and has a way with words that even __33__ Natasha''s tough outer shell. By the end of the book I fell in love with both of them. I used to find romance stories to always be cheap or laughable. I think now I can see the value in escaping into a story of pure optimism. I got __34__ in The Sun Is Also a Star and finished it cover to cover in a weekend. I couldn''t wait to get to what I hoped would be a happy ending. It''s nice every once in a while to give in to magic. It doesn''t have to be a hard fantasy novel with actual spells, it can be the magic found between two people who just have that special something. That __35__ that causes them to react and spark when they''re near each other.', NULL, '["A) adore","B) appraise","C) assaults","D) chemistry","E) coincidence","F) cracks","G) deported","H) dismisses","I) illegally","J) lost","K) perpetually","L) prescribed","M) shrewd","N) skeptical","O) strives"]', 306, 'IMPORT', 'cet6-2024-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-2-r1'
);
SET @pg_cet6_2024_06_2_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-2-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-r2', 'MATCHING', 'CET6', 'These are the habits to avoid if you want to make a behavior change', 'A) According to recent research, behavioral change involves physical changes in the brain. In the past decade, researchers have shown that when it comes to the duration of making a new behavior a deep-rooted habit there is not a simple answer. Even for the most productive and disciplined among us, undoing something that has become an automatic part of who we are takes more than an overnight effort. Once we''ve successfully made that change, we then have to make other adjustments to our lives to ensure that we continue to maintain it, which is often a whole other challenge in itself. B) At its core, success in changing and maintaining a behavior rarely occurs without the introduction of some sort of system. When there isn''t the right framework in place, we face a greater likelihood of derailing our hard-earned progress. To ensure success in changing and maintaining a behavior, we should stay away from some detrimental habits. C) The first one to avoid is relying on willpower. Think about the last time you vowed to resist a temptation. Perhaps you didn''t want to check your phone every 15 minutes, or you were determined not to reach for a chocolate bar at 3 p. m. Think about how difficult it must have been not to glance at your phone when it was within reach, or not to walk to the vending machine when your afternoon slump hit. D) The research on whether we have finite or infinite willpower is inconclusive, but experts do generally agree that you can''t change and sustain a habit if you rely on your willpower alone. The old military saying "You never rise to the occasion, you only sink to the level of training" also applies to behavior change. The idea is simple—you repeat something so many times that it becomes automatic. E) Think about what else you can change about your surrounding that makes it easier for you to perform this change on a daily basis. This is called your "cue." Basically, it''s a trigger to perform that particular habit. If you don''t want to reach for a sugary treat at 3 p. m. , have a box of herbal tea ready at your desk. When 3 p. m. comes around, that''s your cue to pour yourself a cup of hot water and drink that tea, instead of walking to the vending machine. F) The second one to avoid is focusing on negative goals. Sometimes, it''s not your process that lets you down, but the habit that you want to change in the first place. For starters, not eating chocolate to beat your afternoon slump is a harder goal than swapping chocolate for herbal tea when you reach the designated time. Your brain wants to find routines that have succeeded in the past and allow you to repeat those actions again in the future without having to think about them explicitly. However, this habit-learning system isn''t so effective when it comes to learning not to do something. That''s why rather than giving up something, think about introducing something in its place. Focus on actions you are going to take that will ultimately conflict with the behaviors you want to stop. When your attention is on doing something new, you give your habit system a chance to operate. G) The third one to avoid is using the same strategies in different circumstances. Because we are creatures of habit, it''s natural to assume that when we do manage to adopt and sustain a desirable behavior, that same strategy will work when we want to make another behavior change. But that''s not always the case. Sometimes, the system that got you to change one behavior might not work for another. H) Sometimes we become accustomed to relying on our guts when it comes to decision-making. This serves us well in certain situations, but can hinder us in others especially when we need to consider metrics and data, rather than letting our instinct override everything. For example, if you want to stop checking your email first thing in the morning, you might decide to substitute another activity in its place. But if you want to stop indulging in video games, simply deciding you will go for a run might not be as effective. You might need to introduce another reinforcement, such as meeting a friend and booking an exercise class together. I) The fourth one to avoid is not forgiving ourselves for slipping up. Of course, even the best-laid plans fail sometimes. You might have stuck to your screen-free nighttime routine for five days, and then a big project landed on your desk and you found yourself in bed with your laptop before you went to sleep. Or you prepared meals on Sunday and stuck to eating healthy dinners at home, but by Friday you found yourself so exhausted and opted to order greasy takeout. Life happens and even if your behavior change is small, every single day can prove pretty inflexible, and at some point your luck may run out, even if just for a day. The perfectionist in you might be screaming to abandon your goals altogether, but try to see it in the bigger picture. Just because you might have temporarily strayed off course doesn''t mean you can''t start afresh the next day. J) The final one to avoid is discounting small progress. There''s a habit that many perfectionists tend to fall into when they try to establish a behavior change. They focus too much on the big goal and don''t take the time to celebrate the small progress they make in the process. Your brain responds to rewards. The basal ganglia, the brain region linked to our performance of habits, is most active at the beginning of a behavior, when the habit is cued, and at the end, when it''s rewarded. Say your goal is to run five miles three times a week, and this week you ran one mile on Monday, Wednesday, and Friday. Rather than focusing on how far you''ve gone toward your goal, think about how you can reward yourself for the progress you''ve made. It doesn''t have to be big or expensive; it can be something as simple as making your favorite fruit juice after your run. Whatever your reward, it has to be more than just the activity itself to get you going. K) Initiating a new behavior usually seems like the hardest part of the process of change. However, people often fail to adequately prepare for maintaining it. One of the reasons for this is because we mistakenly believe the strategies we used to initiate the change will be equally effective in helping us continue the change. But they won''t. Where changing a strongly deep-rooted habit requires changing our belief about that habit that penetrates deeply into our lives, continually manifesting that wisdom requires that we maintain a positive outlook. If our mood is low, the wisdom to behave differently seems to disappear and we go back to eating more and exercising less. The key, then, to maintaining new behaviors is to be happy! Which is why it''s so hard to maintain new behaviors. L) Remember, overcoming the behavioral inertia that prevents us from implementing new changes, like eating a healthy diet or exercising, can benefit us in the long run and can improve our physical and mental health. No one was born with habits. They were all learned, and can all, therefore, be unlearned. The question is: how badly do you really want to change?', NULL, NULL, 1256, 'IMPORT', 'cet6-2024-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-2-r2'
);
SET @pg_cet6_2024_06_2_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-2-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-r3', 'CAREFUL_READING', 'CET6', NULL, 'The "American Dream" promises that in the Land of Opportunity, any individual can climb the economic ladder and prosper through hard work and ambition alone. And yet, young Americans today are struggling to earn more than their parents did at the same age, and upward mobility in the US actually compares unfavourably to that of other industrialised nations. So why does the idea of the American Dream persist? A new study in the American Journal of Political Science identifies one factor that has been overlooked: the influence of reality TV. Reality shows have come to dominate US television over the past 20 years, notes Eunji Kim from Vanderbilt University. And the overwhelming majority of these have a "rags-to-riches" storyline: they feature ordinary Americans who work hard to achieve great economic success. And while these programmes are regularly among the most-watched shows, news broadcasts—which paint a more realistic view of the economic hardship faced by millions of Americans—get a much smaller proportion of the viewership. Rags-to-riches stories are ubiquitous(无处不在的) on TV—but does watching these programmes actually convince people that economic mobility is easily attainable? To find out, Kim''s team had participants watch a 5- minute clip from a reality show with a rags-to-riches storyline. Control participants watched a clip from a reality show that didn''t have a rags-to-riches story. After watching the shows, participants rated how much they agreed with four statements relating to the American Dream. The results showed that those who''d watched a rags-to-riches clip did indeed have a significantly greater belief in the American Dream. Interestingly, when participants were separated by party affiliation, this effect was significant among Republicans but not Democrats, suggesting that the kind of messages implicit in these TV shows may play into people''s existing socioeconomic beliefs. Kim also conducted a survey of 3,000 US residents. They also rated the extent to which they believed success in life is related to various internal factors (such as ambition) and external factors (such as family wealth). Finally, they read a list of TV programmes and indicated which they regularly watched. Participants who were heavy viewers of rags-to-riches programmes or frequent viewers had a stronger belief in the American Dream than those who never watched such shows. Kim concludes that "rags-to-riches entertainment media are an important cultural force that promotes and perpetuates beliefs in upward mobility". And here''s the problem: if people mistakenly believe that hard work is all that is needed for individuals to make a better life for themselves, they may be less supportive of policies that could actually combat inequality. "In this era of choice, entertainment media is what captures hearts and minds," Kim writes. "Its political consequences are anything but trivial".', NULL, NULL, 447, 'IMPORT', 'cet6-2024-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-2-r3'
);
SET @pg_cet6_2024_06_2_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-2-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-r4', 'CAREFUL_READING', 'CET6', NULL, 'When someone asks us ''what do you do?'' we nearly always reply with our occupation. Work, for many of us, is much more than a job. It is the defining aspect of our identity. For many of us it is through our job that we can define ourselves. "Without my job I don''t know who I am," is a sentence that has been uttered on more than a handful of occasions from my office chair. Indeed, it can be one of the most challenging aspects I work on with clients who have lost or been forced into changing their jobs. This loss provokes an identity crisis much greater than the loss of the job itself. One of the things I have come to understand, however, is that our identity is much more complex than we recognise at first glance. If we take the time to reflect we might recognise that as well as our work we can also identify as a friend, a spouse, a son or daughter, a parent, a member of a sports team or religious community. We may recognise that we feel and act differently in these roles and relationships than we do at work. The passive daughter becomes an assertive leader at work. Furthermore, our identities at work are not static. They change over time. I myself have been a shop assistant, a waitress, a student, a graduate, and a clinical psychologist. At each stage my ability to adapt to and develop my career identity has been crucial to my wellbeing. Whilst we like to eliminate uncertainty in our lives at some level we have to manage uncertainty, especially in today''s volatile and ever-shifting job market. How we see ourselves is central to the issue of our identity. When we tell ourselves "I''m good at starting projects but not so great at seeing them through" it can become part of our belief system. But if you have the unfortunate experience of an enforced job change you will need to examine those beliefs to see how grounded in reality they are. You will be required to ask yourself how helpful these beliefs are and consider personal change. We can change our beliefs, behaviours and emotional experience at any time through experimentation, practice and conscious self-discipline. In an age where career progression may lead us into new sectors it is ever more important to challenge our sense of self and explore whether you can create a new experience of your identity by changing the beliefs you hold about yourself in order to expand your career options. Ultimately it is you who define who you are. You are only your job if you let it be so.', NULL, NULL, 448, 'IMPORT', 'cet6-2024-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-2-r4'
);
SET @pg_cet6_2024_06_2_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-2-r4' LIMIT 1);

-- 翻译 cet6-2024-06-2
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-translation'
);
SET @q_cet6_2024_06_2_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_01, '中国盛产竹子，是最早开发利用竹资源的国家。竹子在中国分布广泛，品种丰富。竹子实用性强，用于生产和生活的许多方面，如筷子、桌椅的制作和桥梁、房屋的建造。中国人爱竹，自古以来就有无数文人以竹为主题，创作了绚丽多彩的文学和绘画作品。竹子主干(stem) 笔直，象征正直的品格。竹子具有强大的生命力和适应能力，无论环境多么恶劣，都能够顽强生存，因而寓意坚韧不拔的精神。几千年来，竹子一直被视为中华民族品格的象征。', NULL, 'China abounds in bamboo and is among the first countries to develop and utilize bamboo resources. Bamboo is widely distributed across China and comes in a rich variety of species. It is also highly practical and is used in many aspects of production and daily life, such as making chopsticks, tables and chairs, and building bridges and houses. The Chinese people love bamboo, and since ancient times countless scholars have created splendid literary and artistic works with bamboo as their theme. The straight stem of bamboo symbolizes an upright character. Moreover, bamboo has strong vitality and adaptability; no matter how harsh the environment is, it can survive tenaciously, thus symbolizing the spirit of perseverance. For thousands of years, bamboo has been regarded as a symbol of the character of the Chinese nation.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_01
);

-- 听力 Q1 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q01', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q01'
);
SET @q_cet6_2024_06_2_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_02, NULL, '{"A":"A) Read numerous comments users put online.","B":"B) Blended all his food without using a machine.","C":"C) Searched for the state-of-the-art models of blenders.","D":"D) Did thorough research on the price of kitchen appliances."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_02
);

-- 听力 Q2 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q02', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q02'
);
SET @q_cet6_2024_06_2_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_03, NULL, '{"A":"A) Eating any blended food.","B":"B) Buying a blender herself.","C":"C) Using machines to do her cooking.","D":"D) Making soups and juices for herself."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_03
);

-- 听力 Q3 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q03', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q03'
);
SET @q_cet6_2024_06_2_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_04, NULL, '{"A":"A) Cooking every meal creatively in the kitchen.","B":"B) Paying due attention to his personal hygiene.","C":"C) Eating breakfast punctually every morning.","D":"D) Making his own fresh fruit juice regularly."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_04
);

-- 听力 Q4 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q04', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q04'
);
SET @q_cet6_2024_06_2_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_05, NULL, '{"A":"A) One-tenth of it is sugar.","B":"B) It looks healthy and attractive.","C":"C) One''s fancy may be tickled by it.","D":"D) It contains an assortment of nutrients."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_05
);

-- 听力 Q5 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q05', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q05'
);
SET @q_cet6_2024_06_2_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_06, NULL, '{"A":"A) How he has made himself popular as the mayor of Berkton.","B":"B) How the residents will turn Berkton into a tourist attraction.","C":"C) How charming he himself considers the village of Berkton to be.","D":"D) How he has led people of Berkton to change the village radically."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_06
);

-- 听力 Q6 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q06', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q06'
);
SET @q_cet6_2024_06_2_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_07, NULL, '{"A":"A) It was developed only to a limited extent.","B":"B) It was totally isolated as a sleepy village.","C":"C) It was relatively unknown to the outside.","D":"D) It was endowed with rare natural resources."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_07
);

-- 听力 Q7 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q07', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q07'
);
SET @q_cet6_2024_06_2_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_08, NULL, '{"A":"A) All the properties in Berkton were designed by the same architect.","B":"B) The majority of residents lived in harmony with their neighbours.","C":"C) The majority of residents enjoyed cosy housing conditions.","D":"D) All the houses in Berkton looked aesthetically similar."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q08', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q08'
);
SET @q_cet6_2024_06_2_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_09, NULL, '{"A":"A) They have helped boost the local economy.","B":"B) They have made the residents unusually proud.","C":"C) They have contributed considerably to its popularity.","D":"D) They have brought happiness to everyone in the village."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_09
);

-- 听力 Q9 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q09', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q09'
);
SET @q_cet6_2024_06_2_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_10, NULL, '{"A":"A) They have created the smallest remote-controlled walking robot in the world.","B":"B) They are going to publish their research findings in the journal Science Robotics.","C":"C) They are the first to build a robot that can bend, crawl, walk, turn and even jump.","D":"D) They are engaged in research on a remote-controlled robot which uses special power."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_10
);

-- 听力 Q10 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q10', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q10'
);
SET @q_cet6_2024_06_2_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_11, NULL, '{"A":"A) It changes its shape by complex hardware.","B":"B) It is operated by a special type of tiny motor.","C":"C) It moves from one place to another by memory.","D":"D) It is powered by the elastic property of its body."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_11
);

-- 听力 Q11 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q11', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q11'
);
SET @q_cet6_2024_06_2_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_12, NULL, '{"A":"A) Replace humans in exploratory tasks.","B":"B) Perform tasks in tightly confined spaces.","C":"C) Explore the structure of clogged arteries.","D":"D) Assist surgeons in highly complex surgery."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_12
);

-- 听力 Q12 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q12', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q12'
);
SET @q_cet6_2024_06_2_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_13, NULL, '{"A":"A) She threw up in the bathroom.","B":"B) She slept during the entire ride.","C":"C) She dozed off for a few minutes.","D":"D) She boasted of her marathon race."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_13
);

-- 听力 Q13 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q13', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q13'
);
SET @q_cet6_2024_06_2_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_14, NULL, '{"A":"A) They are mostly immune to cognitive impairment.","B":"B) They can sleep soundly during a rough ride at sea.","C":"C) They are genetically determined to need less sleep.","D":"D) They constitute about 13 percent of the population."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_14
);

-- 听力 Q14 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q14', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q14'
);
SET @q_cet6_2024_06_2_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_15, NULL, '{"A":"A) Whether there is a way to reach elite status.","B":"B) Whether it is possible to modify one''s genes.","C":"C) Whether having a baby impacts one''s passion.","D":"D) Whether one can train themselves to sleep less."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_15
);

-- 听力 Q15 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q15', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q15'
);
SET @q_cet6_2024_06_2_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_16, NULL, '{"A":"A) It is in fact quite possible to nurture a passion for sleep.","B":"B) Babies can severely disrupt their parents'' sleep patterns.","C":"C) Being forced to rise early differs from being an early bird.","D":"D) New parents are forced to jump out of bed at the crack of dawn."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_16
);

-- 听力 Q16 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q16', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q16'
);
SET @q_cet6_2024_06_2_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_17, NULL, '{"A":"A) We have poor awareness of how many controversial issues are being debated.","B":"B) No one knows better than yourself what you are thinking about at the moment.","C":"C) No one can change your opinions more than those who speak in a convincing tone.","D":"D) We are likely to underestimate how much we can be swayed by a convincing article."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_17
);

-- 听力 Q17 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q17', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q17'
);
SET @q_cet6_2024_06_2_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_18, NULL, '{"A":"A) Their belief about physical punishment changed.","B":"B) Their memory pushed them toward a current belief.","C":"C) The memory of their initial belief came back to them.","D":"D) Their experiences of physical punishment haunted them."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_18
);

-- 听力 Q18 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q18', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q18'
);
SET @q_cet6_2024_06_2_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_19, NULL, '{"A":"A) They apparently have little to do with moderate beliefs.","B":"B) They don''t reflect the change of view on physical punishment.","C":"C) They may not apply to changes to extreme or deeply held beliefs.","D":"D) They are unlikely to alter people''s position without more evidence."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_19
);

-- 听力 Q19 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q19', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q19'
);
SET @q_cet6_2024_06_2_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_20, NULL, '{"A":"A) American moms have been increasingly inclined to live alone.","B":"B) The American population has been on the rise in the past 25 years.","C":"C) American motherhood has actually been on the decline.","D":"D) The fertility rates in America have in fact been falling sharply."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_20
);

-- 听力 Q20 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q20', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q20'
);
SET @q_cet6_2024_06_2_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_21, NULL, '{"A":"A) More new mothers tend to take greater care of their children.","B":"B) More new mothers are economically able to raise children.","C":"C) A larger proportion of women take pride in their children.","D":"D) A larger proportion of women really enjoy motherhood."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_21
);

-- 听力 Q21 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q21', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q21'
);
SET @q_cet6_2024_06_2_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_22, NULL, '{"A":"A) The meaning of motherhood has changed considerably.","B":"B) More and more mothers go shopping to treat themselves.","C":"C) More mothers have adult children celebrating the holiday.","D":"D) The number of American mothers has been growing steadily."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_22
);

-- 听力 Q22 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q22', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q22'
);
SET @q_cet6_2024_06_2_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_23, NULL, '{"A":"A) A) Add to indoor toxic pollutants.","B":"B) Absorb poisonous chemicals.","C":"C) Beautify the home environment.","D":"D) Soak up surrounding moisture."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_23
);

-- 听力 Q23 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q23', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q23'
);
SET @q_cet6_2024_06_2_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_24, NULL, '{"A":"A) NASA did experiments in sealed containers resembling the super insulated offices of 1970s.","B":"B) It was based on experiments under conditions unlike those in most homes or offices.","C":"C) NASA conducted tests in outer space whose environment is different from ours.","D":"D) It drew its conclusion without any contrastive data from other experiments."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_24
);

-- 听力 Q24 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q24', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q24'
);
SET @q_cet6_2024_06_2_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_25, NULL, '{"A":"A) Natural ventilation proves much more efficient for cleaning the air than houseplants.","B":"B) Houseplants disperse chemical compounds more quickly with people moving around.","C":"C) Natural ventilation turns out to be most effective with doors and windows wide open.","D":"D) Houseplants in a normal environment rarely have any adverse impact on the air."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_25
);

-- 听力 Q25 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q25', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q25'
);
SET @q_cet6_2024_06_2_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_26, NULL, '{"A":"A) The root cause for misinterpretations of scientific findings.","B":"B) The difficulty in understanding what''s actually happening.","C":"C) The steps to be taken in arriving at any conclusion with certainty.","D":"D) The necessity of continually reexamining and challenging findings."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q26'
);
SET @q_cet6_2024_06_2_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_27, NULL, '{"A":"A) adore","B":"B) appraise","C":"C) assaults","D":"D) chemistry","E":"E) coincidence","F":"F) cracks","G":"G) deported","H":"H) dismisses","I":"I) illegally","J":"J) lost","K":"K) perpetually","L":"L) prescribed","M":"M) shrewd","N":"N) skeptical","O":"O) strives"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q27'
);
SET @q_cet6_2024_06_2_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_28, NULL, '{"A":"A) adore","B":"B) appraise","C":"C) assaults","D":"D) chemistry","E":"E) coincidence","F":"F) cracks","G":"G) deported","H":"H) dismisses","I":"I) illegally","J":"J) lost","K":"K) perpetually","L":"L) prescribed","M":"M) shrewd","N":"N) skeptical","O":"O) strives"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q28'
);
SET @q_cet6_2024_06_2_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_29, NULL, '{"A":"A) adore","B":"B) appraise","C":"C) assaults","D":"D) chemistry","E":"E) coincidence","F":"F) cracks","G":"G) deported","H":"H) dismisses","I":"I) illegally","J":"J) lost","K":"K) perpetually","L":"L) prescribed","M":"M) shrewd","N":"N) skeptical","O":"O) strives"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q29'
);
SET @q_cet6_2024_06_2_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_30, NULL, '{"A":"A) adore","B":"B) appraise","C":"C) assaults","D":"D) chemistry","E":"E) coincidence","F":"F) cracks","G":"G) deported","H":"H) dismisses","I":"I) illegally","J":"J) lost","K":"K) perpetually","L":"L) prescribed","M":"M) shrewd","N":"N) skeptical","O":"O) strives"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q30'
);
SET @q_cet6_2024_06_2_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_31, NULL, '{"A":"A) adore","B":"B) appraise","C":"C) assaults","D":"D) chemistry","E":"E) coincidence","F":"F) cracks","G":"G) deported","H":"H) dismisses","I":"I) illegally","J":"J) lost","K":"K) perpetually","L":"L) prescribed","M":"M) shrewd","N":"N) skeptical","O":"O) strives"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q31'
);
SET @q_cet6_2024_06_2_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_32, NULL, '{"A":"A) adore","B":"B) appraise","C":"C) assaults","D":"D) chemistry","E":"E) coincidence","F":"F) cracks","G":"G) deported","H":"H) dismisses","I":"I) illegally","J":"J) lost","K":"K) perpetually","L":"L) prescribed","M":"M) shrewd","N":"N) skeptical","O":"O) strives"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q32'
);
SET @q_cet6_2024_06_2_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_33, NULL, '{"A":"A) adore","B":"B) appraise","C":"C) assaults","D":"D) chemistry","E":"E) coincidence","F":"F) cracks","G":"G) deported","H":"H) dismisses","I":"I) illegally","J":"J) lost","K":"K) perpetually","L":"L) prescribed","M":"M) shrewd","N":"N) skeptical","O":"O) strives"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q33'
);
SET @q_cet6_2024_06_2_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_34, NULL, '{"A":"A) adore","B":"B) appraise","C":"C) assaults","D":"D) chemistry","E":"E) coincidence","F":"F) cracks","G":"G) deported","H":"H) dismisses","I":"I) illegally","J":"J) lost","K":"K) perpetually","L":"L) prescribed","M":"M) shrewd","N":"N) skeptical","O":"O) strives"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q34'
);
SET @q_cet6_2024_06_2_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_35, NULL, '{"A":"A) adore","B":"B) appraise","C":"C) assaults","D":"D) chemistry","E":"E) coincidence","F":"F) cracks","G":"G) deported","H":"H) dismisses","I":"I) illegally","J":"J) lost","K":"K) perpetually","L":"L) prescribed","M":"M) shrewd","N":"N) skeptical","O":"O) strives"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q35'
);
SET @q_cet6_2024_06_2_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_36, NULL, '{"A":"A) adore","B":"B) appraise","C":"C) assaults","D":"D) chemistry","E":"E) coincidence","F":"F) cracks","G":"G) deported","H":"H) dismisses","I":"I) illegally","J":"J) lost","K":"K) perpetually","L":"L) prescribed","M":"M) shrewd","N":"N) skeptical","O":"O) strives"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q36'
);
SET @q_cet6_2024_06_2_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_37, 'There is general consensus among experts that willpower alone cannot guarantee one''s success in changing and maintaining a habit.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q37'
);
SET @q_cet6_2024_06_2_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_38, 'One need not abandon their goals completely just because they missed their target temporarily; they can start anew.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q38'
);
SET @q_cet6_2024_06_2_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_39, 'Research shows it is quite another challenge to maintain a behavioral change after you have initiated it.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q39'
);
SET @q_cet6_2024_06_2_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_40, 'It is wrong to assume the strategies we use to start a change of behavior will work equally well in helping maintain it.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q40'
);
SET @q_cet6_2024_06_2_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_41, 'Sometimes, it may not be successful to simply substitute one activity with another to effect a change of habit; you may need extra reinforcement.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q41'
);
SET @q_cet6_2024_06_2_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_42, 'One should introduce something new to replace an old habit instead of simply kicking it.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q42'
);
SET @q_cet6_2024_06_2_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_43, 'Perfectionists focus too much on their big target and neglect celebrating the small gains they make in the process.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q43'
);
SET @q_cet6_2024_06_2_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_44, 'It is of great benefit to us in the long term to conquer the inertia that stops us from making behavioral changes.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q44'
);
SET @q_cet6_2024_06_2_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_45, 'The strategy that successfully changed one of your behaviors may not work for some other behavior of yours.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q45'
);
SET @q_cet6_2024_06_2_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_46, 'Without a happy mood, it seems that our wisdom to adopt a different behavior vanishes.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q46'
);
SET @q_cet6_2024_06_2_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_47, 'What do we learn from the passage about young Americans of today?', '{"A":"A) They have greater ambitions than their parents.","B":"B) They find it difficult to achieve upward mobility.","C":"C) They have overtaken their parents in terms of earnings.","D":"D) They envy the opportunities in other industrialised nations."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q47'
);
SET @q_cet6_2024_06_2_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_48, 'What does Kim''s team find about reality TV shows in America?', '{"A":"A) They reinterpret the essence of the popular rags-to-riches culture.","B":"B) They urge people to achieve economic success through hard work.","C":"C) They help strengthen people''s conviction in the American Dream.","D":"D) They feature ordinary Americans striving for social recognition."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q48'
);
SET @q_cet6_2024_06_2_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_49, 'What does the author say about news broadcasts in America?', '{"A":"A) They attract far fewer viewers than reality TV.","B":"B) They are bent on reporting the dark side of life.","C":"C) They stand in striking contrast with reality TV.","D":"D) They focus on Americans'' economic hardships."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q49'
);
SET @q_cet6_2024_06_2_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_50, 'What can we infer from the passage about Republicans in general?', '{"A":"A) They believe strongly in the American Dream.","B":"B) They strive to climb the socio-economic ladder.","C":"C) They have a very strong affiliation with their party.","D":"D) They tend to watch more rags-to-riches TV shows."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q50'
);
SET @q_cet6_2024_06_2_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_51, 'What is stated about people who believe in upward mobility?', '{"A":"A) They are likely to blame the government for their plight.","B":"B) They regard political consequences as anything but trivial.","C":"C) They respect individuals striving to climb the social ladder.","D":"D) They are less likely to approve of policies to fight inequality."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q51'
);
SET @q_cet6_2024_06_2_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_52, 'What do we learn from the passage about one''s loss of a job?', '{"A":"A) It compels them to visit a clinical psychologist.","B":"B) It offers them a chance to play different roles.","C":"C) It renders them puzzled about who they are.","D":"D) It forces them to redefine their life''s goals."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q52'
);
SET @q_cet6_2024_06_2_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_53, 'What has the author come to understand about our identity?', '{"A":"A) It is crucial to our emotional wellbeing.","B":"B) It plays a big role in many facets of life.","C":"C) It reflects our changing status in society.","D":"D) It is more complicated than it appears."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q53'
);
SET @q_cet6_2024_06_2_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_54, 'What does the passage say about our identities at work?', '{"A":"A) They are essential to our self-esteem.","B":"B) They evolve with the passage of time.","C":"C) They overrule all other self-perceptions.","D":"D) They are key to understanding ourselves."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q54'
);
SET @q_cet6_2024_06_2_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_55, 'What do we have to do in today''s ever-changing job market?', '{"A":"A) Strive to develop our social identity.","B":"B) Prepare for different career paths.","C":"C) Try to be assertive at all times.","D":"D) Learn to manage uncertainty."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-2-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q55'
);
SET @q_cet6_2024_06_2_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-2-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_2_56, 'What should we do to expand our career options?', '{"A":"A) Alter our perceptions of ourselves.","B":"B) Compare various job opportunities.","C":"C) Look into newly emerging sectors.","D":"D) Exercise self-discipline consciously."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_2_56
);

-- ==================== cet6-2024-06-3 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-r1', 'BANKED_CLOZE', 'CET6', NULL, 'A rainbow is a multi-colored, arc-shaped phenomenon that can appear in the sky. The colors of a rainbow are produced by the reflection and __26__ of light through water droplets(小滴) present in the atmosphere. An observer may __27__ a rainbow to be located either near or far away, but this phenomenon is not actually located at any specific spot. Instead, the appearance of a rainbow depends entirely upon the position of the observer in __28__ to the direction of light. In essence, a rainbow is an __29__ illusion. Rainbows present a __30__ made up of seven colors in a specific order. In fact, school children in many English-speaking countries are taught to remember the name "Roy G. Biv" as an aid for remembering the colors of a rainbow and their order. "Roy G. Biv" __31__ for: red, orange, yellow, green, blue, indigo, and violet. The outer edge of the rainbow arc is red, while the inner edge is violet. A rainbow is formed when light (generally sunlight) passes through water droplets __32__ in the atmosphere. The light waves change direction as they pass through the water droplets, resulting in two processes: reflection and refraction(折射). When light reflects off a water droplet, it simply __33__ back in the opposite direction from where it __34__ . When light refracts, it takes a different direction. Some individuals refer to refracted light as "bent light waves." A rainbow is formed because white light enters the water droplet, where it bends in several different directions. When these bent light waves reach the other side of the water droplet, they reflect back out of the droplet instead of __35__ passing through the water. Since the white light is separated inside of the water, the refracted light appears as separate colors to the human eye.', NULL, '["A) bounces","B) completely","C) dispersion","D) eccentric","E) hanging","F) optical","G) originates","H) perceive","I) permeates","J) ponder","K) preceding","L) recklessly","M) relation","N) spectrum","O) stands"]', 298, 'IMPORT', 'cet6-2024-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-3-r1'
);
SET @pg_cet6_2024_06_3_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-3-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-r2', 'MATCHING', 'CET6', 'Blame your worthless workdays on meeting recovery syndrome', 'A) Phyllis Hartman knows what it''s like to make one''s way through the depths of office meeting hell. Managers at one of her former human resources jobs arranged so many meetings that attendees would fall asleep at the table or intentionally arrive late. With hours of her day blocked up with unnecessary meetings, she was often forced to make up her work during overtime. "I was actually working more hours than I probably would have needed to get the work done," says Hartman, who is founder and president of PGHR Consulting in Pittsburgh, Pennsylvania. B) She isn''t alone in her frustration. Between 11 million and 55 million meetings are held each day in the United States, costing most organisations between 7% and 15% of their personnel budgets. Every week, employees spend about six hours in meetings, while the average manager meets for a staggering 23 hours. C) And though experts agree that traditional meetings are essential for making certain decisions and developing strategy, some employees view them as one of the most unnecessary parts of the workday. The result is not only hundreds of billions of wasted dollars, but an annoyance of what organisational psychologists call "meeting recovery syndrome (MRS)": time spent cooling off and regaining focus after a useless meeting. If you run to the office kitchen to get some relief with colleagues after a frustrating meeting, you''re likely experiencing meeting recovery syndrome. D) Meeting recovery syndrome is a concept that should be familiar to almost anyone who has held a formal job. It isn''t ground-breaking to say workers feel fatigued after a meeting, but only in recent decades have scientists deemed the condition worthy of further investigation. With its links to organisational efficiency and employee wellbeing, MRS has attracted the attention of psychologists aware of the need to understand its precise causes and cures. E) Today, in so far as researchers can hypothesise, MRS is most easily understood as a slow renewal of finite mental and physical resources. When an employee sits through an ineffective meeting their brain power is essentially being drained away. Meetings drain vitality if they last too long, fail to engage employees or turn into one-sided lectures. The conservation of resources theory, originally proposed in 1989 by Dr Stevan Hobfoll, states that psychological stress occurs when a person''s resources are threatened or lost. When resources are low, a person will shift into defence to conserve their remaining supply. In the case of office meetings, where some of employees'' most valuable resources are their focus, alertness and motivation, this can mean an abrupt halt in productivity as they take time to recover. F) As humans, when we transition from one task to another on the job—say from sitting in a meeting to doing normal work—it takes an effortful cognitive switch. We must detach ourselves from the previous task and expend significant mental energy to move on. If we are already drained to dangerous levels, then making the mental switch to the next thing is extra tough. It''s common to see people cyber-loafing after a frustrating meeting, going and getting coffee, interrupting a colleague and telling them about the meeting, and so on. G) Each person''s ability to recover from horrible meetings is different. Some can bounce back quickly, while others carry their fatigue until the end of the workday. Yet while no formal MRS studies are currently underway, one can loosely speculate on the length of an average employee''s lag time. Switching tasks in a non-MRS condition takes about 10 to 15 minutes. With MRS, it may take as long as 45 minutes on average. It''s even worse when a worker has several meetings that are separated by 30 minutes. "Not enough time to transition in a non-MRS situation to get anything done, and in an MRS situation, not quite enough time to recover for the next meeting," says researcher Joseph Allen. "Then, add the compounding of back-to-back bad meetings and we may have an epidemic on our hands." H) In an effort to combat the side effects of MRS, Allen, along with researcher Joseph Mroz and colleagues at the University of Nebraska-Omaha, published a study detailing the best ways to avoid common traps, including a concise checklist of do''s and don''ts applicable to any workplace. Drawing from around 200 papers to compile their comprehensive list, Mroz and his team may now hold a remedy to the largely undefined problem of MRS. I) Mroz says a good place to start is asking ourselves if our meetings are even necessary in the first place. If all that''s on the agenda is a quick catch-up, or some non-urgent information sharing, it may better suit the group to send around an email instead. "The second thing I would always recommend is keep the meeting as small as possible," says Mroz. "If they don''t actually have some kind of immediate input, then they can follow up later. They don''t need to be sitting in this hour-long meeting." Less time in meetings would ultimately lead to more employee engagement in the meetings they do attend, which experts agree is a proven remedy for MRS. J) Employees also feel taxed when they are invited together to meetings that don''t inspire participation, says Cliff Scott, professor of organisational science. It takes precious time for them to vent their emotions, complain and try to regain focus after a pointless meeting—one of the main traps of MRS. Over time as employees find themselves tied up in more and more unnecessary meetings—and thus dealing with increasing lag times from MRS—the waste of workday hours can feel insulting. K) Despite the relative scarcity of research behind the subject, Hartman has taught herself many of the same tricks suggested in Mroz''s study, and has come a long way since her days of being stuck with unnecessary meetings. The people she invites to meetings today include not just the essential employees, but also representatives from every department that might have a stake in the issue at hand. Managers like her, who seek input even from non-experts to shape their decisions, can find greater support and cooperation from their workforce, she says. L) If an organisation were to apply all 22 suggestions from Mroz and Allen''s findings, the most noticeable difference would be a stark decrease in the total number of meetings on the schedule, Mroz says. Less time in meetings would ultimately lead to increased productivity, which is the ultimate objective of convening a meeting. While none of the counter-MRS ideas have been tested empirically yet, Allen says one trick with promise is for employees to identify things that quickly change their mood from negative to positive. As simple as it sounds, finding a personal happy place, going there and then coming straight back to work might be key to facilitating recovery. M) Leaders should also see themselves as "stewards of everyone else''s valuable time", adds Steven Rogelberg, author of The Surprising Science of Meetings. Having the skills to foresee potential traps and treat employees'' endurance with care allows leaders to provide effective short-term deterrents to MRS. N) Most important, however, is for organisations to awaken to the concept of meetings being flexible, says Allen. By reshaping the way they prioritise employees'' time, companies can eliminate the very sources of MRS in their tracks.', NULL, NULL, 1216, 'IMPORT', 'cet6-2024-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-3-r2'
);
SET @pg_cet6_2024_06_3_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-3-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-r3', 'CAREFUL_READING', 'CET6', NULL, 'Sarcasm and jazz have something surprisingly in common: You know them when you hear them. Sarcasm is mostly understood through tone of voice, which is used to portray the opposite of the literal words. For example, when someone says, "Well, that''s exactly what I need right now," their tone can tell you it''s not what they need at all. Most frequently, sarcasm highlights an irritation or is, quite simply, mean. If you want to be happier and improve your relationships, cut out sarcasm. Why? Because sarcasm is actually hostility disguised as humor. Despite smiling outwardly, many people who receive sarcastic comments feel put down and often think the sarcastic person is rude, or contemptible. Indeed, it''s not surprising that the origin of the word sarcasm derives from the Greek word "sarkazein" which literally means "to tear or strip the flesh off." Hence, it''s no wonder that sarcasm is often preceded by the word "cutting" and that it hurts. What''s more, since actions strongly determine thoughts and feelings, when a person consistently acts sarcastically it may only serve to heighten their underlying hostility and insecurity. After all, when you come right down to it, sarcasm can be used as a subtle form of bullying—and most bullies are angry, insecure, or cowardly. Alternatively, when a person stops voicing negative comments, especially sarcastic ones, they may soon start to feel happier and more self-confident. Also, other people in their life benefit even more because they no longer have to hear the emotionally hurtful language of sarcasm. Now, I''m not saying all sarcasm is bad. It may just be better used sparingly—like a potent spice in cooking. Too much of the spice, and the dish will be overwhelmed by it. Similarly, an occasional dash of sarcastic wit can spice up a chat and add an element of humor to it. But a big or steady serving of sarcasm will overwhelm the emotional flavor of any conversation and can taste very bitter to its recipient. So, tone down the sarcasm and work on clever wit instead, which is usually without any hostility and thus more appreciated by those you''re communicating with. In essence, sarcasm is easy while true, harmless wit takes talent. Thus, the main difference between wit and sarcasm is that, as already stated, sarcasm is often hostility disguised as humor. It can be intended to hurt and is often bitter and biting. Witty statements are usually in response to someone''s unhelpful remarks or behaviors, and the intent is to untangle and clarify the issue by emphasizing its absurdities. Sarcastic statements are expressed in a cutting manner; witty remarks are delivered with undisguised and harmless humor.', NULL, NULL, 442, 'IMPORT', 'cet6-2024-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-3-r3'
);
SET @pg_cet6_2024_06_3_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-3-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-r4', 'CAREFUL_READING', 'CET6', NULL, 'Variability is crucially important for learning new skills. Consider learning how to serve in tennis. Should you always practise serving from the exactly same location on the court, aiming at the same spot? Although practising in more variable conditions will be slower at first, it will likely make you a better tennis player in the end. This is because variability leads to better generalisation of what is learned. This principle is found in many domains, including speech perception and learning categories. For instance, infants will struggle to learn the category "dog" if they are only exposed to Chihuahuas, instead of many different kinds of dogs. "There are over ten different names for this basic principle," says Limor Raviv, the senior investigator of a recent study. "Learning from less variable input is often fast, but may fail to generalise to new stimuli." To identify key patterns and understand the underlying principles of variability effects, Raviv and her colleagues reviewed over 150 studies on variability and generalisation across fields, including computer science, linguistics, categorisation, visual perception and formal education. The researchers discovered that, across studies, the term variability can refer to at least four different kinds of variability, such as set size and scheduling. "These four kinds of variability have never been directly compared —which means that we currently don''t know which is most effective for learning," says Raviv. The impact of variability depends on whether it is relevant to the task or not. But according to the ''Mr. Miyagi principle'', practising seemingly unrelated skills may actually benefit learning of other skills. But why does variability impact learning and generalisation? One theory is that more variable input can highlight which aspects of a task are relevant and which are not. Another theory is that greater variability leads to broader generalisations. This is because variability will represent the real world better, including atypical(非典型的) examples. A third reason has to do with the way memory works: when training is variable, learners are forced to actively reconstruct their memories. "Understanding the impact of variability is important for literally every aspect of our daily life. Beyond affecting the way we learn language, motor skills, and categories, it even has an impact on our social lives," explains Raviv. "For example, face recognition is affected by whether people grew up in a small community or in a larger community. Exposure to fewer faces during childhood is associated with diminished face memory." "We hope this work will spark people''s curiosity and generate more work on the topic," concludes Raviv. "Our paper raises a lot of open questions. Can we find similar effects of variability beyond the brain, for instance, in the immune system?"', NULL, NULL, 444, 'IMPORT', 'cet6-2024-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-3-r4'
);
SET @pg_cet6_2024_06_3_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-06-3-r4' LIMIT 1);

-- 翻译 cet6-2024-06-3
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-translation'
);
SET @q_cet6_2024_06_3_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_01, '扇子自古以来就深受中国人喜爱，但现在已不只是消暑纳凉的工具，而更多地作为艺术品供人欣赏。许多扇子造型优美、做工精良，并绘有山水、花鸟、人物等精美图案，具有很高的艺术价值。中国许多著名画家和书法家喜欢在扇子上作诗绘画，展示其艺术品味。扇子常作为礼物赠予他人，表达美好的祝福和真挚的情感。如今，扇子的实用功能已大为减弱， 但作为一种文化符号和艺术形式，扇子仍然在中国传统文化中扮演着重要角色。', NULL, 'Fans have long been cherished by the Chinese people. Today, however, they are no longer merely tools for keeping cool, but are more often appreciated as works of art. Many fans, with graceful shapes and exquisite workmanship, are decorated with delicate patterns of landscapes, flowers and birds, and figures, and thus carry high artistic value. In addition, many famous Chinese painters and calligraphers like to write poems and paint pictures on fans to display their artistic taste. Fans are also often given to others as gifts to convey good wishes and sincere feelings. Today, although the practical function of fans has greatly weakened, the fan, as a cultural symbol and an art form, still plays an important role in traditional Chinese culture.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_01
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q26'
);
SET @q_cet6_2024_06_3_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_02, NULL, '{"A":"A) bounces","B":"B) completely","C":"C) dispersion","D":"D) eccentric","E":"E) hanging","F":"F) optical","G":"G) originates","H":"H) perceive","I":"I) permeates","J":"J) ponder","K":"K) preceding","L":"L) recklessly","M":"M) relation","N":"N) spectrum","O":"O) stands"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_02
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q27'
);
SET @q_cet6_2024_06_3_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_03, NULL, '{"A":"A) bounces","B":"B) completely","C":"C) dispersion","D":"D) eccentric","E":"E) hanging","F":"F) optical","G":"G) originates","H":"H) perceive","I":"I) permeates","J":"J) ponder","K":"K) preceding","L":"L) recklessly","M":"M) relation","N":"N) spectrum","O":"O) stands"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_03
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q28'
);
SET @q_cet6_2024_06_3_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_04, NULL, '{"A":"A) bounces","B":"B) completely","C":"C) dispersion","D":"D) eccentric","E":"E) hanging","F":"F) optical","G":"G) originates","H":"H) perceive","I":"I) permeates","J":"J) ponder","K":"K) preceding","L":"L) recklessly","M":"M) relation","N":"N) spectrum","O":"O) stands"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_04
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q29'
);
SET @q_cet6_2024_06_3_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_05, NULL, '{"A":"A) bounces","B":"B) completely","C":"C) dispersion","D":"D) eccentric","E":"E) hanging","F":"F) optical","G":"G) originates","H":"H) perceive","I":"I) permeates","J":"J) ponder","K":"K) preceding","L":"L) recklessly","M":"M) relation","N":"N) spectrum","O":"O) stands"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_05
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q30'
);
SET @q_cet6_2024_06_3_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_06, NULL, '{"A":"A) bounces","B":"B) completely","C":"C) dispersion","D":"D) eccentric","E":"E) hanging","F":"F) optical","G":"G) originates","H":"H) perceive","I":"I) permeates","J":"J) ponder","K":"K) preceding","L":"L) recklessly","M":"M) relation","N":"N) spectrum","O":"O) stands"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_06
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q31'
);
SET @q_cet6_2024_06_3_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_07, NULL, '{"A":"A) bounces","B":"B) completely","C":"C) dispersion","D":"D) eccentric","E":"E) hanging","F":"F) optical","G":"G) originates","H":"H) perceive","I":"I) permeates","J":"J) ponder","K":"K) preceding","L":"L) recklessly","M":"M) relation","N":"N) spectrum","O":"O) stands"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_07
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q32'
);
SET @q_cet6_2024_06_3_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_08, NULL, '{"A":"A) bounces","B":"B) completely","C":"C) dispersion","D":"D) eccentric","E":"E) hanging","F":"F) optical","G":"G) originates","H":"H) perceive","I":"I) permeates","J":"J) ponder","K":"K) preceding","L":"L) recklessly","M":"M) relation","N":"N) spectrum","O":"O) stands"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_08
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q33'
);
SET @q_cet6_2024_06_3_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_09, NULL, '{"A":"A) bounces","B":"B) completely","C":"C) dispersion","D":"D) eccentric","E":"E) hanging","F":"F) optical","G":"G) originates","H":"H) perceive","I":"I) permeates","J":"J) ponder","K":"K) preceding","L":"L) recklessly","M":"M) relation","N":"N) spectrum","O":"O) stands"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_09
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q34'
);
SET @q_cet6_2024_06_3_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_10, NULL, '{"A":"A) bounces","B":"B) completely","C":"C) dispersion","D":"D) eccentric","E":"E) hanging","F":"F) optical","G":"G) originates","H":"H) perceive","I":"I) permeates","J":"J) ponder","K":"K) preceding","L":"L) recklessly","M":"M) relation","N":"N) spectrum","O":"O) stands"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_10
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q35'
);
SET @q_cet6_2024_06_3_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_11, NULL, '{"A":"A) bounces","B":"B) completely","C":"C) dispersion","D":"D) eccentric","E":"E) hanging","F":"F) optical","G":"G) originates","H":"H) perceive","I":"I) permeates","J":"J) ponder","K":"K) preceding","L":"L) recklessly","M":"M) relation","N":"N) spectrum","O":"O) stands"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_11
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q36'
);
SET @q_cet6_2024_06_3_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_12, 'Although employees are said to be fatigued by meetings, the condition has not been considered worthy of further research until recently.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_12
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q37'
);
SET @q_cet6_2024_06_3_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_13, 'Mroz and his team compiled a list of what to do and what not to do to remedy the problem of MRS.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_13
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q38'
);
SET @q_cet6_2024_06_3_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_14, 'Companies can get rid of the root cause of MRS if they give priority to workers'' time.', NULL, 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_14
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q39'
);
SET @q_cet6_2024_06_3_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_15, 'If workers are exhausted to a dangerous degree, it is extremely hard for them to transition to the next task.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_15
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q40'
);
SET @q_cet6_2024_06_3_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_16, 'Employees in America spend a lot of time attending meetings while the number of hours managers meet is several times more.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_16
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q41'
);
SET @q_cet6_2024_06_3_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_17, 'Phyllis Hartman has learned by herself many of the ways Mroz suggested in his study and made remarkable success in freeing herself from unnecessary meetings.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_17
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q42'
);
SET @q_cet6_2024_06_3_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_18, 'When meetings continue too long or don''t engage employees, they deplete vitality.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_18
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q43'
);
SET @q_cet6_2024_06_3_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_19, 'When the time of meetings is reduced, employees will be more engaged in the meetings they do participate in.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_19
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q44'
);
SET @q_cet6_2024_06_3_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_20, 'Some employees consider meetings one of the most dispensable parts of the workday.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_20
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q45'
);
SET @q_cet6_2024_06_3_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_21, 'According to Mroz, if all his suggestions were applied, a very obvious change would be a steep decrease in the number of meetings scheduled.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_21
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q46'
);
SET @q_cet6_2024_06_3_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_22, 'Why does the author say sarcasm and jazz have something surprisingly in common?', '{"A":"A) Both are recognized when heard.","B":"B) Both have exactly the same tone.","C":"C) Both mean the opposite of what they appear to.","D":"D) Both have hidden in them an evident irritation."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_22
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q47'
);
SET @q_cet6_2024_06_3_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_23, 'How do many people feel when they hear sarcastic comments?', '{"A":"A) They feel hostile towards the sarcastic person.","B":"B) They feel belittled and disrespected.","C":"C) They feel a strong urge to retaliate.","D":"D) They feel incapable of disguising their irritation."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_23
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q48'
);
SET @q_cet6_2024_06_3_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_24, 'What happens when a person consistently acts sarcastically?', '{"A":"A) They feel their dignity greatly heightened.","B":"B) They feel increasingly insecure and hostile.","C":"C) They endure hostility under the disguise of humor.","D":"D) They taste bitterness even in pleasant interactions."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_24
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q49'
);
SET @q_cet6_2024_06_3_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_25, 'What does the author say about people quitting sarcastic comments?', '{"A":"A) It makes others happier and more self-confident.","B":"B) It restrains them from being irritating and bullying.","C":"C) It benefits not only themselves but also those around them.","D":"D) It shields them from negative comments and outright hostility."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_25
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q50'
);
SET @q_cet6_2024_06_3_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_26, 'What is the chief difference between a speaker''s wit and sarcasm?', '{"A":"A) Their clarity.","B":"B) Their appreciation.","C":"C) Their emphasis.","D":"D) Their intention."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_26
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q51'
);
SET @q_cet6_2024_06_3_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_27, 'What does the passage say about infants learning the category "dog" if they are exposed to Chihuahuas only?', '{"A":"A) They will encounter some degree of difficulty.","B":"B) They will try to categorise other objects first.","C":"C) They will prefer Chihuahuas to other dog species.","D":"D) They will imagine Chihuahuas in various conditions."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_27
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q52'
);
SET @q_cet6_2024_06_3_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_28, 'What does Raviv say about the four different kinds of variability?', '{"A":"A) Which of them is most relevant to the task at hand is to be confirmed.","B":"B) Why they have an impact on learning is far from being understood.","C":"C) Why they have never been directly compared remains a mystery.","D":"D) Which of them is most conducive to learning is yet to be identified."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_28
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q53'
);
SET @q_cet6_2024_06_3_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_29, 'How does one of the theories explain the importance of variability for learning new skills?', '{"A":"A) Learners regard variable training as typical of what happens in the real world.","B":"B) Learners receiving variable training are compelled to reorganise their memories.","C":"C) Learners pay attention to the relevant aspects of a task and ignore those irrelevant.","D":"D) Learners focus on related skills instead of wasting time and effort on unrelated ones."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_29
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q54'
);
SET @q_cet6_2024_06_3_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_30, 'What does the passage say about face recognition?', '{"A":"A) People growing up in a small community may find it easy to remember familiar faces.","B":"B) Face recognition has a significant impact on literally every aspect of our social lives.","C":"C) People growing up in a large community can readily recognise any individual faces.","D":"D) The size of the community people grow up in impacts their face recognition ability."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_30
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-06-3-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q55'
);
SET @q_cet6_2024_06_3_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-06-3-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_06_3_31, 'What does Raviv hope to do with their research work?', '{"A":"A) Highlight which aspects of a task are relevant and which are not to learning a skill.","B":"B) Use the principle of variability in teaching seemingly unrelated skills in education.","C":"C) Arouse people''s interest in variability and stimulate more research on the topic.","D":"D) Apply the principle of variability to such fields of study as the immune system."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_06_3_31
);

-- ==================== cet6-2024-12-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-r1', 'BANKED_CLOZE', 'CET6', NULL, 'With the rapid progress in the economy, it is natural that people''s ideology is bound for change. Being __26__ is no longer a virtue to some people, and they are not alone in holding this view. Each might have different viewpoints on how to lead one''s lifestyle: some prefer simplicity, some love luxuries, some spend __27__ , some accumulate as much as they can like a country mouse. As I was born poor and in the countryside, the simple rural life seldom loses its __28__ to me, but as my station changes, I have an opportunity to __29__ with the newly rich, an experience which has revolutionized my view of lifestyle. It is evil or sinful to spend little and to save much, an idea only recently being revealed to me. Actually the whole world is in a __30__ to borrow and to spend, with the USA leading the trend. The USA is still the richest and most powerful country in the world, but the __31__ is that they borrow money from us. Though a __32__ of economics, at least I know that investing with borrowed money will turn the borrower into the __33__ rather than the decent and kind lender. An apparent case is real estate. Those who are __34__ and have got loans from the bank become relatively rich by selling their purchased home at a price several folds higher. Even education is not immune from this theory. Many of those poor parents who have the vision to send their children to college have benefited from this investment, even though they have to __35__ a living. It is reasonable to conclude that spending is praiseworthy, supposing it is not beyond your means.', NULL, '["A) appeal","B) extravagantly","C) intrinsically","D) irony","E) layman","F) literally","G) majestic","H) malicious","I) meadow","J) mingle","K) predator","L) rage","M) scrape","N) shrewd","O) thrifty"]', 284, 'IMPORT', 'cet6-2024-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-1-r1'
);
SET @pg_cet6_2024_12_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-r2', 'MATCHING', 'CET6', 'Are Forgotten Crops the Future of Food?', 'A) On a small fruit farm near the Straits of Malacca, Lim Kok Ann is down to just one tree growing kedondong, a crunchy, sour berry that Malaysians mostly use in pickles(腌菜) and salads. "It''s not very well- known," says the 45-year-old, who is instead focusing on longan(龙眼) berries and pineapples, which have bigger markets. "We have to grow what is profitable," he says. B) But less than an hour away in the Malaysian countryside, inside three giant, silver domes, scientists are trying to change the future of food. They''re pushing the boundaries of what humans eat by growing and processing so-called "alternative" crops—such as kedondong. At the headquarters of global research centre Crops For the Future (CFF) this particular under-used fruit has been turned into a sugar-free juice, high in vitamin C and getting top marks in sensory evaluations. "Anything you see here is a forgotten crop," says Sayed Azam-Ali of the abundant plants weaving through the gardens of CFF outside Malaysia''s capital Kuala Lumpur. C) Prof Azam-Ali explains that just four crops—wheat, maize, rice and soybean—provide two-thirds of the world''s food supply. "We''re dependent on these four," he says. "But actually there''re 7,000 crops we''ve been farming for thousands of years. We ignore all of those." Researchers are trying to unlock the potential of these ignored crops—plants they describe as forgotten, under-used or "alternative" as they are displaced by increasingly uniform diets fuelled by processed ingredients from the major crops. D) It''s a timely quest. The food sector is already responsible for nearly a third of global greenhouse gas emissions. By 2050 it estimates the world must produce 50% more food to feed the projected global population of 10 billion. Meeting this demand without contributing to climate change calls for urgent solutions. E) Forgotten crops hold key answers. By investing in neglected local plants, countries can reduce their reliance on imported crops and their carbon-heavy supply chains. Bringing back the variety of crops humans once ate also boosts food security at a time warming climates threaten existing crops. On top of that forgotten crops are among the most climate-resilient(具有气候韧性的) and nutritious, argues Azam-Ali. His summary is plain: "Dietary diversification is critical to the future of humanity." F) Food security experts agree. "There is no food insecurity in the world, there is food ignorance," says Cecilia Tortajada, a senior research fellow at the Institute of Water Policy at the National University of Singapore. "Whenever we have native crops we tend to disregard them as if they were not valuable but they are," she adds. G) Azam-Ali knows that scepticism firsthand. He came across alternative crops in the 1980s through the work of women farmers he met in Niger. The then-PhD student remembers marvelling at the crops they grew in their backyards, without the benefits of technology, to feed their families when the big crops failed. He saw a tremendous opportunity to build alternative food systems. But "the resistance was enormous," he recalls. H) Undeterred, he ploughed on. Project after project helped prove these crops were viable in different environments as alternatives to the staple ones. But the question of whether these crops would be marketable remained. "That''s the critical thing," he says. In one of the centre''s domes, food technologist Tan Xinlin uses powdered moringa(辣木) leaves in place of some wheat flour to bake a cake lower in gluten(谷胶) and higher in nutrients. Tan''s job is to create recipes with these still-unfamiliar ingredients that will appeal to both local and international tastes. In recent years she has used some of the forgotten crops grown at CFF, such as moringa and bambara groundnut, to make everything from instant soup to Indian snacks. "I try to modernise forgotten crops instead of using old recipes." says Tan, who is also a trained chef. It''s a strategy to appeal to the world''s growing middle classes who are increasingly turning to the fast and processed food industries. It''s also a way to help counter perceptions of local crops as "old or poor people''s food" or as inferior "women''s crops", adds Tan. I) The roots of these connotations about local foods can run deep. The bambara groundnut, a protein-rich native crop of sub-Saharan Africa that is also grown in parts of southeast Asia, can trace its marginalisation to colonial rule. "African women who grew bambara groundnut were actually punished for growing it," says Azam-Ali. "Colonial powers said you can''t grow that because there''s no oil. We can''t get a market for it." But today the bambara murukku is one of CFF''s best reviewed foods and they are aiming to get it into grocery stores, pointing to the success of crops like quinoa to potential investors. Some 30 years ago, quinoa was virtually unheard of outside its native mountains in Bolivia and Peru. Today the nutritious grain is found on the menus of lavish restaurants across the world. J) Measuring crops by nutrition instead of yield is at the heart of the forgotten foods enterprise. Ever since the "green revolution" of the 1960s, high-yielding crops have dominated modern agriculture. That was in part a crucial response to devastating famines at a time when the world needed to increase its food supply. Today "nutrition is becoming a time bomb", says Azam-Ali, as growing carbon dioxide levels strip crops of their minerals. Instead of bio-fortifying major crops we should be investing in those forgotten crops that are already more nutritious, he asserts. K) In the bowels of CFF''s third dome, lab manager Gomathy Sethuraman opens a window into the centre''s "crown jewels", revealing vines of winged beans growing under a bright yellow light. It''s one of multiple chambers where scientists are studying the impact of higher temperatures and carbon dioxide levels on the nutritional make-up of alternative crops. This research is "the game changer", says Azam-Ali, ensuring that "future crops" are also the healthiest ones in warmer climates. L) There is a growing global momentum around forgotten foods, says Danielle Nierenberg, president of Food Tank, a US-based think tank. Other than CFF, which bills itself as the world''s first research centre dedicated solely to under-utilised crops, there are other key groups championing agricultural diversity including Crop Trust, Slow Food, Icrisat and Bioversity International. Add to that more middle-income consumers searching for nutritious foods and others eager to try the unprocessed foods their grandparents once ate, she says. M) But the rising interest in forgotten foods in some quarters is overtaken by the global spread of Western-style diets heavy in sugar, fat and processed foods in others. N) A key obstacle to promoting fading local crops in Malaysia, for example, is "the obsession with imported products", says Jenifer Kuah, co-founder of a restaurant that champions locally-sourced food in an affluent suburb of Kuala Lumpur. Customers at Sitka, regarded as a pioneer in the country''s small farm-to-table dining scene, still seek foreign ingredients as a "status symbol", she says. O) The argument for forgotten foods feels intuitive. Some analysts say it is in fact inevitable. "Climate change is going to mean almost certainly tastes are going to be forced to change," says Tim Lang, professor of food policy at City, University of London. We "have to get used to eating other crops" as yields of staple crops fall, he says.', NULL, NULL, 1210, 'IMPORT', 'cet6-2024-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-1-r2'
);
SET @pg_cet6_2024_12_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-r3', 'CAREFUL_READING', 'CET6', NULL, 'Imagine you''re an alien sent to Earth to document the behaviour of the mammals inhabiting the planet. You stumble into a movie theatre that''s showing the latest Hollywood horror film. Several dozen humans are gathered together in a dark, undecorated room. They''re all staring at a rectangular area on which patterns of light change rapidly. They are clearly in a state of high arousal. Their heart rate is elevated, they occasionally glance around nervously, and they sometimes jump collectively in their seats, and emit high-pitched warning calls. Eventually, the lights come up and the rectangular screen goes black. The humans stand up and leave the room, chatting and laughing, and showing signs of pleasure. Why do these humans voluntarily expose themselves to what appears to be a deeply unpleasant experience? And why do they react so strongly to those patterns of light on a screen? I am fascinated with the paradox of horror—the strange fact that many people seek out scary entertainment. I think the answer to the puzzle lies in human nature. My research suggests that we humans evolved to find pleasure in situations that allow us to experience negative emotions in a safe context. You can see these elements of horror in children''s games. Take hide-and- seek for example, which is a simulation of a predator-prey interaction. The kid hides and the adult pretends to be a predator, searching for the child while howling like a dangerous beast. This simulation gives the child crucial information about how to avoid becoming prey, and children tend to find that kind of activity deeply satisfying, presumably because it gives them a safe experience of a potentially catastrophic scenario. They find it pleasurable, and pleasure is evolution''s way of motivating us toward adaptive behaviour. Horror is pleasurable to many people because it lets us play with negative emotions and develop coping strategies. We learn what it feels like to be truly afraid, and we learn how to handle negative emotion. How, then, does horror work? My research suggests that horror works by exploiting an ancient set of biological defence mechanisms—an evolved fear system, which we share with other animals. But humans are uniquely imaginative, and we use our evolved imagination to travel into virtual worlds that are full of danger. There are good reasons for watching a horror film, even if you''re not a loyal horror fan. If you make it through the film in one piece, you''ll probably experience a strong sense of mastery, a sense that you were able to make it through an appalling experience. Anyway, watching a horror film makes you better at handling your own fear, and who knows when that will become critically relevant?', NULL, NULL, 448, 'IMPORT', 'cet6-2024-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-1-r3'
);
SET @pg_cet6_2024_12_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-r4', 'CAREFUL_READING', 'CET6', NULL, 'An awakening has been taking place in the physical world against the beauty model that has been dictated to us for years. But in the digital arena, social media determines what is considered beautiful. The two opposing struggles are taking place in parallel. In the physical world, the struggle goes against the underlying pressure exerted on women to conform to an unrealistic beauty ideal. As part of the struggle, various media outlets have presented women whose bodies don''t correspond to the so-called ideal. All those women who had previously been excluded from the covers of magazines, television series and the public agenda, have become "legitimate". At the same time, a group of influencers have begun to upload to social media photos of themselves without makeup, and even photos in which they highlight supposed flaws. Technology has reshaped our beauty ideal and is doing a great job communicating that message to the masses. One of the bizarre legacies of the past decade is the popularity of the "cyborg look", which illustrates what Americans will look like in 2050. The cyborg look spread rapidly. Today, however, the Instagram face has become the new beauty ideal. The internalization of accepted beauty norms is much more effective when there is active involvement in the learning process. The active involvement of users is reflected in the gamified(游戏化的) interaction offered by the social media platforms—the ability to like, write a comment, compare, share. Once the desired beauty ideal has been internalized, users are given tools or features to change their appearance to suit the accepted beauty ideal such as editing the image, choosing the ideal filter, the right background. A survey conducted in the United States revealed that more than 50% filter the images before posting them. And you will not be surprised to hear that the majority of them are women. One of the significant consequences of obsessive filtering is the emerging tendency to treat oneself as an object to be observed and valued, in the same way another person observes and judges from the side. The effect of the filters is already far beyond amiable amusement. The filters and the entire game played on the networks affect the mental health of the users. According to a study, apps like Instagram, Snapchat and FaceTune allow users to achieve a level of perfection that was previously only observed in beauty magazines. Even though humanity has always cherished beauty, in the last decade our obsession with looks has reached an unprecedented peak. The time spent on social media creates an urge to achieve an impossible beauty ideal so powerful that the only thing that can fix it is not cosmetic intervention, but mental health care.', NULL, NULL, 448, 'IMPORT', 'cet6-2024-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-1-r4'
);
SET @pg_cet6_2024_12_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-1-r4' LIMIT 1);

-- 翻译 cet6-2024-12-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-translation'
);
SET @q_cet6_2024_12_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_01, '北斗(Beidou)卫星导航系统的成功研制是中国自改革开放以来取得的一项重大科技成就。研发人员经过不懈努力,攻克了一系列技术难题,北斗系统最终实现了全球覆盖和高精度定位,使中国成为世界上少数几个独立拥有全球卫星导航系统的国家之一。北斗系统已广泛应用于交通运输、灾害救援、天气预报、公共安全等诸多领域。北斗系统现在已经在国际上得到广泛认可,开始为越来越多的国家和地区提供优质服务。', NULL, 'The successful development of the Beidou Navigation Satellite System is a major scientific and technological achievement made by China since the reform and opening-up. Through unremitting efforts, the developers overcame a series of technical problems, and the Beidou system has finally achieved global coverage and high-precision positioning, making China one of the few countries in the world that independently possess a global satellite navigation system. The system has been widely applied in many fields such as transportation, disaster relief, weather forecasting and public safety. Today, it has also been widely recognized internationally and has begun to provide high-quality services for an increasing number of countries and regions.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_01
);

-- 听力 Q1 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q01', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q01'
);
SET @q_cet6_2024_12_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_02, NULL, '{"A":"A) Preparing for a job interview.","B":"B) Writing a work report together.","C":"C) Going through a couple of issues the company faces.","D":"D) Discussing the woman''s annual performance review."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_02
);

-- 听力 Q2 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q02', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q02'
);
SET @q_cet6_2024_12_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_03, NULL, '{"A":"A) The overall culture of the company.","B":"B) The instruction from her supervisor.","C":"C) The honesty of the manager.","D":"D) The recognition of her merits."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_03
);

-- 听力 Q3 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q03', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q03'
);
SET @q_cet6_2024_12_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_04, NULL, '{"A":"A) Her inadequate language proficiency.","B":"B) Her inability to interact with colleagues properly.","C":"C) Her inappropriate behavior at company meetings.","D":"D) Her simplistic approach to dealing with others."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_04
);

-- 听力 Q4 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q04', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q04'
);
SET @q_cet6_2024_12_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_05, NULL, '{"A":"A) To avoid offending the recipients.","B":"B) To show her unique writing style.","C":"C) To save time.","D":"D) To be frank."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_05
);

-- 听力 Q5 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q05', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q05'
);
SET @q_cet6_2024_12_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_06, NULL, '{"A":"A) Provide medical service to the community.","B":"B) Make healthcare in her hometown the best.","C":"C) Obtain a doctoral degree in internal medicine.","D":"D) Have a profound impact on people around her."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_06
);

-- 听力 Q6 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q06', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q06'
);
SET @q_cet6_2024_12_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_07, NULL, '{"A":"A) They have constantly urged her to study hard.","B":"B) They have worked hard to finance her education.","C":"C) They have tried to create a positive learning environment.","D":"D) They have pursued the family''s dreams together with her."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_07
);

-- 听力 Q7 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q07', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q07'
);
SET @q_cet6_2024_12_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_08, NULL, '{"A":"A) It is a key medical branch conducive to realizing her dreams.","B":"B) It connects many other specialties with its broad coverage.","C":"C) It has a long history in the man''s prestigious institution.","D":"D) It is a medical branch both of her parents specialize in."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q08', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q08'
);
SET @q_cet6_2024_12_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_09, NULL, '{"A":"A) Problematic.","B":"B) Competitive.","C":"C) Inconsistent.","D":"D) Trustworthy."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_09
);

-- 听力 Q9 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q09', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q09'
);
SET @q_cet6_2024_12_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_10, NULL, '{"A":"A) To prevent hackers from cracking our secret codes.","B":"B) To show that all the guidelines are being followed.","C":"C) To provide evidence that passwords are forgotten.","D":"D) To convince our computer that we are human."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_10
);

-- 听力 Q10 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q10', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q10'
);
SET @q_cet6_2024_12_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_11, NULL, '{"A":"A) Put an end to the hacking phenomenon.","B":"B) Help people remember their passwords.","C":"C) Reduce the intricacy of the password itself.","D":"D) Explain the need for different email accounts."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_11
);

-- 听力 Q11 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q11', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q11'
);
SET @q_cet6_2024_12_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_12, NULL, '{"A":"A) Innovate technologies to ensure the safety of users'' accounts.","B":"B) Provide incentives for the application of creative passwords.","C":"C) Explore the possibility of using simpler secret codes.","D":"D) Take steps to encourage users to log in more often."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_12
);

-- 听力 Q12 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q12', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q12'
);
SET @q_cet6_2024_12_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_13, NULL, '{"A":"A) Her work no longer interested her.","B":"B) Her training app did not fit her.","C":"C) Her fitness fell into a slump.","D":"D) Her business deteriorated."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_13
);

-- 听力 Q13 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q13', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q13'
);
SET @q_cet6_2024_12_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_14, NULL, '{"A":"A) Help users keep track of their fitness levels.","B":"B) Design personalised training programmes.","C":"C) Strengthen ties among users worldwide.","D":"D) Select well-qualified human coaches."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_14
);

-- 听力 Q14 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q14', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q14'
);
SET @q_cet6_2024_12_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_15, NULL, '{"A":"A) They are never repeated.","B":"B) They help enrich her life.","C":"C) They are of no extreme intensity.","D":"D) They keep her focused on her goal."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_15
);

-- 听力 Q15 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q15', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q15'
);
SET @q_cet6_2024_12_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_16, NULL, '{"A":"A) They will not be able to take the place of human personal trainers.","B":"B) They will not be able to comprehend some of the profiles users put in.","C":"C) They cannot lead to optimal results with their mathematical approach.","D":"D) They cannot match humans in arranging meticulous workout schedules."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_16
);

-- 听力 Q16 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q16', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q16'
);
SET @q_cet6_2024_12_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_17, NULL, '{"A":"A) All societies are built upon the cornerstones of basic values.","B":"B) Everyone everywhere demonstrates seven character traits.","C":"C) All societies are kept together by seven basic moral rules.","D":"D) Everyone everywhere shares a universal moral standard."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_17
);

-- 听力 Q17 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q17', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q17'
);
SET @q_cet6_2024_12_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_18, NULL, '{"A":"A) Ascertain whether deferring to authority was confined to right-wing people.","B":"B) Find out whether different societies had different versions of morality.","C":"C) Make clear whether all societies faced the same moral issues.","D":"D) Find out whether left-wing people still had a group loyalty."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_18
);

-- 听力 Q18 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q18', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q18'
);
SET @q_cet6_2024_12_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_19, NULL, '{"A":"A) Make independent descriptions of cultures around the world.","B":"B) Strive to understand the basic differences between peoples.","C":"C) Appreciate the foundational value of the existing data.","D":"D) Carry out systematic field studies to gather new data."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_19
);

-- 听力 Q19 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q19', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q19'
);
SET @q_cet6_2024_12_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_20, NULL, '{"A":"A) They might be the most important part of our eating experience.","B":"B) They can activate our brain functions in a most direct fashion.","C":"C) They can be viewed as the windows to our soul.","D":"D) They could mislead us in more ways than one."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_20
);

-- 听力 Q20 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q20', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q20'
);
SET @q_cet6_2024_12_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_21, NULL, '{"A":"A) It attracts food companies'' growing attention.","B":"B) It adversely impacts one''s eating experience.","C":"C) It invariably determines how food sells.","D":"D) It changes the way people taste food."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_21
);

-- 听力 Q21 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q21', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q21'
);
SET @q_cet6_2024_12_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_22, NULL, '{"A":"A) Enhance the taste.","B":"B) Make predictions.","C":"C) Identify distinct flavors.","D":"D) Enrich the eating experience."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_22
);

-- 听力 Q22 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q22', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q22'
);
SET @q_cet6_2024_12_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_23, NULL, '{"A":"A) Social status.","B":"B) Financial resources.","C":"C) Meaning.","D":"D) Happiness."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_23
);

-- 听力 Q23 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q23', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q23'
);
SET @q_cet6_2024_12_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_24, NULL, '{"A":"A) Their effect on people''s happiness has long been overstated.","B":"B) Their influence on people''s life varies with social contexts.","C":"C) They can affect people''s experience of meaning.","D":"D) They can ensure people''s overall well-being."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_24
);

-- 听力 Q24 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q24', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q24'
);
SET @q_cet6_2024_12_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_25, NULL, '{"A":"A) It used questions totally different from those in their first study.","B":"B) It focused on the sense of meaning of French participants.","C":"C) It analysed cases from a daily poll of US residents.","D":"D) It examined data collected from multiple countries."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_25
);

-- 听力 Q25 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q25', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q25'
);
SET @q_cet6_2024_12_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_26, NULL, '{"A":"A) They might have more access to external sources of happiness.","B":"B) They might focus on an individual sense of satisfaction or meaning.","C":"C) They might be less easily affected by a community''s overall feeling.","D":"D) They might be less adversely impacted by failure to achieve a purpose."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q26'
);
SET @q_cet6_2024_12_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_27, NULL, '{"A":"A) appeal","B":"B) extravagantly","C":"C) intrinsically","D":"D) irony","E":"E) layman","F":"F) literally","G":"G) majestic","H":"H) malicious","I":"I) meadow","J":"J) mingle","K":"K) predator","L":"L) rage","M":"M) scrape","N":"N) shrewd","O":"O) thrifty"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q27'
);
SET @q_cet6_2024_12_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_28, NULL, '{"A":"A) appeal","B":"B) extravagantly","C":"C) intrinsically","D":"D) irony","E":"E) layman","F":"F) literally","G":"G) majestic","H":"H) malicious","I":"I) meadow","J":"J) mingle","K":"K) predator","L":"L) rage","M":"M) scrape","N":"N) shrewd","O":"O) thrifty"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q28'
);
SET @q_cet6_2024_12_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_29, NULL, '{"A":"A) appeal","B":"B) extravagantly","C":"C) intrinsically","D":"D) irony","E":"E) layman","F":"F) literally","G":"G) majestic","H":"H) malicious","I":"I) meadow","J":"J) mingle","K":"K) predator","L":"L) rage","M":"M) scrape","N":"N) shrewd","O":"O) thrifty"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q29'
);
SET @q_cet6_2024_12_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_30, NULL, '{"A":"A) appeal","B":"B) extravagantly","C":"C) intrinsically","D":"D) irony","E":"E) layman","F":"F) literally","G":"G) majestic","H":"H) malicious","I":"I) meadow","J":"J) mingle","K":"K) predator","L":"L) rage","M":"M) scrape","N":"N) shrewd","O":"O) thrifty"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q30'
);
SET @q_cet6_2024_12_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_31, NULL, '{"A":"A) appeal","B":"B) extravagantly","C":"C) intrinsically","D":"D) irony","E":"E) layman","F":"F) literally","G":"G) majestic","H":"H) malicious","I":"I) meadow","J":"J) mingle","K":"K) predator","L":"L) rage","M":"M) scrape","N":"N) shrewd","O":"O) thrifty"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q31'
);
SET @q_cet6_2024_12_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_32, NULL, '{"A":"A) appeal","B":"B) extravagantly","C":"C) intrinsically","D":"D) irony","E":"E) layman","F":"F) literally","G":"G) majestic","H":"H) malicious","I":"I) meadow","J":"J) mingle","K":"K) predator","L":"L) rage","M":"M) scrape","N":"N) shrewd","O":"O) thrifty"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q32'
);
SET @q_cet6_2024_12_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_33, NULL, '{"A":"A) appeal","B":"B) extravagantly","C":"C) intrinsically","D":"D) irony","E":"E) layman","F":"F) literally","G":"G) majestic","H":"H) malicious","I":"I) meadow","J":"J) mingle","K":"K) predator","L":"L) rage","M":"M) scrape","N":"N) shrewd","O":"O) thrifty"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q33'
);
SET @q_cet6_2024_12_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_34, NULL, '{"A":"A) appeal","B":"B) extravagantly","C":"C) intrinsically","D":"D) irony","E":"E) layman","F":"F) literally","G":"G) majestic","H":"H) malicious","I":"I) meadow","J":"J) mingle","K":"K) predator","L":"L) rage","M":"M) scrape","N":"N) shrewd","O":"O) thrifty"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q34'
);
SET @q_cet6_2024_12_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_35, NULL, '{"A":"A) appeal","B":"B) extravagantly","C":"C) intrinsically","D":"D) irony","E":"E) layman","F":"F) literally","G":"G) majestic","H":"H) malicious","I":"I) meadow","J":"J) mingle","K":"K) predator","L":"L) rage","M":"M) scrape","N":"N) shrewd","O":"O) thrifty"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q35'
);
SET @q_cet6_2024_12_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_36, NULL, '{"A":"A) appeal","B":"B) extravagantly","C":"C) intrinsically","D":"D) irony","E":"E) layman","F":"F) literally","G":"G) majestic","H":"H) malicious","I":"I) meadow","J":"J) mingle","K":"K) predator","L":"L) rage","M":"M) scrape","N":"N) shrewd","O":"O) thrifty"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q36'
);
SET @q_cet6_2024_12_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_37, 'According to a senior researcher, we will have secure food supply if we rid ourselves of ignorance about native crops.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q37'
);
SET @q_cet6_2024_12_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_38, 'Most of the world''s food supply comes from a tiny number out of thousands of crops that have been grown for centuries.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q38'
);
SET @q_cet6_2024_12_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_39, 'To provide their family with food when the staple crops failed, some African women farmers grew local crops in their backyards.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q39'
);
SET @q_cet6_2024_12_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_40, 'High-yielding crops have occupied a dominant position in modern agriculture since the green revolution in the last century.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q40'
);
SET @q_cet6_2024_12_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_41, 'Growing alternative crops proved feasible in a variety of environments, but the critical question was whether they would be marketable.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q41'
);
SET @q_cet6_2024_12_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_42, 'According to a professor, when the yields of staple crops fall, we will have to adapt to eating foods from alternative crops.', NULL, 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q42'
);
SET @q_cet6_2024_12_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_43, 'Urgent measures have to be taken to provide food for the projected world population without aggravating the climate.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q43'
);
SET @q_cet6_2024_12_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_44, 'Colonial rule marginalised local crops by punishing Africans who grew them.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q44'
);
SET @q_cet6_2024_12_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_45, 'As existing crops are endangered by global warming, we can increase food security by bringing back the many forgotten food crops.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q45'
);
SET @q_cet6_2024_12_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_46, 'Researchers are trying to find out how higher temperatures and CO₂ levels affect the nutritional composition of alternative crops.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q46'
);
SET @q_cet6_2024_12_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_47, 'The alien finds the audience in the movie theatre clearly in a state of ______.', '{"A":"A) total mindfulness","B":"B) extreme excitement","C":"C) spiritual elevation","D":"D) intense curiosity"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q47'
);
SET @q_cet6_2024_12_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_48, 'Why do many people seek out scary entertainment, according to the author''s research?', '{"A":"A) They gain experience in overcoming horror in real life.","B":"B) They find joy in going through simulated horrible experiences.","C":"C) They have learned from hide-and-seek as kids the thrill involved.","D":"D) They have evolved to gain pleasure in escaping life-threatening situations."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q48'
);
SET @q_cet6_2024_12_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_49, 'What do children learn from hide-and-seek?', '{"A":"A) How to avoid falling prey to an attacker.","B":"B) How to simulate a predator-prey interaction.","C":"C) How to keep themselves from catastrophic errors.","D":"D) How to turn a dangerous scenario into a safe one."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q49'
);
SET @q_cet6_2024_12_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_50, 'Why is horror gratifying to many people?', '{"A":"A) It reminds them of an ancient set of biological defence mechanisms.","B":"B) It triggers their imagination to travel into dangerous virtual worlds.","C":"C) It allows them to learn what fear feels like and how to tackle it.","D":"D) It activates their evolved fear system and their unique fantasy."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q50'
);
SET @q_cet6_2024_12_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_51, 'What will one experience if they watch a horror film through without being hurt?', '{"A":"A) A strong sense of clear relevance.","B":"B) A profound sense of good fortune.","C":"C) A profound sense of intense relief.","D":"D) A strong sense of being in control."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q51'
);
SET @q_cet6_2024_12_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_52, 'What do we learn about beauty in the digital arena?', '{"A":"A) It dictates the taste of digital media.","B":"B) It has been in the making for years.","C":"C) It has ushered in a new awakening.","D":"D) It is defined by social media."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q52'
);
SET @q_cet6_2024_12_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_53, 'What does the passage say about beauty in the physical world?', '{"A":"A) Women are under constant pressure to keep up with beauty models.","B":"B) Women are encouraged to pursue a beauty ideal that has never existed.","C":"C) A fight is going on to remove pressure on women to conform to an absurd beauty ideal.","D":"D) Media outlets have begun to present as beauty models trendy women without any makeup."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q53'
);
SET @q_cet6_2024_12_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_54, 'What do we learn from the passage about the Instagram face?', '{"A":"A) It is now regarded as the new beauty ideal.","B":"B) It is what most women will go after in 2050.","C":"C) It is being much talked about on social media.","D":"D) It is a perfect illustration of the ultimate beauty."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q54'
);
SET @q_cet6_2024_12_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_55, 'What has obsessive filtering resulted in?', '{"A":"A) A good many women striving to reach an impossible level of perfection.","B":"B) An urge to turn the entire game played on the network to one''s advantage.","C":"C) A tendency to regard one''s body as an object of observation and judgment.","D":"D) An increasing number of women filtering their images before uploading them."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-1-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q55'
);
SET @q_cet6_2024_12_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_1_56, 'What does the author want to emphasize at the end of the passage regarding Americans'' obsession with looks?', '{"A":"A) Cosmetic surgery should be made more accessible to the masses.","B":"B) Psychological intervention should be introduced to alleviate it.","C":"C) Their time spent on social media should be strictly controlled.","D":"D) Its root cause should be meticulously examined and analyzed."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_1_56
);

-- ==================== cet6-2024-12-2 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-r1', 'BANKED_CLOZE', 'CET6', NULL, 'Ever been talking about something important with someone you care about and found the discussion frustrating instead of fruitful? Negative energy can then cast a __26__ over your efforts to build a shared understanding. In fact collaborative problem-solving conversations require skills. Strong listening skills are essential. Sprinkling in positivity via appreciation, __27__ smiles, and warm comments helps. So does the essential ability to keep your emotional tone in the calm zone. If the tone of a dialogue heats up and anger erupts, the dialogue __28__ from collaborative to adversarial, and progress is likely to come to an immediate __29__ . In addition, effective dialogue generally has another important characteristic: symmetry. Symmetry in dialogue refers to the balance of how much each partner talks. Are you each getting equal airtime? When one participant does most of the talking, this asymmetry or lack of balance tends to become annoying to one or both of you. The silent partner __30__ tires of only listening, while the talker can feel __31__ . Usually, both would prefer more equal give and take. Different rates of speech and levels of voice volume can __32__ symmetry as well. The faster or louder partner can easily begin taking up more airtime. The slower-talking or softer-voiced one can have trouble getting the floor. Conversations also lose balance when one partner''s opinions count more than the other''s. One person''s input may carry more sway because their style of expression is more __33__ . One viewpoint may tend to get lost because it is expressed more __34__ . If either partner fairly consistently __35__ or evaporates, modifying the pattern will be helpful. The dialogue will feel more productive, and at the same time, the relationship overall is likely to feel more positive.', NULL, '["A) affectionate","B) approximately","C) elapses","D) erode","E) flattered","F) flips","G) halt","H) overburdened","I) predominates","J) propagate","K) scenario","L) shadow","M) tentatively","N) typically","O) vigorous"]', 291, 'IMPORT', 'cet6-2024-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-2-r1'
);
SET @pg_cet6_2024_12_2_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-2-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-r2', 'MATCHING', 'CET6', 'What Is a Super Blood Wolf Moon?', 'A) Blue moons, rose moons, supermoons. For some reason all the websites seem to think you really want to know all about these moons. "Catch This Weekend''s AMAZING SUPERMOON," one headline will announce. "The Supermoon Isn''t Actually A Big Deal And You''re All Ruining Astronomy," another will complain. B) The latest example is the super blood wolf moon eclipse which sounds like the name of an emotional song I would have performed a modern dance routine to in 9th grade, but is, in fact, an astronomical event set to occur on January 20. As we''ll explain below, there is nothing truly mysterious or otherwise special about this moon, and it will not look like a bloody wolf head in the sky or anything wild like that. We get these super lunar events by smashing together all the qualifiers we''ve historically used to keep track of full moons throughout the year, and in the age of the internet we can get a little too enthusiastic. C) Consider this your go-to resource for all moon-gazing news. Here''s what you need to know about the latest lunar event. D) Look, it''s okay if you don''t know. There are probably loads of folks who walk around pretending they totally know why that thing in the sky seems to get bigger and smaller at regular intervals but who totally do not. E) The moon orbits Earth, and it''s tidally locked—that means it always shows us the same face, instead of spinning around like our planet does. That''s why you can always see the man on the moon (or the moon rabbit, depending on your cultural preferences) even as it spins around us. But while the moon is big and bright in the sky when it''s full, that''s only because it''s reflecting light from the sun. But the moon is always moving, so it''s getting hit with sunlight at different angles. It''s invisible to us during the new moon, because our satellite is parked right between us and the sun; the so-called dark side of the moon is lit up like Las Vegas, but the side we can see is in shadow. A full moon happens when the earth is right between the sun and the moon, so sunlight hits the part we can see. And all the other phases are just the transition from one of those extremes to the other. F) The moon isn''t always exactly the same distance from Earth, because its orbit isn''t perfectly circular. We call the closest point perigee(近地点), and the most distant point is apogee(远地点). 2018''s closest perigee and most distant apogee both happened in January, and the difference was about 30,000 miles. G) The reason you care about this ordinary change in distance is that it turns a moon super. When a full moon happens close to perigee, it''s going to look a bit bigger. Honestly, the difference is not that profound, but if you''re in a position to photograph the supermoon next to something that shows the slight increase in scale, it can look pretty cool. January''s super blood wolf moon eclipse is super because the date lines up with the closest the moon will get to us during January, but the moon won''t actually be at its closest for the year until February''s supermoon, which you can expect plenty of undue excitement over. H) Blood moons only occur during total lunar eclipses (which can happen a few times a year in any given location). When the moon slips through our shadow, we give it a reddish coloring. The moon can also look orange whenever it''s rising or setting, or if it hangs low in the horizon all night—the light bouncing off of it has to travel through a thicker atmosphere there, which scatters more blue light away. But you''ll probably only see that deep, sinister red during an eclipse. I) A lot of headlines about moons are just ridiculous (you do not need to be particularly excited about a blue moon, it just looks like a regular full moon), but you should definitely roll out of bed to look at a blood moon if one is going to be visible in your region, even though they''re just lunar eclipses and not evidence of bloody battles between the sky gods. J) In March of 2018, we had our second "blue moon" of the year, to much acclaim. And while that''s not necessarily special in an oh-gosh-get-out-and-look-at-it way, it''s certainly special: a blue moon is a nickname for when two full moons fall in the same calendar month, and we hadn''t previously had two in one year since 1999. We won''t have it happen again until 2037. Astronomer David Chapman explained that this is merely a peculiarity of our calendar; once we stopped doing things based on the moon and started trying to follow the sun and the seasons, we stopped having one reliable full moon per month. The moon cycle is 29.53 days long on average, so in most months we still end up with a single new moon and a single full one. But every once in a while, one month steals a full moon from another. In 2018 (and in 1999, and again in 2037) both January and March stacked full moons on the first and last nights of the month, leaving February in the dark. K) Getting two blue moons a year is rare, but we have individual blue moons every few years. Also, fun fact: not actually blue. A moon can indeed take on a moody blue color, but this only happens when particles of just the right size disperse through the sky—and it has nothing to do with the moon''s status as "blue". Big clouds of ash from volcanic eruptions or fires can do the trick, but it doesn''t happen often, and the stars would certainly have to align for two such rare instances to occur at once. L) You may have heard that the super special second blue moon of 2018 was also a Paschal moon. This is true! That just means it was the first full moon of spring, which is often used to determine the date of Easter Sunday. All of this is just calendar nonsense and we refuse to go into it further. M) Sometimes you''ll see a headline that promises a moon with so many qualifiers it makes your head spin. A super blue blood worm moon, perhaps? Or a super blood wolf moon? Lots of websites will tell you that "wolf moon" is the traditional name of the first full moon of the year in "Native American" cultures, which is kind of a weird thing to claim given that there are 573 registered Tribal Nations in the US alone today, not to mention historically. The idea that hungry, howling wolves were such a universal constant in January that all of North America with its different cultures, geographies, and languages spontaneously came up with the same nickname is illogical. N) Many cultures have traditional names for the full moon in a given month or season, so there''s quite a list to draw from if you''re trying to really juice up a story on a slightly-bigger-than-average view of the moon. But these are all based on human calendars and activities and folklore; you will not go outside and see a pink moon in April, though I wish it were so.', NULL, NULL, 1232, 'IMPORT', 'cet6-2024-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-2-r2'
);
SET @pg_cet6_2024_12_2_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-2-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-r3', 'CAREFUL_READING', 'CET6', NULL, 'With population increases and global urbanisation ever accelerating, much attention is focused on the sustainability of our cities and scarce attention is paid to the countryside. Rural life is associated with closely-knit communities, sense of belonging, and a simple, tranquil life. Yet whilst some or all of these elements exist in the countryside, so do conservatism and a lack of employment opportunities. And it is mostly due to the latter that rural communities are suffering. Attracted by the improved economics of urban areas, country-dwellers across the world are moving out, contributing to the excessive crowdedness of densely populated cities, and leaving the countryside in desolation. So how can the countryside ensure its survival among these changes; or should it at all? Due to both the distance between residences and facilities and often intermittent public transport, those living in the countryside are heavier automobile users. Rural dwellers also use more energy maintaining their mostly detached buildings. We may be piled up like boxes in the city, but this brings energy efficiency that the countryside cannot match. Rural energy requirements result in higher carbon emissions per person than in the city, so it is actually irresponsible to endorse such a lifestyle choice. Protecting the countryside is a hot topic. Those who have made their fortunes in the city often buy second homes in the countryside, visiting intermittently for a sample of a supposedly simple life. The side-effect of this is that house prices are pushed up due to increased demand, leaving them unaffordable for local people. A solution has yet to be found for this challenge, for market forces are further forcing residents out of the countryside. For those who believe in rural preservation, this is deplorable. Whilst an idealised view of the countryside is common, the reality is that rural life has continuously evolved. Industrialisation brought an increase in divisions of labour, changing social links between rural people. The internet has introduced once foreign cultures into the countryside. Improved travel connections and affordability have made the world more accessible, creating a "global village". Considering these changes, surely an evolving countryside is inevitable. Perhaps the countryside should also prepare itself for massive population increases in the future. With cities across the world growing rapidly, how will the current urban generation respond to the inevitable social changes of mass urbanisation? Will the longing for a simpler life become stronger, fueling a rural renaissance? As the world continues to urbanise, the voices calling for rural preservation may well grow louder. But change is inevitable. We know that the world is going to see new cities emerging from the dust and current cities growing into megacities, but the future of the countryside is less clear.', NULL, NULL, 450, 'IMPORT', 'cet6-2024-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-2-r3'
);
SET @pg_cet6_2024_12_2_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-2-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-r4', 'CAREFUL_READING', 'CET6', NULL, 'Statements, like "beauty is in the eye of the beholder(观看者)", are rarely questioned. They''ve become so embedded in our consciousness that people think it''s absurd to think otherwise. It might be useful, however, to at least push back on this assumption because people evaluate environment, situations, and people aesthetically. We may find that we still believe it is correct, but we may also find that there is a lot more to the situation than you suppose. A recent study exploring aesthetic taste was published in Cognition. The results from this study show that people agree very much in their aesthetic evaluation of natural objects, but they disagree more about artifacts, or human-made objects. The study found that shared taste was most common for faces and natural landscapes, but least common among works of architecture and art. The hypothesis is the commonly pleasing features, like proportion or symmetry, are at work. Preferences for natural scenes might be learned through life experiences. Factors like habitability, safety, and openness might be preferred as people develop. Some of the details of landscapes change, but the basics are more common, e.g., water, open spaces, and signs of care. Art and architecture, unlike natural spaces, do not have the same level of exposure. So, people do not have the same level of shared taste. It''s possible that the lower amount of agreement in the shared taste of artifacts has to do more with elements of style, rather than "behavioral consequences". All of the consequences seem reasonable (or at least possible), but I think there might be an interesting philosophical conclusion that they did not draw. It seems that there is an objective ground to our aesthetic preferences or evaluations. I am not saying this would mean beauty is completely objective, just that there could possibly be general objective principles at work, i.e., beauty is not simply in the eye of the beholder. Nature exhibits some of the universal aesthetic features, such as radiance, in a common way throughout the world. It''s not exactly the same everywhere, but it is common. For example, a sunset is similar enough in different places to warrant almost universal appeal. Possible universal principles of beauty—such as proportion, fittingness, radiance, and others—are general categories, which allow for a wide array of embodiments. When people get involved in making artifacts in architecture or art, they apply these very general concepts in unique ways. But the way they applied the principle may not have universal appeal. This is why it''s important to experience diverse cultures and their artifacts because it opens us up to different ways of approaching or constructing beauty. And it is always good to question our assumptions.', NULL, NULL, 446, 'IMPORT', 'cet6-2024-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-2-r4'
);
SET @pg_cet6_2024_12_2_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-2-r4' LIMIT 1);

-- 翻译 cet6-2024-12-2
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-translation'
);
SET @q_cet6_2024_12_2_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_01, '洋山港(Yangshan Port)是上海航运中心的重要组成部分,是中国第一个深水港,也是世界上规模最大的深水港之一。经过近20年的发展,洋山港已实现高度自动化。数字技术和人工智能的使用大大减少了用工成本和碳排放。自主研发的码头管理系统可以在百公里之外对大型设备进行远程操控。洋山港看上去一片繁忙,现场却见不到人工操作,而且能够24小时不间断运作。洋山港将不断发展,为把上海建成一个全球航运中心做出更大贡献。', NULL, 'Yangshan Port is an important part of the Shanghai shipping center, China''s first deep-water port, and one of the largest deep-water ports in the world. After nearly two decades of development, it has achieved a high level of automation. The use of digital technology and artificial intelligence has greatly reduced labor costs and carbon emissions. The self-developed terminal management system can remotely control large equipment from hundreds of kilometers away. The port looks busy, but no manual operation can be seen on site, and it can operate around the clock without interruption. Yangshan Port will continue to develop and make greater contributions to building Shanghai into a global shipping center.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_01
);

-- 听力 Q1 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q01', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q01'
);
SET @q_cet6_2024_12_2_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_02, NULL, '{"A":"A) Changing his major.","B":"B) His family situation.","C":"C) Revising his graduation thesis.","D":"D) His passion for Art History."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_02
);

-- 听力 Q2 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q02', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q02'
);
SET @q_cet6_2024_12_2_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_03, NULL, '{"A":"A) He doesn''t think it legitimate to depend on his father.","B":"B) He thinks his financial situation has now changed.","C":"C) He doesn''t think it will provide him with a living.","D":"D) He thinks it nourishes the financially secure only."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_03
);

-- 听力 Q3 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q03', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q03'
);
SET @q_cet6_2024_12_2_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_04, NULL, '{"A":"A) Try his best to socialize and build a network in the art industry.","B":"B) Seek financially viable employment opportunities after graduation.","C":"C) Investigate all possible ways to become a celebrity in the art world.","D":"D) Strike a balance between intellectual pursuits and financial security."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_04
);

-- 听力 Q4 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q04', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q04'
);
SET @q_cet6_2024_12_2_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_05, NULL, '{"A":"A) Money.","B":"B) Time.","C":"C) Determination.","D":"D) Optimism."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_05
);

-- 听力 Q5 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q05', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q05'
);
SET @q_cet6_2024_12_2_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_06, NULL, '{"A":"A) Their decision on investigating beef consumption.","B":"B) Their original ideas about the domestic market.","C":"C) Their different approaches to a case study.","D":"D) Their end-of-semester business projects."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_06
);

-- 听力 Q6 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q06', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q06'
);
SET @q_cet6_2024_12_2_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_07, NULL, '{"A":"A) Expanding farmland out west.","B":"B) Importing most of the beef.","C":"C) Raising cattle domestically.","D":"D) Continuing to boost economic growth."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_07
);

-- 听力 Q7 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q07', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q07'
);
SET @q_cet6_2024_12_2_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_08, NULL, '{"A":"A) Technical equipment.","B":"B) Business consultancy.","C":"C) Beef.","D":"D) Carwashing."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q08', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q08'
);
SET @q_cet6_2024_12_2_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_09, NULL, '{"A":"A) Car owners of all walks of life.","B":"B) High-end customers in big cities.","C":"C) Consumers craving for professional service.","D":"D) Well-off dealers seeking a profitable markup."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_09
);

-- 听力 Q9 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q09', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q09'
);
SET @q_cet6_2024_12_2_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_10, NULL, '{"A":"A) Parents'' talking with them during TV time raises their curiosity levels.","B":"B) Their daily television exposure cuts parent-child conversation time.","C":"C) The more TV they watch the poorer their progress in development.","D":"D) Their socioeconomic levels impact their academic achievement."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_10
);

-- 听力 Q10 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q10', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q10'
);
SET @q_cet6_2024_12_2_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_11, NULL, '{"A":"A) Kids'' enhanced learning.","B":"B) Kids'' curiosity levels.","C":"C) Kids'' reading and math.","D":"D) Kids'' behavioral development."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_11
);

-- 听力 Q11 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q11', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q11'
);
SET @q_cet6_2024_12_2_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_12, NULL, '{"A":"A) It can hinder kids from getting on with their peers.","B":"B) It can cut into kids'' time on exploratory activities.","C":"C) It can arouse kids'' interest in how people interact in real life.","D":"D) It can widen the gap between kids from different economic statuses."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_12
);

-- 听力 Q12 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q12', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q12'
);
SET @q_cet6_2024_12_2_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_13, NULL, '{"A":"A) Exerting ourselves too hard in order to attain our life''s goals.","B":"B) Being possessed with a single thought of professional success.","C":"C) Trying every means to beat others in terms of personal aspirations.","D":"D) Being mindlessly driven to possess more and more material things."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_13
);

-- 听力 Q13 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q13', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q13'
);
SET @q_cet6_2024_12_2_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_14, NULL, '{"A":"A) We might isolate ourselves from our fellow beings.","B":"B) We might acquire an incorrect sense of well-being.","C":"C) We might end up pursuing all the wrong things.","D":"D) We might make a mess of our personal lives."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_14
);

-- 听力 Q14 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q14', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q14'
);
SET @q_cet6_2024_12_2_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_15, NULL, '{"A":"A) They should be based on solid theoretical concepts.","B":"B) They should take personal interests into account.","C":"C) They should include goals to help other people.","D":"D) They should increase our sense of worthiness."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_15
);

-- 听力 Q15 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q15', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q15'
);
SET @q_cet6_2024_12_2_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_16, NULL, '{"A":"A) Drifting through life aimlessly.","B":"B) Giving up the chance to fulfill yourself.","C":"C) Abandoning all that life has to offer.","D":"D) Spoiling your character and integrity."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_16
);

-- 听力 Q16 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q16', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q16'
);
SET @q_cet6_2024_12_2_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_17, NULL, '{"A":"A) Grade-raising ways and means.","B":"B) Pressure-alleviating exercise.","C":"C) Revision-conducting approaches.","D":"D) Brain-boosting food and drink."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_17
);

-- 听力 Q17 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q17', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q17'
);
SET @q_cet6_2024_12_2_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_18, NULL, '{"A":"A) Buying it from coffee shops.","B":"B) Building up a tolerance of it.","C":"C) Drinking it after 2 pm.","D":"D) Consuming it with sugar."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_18
);

-- 听力 Q18 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q18', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q18'
);
SET @q_cet6_2024_12_2_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_19, NULL, '{"A":"A) By taking varied vitamin supplements.","B":"B) By consuming a rich variety of foods.","C":"C) By eating both oranges and frozen berries.","D":"D) By getting components packaged in tablets."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_19
);

-- 听力 Q19 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q19', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q19'
);
SET @q_cet6_2024_12_2_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_20, NULL, '{"A":"A) Many people across advanced economies think the world is going from bad to worse.","B":"B) The news focuses on reporting catastrophes that occur across the world.","C":"C) A significant part of the world is experiencing another great recession.","D":"D) Many people have no idea of those living under miserable conditions."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_20
);

-- 听力 Q20 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q20', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q20'
);
SET @q_cet6_2024_12_2_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_21, NULL, '{"A":"A) It has experienced ups and downs like any other historical trend.","B":"B) It is hailed as a miracle by both economists and ordinary people.","C":"C) It is the only way for all countries to share economic prosperity.","D":"D) It has given more and more countries a rare chance to thrive."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_21
);

-- 听力 Q21 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q21', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q21'
);
SET @q_cet6_2024_12_2_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_22, NULL, '{"A":"A) Their fortunes may take a downturn.","B":"B) They can be classified as middle class.","C":"C) Their living standards have been deteriorating.","D":"D) They are experiencing a radical transformation."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_22
);

-- 听力 Q22 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q22', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q22'
);
SET @q_cet6_2024_12_2_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_23, NULL, '{"A":"A) Why smells can activate emotional memories.","B":"B) How powerful the sense of smell can become.","C":"C) How scent particles revive memories forgotten.","D":"D) Why the scent of bread has a strong mental impact."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_23
);

-- 听力 Q23 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q23', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q23'
);
SET @q_cet6_2024_12_2_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_24, NULL, '{"A":"A) The brain cells'' processing of memories experienced as strongly emotional.","B":"B) The activation of the brain''s emotion processing area by chemical particles.","C":"C) The interaction between chemical particles and the brain cells responsible for smell.","D":"D) The sensations of scents going directly to the brain''s emotional and memory centers."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_24
);

-- 听力 Q24 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q24', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q24'
);
SET @q_cet6_2024_12_2_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_25, NULL, '{"A":"A) Imagination.","B":"B) Association.","C":"C) Experience.","D":"D) Context."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_25
);

-- 听力 Q25 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q25', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q25'
);
SET @q_cet6_2024_12_2_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_26, NULL, '{"A":"A) Inaccuracy and alterability.","B":"B) Susceptibility to polar interpretations.","C":"C) Being personal and individualistic.","D":"D) Being dependent on relevant scenarios."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q26'
);
SET @q_cet6_2024_12_2_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_27, NULL, '{"A":"A) affectionate","B":"B) approximately","C":"C) elapses","D":"D) erode","E":"E) flattered","F":"F) flips","G":"G) halt","H":"H) overburdened","I":"I) predominates","J":"J) propagate","K":"K) scenario","L":"L) shadow","M":"M) tentatively","N":"N) typically","O":"O) vigorous"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q27'
);
SET @q_cet6_2024_12_2_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_28, NULL, '{"A":"A) affectionate","B":"B) approximately","C":"C) elapses","D":"D) erode","E":"E) flattered","F":"F) flips","G":"G) halt","H":"H) overburdened","I":"I) predominates","J":"J) propagate","K":"K) scenario","L":"L) shadow","M":"M) tentatively","N":"N) typically","O":"O) vigorous"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q28'
);
SET @q_cet6_2024_12_2_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_29, NULL, '{"A":"A) affectionate","B":"B) approximately","C":"C) elapses","D":"D) erode","E":"E) flattered","F":"F) flips","G":"G) halt","H":"H) overburdened","I":"I) predominates","J":"J) propagate","K":"K) scenario","L":"L) shadow","M":"M) tentatively","N":"N) typically","O":"O) vigorous"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q29'
);
SET @q_cet6_2024_12_2_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_30, NULL, '{"A":"A) affectionate","B":"B) approximately","C":"C) elapses","D":"D) erode","E":"E) flattered","F":"F) flips","G":"G) halt","H":"H) overburdened","I":"I) predominates","J":"J) propagate","K":"K) scenario","L":"L) shadow","M":"M) tentatively","N":"N) typically","O":"O) vigorous"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q30'
);
SET @q_cet6_2024_12_2_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_31, NULL, '{"A":"A) affectionate","B":"B) approximately","C":"C) elapses","D":"D) erode","E":"E) flattered","F":"F) flips","G":"G) halt","H":"H) overburdened","I":"I) predominates","J":"J) propagate","K":"K) scenario","L":"L) shadow","M":"M) tentatively","N":"N) typically","O":"O) vigorous"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q31'
);
SET @q_cet6_2024_12_2_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_32, NULL, '{"A":"A) affectionate","B":"B) approximately","C":"C) elapses","D":"D) erode","E":"E) flattered","F":"F) flips","G":"G) halt","H":"H) overburdened","I":"I) predominates","J":"J) propagate","K":"K) scenario","L":"L) shadow","M":"M) tentatively","N":"N) typically","O":"O) vigorous"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q32'
);
SET @q_cet6_2024_12_2_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_33, NULL, '{"A":"A) affectionate","B":"B) approximately","C":"C) elapses","D":"D) erode","E":"E) flattered","F":"F) flips","G":"G) halt","H":"H) overburdened","I":"I) predominates","J":"J) propagate","K":"K) scenario","L":"L) shadow","M":"M) tentatively","N":"N) typically","O":"O) vigorous"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q33'
);
SET @q_cet6_2024_12_2_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_34, NULL, '{"A":"A) affectionate","B":"B) approximately","C":"C) elapses","D":"D) erode","E":"E) flattered","F":"F) flips","G":"G) halt","H":"H) overburdened","I":"I) predominates","J":"J) propagate","K":"K) scenario","L":"L) shadow","M":"M) tentatively","N":"N) typically","O":"O) vigorous"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q34'
);
SET @q_cet6_2024_12_2_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_35, NULL, '{"A":"A) affectionate","B":"B) approximately","C":"C) elapses","D":"D) erode","E":"E) flattered","F":"F) flips","G":"G) halt","H":"H) overburdened","I":"I) predominates","J":"J) propagate","K":"K) scenario","L":"L) shadow","M":"M) tentatively","N":"N) typically","O":"O) vigorous"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q35'
);
SET @q_cet6_2024_12_2_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_36, NULL, '{"A":"A) affectionate","B":"B) approximately","C":"C) elapses","D":"D) erode","E":"E) flattered","F":"F) flips","G":"G) halt","H":"H) overburdened","I":"I) predominates","J":"J) propagate","K":"K) scenario","L":"L) shadow","M":"M) tentatively","N":"N) typically","O":"O) vigorous"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q36'
);
SET @q_cet6_2024_12_2_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_37, 'We cannot see the moon at times when it is positioned right between the earth and the sun.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q37'
);
SET @q_cet6_2024_12_2_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_38, 'Volcanic eruptions may cause the moon to assume a moody blue color.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q38'
);
SET @q_cet6_2024_12_2_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_39, 'The moon will be closest to the earth when the supermoon occurs in February.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q39'
);
SET @q_cet6_2024_12_2_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_40, 'There is nothing unusual about the super blood wolf moon, which will bear no resemblance to a bloody wolf head.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q40'
);
SET @q_cet6_2024_12_2_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_41, 'The moon will appear orange when the light reflecting from it travels through an atmosphere thicker than usual.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q41'
);
SET @q_cet6_2024_12_2_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_42, 'It is contrary to logic to claim the name of wolf moon originates from the cultures of American Indians.', NULL, 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q42'
);
SET @q_cet6_2024_12_2_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_43, 'As the moon''s orbit is not a hundred-percent circle, its distance from the earth changes.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q43'
);
SET @q_cet6_2024_12_2_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_44, 'A full moon in a given month or season gets a specific name in different cultures.', NULL, 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q44'
);
SET @q_cet6_2024_12_2_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_45, 'There are likely lots of people who know absolutely nothing about why the moon appears to change its size regularly but act like they know.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q45'
);
SET @q_cet6_2024_12_2_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_46, 'When a full moon appears twice in the same month, it is nicknamed a blue moon.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q46'
);
SET @q_cet6_2024_12_2_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_47, 'What has become of the rural areas nowadays?', '{"A":"A) They are becoming somewhat deserted.","B":"B) They are being increasingly urbanised.","C":"C) They are closely-knit communities.","D":"D) They are haunted by conservatism."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q47'
);
SET @q_cet6_2024_12_2_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_48, 'What does the author think of the rural lifestyle?', '{"A":"A) It is unlikely to survive given the on-going changes.","B":"B) It is less energy-efficient compared to that in cities.","C":"C) It is highly dependent upon heavy automobiles.","D":"D) It is a choice more affluent people will endorse."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q48'
);
SET @q_cet6_2024_12_2_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_49, 'What does the author think of rich urban residents buying a second home in the countryside?', '{"A":"A) It is bound to mar the traditional rural life.","B":"B) It adversely impacts rural social stability.","C":"C) It hinders rural economies'' revitalisation.","D":"D) It is detrimental to rural preservation."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q49'
);
SET @q_cet6_2024_12_2_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_50, 'What do we learn about the countryside with industrialisation and technological advances?', '{"A":"A) It is destined to change gradually.","B":"B) It will present an idealised way of life.","C":"C) It is likely to embrace foreign cultures.","D":"D) It will become increasingly diversified."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q50'
);
SET @q_cet6_2024_12_2_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_51, 'What does the author think of the future of the countryside compared with cities?', '{"A":"A) It is going to be harder for the locals.","B":"B) It is going to resemble that of cities.","C":"C) It is less likely to stay static.","D":"D) It is less easy to envisage."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q51'
);
SET @q_cet6_2024_12_2_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_52, 'What does the passage say about the statement "beauty is in the eye of the beholder"?', '{"A":"A) It has hardly ever been disputed.","B":"B) It can be interpreted aesthetically.","C":"C) Many people have found it absurd.","D":"D) People have long been misled by it."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q52'
);
SET @q_cet6_2024_12_2_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_53, 'What does a recent study exploring aesthetic taste show?', '{"A":"A) Aesthetic tastes tend to differ from person to person.","B":"B) Natural beauty is rarely surpassed by artificial beauty.","C":"C) There is less consensus on objects shaped by human craft.","D":"D) There is general agreement on what is pleasing to the eye."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q53'
);
SET @q_cet6_2024_12_2_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_54, 'Why do people differ in their aesthetic appraisal of artifacts?', '{"A":"A) They come out in a great variety of designs.","B":"B) They lead to varying behavioral consequences.","C":"C) They take up much less natural space than landscapes.","D":"D) They come into people''s view less often than natural spaces."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q54'
);
SET @q_cet6_2024_12_2_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_55, 'What does the example of sunset tell about nature?', '{"A":"A) It creates a powerful appeal through its brilliant radiance.","B":"B) It displays aesthetic traits in a similar way the world over.","C":"C) It embodies beauty with a wide array of aesthetic features.","D":"D) It establishes the principles of beauty in a number of ways."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-2-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q55'
);
SET @q_cet6_2024_12_2_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-2-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_2_56, 'Why do artifacts not always hold universal appeal?', '{"A":"A) The appreciation of their beauty is not subject to objective standards.","B":"B) The universal principle of beauty prevents a wide array of embodiments.","C":"C) The way their creators apply the principle of beauty may not be pleasing to everybody.","D":"D) Their creators interpret the universal principle of beauty each in their preferred way."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_2_56
);

-- ==================== cet6-2024-12-3 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-r1', 'BANKED_CLOZE', 'CET6', NULL, 'About 23% of the global population lives in absolute poverty. In developing countries there is a low life expectancy, a high infant __26__ rate, high levels of unemployment and illiteracy, nutritional levels below acceptable standards and widespread disease with very little or poor quality medical assistance. Others live __27__ wealthy and luxurious lives and so the wealth is distributed in a very __28__ manner. These are the central problems to questions of charity though charity also includes many other areas such as assisting the elderly. We all __29__ when very rich people pledge to give away most of their billions, but they are usually left with millions to pass on, still much more than most people would expect to earn in their lifetime. Even comparatively __30__ salaries in the west are very high when compared globally. Someone on £ 20,000 could easily afford to give away £ 2,000 per year and still have plenty to live on plus some luxuries. Most people agree that giving to charity is morally __31__ but charitable behaviour tends to be regarded as above and beyond the call of duty. Some argue, however, that charitable behaviour is morally required. This means that to fail to behave charitably would be wrong. The majority of arguments in this vein refer to giving aid to poorer nations but they may also refer to giving time within one''s __32__ community. Arguments tend to place different requirements on people in different income brackets and __33__ entirely people who are merely making ends meet. Some argue that people should all contribute a certain percentage of their earnings. I will __34__ together all those arguments that place a moral requirement on people to give to charity, despite the fact that there is wide disagreement as to the __35__ of that moral requirement.', NULL, '["A) applaud","B) casualty","C) exclude","D) extent","E) group","F) hierarchical","G) immediate","H) incredibly","I) moderate","J) mortality","K) overt","L) praiseworthy","M) probe","N) sceptically","O) unequal"]', 300, 'IMPORT', 'cet6-2024-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-3-r1'
);
SET @pg_cet6_2024_12_3_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-3-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-r2', 'MATCHING', 'CET6', 'The Free-Trade Paradox', 'A) Trade is one of the policy areas where the hostility that exists between populists(民粹主义者) and classical liberals is most visible. Free-traders point to the undeniable good that tariff-free trade has done for consumers across the world and to the observable alleviation of poverty in corners of the world where previously closed markets have been opened up. Protectionists point to the domestic producers who''ve paid the price for this globalized economy in the form of lost livelihoods and hollowed-out communities. B) The ongoing conservative civil war often degenerates into content-free tribal warfare, but trade is a rare exception. There are substantial, thought-out policy proposals on both sides of the argument. C) Consequently, trade as a topic of discussion provides an opportunity for liberals and populists to have a real meeting of minds. Fruitful debates might actually take place in this area, as opposed to the familiar ritual we''ve become accustomed to of condemnation met with counter-condemnation. D) Strange as it might sound, the problem with trade in the modern world isn''t a matter of dollars and cents. It''s a matter of false consciousness. This observation is bound to set Marxist alarm bells ringing in the minds of some readers, but it was first made by Alexis de Tocqueville in 1840. E) Tracking the economic development of mankind from primitive to modern societies, Tocqueville observed a paradox unfolding over the centuries as economic realities and human experience of those realities strayed further and further from each other. In primitive societies, he notes, the division of labor was as yet undeveloped for the most part, requiring each person, family, or tribe to be relatively independent when it came to meeting their own basic material needs. Men built their own dwellings, farmed their own land, tended to their own livestock. This is not to deny that basic forms of trade took place, but, for the most part, our primitive ancestors lived fairly self-reliant, if crushingly poor, lives. F) However, the exclusively local and face-to-face nature of economic and political organization in the ancient and prehistoric worlds constantly impressed upon these primitive peoples the uncontrollable reality of others and their needs. As Tocqueville notes, "as soon as a man begins to deal with common affairs in public, he begins to perceive that he is not so independent of his fellow men as he had first imagined, and that in order to obtain their support he must often lend them his cooperation." G) At the advent of the modern world, the division of labor spread further and further throughout society. Each person became more and more dependent on others for their basic needs. And yet, robbed of the engagement with our neighbors and with our local communities that our ancestors were forced into by circumstance, we feel ourselves to be more and more independent of one another. As we become more and more dependent on others, we become less and less conscious of our dependence on others. This is the paradox of trade in the modern world. H) The false consciousness that this paradox generates causes havoc on the debates we have about free trade. There is scarcely a single commodity in any American household that isn''t dependent for its manufacture and sale, through one supply chain or another, on scores of different people spread out across the entire globe. But as Tocqueville already foresaw in 1840, we do not feel dependent on these strangers for our way of life. No sense of the dependence of our own material welfare on their work ever strikes our national consciousness. We rarely contemplate the globalized avenues of free trade with gratitude. I) There are two reasons for this. The first, to put it bluntly, is money. Money allows us to purchase the work of others without giving any thought to them as human beings. Unlike our ancestors in their primitive townships, we rarely have to meet face-to-face the people who''ve invented, built, shipped, or supplied our goods. No relationship has to be built before an exchange can take place. Simply agree on a price, and you can have any goods you wish without taking a second thought for the human being involved on the other side of the transaction. In this way, money makes us feel more independent than we actually are. Each of us senses the hold that it has over our fellows. We know that if we bid highly enough we can buy ourselves out of the time-consuming labor of building relationships. Money is kind of like magic in that way. It gives us a set of rituals to perform and promises that if we do so we''ll be able to wield power over others. The illusion is created that having enough money to buy something is the equivalent of knowing how to make it yourself. Gratitude for the anonymous men and women who make up the supply chain rarely makes its way into our consciousness. J) Anonymity, in fact, is the second root cause of the free-trade paradox. Modernity has emancipated everyone from the limits of location and community. By and large, when we trade, we trade with strangers; when we vote, we vote for strangers; when we watch, read, or listen to stories, the tellers of the tales are strangers. As opposed to the ancestors Tocqueville compares us to, we do not know the people with whom we have to do, in either the economic or the political sphere. This is simply the shadow side of the miracle of markets, which, for the first time in history, have allowed strangers to look after each other. They''ve also allowed each of us to live more and more of our lives exclusively as strangers to other people. This is how Tocqueville— rather pessimistically—describes us: Each, standing apart, is like a stranger to the destiny of others; his children and personal friends forming for him the entire human race. As for the remainder of his fellow citizens, he is beside them, but he does not see them. He touches them, but he does not feel them. He exists only in and for himself. K) The last sentence but one is as apt a summary as one could hope to come by of how each of us functions in the modern economy: "He touches them, but he does not feel them." L) This is the greatest challenge facing defenders of free trade. It''s exceedingly difficult for human beings to feel gratitude toward strangers, and the global marketplace that has made us so rich has also made us strangers to one another. Our brains are hardwired for tribal life, and tribes do not take kindly to strangers. Impressing a sense of dependence upon and gratitude toward foreign strangers is therefore an uphill task. M) If free-traders are going to win policy arguments in the future, they''ll have to find a way of forging bonds of affection between American consumers and foreign producers. Only by de-anonymizing the men and women who supply us with the goods and services we enjoy from overseas and by creating a sense of solidarity and relationship across borders that transcends economic interest can free trade win the day. Otherwise, the inborn biological upper hand that protectionists have in the form of nationalist solidarity is bound to win the day at the ballot box.', NULL, NULL, 1219, 'IMPORT', 'cet6-2024-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-3-r2'
);
SET @pg_cet6_2024_12_3_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-3-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-r3', 'CAREFUL_READING', 'CET6', NULL, 'There are hundreds of personality quizzes online that assert they can ascertain whether the right or left half of your brain is dominant. Left-brained people are supposedly logical and excel at language and math while right-brained people are more imaginative, emotionally intelligent and skilled with spatial reasoning. There''s just one problem: That''s not how brains work. Popular science enthusiasts sort of took this idea and ran with it, and it''s become woven in popular culture now, and it''s not going away. Despite this enduring belief, there''s no such thing as being "right-brained" or "left-brained". Whether you''re someone who tends more towards creativity or logic has nothing to do with one hemisphere of your brain being dominant over the other. But the actual science of how the two halves of our brains work together is sometimes stranger than fiction. The human brain is divided into two hemispheres, the left and right. In all vertebrate(脊椎的) animals, the right hemisphere controls the left side of the body and vice versa. And scientists have long known, thanks to the behaviors of patients who suffered brain injuries, that different areas of the brain do different things. But many scientists struggled with this idea, because the very suggestion that the left and right halves of the brain operate differently disrupted the idea that nature tends toward perfect symmetry. Work by neuroscientists(神经科学家) has revealed the importance of different hemispheres of the brain for different activities. However, their research quickly saw some misinterpretations in the general public: Some presumed creative people must be right-brained and logical people left-brained. It is proven that not only is personality unrelated to the different halves of the brain, but people aren''t really right- or left-brained to begin with. The idea that we have left-dominant people and right-dominant people, and that this is related to personality, is categorically false. That''s never been supported in the neuroscience community. Neuroscientists don''t believe that and never have. What scientists learned is that there are really important differences between the left hemisphere and the right hemisphere. It''s just that they have nothing to do with personality or whether cognitive strategy is more logical or free spirited or creative. While researchers have shown the limitations of how the hemispheres of our brains influence our lives, it''s not difficult to understand the appeal of such ideas. People are endlessly fascinated by themselves and their friends, and the subtle differences in how people think about the world are really meaningful to them. When you come up with an online quiz that tells us something about ourselves, we''re drawn to that. It''s irresistible. But you have to take it with an enormous grain of salt.', NULL, NULL, 444, 'IMPORT', 'cet6-2024-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-3-r3'
);
SET @pg_cet6_2024_12_3_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-3-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-r4', 'CAREFUL_READING', 'CET6', NULL, 'One hundred thirty-five students, four teachers, one giant classroom: This is what 9th grade looks like at Westwood High School, in Mesa, Arizona''s largest school system. There, an innovative teaching model has taken hold, and is spreading to other schools in the district and beyond. Five years ago, faced with high teacher turnover and declining student enrollment, Westwood''s leaders decided to try something different. Working with professors at Arizona State University''s teachers college, they piloted a classroom model known as team teaching, which allows teachers to dissolve the walls that separate their classes across physical or grade divides. The teachers share large groups of students—sometimes 100 or more—and rotate between group instruction, one-on-one interventions, small study groups, or whatever the teachers as a team agree is a priority that day. What looks at times like chaos is in fact a carefully orchestrated plan: Each morning, the Westwood teams meet to hammer out a personalized program for every student the team will focus on that day. By giving teachers more opportunity to collaborate, Mesa''s administrators hoped to fill staffing gaps and boost teacher morale and retention. Initial research suggests the gamble could pay off. "Teachers are doing fantastic things, but it''s very rare a teacher walks into another room to see what''s happening," said Andi Fourlis, superintendent of Mesa Public Schools. "Our profession is so slow to advance because we are working in isolation." Of course, overhauling teaching approaches can''t fix all the frustrations teachers have, such as low pay, but early results from Mesa show team teaching may be helping to reverse low morale. In a survey of hundreds of the district''s teachers, researchers found those who worked on teams reported greater job satisfaction, more frequent collaborations with colleagues, and more positive interactions with students. Another benefit of teams, teachers say, is that they can help each other improve their instruction. During one planning session, English teacher Jeff Hall shared a performance appraisal with a science teacher: Her recent lecture on something she called "the central dogma of biology" had bewildered him and their other teammates. "If the science is too confusing for me, can you imagine the frustration you feel as kids?" Hall said. But the science teacher, he said, wouldn''t have known about the confusion on her own. The model is not for everyone. Some teachers approached about volunteering for a team have said they prefer to work alone. Team teaching can also be a scheduling nightmare, especially at schools like Westwood where only some staff work in teams. There are also thorny questions like how to evaluate four teachers on the performance of 135 students. But for the time being, it seems to be working.', NULL, NULL, 448, 'IMPORT', 'cet6-2024-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-3-r4'
);
SET @pg_cet6_2024_12_3_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2024-12-3-r4' LIMIT 1);

-- 翻译 cet6-2024-12-3
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-translation'
);
SET @q_cet6_2024_12_3_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_01, '遨游太空历来是中华民族的梦想。2003年,神舟五号飞船发射成功,杨利伟成为第一个飞入太空的中国宇航员。2008年,神舟七号升空,翟志刚成为中国历史上首位进行太空行走的宇航员。近年来,中国航天进入创新发展"快车道",太空基础设施建设稳步推进,中国空间站于2022年全面建成。中国航天事业的迅速发展在中华民族的历史上写下了辉煌一页,也为人类文明进步做出了巨大贡献。未来,中国探索太空的脚步将迈得更稳、更远。', NULL, 'Exploring space has always been a dream of the Chinese nation. In 2003, Shenzhou-5 was successfully launched, and Yang Liwei became the first Chinese astronaut to fly into space. In 2008, Shenzhou-7 was launched, and Zhai Zhigang became the first astronaut to conduct a spacewalk in China''s history. In recent years, China''s space industry has entered a fast track of innovation-driven development, space infrastructure has advanced steadily, and China''s space station was fully completed in 2022. The rapid development of China''s space industry has written a glorious chapter in the history of the Chinese nation and made a great contribution to the progress of human civilization. In the future, China will take steadier and further steps in its exploration of space.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_01
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q26'
);
SET @q_cet6_2024_12_3_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_02, NULL, '{"A":"A) applaud","B":"B) casualty","C":"C) exclude","D":"D) extent","E":"E) group","F":"F) hierarchical","G":"G) immediate","H":"H) incredibly","I":"I) moderate","J":"J) mortality","K":"K) overt","L":"L) praiseworthy","M":"M) probe","N":"N) sceptically","O":"O) unequal"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_02
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q27'
);
SET @q_cet6_2024_12_3_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_03, NULL, '{"A":"A) applaud","B":"B) casualty","C":"C) exclude","D":"D) extent","E":"E) group","F":"F) hierarchical","G":"G) immediate","H":"H) incredibly","I":"I) moderate","J":"J) mortality","K":"K) overt","L":"L) praiseworthy","M":"M) probe","N":"N) sceptically","O":"O) unequal"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_03
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q28'
);
SET @q_cet6_2024_12_3_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_04, NULL, '{"A":"A) applaud","B":"B) casualty","C":"C) exclude","D":"D) extent","E":"E) group","F":"F) hierarchical","G":"G) immediate","H":"H) incredibly","I":"I) moderate","J":"J) mortality","K":"K) overt","L":"L) praiseworthy","M":"M) probe","N":"N) sceptically","O":"O) unequal"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_04
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q29'
);
SET @q_cet6_2024_12_3_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_05, NULL, '{"A":"A) applaud","B":"B) casualty","C":"C) exclude","D":"D) extent","E":"E) group","F":"F) hierarchical","G":"G) immediate","H":"H) incredibly","I":"I) moderate","J":"J) mortality","K":"K) overt","L":"L) praiseworthy","M":"M) probe","N":"N) sceptically","O":"O) unequal"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_05
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q30'
);
SET @q_cet6_2024_12_3_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_06, NULL, '{"A":"A) applaud","B":"B) casualty","C":"C) exclude","D":"D) extent","E":"E) group","F":"F) hierarchical","G":"G) immediate","H":"H) incredibly","I":"I) moderate","J":"J) mortality","K":"K) overt","L":"L) praiseworthy","M":"M) probe","N":"N) sceptically","O":"O) unequal"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_06
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q31'
);
SET @q_cet6_2024_12_3_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_07, NULL, '{"A":"A) applaud","B":"B) casualty","C":"C) exclude","D":"D) extent","E":"E) group","F":"F) hierarchical","G":"G) immediate","H":"H) incredibly","I":"I) moderate","J":"J) mortality","K":"K) overt","L":"L) praiseworthy","M":"M) probe","N":"N) sceptically","O":"O) unequal"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_07
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q32'
);
SET @q_cet6_2024_12_3_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_08, NULL, '{"A":"A) applaud","B":"B) casualty","C":"C) exclude","D":"D) extent","E":"E) group","F":"F) hierarchical","G":"G) immediate","H":"H) incredibly","I":"I) moderate","J":"J) mortality","K":"K) overt","L":"L) praiseworthy","M":"M) probe","N":"N) sceptically","O":"O) unequal"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_08
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q33'
);
SET @q_cet6_2024_12_3_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_09, NULL, '{"A":"A) applaud","B":"B) casualty","C":"C) exclude","D":"D) extent","E":"E) group","F":"F) hierarchical","G":"G) immediate","H":"H) incredibly","I":"I) moderate","J":"J) mortality","K":"K) overt","L":"L) praiseworthy","M":"M) probe","N":"N) sceptically","O":"O) unequal"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_09
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q34'
);
SET @q_cet6_2024_12_3_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_10, NULL, '{"A":"A) applaud","B":"B) casualty","C":"C) exclude","D":"D) extent","E":"E) group","F":"F) hierarchical","G":"G) immediate","H":"H) incredibly","I":"I) moderate","J":"J) mortality","K":"K) overt","L":"L) praiseworthy","M":"M) probe","N":"N) sceptically","O":"O) unequal"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_10
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q35'
);
SET @q_cet6_2024_12_3_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_11, NULL, '{"A":"A) applaud","B":"B) casualty","C":"C) exclude","D":"D) extent","E":"E) group","F":"F) hierarchical","G":"G) immediate","H":"H) incredibly","I":"I) moderate","J":"J) mortality","K":"K) overt","L":"L) praiseworthy","M":"M) probe","N":"N) sceptically","O":"O) unequal"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_11
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q36'
);
SET @q_cet6_2024_12_3_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_12, 'People became more and more reliant on others for basic needs as they entered the modern world even though they might feel less so.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_12
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q37'
);
SET @q_cet6_2024_12_3_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_13, 'On the topic of trade, productive debates might be possible, in contrast to the familiar mutual condemnation in discussing other issues.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_13
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q38'
);
SET @q_cet6_2024_12_3_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_14, 'We feel greater independence than we actually possess because money allows us to buy things without building any relationships.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_14
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q39'
);
SET @q_cet6_2024_12_3_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_15, 'The trouble with today''s trade stems from misconceptions rather than money.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_15
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q40'
);
SET @q_cet6_2024_12_3_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_16, 'For their arguments to prevail, advocates of free trade must try to forge bonds of affection between consumers at home and producers overseas.', NULL, 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_16
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q41'
);
SET @q_cet6_2024_12_3_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_17, 'According to Tocqueville, unlike our ancestors, we and the people we do trade with are strangers to each other.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_17
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q42'
);
SET @q_cet6_2024_12_3_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_18, 'In primitive societies, people had to rely mostly on themselves to meet their personal needs.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_18
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q43'
);
SET @q_cet6_2024_12_3_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_19, 'Few commodities in American homes are not reliant on people abroad in the process of manufacture and sale.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_19
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q44'
);
SET @q_cet6_2024_12_3_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_20, 'Protectionists argue against free trade by referring to the losses suffered by domestic producers and communities.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_20
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q45'
);
SET @q_cet6_2024_12_3_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_21, 'It is extremely hard to make people feel dependent on and grateful to strangers overseas.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_21
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q46'
);
SET @q_cet6_2024_12_3_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_22, 'What do numerous personality quizzes online claim they are able to do?', '{"A":"A) Distinguish between the two hemispheres of one''s brain.","B":"B) Determine whether one is left-brained or right-brained.","C":"C) Tell if one is more of a linguist or of a mathematician.","D":"D) Ascertain how one''s brain performs different tasks."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_22
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q47'
);
SET @q_cet6_2024_12_3_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_23, 'What does the author say is sometimes stranger than fiction?', '{"A":"A) How one hemisphere of the brain impacts creativity.","B":"B) How the two halves of our brains work alternately.","C":"C) How the two hemispheres of our brains cooperate.","D":"D) How one half of the brain dominates the other."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_23
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q48'
);
SET @q_cet6_2024_12_3_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_24, 'Why did many scientists have difficulty endorsing the idea that different areas of the brain do different things?', '{"A":"A) It contradicts the assumption that the two hemispheres of the brain are symmetrical.","B":"B) It dismisses the view that the universe has been evolving in a consistent manner.","C":"C) It is in conflict with the suggestion that the left and right halves of the brain work together.","D":"D) It disrupts the idea that the right hemisphere of the brain controls the left side of the body."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_24
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q49'
);
SET @q_cet6_2024_12_3_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_25, 'What belief have neuroscientists long rejected according to the passage?', '{"A":"A) There are left-dominant people and right-dominant people with different personalities.","B":"B) There are noticeable differences between the left and right hemispheres of the brain.","C":"C) One''s personality is hardly related to the different halves of the brain.","D":"D) Different areas of the brain are responsible for different activities."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_25
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q50'
);
SET @q_cet6_2024_12_3_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_26, 'What are we advised to do with an online quiz that tells us something about ourselves?', '{"A":"A) Challenge its authority.","B":"B) Scrutinize its originality.","C":"C) Evaluate its popularity.","D":"D) Question its reliability."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_26
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q51'
);
SET @q_cet6_2024_12_3_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_27, 'What do we learn about team teaching from the passage?', '{"A":"A) It is generally conducted in classrooms without walls.","B":"B) It allows students to choose teachers they favor most.","C":"C) It prioritizes peer work over classroom instruction.","D":"D) It is closely coordinated despite seeming confusion."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_27
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q52'
);
SET @q_cet6_2024_12_3_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_28, 'What does initial research suggest regarding Westwood''s innovative teaching model?', '{"A":"A) It could help raise teachers'' pay.","B":"B) It could turn out to be a success.","C":"C) It could cut down overall costs.","D":"D) It could end up like a gamble."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_28
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q53'
);
SET @q_cet6_2024_12_3_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_29, 'What did superintendent Andi Fourlis say about the teaching profession?', '{"A":"A) Morale cannot be boosted until teaching models are overhauled.","B":"B) Teachers are simply too busy to visit classes of their colleagues.","C":"C) Progress is slow due to lack of collaboration among teachers.","D":"D) Teachers often do fantastic things without being noticed."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_29
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q54'
);
SET @q_cet6_2024_12_3_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_30, 'What does the author want to show by citing English teacher Jeff Hall''s experience?', '{"A":"A) English teachers and science teachers are complementary in performing their tasks.","B":"B) A teacher of arts and letters is completely puzzled by what a science teacher teaches.","C":"C) The new teaching model helps inform the teacher how their instruction is received.","D":"D) Science teachers will hardly know the confusion they create without a performance appraisal."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_30
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2024-12-3-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2024_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2024-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q55'
);
SET @q_cet6_2024_12_3_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2024-12-3-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2024_12_3_31, 'What does the author think is one of the difficult problems in implementing the new teaching model?', '{"A":"A) What to do with teachers working alone.","B":"B) What to include in teaching schedules.","C":"C) How to recruit volunteers for a team.","D":"D) How to assess each teacher''s performance."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2024_12_3_31
);

-- ==================== cet6-2025-06-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-r1', 'BANKED_CLOZE', 'CET6', NULL, 'In her second year, Charlene Duong learned of the use of poisonous, synthetic pesticides on her college campus. Shocked but not surprised, she knew she had to do something. Along with a couple of classmates, Charlene did a quick web search and discovered a small but growing movement led by the organization, Herbicide-Free Campus (HFC), to rid college campuses of artificial herbicides(灭草剂). They were __26__ . Like many, Charlene experiences climate anxiety—a __27__ fear of a climate catastrophe—and was, at the time, looking for an __28__ . When she discovered the HFC movement, she said she felt she "had found a specific area to focus on that still fit into the larger picture of fighting for a healthier, safer, cleaner __29__ for all." Toxic herbicide use in university land care is not unique. Most institutions of higher education rely on synthetic pesticides and fertilizers to achieve __30__ goals. Having a "beautiful" campus means green and perfectly maintained lawns along with flower beds and paved sidewalks. But these __31__ managed campuses can come at a cost: increased cancer risk, __32__ waterways, poisoned wildlife and lifeless soil. Pesticide use on college campuses also contributes to our global climate crisis. The use of chemicals to get rid of insects or unwanted plant life can increase indirect __33__ as they can include petroleum-based ingredients. Pesticide use also decreases the life in soil, __34__ the ability of soils to absorb carbon or retain water and thus reducing campuses'' ability to recover quickly from climate-related extreme weather events like droughts and floods. Instead of using toxic chemicals, students working with HFC help out with __35__ the campus grounds. "This work reminds me to be in the present moment as I play my role in reducing herbicide use and keeping my campus safe and healthy," says Charlene.', NULL, '["A) aesthetic","B) chronic","C) contaminated","D) conventionally","E) emissions","F) environment","G) hampering","H) incidentally","I) infringement","J) intrigued","K) juvenile","L) outlet","M) rotating","N) vibrations","O) weeding"]', 300, 'IMPORT', 'cet6-2025-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-1-r1'
);
SET @pg_cet6_2025_06_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-r2', 'MATCHING', 'CET6', 'Why Your Library Is the Most Important Place in Town', 'A) Librarians know the value of their community services, and their patrons appreciate their importance as well. But in an increasingly digital world, we see the role of libraries as community and cultural centers at times undervalued. When shrinking municipal budgets combine with the nonstop technological revolution, public library services that focus on building communities face-to-face, inspiring and educating patrons about art, literature, and music, and helping patrons engage in civil discourse can seem old-fashioned. But it is precisely those shrinking budgets and the assault of technologically mediated life that make public libraries'' cultural and community offerings more important than ever. B) Many people point out the value public libraries bring to their communities. More than just books and banks of computers, libraries are still places where individuals gather to explore, interact, and imagine. Some of the specific ways in which libraries add value to our communities and serve as cultural centers for our patrons are community builders, centers for the arts, and champions of youth. Libraries serve in these capacities and are more than just about information. C) As community builders libraries are engaged in incredible work. From tiny public libraries to huge city institutions with multiple branches, libraries across the United States are building community and supporting local culture in exciting ways. These are inspiring and hopefully will encourage librarians interested in community services and cultural outreach to make connections with each other, share ideas, and build partnerships. Supporters of libraries as community builders claim that unless you are out there changing neighborhoods, you are not completing the work you are to do. Strengthening neighborhoods and championing the cultural lives of communities are big responsibilities. D) Place-based economic development stresses the importance of offering attractive, functional, and community- based places, such as libraries, in town squares and depressed neighborhoods. Like a major department store in a mall, libraries attract large numbers of people, creating economic opportunities for numerous businesses and organizations in the surrounding area. Large cities, medium-sized ones, and even small towns have successfully transformed their libraries into the hubs(枢纽) of vibrant neighborhoods. E) As key municipal agencies, and focal points for community education, libraries are major players in creating livable, environmentally friendly cities and towns. The Urban Libraries Council released a report detailing the unique ways in which libraries can further sustainability at the local level. Beyond ensuring that library construction projects consider environmental impact, libraries can take a lead in supporting local foods and craftsmen, like the Peabody Institute Library''s partnering with local businesses to pioneer a farmers'' market in their courtyard, or the Richmond Public Library''s seed lending library which "nurtures locally-adapted plant varieties, and fosters community resilience(韧性), self-reliance and a culture of sharing." F) Archives preserve historic artifacts, oral histories, digital history projects, and scholarly writings relevant to the community, including minority groups. Communities lucky enough to have archivists have a great advantage when it comes to organizing historical records and artifacts. An organized archive is a place where people can research their ancestry and immigration history, do environmental research, and more. An archivist is an advocate for preservation who, among other things, coordinates the restoration of maps and paintings, the digitization of vital records, and the creation of oral history projects. With projects like the Massachussets Memories Road Show and the Veterans History Project, evidence of the importance of archives is everywhere. G) In the words of Robert Putnam, "People may go to the library looking mainly for information, but they find each other there." New moms connect at baby story-times; elderly people, often facing difficult life transitions, attend events and find that they make new friends; teenagers meet up in libraries'' teen spaces after school; and readers discuss current events in the periodicals room. In libraries, community-building connections are happening all the time. H) As Keith Richards said, "The public library is the great equalizer." Despite the rising costs of concert and theater tickets, public library events (including concerts, author visits, and gallery displays) are often offered free of charge, enabling people of any income level to attend. In addition, library book groups allow people to explore and discuss the literary arts, and the Great Stories Club introduces at-risk youth to literature. The best part: it''s all free and open to the public. I) In a time when education is increasingly expensive, public libraries provide information and educational opportunities free for all people, regardless of their socio-economic status. Offered by libraries across the country, American Library Association''s Let''s Talk about It programs are wonderful examples of scholar- facilitated learning opportunities in libraries. In addition, many libraries present classes and discussion programs, and some even provide online continuing education courses such as the Universal Class database. J) Librarians know that patrons aren''t just information consumers, they''re information producers. Patrons use the library to gain knowledge in order to create their own new and independent works. Increasing numbers of libraries provide spaces and services that meet the needs of people who want to learn how to edit Wikipedia, set up blogs or podcasts, create their own magazines, and so much more. Many libraries offer art or writing workshops and groups, and some provide music practice rooms for patrons. Programs like ImaginOn in Charlotte, North Carolina, provide exciting models that take community partnership, creativity, and creation to a new level. K) The decline of civil discourse stems in part from the fact that it is so easy for people to watch news about, buy products from, and engage—in both the virtual and real worlds—only with those of similar backgrounds and ideologies. Public libraries, through such programs as The Human Library and Socrates Café, can help build small communities of difference that encourage people to interact with and learn from each other through dialogue. By both actively promoting civil discourse through these programs, and modeling and upholding the principles of free inquiry and expression for all, libraries help individuals rediscover the importance of and increased need for civil discourse in American life. L) Free tutoring, homework help programs, and summer reading programs for kids and teens help bridge the economic divide that impacts students'' academic performance. The cost of hiring a private tutor is well beyond what many library patrons can afford, so libraries offer homework help and tutoring online, by phone, in person, and even through social media and homework apps. Annual summer reading programs also have a positive impact on student performance and, according to a 2010 study conducted by Dominican University''s Graduate School of Library and Information Science, students'' reading skills get a boost from these popular nationwide events. M) Through library collections, programs, and physical spaces, children learn to share, to be engaged in their communities, to participate in the arts, and to explore their immediate world and the world at large. There are surely endless examples of innovative library services for children, including the Middle Country Public Library''s Nature Explorium, which engages children in learning about the natural world. N) These examples are just a few of the many amazing things that public libraries around the United States (and the world) are doing to build and maintain strong community connections. We encourage you to try some of these ideas in your own libraries, and we hope that these ideas will help you be better able to convince your community leaders of the important role that public libraries play in communities large and small.', NULL, NULL, 1233, 'IMPORT', 'cet6-2025-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-1-r2'
);
SET @pg_cet6_2025_06_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-r3', 'CAREFUL_READING', 'CET6', NULL, 'Nationally, one in six children miss 15 or more days of school in a year. Education officials have deplored all this missed instruction. These chronically absent students suffer academically because of all the classroom instruction they miss out on. In 2015, the U.S. secretary of education responded to this crisis, urging communities to support every student to attend every day and be successful in school. His open letter stated that missing 10% of school days in a year for any reason—excused or unexcused—is a primary cause of low academic achievement. Worrying about whether children attend school makes sense. After all, if students don''t show up, teachers can''t teach them. But what if America''s attendance crisis is about much more than students missing class? What if, instead, it is a reflection of family and community crises these students face—such as being ejected from the family apartment, fearing for their safety in their neighborhood or suffering an illness? As social scientists we investigated how excused and unexcused absences relate to children''s academic achievement. We find that absences excused by a parent do little to harm children''s learning. In fact, children with no unexcused absences—but 15 to 18 excused absences—have test scores equal to their peers who have no absences. Meanwhile, the average child with even just one unexcused absence does much worse academically than peers with none. We believe unexcused absence is a strong signal of the many challenges children and families face, including economic and medical hardships. Unexcused absences can be a powerful signal of how those out-of- school challenges affect children''s academic progress. Our evidence suggests unexcused absences are problematic, but for a different reason than people often think. Absence from school, and especially unexcused absence, matters mainly as a signal of many crises children and their families may be facing. It matters less as a cause of lower student achievement due to missed instruction. How we choose to think of school absences matters for educational policy. School attendance policies typically hold schools and families accountable for the days children miss, regardless of whether they were excused or unexcused absences. These policies assume that missing school for any reason harms children academically because they are missing classroom instruction. They also assume that schools will be able to effectively intervene by reducing student absences. We find neither to be the case. As a result, these attendance policies end up disproportionately punishing families dealing with out-of-school crises in their lives and pressuring schools who serve them to get students to school more often. We instead suggest using unexcused absence from school as a signal to channel resources to the children and families who need them most.', NULL, NULL, 444, 'IMPORT', 'cet6-2025-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-1-r3'
);
SET @pg_cet6_2025_06_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-r4', 'CAREFUL_READING', 'CET6', NULL, 'After earning a bachelor''s degree, I was determined to do what I love. I headed straight to graduate school to investigate the social problems that fascinated me. For almost a decade, I told everyone I encountered that they should do the same. "Follow your passion," I counseled. "You can figure out the employment stuff later." It wasn''t until I began to research this widely accepted career advice that I understood how problematic it really was. As a sociologist, I interviewed college students and professional workers to learn what it really meant to pursue their dreams, which I will refer to here as the passion principle. I was stunned by what I found out about this principle in the research for my new book. Surveys show the American public has long held the passion principle in high regard as a career decision- making priority. And its popularity is even stronger among those facing job instability. Advocates of the passion principle found it compelling because they believed that following one''s passion can provide workers with both the motivation necessary to work hard and a place to find fulfillment. Yet, what I found is that following one''s passion does not necessarily lead to fulfillment, but is one of the most powerful cultural forces perpetuating overwork. I also found that promoting the pursuit of one''s passion helps perpetuate social inequalities due to the fact that not everyone has the same economic resources to allow them to pursue their passion with ease. While the passion principle is broadly popular, not everyone has the necessary resources to turn their passion into a stable, good-paying job. Passion-seekers from wealthy families are better able to wait until a job they are passionate about comes along without worrying about student loans in the meantime. They are also better situated to take unpaid internships to get their foot in the door while their parents pay their rent. And they often have access to parents'' social networks to help them find jobs. Surveys revealed that working-class and first-generation college graduates, regardless of their career field, are more likely than their wealthier peers to end up in low-paying unskilled jobs when they pursue their passion. Colleges, workplaces and career counselors who promote the "follow your passion" path for everyone, without leveling the playing field, help perpetuate socioeconomic inequalities among career aspirants. It''s not just well-off passion-seekers who benefit from the passion principle. Employers of passionate workers do, too. Potential employers showed greater interest in passionate applicants in part because they believed the applicants would work hard at their jobs without expecting an increase in pay. They even sacrifice a good salary, job stability and leisure time to work in a job they love.', NULL, NULL, 451, 'IMPORT', 'cet6-2025-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-1-r4'
);
SET @pg_cet6_2025_06_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2025-06-1-r4' LIMIT 1);

-- 翻译 cet6-2025-06-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-translation'
);
SET @q_cet6_2025_06_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_01, '天宫空间站(Tiangong Space Station)是中国首个太空实验室,拥有110多立方米使用空间,可驻留三名宇航员,在距地球表面400-450公里的轨道上运行。天宫空间站已实施180多个科学研究与应用项目,涉及空间生命科学、太空医学、空间材料科学等领域。天宫空间站的研究成果在我国得到了广泛应用,产生了显著的经济效益。例如,太空育种创造的直接经济效益高达数千亿元。这不仅标志中国在航天技术上取得了巨大进步,也表明中国为全球的太空研究和应用做出了重大贡献。', NULL, 'The Tiangong Space Station, China''s first space laboratory, boasts over 110 cubic meters of usable space and is able to accommodate three astronauts, orbiting at an altitude of 400 to 450 kilometers above the Earth''s surface. The station has carried out more than 180 scientific research and application projects, covering such fields as space life science, space medicine, and space materials science. The research achievements of the station have been widely applied in China and have generated remarkable economic benefits. For example, the direct economic benefits created by space breeding reach hundreds of billions of yuan. This not only marks China''s tremendous progress in aerospace technology, but also demonstrates that China has made significant contributions to global space research and application.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_01
);

-- 听力 Q1 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q01', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q01'
);
SET @q_cet6_2025_06_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_02, NULL, '{"A":"A) Met the computer technician.","B":"B) Told the man about her trouble.","C":"C) Called the man''s company.","D":"D) Visited Alpha Maintenance."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_02
);

-- 听力 Q2 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q02', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q02'
);
SET @q_cet6_2025_06_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_03, NULL, '{"A":"A) Consulted someone in charge.","B":"B) Came as soon as possible.","C":"C) Informed the central office at once.","D":"D) Designated an engineer to the case."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_03
);

-- 听力 Q3 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q03', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q03'
);
SET @q_cet6_2025_06_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_04, NULL, '{"A":"A) Frustration.","B":"B) Intimidation.","C":"C) Desperation.","D":"D) Indignation."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_04
);

-- 听力 Q4 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q04', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q04'
);
SET @q_cet6_2025_06_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_05, NULL, '{"A":"A) Whether the contents have been backed up.","B":"B) Whether they can find help somewhere else.","C":"C) Whether all data stored on the hard drive has got lost.","D":"D) Whether they need to wipe the system directories clean."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_05
);

-- 听力 Q5 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q05', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q05'
);
SET @q_cet6_2025_06_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_06, NULL, '{"A":"A) It''s boring.","B":"B) It''s challenging.","C":"C) It''s a beautiful thing.","D":"D) It''s unlike most jobs."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_06
);

-- 听力 Q6 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q06', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q06'
);
SET @q_cet6_2025_06_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_07, NULL, '{"A":"A) Arbitrating between disagreeing solicitors.","B":"B) Preventing disputes from escalating.","C":"C) Buying and selling property.","D":"D) Mediating land disputes."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_07
);

-- 听力 Q7 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q07', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q07'
);
SET @q_cet6_2025_06_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_08, NULL, '{"A":"A) Courts are intended for fixing major legal disputes.","B":"B) Courts are getting too bureaucratic to function.","C":"C) Courts can be frustrating and expensive.","D":"D) Courts can be frightening and arbitrary."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q08', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q08'
);
SET @q_cet6_2025_06_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_09, NULL, '{"A":"A) The ability to make arguments in a unique way.","B":"B) The skill of preventing conflicts between parties concerned.","C":"C) The skill of foreseeing any potential stakes in their work.","D":"D) The ability to express themselves clearly and forcefully."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_09
);

-- 听力 Q9 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q09', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q09'
);
SET @q_cet6_2025_06_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_10, NULL, '{"A":"A) They looked into the relationship between one''s prior knowledge and creativity.","B":"B) They offered novel ways to help older adults to keep their memories from aging.","C":"C) They proposed an explanation for old people''s difficulty in retrieving memories.","D":"D) They advanced a new model concerning human information storage and retrieval."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_10
);

-- 听力 Q10 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q10', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q10'
);
SET @q_cet6_2025_06_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_11, NULL, '{"A":"A) Young adults rely on memory while older adults keep notes as a reminder.","B":"B) Older adults often retrieve irrelevant memories along with what they want.","C":"C) Young adults accumulate knowledge much more quickly than older adults.","D":"D) Older adults generally perform cognitive tasks much slower than young adults."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_11
);

-- 听力 Q11 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q11', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q11'
);
SET @q_cet6_2025_06_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_12, NULL, '{"A":"A) They show preserved, and sometimes enhanced, creativity.","B":"B) They frequently suffer from disorderly crowded memories.","C":"C) They can rely on their accumulated wisdom in an emergency.","D":"D) They may well be served by forgetting their prior knowledge."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_12
);

-- 听力 Q12 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q12', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q12'
);
SET @q_cet6_2025_06_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_13, NULL, '{"A":"A) They are actually proud of the goods and services they produce.","B":"B) They are worried about being alienated from the outside world.","C":"C) They are rarely in control of many things related to their work.","D":"D) They are longing to share the profits made from their work."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_13
);

-- 听力 Q13 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q13', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q13'
);
SET @q_cet6_2025_06_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_14, NULL, '{"A":"A) The steady decrease in productivity.","B":"B) The adverse effect on physical health.","C":"C) The feeling of being time poor.","D":"D) The rising economic inequality."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_14
);

-- 听力 Q14 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q14', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q14'
);
SET @q_cet6_2025_06_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_15, NULL, '{"A":"A) It alters the structure of work.","B":"B) It puts jobs and wages at risk.","C":"C) It liberates people from tedious and laborious work.","D":"D) It creates new work opportunities in the IT industry."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_15
);

-- 听力 Q15 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q15', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q15'
);
SET @q_cet6_2025_06_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_16, NULL, '{"A":"A) Finding meaning in work.","B":"B) Prioritizing life over work.","C":"C) Improving relationships in the community.","D":"D) Realizing one''s social value in the workplace."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_16
);

-- 听力 Q16 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q16', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q16'
);
SET @q_cet6_2025_06_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_17, NULL, '{"A":"A) Affect our attitude to novel tasks.","B":"B) Distinguish us in the social world.","C":"C) Outweigh IQ in importance.","D":"D) Impact academic achievements."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_17
);

-- 听力 Q17 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q17', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q17'
);
SET @q_cet6_2025_06_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_18, NULL, '{"A":"A) By pressing a hidden button.","B":"B) By pushing a big button on top.","C":"C) By pressing two buttons at the same time.","D":"D) By helping the babies push the right button."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_18
);

-- 听力 Q18 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q18', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q18'
);
SET @q_cet6_2025_06_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_19, NULL, '{"A":"A) Perform difficult tasks successfully just by observing how adults acted.","B":"B) Make generalizable inferences about persistence from a few examples.","C":"C) Adapt themselves to different social contexts.","D":"D) Work hard to interact with experimenters."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_19
);

-- 听力 Q19 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q19', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q19'
);
SET @q_cet6_2025_06_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_20, NULL, '{"A":"A) Offering advice on overcoming habitual lateness.","B":"B) Exemplifying various recreational opportunities.","C":"C) Scrutinizing individuals'' defining traits.","D":"D) Suggesting ways for setting priorities."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_20
);

-- 听力 Q20 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q20', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q20'
);
SET @q_cet6_2025_06_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_21, NULL, '{"A":"A) Make the breakfast simpler.","B":"B) Take the alarms seriously.","C":"C) Ready yourself in the early dawn.","D":"D) Get prepared the night before."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_21
);

-- 听力 Q21 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q21', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q21'
);
SET @q_cet6_2025_06_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_22, NULL, '{"A":"A) Finish the prior task 30 minutes earlier.","B":"B) Keep ourselves from hitting a bump.","C":"C) Leave time in between activities.","D":"D) Try to avoid possible hold-ups."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_22
);

-- 听力 Q22 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q22', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q22'
);
SET @q_cet6_2025_06_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_23, NULL, '{"A":"A) Their lifestyles vary.","B":"B) Their traits vary.","C":"C) They have different customs.","D":"D) They have different feels."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_23
);

-- 听力 Q23 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q23', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q23'
);
SET @q_cet6_2025_06_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_24, NULL, '{"A":"A) They are not as willing to help strangers.","B":"B) They are not as patient with one another.","C":"C) They violate traffic rules more frequently.","D":"D) They become more easily irritated in public."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_24
);

-- 听力 Q24 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q24', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q24'
);
SET @q_cet6_2025_06_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_25, NULL, '{"A":"A) It was practiced by Boston''s founding fathers.","B":"B) It is not deemed exotic by Proper Bostonians.","C":"C) It was adopted by Boston''s upper class.","D":"D) It is not part of Boston''s local culture."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_25
);

-- 听力 Q25 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q25', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q25'
);
SET @q_cet6_2025_06_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_26, NULL, '{"A":"A) Stick to its own way of showing courtesy to strangers.","B":"B) Follow the examples set by Paris and New York City.","C":"C) Learn from the world''s major cities in promoting tourism.","D":"D) Take pride in its history and adhere to its cultural tradition."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q26'
);
SET @q_cet6_2025_06_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_27, NULL, '{"A":"A) aesthetic","B":"B) chronic","C":"C) contaminated","D":"D) conventionally","E":"E) emissions","F":"F) environment","G":"G) hampering","H":"H) incidentally","I":"I) infringement","J":"J) intrigued","K":"K) juvenile","L":"L) outlet","M":"M) rotating","N":"N) vibrations","O":"O) weeding"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q27'
);
SET @q_cet6_2025_06_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_28, NULL, '{"A":"A) aesthetic","B":"B) chronic","C":"C) contaminated","D":"D) conventionally","E":"E) emissions","F":"F) environment","G":"G) hampering","H":"H) incidentally","I":"I) infringement","J":"J) intrigued","K":"K) juvenile","L":"L) outlet","M":"M) rotating","N":"N) vibrations","O":"O) weeding"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q28'
);
SET @q_cet6_2025_06_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_29, NULL, '{"A":"A) aesthetic","B":"B) chronic","C":"C) contaminated","D":"D) conventionally","E":"E) emissions","F":"F) environment","G":"G) hampering","H":"H) incidentally","I":"I) infringement","J":"J) intrigued","K":"K) juvenile","L":"L) outlet","M":"M) rotating","N":"N) vibrations","O":"O) weeding"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q29'
);
SET @q_cet6_2025_06_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_30, NULL, '{"A":"A) aesthetic","B":"B) chronic","C":"C) contaminated","D":"D) conventionally","E":"E) emissions","F":"F) environment","G":"G) hampering","H":"H) incidentally","I":"I) infringement","J":"J) intrigued","K":"K) juvenile","L":"L) outlet","M":"M) rotating","N":"N) vibrations","O":"O) weeding"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q30'
);
SET @q_cet6_2025_06_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_31, NULL, '{"A":"A) aesthetic","B":"B) chronic","C":"C) contaminated","D":"D) conventionally","E":"E) emissions","F":"F) environment","G":"G) hampering","H":"H) incidentally","I":"I) infringement","J":"J) intrigued","K":"K) juvenile","L":"L) outlet","M":"M) rotating","N":"N) vibrations","O":"O) weeding"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q31'
);
SET @q_cet6_2025_06_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_32, NULL, '{"A":"A) aesthetic","B":"B) chronic","C":"C) contaminated","D":"D) conventionally","E":"E) emissions","F":"F) environment","G":"G) hampering","H":"H) incidentally","I":"I) infringement","J":"J) intrigued","K":"K) juvenile","L":"L) outlet","M":"M) rotating","N":"N) vibrations","O":"O) weeding"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q32'
);
SET @q_cet6_2025_06_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_33, NULL, '{"A":"A) aesthetic","B":"B) chronic","C":"C) contaminated","D":"D) conventionally","E":"E) emissions","F":"F) environment","G":"G) hampering","H":"H) incidentally","I":"I) infringement","J":"J) intrigued","K":"K) juvenile","L":"L) outlet","M":"M) rotating","N":"N) vibrations","O":"O) weeding"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q33'
);
SET @q_cet6_2025_06_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_34, NULL, '{"A":"A) aesthetic","B":"B) chronic","C":"C) contaminated","D":"D) conventionally","E":"E) emissions","F":"F) environment","G":"G) hampering","H":"H) incidentally","I":"I) infringement","J":"J) intrigued","K":"K) juvenile","L":"L) outlet","M":"M) rotating","N":"N) vibrations","O":"O) weeding"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q34'
);
SET @q_cet6_2025_06_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_35, NULL, '{"A":"A) aesthetic","B":"B) chronic","C":"C) contaminated","D":"D) conventionally","E":"E) emissions","F":"F) environment","G":"G) hampering","H":"H) incidentally","I":"I) infringement","J":"J) intrigued","K":"K) juvenile","L":"L) outlet","M":"M) rotating","N":"N) vibrations","O":"O) weeding"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q35'
);
SET @q_cet6_2025_06_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_36, NULL, '{"A":"A) aesthetic","B":"B) chronic","C":"C) contaminated","D":"D) conventionally","E":"E) emissions","F":"F) environment","G":"G) hampering","H":"H) incidentally","I":"I) infringement","J":"J) intrigued","K":"K) juvenile","L":"L) outlet","M":"M) rotating","N":"N) vibrations","O":"O) weeding"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q36'
);
SET @q_cet6_2025_06_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_37, 'People going to the library in search of information can build connections with each other there.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q37'
);
SET @q_cet6_2025_06_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_38, 'According to advocates of libraries as community builders, librarians are not doing their job well if they do not change their communities.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q38'
);
SET @q_cet6_2025_06_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_39, 'With the costs of education continually rising, public libraries remain places where all people can have access to education.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q39'
);
SET @q_cet6_2025_06_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_40, 'Libraries draw large crowds, thus creating lots of business opportunities in neighboring areas.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q40'
);
SET @q_cet6_2025_06_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_41, 'With the world more and more digitalized, people sometimes underestimate the role of libraries as community and cultural centers.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q41'
);
SET @q_cet6_2025_06_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_42, 'Various programs organized by public libraries for children and adolescents help narrow the gap between students from varying economic backgrounds.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q42'
);
SET @q_cet6_2025_06_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_43, 'In an organized archive, people can do research on their family history and find out how their ancestors came to settle in the new land.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q43'
);
SET @q_cet6_2025_06_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_44, 'Public libraries organize cultural events, often allowing people of different income levels to attend free of charge.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q44'
);
SET @q_cet6_2025_06_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_45, 'Besides being an information provider, the library performs many other important services for the community.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q45'
);
SET @q_cet6_2025_06_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_46, 'Public libraries can help build small communities of people with different backgrounds and ideologies.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q46'
);
SET @q_cet6_2025_06_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_47, 'What does the U.S. secretary of education say in his open letter?', '{"A":"A) It is of vital importance to respond promptly to the school absence crisis.","B":"B) The academic performance of chronically absent students is deplorable.","C":"C) Low academic achievement is mainly attributed to school absences.","D":"D) The effect of school absences on American education is worrisome."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q47'
);
SET @q_cet6_2025_06_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_48, 'What do the authors find about school absences?', '{"A":"A) Excused school absences have little impact on children''s learning.","B":"B) There is little difference between unexcused and excused absences.","C":"C) Excused absences lead to comparatively better school performance.","D":"D) Unexcused absences are a big challenge to both schools and families."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q48'
);
SET @q_cet6_2025_06_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_49, 'What do the authors believe concerning unexcused school absences?', '{"A":"A) They are likely to cause a decrease in students'' academic achievements due to missed instruction.","B":"B) They point directly to many of the out-of-school challenges confronting children and their families.","C":"C) They are matters the American government typically ignores when formulating educational policies.","D":"D) They give a clear signal to children and their families of the crises they are likely to face in the future."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q49'
);
SET @q_cet6_2025_06_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_50, 'What is the assumption underlying education policies in the U.S.?', '{"A":"A) Children''s academic performance depends on reducing the number of absences.","B":"B) Schools can boost children''s academic performance by effective intervention.","C":"C) Schools as well as families should be held responsible for out-of-school crises.","D":"D) Children''s academic performance is closely related to the quality of instruction."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q50'
);
SET @q_cet6_2025_06_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_51, 'What do the authors suggest doing regarding school absences?', '{"A":"A) Identifying their underlying causes.","B":"B) Reframing school attendance policies.","C":"C) Directing resources to helping needy children.","D":"D) Pressuring schools to reduce unexcused ones."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q51'
);
SET @q_cet6_2025_06_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_52, 'What did the author advise people do for almost a decade?', '{"A":"A) Figure out what is the most fascinating job.","B":"B) Follow widely accepted career counsel.","C":"C) Pursue their careers with passion.","D":"D) Do whatever they are zealous for."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q52'
);
SET @q_cet6_2025_06_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_53, 'How did the author feel about the passion principle through his research?', '{"A":"A) He was astonished by its consequences.","B":"B) He was further convinced of its soundness.","C":"C) He was actually right to follow it through.","D":"D) He was struck by its broad popularity."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q53'
);
SET @q_cet6_2025_06_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_54, 'What is important to turning one''s passion into a stable, good-paying job?', '{"A":"A) Willingness to take unpaid internships and low-paying jobs.","B":"B) Full academic preparedness and sound career counseling.","C":"C) Hard work and sacrifice of leisure time.","D":"D) Financial backing and social connections."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q54'
);
SET @q_cet6_2025_06_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_55, 'What happens when everyone is encouraged to follow their passion?', '{"A":"A) Many more career aspirants end up unemployed.","B":"B) People are less concerned with socioeconomic inequality.","C":"C) Socioeconomic inequality is likely to persist.","D":"D) Career counselors are going to lose credibility."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2025-06-1-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2025_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2025-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q55'
);
SET @q_cet6_2025_06_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2025-06-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2025_06_1_56, 'What does the author say about employers of passionate workers?', '{"A":"A) They provide these workers with job stability and a good salary.","B":"B) They exploit these workers'' passion to benefit themselves.","C":"C) They level the playing field for these workers to reach their goals.","D":"D) They encourage these workers to realize their aspirations."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2025_06_1_56
);

COMMIT;
