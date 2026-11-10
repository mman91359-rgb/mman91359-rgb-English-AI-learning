-- 由 scripts/import-exam.mjs 自动生成，请勿手工修改。
-- 版本: V1.0.35
-- 生成时间: 2026-11-09T14:51:12.484Z
-- 目标库: exercise_db
-- 执行前必须按 docs/数据库迁移规范.md 预览、备份、审批。
-- 范围：正常套 + 仅借听力套（残卷留后）；听力无音频不写 listening_audio。

START TRANSACTION;

-- ==================== cet6-2021-06-3 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-r1', 'BANKED_CLOZE', 'CET6', NULL, 'At 43, I''ve reached the stage where women are warned to watch out for the creeping sadness of middle age. We''re served up an endless stream of advice on "how to survive your 40s", as if we''re in the endurance stage of a slow limp toward __26__ . This is the age women start to become "invisible"—our value, attractiveness and power supposedly __27__ by the vanishing of youth. But I don''t feel like I''m fading into __28__ . I feel more seen than I ever have, and for the first time in my life, I have a clear-eyed view of myself that is __29__ , compassionate and accepting. When I look in the mirror, I''m proud of who I am—even those "broken" parts that for so long seemed impossible to love. So when advertisers try to sell me ways to "turn back the clock", I have to __30__ a laugh. I wouldn''t go back to the crippling self-consciousness of my youth if you paid me. This hard-won sense of self-acceptance is one of the joys of being an older woman. But it''s a narrative often __31__ out by the shame that marketers rely on to peddle us their diet pills, miracle face creams and breathable yoga pants—as if self-love is a __32__ commodity. For some women I know, this sense of trust and self-belief later in life gave them the courage to leave dysfunctional relationships or __33__ on new career paths. Others talked about enjoying their own company, of growth through __34__ , deepening bonds of friendships, the ability to be more compassionate, less judgmental and to listen more and appreciate the small pleasures. Life past 40 is far from smooth sailing, but it''s so much more than the reductive __35__ we see in women''s magazines and on the Hollywood big screen.', NULL, '["A) adversity","B) authentic","C) convey","D) depictions","E) diminished","F) drowned","G) embark","H) fragility","I) neglected","J) obscurity","K) outlines","L) prevalent","M) purchasable","N) submit","O) suppress"]', 302, 'IMPORT', 'cet6-2021-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-3-r1'
);
SET @pg_cet6_2021_06_3_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-3-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-r2', 'MATCHING', 'CET6', 'What Are the Ethics of CGI Actors—And Will They Replace Real Ones?', 'A) Digital humans are coming to a screen near you. As computer-generated imagery (CGI) has become cheaper and more sophisticated, the film industry can now convincingly recreate people on screen—even actors who have been dead for decades. The technology''s ability to effectively keep celebrities alive beyond the grave is raising questions about public legacies and image rights. B) Late in 2019, it was announced that US actor James Dean, who died in 1955, will star in a Vietnam War film scheduled for release later this year. In the film, which will be called Finding Jack, Dean will be recreated on screen with CGI based on old footage(影片镜头) and photographs, with another actor voicing him. The news was met with excitement by those keen to see Dean digitally brought back to life for only his fourth film, but it also drew sharp criticism. "This is puppeteering the dead for their fame alone," actress Zelda Williams wrote on Twitter. "It sets such an awful precedent for the future of performance." Her father, Robin Williams, who died in 2014, was keen to avoid the same fate. Before his death, he filed a deed protecting the use of his image until 2039, preventing others from recreating him using CGI to appear in a film, TV show or as a hologram(全息影像). C) The James Dean film is a way to keep the actor''s image relevant for younger generations, says Mark Roesler of CMG Worldwide, the firm that represents Dean''s estate. "I think this is the beginning of an entire wave," says Travis Cloyd, CEO of Worldwide XR, one of the companies behind the digital recreation of Dean. "Moving into the future, we want James Dean to be brought into different gaming environments, or different virtual reality environments, or augmented reality environments," he says. D) Other actors have been revived, with the permission of their estates, for advertising purposes: for example, a 2011 advertisement for Dior featured contemporary actress Charlize Theron alongside iconic 20th-century stars Marilyn Monroe, Grace Kelly and Marlene Dietrich. Later, Audrey Hepburn was digitally recreated for a chocolate commercial in 2013. In the same year, a CGI Bruce Lee appeared in a Chinese-language ad for a whisky brand, which offended many fans because Lee was widely known not to drink alcohol at all. "In the last five years, it''s become more affordable and more achievable in a whole movie," says Tim Webber at UK visual effects firm Framestore, the company behind the Hepburn chocolate ad. Framestore used body doubles with resemblance to Hepburn''s facial structure and body shape as a framework for manual animation. The process was extremely difficult and expensive, says Webber, but the technology has moved on. E) Now, a person can be animated from scratch. "If they''re alive today, you can put them in scanning rigs, you can get every detail of their body analysed very carefully and that makes it much easier, whereas working from available photographs is tricky," says Webber, who won an Academy Award for his visual effects work on the 2013 film Gravity. "I also see a lot of actors today who will have the desire to take advantage of this technology: to have their likeness captured and stored for future content," says Cloyd. "They foresee this being something that could give their estates and give their families the ability to make money from their likeness when they''re gone." F) A hidden hazard of digitally recreating a deceased(已故的) celebrity is the risk of damaging their legacy. "We have to respect the security and the integrity of rights holders," says John Canning at Digital Domain, a US firm that created a hologram rapper(说唱艺人) Tupac Shakur, which appeared at the Coachella music festival in 2012, 15 years after his death. G) Legally, a person''s rights to control the commercial use of their name and image beyond their death differ between and even within countries. In certain US states, for example, these rights are treated similarly to property rights, and are transferable to a person''s heirs. In California, under the Celebrities Rights Act, the personality rights for a celebrity last for 70 years after their death. "We''ve got a societal debate going on about access to our public commons, as it were, about famous faces," says Lilian Edwards at Newcastle University, UK. Should the public be allowed to use or reproduce images of famous people, given how iconic they are? And what is in the best interest of a deceased person''s legacy may conflict with the desires of their family or the public, says Edwards. H) A recreation, however lifelike, will never be indistinguishable from a real actor, says Webber. "When we are bringing someone back, representing someone who is no longer alive on the screen, what we are doing is extremely sophisticated digital make-up," he says: "A performance is a lot more than a physical resemblance." I) As it becomes easier to digitally recreate celebrities and to entirely manufacture on-screen identities, could this kind of technology put actors out of jobs? "I think actors are worried about this," says Edwards. "But I think it will take a very long time." This is partly because of the risk that viewers find virtual humans scary. Edwards cites widespread backlash to the digital recreation of Carrie Fisher as a young Princess Leia in Rogue One, a trick later repeated in the recent Star Wars: The Rise of Skywalker, which was filmed after Fisher''s death in 2016. "People didn''t like it," she says. "They discovered the uncanny valley(诡异谷)." J) This refers to the idea that when objects trying to resemble humans aren''t quite perfect, they can make viewers feel uneasy because they fall somewhere between obviously non-human and fully human. "That''s always a danger when you''re doing anything human or human-like," says Webber. "There''re a thousand things that could go wrong with a computer-generated facial performance, and any one of those could make it fall into the uncanny valley," he says: "Your brain just knows there''s something wrong." The problem often arises around the eyes or mouth, says Webber. "They''re the areas that you look at when you''re talking to someone." K) An unfamiliar digital human that has been created through CGI will also face the same challenge as an unknown actor: they don''t have the appeal of an established name. "You have to spend substantial capital in creating awareness around their likeness and making sure people are familiar with who they are," says Cloyd. This is now starting to happen. "The way you pre-sell a movie in a foreign market is based on relevant talent," he says. "I think we''re a long way away from having virtual beings that have the ability to pre-sell content." L) Webber expects that we will see more digital humans on screen. "It''s happening because it can happen," he says. Referring to a line from Jurassic Park(侏罗纪公园), he adds: "People are too busy thinking about what they can do to think about whether they should do it."', NULL, NULL, 1161, 'IMPORT', 'cet6-2021-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-3-r2'
);
SET @pg_cet6_2021_06_3_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-3-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-r3', 'CAREFUL_READING', 'CET6', NULL, 'You can''t see it, smell it, or hear it, and people disagree on how precisely to define it, or where exactly it comes from. It isn''t a school subject or an academic discipline, but it can be learned. It is a quality that is required of artists, but it is also present in the lives of scientists and entrepreneurs. All of us benefit from it and we thrive mentally and spiritually when we are able to wield it. It is a delicate thing, easily stamped out; in fact, it flourishes most fully when people are playful and childlike. Meanwhile, it works best in conjunction with deep knowledge and expertise. This mysterious—but teachable—quality is creativity, the subject of a recently-published report by Durham Commission on Creativity and Education. The report concludes that creativity should not inhabit the school curriculum only as it relates to drama, music, art and other obviously creative subjects, but that creative thinking ought to run through all of school life, infusing(充满) the way humanities and natural sciences are learned. The authors, who focus on education in England, offer a number of sensible recommendations, some of which are an attempt to alleviate the uninspiring and fact-based approach to education that has crept into policy in recent years. When children are regarded as vessels to be filled with facts, creativity does not prosper; nor does it when teachers'' sole objective is coaching children towards exams. One suggestion from the commission is a network of teacher-led "creativity collaboratives", along the lines of existing maths hubs(中心), with the aim of supporting teaching for creativity through the school curriculum. Nevertheless, it is arts subjects through which creativity can most obviously be fostered. The value placed on them by the independent education sector is clear. One only has to look at the remarkable arts facilities at Britain''s top private schools to comprehend this. But in the state sector the excessive focus on English, maths and science threatens to crush arts subjects; meanwhile, reduced school budgets mean diminishing extracurricular activities. There has been a 28.1% decline in students taking creative subjects at high schools since 2014, though happily, art and design have seen a recent increase. This discrepancy between state and private education is a matter of social justice. It is simply wrong and unfair that most children have a fraction of the access to choirs, orchestras, art studios and drama that their more privileged peers enjoy. As lives are affected by any number of looming challenges—climate crisis, automation in the workplace—humans are going to need creative thinking more than ever. For all of our sakes, creativity in education, and for all, must become a priority.', NULL, NULL, 442, 'IMPORT', 'cet6-2021-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-3-r3'
);
SET @pg_cet6_2021_06_3_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-3-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-r4', 'CAREFUL_READING', 'CET6', NULL, 'Emulating your conversation partner''s actions is a common human behavior classified as "mirroring" and has been known and studied by psychologists for years. We all tend to subconsciously copy gestures of people we like. But why do we act like this? As a rule, mirroring means that conversationalists enjoy their communication and that there''s a certain level of agreement between them. The topic of discussion is equally interesting for both and they know their interests meet. Repeating someone''s behavior is typical of talented communicators, not always because the person is sympathetic, but because there is a goal to be achieved. This way new idols have been brought to the stage: politicians, celebrities, and other big names. Popular culture makes people want to look popular, and act and speak like popular people. Nowadays celebrities steal lyrics from each other and struggle with copyright violation accusations or straightforwardly claim themselves to be the authors, even though all the work was done by other people. Among celebrities, it''s trendy nowadays to use their own speech writers as politicians do. The so-called "ghostwriting" can take various forms: books, articles, autobiographies, and even social media posts. Who is a true copycat(抄袭者) and who gets copycatted? Sometimes, it is a hard nut to crack without an expert''s help. But new authorship defending methods based on identifying individual writing patterns are already here. Their aim is to protect intellectual property. Using scientific methods, some of them can define authorship with 85% accuracy. Writing is not an easy craft to master. If you want to write like a professional without plagiarism(抄袭), there are a few lessons to learn and the first one is: "Copy from one, it''s plagiarism; copy from two, it''s research." The correct interpretation of this statement is not about copying, but rather about creating your own style. When you study an author''s writing style, don''t stop on a single one, but explore numerous styles instead. Examine types of sentences they use, pay attention to their metaphors, and focus on stories you feel you could write a pretty cool sequel(续篇) to. Imitation is rather paradoxical. As an integral part of learning, it brings about positive changes, making people develop and grow. However, it may do a lot of harm. Copying someone''s thoughts, ideas or inventions is completely unacceptable. It infringes on intellectual property rights of others. Still, many things we do are about copying others one way or another. So if you want to compliment someone on the work they have done and imitate it, just make sure you do it the right way to avoid committing plagiarism.', NULL, NULL, 432, 'IMPORT', 'cet6-2021-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-3-r4'
);
SET @pg_cet6_2021_06_3_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2021-06-3-r4' LIMIT 1);

-- 翻译 cet6-2021-06-3
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-translation'
);
SET @q_cet6_2021_06_3_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_01, '云南是位于中国西南的一个省份，平均海拔 1500米。云南历史悠久，风景秀丽，气候宜人。云南生态环境优越，生物多种多样，被誉为野生动植物的天堂。云南还有多种矿藏和充足的水资源,为全省经济的可持续发展提供了有利条件。 云南居住着25个少数民族,他们大多有自己的语言、习俗和宗教。云南独特的自然景色和丰富的民族文化使其成为中国最受欢迎的旅游目的地之一，每年都吸引着大批国内外游客前往观光旅游。', NULL, 'Yunnan is a province in southwest China, with an average altitude of 1,500 meters. It has a long history, beautiful scenery and a pleasant climate. With its superior ecological environment and diverse species, it is known as a paradise for wild animals and plants. It also has various mineral resources and abundant water resources, providing favorable conditions for the sustainable development of the province''s economy. It is home to 25 ethnic minorities, most of whom have their own languages, customs and religions. Its unique natural scenery and rich ethnic culture make it one of the most popular tourist destinations in China, attracting large numbers of tourists from home and abroad every year.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_01
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q26'
);
SET @q_cet6_2021_06_3_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_02, NULL, '{"A":"A) adversity","B":"B) authentic","C":"C) convey","D":"D) depictions","E":"E) diminished","F":"F) drowned","G":"G) embark","H":"H) fragility","I":"I) neglected","J":"J) obscurity","K":"K) outlines","L":"L) prevalent","M":"M) purchasable","N":"N) submit","O":"O) suppress"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_02
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q27'
);
SET @q_cet6_2021_06_3_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_03, NULL, '{"A":"A) adversity","B":"B) authentic","C":"C) convey","D":"D) depictions","E":"E) diminished","F":"F) drowned","G":"G) embark","H":"H) fragility","I":"I) neglected","J":"J) obscurity","K":"K) outlines","L":"L) prevalent","M":"M) purchasable","N":"N) submit","O":"O) suppress"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_03
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q28'
);
SET @q_cet6_2021_06_3_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_04, NULL, '{"A":"A) adversity","B":"B) authentic","C":"C) convey","D":"D) depictions","E":"E) diminished","F":"F) drowned","G":"G) embark","H":"H) fragility","I":"I) neglected","J":"J) obscurity","K":"K) outlines","L":"L) prevalent","M":"M) purchasable","N":"N) submit","O":"O) suppress"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_04
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q29'
);
SET @q_cet6_2021_06_3_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_05, NULL, '{"A":"A) adversity","B":"B) authentic","C":"C) convey","D":"D) depictions","E":"E) diminished","F":"F) drowned","G":"G) embark","H":"H) fragility","I":"I) neglected","J":"J) obscurity","K":"K) outlines","L":"L) prevalent","M":"M) purchasable","N":"N) submit","O":"O) suppress"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_05
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q30'
);
SET @q_cet6_2021_06_3_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_06, NULL, '{"A":"A) adversity","B":"B) authentic","C":"C) convey","D":"D) depictions","E":"E) diminished","F":"F) drowned","G":"G) embark","H":"H) fragility","I":"I) neglected","J":"J) obscurity","K":"K) outlines","L":"L) prevalent","M":"M) purchasable","N":"N) submit","O":"O) suppress"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_06
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q31'
);
SET @q_cet6_2021_06_3_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_07, NULL, '{"A":"A) adversity","B":"B) authentic","C":"C) convey","D":"D) depictions","E":"E) diminished","F":"F) drowned","G":"G) embark","H":"H) fragility","I":"I) neglected","J":"J) obscurity","K":"K) outlines","L":"L) prevalent","M":"M) purchasable","N":"N) submit","O":"O) suppress"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_07
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q32'
);
SET @q_cet6_2021_06_3_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_08, NULL, '{"A":"A) adversity","B":"B) authentic","C":"C) convey","D":"D) depictions","E":"E) diminished","F":"F) drowned","G":"G) embark","H":"H) fragility","I":"I) neglected","J":"J) obscurity","K":"K) outlines","L":"L) prevalent","M":"M) purchasable","N":"N) submit","O":"O) suppress"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_08
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q33'
);
SET @q_cet6_2021_06_3_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_09, NULL, '{"A":"A) adversity","B":"B) authentic","C":"C) convey","D":"D) depictions","E":"E) diminished","F":"F) drowned","G":"G) embark","H":"H) fragility","I":"I) neglected","J":"J) obscurity","K":"K) outlines","L":"L) prevalent","M":"M) purchasable","N":"N) submit","O":"O) suppress"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_09
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q34'
);
SET @q_cet6_2021_06_3_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_10, NULL, '{"A":"A) adversity","B":"B) authentic","C":"C) convey","D":"D) depictions","E":"E) diminished","F":"F) drowned","G":"G) embark","H":"H) fragility","I":"I) neglected","J":"J) obscurity","K":"K) outlines","L":"L) prevalent","M":"M) purchasable","N":"N) submit","O":"O) suppress"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_10
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q35'
);
SET @q_cet6_2021_06_3_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_11, NULL, '{"A":"A) adversity","B":"B) authentic","C":"C) convey","D":"D) depictions","E":"E) diminished","F":"F) drowned","G":"G) embark","H":"H) fragility","I":"I) neglected","J":"J) obscurity","K":"K) outlines","L":"L) prevalent","M":"M) purchasable","N":"N) submit","O":"O) suppress"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_11
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q36'
);
SET @q_cet6_2021_06_3_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_12, 'There is an ongoing debate among the public as to whether the images of deceased celebrities should be recreated.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_12
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q37'
);
SET @q_cet6_2021_06_3_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_13, 'The CGI technology allows the image of the deceased James Dean to be presented to young people in new settings.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_13
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q38'
);
SET @q_cet6_2021_06_3_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_14, 'It is very likely that the CGI-recreated image of a deceased celebrity will fail to match the real actor', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_14
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q39'
);
SET @q_cet6_2021_06_3_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_15, 'The use of digital technology can bring images of deceased celebrities back to the screen.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_15
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q40'
);
SET @q_cet6_2021_06_3_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_16, 'Recreating a deceased famous actor or actress may violate their legitimate rights.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_16
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q41'
);
SET @q_cet6_2021_06_3_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_17, 'More CGI-recreated images of deceased celebrities are expected to appear on screen.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_17
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q42'
);
SET @q_cet6_2021_06_3_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_18, 'The image of James Dean will be recreated on screen with his voice dubbed by someone else.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_18
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q43'
);
SET @q_cet6_2021_06_3_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_19, 'However advanced the CGI technology is, the recreated image will differ in a way from the real actor.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_19
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q44'
);
SET @q_cet6_2021_06_3_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_20, 'A lot of actors today are likely to make use of the CGI technology to have their images stored for the benefit of their families.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_20
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q45'
);
SET @q_cet6_2021_06_3_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_21, 'Some actors are concerned that they may lose jobs because of the CGI technology.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_21
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q46'
);
SET @q_cet6_2021_06_3_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_22, 'What do we learn from the passage about creativity?', '{"A":"A) It develops best when people are spiritually prepared.","B":"B) It is most often wielded by scientists and entrepreneurs.","C":"C) It is founded on scientific knowledge and analytical skills.","D":"D) It contributes to intellectual growth but can easily be killed."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_22
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q47'
);
SET @q_cet6_2021_06_3_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_23, 'What is the conclusion of a recently-published report?', '{"A":"A) Natural sciences should be learned the way humanities courses are.","B":"B) Cultivation of creativity should permeate the entire school curriculum.","C":"C) Art courses should be made compulsory for all students.","D":"D) Students should learn more obviously creative subjects."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_23
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q48'
);
SET @q_cet6_2021_06_3_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_24, 'What does the report say is detrimental to the fostering of creativity?', '{"A":"A) Alleviation of pressure.","B":"B) Teacher-led school activities.","C":"C) Test-oriented teaching.","D":"D) Independent learning."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_24
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q49'
);
SET @q_cet6_2021_06_3_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_25, 'What do we learn about the private schools in the UK?', '{"A":"A) They encourage extracurricular activities.","B":"B) They attach great importance to arts education.","C":"C) They prioritize arts subjects over maths and sciences.","D":"D) They cater to students from different family backgrounds."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_25
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q50'
);
SET @q_cet6_2021_06_3_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_26, 'What should be done to meet the future challenges?', '{"A":"A) Increasing government investment in school education.","B":"B) Narrowing the existing gap between the rich and the poor.","C":"C) Providing all children with equal access to arts education.","D":"D) Focusing on meeting the needs of under-privileged students."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_26
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q51'
);
SET @q_cet6_2021_06_3_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_27, 'What do people tend to do while engaging in a conversation?', '{"A":"A) Repeat what their partners say one way or another.","B":"B) Focus as much as possible on topics of mutual interest.","C":"C) Imitate their partners'' gestures without their knowing it.","D":"D) Observe carefully how their partners make use of gestures."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_27
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q52'
);
SET @q_cet6_2021_06_3_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_28, 'When does mirroring usually take place in a conversation?', '{"A":"A) When both sides are sympathetic with each other.","B":"B) When both sides have a lot of things in common.","C":"C) When both sides make interesting contributions.","D":"D) When both sides try to seek common ground."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_28
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q53'
);
SET @q_cet6_2021_06_3_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_29, 'What do we learn about popular culture?', '{"A":"A) It encourages people to imitate.","B":"B) It appeals mostly to big names.","C":"C) It acquaints young people with their idols.","D":"D) It can change people''s mode of cognition."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_29
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q54'
);
SET @q_cet6_2021_06_3_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_30, 'Why is the saying "copy from two, it''s research" a lesson to learn?', '{"A":"A) It facilitates the creation of one''s own writing style.","B":"B) It helps to protect one''s intellectual property rights.","C":"C) It fosters correct interpretation of professional writing.","D":"D) It enables one to write intriguing sequels to famous stories."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_30
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2021-06-3-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2021_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2021-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q55'
);
SET @q_cet6_2021_06_3_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2021-06-3-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2021_06_3_31, 'Why does the author say imitation is rather paradoxical?', '{"A":"A) It is liable to different interpretations.","B":"B) It is by and large a necessary evil.","C":"C) It can give rise to endless disputes.","D":"D) It may do harm as well as good."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2021_06_3_31
);

-- ==================== cet6-2022-06-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-r1', 'BANKED_CLOZE', 'CET6', NULL, 'The city of Bath was founded by the Romans almost two thousand years ago. It has been famous for its __26__ pleasing architecture and healing thermal springs ever since. There are three hot springs in Bath; one is the King''s Spring, upon which the Roman Baths and a temple were __27__ . The other two are the Cross Spring and the Hetling Spring, close to each other in Hot Bath Street. Although Bath is __28__ known as a Roman and Georgian city, many people came in the intervening centuries to make use of the __29__ waters. While the Georgians made ''taking the waters'' or bathing particularly fashionable, it was __30__ generations who paved the way, creating greater interest in Bath and its springs. Charles II, desperate for an heir and unable to produce a __31__ son, came to Bath to take the waters in the hope that their magical powers would do something to __32__ the situation. Craving for a male heir, James and Mary both came to Bath and soon after produced a son, which bred many conspiracy theories about who was the real father of their __33__ . Regardless, the ''miracle'' created something of a boom in tourism for Bath and once Queen Anne had paid a visit in 1702, sealing it as the place to be, the whole nation __34__ to the city. Afterwards, the spas(矿泉疗养浴场) in Bath continued to go in and out of fashion for more than 150 years until they closed completely. The new Bath Spa, which opened in 2006, __35__ modern architecture with the ancient spring, now the New Royal Bath.', NULL, '["A) aesthetically","B) constructed","C) designates","D) extract","E) flocked","F) incorporates","G) legitimate","H) natural","I) offspring","J) previous","K) principally","L) remedy","M) rhetorically","N) sneaked","O) versatile"]', 268, 'IMPORT', 'cet6-2022-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2022-06-1-r1'
);
SET @pg_cet6_2022_06_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2022-06-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-r2', 'MATCHING', 'CET6', 'The Doctor Will Skype You Now', 'A) Fazila is a young woman that has been dealing with eczema(湿疹), a common skin condition, for the past five years, but never got it treated. The nearest hospital is an hour away, by boat and bus, and her skin condition didn''t seem serious enough to make the trek, so she ignored it—until a new technology brought the doctor to her. Fazila lives on one of the remote river islands in northern Bangladesh. These islands are low- lying, temporary sand islands that are continuously formed and destroyed through sand buildup and erosion. They are home to over six million people, who face repeated displacement from flooding and erosion—which may be getting worse because of climate change—and a range of health risks, including poor nutrition, malaria(疟疾) and other water-borne diseases. B) The most dangerous thing for these remote island dwellers is land erosion. The second is lack of access to medical supplies and doctors. There are no doctors within miles, and while child mortality and maternal death have gone down in the rest of the country, this is not the case for the islands. The medical situation is so bad that it really takes away from the quality of their life. Yet for many island inhabitants—some of Bangladesh''s poorest—paying for health care is a costly ordeal. Victims of erosion lose their houses, agricultural land and jobs as farmers, fishermen and day laborers. Though government hospitals are free, many people hesitate to go, citing long commutes, endless lines and questionable diagnoses. For convenience''s sake, one-third of rural households visit unqualified village doctors, who rely on unscientific methods of treatment, according to a 2016 study in the peer-reviewed journal Global Health Action. C) On the islands, there''s even a colloquial(口头的) expression for the idea of making medical care your lowest priority: It''s known as "rog pushai rakha" in Bengali, which roughly translates to "stockpiling their diseases"—waiting to seek medical attention until a condition becomes extremely serious. Now, a new virtual medical service called Teledaktar (TD) is trying to make health care more easily accessible. Every week, TD''s medical operators travel to the islands by boat, carrying a laptop, a portable printer for prescriptions and tools to run basic medical screenings such as blood pressure, blood sugar, body temperature and weight. They choose an area of the island with the best Internet reception and set up a makeshift(临时凑合的) medical center which consists of plastic stools and small tables borrowed from the locals'' homes, a tent in case of rain and a sheet that is strung up to give the patients privacy during their session. D) Launched in October 2018, TD has eight centers in towns and villages across rural Bangladesh and on three islands. It is funded by a nonprofit organization founded by Bangladeshi entrepreneurs, finance and technology professionals. Inside the center, the laptop screen lights up to reveal Dr. Tina Mustahid, TD''s head physician, live-streamed(网络直播) from the capital city of Dhaka for free remote medical consultations. Affectionately called Doctor Apa—"older sister" in Bengali—by her patients, she is one of three volunteer doctors at TD. E) "I diagnose them through conversation," says Dr. Mustahid. "Sometimes it''s really obvious things that local doctors don''t have the patience to talk through with their patients. For example, a common complaint mothers come in with is that their children refuse to eat their meals. The mothers are concerned they are dealing with indigestion, but it''s because they are feeding the children packaged chips which are cheap and convenient. I tell them it is ruining their appetite and ask them to cut back on unhealthy snacks." Dr. Mustahid says building awareness about health and nutrition is important for island patients who are cut off from mainland resources. F) Even off the islands, Bangladesh faces a critical deficit of health services. The country has half the doctors- per-person ratio recommended by the World Health Organization: roughly one doctor per 2,000 people, instead of one doctor per 1,000 people. And of those physicians, many are concentrated in cities: 70% of the country''s population live in rural areas, yet less than 20% of health workers practice there. Over 70% of TD''s 3,000 patients are female, in part because many are not comfortable speaking with local doctors who tend to be male. The rural women are mostly not literate or confident enough to travel on their own to the nearest town to visit medical facilities. Many have spent their entire lives rebuilding their homes when the islands flood. Early marriage and young motherhood, which are prevalent in these parts of Bangladesh, also contribute to the early onset of health problems. G) For most TD patients on the islands, Dr. Mustahid is the first big-city doctor that they''ve ever consulted. TD doctors are not meant to treat serious illnesses or conditions that require a doctor to be physically present, such as pregnancy. But they can write prescriptions, diagnose common ailments—including digestive issues, joint pain, skin diseases, fever and the common cold—and refer patients to doctors at local hospitals. The visit is also an opportunity for the patients, especially women, to air their concerns about aging, motherhood and reproductive health according to Dr. Mustahid. The doctors also offer health, dietary and lifestyle advice where necessary, including insight on everything from recognizing postnatal( 产后的) depression to daily exercise. Dr. Mustahid regularly recommends her patients to take a daily thirty-minute morning walk before the sun gets too intense. H) After a few sessions about general health issues Fazila finally opened up about something else that was bothering her: her persistent skin condition. It can get expensive to travel to the doctor, so usually the women living on the islands describe their illness to their husbands. The husbands then go to the pharmacy, try to describe the issue and return home with some random medicines. Nothing worked for Fazila until she started seeing Dr. Apa. I) Other nonprofits are also starting to provide health services on the islands. A local non-governmental organization called Friendship operates floating boat hospitals that provide health services to islands all over Bangladesh, docking at each for two months at a time. Friendship also runs satellite clinics in which one doctor and one clinic aide who are residents of the community disperse health and hygiene information. J) TD still has a few major challenges. Many residents complain the medicines they are prescribed are sometimes unaffordable, but the government isn''t doing enough for them. Patients often ask why the medicine isn''t free along with the consultation from the doctors. The organizations are linked to local pharmacies and offer discounts to the patients and make sure to prescribe the most cost-effective brands, but still many residents can''t afford even that. K) Nevertheless, TD''s remote consultations seem to be popular: Of 3,000 patients, at least 200 have returned for follow-ups, according to TD. The reason, explains one resident, might be the simple gesture of treating the island inhabitants with respect. "Dr. Apa is patient," he says, "At government hospitals, the doctors treat us very badly, but here they listen to us, I can repeat myself many times and no one gets annoyed."', NULL, NULL, 1185, 'IMPORT', 'cet6-2022-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2022-06-1-r2'
);
SET @pg_cet6_2022_06_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2022-06-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-r3', 'CAREFUL_READING', 'CET6', NULL, 'Selective colleges and universities in the U.S. are under fire for being too elite and too expensive, and for not training graduates for the world of work. Such charges ignore the fact that these institutions continue to prepare students for success in their work, for thoughtful engagement in civic life, for lifelong learning, and for understanding the world and those with whom they live. These colleges and universities must be doing something right. Applications are at record highs, and their financial aid programs make them more accessible than ever. This model of education has long played a central role in creating opportunity, driving economic growth, and spurring innovation. Yet, there is growing skepticism about the value of this model. The recent tax reform bill is a wake-up call that our strongest colleges and universities are under assault by some in government. The initial proposals would have made education unaffordable for many by taxing tuition waivers for graduate students and ending deductions for student loan interest. Thankfully, these provisions were ultimately stripped from the bill, but lawmakers let stand a new tax on the investment income of some colleges and universities. While these attacks are motivated by misguided ideas, we need to do a better job of explaining why these claims are false and why what we do is valuable. We cannot take for granted that any of this is obvious. It is often said that elite colleges and universities do not train students, particularly those who study the liberal arts, for the workforce. But this can be refuted by scholarly research. The data are clear: a liberal arts education is great career preparation, both for excellent lifetime earnings and for satisfaction with the work. This education develops the skills of critical thinking, rigorous analysis of data and facts, communication with the written and spoken word, understanding of cultural differences and issues, and the ability to keep learning. In fact, liberal arts graduates do extremely well in every imaginable field. Access to an education at selective colleges and universities is now more available than ever to low- and middle-income families. We have built endowments from donations by alumni(校友) and parents who understand and appreciate our mission to provide access and opportunity, and a significant portion of the returns from these endowments is used to fund financial aid. Ironically, the new tax on endowments drains financial aid funds from the very schools most able to offer opportunity to those who have earned a spot but cannot otherwise afford this education. Beyond the virtue of access to those who have earned a place at these schools, the diversity of economic backgrounds enhances the education and experience of all of our students.', NULL, NULL, 448, 'IMPORT', 'cet6-2022-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2022-06-1-r3'
);
SET @pg_cet6_2022_06_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2022-06-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-r4', 'CAREFUL_READING', 'CET6', NULL, 'When a group of Australians was asked why they believed climate change was not happening, about 36% said it was "common sense", according to a report published last year by the Commonwealth Scientific and Industrial Research Organization. This was the most popular reason for their opinion, with only 11% saying their belief that climate change was not happening was based on scientific research. But what do we mean by an appeal to common sense? Presumably it''s an appeal to rationality of some sort that forms the basis of more complex reasoning. The appeal to common sense, however, is usually nothing more than an appeal to thinking that just feels right, but what feels right to one person may not feel right to another. Whether it feels right is usually a reflection of the world view and ideologies we have internalised, and that frames how we interact with new ideas. When new ideas are in accord with what we already believe, they are more readily accepted. When they are not, they, and the arguments that lead to them, are more readily rejected. We often mistake this automatic compatibility testing of new ideas with existing beliefs as an application of common sense, but, in reality, it is more about judging than thinking. As Nobelist Daniel Kahneman notes in Thinking, Fast and Slow, when we arrive at conclusions in this way, the outcomes also feel true, regardless of whether they are. We are not psychologically well equipped to judge our own thinking. We are also highly susceptible to a range of cognitive biases such as giving preference to the first things that come to mind when making decisions or giving weight to evidence. One way we can check our internal biases and inconsistencies is through the social verification of knowledge, in which we test our ideas in a rigorous and systematic way to see if they make sense not just to us, but to other people. The outstanding example of this socially shared cognition is science. That does not mean that individuals are not capable of excellent thinking, nor does it mean no individual is rational. But the extent to which individuals can do this on their own is a function of how well integrated they are with communities of systematic inquiry in the first place. You can''t learn to think well by yourself. In matters of science at least, those who value their common sense over methodological, collaborative investigation imagine themselves to be more free in their thinking, unbound by involvement with the group, but in reality they are tightly bound by their capabilities and perspectives. We are smarter together than we are individually, and perhaps that''s just common sense.', NULL, NULL, 448, 'IMPORT', 'cet6-2022-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2022-06-1-r4'
);
SET @pg_cet6_2022_06_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2022-06-1-r4' LIMIT 1);

-- 翻译 cet6-2022-06-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-translation'
);
SET @q_cet6_2022_06_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_01, '卢沟桥位于天安门广场西南15公里处，横跨永定河，是北京现存最古老的多拱石桥。卢沟桥最初建成于1192年，1698年重建，由281根柱子支撑。每根柱子上都有一头石狮。这些石狮的头、背、腹部或爪子上都藏着更多的狮子。这些石狮生动逼真、千姿百态，是卢沟桥石刻艺术的精品。桥上的石狮不计其数，因而北京地区流传着"卢沟桥上的石狮子——数不清"的说法。 卢沟桥不仅以其美学特征闻名于世，还被公认为石桥建筑史上的一座丰碑。', NULL, 'Located 15 kilometres southwest of Tian''anmen Square and spanning the Yongding River, Lugou Bridge is the oldest existing multi-arch stone bridge in Beijing. It was first built in 1192 and rebuilt in 1698, and is supported by 281 pillars. On each pillar stands a stone lion, and on the heads, backs, bellies or paws of these stone lions are hidden even more lions. Vivid and lifelike and varying in posture, these stone lions are regarded as the finest works of stone carving on Lugou Bridge. The stone lions on the bridge are too numerous to count, so there is a popular saying in the Beijing area: "The stone lions on Lugou Bridge are simply countless." Lugou Bridge is not only world-famous for its aesthetic features but also widely recognized as a monument in the history of stone bridge construction.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_01
);

-- 听力 Q1 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q01', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q01'
);
SET @q_cet6_2022_06_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_02, NULL, '{"A":"A) He is a staff writer.","B":"B) He is an adventurer.","C":"C) He is an author of fiction.","D":"D) He is a father of four kids."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_02
);

-- 听力 Q2 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q02', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q02'
);
SET @q_cet6_2022_06_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_03, NULL, '{"A":"A) They are interested in fairy tales.","B":"B) They are curious and autonomous.","C":"C) They are a headache to their parents.","D":"D) They are ignorant of politics."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_03
);

-- 听力 Q3 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q03', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q03'
);
SET @q_cet6_2022_06_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_04, NULL, '{"A":"A) He offers them ample editorial guidance.","B":"B) He recommends model essays to them.","C":"C) He gives them encouragement.","D":"D) He teaches them proofreading."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_04
);

-- 听力 Q4 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q04', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q04'
);
SET @q_cet6_2022_06_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_05, NULL, '{"A":"A) Her tastes in books changed.","B":"B) She realized the power of reading.","C":"C) Her reading opened her eyes to the world.","D":"D) She began to perceive the world differently."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_05
);

-- 听力 Q5 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q05', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q05'
);
SET @q_cet6_2022_06_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_06, NULL, '{"A":"A) She is a website designer.","B":"B) She is a university graduate.","C":"C) She is a main street store owner.","D":"D) She is a successful entrepreneur."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_06
);

-- 听力 Q6 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q06', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q06'
);
SET @q_cet6_2022_06_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_07, NULL, '{"A":"A) They were repeatedly rejected by shops.","B":"B) They were popular with her classmates.","C":"C) They showed her natural talent.","D":"D) They were mostly failures."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_07
);

-- 听力 Q7 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q07', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q07'
);
SET @q_cet6_2022_06_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_08, NULL, '{"A":"A) She had a strong interest in doing it.","B":"B) She did not like ready-made clothes.","C":"C) She could not find clothes of her size.","D":"D) She found clothes in shops unaffordable."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q08', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q08'
);
SET @q_cet6_2022_06_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_09, NULL, '{"A":"A) Study fashion design at college.","B":"B) Improve her marketing strategy.","C":"C) Add designs for women.","D":"D) Expand her business."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_09
);

-- 听力 Q9 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q09', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q09'
);
SET @q_cet6_2022_06_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_10, NULL, '{"A":"A) Utilizing artificial intelligence to find a powerful new antibiotic.","B":"B) Discovering bacteria which are resistant to all known antibiotics.","C":"C) Identifying bacterial strains that are most harmful to human health.","D":"D) Removing a deadly strain of bacteria in humans with a new antibiotic."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_10
);

-- 听力 Q10 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q10', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q10'
);
SET @q_cet6_2022_06_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_11, NULL, '{"A":"A) Ever-increasing strains of bacteria.","B":"B) Bacteria''s resistance to antibiotics.","C":"C) The similarity between known drugs.","D":"D) The growing threat of bacteria to health."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_11
);

-- 听力 Q11 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q11', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q11'
);
SET @q_cet6_2022_06_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_12, NULL, '{"A":"A) Dispense with experimental testing.","B":"B) Predict whether compounds are toxic.","C":"C) Foresee human reaction to antibiotics.","D":"D) Combat bacteria''s resistance to antibiotics."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_12
);

-- 听力 Q12 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q12', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q12'
);
SET @q_cet6_2022_06_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_13, NULL, '{"A":"A) By theorization.","B":"B) By generalization.","C":"C) By observation.","D":"D) By conversation."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_13
);

-- 听力 Q13 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q13', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q13'
);
SET @q_cet6_2022_06_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_14, NULL, '{"A":"A) They are easy to detect.","B":"B) They are well intended.","C":"C) They are groundless.","D":"D) They are harmless."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_14
);

-- 听力 Q14 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q14', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q14'
);
SET @q_cet6_2022_06_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_15, NULL, '{"A":"A) Mostly by chance.","B":"B) Basically objective.","C":"C) Subject to their mental alertness.","D":"D) Dependent on their analytical ability."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_15
);

-- 听力 Q15 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q15', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q15'
);
SET @q_cet6_2022_06_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_16, NULL, '{"A":"A) Looking the speaker in the eye.","B":"B) Listening carefully to the speaker.","C":"C) Measuring the speaker''s breathing rate.","D":"D) Focusing on the speaker''s facial expressions."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_16
);

-- 听力 Q16 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q16', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q16'
);
SET @q_cet6_2022_06_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_17, NULL, '{"A":"A) They don''t treat patients with due respect.","B":"B) They witness a lot of doctor-patient conflicts.","C":"C) They have to deal with social workers'' strikes.","D":"D) They don''t care how much patients have to pay."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_17
);

-- 听力 Q17 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q17', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q17'
);
SET @q_cet6_2022_06_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_18, NULL, '{"A":"A) Appear submissive and grateful to doctors and nurses.","B":"B) Express a strong desire to be consulted or informed.","C":"C) Refrain from saying anything that sounds negative.","D":"D) Note down the names of all the doctors and nurses."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_18
);

-- 听力 Q18 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q18', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q18'
);
SET @q_cet6_2022_06_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_19, NULL, '{"A":"A) Cooperative.","B":"B) Appreciative.","C":"C) Passive.","D":"D) Responsive."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_19
);

-- 听力 Q19 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q19', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q19'
);
SET @q_cet6_2022_06_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_20, NULL, '{"A":"A) Its members work together despite risks of failure.","B":"B) It prioritizes recruiting young energetic members.","C":"C) Its members stay in touch even after it breaks up.","D":"D) It grows more and more mature professionally."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_20
);

-- 听力 Q20 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q20', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q20'
);
SET @q_cet6_2022_06_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_21, NULL, '{"A":"A) Their differences are likely to impact productivity.","B":"B) Their similarity is conducive to future collaboration.","C":"C) Their connections strengthen with the passage of time.","D":"D) Their mutual understanding stems from a common goal."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_21
);

-- 听力 Q21 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q21', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q21'
);
SET @q_cet6_2022_06_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_22, NULL, '{"A":"A) It is characterized by diversity.","B":"B) Its goals are quite inconsistent.","C":"C) Its members have similar backgrounds.","D":"D) It is connected by a unique mechanism."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_22
);

-- 听力 Q22 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q22', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q22'
);
SET @q_cet6_2022_06_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_23, NULL, '{"A":"A) Putting aside twenty percent of one''s earnings.","B":"B) Spending in anticipation of becoming wealthy.","C":"C) Living off a small proportion of one''s income.","D":"D) Saving as much as one can possibly manage."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_23
);

-- 听力 Q23 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q23', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q23'
);
SET @q_cet6_2022_06_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_24, NULL, '{"A":"A) It empowers them to cope with irrational emotions.","B":"B) It will guarantee the profits from their investments.","C":"C) It will turn them into successful financial planners.","D":"D) It enables them to focus on long-term investments."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_24
);

-- 听力 Q24 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q24', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q24'
);
SET @q_cet6_2022_06_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_25, NULL, '{"A":"A) They count on others to take the responsibility.","B":"B) They change their investment strategy in time.","C":"C) They think they themselves are to blame.","D":"D) They persist rather than get discouraged."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_25
);

-- 听力 Q25 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q25', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q25'
);
SET @q_cet6_2022_06_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_26, NULL, '{"A":"A) They do not resist novel lifestyles.","B":"B) They do not try to keep up with others.","C":"C) They do not care what they have acquired.","D":"D) They do not pressure themselves to get rich."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q26'
);
SET @q_cet6_2022_06_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_27, NULL, '{"A":"A) aesthetically","B":"B) constructed","C":"C) designates","D":"D) extract","E":"E) flocked","F":"F) incorporates","G":"G) legitimate","H":"H) natural","I":"I) offspring","J":"J) previous","K":"K) principally","L":"L) remedy","M":"M) rhetorically","N":"N) sneaked","O":"O) versatile"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q27'
);
SET @q_cet6_2022_06_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_28, NULL, '{"A":"A) aesthetically","B":"B) constructed","C":"C) designates","D":"D) extract","E":"E) flocked","F":"F) incorporates","G":"G) legitimate","H":"H) natural","I":"I) offspring","J":"J) previous","K":"K) principally","L":"L) remedy","M":"M) rhetorically","N":"N) sneaked","O":"O) versatile"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q28'
);
SET @q_cet6_2022_06_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_29, NULL, '{"A":"A) aesthetically","B":"B) constructed","C":"C) designates","D":"D) extract","E":"E) flocked","F":"F) incorporates","G":"G) legitimate","H":"H) natural","I":"I) offspring","J":"J) previous","K":"K) principally","L":"L) remedy","M":"M) rhetorically","N":"N) sneaked","O":"O) versatile"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q29'
);
SET @q_cet6_2022_06_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_30, NULL, '{"A":"A) aesthetically","B":"B) constructed","C":"C) designates","D":"D) extract","E":"E) flocked","F":"F) incorporates","G":"G) legitimate","H":"H) natural","I":"I) offspring","J":"J) previous","K":"K) principally","L":"L) remedy","M":"M) rhetorically","N":"N) sneaked","O":"O) versatile"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q30'
);
SET @q_cet6_2022_06_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_31, NULL, '{"A":"A) aesthetically","B":"B) constructed","C":"C) designates","D":"D) extract","E":"E) flocked","F":"F) incorporates","G":"G) legitimate","H":"H) natural","I":"I) offspring","J":"J) previous","K":"K) principally","L":"L) remedy","M":"M) rhetorically","N":"N) sneaked","O":"O) versatile"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q31'
);
SET @q_cet6_2022_06_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_32, NULL, '{"A":"A) aesthetically","B":"B) constructed","C":"C) designates","D":"D) extract","E":"E) flocked","F":"F) incorporates","G":"G) legitimate","H":"H) natural","I":"I) offspring","J":"J) previous","K":"K) principally","L":"L) remedy","M":"M) rhetorically","N":"N) sneaked","O":"O) versatile"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q32'
);
SET @q_cet6_2022_06_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_33, NULL, '{"A":"A) aesthetically","B":"B) constructed","C":"C) designates","D":"D) extract","E":"E) flocked","F":"F) incorporates","G":"G) legitimate","H":"H) natural","I":"I) offspring","J":"J) previous","K":"K) principally","L":"L) remedy","M":"M) rhetorically","N":"N) sneaked","O":"O) versatile"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q33'
);
SET @q_cet6_2022_06_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_34, NULL, '{"A":"A) aesthetically","B":"B) constructed","C":"C) designates","D":"D) extract","E":"E) flocked","F":"F) incorporates","G":"G) legitimate","H":"H) natural","I":"I) offspring","J":"J) previous","K":"K) principally","L":"L) remedy","M":"M) rhetorically","N":"N) sneaked","O":"O) versatile"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q34'
);
SET @q_cet6_2022_06_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_35, NULL, '{"A":"A) aesthetically","B":"B) constructed","C":"C) designates","D":"D) extract","E":"E) flocked","F":"F) incorporates","G":"G) legitimate","H":"H) natural","I":"I) offspring","J":"J) previous","K":"K) principally","L":"L) remedy","M":"M) rhetorically","N":"N) sneaked","O":"O) versatile"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q35'
);
SET @q_cet6_2022_06_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_36, NULL, '{"A":"A) aesthetically","B":"B) constructed","C":"C) designates","D":"D) extract","E":"E) flocked","F":"F) incorporates","G":"G) legitimate","H":"H) natural","I":"I) offspring","J":"J) previous","K":"K) principally","L":"L) remedy","M":"M) rhetorically","N":"N) sneaked","O":"O) versatile"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q36'
);
SET @q_cet6_2022_06_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_37, 'Some children on the remote islands won''t eat their meals because they are fed cheap junk food.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q37'
);
SET @q_cet6_2022_06_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_38, 'Unlike other parts of Bangladesh, the number of women who die from giving birth remains high on the river islands.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q38'
);
SET @q_cet6_2022_06_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_39, 'One big problem many islanders have is that they can''t afford the prescribed medicines, even with discounts offered.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q39'
);
SET @q_cet6_2022_06_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_40, 'TD is a virtual medical service financially supported by one of the nation''s nonprofit organizations.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q40'
);
SET @q_cet6_2022_06_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_41, 'TD doctors are welcome to the islanders because they treat the sick with respect and patience.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q41'
);
SET @q_cet6_2022_06_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_42, 'Women islanders tend to have health problems early partly because they get married and give birth early.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q42'
);
SET @q_cet6_2022_06_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_43, 'TD doctors make weekly visits to the remote islands to provide services at a temporary medical center.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q43'
);
SET @q_cet6_2022_06_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_44, 'TD doctors provide the islanders with online diagnoses and treatments for common diseases.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q44'
);
SET @q_cet6_2022_06_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_45, 'The residents of the river islands have to keep moving their homes because of floods and land erosions.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q45'
);
SET @q_cet6_2022_06_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_46, 'Women islanders usually rely on their husbands to get some medicines for them without diagnoses and prescriptions.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q46'
);
SET @q_cet6_2022_06_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_47, 'What fact does the author emphasize concerning selective colleges and universities?', '{"A":"A) They have been ignoring the training of graduates for the world of work.","B":"B) They have been doing well in ensuring their students a successful future.","C":"C) They have been constantly attacked for being too elite and too expensive.","D":"D) They have been actively engaged in civic life beyond the school campus."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q47'
);
SET @q_cet6_2022_06_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_48, 'What does the author say in arguing for the model of education in the U.S.?', '{"A":"A) It has contributed substantially to the nation''s overall development.","B":"B) It has succeeded in maintaining sustainable financial aid programs.","C":"C) It has given priority to innovative programs for graduate studies.","D":"D) It has played a central role in attracting international applicants."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q48'
);
SET @q_cet6_2022_06_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_49, 'What do we learn about the initial proposals concerning the recent tax reform bill?', '{"A":"A) They would have stripped many students of life''s chances.","B":"B) They would have deducted graduate student loan interest.","C":"C) They would have added to many students'' financial burden.","D":"D) They would have increased the number of tuition waivers."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q49'
);
SET @q_cet6_2022_06_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_50, 'What do the data show about elite colleges and universities?', '{"A":"A) Their graduates lack the rigor required for doing statistical analysis.","B":"B) Their students prove to be inadequately prepared for their future careers.","C":"C) Their focus on research is conducive to developing students'' critical thinking.","D":"D) Their liberal arts education enables graduates to excel in whatever field they are in."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q50'
);
SET @q_cet6_2022_06_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_51, 'What is an advantage of providing financial aid for students?', '{"A":"A) Every student can choose the institution they wish to attend.","B":"B) All students can benefit from a diversified student population.","C":"C) All students will be able to earn a place on university campus.","D":"D) Less privileged students will be more competitive at elite schools."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q51'
);
SET @q_cet6_2022_06_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_52, 'What does the author intend to show by citing the findings from the report published last year?', '{"A":"A) People seldom appeal to rationality in their thinking.","B":"B) It is often the case that truth lies in the hands of a few.","C":"C) Common sense and science are the two sides of a coin.","D":"D) Few people know if climate change is really happening."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q52'
);
SET @q_cet6_2022_06_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_53, 'What is the appeal to common sense according to the author?', '{"A":"A) It is the basis for the internalisation of individuals'' ideologies.","B":"B) It is a series of conceptions formulated from complex reasoning.","C":"C) It is collective wisdom that helps people interact with new ideas.","D":"D) It is something subjective based on what one perceives to be right."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q53'
);
SET @q_cet6_2022_06_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_54, 'What does Daniel Kahneman think is the problem of testing new ideas with existing beliefs?', '{"A":"A) It may lead to incorrect judgment.","B":"B) It makes no use of common sense.","C":"C) It fails to correct mistakes through serious reasoning.","D":"D) It can produce psychologically unacceptable outcomes."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q54'
);
SET @q_cet6_2022_06_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_55, 'What can we do to be less susceptible to cognitive biases?', '{"A":"A) Give equal weight to evidence of both sides in a conflict.","B":"B) Provide convincing examples in developing an argument.","C":"C) Establish socially shared cognition via scientific methods.","D":"D) Avoid inconsistencies when addressing controversial issues."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-06-1-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q55'
);
SET @q_cet6_2022_06_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-06-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_06_1_56, 'What message does the author try to convey at the end of the passage?', '{"A":"A) Multiple perspectives stimulate people''s interest in exploring the unknown.","B":"B) Individuals can enhance their overall capabilities by interacting with others.","C":"C) Individuals should think freely to break from the restrictions of common sense.","D":"D) Collaborative efforts can overcome individuals limitations in scientific inquiry."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_06_1_56
);

-- ==================== cet6-2022-09-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-r1', 'BANKED_CLOZE', 'CET6', NULL, 'The now extinct passenger pigeon has the dubious honor of being the last species anyone ever expected to disappear. At one point, there were more passenger pigeons than any other species of bird. Rough __26__ of their population went as high as five billion and they accounted for around 40 percent of the total indigenous bird population of North America in the early 19th century. Despite their huge population, passenger pigeons were __27__ to human intrusion into their nesting territory. Their nests were shabby things and two weeks after the eggs __28__ , the parent pigeons would abandon their offspring, leaving them to take care of themselves. People discovered that these baby pigeons were really tasty, and the adult birds were also quite __29__ . First the Native Americans and then the transplanted Europeans came to consider the birds a great __30__ . By the 1850s, commercial trapping of passenger pigeons was proceeding at an __31__ pace. Hundreds of thousands of the birds were being harvested every day to be made into popular pigeon pies. In addition, large __32__ of the pigeons'' nesting territory were being cleared away for planting crops and creating pasture land. As numerous as the passenger pigeons were, they were not an __33__ resource. By the 1880s, it was noticed that the bird population had become seriously __34__ . The last passenger pigeons killed in the wild were shot in 1899. Eventually those billions and billions of birds shrank to a single remaining __35__ , a passenger pigeon named Martha, who died on September 1,1914, in captivity at the Cincinnati Zoo. In addition to being the end of an era, it was also the first time humans were able to exactly time the extinction of a species.', NULL, '["A) vulnerable","B) unprecedented","C) tracts","D) specimen","E) robust","F) refuge","G) plazas","H) infinite","I) hatched","J) expired","K) excerpts","L) estimates","M) edible","N) depleted","O) delicacy"]', 291, 'IMPORT', 'cet6-2022-09-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2022-09-1-r1'
);
SET @pg_cet6_2022_09_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2022-09-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-r2', 'MATCHING', 'CET6', 'Is computer coding a foreign language?', 'A) As computer coding has become an increasingly sought-after skill, more K-12 schools are working it into their curriculums. Some states have considered allowing students to forgo(放弃) foreign language for coding classes, despite opposition from educators. B) There''s a debate over whether it''s appropriate to teach coding in elementary schools, with fierce opinions on each side. When it comes to allowing coding to fill foreign language requirements, though, most educators agree: Coding should be added to curriculums, but not at the expense of foreign language classes. C) The idea is that computer programming is a language, allowing people to communicate with machines and programs. It''s the language of the 21st century and more valuable than a natural language, some advocates argue. The computer science field is growing faster than schools can keep up because of budget constraints and a lack of skills training for teachers. D) According to the 2016 U.S. News/Raytheon STEM Index, computer science jobs have helped boost wages in the U.S., and computer-related jobs hold the top seven positions in STEM fields for highest number of workers. Foreign language interest, on the other hand, is declining for the first time since 1995. The number of higher education language enrollments declined between 2009 and 2013 by more than 111,000 spots, according to the Modern Language Association of America. E) "I think the opportunity to give people a choice is important," says Florida state Senator Jeremy Ring, who introduced a bill last year that would allow Florida students to choose between foreign language and coding classes for the purpose of university admissions requirements, "I think if you''re going to give two years of language in high school, you might as well do computer coding." F) The Florida bill died this year after passing 35:5 in the state Senate when the full Legislature failed to take action. It would have been the first state to try this initiative. Ring says that although he will be out of office, an identical bill will be reintroduced within the next year by others on his behalf. "In the speech I gave on the Senate floor, I said, ''We can be the first state to do this, or we can be the 50th state to do it. It''s our choice. It''s going to happen,''" Ring says. G) A Kentucky bill similar to the one in Florida was met with complaints from educators, and was then amended to promote computer science education initiatives with no mention of foreign language requirements. Instead, the state will provide support for higher quality certified teachers for programming classes. Under the Washington bill, public universities would accept two years of computer science classes in place of two years of foreign language for admission purposes. A report detailing the opinions of state university officials is due to the Legislature by November 2017. H) Texas passed a bill in 2013 that allows students to substitute computer coding only after they have attempted and performed poorly in a foreign language class. Srini Mandyam, CTO and co-founder of kid-friendly instructional coding company Tynker, believes allowing students to forgo foreign language because they struggle with it is unproductive because every subject, whether art, math or language, is a significant contribution to a well-rounded existence. "Many students don''t fare well with algebra but we never discuss eliminating it or … say chemistry is now counted as an algebra class," he said via email. "We teach algebra because it''s important and we should teach foreign language and coding for the same reason. Exposure to a wide breadth of subjects and material results in well-rounded students who are able to make informed decisions … about what they want to pursue." I) Computer science courses already fulfill a math or science high school graduation requirement in 28 states and the District of Columbia, up from only 12 states in 2013. And while advocates of the bills say they should count as foreign language instead, opponents stress the importance of balancing computer and foreign language skills. J) Studies show that bilingualism(双语) correlates with cognitive development, intelligence, memory and problem solving abilities, according to the American Council on the Teaching of Foreign Languages. A 2007 study showed that foreign language students outperformed their non-foreign language peers on standardized tests after only two to three years of study. And while a 2014 report from German and American universities suggests that programmers are using language (but not mathematical) regions of the brain when understanding code, critics remain wary. They say that regardless of cognitive functions, being monolingual is a disadvantage in the increasingly international economy, even if English has become the de facto(事实上的) language of business. K) "Our world is shrinking but its problems are really growing," says ACTFL National Language Teacher of the Year Ted Zarrow, who teaches high school Latin in Westwood, Massachusetts, and has also studied Spanish, French, German, Italian and Greek. "We need to find a way to put ourselves at the global table and to treat each other with mutual respect. And learning languages allows us to do that because language is not part of culture, language is culture." L) Even with the benefits and skill sets languages provide, recruiters and employers value computer skills more. According to the National Association of Colleges and Employers'' 2016 report, study abroad and foreign language fluency were not very influential in the employee hiring processes, but 55 percent of employers looked for computer skills on applicants'' resumes. However, although 2016 computer science graduates can expect to make the second highest starting salary compared with other jobs this year, the Bureau of Labor predicts the demand for computer programmers will decrease 8 percent or by 26,500 jobs by 2024. M) Ring says foreign language skills are important, but expresses doubt that school districts could work both coding and language into their curriculum in a significant way because they lack the time in the school day. "Nothing against language," he says. "I just think it''s something you have to start early and not just have something that you do for a couple of years in high school," he says. N) Zarrow agrees that foreign language education should begin earlier, but says it is possible to work both computer programming and foreign language learning into schools evenly. He suggests an immersive, dual language program where students spend half the day in English and half the day in another language, as several schools around the country have successfully implemented. "The study of language fosters a respect for diversity, a respect for ethnicity and really a respect for language," Zarrow says. O) Though the benefits of computer programming skills are vast, foreign language and coding experts agree that computer science should be negotiated into curriculums rather than replacing foreign language outright. Mandyam says the two skill sets are essential but unrelated. "Coding is an incredibly important 21st century skill for our kids to learn, and that''s why we spend so much time trying to teach it," Mandyam says via email. "But I believe it is the same as or even really comparable to learning a foreign language. It would be a shame to lose something so important for the sake of adding something else, even something as important as coding. Clearly, education leaders must figure out a way to teach both."', NULL, NULL, 1215, 'IMPORT', 'cet6-2022-09-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2022-09-1-r2'
);
SET @pg_cet6_2022_09_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2022-09-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-r3', 'CAREFUL_READING', 'CET6', NULL, 'The U.S. and China don''t agree on much these days. Germany and France share a border and a currency but are frequently at odds. The U.K. and India like to march to their own drum. But there''s one issue on which all these countries see eye to eye: Technology companies are too big, too powerful, and too profitable. And that power is only likely to intensify, leaving governments with no choice but to confront it head-on by taking the companies to court, passing new competition laws, and perhaps even breaking up the tech giants. China is the latest to implement an anti-trust crackdown, unveiling anti-monopoly rules last month. The draft rules followed the surprise suspension of a $37 billion stock offering by billionaire Jack Ma''s Ant Group Co., making clear that no company can evade the government''s regulation. The moves in China coincide with accelerating efforts in the U.S. and Europe to rein in Amazon.com, Apple, Facebook, and Google. "The big get bigger and bigger but without being better," says Andreas Schwab, a German member of the European Parliament who championed a 2014 resolution to break up Google. "Growing economic power, growing influence on local markets all over the world, and a growing concern of competitors and consumers altogether have made it happen now." In this new anti-trust era, the old focus on pricing power no longer applies, because several of the biggest tech companies have established trillion-dollar monopolies by charging consumers next to nothing. Tech giants are increasingly assuming powerful positions in banking, finance, advertising, retail, and other markets that force smaller businesses to rely on their platforms to reach customers. For years, Europe alone confronted the power of digital giants. Governments were alarmed that European companies were failing to match Silicon Valley''s innovations or to stop Google and Facebook from vacuuming up personal data and, with that, advertising revenue. Led by Margrethe Vestager, the European Union''s competition chief, countries have sought to police the market and encourage fair play. In China the crackdown has been driven at least partly by fear that the homegrown tech industry is becoming too powerful. The country has long championed Alibaba and Tencent, but their massive accumulation of data on the Chinese citizenry is a growing concern for Beijing. In the U.S., a new breed of anti-trust experts argues that consideration should be given to privacy, control over data, workers'' rights, and the overall impact on smaller companies. And the public in general has grown increasingly skeptical of social media companies. More than 60% say the sector has a negative effect on the country, and almost half want more regulation for social media, according to a 2020 Pew Research Center study.', NULL, NULL, 448, 'IMPORT', 'cet6-2022-09-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2022-09-1-r3'
);
SET @pg_cet6_2022_09_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2022-09-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-r4', 'CAREFUL_READING', 'CET6', NULL, 'Born from the accessibility of mass air travel, modern international tourism has been popularized as "holiday-making" in regions that offer comparative advantages of sand, sun and sea. Travel is often portrayed as a tool for personal growth and tourism as an economic motor for destination countries and cities. There is a tendency to assume that tourism is good for everyone involved. Today the big bang of tourism drives over 1.2 billion tourists across international borders annually. Many popular places are literally being loved to death. Recent protests in ports of call like Venice and Barcelona against disturbances created by cruise ships show the unfortunate consequences of emphasizing quantity over quality in tourism. Uncontrolled tourism development has become a primary driver of social and environmental disruption. Tourism studies provide much documentation of the many negative social impacts of tourism and resulting resentment that local populations direct toward visitors. Antagonism toward tourists typically develops in mature, heavily visited destinations. Protests in heavily visited destinations suggest that traditional tourism has overstayed its welcome. Residents often become frustrated when the benefits of tourism are not felt locally. Although it can generate foreign exchange, income and employment, there''s no guarantee that multinational hotel chains will allocate these benefits equitably among local communities. On the contrary, when people stay at large resorts or on cruise ships, they make most of their purchases there, leaving local communities little opportunity to benefit from tourist spending. These forms of tourism widen economic and political gaps between haves and have-nots at local destinations. In recent decades, local residents in destination communities also have found themselves negotiating new cultural boundaries, class dynamics, service industry roles and lifestyle transformations. For example, data show that tourism activity corresponds to increased social problems as local residents adopt the behaviors of tourists. What does all this mean for the everyday traveler? First, all tourists should make every effort to honor their hosts and respect local conditions. This means being prepared to adapt to local customs and norms, rather than expecting local conditions to adapt to travelers. Second, tourism is a market-based activity and works best when consumers reward better performers. In the information age, there''s little excuse for travelers being uninformed about where their vacation money goes and who it enriches. Informed travelers also are better able to distinguish between multinational companies and local entrepreneurs whose businesses provide direct social, environmental, and economic benefits for local residents. Such businesses are in love with the destination and are therefore deserving of market reward. In the long run, being a responsible traveler means ensuring net positive impacts for local people and environments. With the information available at our fingertips, there has never been more opportunity to do so.', NULL, NULL, 451, 'IMPORT', 'cet6-2022-09-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2022-09-1-r4'
);
SET @pg_cet6_2022_09_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2022-09-1-r4' LIMIT 1);

-- 翻译 cet6-2022-09-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-translation'
);
SET @q_cet6_2022_09_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_01, '贴春联 (Spring Festival couplets) 是中国人欢度春节的一个重要习俗。春联由一对诗句和四字横批(horizontal scroll) 组成，诗句和横批用金色或黑色写在红纸上，红色代表幸运， 金色代表财富。春联贴在大门左右两侧和门框上方。春联的诗句体现中国传统诗词的特点， 两句诗的字数相同、内容相关。横批凸显春联的主题，更是锦上添花。春联以简洁的文字描绘生动的形象，抒发美好的愿望。当家家户户贴春联时，人们就会意识到春节己经正式拉开序幕。', NULL, 'Pasting Spring Festival couplets is an important custom for Chinese people during the Spring Festival. A Spring Festival couplet consists of a pair of poetic lines and a four-character horizontal scroll. Both the lines and the scroll are written in gold or black on red paper, with red symbolizing good luck and gold symbolizing wealth. The couplets are pasted on both sides of the door and above the doorframe. The poetic lines reflect the features of traditional Chinese poetry: the two lines have the same number of characters and are related in content. While the horizontal scroll highlights the theme of the couplet, it also adds the finishing touch. With concise words, Spring Festival couplets depict vivid images and express good wishes. Finally, when every household pastes Spring Festival couplets, people realize that the Spring Festival has officially begun.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_01
);

-- 听力 Q1 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q01', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q01'
);
SET @q_cet6_2022_09_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_02, NULL, '{"A":"A) It enables people to earn more money.","B":"B) It teaches the importance of financing.","C":"C) It helps people with budgeting.","D":"D) It introduces a novel way to invest."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_02
);

-- 听力 Q2 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q02', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q02'
);
SET @q_cet6_2022_09_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_03, NULL, '{"A":"A) Many Americans are not satisfied with their income.","B":"B) Many Americans have no idea about how to invest.","C":"C) Most Americans do not know how to save money.","D":"D) Most Americans do not stick to a budget."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_03
);

-- 听力 Q3 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q03', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q03'
);
SET @q_cet6_2022_09_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_04, NULL, '{"A":"A) Keep track of his money.","B":"B) Live within his means.","C":"C) Find more sources of income.","D":"D) Refrain from buying luxuries."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_04
);

-- 听力 Q4 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q04', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q04'
);
SET @q_cet6_2022_09_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_05, NULL, '{"A":"A) It offers a greater variety of items.","B":"B) It helps avoid unnecessary spending.","C":"C) It changes one''s way of living.","D":"D) It saves one''s time for shopping."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_05
);

-- 听力 Q5 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q05', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q05'
);
SET @q_cet6_2022_09_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_06, NULL, '{"A":"A) It is brand-new.","B":"B) It has plenty of rooms.","C":"C) It belongs to her mother.","D":"D) It has been vacant for months."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_06
);

-- 听力 Q6 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q06', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q06'
);
SET @q_cet6_2022_09_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_07, NULL, '{"A":"A) Space.","B":"B) Tranquillity.","C":"C) Appliances.","D":"D) Location."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_07
);

-- 听力 Q7 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q07', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q07'
);
SET @q_cet6_2022_09_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_08, NULL, '{"A":"A) Talk to his wife about the contract terms.","B":"B) Pay the first month''s rent and a deposit.","C":"C) Check the references of the flat owner.","D":"D) Consult his solicitor one more time."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q08', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q08'
);
SET @q_cet6_2022_09_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_09, NULL, '{"A":"A) She can have a wonderful view of the pond.","B":"B) She will be much closer to her work place.","C":"C) She can make friends with new neighbours.","D":"D) She will have plenty of space for her shoes."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_09
);

-- 听力 Q9 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q09', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q09'
);
SET @q_cet6_2022_09_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_10, NULL, '{"A":"A) The more commercials they see, the more brands they get to know.","B":"B) The more commercials they see, the more they adore celebrities.","C":"C) The more television they watch, the fewer conflicts in the family.","D":"D) The more television they watch, the greater their parents'' stress."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_10
);

-- 听力 Q10 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q10', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q10'
);
SET @q_cet6_2022_09_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_11, NULL, '{"A":"A) Inform children of the family''s financial situation.","B":"B) Shift children''s attention to interesting activities.","C":"C) Involve children in making purchasing decisions.","D":"D) Help children understand advertising''s intent."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_11
);

-- 听力 Q11 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q11', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q11'
);
SET @q_cet6_2022_09_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_12, NULL, '{"A":"A) Their limited cognitive ability.","B":"B) Their strong natural curiosity.","C":"C) Their admiration for celebrities.","D":"D) Their lack of social experience."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_12
);

-- 听力 Q12 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q12', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q12'
);
SET @q_cet6_2022_09_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_13, NULL, '{"A":"A) Bad guys may do good deeds.","B":"B) Bad guys may go unpunished.","C":"C) Good guys may not always cooperate.","D":"D) Good guys may get unfair treatment."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_13
);

-- 听力 Q13 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q13', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q13'
);
SET @q_cet6_2022_09_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_14, NULL, '{"A":"A) By what we do.","B":"B) By fair evaluation.","C":"C) In comparison with others.","D":"D) In accordance with set standards."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_14
);

-- 听力 Q14 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q14', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q14'
);
SET @q_cet6_2022_09_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_15, NULL, '{"A":"A) Learn from them earnestly.","B":"B) Compete with them actively.","C":"C) Leave them alone temporarily.","D":"D) Cooperate with them sincerely."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_15
);

-- 听力 Q15 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q15', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q15'
);
SET @q_cet6_2022_09_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_16, NULL, '{"A":"A) Being dismissed as hypocritical.","B":"B) Not getting the reward they deserve.","C":"C) Having to make too many sacrifices.","D":"D) Being misunderstood by people around."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_16
);

-- 听力 Q16 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q16', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q16'
);
SET @q_cet6_2022_09_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_17, NULL, '{"A":"A) They are increasingly aware of gender differences.","B":"B) They engage themselves in positive recollection.","C":"C) They begin to see the importance of friendship.","D":"D) They make friends with peers of the same sex."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_17
);

-- 听力 Q17 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q17', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q17'
);
SET @q_cet6_2022_09_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_18, NULL, '{"A":"A) Competing for position.","B":"B) Forging close ties with friends.","C":"C) Pursuing fashion.","D":"D) Fulfilling family obligations."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_18
);

-- 听力 Q18 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q18', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q18'
);
SET @q_cet6_2022_09_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_19, NULL, '{"A":"A) They prioritize romance over friendship.","B":"B) They try to strengthen same-sex friendships.","C":"C) They begin to take friendship more seriously.","D":"D) They compete intensely for romantic partners."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_19
);

-- 听力 Q19 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q19', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q19'
);
SET @q_cet6_2022_09_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_20, NULL, '{"A":"A) They regard it as a matter of sheer privacy.","B":"B) They are worried about being turned down.","C":"C) They fear that their condition will be made widely known.","D":"D) They are afraid to be discriminated against once recruited."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_20
);

-- 听力 Q20 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q20', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q20'
);
SET @q_cet6_2022_09_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_21, NULL, '{"A":"A) After receiving a job offer.","B":"B) During a job interview.","C":"C) When confirming an interview.","D":"D) Upon completing a cover letter."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_21
);

-- 听力 Q21 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q21', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q21'
);
SET @q_cet6_2022_09_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_22, NULL, '{"A":"A) Describe the true state of their health.","B":"B) Provide all the information required.","C":"C) Stress the irrelevance of their disability to the job.","D":"D) Avoid mentioning the name of their disability."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_22
);

-- 听力 Q22 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q22', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q22'
);
SET @q_cet6_2022_09_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_23, NULL, '{"A":"A) Their scores were least affected by music with speech.","B":"B) It was the poorest when there was background speech.","C":"C) Their scores were most depressed with instrumental music.","D":"D) It was disrupted by the sound of an air conditioner or fan."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_23
);

-- 听力 Q23 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q23', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q23'
);
SET @q_cet6_2022_09_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_24, NULL, '{"A":"A) It has to do with the type and volume of the background noise.","B":"B) It has to do with short-term memory for listening comprehension.","C":"C) It depends on the overlap in processing different kinds of information.","D":"D) It depends on the participants'' ability to concentrate on the task at hand."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_24
);

-- 听力 Q24 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q24', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q24'
);
SET @q_cet6_2022_09_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_25, NULL, '{"A":"A) Keep everything as quiet as possible.","B":"B) Play nothing but instrumental music.","C":"C) Use vocal material as little as possible.","D":"D) Wear a pair of earphones or headphones."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_25
);

-- 听力 Q25 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q25', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q25'
);
SET @q_cet6_2022_09_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_26, NULL, '{"A":"A) Sociable people were immune to all distractions.","B":"B) Shy quiet people were most adversely impacted.","C":"C) Less outgoing people were more affected by silence.","D":"D) Confident people were unaffected by high-arousal music."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q26'
);
SET @q_cet6_2022_09_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_27, NULL, '{"A":"A) vulnerable","B":"B) unprecedented","C":"C) tracts","D":"D) specimen","E":"E) robust","F":"F) refuge","G":"G) plazas","H":"H) infinite","I":"I) hatched","J":"J) expired","K":"K) excerpts","L":"L) estimates","M":"M) edible","N":"N) depleted","O":"O) delicacy"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q27'
);
SET @q_cet6_2022_09_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_28, NULL, '{"A":"A) vulnerable","B":"B) unprecedented","C":"C) tracts","D":"D) specimen","E":"E) robust","F":"F) refuge","G":"G) plazas","H":"H) infinite","I":"I) hatched","J":"J) expired","K":"K) excerpts","L":"L) estimates","M":"M) edible","N":"N) depleted","O":"O) delicacy"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q28'
);
SET @q_cet6_2022_09_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_29, NULL, '{"A":"A) vulnerable","B":"B) unprecedented","C":"C) tracts","D":"D) specimen","E":"E) robust","F":"F) refuge","G":"G) plazas","H":"H) infinite","I":"I) hatched","J":"J) expired","K":"K) excerpts","L":"L) estimates","M":"M) edible","N":"N) depleted","O":"O) delicacy"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q29'
);
SET @q_cet6_2022_09_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_30, NULL, '{"A":"A) vulnerable","B":"B) unprecedented","C":"C) tracts","D":"D) specimen","E":"E) robust","F":"F) refuge","G":"G) plazas","H":"H) infinite","I":"I) hatched","J":"J) expired","K":"K) excerpts","L":"L) estimates","M":"M) edible","N":"N) depleted","O":"O) delicacy"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q30'
);
SET @q_cet6_2022_09_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_31, NULL, '{"A":"A) vulnerable","B":"B) unprecedented","C":"C) tracts","D":"D) specimen","E":"E) robust","F":"F) refuge","G":"G) plazas","H":"H) infinite","I":"I) hatched","J":"J) expired","K":"K) excerpts","L":"L) estimates","M":"M) edible","N":"N) depleted","O":"O) delicacy"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q31'
);
SET @q_cet6_2022_09_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_32, NULL, '{"A":"A) vulnerable","B":"B) unprecedented","C":"C) tracts","D":"D) specimen","E":"E) robust","F":"F) refuge","G":"G) plazas","H":"H) infinite","I":"I) hatched","J":"J) expired","K":"K) excerpts","L":"L) estimates","M":"M) edible","N":"N) depleted","O":"O) delicacy"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q32'
);
SET @q_cet6_2022_09_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_33, NULL, '{"A":"A) vulnerable","B":"B) unprecedented","C":"C) tracts","D":"D) specimen","E":"E) robust","F":"F) refuge","G":"G) plazas","H":"H) infinite","I":"I) hatched","J":"J) expired","K":"K) excerpts","L":"L) estimates","M":"M) edible","N":"N) depleted","O":"O) delicacy"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q33'
);
SET @q_cet6_2022_09_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_34, NULL, '{"A":"A) vulnerable","B":"B) unprecedented","C":"C) tracts","D":"D) specimen","E":"E) robust","F":"F) refuge","G":"G) plazas","H":"H) infinite","I":"I) hatched","J":"J) expired","K":"K) excerpts","L":"L) estimates","M":"M) edible","N":"N) depleted","O":"O) delicacy"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q34'
);
SET @q_cet6_2022_09_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_35, NULL, '{"A":"A) vulnerable","B":"B) unprecedented","C":"C) tracts","D":"D) specimen","E":"E) robust","F":"F) refuge","G":"G) plazas","H":"H) infinite","I":"I) hatched","J":"J) expired","K":"K) excerpts","L":"L) estimates","M":"M) edible","N":"N) depleted","O":"O) delicacy"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q35'
);
SET @q_cet6_2022_09_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_36, NULL, '{"A":"A) vulnerable","B":"B) unprecedented","C":"C) tracts","D":"D) specimen","E":"E) robust","F":"F) refuge","G":"G) plazas","H":"H) infinite","I":"I) hatched","J":"J) expired","K":"K) excerpts","L":"L) estimates","M":"M) edible","N":"N) depleted","O":"O) delicacy"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q36'
);
SET @q_cet6_2022_09_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_37, 'Employers attach more importance to applicants'' computer skills than their language competence.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q37'
);
SET @q_cet6_2022_09_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_38, 'One U.S. state senator proposed that high school students be allowed to study either foreign language or computer coding.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q38'
);
SET @q_cet6_2022_09_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_39, 'Learning languages broadens students'' international perspective and nurtures mutual respect among peoples, according to a high school language teacher.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q39'
);
SET @q_cet6_2022_09_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_40, 'One U.S. state will see to it that programming classes are taught by quality teachers.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q40'
);
SET @q_cet6_2022_09_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_41, 'Statistics show while computer-related jobs have been on the rise, foreign languages have become less appealing to American students since mid-1990s.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q41'
);
SET @q_cet6_2022_09_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_42, 'All school subjects are said to be essential to students'' well-rounded development.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q42'
);
SET @q_cet6_2022_09_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_43, 'There is consensus among most educators that coding should be taught in schools but should not replace foreign language.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q43'
);
SET @q_cet6_2022_09_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_44, 'One study showed that foreign language learning improved students'' academic performance.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q44'
);
SET @q_cet6_2022_09_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_45, 'Being short of funding and qualified teachers, schools lag behind the fast developing computer science field.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q45'
);
SET @q_cet6_2022_09_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_46, 'A distinguished high school language teacher also believes it is advisable to start learning a foreign language at an earlier age.', NULL, 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q46'
);
SET @q_cet6_2022_09_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_47, 'What does the author say is the issue all major economic powers have to address?', '{"A":"A) How to ensure the sustainable growth of their tech giants.","B":"B) How to keep the competitiveness of their tech companies.","C":"C) How to break up the powerful giant tech companies.","D":"D) How to stop tech companies from gaining monopoly."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q47'
);
SET @q_cet6_2022_09_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_48, 'What does the suspension of Ant Group Co.''s stock offering suggest?', '{"A":"A) All attempts to evade regulation are doomed to failure.","B":"B) All attempts to monopolize sales must be cracked down.","C":"C) All companies must be regulated by the government.","D":"D) All companies, domestic or foreign, are created equal."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q48'
);
SET @q_cet6_2022_09_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_49, 'How are smaller companies impacted by tech giants'' business expansion?', '{"A":"A) They can no longer do business independent of tech giants.","B":"B) They are frequently denied access to tech giants'' platforms.","C":"C) They have to change marketing strategies to keep customers.","D":"D) They no longer have the power to price their own products."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q49'
);
SET @q_cet6_2022_09_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_50, 'What have EU countries done to confront the power of digital giants?', '{"A":"A) They have imposed strict regulation over digital giants'' advertising.","B":"B) They have considered regulatory action to promote fair competition.","C":"C) They have limited sales of digital giants'' products.","D":"D) They have sought to protect consumers'' privacy."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q50'
);
SET @q_cet6_2022_09_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_51, 'What do Americans generally think of social media companies according to the author?', '{"A":"A) They are invading people''s privacy.","B":"B) They are increasingly influential.","C":"C) They are becoming untrustworthy.","D":"D) They are growing out of control."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q51'
);
SET @q_cet6_2022_09_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_52, 'What is the popular assumption about international tourism?', '{"A":"A) Its benefits may compensate for the adverse environmental consequences.","B":"B) Its rapid development is attributed to people''s improved living standard.","C":"C) It appeals to people in places with favorable geographical conditions.","D":"D) It contributes to the economy of destination countries and regions."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q52'
);
SET @q_cet6_2022_09_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_53, 'What do we learn from some studies about uncontrolled tourism development?', '{"A":"A) It gives rise to an increase in mass confrontations.","B":"B) It incurs local residents'' antagonism to tourists.","C":"C) It inhibits the steady growth of local economy.","D":"D) It brings in a large chunk of mobile population."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q53'
);
SET @q_cet6_2022_09_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_54, 'Why does the author say local residents of popular destinations often feel frustrated?', '{"A":"A) They fall victim to social conflicts and environmental disturbances.","B":"B) They have little opportunity to enjoy themselves on cruise ships.","C":"C) They cannot find employment in multinational hotel chains.","D":"D) They do not think they benefit as much as they deserve."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q54'
);
SET @q_cet6_2022_09_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_55, 'How does the author say local residents in destination communities respond to tourism activity?', '{"A":"A) They endeavor to adapt to it.","B":"B) They readily adopt new lifestyles.","C":"C) They immerse tourists in their culture.","D":"D) They try to upgrade their business models."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-09-1-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_09_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q55'
);
SET @q_cet6_2022_09_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-09-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_09_1_56, 'What can tourists do to exert more positive impacts on the tourist destinations?', '{"A":"A) Show interest in local customs and lifestyles.","B":"B) Seek possibilities to invest in local companies.","C":"C) Use the services provided by local businesses.","D":"D) Give favorable comments about their services."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_09_1_56
);

-- ==================== cet6-2022-12-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-r1', 'BANKED_CLOZE', 'CET6', NULL, 'During the summer, when I was a visiting poet at a residency out of state, an angry, confused woman wandered into my class and said: "I have three guns and I want to use them." We all __26__ . It wasn''t clear if she had the guns, but we each know that, when we teach in America, we are already in danger. I was dizzy with fear. The woman, who later turned out to be a schizophrenic(精神分裂症患者) without __27__ to her medications, was, by some force, wrestled out and __28__ away, then put in a hospital for observation, in a step that was actually safer for everyone than any one of us pressing charges. My class went on; we talked about poems. But despite the fact that the rest of our days on campus passed __29__ , I was rattled. I couldn''t shake the sense that in this country we always live at __30__ risk. A few months later, crisis __31__ again. While my husband was locking his bike to drop off our 3-year- old daughter for her preschool-aged day camp, a different woman approached. Swiftly and for no __32__ reason, she bent down, picked up our daughter, and began to carry her down the street. It was so fast and confusing that my daughter __33__ cried. My husband, in a burst of speed, chased the woman and reclaimed our daughter. The woman, clearly confused, retreated into the public library. A __34__ of homeless people who generally know the other homeless in the area said they did not recognize the woman. The woman was so clearly unwell that when she was taken into custody she was incoherent. Heartbreakingly, she called our daughter by the name of someone else''s child. Each part of the episode was as haunting as it was __35__ .', NULL, '["A) access","B) apparent","C) barely","D) dedication","E) escorted","F) froze","G) incredible","H) indignant","I) network","J) overriding","K) peacefully","L) presumably","M) stifled","N) struck","O) terrifying"]', 302, 'IMPORT', 'cet6-2022-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-1-r1'
);
SET @pg_cet6_2022_12_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-r2', 'MATCHING', 'CET6', 'This man is running 7 marathons on 7 continents in 7 days', 'A) Michael Wardian pushed forward into the penetrating arctic(北极的) wind, fighting the urge to speed up. Too much effort and he''d begin to sweat, which, he was told, would only increase the risk of hypothermia(体温 过低). B) At the 2014 North Pole Marathon, the temperature dipped to minus-22 degrees F, with a wind chill that made it feel even colder. Along the route, armed guards wandered the large sheets of floating ice to minimize the risk of polar bear attacks. C) "I like to do stuff that scares me," Wardian said. With ice frozen to his beard, Wardian crossed the finish line that April afternoon in a winning time of 4 hours 7 minutes and 40 seconds, almost two hours slower than his personal best over 26.2 miles. The race for Wardian, however, was less about the result than overcoming his aversion to the cold. D) In a few days, Wardian will once again compete in an unfamiliar territory and below-freezing temperatures. He will line up Monday in Antarctica(南极) for the first leg of the World Marathon Challenge—joining 32 other adventure seekers on an unusual journey where participants travel through different time zones and climates to run seven marathons on seven continents in seven days. E) An elite ultra-runner, Wardian has his sights on breaking the event''s record average marathon time of 3:32:25 set last January by U.S. Marine Corps captain Daniel Cartica. Wardian, a 42-year-old Arlington resident, is a record-breaking racer, known in the ultra-running community for seeking tough courses and setting world records. Last year, he ran 1,254.65 miles in 47 races. The World Marathon Challenge, like most of Wardian''s running goals, will be about pushing his limits. "I love diverse and unique challenges," he said. "I''m definitely interested in seeing what I can handle and what my body can accept. That drives me." F) Something about the way Richard Donovan carried himself appealed to Wardian. Perhaps it was the sense of adventure Donovan displayed when they first met at the 2010 50K Championships in Galway, Ireland, where Donovan was the race director. The two hit it off, and soon Wardian was participating in Donovan''s events. It was at the North Pole Marathon, a race that Donovan organizes, that Wardian first heard about the Irishman''s plan for the World Marathon Challenge—a challenge that Donovan himself completed in 2009 and 2012. "I knew that many people had a goal of running seven marathons on seven continents during any time period," Donovan, 50, said. "I felt the natural extension to this idea would be to try to achieve it within a seven-day period." G) Wardian started saving for the trip in 2014, connecting with sponsors and getting approval from his wife, Jennifer, before committing. Registration for the event costs 36,000 euros, which covers international charter flights to each of the seven marathon locations: Union Glacier (Antarctica), Punta Arenas, Chile (South America), Miami (North America), Madrid (Europe), Marrakesh, Morocco (Africa), Dubai (Asia) and Sydney (Australia). The challenge is a test of both physical strength and mental fitness. Sleeping on a crammed plane, adjusting to different time zones and finding food to eat (Wardian is a vegetarian) would make it an exhausting trip over a month, let alone a week. "The key to a race like this is getting comfortable being uncomfortable," said Becca Pizzi, last year''s women''s champion. "The highs of the race are incredibly high, and the lows incredibly low." H) Since turning it into an organized event in 2015, Donovan has attracted a variety of runners. This year''s challenge will feature a far more elite field, which includes Ryan Hall, America''s fastest marathon runner. Despite his proven track record, Hall said he has no time goals and that he still suffers from the same fatigue issues that forced him to leave the professional ranks in 2015. Hall plans to run with his friend, Pastor Matthew Barnett of The Dream Center in Los Angeles—one of the six American men who will be competing. "I don''t expect to run a step with Mike, but I will be excited to see how he does," said the 34- year-old Hall, who began weight-lifting after retiring. "If I finish within an hour of him in each marathon, I''d be surprised." I) Instead, 43-year-old Petr Vabrousek, an elite Czech Ironman champion, is expected to be Wardian''s closest challenger. To others on the trip, simply finishing will be its own reward. Sinead Kane of Ireland is aiming to become the first blind person to complete the challenge. And Beth Ann Telford, a 47-year-old federal government worker from Fairfax and the only American female in this year''s mix, is using the event as a platform to raise money for cancer research. It''s a cause with a personal connection to Telford, who was diagnosed with brain cancer in 2004. "Doing something like this is definitely the hardest challenge that I''ve ever done except for the chemotherapy and brain surgery," she said. "It''s going to raise awareness. …I just wanted to do something that is epic and this certainly is right up there." Wardian, too, hopes his involvement will give him a platform to promote a cause. He recently became an ambassador for the United Nations Women''s HeForShe initiative to fight inequalities faced by women and girls worldwide. J) On a chilly December afternoon, Wardian wove through Washington''s crowded sidewalks on the way home from his full-time job as an international ship broker. His elastic, 6-foot frame bounced gently and efficiently off the ground with each step of the hilly six-mile trip back to Arlington. This is a daily routine during the week for Wardian, who started racing professionally in 2003 and runs seven days a week, often multiple times a day. When he travels, he prefers to explore new places on his feet. K) But in some ways, Wardian still has trouble thinking of himself as a runner. For the majority of his childhood, Wardian devoted his energy to becoming a Division I lacrosse( 长曲棍球) player-a dream he realized when he was recruited to play at Michigan State University. "Once he decides to do something, he just works at it until he does it," Michael''s younger sister, Mariele, said. "Once he decides to do it, it''s usually something that''s going to happen. He''s always been like that. He''s a very motivated individual." L) It was only a year or so ago that Wardian realized that he had been a runner longer than a lacrosse player. It was not until he ran in the 2004 U.S. Olympic Marathon Trials-the first of three for Wardian-that he felt that he was a legitimate runner. Now more than 10 years and numerous ultra-marathon national titles and world records later, he embraces that identity. Wardian wants to see how far his legs can take him, one epic challenge at a time. "I want to always keep doing things that are exciting, adventurous, different and most importantly, probably things I''m not the best at," Wardian said, "because if you''re not seeking things out that are challenging and difficult for you, then you''re not growing … So I hope maybe people see what I do, and say, ''Okay, I want to do something different or try something new. … I''m going to do something that scares me.'' That''s what I''m hoping people will take from it."', NULL, NULL, 1221, 'IMPORT', 'cet6-2022-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-1-r2'
);
SET @pg_cet6_2022_12_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-r3', 'CAREFUL_READING', 'CET6', NULL, 'Many people associate their self-worth with their work. The more successful their career, the better they feel about themselves. Work-related self-esteem is therefore a worthy ideal to pursue with vigor, right? Well, not always. According to recent research, in which psychologists interviewed 370 full-time workers over a period of three weeks, the reality is a little more complicated. And it involves negative as well as positive consequences. It''s natural to be drawn towards pleasure and to step away from pain. In the workplace, if that pleasure comes from a triumph which swells our self-respect, people will try to repeat the accomplishment. But repeating that accomplishment is often not realistic, which can lead to severe negative emotional consequences when it doesn''t reoccur. This form of motivation is widely regarded as a negative type of motivation. It can hinder other more positive motivation types, such as completing a task purely because it''s fulfilling or enjoyable. What consumes the employee instead is a pressing need to feel mighty and sure of themselves. They then take on only tasks and objectives which serve that ego-driven need. As a result, to avoid feelings of shame and worthlessness associated with failure, they extend themselves to such a degree that there''s a subsequent adverse effect on their well-being. This internal pressure to succeed at all costs demands a lot of effort. It depletes their energy, culminating in disproportionate levels of damaging sentiment. Those negative emotions mount into heightened anxiety, impacting their ability to make the most of their personal life. Their desire to avoid feeling inferior ends up making them feel inferior when it comes to their diminished capacity for friendship and leisure. They end up dissatisfied both at work and outside of it. But thankfully, for those people compelled almost entirely by this specific form of motivation, the news isn''t all bad, or bad at all. The study also discovered several positive outcomes that can actually outweigh the harmful ones. Though these types of employees are motivated by the desire to avoid negative consequences, they are also motivated by the excitement of pursuing emotional rewards. This excitement makes pursuing goals enjoyable and stimulates pleasure and pride that would result from success. An effect of the positive motivation is that it neutralizes the existence of negative motivation. Sure, it affects people''s personal lives to what could be deemed an unhealthy extent, because leisure activities are often seen as a part of life that must be sacrificed to manage work and family demands. However, the way people feel about their work has less to do with whether they''re motivated by the preservation of self- esteem but more with the fact that they''re simply motivated.', NULL, NULL, 446, 'IMPORT', 'cet6-2022-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-1-r3'
);
SET @pg_cet6_2022_12_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-r4', 'CAREFUL_READING', 'CET6', NULL, 'Degradation of the world''s natural resources by humans is rapidly outpacing the planet''s ability to absorb the damage, a recent UN environmental study has found. The study concludes that without radical action the level of prosperity that millions of people in the developed world count on will be impossible to maintain or extend to poorer countries. Water scarcity is the curse of some of the poorest regions on Earth, leaving developing countries increasingly unable to feed themselves, and causing hardship for millions of people. There appears little prospect of this desperate situation being remedied without radical action being taken. Water resources are under increasing threat from population growth, climate change, rapid urbanization, rising levels of consumption, and the degradation of lands that previously provided a natural replenishment(补充) of water resources. The rate of damage to the natural environment was found to increase globally, despite concerted efforts to persuade government to take measures to improve the condition. "If current trends continue, and the world fails to improve patterns of production and consumption, then the state of the world''s environment will continue to decline," warned UN executive director Achim Steiner. He said the tools for improving the environment for millions of people existed in developed countries, but were in danger of not being used. The study found that basic measures to tackle some of the key causes of environmental damage were still not being taken. These included measures to reduce air pollution; to control the damage to marine ecosystems, which can have a huge effect on fish stocks on which hundreds of millions of people depend; and to curb the degradation of land where modern agricultural methods were pursued without regard to the longer-term consequences. Despite the recent global agreement on cutting greenhouse gas emissions, global carbon output continues to rise. This will put a long-term strain on the ability of developing economies to feed their own people. Climate change is aggravated by the emissions of greenhouse gases from chemical and natural fertilisers used in agriculture which increased by more than a quarter between 2000 and 2010. Other problem areas identified in the report included glaciers, which provide vital water resources for millions of people, but which are shrinking as the climate warms. In rich countries, these problems have built up over decades and centuries while economic growth was pursued at the expense of the environment. Subsequent efforts to remedy the environment have met with partial success. But in developing countries, the path of future development has more potential to change, which has encouraged international institutions to devise more sustainable growth pathways that are supposed both to alleviate poverty and preserve the environment.', NULL, NULL, 441, 'IMPORT', 'cet6-2022-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-1-r4'
);
SET @pg_cet6_2022_12_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-1-r4' LIMIT 1);

-- 翻译 cet6-2022-12-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-translation'
);
SET @q_cet6_2022_12_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_01, '青藏高原(the Qinghai-Tibet Plateau)位于中国西南部，面积约230万平方公里，平均海拔4000米以上，被称为"世界屋脊"。青藏高原自然资源丰富，风景秀丽，拥有多种珍稀野生动物。 青藏高原气温很低，形成了大面积高山冰川。这里是亚洲许多著名河流的源头，是中国和东南亚的主要淡水供应源。青藏高原对全球生态系统至关重要。 由于气候变化的影响，青藏高原的冰川正在加速融化。中国一直在努力保护青藏高原的生态系统，草地覆盖率不断增加，许多濒危物种得到更为有效的保护。', NULL, 'Located in the southwest of China, the Qinghai-Tibet Plateau, with an area of about 2.3 million square kilometers and an average altitude of over 4,000 meters, is known as "the Roof of the World". It is rich in natural resources, boasts beautiful scenery, and is home to various rare wild animals. Due to its low temperatures, the plateau has formed large areas of alpine glaciers. It is the source of many famous rivers in Asia and a major freshwater supply for China and Southeast Asia. It is vital to the global ecosystem. Due to climate change, the glaciers on the plateau are melting at an accelerating rate. China has been making efforts to protect the ecosystem of the plateau, with grassland coverage steadily increasing and many endangered species being more effectively protected.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_01
);

-- 听力 Q1 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q01', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q01'
);
SET @q_cet6_2022_12_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_02, NULL, '{"A":"A) She hasn''t started writing it.","B":"B) She hasn''t decided on a topic.","C":"C) She is proofreading the first draft.","D":"D) She is working on the references."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_02
);

-- 听力 Q2 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q02', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q02'
);
SET @q_cet6_2022_12_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_03, NULL, '{"A":"A) He lent many books to the man for reference.","B":"B) He offered the man advice on resource hunting","C":"C) He published a lot in a number of reputable journals.","D":"D) He told the man to be selective when using e-resources."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_03
);

-- 听力 Q3 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q03', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q03'
);
SET @q_cet6_2022_12_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_04, NULL, '{"A":"A) He didn''t think her dissertation topic viable.","B":"B) He wasn''t interested in her dissertation topic.","C":"C) He didn''t want her to rush through her dissertation.","D":"D) He wasn''t specific about the length of her dissertation."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_04
);

-- 听力 Q4 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q04', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q04'
);
SET @q_cet6_2022_12_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_05, NULL, '{"A":"A) Change her research methodology.","B":"B) Narrow down her dissertation topic.","C":"C) Consult her professor more.","D":"D) Follow the man''s advice."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_05
);

-- 听力 Q5 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q05', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q05'
);
SET @q_cet6_2022_12_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_06, NULL, '{"A":"A) He has translated 12 books.","B":"B) He is a well-known nutritionist.","C":"C) His books sell well worldwide.","D":"D) His latest book sold a million copies."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_06
);

-- 听力 Q6 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q06', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q06'
);
SET @q_cet6_2022_12_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_07, NULL, '{"A":"A) The desire of Americans to try exotic cuisines.","B":"B) The demand for information about food safety.","C":"C) The fact that over half of Americans are overweight.","D":"D) The fact that science books are difficult to read."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_07
);

-- 听力 Q7 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q07', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q07'
);
SET @q_cet6_2022_12_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_08, NULL, '{"A":"A) The general public.","B":"B) Those who are overweight.","C":"C) Those who want to lose weight.","D":"D) The medical community."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q08', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q08'
);
SET @q_cet6_2022_12_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_09, NULL, '{"A":"A) Switch to a vegetarian diet.","B":"B) Follow a personalized diet.","C":"C) Adhere to doctors'' advice.","D":"D) Cut carbohydrate intake."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_09
);

-- 听力 Q9 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q09', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q09'
);
SET @q_cet6_2022_12_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_10, NULL, '{"A":"A) The rate of their growth increased dramatically.","B":"B) The growth of their new brain cells doubled.","C":"C) They began to show signs of depression.","D":"D) They began to get irritated and restless."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_10
);

-- 听力 Q10 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q10', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q10'
);
SET @q_cet6_2022_12_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_11, NULL, '{"A":"A) To avoid them in the future.","B":"B) To warn others against them.","C":"C) To make good sense of them.","D":"D) To reflect on their causes."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_11
);

-- 听力 Q11 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q11', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q11'
);
SET @q_cet6_2022_12_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_12, NULL, '{"A":"A) Produce a surprising healing effect.","B":"B) Weaken one''s immunity in the long run.","C":"C) Make people more susceptible to illness.","D":"D) Provide protection against mental illnesses."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_12
);

-- 听力 Q12 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q12', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q12'
);
SET @q_cet6_2022_12_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_13, NULL, '{"A":"A) Placing their own interests over their staff''s.","B":"B) Being overwhelmed by their daily routines.","C":"C) Lacking the ability to relate to their staff.","D":"D) Spending too much time handling email."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_13
);

-- 听力 Q13 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q13', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q13'
);
SET @q_cet6_2022_12_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_14, NULL, '{"A":"A) Their leadership may be challenged.","B":"B) Their companies may go bankrupt.","C":"C) Unexpected events may occur.","D":"D) Major problems may result."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_14
);

-- 听力 Q14 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q14', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q14'
);
SET @q_cet6_2022_12_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_15, NULL, '{"A":"A) Keep an eye on their employees.","B":"B) Motivate and inspire their team.","C":"C) Sacrifice some of the immediate goals.","D":"D) Have greater ambition in overall planning."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_15
);

-- 听力 Q15 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q15', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q15'
);
SET @q_cet6_2022_12_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_16, NULL, '{"A":"A) Cultivate self-control.","B":"B) Filter their email boxes.","C":"C) Respond only after work.","D":"D) Check only when necessary."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_16
);

-- 听力 Q16 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q16', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q16'
);
SET @q_cet6_2022_12_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_17, NULL, '{"A":"A) The key to increasing healthy food supply.","B":"B) The best way to improve marketing research.","C":"C) The impact of advertisements on consumption.","D":"D) The importance of the appearance of food."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_17
);

-- 听力 Q17 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q17', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q17'
);
SET @q_cet6_2022_12_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_18, NULL, '{"A":"A) By focusing on the nutrients in different foods.","B":"B) By emphasizing the diversity of food.","C":"C) By stressing pleasing aesthetics of food.","D":"D) By winning the support of marketing professors."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_18
);

-- 听力 Q18 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q18', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q18'
);
SET @q_cet6_2022_12_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_19, NULL, '{"A":"A) They can attract customers with the healthy qualities of their products.","B":"B) They can boost sales of healthy foods by making them visually appealing.","C":"C) They can turn to marketing professors for advice.","D":"D) They can rely on advertising for sales promotion."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_19
);

-- 听力 Q19 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q19', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q19'
);
SET @q_cet6_2022_12_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_20, NULL, '{"A":"A) It has witnessed a spectacular surge in demand.","B":"B) It has met much criticism from environmentalists.","C":"C) It has seen more small businesses offering environment-friendly products.","D":"D) It has experienced increasingly fierce competition among global companies."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_20
);

-- 听力 Q20 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q20', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q20'
);
SET @q_cet6_2022_12_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_21, NULL, '{"A":"A) Consumers now know much more about technology.","B":"B) Their mass production has sharply reduced the price","C":"C) Consumers tend to favor all that is novel.","D":"D) Their quality has been greatly improved."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_21
);

-- 听力 Q21 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q21', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q21'
);
SET @q_cet6_2022_12_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_22, NULL, '{"A":"A) Purchasing only this kind of products for home cleaning.","B":"B) Writing positive comments about them on social media.","C":"C) Demonstrating on TV how effective these products are.","D":"D) Telling one another about their incomparable virtues."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_22
);

-- 听力 Q22 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q22', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q22'
);
SET @q_cet6_2022_12_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_23, NULL, '{"A":"A) Increasing cleaners'' workload.","B":"B) Blocking the fountains'' works.","C":"C) Breaking a time-honored ritual.","D":"D) Polluting the fountains'' water."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_23
);

-- 听力 Q23 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q23', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q23'
);
SET @q_cet6_2022_12_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_24, NULL, '{"A":"A) They are occasionally retrieved by curious tourists.","B":"B) They are regularly donated to charity organizations.","C":"C) They are mostly used for the fountains'' maintenance.","D":"D) They are usually used as wages for fountain cleaners."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_24
);

-- 听力 Q24 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q24', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q24'
);
SET @q_cet6_2022_12_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_25, NULL, '{"A":"A) It is invested in a series of businesses.","B":"B) It is used exclusively for its maintenance.","C":"C) It is used to run a supermarket for the needy.","D":"D) It is estimated to be about $40,000 a month."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_25
);

-- 听力 Q25 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q25', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q25'
);
SET @q_cet6_2022_12_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_26, NULL, '{"A":"A) He was arrested for stealing money from four fountain cleaners.","B":"B) He was sentenced to 34 years'' imprisonment.","C":"C) He collected rare coins from around the world.","D":"D) He stole a lot of money from a fountain with a magnetic stick."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q26'
);
SET @q_cet6_2022_12_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_27, NULL, '{"A":"A) access","B":"B) apparent","C":"C) barely","D":"D) dedication","E":"E) escorted","F":"F) froze","G":"G) incredible","H":"H) indignant","I":"I) network","J":"J) overriding","K":"K) peacefully","L":"L) presumably","M":"M) stifled","N":"N) struck","O":"O) terrifying"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q27'
);
SET @q_cet6_2022_12_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_28, NULL, '{"A":"A) access","B":"B) apparent","C":"C) barely","D":"D) dedication","E":"E) escorted","F":"F) froze","G":"G) incredible","H":"H) indignant","I":"I) network","J":"J) overriding","K":"K) peacefully","L":"L) presumably","M":"M) stifled","N":"N) struck","O":"O) terrifying"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q28'
);
SET @q_cet6_2022_12_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_29, NULL, '{"A":"A) access","B":"B) apparent","C":"C) barely","D":"D) dedication","E":"E) escorted","F":"F) froze","G":"G) incredible","H":"H) indignant","I":"I) network","J":"J) overriding","K":"K) peacefully","L":"L) presumably","M":"M) stifled","N":"N) struck","O":"O) terrifying"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q29'
);
SET @q_cet6_2022_12_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_30, NULL, '{"A":"A) access","B":"B) apparent","C":"C) barely","D":"D) dedication","E":"E) escorted","F":"F) froze","G":"G) incredible","H":"H) indignant","I":"I) network","J":"J) overriding","K":"K) peacefully","L":"L) presumably","M":"M) stifled","N":"N) struck","O":"O) terrifying"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q30'
);
SET @q_cet6_2022_12_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_31, NULL, '{"A":"A) access","B":"B) apparent","C":"C) barely","D":"D) dedication","E":"E) escorted","F":"F) froze","G":"G) incredible","H":"H) indignant","I":"I) network","J":"J) overriding","K":"K) peacefully","L":"L) presumably","M":"M) stifled","N":"N) struck","O":"O) terrifying"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q31'
);
SET @q_cet6_2022_12_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_32, NULL, '{"A":"A) access","B":"B) apparent","C":"C) barely","D":"D) dedication","E":"E) escorted","F":"F) froze","G":"G) incredible","H":"H) indignant","I":"I) network","J":"J) overriding","K":"K) peacefully","L":"L) presumably","M":"M) stifled","N":"N) struck","O":"O) terrifying"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q32'
);
SET @q_cet6_2022_12_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_33, NULL, '{"A":"A) access","B":"B) apparent","C":"C) barely","D":"D) dedication","E":"E) escorted","F":"F) froze","G":"G) incredible","H":"H) indignant","I":"I) network","J":"J) overriding","K":"K) peacefully","L":"L) presumably","M":"M) stifled","N":"N) struck","O":"O) terrifying"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q33'
);
SET @q_cet6_2022_12_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_34, NULL, '{"A":"A) access","B":"B) apparent","C":"C) barely","D":"D) dedication","E":"E) escorted","F":"F) froze","G":"G) incredible","H":"H) indignant","I":"I) network","J":"J) overriding","K":"K) peacefully","L":"L) presumably","M":"M) stifled","N":"N) struck","O":"O) terrifying"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q34'
);
SET @q_cet6_2022_12_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_35, NULL, '{"A":"A) access","B":"B) apparent","C":"C) barely","D":"D) dedication","E":"E) escorted","F":"F) froze","G":"G) incredible","H":"H) indignant","I":"I) network","J":"J) overriding","K":"K) peacefully","L":"L) presumably","M":"M) stifled","N":"N) struck","O":"O) terrifying"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q35'
);
SET @q_cet6_2022_12_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_36, NULL, '{"A":"A) access","B":"B) apparent","C":"C) barely","D":"D) dedication","E":"E) escorted","F":"F) froze","G":"G) incredible","H":"H) indignant","I":"I) network","J":"J) overriding","K":"K) peacefully","L":"L) presumably","M":"M) stifled","N":"N) struck","O":"O) terrifying"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q36'
);
SET @q_cet6_2022_12_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_37, 'Wardian regards the various extraordinary challenges as a test of his physical endurance', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q37'
);
SET @q_cet6_2022_12_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_38, 'Wardian hopes his participation in the seven-day marathon series will contribute to a worthy cause.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q38'
);
SET @q_cet6_2022_12_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_39, 'Wardian is going to join over thirty other runners in a week-long marathon series.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q39'
);
SET @q_cet6_2022_12_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_40, 'Over-exertion in extreme cold can lower one''s body temperature to a dangerous point.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q40'
);
SET @q_cet6_2022_12_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_41, 'Wardian was very much impressed by a race director''s sense of adventure.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q41'
);
SET @q_cet6_2022_12_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_42, 'Once Wardian sets his mind on something, he is determined to make it happen.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q42'
);
SET @q_cet6_2022_12_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_43, 'One top American marathoner quit his running career because of his physical condition.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q43'
);
SET @q_cet6_2022_12_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_44, 'To many of the week-long marathon participants, completing the race will be a success in itself.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q44'
);
SET @q_cet6_2022_12_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_45, 'For Wardian, the marathon in the Arctic was more about how to triumph over the extreme cold.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q45'
);
SET @q_cet6_2022_12_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_46, 'To participate in the seven-day marathon series, Wardian had to raise a lot of money and have his wife''s support.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q46'
);
SET @q_cet6_2022_12_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_47, 'What does the author say about the pursuit of work-related self-esteem?', '{"A":"A) It may result in negative motivation.","B":"B) It contributes to one''s accomplishments.","C":"C) It can increase one''s vigor as one keeps trying.","D":"D) It costs too much emotionally and psychologically."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q47'
);
SET @q_cet6_2022_12_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_48, 'What do employees tend to do in pursuing work-related self-esteem?', '{"A":"A) Take on tasks well beyond their actual capabilities.","B":"B) Strive to succeed at the expense of their well-being.","C":"C) Resort to all means regardless of the consequences.","D":"D) Exaggerate their sense of shame and worthlessness."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q48'
);
SET @q_cet6_2022_12_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_49, 'What do we learn about people over-concerned with work-related self-esteem?', '{"A":"A) They may often feel inferior to their colleagues.","B":"B) They cannot enjoy their personal life to the full.","C":"C) They are never satisfied with their achievements.","D":"D) They have their own view of friendship and leisure."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q49'
);
SET @q_cet6_2022_12_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_50, 'What is the good news we learn from the recent research?', '{"A":"A) The pursuit of goals may turn out to be enjoyable and pleasant.","B":"B) The emotional rewards from goal pursuit are worth the pains taken.","C":"C) The negative consequences of goal pursuit can mostly be avoided.","D":"D) The goal of swelling self-esteem can be achieved if one keeps trying."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q50'
);
SET @q_cet6_2022_12_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_51, 'What can we infer from the last paragraph?', '{"A":"A) Workers have to make sacrifices to preserve self-esteem.","B":"B) Self-esteem swells when workers are strongly motivated.","C":"C) Pursuit of goals affects people''s personal lives to an unhealthy extent.","D":"D) People feel positive about their work as long as they are motivated."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q51'
);
SET @q_cet6_2022_12_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_52, 'What is the major finding of the UN environmental study?', '{"A":"A) Human activity has rendered Mother Earth almost uninhabitable.","B":"B) Humans are doing more damage to the earth than it can cope with.","C":"C) Environmental problems have considerably weakened human prosperity.","D":"D) Environmental damage is more serious in developed countries these days."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q52'
);
SET @q_cet6_2022_12_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_53, 'What is said about water scarcity in some of the poorest regions?', '{"A":"A) It is getting so serious that there is little hope of solution.","B":"B) It largely accounts for their slow economic development.","C":"C) It can hardly be relieved if no drastic measures are taken.","D":"D) It is primarily caused by the acceleration of climate change."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q53'
);
SET @q_cet6_2022_12_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_54, 'What does Achim Steiner say about the environmental condition?', '{"A":"A) It will deteriorate worldwide.","B":"B) It is attracting global attention.","C":"C) It is being slowly remedied globally.","D":"D) It will shrink the world''s population."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q54'
);
SET @q_cet6_2022_12_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_55, 'What is the dilemma developing countries face?', '{"A":"A) They cannot modernise farming without causing land degradation.","B":"B) They cannot promote industrialisation without polluting waterways.","C":"C) They cannot boost crop yields without causing greenhouse gas emissions.","D":"D) They cannot catch up with rich countries without sacrificing the environment."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-1-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q55'
);
SET @q_cet6_2022_12_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_1_56, 'What should developing countries do in their future development according to the passage?', '{"A":"A) They turn to developed countries for the assistance they need.","B":"B) They remedy environmental damage by slowing economic growth.","C":"C) They avoid damaging interference from international institutions.","D":"D) They improve people''s livelihood without harming the environment."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_1_56
);

-- ==================== cet6-2022-12-2 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-r1', 'BANKED_CLOZE', 'CET6', NULL, 'The task of the global strategist of a business is to build a platform of capabilities derived from the resources, experiences and innovations of units operating in multiple locations, to transplant those capabilities wherever __26__ , and then to systematically upgrade and renew them—ahead of the competition. Apple is an outstanding case of a company whose unique capabilities give it a worldwide __27__ advantage, particularly with respect to its ability to build platforms from a product base that integrates functional and __28__ design. Apple has been able to leverage and exploit its California-based design and marketing advantages successfully throughout the world. IKEA is another such case. The do-it-yourself furniture and houseware company first developed a compelling set of capabilities to design, manufacture and __29__ furniture at low cost and sell it in a novel way in Sweden. Later, IKEA successfully __30__ this formula in many other countries. By contrast, Telefonica, a Spanish telecommunications company that is now the world''s fifth largest telecom by __31__ , first developed its special advantage abroad. In 1989 and 1990, Telefonica had the opportunity to enter Chile and Argentina, countries that shared many institutional and cultural characteristics with its home country but that were __32__ more rapid market reform. Throughout the 1990s, Telefonica took what it learned in Chile and Argentina about reconstructing former state-owned telecoms to other Latin American countries that were privatizing their state telecoms and deregulating their telecom markets. These examples might lead the reader to believe that creating a global advantage is an easy task. But many other __33__ of expensive failed experiments suggest that creating a lasting global advantage actually requires a great deal of __34__ and operational finesse(技巧). Our research suggests that global winners typically create and sustain their international presence through a systematic process of __35__ , renewing and enhancing their core capabilities.', NULL, '["A) aesthetic","B) appropriate","C) clusters","D) competitive","E) exploiting","F) fiscal","G) instances","H) rehabilitated","I) reproduced","J) revenues","K) safeguarding","L) ship","M) strategic","N) transcend","O) undergoing"]', 305, 'IMPORT', 'cet6-2022-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-2-r1'
);
SET @pg_cet6_2022_12_2_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-2-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-r2', 'MATCHING', 'CET6', 'Fear of Nature: An Emerging Threat to Conservation', 'A) What do we lose when natural spaces and species disappear? Increasingly, research has shown that as species and ecosystems vanish, it also chips away at our ability to preserve what remains—because we no longer understand what we''re losing. B) You probably see it all the time. The neighbor who puts pesticides on his lawn rather than deal with annoying bees. The politician who votes against wildlife protection because she''s never seen a wolf in the wild. The corporation that wants to bulldoze(用推土机推平) the habitat of a rare frog. C) At best this can be termed "the extinction of experience," where our cultural and natural histories fade from our memories and therefore our reality. At its worst it becomes something even more concerning: "biophobia," the fear of living things and a complete aversion to nature. D) This isn''t the fiction of living in a cold, empty dystopia(绝望的世界). Sadly, it''s becoming a way of life for too many people—especially children. A recent study in Japan paints a striking portrait of this problem. A survey of more than 5,300 school children in the Tochigi Prefecture examined their perception of 14 local insect species and one spider. The results? A collective "ew!" Most of the students saw the species as things to dislike or fear, or even as sources of danger. The less experience the students had with nature, the more negative their feelings. E) The results were published earlier this year in the journal Biological Conservation. Lead researcher Masashi Soga with the University of Tokyo says the study stemmed from observations about today''s nature-deficient children. "Humans inherently avoid dangerous organisms such as bees, but children these days avoid even harmless insects such as butterflies and dragonflies(蜻蜓)," he says. "I have long wondered why so many of today''s children react like this." F) Although the children''s reactions were somewhat expected, the new study did contain an unexpected finding: Many of the surveyed children revealed that their parents also expressed fear or disgust of the same animals. In fact, these parental emotions were strong enough to overwhelm any positive experiences the children might have gained from direct experiences in nature. As Soga and his coauthors wrote in their paper, "Our results suggest that there is likely a feedback loop in which an increase in people who have negative attitudes towards nature in one generation will lead to a further increase in people with similar attitudes in the next generation." G) And that''s possibly the greater threat posed by extinction of experience. Soga suggests the generational loss— condition previously dubbed environmental generational amnesia( 遗忘)—could chip away at our societal ability to preserve what we''re losing. "I believe that increased biophobia is a major, but invisible, threat to global biodiversity," Soga says. "As the number of children who have biophobia increases, public interest and support for biodiversity conservation will gradually decline. Although many conservation biologists still consider that preventing the loss of wildlife habitat is the most important way to conserve biodiversity, I think preventing increased biophobia is also important for conservation." H) What''s to be done about this? The paper makes several recommendations, the most obvious of which is that children should experience nature more often. The authors also suggest establishing policies to guide these natural experiences and increasing educational programs about the natural world. I) Helping parents to see species around them in a new light would make a difference, too. And, of course, maintaining support for preserving the wild spaces where these "scary" creatures live is the most important thing of all. That''s a point reinforced by another recent study, which found that wild spaces located within urban areas—and the plants and animals that thrive in them—are particularly important for human health and well-being. J) Published in the journal Frontiers in Sustainable Cities, the study examined attitudes toward Discovery Park, the heavily forested 534-acre public park in Seattle, Washington. It found that the public had the most appreciation for—and gained the most value from—the wildest parts of the park. "I have seen whales, seals, fish, eagles, shorebirds and many other sea creatures in their natural habitat," one survey participant wrote. "Coming here with people has allowed me to connect and talk with them about conversation that simply does not happen in everyday life," wrote another. K) The participants reported that their most valuable experiences in the park included encountering wildlife, walking through open spaces, exploring the beach and finding beautiful views. "We saw that a large majority of participants'' interactions, especially their most meaningful interactions, depended on Discovery Park''s relative wildness," says lead author Elizabeth Lev, a master''s student in the University of Washington''s Human Interaction with Nature Lab. This is only possible because the park is relatively wild. After all, you can''t enjoy watching birds if there are no birds to follow, gaze at the sunset if it''s obscured by skyscrapers, or stop and smell the flowers if they don''t have room to grow. L) And yet even this long-protected space could someday become less hospitable to nature. Over the past few years a lot of people and organizations have suggested developing parts of Discovery Park or the neighboring area. Most recently a plan proposed building 34 acres of much-needed affordable housing and parking spaces adjacent to the park, bringing with them noise, traffic and pollution. M) If anything like that happened, both the park and the people of Seattle could lose something vital. And that would continue the trend of chipping away at Seattle''s—and the world''s—natural spaces, leaving just tiny pocket parks and green-but-empty spaces that offer little real value to wildlife, plants or people. N) "It is true that any interaction with nature is better than none, but I don''t want people to be satisfied with any small bit of grass and trees," Lev says. "We have been in this cycle of environmental generational amnesia for a long time, where the baseline keeps shifting and we don''t even realize what we''re losing until it''s gone. If we can get people to understand how much meaning and value can come from having more experiences with more wild forms of nature, then maybe we can stop this cycle and move toward conserving and restoring what we have left." O) Building this understanding in an ever-more fearful and disconnected world may be the biggest challenge. Peter Kahn, the senior author of Lev''s paper and the director of the Human Interaction with Nature lab, made several suggestions for bridging this gap in this 2011 book, Technological Nature. They echo the recommendation about getting children into nature, but also include telling stories of how things used to be, imagining what things might be like in the future, and developing a common language about nature, "a way of speaking about wild and domestic interaction patterns, and the meaningful, deep and often joyful feelings that they generate." P) No matter what techniques we use, this growing field of research illustrates that saving nature requires encouraging people to experience it more often and more deeply. That calls for additional research—Lev and her coauthors have published a toolkit that other municipalities can follow to study the value of their own wild spaces—and clear communication of the results. "If we can continue to show people the benefits of these wild spaces," Lev says, "maybe people will begin to see more value in keeping these areas undeveloped —for the sake of our mutual benefit."', NULL, NULL, 1233, 'IMPORT', 'cet6-2022-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-2-r2'
);
SET @pg_cet6_2022_12_2_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-2-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-r3', 'CAREFUL_READING', 'CET6', NULL, 'Some people in the US have asserted that forgiving student loan debt is one way to stimulate the economy and give assistance to those in need. One government proposition is to eliminate $10,000 of debt for ''economically distressed'' students. Some in US Congress have gone so far as to suggest forgiving up to $50,000 in debt per student borrower, but does forgiving student debt necessarily correlate to helping the economically disadvantaged? The answer is no. This policy is just giving money away to universities and the most affluent students in attendance. Federal Reserve data reveals that the highest-income 40 percent of households owe approximately 60 percent of outstanding student debt, while the lowest 40 percent owe just under 20 percent. This could be due to a combination of factors: students from high-income households are more likely to go to expensive colleges, less likely to receive financial aid, and more likely to have high incomes post-graduation. Plus, the majority of student debt is held by graduate degree earners, who earn approximately 25 percent more than their undergraduate counterparts. Clearly, giving free reign to banks to forgive student debt is a step in the wrong direction. Other proposals for broader, long-term student loan plans have some fundamental problems. One idea is to cancel student debt only for undergraduate degrees and for students making less than $125,000. This attempts to address the fact that Congress'' previously mentioned student loan forgiveness plan largely helps out the wealthy, but is an adverse incentive for universities to keep raising tuition and for students to choose to major in low-earning degree programs. Colleges have no reason to make their programs more affordable if they believe students will just take out more debt. And, students will feel more comfortable making the irresponsible decision to go tens of thousands of dollars in debt to major in impractical or idealistic subjects if they know their loans will be forgiven. This is especially concerning given the pandemic(大流行病) has rendered a college education practically worthless. Students are paying tens of thousands of dollars per year to live at home and be lectured on the Internet. Do we really want to tell colleges that they can get away with providing below-average service for an outrageous cost? In the case of any of these student debt plans, working-class Americans who chose not to or could not afford to go to college will be subsidizing the education of the professional class. Plumbers and retail workers will be paying for the degrees of doctors and lawyers. The US government''s effort to help those in debt is commendable but is this really the solution that will help the poor financially recover?', NULL, NULL, 444, 'IMPORT', 'cet6-2022-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-2-r3'
);
SET @pg_cet6_2022_12_2_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-2-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-r4', 'CAREFUL_READING', 'CET6', NULL, 'If there''s one rule that most parents cling to in the confusing, fast-changing world of kids and media, it''s "No screens before age 2." As of today, that rule has been thrown out the window. The American Academy of Pediatrics (AAP), which first issued that recommendation back in 1999, has extensively updated and revised its guidelines for children and adolescents to reflect new research and new habits. The new guidelines, especially for very young children, shift the focus from WHAT is on the screen to WHO else is in the room. And in doing so, they raise some intriguing points about the future of learning from media. For babies younger than 18 months, AAP still says no screens at all are the best idea—with one notable exception: Live video chat. Surveys indicate that families already popularly believe that "Face time doesn''t count", or at least that the benefit of virtual visits with grandparents or other relatives outweighs the potential cost of exposing babies to the laptop or smartphone. The AAP doesn''t cite positive evidence that infants actually get something out of this kind of "conversation", the way that they clearly do from live social interaction. But there''s some observational research that infants as young as six months old are emotionally engaged by playing live peekaboo( 躲猫猫) with Grandma online. For infants and toddlers(学步儿童), ages 15 months to 2 years old, there''s limited evidence from a couple of very small studies that they can learn new words from educational media, if and only if parents are watching alongside them, repeating what the video says and/or drawing attention to what is on the screen. In other words, treating a video or an app like a picture book is the best bet. The flip side of this is that many studies have actually shown poorer language skills correlated with earlier solo viewing of "educational" videos. There''s also research that shows language delays in children who watch more TV and start watching earlier. In both cases, the problem seems to be media replacing interaction with people. For this reason, the new AAP guideline has changed from "avoid all screens under age 2" to "avoid solo media use in this age group." For preschoolers ages 2 to 5, there''s more evidence that they have the ability to transfer knowledge from screens to the real world, including early literacy and math. For this age group, AAP recommends no more than an hour a day of screen use. And, just as with younger children, they want care-givers to take part in screen time: "Co-view with your children, help children understand what they are seeing, and help them apply what they learn to the world around them."', NULL, NULL, 449, 'IMPORT', 'cet6-2022-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-2-r4'
);
SET @pg_cet6_2022_12_2_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-2-r4' LIMIT 1);

-- 翻译 cet6-2022-12-2
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-translation'
);
SET @q_cet6_2022_12_2_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_01, '黄土高原( the Loess Plateau)是中国第三大高原， 面积约60万平方公里，平均海拔 1000-2000米，绝大部分覆盖着50-80米厚的黄土，是世界上黄土分布最集中、覆盖厚度最大的区域。这是大自然创造的一个奇迹，在世界上也是绝无仅有的。 黄土高原是中华民族的发祥地之一。早在5500年前，人们就已经在黄土高原上开始农耕。随着农耕业的持续发展，黄土高原人口不断增加，在秦汉时期就成为中国的政治和经济中心。如今，随着西部大开发战略的实施，黄土高原地区的经济得到了迅速发展。', NULL, 'The Loess Plateau, China''s third largest plateau, has an area of about 600,000 square kilometers and an average altitude of 1,000 to 2,000 meters, with most of it covered by loess 50 to 80 meters thick; it is the region with the most concentrated distribution and the greatest thickness of loess in the world. It is a miracle created by nature and is unique in the world. The Loess Plateau is one of the birthplaces of the Chinese nation. As early as 5,500 years ago, people had already begun farming on the Loess Plateau. With the continuous development of farming, its population kept growing, and during the Qin and Han dynasties it became the political and economic center of China. Today, with the implementation of the Western Development Strategy, the economy of the Loess Plateau region has developed rapidly.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_01
);

-- 听力 Q1 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q01', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q01'
);
SET @q_cet6_2022_12_2_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_02, NULL, '{"A":"A) Prioritizing happiness over money.","B":"B) Joining the club to get her new book.","C":"C) Managing one''s personal finances wisely.","D":"D) Consuming more only when earning more."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_02
);

-- 听力 Q2 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q02', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q02'
);
SET @q_cet6_2022_12_2_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_03, NULL, '{"A":"A) She was in debt.","B":"B) She was a financial adviser.","C":"C) She earned $30,000 a month.","D":"D) She enjoyed a happy life."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_03
);

-- 听力 Q3 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q03', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q03'
);
SET @q_cet6_2022_12_2_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_04, NULL, '{"A":"A) It reflects one''s earning power.","B":"B) It varies with one''s environment.","C":"C) It mirrors one''s sense of well-being.","D":"D) It changes with one''s goals in life."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_04
);

-- 听力 Q4 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q04', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q04'
);
SET @q_cet6_2022_12_2_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_05, NULL, '{"A":"A) It would give him more time to be with his loved ones.","B":"B) It would be good for those who value relationships.","C":"C) It would mean major sacrifices for him.","D":"D) It would deprive him of his individuality."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_05
);

-- 听力 Q5 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q05', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q05'
);
SET @q_cet6_2022_12_2_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_06, NULL, '{"A":"A) It was the artist''s first landscape.","B":"B) It was a painting by Christopher.","C":"C) It was donated by the artist herself.","D":"D) It was displayed at a retirement party."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_06
);

-- 听力 Q6 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q06', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q06'
);
SET @q_cet6_2022_12_2_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_07, NULL, '{"A":"A) It was the painting that instantly made her rich.","B":"B) It has cost him a lot of money to purchase it.","C":"C) It was recently purchased by the gallery.","D":"D) It is owned by an anonymous collector."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_07
);

-- 听力 Q7 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q07', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q07'
);
SET @q_cet6_2022_12_2_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_08, NULL, '{"A":"A) It reflects her emotions.","B":"B) It contains ample details.","C":"C) It appears perfectly symmetrical.","D":"D) It depicts the beauty of desolation."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q08', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q08'
);
SET @q_cet6_2022_12_2_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_09, NULL, '{"A":"A) She is eccentric like any other artist.","B":"B) She is a very nice and intelligent artist.","C":"C) She is as lucky as any acclaimed artist.","D":"D) She is one of the most productive artists."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_09
);

-- 听力 Q9 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q09', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q09'
);
SET @q_cet6_2022_12_2_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_10, NULL, '{"A":"A) It is vital to one''s mental health.","B":"B) It leads to reconciliation and peace.","C":"C) It promotes interpersonal relationship.","D":"D) It keeps one from traumatic experience."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_10
);

-- 听力 Q10 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q10', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q10'
);
SET @q_cet6_2022_12_2_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_11, NULL, '{"A":"A) When the offender has power over the victim.","B":"B) When the offender is not willing to apologize.","C":"C) When the offender is not duly penalized.","D":"D) When the offender adds insult to injury."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_11
);

-- 听力 Q11 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q11', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q11'
);
SET @q_cet6_2022_12_2_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_12, NULL, '{"A":"A) Talk with the offender calmly.","B":"B) Accept the offender''s apology.","C":"C) Find out why he committed the offense.","D":"D) Determine how serious the offense was."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_12
);

-- 听力 Q12 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q12', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q12'
);
SET @q_cet6_2022_12_2_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_13, NULL, '{"A":"A) The number of passengers dropped sharply.","B":"B) It served more and more commuters.","C":"C) The number of stations increased to 50.","D":"D) It became the longest in the United Kingdom."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_13
);

-- 听力 Q13 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q13', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q13'
);
SET @q_cet6_2022_12_2_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_14, NULL, '{"A":"A) To increase capacity to meet growing needs.","B":"B) To make way for other means of transport.","C":"C) To have its systems modernised.","D":"D) To avoid further financial losses."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_14
);

-- 听力 Q14 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q14', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q14'
);
SET @q_cet6_2022_12_2_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_15, NULL, '{"A":"A) It is generally recognised as a world heritage site.","B":"B) It is the fastest way to reach the city''s south side.","C":"C) It constitutes a source of revenue for the city.","D":"D) It helps reduce traffic jams in the city centre."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_15
);

-- 听力 Q15 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q15', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q15'
);
SET @q_cet6_2022_12_2_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_16, NULL, '{"A":"A) They are usually crowded.","B":"B) They use high-tech systems.","C":"C) They accept smartcards only.","D":"D) They are colourfully decorated."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_16
);

-- 听力 Q16 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q16', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q16'
);
SET @q_cet6_2022_12_2_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_17, NULL, '{"A":"A) They are quite friendly to humans.","B":"B) They are shrinking in numbers.","C":"C) They are unafraid of humans.","D":"D) They are especially fond of garbage."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_17
);

-- 听力 Q17 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q17', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q17'
);
SET @q_cet6_2022_12_2_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_18, NULL, '{"A":"A) It is strictly forbidden.","B":"B) It is an uncommon sight.","C":"C) It is a gesture of human generosity.","D":"D) It is allowed only in certain areas."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_18
);

-- 听力 Q18 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q18', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q18'
);
SET @q_cet6_2022_12_2_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_19, NULL, '{"A":"A) Share their food with the bear they see.","B":"B) Be prepared to run into a hungry bear.","C":"C) Try to be friendly with the bear they meet.","D":"D) Refrain from teasing bears with cubs."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_19
);

-- 听力 Q19 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q19', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q19'
);
SET @q_cet6_2022_12_2_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_20, NULL, '{"A":"A) It refers to opinions that are radical and widespread.","B":"B) It means making judgments without adequate knowledge.","C":"C) It refers to deep-rooted beliefs about someone or something.","D":"D) It means sticking to one''s judgments even when proved wrong."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_20
);

-- 听力 Q20 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q20', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q20'
);
SET @q_cet6_2022_12_2_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_21, NULL, '{"A":"A) They often lead to war between religious groups.","B":"B) They keep certain occupations from thriving.","C":"C) They allow myths and half-truths to persist.","D":"D) They prevent us from getting to the truth."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_21
);

-- 听力 Q21 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q21', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q21'
);
SET @q_cet6_2022_12_2_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_22, NULL, '{"A":"A) When we start to feel superior.","B":"B) When we mix with prejudiced people.","C":"C) When we live in an isolated neighborhood.","D":"D) When we try to keep up with those around us."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_22
);

-- 听力 Q22 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q22', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q22'
);
SET @q_cet6_2022_12_2_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_23, NULL, '{"A":"A) Motivated.","B":"B) Disappointed.","C":"C) Perplexed.","D":"D) Shocked."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_23
);

-- 听力 Q23 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q23', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q23'
);
SET @q_cet6_2022_12_2_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_24, NULL, '{"A":"A) They would change with the passage of time.","B":"B) They would benefit young people''s adult life.","C":"C) They would help kids grow.","D":"D) They would last a lifetime."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_24
);

-- 听力 Q24 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q24', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q24'
);
SET @q_cet6_2022_12_2_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_25, NULL, '{"A":"A) He had become mature.","B":"B) He suffered poor health.","C":"C) He had lots of stories to tell.","D":"D) He regretted leaving Vietnam."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_25
);

-- 听力 Q25 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q25', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q25'
);
SET @q_cet6_2022_12_2_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_26, NULL, '{"A":"A) Make friends with his students.","B":"B) Show his students how to do their best.","C":"C) Help his students get through the growing pains.","D":"D) Share his personal experience with his students."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q26'
);
SET @q_cet6_2022_12_2_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_27, NULL, '{"A":"A) aesthetic","B":"B) appropriate","C":"C) clusters","D":"D) competitive","E":"E) exploiting","F":"F) fiscal","G":"G) instances","H":"H) rehabilitated","I":"I) reproduced","J":"J) revenues","K":"K) safeguarding","L":"L) ship","M":"M) strategic","N":"N) transcend","O":"O) undergoing"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q27'
);
SET @q_cet6_2022_12_2_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_28, NULL, '{"A":"A) aesthetic","B":"B) appropriate","C":"C) clusters","D":"D) competitive","E":"E) exploiting","F":"F) fiscal","G":"G) instances","H":"H) rehabilitated","I":"I) reproduced","J":"J) revenues","K":"K) safeguarding","L":"L) ship","M":"M) strategic","N":"N) transcend","O":"O) undergoing"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q28'
);
SET @q_cet6_2022_12_2_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_29, NULL, '{"A":"A) aesthetic","B":"B) appropriate","C":"C) clusters","D":"D) competitive","E":"E) exploiting","F":"F) fiscal","G":"G) instances","H":"H) rehabilitated","I":"I) reproduced","J":"J) revenues","K":"K) safeguarding","L":"L) ship","M":"M) strategic","N":"N) transcend","O":"O) undergoing"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q29'
);
SET @q_cet6_2022_12_2_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_30, NULL, '{"A":"A) aesthetic","B":"B) appropriate","C":"C) clusters","D":"D) competitive","E":"E) exploiting","F":"F) fiscal","G":"G) instances","H":"H) rehabilitated","I":"I) reproduced","J":"J) revenues","K":"K) safeguarding","L":"L) ship","M":"M) strategic","N":"N) transcend","O":"O) undergoing"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q30'
);
SET @q_cet6_2022_12_2_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_31, NULL, '{"A":"A) aesthetic","B":"B) appropriate","C":"C) clusters","D":"D) competitive","E":"E) exploiting","F":"F) fiscal","G":"G) instances","H":"H) rehabilitated","I":"I) reproduced","J":"J) revenues","K":"K) safeguarding","L":"L) ship","M":"M) strategic","N":"N) transcend","O":"O) undergoing"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q31'
);
SET @q_cet6_2022_12_2_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_32, NULL, '{"A":"A) aesthetic","B":"B) appropriate","C":"C) clusters","D":"D) competitive","E":"E) exploiting","F":"F) fiscal","G":"G) instances","H":"H) rehabilitated","I":"I) reproduced","J":"J) revenues","K":"K) safeguarding","L":"L) ship","M":"M) strategic","N":"N) transcend","O":"O) undergoing"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q32'
);
SET @q_cet6_2022_12_2_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_33, NULL, '{"A":"A) aesthetic","B":"B) appropriate","C":"C) clusters","D":"D) competitive","E":"E) exploiting","F":"F) fiscal","G":"G) instances","H":"H) rehabilitated","I":"I) reproduced","J":"J) revenues","K":"K) safeguarding","L":"L) ship","M":"M) strategic","N":"N) transcend","O":"O) undergoing"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q33'
);
SET @q_cet6_2022_12_2_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_34, NULL, '{"A":"A) aesthetic","B":"B) appropriate","C":"C) clusters","D":"D) competitive","E":"E) exploiting","F":"F) fiscal","G":"G) instances","H":"H) rehabilitated","I":"I) reproduced","J":"J) revenues","K":"K) safeguarding","L":"L) ship","M":"M) strategic","N":"N) transcend","O":"O) undergoing"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q34'
);
SET @q_cet6_2022_12_2_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_35, NULL, '{"A":"A) aesthetic","B":"B) appropriate","C":"C) clusters","D":"D) competitive","E":"E) exploiting","F":"F) fiscal","G":"G) instances","H":"H) rehabilitated","I":"I) reproduced","J":"J) revenues","K":"K) safeguarding","L":"L) ship","M":"M) strategic","N":"N) transcend","O":"O) undergoing"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q35'
);
SET @q_cet6_2022_12_2_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_36, NULL, '{"A":"A) aesthetic","B":"B) appropriate","C":"C) clusters","D":"D) competitive","E":"E) exploiting","F":"F) fiscal","G":"G) instances","H":"H) rehabilitated","I":"I) reproduced","J":"J) revenues","K":"K) safeguarding","L":"L) ship","M":"M) strategic","N":"N) transcend","O":"O) undergoing"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q36'
);
SET @q_cet6_2022_12_2_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_37, 'A new study found parents'' aversion to certain animals would pass on to their children.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q37'
);
SET @q_cet6_2022_12_2_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_38, 'The disappearance of species and ecological systems erodes our ability to keep what is left.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q38'
);
SET @q_cet6_2022_12_2_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_39, 'A study showed that the wildest areas of Discovery Park appealed most to the public.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q39'
);
SET @q_cet6_2022_12_2_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_40, 'The fear of living organisms is becoming more worrisome.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q40'
);
SET @q_cet6_2022_12_2_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_41, 'Preventing the increase in children''s fear of living creatures is also important for conserving biodiversity.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q41'
);
SET @q_cet6_2022_12_2_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_42, 'Research shows that more and deeper experience people have with nature will help save it.', NULL, 'P', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q42'
);
SET @q_cet6_2022_12_2_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_43, 'Though humans naturally tend to avoid dangerous animals, today''s children try to stay away from even harmless ones.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q43'
);
SET @q_cet6_2022_12_2_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_44, 'Development in and around Discovery Park could cause heavy losses to the park and the local residents.', NULL, 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q44'
);
SET @q_cet6_2022_12_2_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_45, 'A large survey of school children found that their negative feelings grew as their experience with nature diminished.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q45'
);
SET @q_cet6_2022_12_2_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_46, 'Elizabeth Lev believes increased contact with more wildlife helps conserve biodiversity.', NULL, 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q46'
);
SET @q_cet6_2022_12_2_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_47, 'Why do some people advocate forgiving student loan debt?', '{"A":"A) They assert it will narrow the gap between the wealthy and the poor.","B":"B) They believe it will benefit both the economy and the underprivileged.","C":"C) They claim it will eliminate economic distress among college students.","D":"D) They think the cost of education is the responsibility of the government."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q47'
);
SET @q_cet6_2022_12_2_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_48, 'What do we learn from the Federal Reserve data?', '{"A":"A) Approximately 60% of student debt remains unpaid.","B":"B) Cancelling student debt benefits wealthy families most.","C":"C) Forgiving student debt provides little benefit to universities.","D":"D) Low-income families owe the biggest amount of student debt."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q48'
);
SET @q_cet6_2022_12_2_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_49, 'What does the author say students are likely to do if they know they needn''t repay their loans?', '{"A":"A) They will choose to study subjects without considering their job prospects.","B":"B) They will be free to pursue their goals without being burdened financially.","C":"C) They will over-borrow and live beyond their means.","D":"D) They will be able to enroll in expensive universities."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q49'
);
SET @q_cet6_2022_12_2_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_50, 'What does the author imply about colleges offering online education?', '{"A":"A) They cannot get away with the serious consequences.","B":"B) They have suffered greatly from the current pandemic.","C":"C) The tuition they charge is not justified by the quality of their service.","D":"D) The tuition they charge has surged outrageously during the pandemic."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q50'
);
SET @q_cet6_2022_12_2_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_51, 'What will happen if any of the proposed student debt plans is implemented?', '{"A":"A) Plumbers and retail workers will have a chance of becoming professionals.","B":"B) Working-class students will have increasing access to subsidized education.","C":"C) Blue-collar workers will have to bear the cost of educating would-be high-earners.","D":"D) A growing number of students will be able to earn degrees in medicine and law."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q51'
);
SET @q_cet6_2022_12_2_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_52, 'What do we learn about the "No screens under 2" rule?', '{"A":"A) It has met more and more resistance from parents.","B":"B) It has proved helpful to children''s healthy growth.","C":"C) It confuses parents with regard to kids'' education.","D":"D) It has been discarded in line with recent research."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q52'
);
SET @q_cet6_2022_12_2_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_53, 'What do the new AAP guidelines advocate?', '{"A":"A) Young children should be accompanied by parents during screen time.","B":"B) Parents should be emotionally involved in their children''s upbringing.","C":"C) Young children should watch videos carefully selected by parents.","D":"D) Parents should protect their children from too much media exposure."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q53'
);
SET @q_cet6_2022_12_2_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_54, 'What do families think of live video chat according to surveys?', '{"A":"A) It should not be regarded as screen time.","B":"B) It helps babies to develop their verbal skills.","C":"C) It is not as harmful as playing games on laptops.","D":"D) It is a good substitute for video viewing."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q54'
);
SET @q_cet6_2022_12_2_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_55, 'What do researchers find about kids solo viewing educational videos?', '{"A":"A) It arouses their interest in language learning.","B":"B) It works no better than reading picture books.","C":"C) It hampers their development of language skills.","D":"D) It helps them acquire independent learning skills."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-2-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q55'
);
SET @q_cet6_2022_12_2_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-2-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_2_56, 'What does the author say about preschoolers ages 2 to 5?', '{"A":"A) They can understand pretty well what they see on the screen.","B":"B) They can learn on their own without much parental guidance.","C":"C) They can make use of educational videos to develop digital literacy.","D":"D) They can relate what they learn on the screen to real life situations."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_2_56
);

-- ==================== cet6-2022-12-3 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-r1', 'BANKED_CLOZE', 'CET6', NULL, 'American colleges and universities are using 64 percent less coal than they did a decade ago, burning 700,000 tons last year, down from 2 million tons in 2008, the U.S. Energy Information Administration (EIA) said in a report __26__ yesterday. All 57 schools that were burning coal in 2008 are using less now, and 20 have __27__ coal completely, EIA found. Most universities have turned to natural gas as a __28__ , with state funding backing the fuel switch. While academic institutions use less than 0.1 percent of U.S. coal burned for power, campus coal use has a history dating back to the 1800s when __29__ to power was scarce. Many universities still operate their own power plants. The Public Utility Regulatory Policies Act of 1978 encouraged more electricity generation by allowing institutions to sell __30__ power to utilities. But EIA noted many coal-fired universities have signed onto the American College and University Presidents Climate Commitment, which was launched in 2007. About 665 schools are part of the program, which aims to __31__ greenhouse gas emissions. Thirty percent of the participants have pledged to be carbon __32__ within 20 years. The Sierra Club''s Beyond Coal campaign, which also leads campaigns for universities to withdraw their __33__ in coal and other fossil fuels, lists 22 schools that have pledged to move "beyond coal," including Clemson University, Indiana University, Ohio University, Penn State University, the University of Louisville and the University of Tennessee, Knoxville. The largest coal use __34__ at colleges were in Michigan, Missouri, Tennessee and Indiana. Indiana''s universities alone cut coal __35__ by 81 percent between 2008 and 2015. During the same period, Michigan made an 80 percent cut and Tennessee cut back by 94 percent at state institutions.', NULL, '["A) abandoned","B) access","C) consumption","D) contrive","E) duplications","F) investments","G) mobilized","H) negligent","I) neutral","J) reductions","K) released","L) replacement","M) slash","N) surplus","O) void"]', 289, 'IMPORT', 'cet6-2022-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-3-r1'
);
SET @pg_cet6_2022_12_3_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-3-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-r2', 'MATCHING', 'CET6', 'Classical music aims to evolve, build audiences without alienating old guard', 'A) In 1913, classical music sparked a riot in Paris. Igor Stravinsky was introducing his revolutionary "Rite of Spring" ballet to the world, with its discordant melodies and unorthodox choreography(编舞), and the purists in the crowd expressed their disapproval loud and clear. It might have been classical music''s version of the time Bob Dylan went electric at the Newport Folk Festival. "The noise, fighting, and shouting in the audience got so loud," NPR''s music reporter Miles Hoffman said of the Stravinsky debut, "that the choreographer had to shout out the numbers to the dancers so that they knew what they were supposed to do." B) It''s difficult to imagine a similar disturbance occurring today within America''s sacred symphony halls. In fact, it''s hard to picture any kind of disruptive activity at all (unless someone''s cell phone happens to go off, and then you''d better watch your back). A mannerly aura(氛围) hangs over most classical proceedings, and many of the genre''s biggest supporters would have it no other way. C) Today, Western audiences for classical music and opera and ballet are almost always well dressed, older, respectful, achingly silent and often very wealthy (one has to be able to afford most tickets). But as many of America''s most storied "highbrow"( 高雅的) institutions struggle financially—the Philadelphia Orchestra''s much-publicized rebound from bankruptcy is just one recent example—classical music fans and theorists are wondering how the medium can weave itself into the 21st century''s cultural fabric without sacrificing its integrity. D) For example, should we feel OK "clapping" during classical music events, even if nobody else is? Why shouldn''t we cheer for something great, like we do at a rock concert? The Huffington Post recently ran a Great Debate on this issue and many commenters came out on the side of silence. "There is no more rewarding experience in life than being part of an audience where everybody is leaning forward in silence, thoroughly carried away by a great performance of a masterpiece," one commenter wrote. "Why is it so difficult for folks to develop an appreciation and understanding for the mannerisms and traditions of classical music?" asked another. E) The truth is that classical music audiences weren''t always so polite. Robert Greenberg, an award-winning composer, said that when Beethoven first performed his 7th Symphony, audiences forced the orchestra to perform encores(重演) of certain movements immediately, applauding wildly. And in the last few decades, he said, many audiences at opera performances have abandoned pretenses, yelling "Bravo" when they feel like it. F) "I don''t think there''s anything wrong with an audience showing their enthusiasm for a proper moment by applauding, showing their joy," Greenberg said, noting that the stuffiness in concert halls is "one aspect of contemporary concert etiquette" he doesn''t understand. "Instead of waiting half an hour to show enthusiasm, why not show it every eight or nine minutes?" G) Until the rules about behavior and clothing change, it''s hard to imagine multitudes of young people filling concert halls on their own accord. They''re probably more likely to head to Central Park to watch a free performance with a bottle of wine and their friends. "I think anyone should be able to come into a performance dressed any way they like, and be comfortable any way they like, sitting in that seat ready to enjoy themselves," Greenberg said. "Because it''s enjoyable." H) Greenberg stressed that he doesn''t want people to start respecting the music less, and he''s not suggesting that we "dumb down" the experience. Rather, it''s about opening up "access." When operas first instituted subtitles(字幕) during shows, he said, many purists didn''t like the idea, believing that the audience should instead study the works before attending. But now it''s commonplace to find titles on the seatback in front of you—choose a language, sit back, and understand what''s going on. I) Allison Vulgamore, president of the Philadelphia Orchestra, is certainly looking to the future. She says certain "classics concerts" dedicated to the old masters will always exist, but not every program has to feature Beethoven and Brahms—or even a stage and seats. "We''re trying to introduce different kinds of concerts in different ways," she said. "We are an interactive society now, where people like to learn." J) As the Philadelphia Orchestra rebounds from its financial straits, it is also aiming to experiment, without alienating the loyalists. Vulgamore pointed to Cirque de la Symphonie, a recent offering in which jugglers(玩 杂耍的人) and acrobats(杂技演员) interacted with musicians. An upcoming collaboration with New York City''s Ridge Theatre, meanwhile, will feature a "suspended dance installation" and other theatrical elements occurring in conjunction with an orchestral piece. K) The orchestra also continues to offer $25 annual memberships to Philadelphia students, who can buy rush tickets to every concert on the schedule. "Students line up for the concerts they want, and we get roughly 300 or 350 kids a night coming to these. They take any of the open seats available, 5 minutes before the concert starts," Vulgamore said. "It''s like the running of the bulls, that energy when the doors open." L) Greenberg thinks that youthful energy needs to be harvested. Conductors don''t have to be arrogant and untouchable—they can be accessible. Perhaps there could even be a "bit of humor" about them, he suggested, and an abandoning of pretension within the high-art institutions themselves. "On one hand, these organizations are all saying the same thing: we want more general audiences, to break down cultural barriers," he said. "But then they come up with some very snooty(目中无人的) thing that makes you crazy." M) John Terauds, a critic who has covered Toronto''s classical music scene extensively, also wants to do away with the stuffiness. He suggested that the warmer an audience is, the better the musicians themselves will respond. "But the producer or organizer has to let everyone know it''s OK," he said. "It''s OK to enjoy yourself." At the Toronto Symphony Orchestra, for example, conductor Peter Oundjian often stops between pieces, taking a moment to talk about the composer or the music in a very amiable way. And some nights, Terauds said, "at least a third" of the audience consists of students who have purchased cheaper tickets. On these nights, the energy of the room drastically shifts. It becomes a less intimidating place. N) Back in February, Terauds wrote on his blog about how going to classical performances can be intimidating. Certain people "think they have to dress up," he wrote. "They think they have to know something about the music before they go. And, I''m sure, sitting in a seat, trembling in fear that this might be the wrong time to applaud, is also one of the factors." O) Everyone in the classical world agrees on the need for increased "accessibility," but achieving it is often easier said than done. Nowadays, there are unknown, unorthodox opera singers wowing(博得……的喝彩) viewers on TV programs like "America''s Got Talent" and "The Voice". What can higher institutions do with any of that? And if they appeal to these outlets, do they risk compromising the integrity or the intelligence of the music? P) Vulgamore seems to understand this. She thinks an organization can have it both ways, claiming the new while keeping the old. And as she reorganizes the Philadelphia Orchestra, she will attempt to do just that. "The world''s most respected musicians brought together as an orchestra will always exist," she said. "But it''s essential that we be willing to experiment and fail."', NULL, NULL, 1242, 'IMPORT', 'cet6-2022-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-3-r2'
);
SET @pg_cet6_2022_12_3_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-3-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-r3', 'CAREFUL_READING', 'CET6', NULL, 'How can one person enjoy good health, while another person looks old before her time? Humans have been asking this question for thousands of years, and recently, it''s becoming clearer and clearer to scientists that the differences between people''s rates of aging lie in the complex interactions among genes, social relationships, environments and lifestyles. Even though you were born with a particular set of genes, the way you live can influence how they express themselves. Some lifestyle factors may even turn genes on or shut them off. Deep within the genetic heart of all our cells are telomeres, or repeating segments of noncoding DNA that live at the ends of the chromosomes(染色体). They form caps at the ends of the chromosomes and keep the genetic material together. Shortening with each cell division, they help determine how fast a cell ages. When they become too short, the cell stops dividing altogether. This isn''t the only reason a cell can age—there are other stresses on cells we don''t yet understand very well—but short telomeres are one of the major reasons human cells grow old. We''ve devoted most of our careers to studying telomeres, and one extraordinary discovery from our labs is that telomeres can actually lengthen. Scientists have learned that several thought patterns appear to be unhealthy for telomeres, and one of them is cynical hostility. Cynical hostility is defined by high anger and frequent thoughts that other people cannot be trusted. Someone with hostility doesn''t just think, "I hate to stand in long lines"; they think, "Others deliberately sped up and beat me to my rightful position in the line!"—and then get violently agitated. People who score high on measures of cynical hostility tend to get more heart disease, metabolic disease and often die at younger ages. They also have shorter telomeres. In a study of British civil servants, men who scored high on measures of cynical hostility had shorter telomeres than men whose hostility scores were low. The most hostile men were 30% more likely to have short telomeres. What this means: aging is a dynamic process that could possibly be accelerated or slowed—and, in some aspects, even reversed. To an extent, it has surprised us and the rest of the scientific community that telomeres do not simply carry out the commands issued by your genetic code. Your telomeres are listening to you. The foods you eat, your response to challenges, the amount of exercise you get, and many other factors appear to influence your telomeres and can prevent premature aging at the cellular level. One of the keys to enjoying good health is simply doing your part to foster healthy cell renewal.', NULL, NULL, 443, 'IMPORT', 'cet6-2022-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-3-r3'
);
SET @pg_cet6_2022_12_3_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-3-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-r4', 'CAREFUL_READING', 'CET6', NULL, 'Scientists have created by accident an enzyme(酶) that breaks down plastic drinks bottles. The breakthrough could help solve the global plastic pollution crisis by enabling for the first time the full recycling of bottles. The new research was spurred by the discovery in 2016 of the first bacterium that had naturally evolved to eat plastic at a waste dump in Japan. Scientists have now revealed the detailed structure of the crucial enzyme produced by the bug. An international team then adjusted the enzyme to see how it had evolved, but tests showed they had accidentally made the molecule even better at breaking down the plastic used for drinks bottles. "What actually turned out was we improved the enzyme, which was a bit of a shock," said head researcher Prof. McGeehan, at the University of Portsmouth, UK. Currently, the enzyme takes a few days to start breaking down the plastic, far faster than the centuries it takes in the oceans, but the researchers are optimistic this can be speeded up even further and become a viable large-scale process. "What we are hoping to do is use this enzyme to turn this plastic back into its original components, so we can literally recycle it back to plastic," said McGeehan. "It means we won''t need to dig up any more oil and, fundamentally, it should reduce the amount of plastic in the environment." About 1 million plastic bottles are sold each minute around the globe and, with just 14% recycled, many end up in the oceans where they have polluted even the remotest parts, harming marine life and potentially people who eat sea food. "Plastic is incredibly resistant to degradation," said McGeehan. "It is one of these wonder materials that has been made a little bit too well." Currently those bottles that are recycled can only be turned into opaque fibres for clothing or carpets, while the new enzyme indicates a way to recycle old clear plastic bottles back into new clear plastic bottles. "You are always up against the fact oil is cheap, so plastic is cheap," said McGeehan. "It is so easy for manufacturers to generate more of that stuff, rather than even try to recycle, but I believe there is a public interest here: perception is changing so much that companies are starting to look at how they can properly recycle these bottles." Prof. Adisa Azapagic, at the University of Manchester in the UK, agreed the enzyme could be useful but added: "A full life-cycle assessment would be needed to ensure that the technology does not solve one environmental problem—waste—at the expense of others, including additional greenhouse gas emissions."', NULL, NULL, 439, 'IMPORT', 'cet6-2022-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-3-r4'
);
SET @pg_cet6_2022_12_3_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2022-12-3-r4' LIMIT 1);

-- 翻译 cet6-2022-12-3
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-translation'
);
SET @q_cet6_2022_12_3_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_01, '云贵高原(the Yunnan-Guizhou Plateau)大部分位于云南、贵州省境内，总面积约50万平方公里，平均海拔2000-4000米，是中国第四大高原。云贵高原西高东低，河流众多，形成了许多又深又陡的峡谷(canyon)。 峡谷中许多地方土壤肥沃，非常有利于多种农作物生长。 云贵高原独特的自然环境造就了生物和文化的多样性。它是中国森林和矿产资源类型十分丰富的地区，也是古人类起源的重要地区。云贵高原是中国少数民族数量最多的地区，各民族都保留了自己丰富多彩的文化传统。', NULL, 'Located mostly in Yunnan Province and Guizhou Province, the Yunnan-Guizhou Plateau, with a total area of about 500,000 square kilometers and an average altitude of 2,000 to 4,000 meters, is the fourth largest plateau in China. High in the west and low in the east, the plateau is crisscrossed by numerous rivers, which have carved out many deep and steep canyons. In many parts of these canyons, the soil is fertile, which is highly favorable for the growth of various crops. Such a unique natural environment has given rise to rich biological and cultural diversity. It is a region rich in various types of forest and mineral resources in China, and it is also an important area for the origin of ancient humans. The Yunnan-Guizhou Plateau is home to the largest number of ethnic minorities in China, where each ethnic group has preserved its own rich and colorful cultural traditions.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_01
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q26'
);
SET @q_cet6_2022_12_3_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_02, NULL, '{"A":"A) abandoned","B":"B) access","C":"C) consumption","D":"D) contrive","E":"E) duplications","F":"F) investments","G":"G) mobilized","H":"H) negligent","I":"I) neutral","J":"J) reductions","K":"K) released","L":"L) replacement","M":"M) slash","N":"N) surplus","O":"O) void"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_02
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q27'
);
SET @q_cet6_2022_12_3_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_03, NULL, '{"A":"A) abandoned","B":"B) access","C":"C) consumption","D":"D) contrive","E":"E) duplications","F":"F) investments","G":"G) mobilized","H":"H) negligent","I":"I) neutral","J":"J) reductions","K":"K) released","L":"L) replacement","M":"M) slash","N":"N) surplus","O":"O) void"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_03
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q28'
);
SET @q_cet6_2022_12_3_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_04, NULL, '{"A":"A) abandoned","B":"B) access","C":"C) consumption","D":"D) contrive","E":"E) duplications","F":"F) investments","G":"G) mobilized","H":"H) negligent","I":"I) neutral","J":"J) reductions","K":"K) released","L":"L) replacement","M":"M) slash","N":"N) surplus","O":"O) void"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_04
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q29'
);
SET @q_cet6_2022_12_3_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_05, NULL, '{"A":"A) abandoned","B":"B) access","C":"C) consumption","D":"D) contrive","E":"E) duplications","F":"F) investments","G":"G) mobilized","H":"H) negligent","I":"I) neutral","J":"J) reductions","K":"K) released","L":"L) replacement","M":"M) slash","N":"N) surplus","O":"O) void"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_05
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q30'
);
SET @q_cet6_2022_12_3_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_06, NULL, '{"A":"A) abandoned","B":"B) access","C":"C) consumption","D":"D) contrive","E":"E) duplications","F":"F) investments","G":"G) mobilized","H":"H) negligent","I":"I) neutral","J":"J) reductions","K":"K) released","L":"L) replacement","M":"M) slash","N":"N) surplus","O":"O) void"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_06
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q31'
);
SET @q_cet6_2022_12_3_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_07, NULL, '{"A":"A) abandoned","B":"B) access","C":"C) consumption","D":"D) contrive","E":"E) duplications","F":"F) investments","G":"G) mobilized","H":"H) negligent","I":"I) neutral","J":"J) reductions","K":"K) released","L":"L) replacement","M":"M) slash","N":"N) surplus","O":"O) void"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_07
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q32'
);
SET @q_cet6_2022_12_3_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_08, NULL, '{"A":"A) abandoned","B":"B) access","C":"C) consumption","D":"D) contrive","E":"E) duplications","F":"F) investments","G":"G) mobilized","H":"H) negligent","I":"I) neutral","J":"J) reductions","K":"K) released","L":"L) replacement","M":"M) slash","N":"N) surplus","O":"O) void"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_08
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q33'
);
SET @q_cet6_2022_12_3_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_09, NULL, '{"A":"A) abandoned","B":"B) access","C":"C) consumption","D":"D) contrive","E":"E) duplications","F":"F) investments","G":"G) mobilized","H":"H) negligent","I":"I) neutral","J":"J) reductions","K":"K) released","L":"L) replacement","M":"M) slash","N":"N) surplus","O":"O) void"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_09
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q34'
);
SET @q_cet6_2022_12_3_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_10, NULL, '{"A":"A) abandoned","B":"B) access","C":"C) consumption","D":"D) contrive","E":"E) duplications","F":"F) investments","G":"G) mobilized","H":"H) negligent","I":"I) neutral","J":"J) reductions","K":"K) released","L":"L) replacement","M":"M) slash","N":"N) surplus","O":"O) void"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_10
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q35'
);
SET @q_cet6_2022_12_3_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_11, NULL, '{"A":"A) abandoned","B":"B) access","C":"C) consumption","D":"D) contrive","E":"E) duplications","F":"F) investments","G":"G) mobilized","H":"H) negligent","I":"I) neutral","J":"J) reductions","K":"K) released","L":"L) replacement","M":"M) slash","N":"N) surplus","O":"O) void"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_11
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q36'
);
SET @q_cet6_2022_12_3_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_12, 'It was not a rare occurrence that audiences behaved wildly while listening to classical music.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_12
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q37'
);
SET @q_cet6_2022_12_3_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_13, 'Some high-art institutions don''t actually mean it when they say they want more general audiences.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_13
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q38'
);
SET @q_cet6_2022_12_3_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_14, 'The theatre was in chaos when an unconventional ballet was first put on stage in the capital of France.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_14
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q39'
);
SET @q_cet6_2022_12_3_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_15, 'According to one critic, the audience''s warm response would encourage the musicians to do a better job.', NULL, 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_15
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q40'
);
SET @q_cet6_2022_12_3_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_16, 'Many commenters argued for the audience enjoying classical music quietly.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_16
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q41'
);
SET @q_cet6_2022_12_3_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_17, 'What appears on the seatback screen makes it unnecessary for the audience to study the works beforehand.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_17
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q42'
);
SET @q_cet6_2022_12_3_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_18, 'It is generally accepted that there should be no disturbance from the audience during classical music performance.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_18
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q43'
);
SET @q_cet6_2022_12_3_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_19, 'Higher institutions will be concerned about compromising the integrity of classical music if they have to resort to the television medium.', NULL, 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_19
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q44'
);
SET @q_cet6_2022_12_3_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_20, 'Heavily discounted rush tickets help attract many young students to attend classical concerts.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_20
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q45'
);
SET @q_cet6_2022_12_3_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_21, 'The formalities of high-art theatres can intimidate some people attending a performance.', NULL, 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_21
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q46'
);
SET @q_cet6_2022_12_3_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_22, 'What have scientists come to know better today?', '{"A":"A) Why people age at different rates.","B":"B) How genes influence the aging process.","C":"C) How various genes express themselves in aging.","D":"D) Why people have long been concerned about aging."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_22
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q47'
);
SET @q_cet6_2022_12_3_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_23, 'Why are some lifestyle factors considered extremely important?', '{"A":"A) They may shorten the process of cell division.","B":"B) They may determine how genes function.","C":"C) They may affect the lifespan of telomeres.","D":"D) They may account for the stresses on cells."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_23
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q48'
);
SET @q_cet6_2022_12_3_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_24, 'What have the author and his colleagues discovered about telomeres?', '{"A":"A) Their number affects the growth of cells.","B":"B) Their length determines the quality of life.","C":"C) Their shortening process can be reversed.","D":"D) Their health impacts the division of cells."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_24
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q49'
);
SET @q_cet6_2022_12_3_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_25, 'What have scientists learned about cynical hostility?', '{"A":"A) It may lead to confrontational thought patterns.","B":"B) It may produce an adverse effect on telomeres.","C":"C) It may cause people to lose their temper frequently.","D":"D) It may stir up agitation among those in long lines."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_25
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q50'
);
SET @q_cet6_2022_12_3_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_26, 'What do we learn from the last paragraph about the process of aging?', '{"A":"A) It may vary from individual to individual.","B":"B) It challenges scientists to explore further.","C":"C) It depends on one''s genetic code.","D":"D) It may be controlled to a degree."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_26
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q51'
);
SET @q_cet6_2022_12_3_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_27, 'What do we learn from the passage about an enzyme scientists have created?', '{"A":"A) It was identified during a lab experiment accident.","B":"B) It may make full recycling of plastic bottles a reality.","C":"C) It was a breakthrough made with persistent efforts.","D":"D) It may initiate a radical reform in plastic industry."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_27
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q52'
);
SET @q_cet6_2022_12_3_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_28, 'What does the passage say about the bug that produces the important enzyme?', '{"A":"A) It has a natural ability to consume plastics.","B":"B) It is a bacterium that reproduces at a high rate.","C":"C) It is essential to the recycling of plastic bottles.","D":"D) It has a chemical structure unknown to scientists."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_28
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q53'
);
SET @q_cet6_2022_12_3_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_29, 'By adjusting the enzyme produced by the bug, the scientists_______.', '{"A":"A) made it more effective by chance","B":"B) discovered an extraordinary chemical","C":"C) altered its basic molecular composition","D":"D) found its evolutionary process sped up"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_29
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q54'
);
SET @q_cet6_2022_12_3_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_30, 'What does Prof. McGeehan say about the recycling of plastic bottles?', '{"A":"A) Manufacturers are implementing it on an increasingly larger scale.","B":"B) It generates huge business opportunities for plastic manufacturers.","C":"C) It has aroused persistent interest among the general public.","D":"D) Manufacturers are beginning to explore ways of doing it."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_30
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2022-12-3-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2022_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q55'
);
SET @q_cet6_2022_12_3_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2022-12-3-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2022_12_3_31, 'What is Prof. Adisa Azapagic''s advice concerning the application of the enzyme?', '{"A":"A) Developing technologies to address greenhouse gas emissions.","B":"B) Considering the extra cost involved in producing the enzyme.","C":"C) Assessing its possible negative impact on the environment.","D":"D) Studying the full life cycle of the enzyme as the first step."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2022_12_3_31
);

-- ==================== cet6-2023-03-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-r1', 'BANKED_CLOZE', 'CET6', NULL, 'Unthinkable as it may be, humanity, every last person, could someday be wiped from the face of the Earth. We have learned to worry about asteroids( 小行星) and super volcanoes, but the more likely __26__ , according to Nick Bostrom, a professor of philosophy at Oxford, is that we humans will destroy ourselves. Professor Bostrom, who directs Oxford''s Future of Humanity Institute, has argued over the course of several papers that human __27__ risks are poorly understood and, worse still, __28__ underestimated by society. Some of these existential risks are fairly well known, especially the natural ones. But others are __29__ or even exotic. Most worrying to Bostrom is the subset of existential risks that __30__ from human technology, a subset that he expects to grow in number and potency over the next century. Despite his concerns about the risks __31__ to humans by technological progress, Bostrom is no luddite(科技进步反对者). In fact, he is a longtime __32__ of trans-humanism—the effort to improve the human condition, and even human nature itself, through technological means. In the long run he sees technology as a bridge, a bridge we humans must cross with great care, in order to reach new and better modes of being. In his work, Bostrom uses the tools of philosophy and mathematics, in __33__ , probability theory, to try and determine how we as a __34__ might achieve this safe passage. What follows is my conversation with Bostrom about some of the most interesting and worrying existential risks that humanity might __35__ in the decades and centuries to come, and about what we can do to make sure we outlast them.', NULL, '["A) advocate","B) arise","C) emphasized","D) encounter","E) essential","F) evaporation","G) extinction","H) obscure","I) particular","J) posed","K) scenario","L) severely","M) shrewdly","N) species","O) variety"]', 272, 'IMPORT', 'cet6-2023-03-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-03-1-r1'
);
SET @pg_cet6_2023_03_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-03-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-r2', 'MATCHING', 'CET6', 'San Francisco Has Become One Huge Metaphor for Economic Inequality in America', 'A) The fog still chills the morning air and the cable cars still climb halfway to the stars. Yet on the ground, the Bay area has changed greatly since singer Tony Bennett left his heart here. Silicon Valley and the tech industry have led the region into a period of unprecedented wealth and innovation. But existing political and land limits have caused an alarming housing crisis and astronomical rise in social and economic difference. B) While the residents of most cities display pride and support for their home industries, drastic market distortions in the San Francisco Bay Area have created boiling resentment in the region towards the tech industry. A vocal minority is even calling on officials to punish those who are benefitting from the economic and housing boom. If this boom and its consequences are not resolved, a drastic increase in social and economic difference may have a profound impact on the region for generations. A history and analysis of this transformation may hold invaluable insights about the opportunities. Perils of tech cities are currently being cultivated across the US, and indeed around the world. C) According to a recent study, San Francisco ranks first in California for economic difference. The average income of the top 1% of households in the city averages $3.6 million. This is 44 times the average income of those at the bottom, which stands at $81,094. The top 1% of the San Francisco peninsula''s share of total income now extends to 30.8% of the region''s income. This was a dramatic jump from 1989, where it stood at 15.8%. D) The region''s economy has been fundamentally transformed by the technology industry springing from Silicon Valley. Policies pushed by Mayor Ed Lee provided tax breaks for tech companies to set up shop along the city''s long-neglected Mid-Market area. The city is now home to Twitter, Uber, Airbnb, Pinterest, Dropbox and others. In short, the Bay Area has become a global magnet for those with specialized skills, which has in turn helped fuel economic enthusiasm, and this economic growth has reduced unemployment to 3.4%, an admirable feat. E) In spite of all that, the strength of the recent job growth, combined with policies that have traditionally limited housing development in the city and throughout the peninsula, did not help ease the affordability crisis. In 2015 alone, the Bay Area added 64,000 in jobs. In the same year, only 5,000 new homes were built. F) With the average house in the city costing over $1.25 million and average flat prices over $1.11 million, the minimum qualifying income to purchase a house has increased to $254,000. Considering that the average household income in the city currently stands at around $80,000, it is not an exaggeration to say that the dream of home ownership is now beyond the grasp of the vast majority of today''s people who rent. G) For generations, the stability and prosperity of the American middle class have been anchored by home ownership. Studies have consistently shown that the value of land has overtaken overall income growth, thus providing a huge advantage to property owners as a vehicle of wealth building. When home prices soar above the reach of most households, the gap between the rich and the poor dramatically increases. H) If contributing factors leading to housing becoming less than affordable are not resolved over multiple generations, a small elite will control a vast share of the country''s total wealth. The result? A society where the threat of class warfare would loom large. A society''s level of happiness is tied less to measures of quantitative wealth and more to measures of qualitative wealth. This means that how a person judges their security in comparison to their neighbors'' has more of an impact on their happiness than their objective standard of living. At the same time, when a system no longer provides opportunities for the majority to participate in wealth building, it not only robs those who are excluded from opportunities, but also deprives them of their dignity. I) San Francisco and the Bay Area have long been committed to values which embrace inclusion and rejection of mainstream culture. To see these values coming apart so publicly adds insult to injury for a region once defined by its progressive social fabric. In the face of resentment, it is human to want revenge. But deteriorating policies such as heavily taxing technology companies or real estate developers are not likely to shift the balance. J) The housing crisis is caused by two primary factors: the growing desirability of the Bay Area as a place to live due to its excellent economy, and our limited housing stock. Although the city is experiencing an unprecedented boom in new housing, more units are sorely needed. Protection policies were originally designed to suppress bad development and boost historic preservation in our urban areas. Now, too many developers are experiencing excessive delays. Meanwhile, there are the land limitations of the Bay Area to consider. The region is surrounded by water and mountains. Local governments need to aid development as well. This means increasing housing density throughout the region and building upwards while streamlining the approval process. K) Real estate alone will not solve the problem, of course. Transportation, too, needs to be updated and infrastructure extended to link distant regions to Silicon Valley and the city. We need to build an effective high-speed commuting system linking the high-priced and crowded Bay Area with the low-priced and low- density Central Valley. This would dramatically reduce travel times. And based on the operating speeds of hovering trains used in countries such as Japan or Spain, high-speed rail could shorten the time to travel between San Francisco and California''s capital, Sacramento, or from Stockton to San Jose, to under 30 minutes. This system would bring once distant regions within reasonable commute to heavy job centers. The city also needs to update existing transportation routes combined with smart home-building policies that dramatically increase housing density in areas surrounding high-speed rail stations. By doing so, we will be able to build affordable housing within acceptable commuting distances for a significant bulk of the workforce. L) Our threatening housing crisis forces the difficult question of what type of society we would like to be. Will it be one where the elite command the vast bulk of wealth and regional culture is defined by an aggressive business world? We were recently treated to a taste of the latter, when local tech employee Justin Keller wrote an open letter to the city complaining about having to see homeless people on his way to work. M) It doesn''t have to be this way. But solutions need to be implemented now, before angry crowds grow from a nuisance to serious concern. It may take less than you might think. And in fact, the solutions to our housing crisis are already fairly clear. We need to increase the density of housing units. We need to use existing technology to shorten travel times and break the land limits. There is a way to solve complex social and economic problems without abandoning social responsibility. This is the Bay Area''s opportunity to prove that it can innovate more than just technology.', NULL, NULL, 1203, 'IMPORT', 'cet6-2023-03-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-03-1-r2'
);
SET @pg_cet6_2023_03_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-03-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-r3', 'CAREFUL_READING', 'CET6', NULL, 'The ability to make inferences from same and different, once thought to be unique to humans, is viewed as a cornerstone of abstract intelligent thought. A new study, however, has shown that what psychologists call same- different discrimination is present in creatures generally seen as unintelligent: newborn ducklings(小鸭). The study, published Thursday in Science, challenges our idea of what it means to have a birdbrain, said Edward Wasserman, an experimental psychologist at the University of Iowa who wrote an independent review of the study. "In fact, birds are extremely intelligent and our problem pretty much lies in figuring out how to get them to ''talk'' to us, or tell us how smart they really are," he said. Antone Martinho and Alex Kacelnik, co-authors of the new paper, devised a clever experiment to better test bird intelligence. First, they took 1-day-old ducklings and exposed them to a pair of moving objects. The two objects were either the same or different in shape or color. Then they exposed each duckling to two entirely new pairs of moving objects. The researchers found that about 70% of the ducklings preferred to move toward the pair of objects that had the same shape or color relationship as the first objects they saw. A duckling that was first shown two green spheres, in other words, was more likely to move toward a pair of blue spheres than a mismatched pair of orange and purple spheres. Ducklings go through a rapid learning process called imprinting shortly after birth—it''s what allows them to identify and follow their mothers. These findings suggest that ducklings use abstract relationships between sensory inputs like color, shape, sounds and odor to recognize their mothers, said Dr. Kacelnik. By studying imprinting, the authors of this study have shown for the first time that an animal can learn relationships between concepts without training, said Jeffrey Katz, an experimental psychologist at Auburn University who was not involved in the study. Previous studies have suggested that other animals, including pigeons, dolphins, honeybees and some primates(灵长类动物), can discern same from different, but only after extensive training. Adding ducklings to the list—particularly untrained newborn ducklings—suggests that the ability to compare abstract concepts "is far more necessary to a wider variety of animals'' survival than we previously thought," Dr. Martinho said. He believes the ability is so crucial because it helps animals consider context when identifying objects in their environment. It''s clear from this study and others like it that "animals process and appreciate far more of the intricacies in their world than we''ve ever understood," Dr. Wasserman said. "We are in a revolutionary phase in terms of our ability to understand the minds of other animals."', NULL, NULL, 447, 'IMPORT', 'cet6-2023-03-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-03-1-r3'
);
SET @pg_cet6_2023_03_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-03-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-r4', 'CAREFUL_READING', 'CET6', NULL, 'The suggestion that people should aim for dietary diversity by trying to eat a variety of foods has been a basic public health recommendation for decades in the United States and elsewhere. Now, however, experts are warning that aiming for a diverse diet may actually lead to just eating more calories, and, thus, to obesity. One issue is that people may not interpret "variety" the way nutritionists intend. This problem is highlighted by new research conducted by the American Heart Association. Researchers reviewed all the evidence published related to dietary diversity and saw a correlation between dietary diversity and a greater intake of both healthy and unhealthy foods. This had implications for obesity, as researchers found a greater prevalence of obesity amongst people with a greater dietary diversity. One author of the new study explained that their findings contradict standard dietary advice, as most dietary guidelines around the world include a statement of eating a variety of foods. But this advice does not seem to be supported by science, possibly because there is little agreement about the meaning of "dietary diversity," which is not clearly and consistently defined. Some experts measure dietary diversity by counting the number of food groups eaten, while others look at the distribution of calories across individual foods, and still others measure how different the foods eaten are from each other. Although the findings of this new study contradict standard dietary advice, they do not come as a surprise to all of the researchers involved. Dr. Rao, one of the study authors, noted that, after 20 years of experience in the field of obesity, he has observed that people who have a regimented lifestyle and diet tend to be thinner and healthier than people with a wide variety of consumption. This anecdotal evidence matches the conclusions of the study, which found no evidence that dietary diversity promotes healthy body weight or optimal eating patterns, and limited evidence that eating a variety of foods is actually associated with consuming more calories, poor eating patterns and weight gain. Further, there is some evidence that a greater variety of food options in a single meal may delay people''s feeling of fullness and actually increase how much they eat. Based on their findings, the researchers endorse a diet consisting of a limited number of healthy foods such as vegetables, fruits, grains, and poultry. They also recommend that people simultaneously endeavor to restrict consumption of sweets, sugar and red meat. The researchers stress, however, that their dietary recommendations do not imply dietary diversity is never positive, and that, in the past, diversity in diets of whole, unprocessed food may have actually been very beneficial.', NULL, NULL, 443, 'IMPORT', 'cet6-2023-03-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-03-1-r4'
);
SET @pg_cet6_2023_03_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-03-1-r4' LIMIT 1);

-- 翻译 cet6-2023-03-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-translation'
);
SET @q_cet6_2023_03_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_01, '张骞(Zhang Qian)是中国第一个伟大的探险家。他不畏艰险,克服重重困难,两次出使西域,开通了中国同西亚和欧洲的通商关系,将中国的丝和丝织品运往西亚和欧洲,开拓了历史上著名的"丝绸之路"。同时,他又将西域的风土人情、地理文化以及特有物种等介绍到中原,极大地开阔了人们的视野。 正如历史学家所指出的那样,如果没有张骞出使西域,就不可能有丝绸之路的开辟,也就不会有汉朝同西域或欧洲的文化交流。', NULL, 'Zhang Qian was the first great explorer in Chinese history. Braving dangers and overcoming numerous difficulties, he made two journeys to the Western Regions, opened up trade between China, West Asia and Europe, transported Chinese silk and silk fabrics there, and thereby pioneered the famous Silk Road in history. Meanwhile, he introduced the local customs, geography, culture and unique species of the Western Regions to the Central Plains, greatly broadening people''s horizons. As historians have pointed out, without Zhang Qian''s mission to the Western Regions, there would have been no opening of the Silk Road, nor any cultural exchanges between the Han Dynasty and the Western Regions or Europe.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_01
);

-- 听力 Q1 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q01', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q01'
);
SET @q_cet6_2023_03_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_02, NULL, '{"A":"A) In a restaurant.","B":"B) In a kitchen.","C":"C) In a food store.","D":"D) In a supermarket."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_02
);

-- 听力 Q2 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q02', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q02'
);
SET @q_cet6_2023_03_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_03, NULL, '{"A":"A) She eats meat occasionally.","B":"B) She enjoys cheeseburgers.","C":"C) She is allergic to seafood.","D":"D) She is a partial vegetarian."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_03
);

-- 听力 Q3 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q03', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q03'
);
SET @q_cet6_2023_03_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_04, NULL, '{"A":"A) Dealing with one''s colleagues.","B":"B) Changing one''s eating habit.","C":"C) Following the same diet for years.","D":"D) Keeping awake at morning meetings."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_04
);

-- 听力 Q4 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q04', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q04'
);
SET @q_cet6_2023_03_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_05, NULL, '{"A":"A) They enjoy perfect health.","B":"B) They are both animal lovers.","C":"C) They only eat organic food.","D":"D) They are cutting back on coffee."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_05
);

-- 听力 Q5 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q05', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q05'
);
SET @q_cet6_2023_03_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_06, NULL, '{"A":"A) The man got a poor evaluation from his colleagues.","B":"B) The man made little contribution to the company.","C":"C) The man paid attention to trivial things.","D":"D) The man had an attitude problem."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_06
);

-- 听力 Q6 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q06', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q06'
);
SET @q_cet6_2023_03_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_07, NULL, '{"A":"A) They make unhelpful decisions for solving problems.","B":"B) They favor some employees'' suggestions over others.","C":"C) They use manipulative language to mask their irrational choices.","D":"D) They reject employees'' reasonable arguments for work efficiency."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_07
);

-- 听力 Q7 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q07', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q07'
);
SET @q_cet6_2023_03_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_08, NULL, '{"A":"A) It is a must for rational judgment.","B":"B) It is more of a sin than a virtue.","C":"C) It is a good quality in the workplace.","D":"D) It is more important now than ever."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q08', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q08'
);
SET @q_cet6_2023_03_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_09, NULL, '{"A":"A) Smoothing relationships in the workplace.","B":"B) Making rational and productive decisions.","C":"C) Focusing on employees career growth.","D":"D) Preserving their power and prestige."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_09
);

-- 听力 Q9 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q09', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q09'
);
SET @q_cet6_2023_03_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_10, NULL, '{"A":"A) They show genius which defies description.","B":"B) They accomplish feats many of us cannot.","C":"C) They create very high commercial value.","D":"D) They bring great honor to their country."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_10
);

-- 听力 Q10 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q10', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q10'
);
SET @q_cet6_2023_03_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_11, NULL, '{"A":"A) They take part in kids'' extra-curricular activities.","B":"B) They work in spare time to teach children sports.","C":"C) They try to be positive role models to children.","D":"D) They serve as spokespersons for luxury goods."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_11
);

-- 听力 Q11 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q11', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q11'
);
SET @q_cet6_2023_03_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_12, NULL, '{"A":"A) Separating an athlete''s professional life from their personal life.","B":"B) Preventing certain athletes from getting in trouble with the law.","C":"C) Keeping athletes away from drug or alcohol problems.","D":"D) Being super sports stars without appearing arrogant."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_12
);

-- 听力 Q12 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q12', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q12'
);
SET @q_cet6_2023_03_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_13, NULL, '{"A":"A) They always cost more than expected.","B":"B) They are joyous and exciting occasions.","C":"C) They should be paid up by the attendees.","D":"D) They are dreams coming true to the brides."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_13
);

-- 听力 Q13 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q13', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q13'
);
SET @q_cet6_2023_03_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_14, NULL, '{"A":"A) It cost $60,000.","B":"B) It was cancelled.","C":"C) It had eight guests only.","D":"D) It was held in Las Vegas."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_14
);

-- 听力 Q14 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q14', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q14'
);
SET @q_cet6_2023_03_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_15, NULL, '{"A":"A) Postpone her wedding.","B":"B) Ask her friends for help.","C":"C) Keep to her budget.","D":"D) Invite more guests."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_15
);

-- 听力 Q15 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q15', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q15'
);
SET @q_cet6_2023_03_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_16, NULL, '{"A":"A) She called it romantic.","B":"B) She welcomed it with open arms.","C":"C) She said she would think about it.","D":"D) She rejected it flatly."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_16
);

-- 听力 Q16 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q16', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q16'
);
SET @q_cet6_2023_03_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_17, NULL, '{"A":"A) It determines people''s moods.","B":"B) It can impact people''s wellbeing.","C":"C) It is closely related to people''s emotions.","D":"D) It can influence people''s personalities."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_17
);

-- 听力 Q17 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q17', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q17'
);
SET @q_cet6_2023_03_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_18, NULL, '{"A":"A) They make people more reproductive.","B":"B) They increase people''s life expectancy.","C":"C) They tend to produce positive feelings.","D":"D) They may alter people''s genes gradually."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_18
);

-- 听力 Q18 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q18', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q18'
);
SET @q_cet6_2023_03_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_19, NULL, '{"A":"A) The link between temperature and personality is fairly weak.","B":"B) People share many personality traits despite their nationalities.","C":"C) People in the same geographical area may differ in personality.","D":"D) The Americans are apparently more outgoing than the Chinese."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_19
);

-- 听力 Q19 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q19', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q19'
);
SET @q_cet6_2023_03_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_20, NULL, '{"A":"A) The number of older Americans living alone is on the rise.","B":"B) Chronic loneliness does harm to senior citizens in particular.","C":"C) Correlations have been found between loneliness and ill health.","D":"D) A growing number of US seniors face the risk of early mortality."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_20
);

-- 听力 Q20 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q20', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q20'
);
SET @q_cet6_2023_03_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_21, NULL, '{"A":"A) Medication is available for treating loneliness.","B":"B) Loneliness rarely results from living alone.","C":"C) Being busy helps fight loneliness.","D":"D) Loneliness is probably reversible."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_21
);

-- 听力 Q21 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q21', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q21'
);
SET @q_cet6_2023_03_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_22, NULL, '{"A":"A) Living with one''s children.","B":"B) Meeting social expectations.","C":"C) Meaningful social contact.","D":"D) Timely medical intervention."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_22
);

-- 听力 Q22 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q22', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q22'
);
SET @q_cet6_2023_03_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_23, NULL, '{"A":"A) She had a successful career in finance.","B":"B) She wrote stories about women travelers.","C":"C) She made regular trips to Asian countries.","D":"D) She invested in several private companies."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_23
);

-- 听力 Q23 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q23', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q23'
);
SET @q_cet6_2023_03_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_24, NULL, '{"A":"A) Buy a ranch.","B":"B) Start a blog.","C":"C) Travel round the world.","D":"D) Set up a travel agency."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_24
);

-- 听力 Q24 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q24', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q24'
);
SET @q_cet6_2023_03_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_25, NULL, '{"A":"A) Work hard to attract attention from publishers.","B":"B) Gain support from travel advertising companies.","C":"C) Try to find a full-time job in the travel business.","D":"D) Create something unique to enter the industry."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_25
);

-- 听力 Q25 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q25', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q25'
);
SET @q_cet6_2023_03_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_26, NULL, '{"A":"A) Attracting sufficient investment.","B":"B) Creating an exotic corporate culture.","C":"C) Avoiding too much advertising early on.","D":"D) Refraining from promoting similar products."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q26'
);
SET @q_cet6_2023_03_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_27, NULL, '{"A":"A) advocate","B":"B) arise","C":"C) emphasized","D":"D) encounter","E":"E) essential","F":"F) evaporation","G":"G) extinction","H":"H) obscure","I":"I) particular","J":"J) posed","K":"K) scenario","L":"L) severely","M":"M) shrewdly","N":"N) species","O":"O) variety"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q27'
);
SET @q_cet6_2023_03_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_28, NULL, '{"A":"A) advocate","B":"B) arise","C":"C) emphasized","D":"D) encounter","E":"E) essential","F":"F) evaporation","G":"G) extinction","H":"H) obscure","I":"I) particular","J":"J) posed","K":"K) scenario","L":"L) severely","M":"M) shrewdly","N":"N) species","O":"O) variety"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q28'
);
SET @q_cet6_2023_03_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_29, NULL, '{"A":"A) advocate","B":"B) arise","C":"C) emphasized","D":"D) encounter","E":"E) essential","F":"F) evaporation","G":"G) extinction","H":"H) obscure","I":"I) particular","J":"J) posed","K":"K) scenario","L":"L) severely","M":"M) shrewdly","N":"N) species","O":"O) variety"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q29'
);
SET @q_cet6_2023_03_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_30, NULL, '{"A":"A) advocate","B":"B) arise","C":"C) emphasized","D":"D) encounter","E":"E) essential","F":"F) evaporation","G":"G) extinction","H":"H) obscure","I":"I) particular","J":"J) posed","K":"K) scenario","L":"L) severely","M":"M) shrewdly","N":"N) species","O":"O) variety"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q30'
);
SET @q_cet6_2023_03_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_31, NULL, '{"A":"A) advocate","B":"B) arise","C":"C) emphasized","D":"D) encounter","E":"E) essential","F":"F) evaporation","G":"G) extinction","H":"H) obscure","I":"I) particular","J":"J) posed","K":"K) scenario","L":"L) severely","M":"M) shrewdly","N":"N) species","O":"O) variety"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q31'
);
SET @q_cet6_2023_03_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_32, NULL, '{"A":"A) advocate","B":"B) arise","C":"C) emphasized","D":"D) encounter","E":"E) essential","F":"F) evaporation","G":"G) extinction","H":"H) obscure","I":"I) particular","J":"J) posed","K":"K) scenario","L":"L) severely","M":"M) shrewdly","N":"N) species","O":"O) variety"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q32'
);
SET @q_cet6_2023_03_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_33, NULL, '{"A":"A) advocate","B":"B) arise","C":"C) emphasized","D":"D) encounter","E":"E) essential","F":"F) evaporation","G":"G) extinction","H":"H) obscure","I":"I) particular","J":"J) posed","K":"K) scenario","L":"L) severely","M":"M) shrewdly","N":"N) species","O":"O) variety"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q33'
);
SET @q_cet6_2023_03_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_34, NULL, '{"A":"A) advocate","B":"B) arise","C":"C) emphasized","D":"D) encounter","E":"E) essential","F":"F) evaporation","G":"G) extinction","H":"H) obscure","I":"I) particular","J":"J) posed","K":"K) scenario","L":"L) severely","M":"M) shrewdly","N":"N) species","O":"O) variety"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q34'
);
SET @q_cet6_2023_03_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_35, NULL, '{"A":"A) advocate","B":"B) arise","C":"C) emphasized","D":"D) encounter","E":"E) essential","F":"F) evaporation","G":"G) extinction","H":"H) obscure","I":"I) particular","J":"J) posed","K":"K) scenario","L":"L) severely","M":"M) shrewdly","N":"N) species","O":"O) variety"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q35'
);
SET @q_cet6_2023_03_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_36, NULL, '{"A":"A) advocate","B":"B) arise","C":"C) emphasized","D":"D) encounter","E":"E) essential","F":"F) evaporation","G":"G) extinction","H":"H) obscure","I":"I) particular","J":"J) posed","K":"K) scenario","L":"L) severely","M":"M) shrewdly","N":"N) species","O":"O) variety"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q36'
);
SET @q_cet6_2023_03_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_37, 'The higher rate of employment, combined with limited housing supply, did not make it any easier to buy a house.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q37'
);
SET @q_cet6_2023_03_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_38, 'One way to deal with the housing crisis is for the government to simplify approval procedures for housing projects.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q38'
);
SET @q_cet6_2023_03_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_39, 'Residents of the San Francisco Bay Area strongly resent the tech industry because of the economic inequality it has contributed to.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q39'
);
SET @q_cet6_2023_03_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_40, 'The fast rise in the prices of land and houses increases the economic inequality among people.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q40'
);
SET @q_cet6_2023_03_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_41, 'San Francisco city government offered tax benefits to attract tech companies to establish operations in a less developed area.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q41'
);
SET @q_cet6_2023_03_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_42, 'Innovative solutions to social and economic problems should be introduced before it is too late.', NULL, 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q42'
);
SET @q_cet6_2023_03_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_43, 'When people compare their own living standard with others'', it has a greater impact on their sense of contentment.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q43'
);
SET @q_cet6_2023_03_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_44, 'San Francisco has been found to have the biggest income gap in California between the rich and the poor.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q44'
);
SET @q_cet6_2023_03_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_45, 'Improved transport networks connecting the city to distant outlying areas will also help solve the housing crisis.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q45'
);
SET @q_cet6_2023_03_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_46, 'Average incomes in the Bay Area make it virtually impossible for most tenant families to buy a home.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q46'
);
SET @q_cet6_2023_03_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_47, 'In what way were humans thought to be unique?', '{"A":"A) Being a major source of animal intelligence.","B":"B) Being the cornerstone of the creative world.","C":"C) Being capable of same-different discrimination.","D":"D) Being able to distinguish abstract from concrete."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q47'
);
SET @q_cet6_2023_03_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_48, 'What do we learn from the study published in Science?', '{"A":"A) Our understanding of the bird world was biased.","B":"B) Our conception of birds'' intelligence was wrong.","C":"C) Our communication with birds was far from adequate.","D":"D) Our knowledge about bird psychology needs updating."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q48'
);
SET @q_cet6_2023_03_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_49, 'What did the researchers discover about most ducklings from their experiment?', '{"A":"A) They could associate shape with color.","B":"B) They reacted quickly to moving objects.","C":"C) They preferred colored objects to colorless ones.","D":"D) They could tell whether the objects were the same."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q49'
);
SET @q_cet6_2023_03_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_50, 'What was novel about the experiment in the study reported in Science?', '{"A":"A) The animals used received no training.","B":"B) It used a number of colors and shapes.","C":"C) It was conducted by experimental psychologists.","D":"D) The ducklings were compared with other animals."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q50'
);
SET @q_cet6_2023_03_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_51, 'What do we learn from Dr. Wasserman''s comment on the study of animal minds at the end of the passage?', '{"A":"A) It is getting more and more intricate.","B":"B) Research methods are being updated.","C":"C) It is attracting more public attention.","D":"D) Remarkable progress is being made."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q51'
);
SET @q_cet6_2023_03_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_52, 'What has been a standard piece of dietary advice for decades?', '{"A":"A) People should cultivate a healthy eating habit.","B":"B) People should have a well-balanced diet.","C":"C) People should diversify what they eat.","D":"D) People should limit calorie intake to avoid obesity."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q52'
);
SET @q_cet6_2023_03_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_53, 'What did the new research by the American Heart Association find?', '{"A":"A) People seeking dietary diversity tend to eat more.","B":"B) Big eaters are more likely to become overweight.","C":"C) Dietary diversity is positively related to good health.","D":"D) Unhealthy food makes people gain weight more easily."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q53'
);
SET @q_cet6_2023_03_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_54, 'What could help to explain the contradiction between the new findings and the common public health recommendation?', '{"A":"A) Most dietary guidelines around the world contradict one another.","B":"B) Conventional wisdom about diet is seldom supported by science.","C":"C) The methods researchers use to measure nutrition vary greatly.","D":"D) There is little consensus on the definition of dietary diversity."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q54'
);
SET @q_cet6_2023_03_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_55, 'What did Dr. Rao find after 20 years of research on obesity?', '{"A":"A) Dietary diversity promotes healthy body weight.","B":"B) Eating patterns and weight gain go hand in hand.","C":"C) Diversified food intake may not contribute to health.","D":"D) There is no clear definition of optimal eating patterns."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-03-1-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_03_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q55'
);
SET @q_cet6_2023_03_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-03-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_03_1_56, 'What does the passage say about people who eat a great variety of food?', '{"A":"A) They tend to consume more sweets, sugar and red meat.","B":"B) They don''t feel they have had enough until they overeat.","C":"C) They don''t have any problems getting sufficient nutrition.","D":"D) They are more likely to eat foods beneficial to their health."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_03_1_56
);

-- ==================== cet6-2023-06-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-r1', 'BANKED_CLOZE', 'CET6', NULL, 'Scientists recently examined studies on dog intelligence and compared them with research into the minds of other intelligent animals. The researchers found that dogs are among the more intelligent carnivores(食肉动物), social hunters and domestic animals, but that their intelligence does not __26__ other intelligent animals in any of those categories. Though a significant body of research has examined dog cognition __27__ , the authors of this new study found little to warrant the __28__ of work that has been devoted to the topic. Stephen Lea, lead author of the new study, argues that many researchers seem to have designed their studies to __29__ how clever dogs are, rather than simply to study dogs'' brains. Lea and a colleague examined more than 300 studies of dog cognition, comparing the studies'' results with those from research into other animals. The researchers made specific comparisons between the different species in different categories of intelligence. These comparisons __30__ that dogs are intelligent, but their intelligence is not as __31__ as some researchers might have believed. In many areas, though, comparisons were not possible. For example, the researchers noted that both dogs and cats are known to be able to recognize and __32__ human voices. But the investigators could not find any data to indicate which species can remember a greater number of __33__ human voices, so it was impossible to compare the two on that front. However, not all researchers agree __34__ with the findings of this study. Zachary Silver, an American researcher, believes the authors of the new study __35__ the idea that an excessive amount of research has been devoted to dogs, as the field of dog cognition is young, and there is much to be learned about how dogs think.', NULL, '["A) affirmed","B) approximately","C) completely","D) differentiate","E) distinct","F) domain","G) formidable","H) outperformed","I) overstated","J) pledge","K) previously","L) prospective","M) prove","N) surpass","O) volume"]', 289, 'IMPORT', 'cet6-2023-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-1-r1'
);
SET @pg_cet6_2023_06_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-r2', 'MATCHING', 'CET6', 'The lifesaving power of gratitude', 'A) Gratitude may be more beneficial than we commonly suppose. One recent study asked participants to write a note of thanks to someone and then estimate how surprised and happy the recipient would feel—an impact that they consistently underestimated. Another study assessed the health benefits of writing thank-you notes. The researchers found that writing as few as three weekly thank-you notes over the course of three weeks improved life satisfaction, increased happy feelings and reduced symptoms of depression. B) While this research into gratitude is relatively new, the principles involved are anything but. Students of mine in a political philosophy course at Indiana University are reading Daniel Defoe''s 300-year-old Robinson Crusoe, often regarded as the first novel published in English. Left alone on an unknown island with no apparent prospect of rescue or escape, Crusoe has much to lament(悲叹). But instead of giving in to despair, he makes a list of things for which he is grateful, including the fact that he is the sole survivor from the shipwreck(海难) and has been able to salvage many useful items from the wreckage. C) Defoe''s masterpiece, which is often ranked as one of the world''s greatest novels, provides a portrait of gratitude in action that is as timely and relevant today as it has ever been. It is also one with which contemporary psychology and medicine are just beginning to catch up. Simply put, for most of us, it is far more helpful to focus on the things in life for which we can express gratitude than those that incline us toward resentment and lamentation. D) When we focus on the things we regret, such as failed relationships, family disputes, and setbacks in career and finance, we tend to become more regretful. Conversely, when we focus on the things we are grateful for, a greater sense of happiness tends to spread through our lives. And while no one would argue for cultivating a false sense of blessedness, there is mounting evidence that counting our blessings is one of the best habits we can develop to promote mental and physical health. E) Gratitude has long enjoyed a privileged position in many of the world''s cultural traditions. For example, some ancient Western philosophers counsel gratitude that is both enduring and complete, and some Eastern thinkers portray it as not merely an attitude but a virtue to be put into practice. F) Recent scientific studies support these ancient teachings. Individuals who regularly engage in gratitude exercises, such as counting their blessings or expressing gratitude to others, exhibit increased satisfaction with relationships and fewer symptoms of physical illness. And the benefits are not only psychological and physical. They may also be moral—those who practice gratitude also view their lives less materialistically and suffer from less envy. G) There are multiple explanations for such benefits of gratefulness. One is the fact that expressing gratitude encourages others to continue being generous, thus promoting a virtuous cycle of goodness in relationships. Similarly, grateful people may be more likely to reciprocate( 回报) with acts of kindness of their own. Broadly speaking, a community in which people feel grateful to one another is likely to be a more pleasant place to live than one characterized by mutual suspicion and resentment. The beneficial effects of gratitude may extend even further. For example, when many people feel good about what someone else has done for them, they experience a sense of being lifted up, with a corresponding enhancement of their regard for humanity. Some are inspired to attempt to become better people themselves, doing more to help bring out the best in others and bringing more goodness into the world around them. H) Gratitude also tends to strengthen a sense of connection with others. When people want to do good things that inspire gratitude, the level of dedication in relationships tends to grow and relationships seem to last longer. And when people feel more connected, they are more likely to choose to spend their time with one another and demonstrate their feelings of affection in daily acts. I) Of course, acts of kindness can also foster discomfort. For example, if people feel they are not worthy of kindness or suspect that some ulterior(别有用心的) motive lies behind it, the benefits of gratitude will not be realized. Likewise, receiving a kindness can give rise to a sense of indebtedness, leaving beneficiaries feeling that they must now pay back whatever good they have received. Gratitude can flourish only if people are secure enough in themselves and sufficiently trusting to allow it to do so. Another obstacle to gratitude is often called a sense of entitlement. Instead of experiencing a benefaction( 善行) as a good turn, people sometimes regard it as a mere payment of what they are owed, for which no one deserves any moral credit. J) There are a number of practical steps anyone can take to promote a sense of gratitude. One is simply spending time on a regular basis thinking about someone who has made a difference, or perhaps writing a thank-you note or expressing such gratitude in person. Others are found in ancient religious disciplines, such as reflecting on benefactions received from another person or actually praying for the health and happiness of a benefactor. In addition to benefactions received, it is also possible to focus on opportunities to do good oneself, whether those acted on in the past or hoped for in the future. Some people are most grateful not for what others have done for them but for chances they enjoyed to help others. In regularly reflecting on the things in his life he is grateful for, Defoe''s Crusoe believes that he becomes a far better person than he would have been had he remained in the society from which he originally set out on his voyage. K) Reflecting on generosity and gratitude, the great basketball coach John Wooden once offered two counsels to his players and students. First, he said, "It is impossible to have a perfect day unless you have done something for someone who will never be able to repay you." In saying this, Wooden sought to promote purely generous acts, as opposed to those performed with an expectation of reward. Second, he said, "Give thanks for your blessings every day." L) Some faith traditions incorporate such practices into the rhythm of daily life. For example, adherents of some religions offer prayers of thanksgiving every morning before rising and every night before lying down to sleep. Others offer thanks throughout the day, such as before meals. Other less frequent special events, such as births, deaths and marriages, may also be heralded by such prayers. M) When Defoe depicted Robinson Crusoe making thanksgiving a daily part of his island life, he was anticipating findings in social science and medicine that would not appear for hundreds of years. Yet he was also reflecting the wisdom of religious and philosophical traditions that extend back thousands of years. Gratitude is one of the healthiest and most nourishing of all states of mind, and those who adopt it as a habit are enriching not only their own lives but also the lives of those around them.', NULL, NULL, 1194, 'IMPORT', 'cet6-2023-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-1-r2'
);
SET @pg_cet6_2023_06_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-r3', 'CAREFUL_READING', 'CET6', NULL, 'Technology is never a neutral tool for achieving human ends. Technological innovations reshape people as they use these innovations to control their environment. Artificial intelligence, for example, is altering humanity. While the term AI conjures up anxieties about killer robots or catastrophic levels of unemployment, there are other, deeper implications. As AI increasingly shapes the human experience, how does this change what it means to be human? Central to the problem is a person''s capacity to make choices, particularly judgments that have moral implications. Aristotle argued that the capacity for making practical judgments depends on regularly making them—on habit and practice. We see the emergence of machines as substitute judges in a variety of everyday contexts as a potential threat to people learning how to effectively exercise judgment themselves. In the workplace, managers routinely make decisions about who to hire or fire and which loan to approve, to name a few. These are areas where algorithmic(算法的) prescription is replacing human judgment, and so people who might have had the chance to develop practical judgment in these areas no longer will. Recommendation engines, which are increasingly prevalent intermediaries in people''s consumption of culture, may serve to constrain choice and minimize luck. By presenting consumers with algorithmically selected choices of what to watch, read, stream and visit next, companies are replacing human taste with machine taste. In one sense, this is helpful. After all, machines can survey a wider range of choices than any individual is likely to have the time or energy to do on their own. At the same time, though, this selection is optimizing for what people are likely to prefer based on what they''ve preferred in the past. We think there is some risk that people''s options will be constrained by their past in a new and unanticipated way. As machine learning algorithms improve and as they train on more extensive data sets, larger parts of everyday life are likely to become utterly predictable. The predictions are going to get better and better, and they will ultimately make common experiences more efficient and pleasant. Algorithms could soon—if they don''t already—have a better idea about which show you''d like to watch next and which job candidate you should hire than you do. One day, humans may even find a way for machines to make these decisions without some of the biases that humans typically display. But to the extent that unpredictability is part of how people understand themselves and part of what people like about themselves, humanity is in the process of losing something significant. As they become more and more predictable, the creatures inhabiting the increasingly AI-mediated world will become less and less like us.', NULL, NULL, 447, 'IMPORT', 'cet6-2023-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-1-r3'
);
SET @pg_cet6_2023_06_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-r4', 'CAREFUL_READING', 'CET6', NULL, 'Phonics, which involves sounding out words syllable(音节) by syllable, is the best way to teach children to read. But in many classrooms, this can be a dirty word. So much so that some teachers have had to sneak phonics teaching materials into the classroom. Most American children are taught to read in a way that study after study has found to be wrong. The consequences of this are striking. Less than half of all American adults were proficient readers in 2017. American fourth graders rank 15th on the Progress in International Literacy Study, an international exam. America is stuck in a debate about teaching children to read that has been going on for decades. Some advocate teaching symbol-sound relationships (the sound k can be spelled as c, k, ck, or ch), known as phonics. Others support an immersive approach (using pictures of a cat to learn the word cat), known as "whole language". Most teachers today, almost three out of four according to a survey by the Ed Week Research Centre in 2019, use a mix called "balanced literacy". This combination of methods is ineffective. "You can''t sprinkle in a little phonics," says Tenette Smith, executive director of elementary education and reading at Mississippi''s education department. "It has to be systematic and explicitly taught." Mississippi, often behind in social policy, has set an example here. In a state once notorious for its low reading scores, the Mississippi state legislature passed new literacy standards in 2013. Since then Mississippi has seen remarkable gains. Its fourth graders have moved from 49th (out of 50 states) to 29th on the National Assessment of Educational Progress, a nationwide exam. In 2019 it was the only state to improve its scores. For the first time since measurement began, Mississippi''s pupils are now average readers, a remarkable achievement in such a poor state. Mississippi''s success is attributed to implementing reading methods supported by a body of research known as the science of reading. In 1997 Congress requested the National Institute of Child Health and Human Development and the Department of Education to convene a National Reading Panel to end the "reading wars" and synthesize the evidence. The panel found that phonics, along with explicit instruction in phonemic(音位的) awareness, fluency and comprehension, worked best. Yet over two decades on, "balanced literacy" is still being taught in classrooms. But advances in statistics and brain imaging have disproved the whole-language method. To the teacher who is a proficient reader, literacy seems like a natural process that requires educated guessing, rather than the deliberate process emphasized by phonics. Teachers can imagine that they learned to read through osmosis(潜移默化) when they were children. Without proper training, they bring this to classrooms.', NULL, NULL, 450, 'IMPORT', 'cet6-2023-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-1-r4'
);
SET @pg_cet6_2023_06_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-1-r4' LIMIT 1);

-- 翻译 cet6-2023-06-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-translation'
);
SET @q_cet6_2023_06_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_01, '近年来,越来越多的中国文化产品走向全球市场, 日益受到海外消费者的青睐。随着中国对外文化贸易的快速发展,中国文化产品出口额已持续多年位居世界前列,形成了一批具有国际影响力的文化企业、产品和品牌。数据显示,中国的出版物、影视作品、网络文学与动漫作品等在海外的销售量连年攀升。中国政府出台了一系列政策鼓励和支持更多具有中国元素的优秀文化产品走出国门,扩大海外市场份额,进一步提升中国文化的世界影响力。', NULL, 'In recent years, more and more Chinese cultural products have been entering the global market and winning increasing favor among overseas consumers. With the rapid development of China''s foreign cultural trade, the export value of Chinese cultural products has ranked among the world''s top for many years, forming a number of internationally influential cultural enterprises, products and brands. Data show that the overseas sales of China''s publications, film and TV works, online literature and animation works have been rising year by year. The Chinese government has introduced a series of policies to encourage and support more fine cultural products with Chinese elements to go global, expand their overseas market share, and further enhance the global influence of Chinese culture.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_01
);

-- 听力 Q1 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q01', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q01'
);
SET @q_cet6_2023_06_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_02, NULL, '{"A":"A) It was spacious and tranquil.","B":"B) It was warm and comfortable.","C":"C) It was shabby and solitary.","D":"D) It was tiny and noisy."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_02
);

-- 听力 Q2 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q02', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q02'
);
SET @q_cet6_2023_06_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_03, NULL, '{"A":"A) She no longer hates people talking loudly in the dorm.","B":"B) She misses her roommates she used to complain about.","C":"C) She begins to enjoy the movies she once found irritating.","D":"D) She finds the crowded dorm as cozy as her new apartment."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_03
);

-- 听力 Q3 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q03', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q03'
);
SET @q_cet6_2023_06_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_04, NULL, '{"A":"A) He found the apartment perfectly furnished.","B":"B) He had a feeling of despair and frustration.","C":"C) He had a similar feeling to the woman''s.","D":"D) He felt the new place was like paradise."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_04
);

-- 听力 Q4 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q04', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q04'
);
SET @q_cet6_2023_06_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_05, NULL, '{"A":"A) Go to see the woman''s apartment.","B":"B) Make a phone call to his parents.","C":"C) Buy some furniture for the woman.","D":"D) Decorate the woman''s apartment."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_05
);

-- 听力 Q5 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q05', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q05'
);
SET @q_cet6_2023_06_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_06, NULL, '{"A":"A) He works as a literary critic.","B":"B) He hosts an educational program.","C":"C) He has initiated a university reform.","D":"D) He has published a book recently."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_06
);

-- 听力 Q6 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q06', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q06'
);
SET @q_cet6_2023_06_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_07, NULL, '{"A":"A) It fails to keep up with the radical changes of society.","B":"B) It fails to ensure universities get sufficient resources.","C":"C) It has not prepared young people for the job market.","D":"D) It has not fostered the growth of the arts disciplines."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_07
);

-- 听力 Q7 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q07', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q07'
);
SET @q_cet6_2023_06_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_08, NULL, '{"A":"A) More of the budget should go to science and technology.","B":"B) The underfunded music discipline should be prioritized.","C":"C) Subdisciplines like sculpture should get more funding.","D":"D) Literature should get as much funding as engineering."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q08', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q08'
);
SET @q_cet6_2023_06_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_09, NULL, '{"A":"A) Build a prosperous nation.","B":"B) Make skilled professionals.","C":"C) Create ingenious artists.","D":"D) Cultivate better citizens."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_09
);

-- 听力 Q9 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q09', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q09'
);
SET @q_cet6_2023_06_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_10, NULL, '{"A":"A) It is quite common.","B":"B) It is rarely noticed.","C":"C) It seldom annoys people.","D":"D) It occurs when one is alone."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_10
);

-- 听力 Q10 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q10', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q10'
);
SET @q_cet6_2023_06_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_11, NULL, '{"A":"A) Seeing things in black and white.","B":"B) Engaging in regular contemplation.","C":"C) Having a special understanding of creativity.","D":"D) Knowing how to make their mental batteries work."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_11
);

-- 听力 Q11 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q11', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q11'
);
SET @q_cet6_2023_06_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_12, NULL, '{"A":"A) Engaging in intense activity.","B":"B) Fantasizing in one''s downtime.","C":"C) Working on a particular project.","D":"D) Reflecting during one''s relaxation."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_12
);

-- 听力 Q12 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q12', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q12'
);
SET @q_cet6_2023_06_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_13, NULL, '{"A":"A) Farmers helped Native Americans grow crops.","B":"B) There were expansive university campuses.","C":"C) There existed post offices.","D":"D) Migrants found gold there."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_13
);

-- 听力 Q13 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q13', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q13'
);
SET @q_cet6_2023_06_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_14, NULL, '{"A":"A) It helped to boost the economy in the American West.","B":"B) It provided job opportunities for many gold seekers.","C":"C) It extended the influence of the federal government.","D":"D) It kept people in the deserts and plains connected."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_14
);

-- 听力 Q14 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q14', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q14'
);
SET @q_cet6_2023_06_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_15, NULL, '{"A":"A) It employed Native Americans to work as postmen.","B":"B) It commissioned private wagons to carry the mail.","C":"C) It subsidized the locals who acted as postmasters.","D":"D) It centralized postal services in its remote areas."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_15
);

-- 听力 Q15 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q15', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q15'
);
SET @q_cet6_2023_06_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_16, NULL, '{"A":"A) He analyzed interactive maps of mail routes.","B":"B) He read a large collection of books on the topic.","C":"C) He examined its historical trends with data science.","D":"D) He collected data about its impact on local business."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_16
);

-- 听力 Q16 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q16', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q16'
);
SET @q_cet6_2023_06_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_17, NULL, '{"A":"A) Higher levels of anxiety may improve people''s memory.","B":"B) Some experiences are easier to remember than others.","C":"C) Most people tend to remember things selectively.","D":"D) Simple things may leave a deep impression on one''s memory."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_17
);

-- 听力 Q17 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q17', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q17'
);
SET @q_cet6_2023_06_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_18, NULL, '{"A":"A) They classified the participants'' mindset.","B":"B) They showed some photos to the participants.","C":"C) They measured the participants'' anxiety levels.","D":"D) They tested the size of the participants'' vocabulary."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_18
);

-- 听力 Q18 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q18', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q18'
);
SET @q_cet6_2023_06_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_19, NULL, '{"A":"A) Anxiety has become a serious problem for an increasing number of people.","B":"B) Extreme levels of anxiety can adversely affect cognitive performance.","C":"C) People diagnosed with anxiety disorder may forget things selectively.","D":"D) There is no direct correlation between memory and levels of anxiety."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_19
);

-- 听力 Q19 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q19', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q19'
);
SET @q_cet6_2023_06_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_20, NULL, '{"A":"A) They compare products from different companies before making a choice.","B":"B) They get information from other consumers'' postings and comments.","C":"C) They lose patience when their phone call is not promptly answered.","D":"D) They expect to get instantaneous responses to their inquiry."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_20
);

-- 听力 Q20 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q20', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q20'
);
SET @q_cet6_2023_06_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_21, NULL, '{"A":"A) Giving them rewards on the spot.","B":"B) Broadening their scope of interest.","C":"C) Speaking directly to their emotions.","D":"D) Focusing on the details of the product."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_21
);

-- 听力 Q21 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q21', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q21'
);
SET @q_cet6_2023_06_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_22, NULL, '{"A":"A) Change the rules of the game in the market every year.","B":"B) Keep up with the latest technological developments.","C":"C) Learn from technological innovators to do business.","D":"D) Make greater efforts to build up consumers'' confidence."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_22
);

-- 听力 Q22 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q22', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q22'
);
SET @q_cet6_2023_06_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_23, NULL, '{"A":"A) People have only one social engagement per week.","B":"B) Working together enhances friendship.","C":"C) Few people have devoted friends.","D":"D) Friendships benefit work."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_23
);

-- 听力 Q23 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q23', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q23'
);
SET @q_cet6_2023_06_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_24, NULL, '{"A":"A) The impact of friends on people''s self-esteem.","B":"B) How supportive friends can be in the workplace.","C":"C) How to boost one''s sense of value and worthiness.","D":"D) The role of family ties in people''s mental well-being."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_24
);

-- 听力 Q24 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q24', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q24'
);
SET @q_cet6_2023_06_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_25, NULL, '{"A":"A) They show little interest in their friends'' work.","B":"B) They tend to be much more difficult to make.","C":"C) They are more trustworthy and reliable.","D":"D) They increase people''s job satisfaction."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_25
);

-- 听力 Q25 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q25', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q25'
);
SET @q_cet6_2023_06_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_26, NULL, '{"A":"A) Allow employees to have a flexible work schedule.","B":"B) Encourage employees to be friends with colleagues.","C":"C) Help employees balance work and family responsibilities.","D":"D) Organize activities to nourish friendships outside of work."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q26'
);
SET @q_cet6_2023_06_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_27, NULL, '{"A":"A) affirmed","B":"B) approximately","C":"C) completely","D":"D) differentiate","E":"E) distinct","F":"F) domain","G":"G) formidable","H":"H) outperformed","I":"I) overstated","J":"J) pledge","K":"K) previously","L":"L) prospective","M":"M) prove","N":"N) surpass","O":"O) volume"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q27'
);
SET @q_cet6_2023_06_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_28, NULL, '{"A":"A) affirmed","B":"B) approximately","C":"C) completely","D":"D) differentiate","E":"E) distinct","F":"F) domain","G":"G) formidable","H":"H) outperformed","I":"I) overstated","J":"J) pledge","K":"K) previously","L":"L) prospective","M":"M) prove","N":"N) surpass","O":"O) volume"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q28'
);
SET @q_cet6_2023_06_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_29, NULL, '{"A":"A) affirmed","B":"B) approximately","C":"C) completely","D":"D) differentiate","E":"E) distinct","F":"F) domain","G":"G) formidable","H":"H) outperformed","I":"I) overstated","J":"J) pledge","K":"K) previously","L":"L) prospective","M":"M) prove","N":"N) surpass","O":"O) volume"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q29'
);
SET @q_cet6_2023_06_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_30, NULL, '{"A":"A) affirmed","B":"B) approximately","C":"C) completely","D":"D) differentiate","E":"E) distinct","F":"F) domain","G":"G) formidable","H":"H) outperformed","I":"I) overstated","J":"J) pledge","K":"K) previously","L":"L) prospective","M":"M) prove","N":"N) surpass","O":"O) volume"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q30'
);
SET @q_cet6_2023_06_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_31, NULL, '{"A":"A) affirmed","B":"B) approximately","C":"C) completely","D":"D) differentiate","E":"E) distinct","F":"F) domain","G":"G) formidable","H":"H) outperformed","I":"I) overstated","J":"J) pledge","K":"K) previously","L":"L) prospective","M":"M) prove","N":"N) surpass","O":"O) volume"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q31'
);
SET @q_cet6_2023_06_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_32, NULL, '{"A":"A) affirmed","B":"B) approximately","C":"C) completely","D":"D) differentiate","E":"E) distinct","F":"F) domain","G":"G) formidable","H":"H) outperformed","I":"I) overstated","J":"J) pledge","K":"K) previously","L":"L) prospective","M":"M) prove","N":"N) surpass","O":"O) volume"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q32'
);
SET @q_cet6_2023_06_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_33, NULL, '{"A":"A) affirmed","B":"B) approximately","C":"C) completely","D":"D) differentiate","E":"E) distinct","F":"F) domain","G":"G) formidable","H":"H) outperformed","I":"I) overstated","J":"J) pledge","K":"K) previously","L":"L) prospective","M":"M) prove","N":"N) surpass","O":"O) volume"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q33'
);
SET @q_cet6_2023_06_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_34, NULL, '{"A":"A) affirmed","B":"B) approximately","C":"C) completely","D":"D) differentiate","E":"E) distinct","F":"F) domain","G":"G) formidable","H":"H) outperformed","I":"I) overstated","J":"J) pledge","K":"K) previously","L":"L) prospective","M":"M) prove","N":"N) surpass","O":"O) volume"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q34'
);
SET @q_cet6_2023_06_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_35, NULL, '{"A":"A) affirmed","B":"B) approximately","C":"C) completely","D":"D) differentiate","E":"E) distinct","F":"F) domain","G":"G) formidable","H":"H) outperformed","I":"I) overstated","J":"J) pledge","K":"K) previously","L":"L) prospective","M":"M) prove","N":"N) surpass","O":"O) volume"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q35'
);
SET @q_cet6_2023_06_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_36, NULL, '{"A":"A) affirmed","B":"B) approximately","C":"C) completely","D":"D) differentiate","E":"E) distinct","F":"F) domain","G":"G) formidable","H":"H) outperformed","I":"I) overstated","J":"J) pledge","K":"K) previously","L":"L) prospective","M":"M) prove","N":"N) surpass","O":"O) volume"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q36'
);
SET @q_cet6_2023_06_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_37, 'It does us far more good to focus on things we can be grateful for than what makes us sad and resentful.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q37'
);
SET @q_cet6_2023_06_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_38, 'The beneficial impacts of gratitude can extend from individuals to their community and to the wider society.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q38'
);
SET @q_cet6_2023_06_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_39, 'The participants in a recent study repeatedly underestimated the positive effect on those who received thank- you notes.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q39'
);
SET @q_cet6_2023_06_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_40, 'Good deeds can sometimes make people feel uncomfortable.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q40'
);
SET @q_cet6_2023_06_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_41, 'People who regularly express gratitude can benefit in moral terms.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q41'
);
SET @q_cet6_2023_06_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_42, 'A basketball coach advocated performing generous acts without expecting anything in return.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q42'
);
SET @q_cet6_2023_06_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_43, 'More and more evidence shows it makes us mentally and physically healthier to routinely count our blessings.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q43'
);
SET @q_cet6_2023_06_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_44, 'Of all states of mind, feeling grateful is considered one of the most healthy and beneficial.', NULL, 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q44'
);
SET @q_cet6_2023_06_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_45, 'The principles underlying the research into gratitude are nothing new at all.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q45'
);
SET @q_cet6_2023_06_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_46, 'Gratitude is likely to enhance one''s sense of being connected with other people.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q46'
);
SET @q_cet6_2023_06_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_47, 'What do we learn about the deeper implications of AI?', '{"A":"A) It is causing catastrophic levels of unemployment.","B":"B) It is doing physical harm to human operators.","C":"C) It is altering moral judgments.","D":"D) It is reshaping humanity."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q47'
);
SET @q_cet6_2023_06_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_48, 'What is the consequence of algorithmic prescription replacing human judgment?', '{"A":"A) People lose the chance to cultivate the ability to make practical judgments.","B":"B) People are prevented from participating in making major decisions in the workplace.","C":"C) Managers no longer have the chance to decide which loan to approve.","D":"D) Managers do not need to take the trouble to determine who to hire or fire."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q48'
);
SET @q_cet6_2023_06_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_49, 'What may result from increasing application of recommendation engines in our consumption of culture?', '{"A":"A) Consumers will have much limited choice.","B":"B) Consumers will actually enjoy better luck.","C":"C) It will be easier to decide on what to enjoy.","D":"D) Humans will develop tastes similar to machines''."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q49'
);
SET @q_cet6_2023_06_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_50, 'What is likely to happen to larger parts of our daily life as machine learning algorithms improve?', '{"A":"A) They will turn out to be more pleasant.","B":"B) They will repeat our past experience.","C":"C) They can be completely anticipated.","D":"D) They may become better and better."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q50'
);
SET @q_cet6_2023_06_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_51, 'Why does the author say the creatures living in the more and more AI-mediated world will become increasingly unlike us?', '{"A":"A) They will have lost the most significant human element of being intelligent.","B":"B) They will no longer possess the human characteristic of being unpredictable.","C":"C) They will not be able to understand themselves as we can do today.","D":"D) They will be deprived of what their predecessors were proud of about themselves."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q51'
);
SET @q_cet6_2023_06_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_52, 'What do we learn about phonics in many American classrooms?', '{"A":"A) It is ill reputed.","B":"B) It is mostly misapplied.","C":"C) It is arbitrarily excluded.","D":"D) It is misrepresented."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q52'
);
SET @q_cet6_2023_06_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_53, 'What has America been witnessing for decades?', '{"A":"A) An obsession with innovating teaching methodologies of reading.","B":"B) An enduring debate over the approach to teaching children to read.","C":"C) An increasing concern with many children''s inadequacy in literacy.","D":"D) An ever-forceful advocacy of a combined method for teaching reading."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q53'
);
SET @q_cet6_2023_06_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_54, 'Why does Tenette Smith think a combination of teaching methods is ineffective?', '{"A":"A) Elementary schoolchildren will be frustrated when taught with several methods combined.","B":"B) Phonics has to be systematically applied and clearly taught to achieve the desired effect.","C":"C) Sprinkling in a little phonics deters the progress of even adequately motivated children.","D":"D) Balanced literacy fails to sustain children''s interest in developing a good reading habit."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q54'
);
SET @q_cet6_2023_06_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_55, 'What does the author say Mississippi''s success is attributed to?', '{"A":"A) Convening a National Reading Panel to synthesize research evidence.","B":"B) Placing sufficient emphasis upon both fluency and comprehension.","C":"C) Adopting scientifically grounded approaches to teaching reading.","D":"D) Obtaining support from Congress to upgrade teaching methods."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-1-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q55'
);
SET @q_cet6_2023_06_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_1_56, 'What have advances in statistics and brain imaging proved ineffective?', '{"A":"A) The teaching of symbol-sound relationships.","B":"B) Explicit instruction in phonemic awareness.","C":"C) Efforts to end the reading wars.","D":"D) The immersive approach."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_1_56
);

-- ==================== cet6-2023-06-2 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-r1', 'BANKED_CLOZE', 'CET6', NULL, 'Imagine sitting down to a big dinner: a massive steak, a large portion of fried potatoes, and cake for dessert. After eating so much, you should be too full to eat another bite. But some people experience a powerful urge to keep eating, even after __26__ in a huge meal, a behavior that makes little sense, as most adults are well-versed in the dangers of obesity, which researchers have shown correlates with __27__ health issues and is even linked to increased __28__ risk. But some people still keep eating long after they should stop, a phenomenon Dr. Susan Thompson calls "insatiable(永不满足的) hunger." It is characterized by two main __29__ : not being satisfied by eating, and having a desire to stay sedentary(久坐不动的). This is at __30__ with how humans are biologically programmed. When there was a great deal of food available, ancient people would gorge on calories; this massive calorie intake was accompanied by an urge to get active. Humans were also programmed for something called "compensation," which is the brain''s __31__ mechanism for preventing the accumulation of excess weight. With compensation, if you eat one large meal in the morning, you are naturally __32__ to eat less for the rest of the day. But recent studies show that 70% of American adults have lost the ability to naturally compensate for the calories they consume; worse __33__ , a significant number of them report __34__ hunger halfway through an eating session, but, by the end of the meal, they feel the same or higher levels of hunger than when they sat down. Dr. Thompson argues that the main cause of this phenomenon is the modern diet, which is __35__ of food high in sugar, carbohydrates and calories.', NULL, '["A) attributes","B) comprised","C) conceded","D) conservation","E) diminishing","F) far","G) inclined","H) indulging","I) innumerable","J) mortality","K) odds","L) plights","M) regulatory","N) still","O) unmatchable"]', 287, 'IMPORT', 'cet6-2023-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-2-r1'
);
SET @pg_cet6_2023_06_2_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-2-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-r2', 'MATCHING', 'CET6', 'The problem with being perfect', 'A) When psychologist Jessica Pryor lived near an internationally renowned university, she once saw a student walking into a library holding a sleeping bag and a coffee maker. She has heard of graduate students spending 12 to 18 hours at a time in the lab. Their schedules are meant to be literally punishing: If they are scientists-in-training, they won''t allow themselves to watch Netflix until their experiments start generating results. "Relationships become estranged(疏远的)—people stop inviting them to social gatherings or dinner parties, which leads them to spend even more time in the lab," Pryor told me. B) Along with other therapists, Pryor, who is now with the Family Institute at Northwestern University, is trying to sound the alarm about a tendency among young adults and college students to strive for perfection in their work—sometimes at any cost. Though it is often portrayed as a positive trait, Pryor and others say extreme perfectionism can lead to depression, anxiety, and even suicide. C) What''s more, perfectionism seems to be on the rise. In a study of thousands of American, Canadian, and British college students published earlier this year, Thomas Curran of the University of Bath and Andrew Hill of York St. John University found that today''s college students report higher levels of perfectionism than college students did during the 1990s or early 2000s. They measured three types of perfectionism: self- oriented, or a desire to be perfect; socially prescribed, or a desire to live up to others'' expectations; and other-oriented, or holding others to unrealistic standards. From 1989 to 2016, they found, self-oriented perfectionism scores increased by 10 percent, socially prescribed scores rose by 33 percent, and other-oriented perfectionism increased by 16 percent. D) A person living with an other-oriented perfectionist might feel criticized by the perfectionist spouse for not doing household chores exactly the "right" way. "One of the most common things couples argue about is the proper way of loading the dishwasher," says Amy Bach, a psychologist in Providence, Rhode Island. E) Curran describes socially prescribed perfectionism as "My self-esteem is contingent on what other people think." His study didn''t examine the causal reasons for its rise, but he assumes that the rise of both standardized testing and social media might play a role. These days, LinkedIn alerts us when our rival gets a new job, and Instagram can let us know how well "liked" our lives are compared with a friend''s. In an opinion piece earlier this year, Curran and Hill argue that society has also become more dog-eat-dog. "Over the last 50 years, public interest and civic responsibility have been progressively eroded," they write, "replaced by a focus on self-interest and competition in a supposedly free and open marketplace." We strive for perfection, it seems, because we feel we must in order to get ahead. Michael Brustein, a clinical psychologist in Manhattan, says when he first began practicing in 2007, he was surprised by how prevalent perfectionism was among his clients, despite how little his graduate training had focused on the phenomenon. He sees perfectionism in, among others, clients who are entrepreneurs, artists, and tech employees. "You''re in New York because you''re ambitious, you have this need to strive," he says. "But then your whole identity gets wrapped into a goal." F) Perfectionism can, of course, be a positive force. Think of professional athletes, who train aggressively for ever-higher levels of competition. In well-adjusted perfectionism, someone who doesn''t get the gold is able to forget the setback and move on. In maladaptive(不当的) perfectionism, meanwhile, people make an archive of all their failures. They revisit these archives constantly, thinking, as Pryor puts it, "I need to make myself feel terrible so I don''t do this again." Then they double down, "raising the expectation bar even higher, which increases the likelihood of defeat, which makes you self-critical, so you raise the bar higher, work even harder," she says. Next comes failure, shame, and pushing yourself even harder toward even higher and more impossible goals. Meeting them becomes an "all or nothing" premise. Pryor offered this example: "Even if I''m an incredible attorney, if I don''t make partner in the same pacing as one of my colleagues, clearly that means I''m a failure." G) Brustein says his perfectionist clients tend to devalue their accomplishments, so that every time a goal is achieved, the high lasts only a short time, like "a gas tank with a hole in it." If the boss says you did a great job, it''s because he doesn''t know anything. If the audience likes your work, that''s because it''s too stupid to know what good art actually is. But, therapists say, there are also different ways perfectionism manifests. Some perfectionists are always pushing themselves forward. But others actually fall behind on work, unable to complete assignments unless they are, well, perfect. Or they might handicap their performance ahead of time. They''re the ones partying until 2 a.m. the night before the final, so that when the grade C rolls in, there''s a ready excuse. H) While educators and parents have successfully convinced students of the need to be high performing and diligent, the experts told me, they haven''t adequately prepared them for the inevitability of failure. Instead of praises like "You''re so smart," parents and educators should say things like "You really stuck with it," Pryor says, to emphasize the value of perseverance over intrinsic talent. Pryor notes that many of her clients are wary she''ll "turn them into some degenerate couch potato and teach them to be okay with it." Instead, she tries to help them think through the parts of their perfectionism they''d like to keep, and to lose the parts that are ruining their lives. I) Bach, who sees many students from Brown University, says some of them don''t even go out on weekends, let alone weekdays. She tells them, "Aim high, but get comfortable with good enough." When they don''t get some award, she encourages them to remember that "one outcome is not a basis for a broad conclusion about the person''s intelligence, qualifications, or potential for the future." J) The treatment for perfectionism might be as simple as having patients keep logs of things they can be proud of, or having them behave imperfectly in small ways, just to see how it feels. "We might have them hang the towels crooked(不正的) or wear some clothing inside out," says Martin Antony, a professor in the department of psychology at Ryerson University in Toronto. K) Brustein likes to get his perfectionist clients to create values that are important to them, then try to shift their focus to living according to those values rather than achieving specific goals. It''s a play on the "You really stuck with it" message for kids. In other words, it isn''t about doing a headstand in yoga class; it''s about going to yoga class in the first place, because you like to be the kind of person who takes care of herself. But he warns that some people go into therapy expecting too much—an instant transformation of themselves from a pathological(病态的) perfectionist to a (still high-achieving) non-perfectionist. They try to be perfect, in other words, at no longer being perfect.', NULL, NULL, 1199, 'IMPORT', 'cet6-2023-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-2-r2'
);
SET @pg_cet6_2023_06_2_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-2-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-r3', 'CAREFUL_READING', 'CET6', NULL, 'How on earth did we come to this? We protect our children obsessively from every harm; we scrutinize every carer, teacher or doctor with whom they come into contact. Yet despite all this, one group, which in no way has their best interests at heart, has almost unconstrained access. We seem to take it for granted that advertisers and marketers are allowed to condition even the youngest children. Before children have even developed a proper sense of their own identity, or learned to handle money, they''re encouraged to associate status and self-worth with stuff, and to look to external things such as fame and wealth for validation. We''re turning out little consumers rather than young citizens who will value themselves for what they contribute to the society in which they live. We''ve reached this point so gradually that many of us have never questioned it. It''s crept up on us in the 60 years since advertisers started to target the young and found that they could recruit them to a commercial assault on their parents. We''ve come to know it as "pester power" or the ability of children to pressure parents to make certain purchases. Many psychologists, child development experts and educators point to research suggesting that this emerging cradle-to-grave consumerism is contributing to growing rates of low self-esteem, depression and other forms of mental illness. Not all psychologists agree. There''re plenty working hand in glove with a ￡12bn-a-year industry that has turned the manipulation of adult emotions and desires into an art form—often literally. It''s also one that''s forever developing new ways to persuade our children to desire material possessions, and because of advertisements'' viral effect they only need to infect a few to reach the many. Advertising and marketing can serve a useful purpose for children. Marketing may help socialize children as consumers, inform them about products, and help them carve out unique identities as they reach adulthood. Then, should we ban all advertising aimed at young children? I say yes. Of course there''ll be plenty of objections to an outright ban on advertising to the under-11s. There''ll be those who argue that would be a breach of freedom of speech and infringe the rights of corporations to brainwash little children into demanding their products. Most parents hate what advertising does to their children, but we do have the power to end it and let our children grow up free from many of the pressures of consumerism until they''re old enough to make their own decisions. And though advertising is only part of an all-pervasive(无处不在的) marketing culture we need to make a start somewhere. Let''s ban all advertising targeting children of primary school age and younger now.', NULL, NULL, 449, 'IMPORT', 'cet6-2023-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-2-r3'
);
SET @pg_cet6_2023_06_2_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-2-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-r4', 'CAREFUL_READING', 'CET6', NULL, 'Many oppose workplace surveillance, because of the inherent dehumanizing effect it has and the relentless pressure it brings. But it''s on the rise around the world as firms look to become more efficient by squeezing more productivity from their workers. More than half of companies with over $750m in annual revenue used "non-traditional" monitoring techniques on staff last year. Monitoring employee performance gives firms the ability to assess how their staff are performing and interacting, which can be good for both the firm and employees themselves. A growing number of analytics companies offer this service. They gather "data exhaust" left by employees'' email and instant messaging apps, and use name badges equipped with radio-frequency identification devices and microphones. These can check how much time you spend talking, your volume and tone of voice, even if you do not dominate conversations. While this may sound intrusive, exponents argue that it can also protect employees against bullying and sexual harassment. Some of this data analysis can produce unexpected results. For example, it was found that people who sat at 12-person lunch tables tended to interact, share ideas more and outperform those who regularly sat at four-person tables, a fact that would probably have gone undetected without such data analysis. Over the last few years a Stockholm co-working space called Epicenter has gone much further and holds popular "chipping parties", where people can have microchips implanted in their hands. They can use the implants to access electronically-controlled doors, or monitor how typing speed correlates with heart rate. Implanted chips may seem extreme, but it is a relatively small step from ID cards and biometrics to such devices. As long as such schemes are voluntary, there will probably be a growing number of convenience-oriented uses so that a substantial number of workers would opt to have a chip inserted. But if implanted chips are used to reduce slack time or rest breaks, that could prove to be detrimental. And if surveillance tools take away autonomy, that''s when they prove most unpopular. A lot depends on how such monitoring initiatives are communicated and this could prevent possible revolts being staged. If bosses don''t communicate effectively, employees assume the worst. But if they''re open about the information they''re collecting and what they''re doing with it, research suggests 46% of employees are generally okay with it. Although many such monitoring schemes use anonymised data and participation is voluntary, many staffers remain sceptical and fear an erosion of their civil liberties. So workplace surveillance could be empowering for staff and useful for companies looking to become more efficient and profitable. But implemented in the wrong way, it could also become an unpopular tool of oppression that proves counterproductive.', NULL, NULL, 450, 'IMPORT', 'cet6-2023-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-2-r4'
);
SET @pg_cet6_2023_06_2_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-2-r4' LIMIT 1);

-- 翻译 cet6-2023-06-2
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-translation'
);
SET @q_cet6_2023_06_2_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_01, '随着中国经济的快速发展和人们生活水平的稳步提高,城市居民对环境和生活品质的要求越来越高。中国地方政府更加注重公共设施的建设和改进,以更好地满足人们的需求。通过兴建新的广场、公园和公共绿地或对原有公共场地重新加以规划改造,许多城市为市民提供了更多休闲和社交的场所。 如今,政府出资购置的健身器械和铺设的健身步道在不少城市随处可见,既明显改善了市民户外活动的条件,又使城市更加美丽。', NULL, 'With the rapid development of China''s economy and the steady improvement of people''s living standards, urban residents are placing increasingly high demands on the environment and the quality of life. To meet these rising demands, Chinese local governments are attaching greater importance to the construction and improvement of public facilities. By building new squares, parks and public green spaces, or redesigning and renovating existing public areas, many cities have provided their citizens with more places for leisure and social activities. Today, government-funded fitness equipment and newly paved fitness trails can be seen everywhere in many cities, which has not only markedly improved the conditions for residents'' outdoor activities but also made the cities more beautiful.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_01
);

-- 听力 Q1 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q01', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q01'
);
SET @q_cet6_2023_06_2_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_02, NULL, '{"A":"A) She is attracted to the beauty of modern buildings.","B":"B) She is preoccupied with her dream to be an architect.","C":"C) She is influenced by her father who teaches architecture.","D":"D) She is drawn to its integration of design and engineering."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_02
);

-- 听力 Q2 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q02', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q02'
);
SET @q_cet6_2023_06_2_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_03, NULL, '{"A":"A) Through hard work.","B":"B) With the professor''s help.","C":"C) By studying the subject online.","D":"D) By taking prerequisite courses."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_03
);

-- 听力 Q3 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q03', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q03'
);
SET @q_cet6_2023_06_2_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_04, NULL, '{"A":"A) It is groundbreaking.","B":"B) It is long-lasting.","C":"C) It is immaterial.","D":"D) It is immortal."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_04
);

-- 听力 Q4 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q04', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q04'
);
SET @q_cet6_2023_06_2_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_05, NULL, '{"A":"A) Economics.","B":"B) Philosophy.","C":"C) Computer science.","D":"D) Western art."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_05
);

-- 听力 Q5 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q05', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q05'
);
SET @q_cet6_2023_06_2_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_06, NULL, '{"A":"A) He has occasionally been harassed by his fans.","B":"B) He has been guarded by a discreet assistant.","C":"C) He is well known to the public.","D":"D) He is a famous football coach."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_06
);

-- 听力 Q6 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q06', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q06'
);
SET @q_cet6_2023_06_2_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_07, NULL, '{"A":"A) Serve as a personal assistant.","B":"B) Play a key role in Real Madrid.","C":"C) Run common daily chores for the woman.","D":"D) Help promote Mr. Sanchez''s public profile."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_07
);

-- 听力 Q7 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q07', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q07'
);
SET @q_cet6_2023_06_2_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_08, NULL, '{"A":"A) He is honest and always tells the truth.","B":"B) He once worked part-time in university.","C":"C) He cares little about his working hours.","D":"D) He has little previous work experience."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q08', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q08'
);
SET @q_cet6_2023_06_2_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_09, NULL, '{"A":"A) He has a strong ability to connect with people.","B":"B) He has a high proficiency in several languages.","C":"C) He has a sound knowledge of sports consultancy.","D":"D) He has a natural capacity to cooperate with others."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_09
);

-- 听力 Q9 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q09', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q09'
);
SET @q_cet6_2023_06_2_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_10, NULL, '{"A":"A) They bring more benefits to young people.","B":"B) They require less supervision and training.","C":"C) They are more suitable to young people.","D":"D) They have fewer rules and pressures."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_10
);

-- 听力 Q10 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q10', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q10'
);
SET @q_cet6_2023_06_2_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_11, NULL, '{"A":"A) They prevent kids from enjoying adventure sports.","B":"B) They help kids guard against any possible injuries.","C":"C) They rob kids of the chance to cultivate their courage.","D":"D) They deprive kids of the opportunity to develop team spirit."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_11
);

-- 听力 Q11 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q11', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q11'
);
SET @q_cet6_2023_06_2_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_12, NULL, '{"A":"A) Help them take up these sports when they are more mature.","B":"B) Let them participate in some less risky outdoor activities.","C":"C) Ask them to try some forms of indoor sports.","D":"D) Introduce them to these sports step by step."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_12
);

-- 听力 Q12 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q12', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q12'
);
SET @q_cet6_2023_06_2_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_13, NULL, '{"A":"A) Consumers often have a craving for the latest model.","B":"B) Such products tend to comprise parts that are irreplaceable.","C":"C) Tech firms intentionally design products to have short lifespans.","D":"D) Manufacturers use effective strategies to promote fancier products."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_13
);

-- 听力 Q13 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q13', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q13'
);
SET @q_cet6_2023_06_2_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_14, NULL, '{"A":"A) Indicate the competitiveness of their products.","B":"B) List a repairability score of their products.","C":"C) Specify the major parts of their products.","D":"D) Detail the lifecycle of their products."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_14
);

-- 听力 Q14 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q14', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q14'
);
SET @q_cet6_2023_06_2_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_15, NULL, '{"A":"A) Take the initiative to reduce electronic waste.","B":"B) Take due caution in upgrading their products.","C":"C) Invest in constructing more recycling facilities.","D":"D) Substitute all toxic substances with non-toxic ones."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_15
);

-- 听力 Q15 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q15', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q15'
);
SET @q_cet6_2023_06_2_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_16, NULL, '{"A":"A) It can be solved.","B":"B) It is certain to worsen.","C":"C) It will be fixed by tech companies.","D":"D) It is unavoidable in the long run."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_16
);

-- 听力 Q16 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q16', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q16'
);
SET @q_cet6_2023_06_2_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_17, NULL, '{"A":"A) How internet monitoring can be implemented.","B":"B) How to encourage productive internet surfing.","C":"C) How cyberloafing affects overall productivity.","D":"D) How to prevent employees from cyberloafing."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_17
);

-- 听力 Q17 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q17', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q17'
);
SET @q_cet6_2023_06_2_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_18, NULL, '{"A":"A) Cyberloafing is a sign of workers'' laziness.","B":"B) Cyberloafing may relieve employees of stress.","C":"C) Employee engagement is closely related to job satisfaction.","D":"D) Overuse of social media may lead to decline in productivity."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_18
);

-- 听力 Q18 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q18', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q18'
);
SET @q_cet6_2023_06_2_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_19, NULL, '{"A":"A) Taking mini-breaks means better job performance.","B":"B) Cyberloafing generally does more harm than good.","C":"C) Worker turnover is linked to the time allowed for cyberloafing.","D":"D) Employees who indulge in internet surfing are most likely to quit."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_19
);

-- 听力 Q19 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q19', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q19'
);
SET @q_cet6_2023_06_2_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_20, NULL, '{"A":"A) There were no wooden buildings.","B":"B) There were environmental problems.","C":"C) There were no trees.","D":"D) There were few settlers."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_20
);

-- 听力 Q20 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q20', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q20'
);
SET @q_cet6_2023_06_2_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_21, NULL, '{"A":"A) He served as chairman of the Nebraska State Board of Agriculture.","B":"B) He urged the state to start the Nebraska State Gardening Society.","C":"C) He engaged himself in a large number of aesthetic projects.","D":"D) He founded a newspaper and used it to promote his ideas."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_21
);

-- 听力 Q21 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q21', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q21'
);
SET @q_cet6_2023_06_2_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_22, NULL, '{"A":"A) A special prize was awarded to Julius Morton.","B":"B) One million trees were planted throughout Nebraska.","C":"C) The state government declared it the official Arbor Day.","D":"D) Nebraska earned the nickname \\"the Tree Planters State\\"."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_22
);

-- 听力 Q22 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q22', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q22'
);
SET @q_cet6_2023_06_2_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_23, NULL, '{"A":"A) They spread across Europe and Asia in a few decades.","B":"B) They lived mostly in Africa for about 200,000 years.","C":"C) They preferred to live in Europe rather than in Asia.","D":"D) They moved out of Africa about 60,000 years ago."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_23
);

-- 听力 Q23 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q23', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q23'
);
SET @q_cet6_2023_06_2_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_24, NULL, '{"A":"A) The discovery of two modern human teeth in China.","B":"B) The traces of human migration out of Africa to Asia.","C":"C) The human fossils discovered most recently in Africa.","D":"D) The Luna cave in Guangxi Zhuang Autonomous Region."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_24
);

-- 听力 Q24 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q24', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q24'
);
SET @q_cet6_2023_06_2_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_25, NULL, '{"A":"A) There must have been some reason for human migration.","B":"B) There have been changes in animals'' living conditions.","C":"C) Humans adapted themselves to the environment there.","D":"D) Humans had access to abundant food sources there."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_25
);

-- 听力 Q25 LECTURE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q25', 4, 'CET6', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q25'
);
SET @q_cet6_2023_06_2_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_26, NULL, '{"A":"A) How humans settled down on the Arabian Peninsula.","B":"B) When modern humans started to disperse out of Africa.","C":"C) What path modern humans took to migrate out of Africa.","D":"D) Why fresh water is so important for human survival."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q26'
);
SET @q_cet6_2023_06_2_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_27, NULL, '{"A":"A) attributes","B":"B) comprised","C":"C) conceded","D":"D) conservation","E":"E) diminishing","F":"F) far","G":"G) inclined","H":"H) indulging","I":"I) innumerable","J":"J) mortality","K":"K) odds","L":"L) plights","M":"M) regulatory","N":"N) still","O":"O) unmatchable"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q27'
);
SET @q_cet6_2023_06_2_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_28, NULL, '{"A":"A) attributes","B":"B) comprised","C":"C) conceded","D":"D) conservation","E":"E) diminishing","F":"F) far","G":"G) inclined","H":"H) indulging","I":"I) innumerable","J":"J) mortality","K":"K) odds","L":"L) plights","M":"M) regulatory","N":"N) still","O":"O) unmatchable"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q28'
);
SET @q_cet6_2023_06_2_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_29, NULL, '{"A":"A) attributes","B":"B) comprised","C":"C) conceded","D":"D) conservation","E":"E) diminishing","F":"F) far","G":"G) inclined","H":"H) indulging","I":"I) innumerable","J":"J) mortality","K":"K) odds","L":"L) plights","M":"M) regulatory","N":"N) still","O":"O) unmatchable"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q29'
);
SET @q_cet6_2023_06_2_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_30, NULL, '{"A":"A) attributes","B":"B) comprised","C":"C) conceded","D":"D) conservation","E":"E) diminishing","F":"F) far","G":"G) inclined","H":"H) indulging","I":"I) innumerable","J":"J) mortality","K":"K) odds","L":"L) plights","M":"M) regulatory","N":"N) still","O":"O) unmatchable"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q30'
);
SET @q_cet6_2023_06_2_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_31, NULL, '{"A":"A) attributes","B":"B) comprised","C":"C) conceded","D":"D) conservation","E":"E) diminishing","F":"F) far","G":"G) inclined","H":"H) indulging","I":"I) innumerable","J":"J) mortality","K":"K) odds","L":"L) plights","M":"M) regulatory","N":"N) still","O":"O) unmatchable"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q31'
);
SET @q_cet6_2023_06_2_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_32, NULL, '{"A":"A) attributes","B":"B) comprised","C":"C) conceded","D":"D) conservation","E":"E) diminishing","F":"F) far","G":"G) inclined","H":"H) indulging","I":"I) innumerable","J":"J) mortality","K":"K) odds","L":"L) plights","M":"M) regulatory","N":"N) still","O":"O) unmatchable"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q32'
);
SET @q_cet6_2023_06_2_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_33, NULL, '{"A":"A) attributes","B":"B) comprised","C":"C) conceded","D":"D) conservation","E":"E) diminishing","F":"F) far","G":"G) inclined","H":"H) indulging","I":"I) innumerable","J":"J) mortality","K":"K) odds","L":"L) plights","M":"M) regulatory","N":"N) still","O":"O) unmatchable"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q33'
);
SET @q_cet6_2023_06_2_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_34, NULL, '{"A":"A) attributes","B":"B) comprised","C":"C) conceded","D":"D) conservation","E":"E) diminishing","F":"F) far","G":"G) inclined","H":"H) indulging","I":"I) innumerable","J":"J) mortality","K":"K) odds","L":"L) plights","M":"M) regulatory","N":"N) still","O":"O) unmatchable"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q34'
);
SET @q_cet6_2023_06_2_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_35, NULL, '{"A":"A) attributes","B":"B) comprised","C":"C) conceded","D":"D) conservation","E":"E) diminishing","F":"F) far","G":"G) inclined","H":"H) indulging","I":"I) innumerable","J":"J) mortality","K":"K) odds","L":"L) plights","M":"M) regulatory","N":"N) still","O":"O) unmatchable"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q35'
);
SET @q_cet6_2023_06_2_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_36, NULL, '{"A":"A) attributes","B":"B) comprised","C":"C) conceded","D":"D) conservation","E":"E) diminishing","F":"F) far","G":"G) inclined","H":"H) indulging","I":"I) innumerable","J":"J) mortality","K":"K) odds","L":"L) plights","M":"M) regulatory","N":"N) still","O":"O) unmatchable"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q36'
);
SET @q_cet6_2023_06_2_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_37, 'Socially prescribed perfectionism is described as one''s self-esteem depending on other people''s opinion.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q37'
);
SET @q_cet6_2023_06_2_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_38, 'Jessica Pryor has learned that some graduate students work such long hours in the lab that they have little time for entertainment or socializing.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q38'
);
SET @q_cet6_2023_06_2_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_39, 'The author believes perfectionism may sometimes be constructive.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q39'
);
SET @q_cet6_2023_06_2_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_40, 'It is found that perfectionism is getting more and more prevalent among college students.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q40'
);
SET @q_cet6_2023_06_2_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_41, 'Some experts suggest parents and educators should prepare students for failures.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q41'
);
SET @q_cet6_2023_06_2_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_42, 'Some therapists warn that young adults tend to pursue perfection in their work.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q42'
);
SET @q_cet6_2023_06_2_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_43, 'Psychologist Amy Bach encourages her students to aim high but be content with something less than perfect.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q43'
);
SET @q_cet6_2023_06_2_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_44, 'A clinical psychologist finds perfectionism is widespread among his clients.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q44'
);
SET @q_cet6_2023_06_2_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_45, 'In trying to overcome perfectionism, some people are still pursuing perfection.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q45'
);
SET @q_cet6_2023_06_2_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_46, 'In pursuing perfection, some perfectionists fail to complete their tasks on time.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q46'
);
SET @q_cet6_2023_06_2_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_47, 'Which group of people does the author say has almost unrestricted access to children?', '{"A":"A) Advertisers.","B":"B) Carers.","C":"C) Teachers.","D":"D) Doctors."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q47'
);
SET @q_cet6_2023_06_2_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_48, 'What kind of people should we enable children to become according to the author?', '{"A":"A) Those who look to fame and wealth for external and ultimate validation.","B":"B) Those who value themselves because of their contribution to society.","C":"C) Those who associate self-worth with the ability to handle money.","D":"D) Those who have developed a proper sense of their own identity."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q48'
);
SET @q_cet6_2023_06_2_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_49, 'Many child development experts and educators call attention to research that suggests _____.', '{"A":"A) life-long consumerism is causing more and more cases of psychological problems.","B":"B) increasing commercialization of education is eroding many children''s self-esteem.","C":"C) the growing desire for wealth is contributing to a rising rate of depression.","D":"D) the craving for purchasing material things is nurtured throughout one''s life."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q49'
);
SET @q_cet6_2023_06_2_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_50, 'What does the author imply about the impact of advertising?', '{"A":"A) It is actually infectious to many rather than a few.","B":"B) It is rooted in our desire for material possessions.","C":"C) It is comparable to that of virus.","D":"D) It is literally limited to children."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q50'
);
SET @q_cet6_2023_06_2_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_51, 'What is the opponents'' argument against a complete ban on advertising to young children?', '{"A":"A) It would deprive them of the chance to learn about products.","B":"B) It would render them unable to carve out unique identities.","C":"C) It would breach their freedom as would-be consumers.","D":"D) It would violate the rights endowed upon advertisers."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q51'
);
SET @q_cet6_2023_06_2_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_52, 'Why are many people opposed to monitoring employee performance?', '{"A":"A) It puts workers under constant pressure.","B":"B) It is universally deemed anti-human by nature.","C":"C) It does both mental and physical harm to employees monitored.","D":"D) It enables firms to squeeze maximal productivity from employees."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q52'
);
SET @q_cet6_2023_06_2_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_53, 'What is the supporters'' argument for workplace surveillance?', '{"A":"A) It enables employees to refrain from dominating conversations.","B":"B) It enhances employees'' identification with firms they work in.","C":"C) It can alert employees to intrusion into their privacy.","D":"D) It can protect employees against aggressive behavior."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q53'
);
SET @q_cet6_2023_06_2_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_54, 'What does the author want to show by the example of different numbers of people interacting at lunch tables?', '{"A":"A) Data analysis is key to the successful implementation of workplace surveillance.","B":"B) Analyzing data gathered from workers can yield something unexpected.","C":"C) More workmates sitting at a lunch table tend to facilitate interaction and idea sharing.","D":"D) It is hard to decide on how many people to sit at a lunch table without data analysis."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q54'
);
SET @q_cet6_2023_06_2_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_55, 'What does much of the positive effect of monitoring initiatives depend on?', '{"A":"A) How frequently employees are to be monitored.","B":"B) What specific personal information is being excluded.","C":"C) What steps are taken to minimize their detrimental impact.","D":"D) How well bosses make known their purpose of monitoring."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-2-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q55'
);
SET @q_cet6_2023_06_2_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-2-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_2_56, 'What concern do monitoring initiatives cause among many staffers?', '{"A":"A) They may empower employers excessively.","B":"B) They may erode the workplace environment.","C":"C) They may infringe upon staffers'' entitled freedom.","D":"D) They may become counterproductive in the long run."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_2_56
);

-- ==================== cet6-2023-06-3 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-r1', 'BANKED_CLOZE', 'CET6', NULL, 'You might not know yourself as well as you think. According to a new study, people are __26__ accurate judges of only some of their behaviors. While most previous studies on how well people know themselves have been done on long-term personality traits, this new study __27__ how well people understand how they are acting from one moment to the next. Researchers asked participants to wear audio recorders that automatically __28__ every 9.5 minutes between 7 a.m. and 2 a.m. to record 30 seconds of audio. These participants were then emailed surveys four times a day asking them to __29__ how outgoing, agreeable, or conscientious they were during a particular hour of the day. The study used data from 248 participants, all of whom answered questions about their behavior for two __30__ weeks and wore the audio device for one of those weeks. Six laboratory assistants rated each participant''s audio clips to see how their observations compared with people''s __31__ of themselves. The six assistants were generally in agreement with one another about how the people they were observing acted. Further, participants'' ratings of their own behaviors agreed with observers'' for how outgoing and how conscientious they were being. But the agreement between participants and outside observers was much smaller for agreeableness. Some of this __32__ could be because the observers used only audio clips, and thus could not read __33__ like body language, but there are __34__ other explanations, as people should be able to hear when a participant is being kind versus being rude. The weak agreement between how participants thought they were acting and what observers heard could be because people would rather __35__ rude behavior.', NULL, '["A) activated","B) articulates","C) assessment","D) consecutive","E) cues","F) deny","G) discrepancy","H) probably","I) probes","J) random","K) recall","L) relatively","M) saturated","N) symptoms","O) terminate"]', 279, 'IMPORT', 'cet6-2023-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-3-r1'
);
SET @pg_cet6_2023_06_3_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-3-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-r2', 'MATCHING', 'CET6', 'Why we need tiny colleges', 'A) We''re experiencing the rebirth of smallness. Farmers markets, tiny homes, and brew pubs all exemplify our love of smallness. So do charter schools, coffee shops, and local bookstores. Small is often (but not always) more affordable, healthier, and sustainable, but its finest characteristic, the one that turns charm into love, is that going small allows us to be more fully who we are. B) In higher education the trend is mostly in the opposite direction: Universities with 20,000 or 30,000 students are considered "mid-sized". The nation''s largest university, Arizona State University, has 80,000 students on campus and aims to enroll another 100,000 students online. At the other end of the spectrum is a handful of colleges that have fewer than a hundred students on campus and no online courses: colleges such as Sterling College, Thomas More College of Liberal Arts, and Deep Springs College. These colleges are so small that they can only be called "tiny." C) Tiny colleges focus not just on a young person''s intellect, but on the young person as a whole. Equally important, tiny colleges ask, "How can education contribute to human flourishing and the well-being of the world?" And they shape a college experience to address that question. They replace concerns about institutional growth with attention to the growth of students as fully developed participants in their communities. D) I''ve had the privilege of teaching at three different institutions of higher learning during my career—a small liberal arts college and two mid-sized public universities. I''ve also been profoundly disappointed in each of these institutions, and in many of my colleagues, especially when it comes to helping students and preparing them for the many responsibilities of adulthood. Administrators focus on the business of running a university, and most faculty focus on their scholarship and teaching their discipline. Little deliberate attention is given to how students mature as individuals and social beings. E) Having just retired from teaching at a public university, I''m now returning to my hometown of Flagstaff, Arizona, to establish a tiny college—Flagstaff College. I''m convinced there''s a need for another type of education, one devoted to helping students come into their own and into this beautiful and troubled world. Young people need an education that will provide them with meaning, hope, courage, and passion, as well as information and skills. Large institutions, I believe, are particularly ill-suited to this type of education. F) There''s no "best of" list when it comes to tiny colleges, at least not yet. But around the country people are creating new colleges that provide an alternative to small liberal arts colleges, large public universities, and online education. G) With only 26 students, Deep Springs is the smallest college in the country and, quite likely, the most atypical(非典型的). Located on a working cattle ranch on the California-Nevada border, Deep Springs is a private, residential, two-year college for men, committed to educating students for "a life of service to humanity." Founded by the electricity tycoon(大亨) L.L. Nunn in 1917, Deep Springs "curriculum" revolves around academics, labor, and self-governance. In addition to their courses, students are charged with running the 155-acre ranch and overseeing the functioning of the college. Students chair both the admissions and the curriculum committees. H) "Living in close community with one''s teachers and fellow students, and being forced to take on adult responsibilities, makes for one''s growth as a person," says William Hunt, who graduated last year. "To exist for very long in a community like that, you have to get over the question of whether you''re sufficiently talented or principled and get started worrying about how you can stretch yourself and your peers, how much you can manage to learn with them." I) Sterling College, in Craftsbury Common, Vermont, is also very small—fewer than 100 students. Unlike Deep Springs, Sterling focuses its curriculum on environmental and social justice issues, but like Deep Springs it places a high value on personal responsibility and manual labor. According to its catalog, a college education at Sterling combines "rigorous academics, roll-up-your-sleeves challenges, and good old hard work." J) The average tuition at a small liberal-arts college is $30,000 to $40,000 a year, not including the cost of living on campus, as compared to $8,000 to $10,000 a year for tuition alone at a public university. Of the tiny colleges, only Deep Springs doesn''t charge tuition or room and board; students pay only for books and the cost of traveling to and from college. If tiny schools are to become a player on the higher education scene, they will need to find a way to be truly affordable. K) Doing so may not be that difficult so long as they do not pattern themselves too closely on existing norms. We''ve come to believe that a good college should have many academic programs and excellent facilities, posh(豪华的) dorms, an array of athletic programs, and a world-class student activity center. Imagine a good college without a climbing wall! We also have accepted the idea that college presidents, and their many vice- presidents, should be paid like their counterparts in the business world and that higher education requires an elaborate, up-to-date technology infrastructure. All of this drives up the cost of education. L) The "trick" to making tiny colleges affordable, if that''s the right word, is simplicity. At its core, education is a human-to-human interaction. Reflecting on his own college education, President Garfield once commented that an ideal college would consist of nothing more than the legendary teacher Mark Hopkins on one end of a log and a student on the other. The economics of a tiny college, in other words, might be similar to that of a tiny house. Because it is small, a tiny house costs less to build and less to furnish, insure, and maintain. But the economic benefits of a small house don''t end there. Tiny homes discourage homeowners from buying stuff that they really don''t need, because there''s no place to put it. M) I''m a late convert to the idea of tiny colleges, and I fully understand the need for many diverse types of educational institutions. Academic research and job training are important, but tiny colleges aren''t suited for either. The educational needs of a complex society are themselves complex, and no single model can meet all of these needs. But I''m now convinced there''s an educational need that''s now going almost completely unmet: namely, the need to help young people transition into adulthood. Tiny colleges can do this better than any other type of educational institution. N) The ultimate justification for a tiny college is the conviction that each of us comes into our full humanity by close interaction with those who know and care for us, and that one of the basic purposes of higher education is social. Although we give lip service to the idea that a college education will make us better people, when all''s said and done, we think of higher education primarily in economic terms. We''ve come to think of higher education as a means to make a living rather than make a life. We''ve also come to see higher education as a private good rather than a public one. Tiny colleges are not the answer to all of our educational requirements, but they''re an answer to one of our most basic educational necessities; the need to produce thoughtful, engaged, and compassionate human beings.', NULL, NULL, 1233, 'IMPORT', 'cet6-2023-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-3-r2'
);
SET @pg_cet6_2023_06_3_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-3-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-r3', 'CAREFUL_READING', 'CET6', NULL, 'If you''re someone who has turned to snacking on junk food more in the pandemic(大流行病), you''re not alone. Investigative reporter Michael Moss says processed food is engineered to hook you, not unlike alcohol, cigarettes, or other harmful substances. His 2013 book, Salt Sugar Fat, explored food companies'' aggressive marketing of those products and their impact on our health. In his new book, Hooked, Moss updates the food giants'' efforts to keep us eating what they serve, and how they''re responding to complaints from consumers and health advocates. Processed food is inexpensive, it''s legal, and it''s everywhere. Companies'' advertising is cueing us to remember those products and we want those products constantly. So the food environment is one of those key things that makes food even more problematic for so many people. Memory, nostalgia(怀旧) in particular, plays a big role in the foods we crave. Soda companies discovered that if they put a soda in the hands of a child when they''re at a ball game with their parents, that soda will forever be associated with that joyous moment. Later in life, when that child wants to experience a joyous moment, they''re going to think of soda. Many people seek comfort in the snacks they remember from childhood. Moss examines the way companies capitalize on our memories, cravings and brain chemistry to keep us snacking. One of the reasons I came to think that some of these food products are even more powerful, more troublesome than drugs can be is memory. What we eat is all about memory. And we begin forming memories for food at a really early age. And we keep those memories for a lifetime. Knowing this, the food industry spends lots of time trying to shape the memories that we have for their products. One of the features of addiction that scientists studying drug addiction discovered back in the 1990s was that the faster a substance hits the brain, the more apt we are as a result to act impulsively. There''s nothing faster than food in its ability to hit the brain. For Moss, this puts the notion of "fast food" in an entirely new light as this isn''t limited to fast food chains-almost 90% of food products in grocery stores are processed foods. Everything in the industry is about speed, from manufacturing to packaging. Overall, Moss outlines the industry''s dependence on making their products inexpensive, super delicious, and incredibly convenient for consumers. Now that more and more people care about what they put in their bodies and are wanting to eat healthier, these companies are finding it really difficult to meet that new demand because of their own addiction to making these convenience foods.', NULL, NULL, 448, 'IMPORT', 'cet6-2023-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-3-r3'
);
SET @pg_cet6_2023_06_3_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-3-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-r4', 'CAREFUL_READING', 'CET6', NULL, 'Chimpanzees(黑猩猩), human beings'' closest animal relatives, share up to 98% of our genes. Yet humans and chimpanzees lead very different lives. Fewer than 300,000 wild chimpanzees live in a few forested corners of Africa today, while humans have colonized every corner of the globe. At more than 7 billion, human population dwarfs that of nearly all other mammals—despite our physical weaknesses. What could account for our species'' incredible evolutionary successes? One obvious answer is our big brains. It could be that our raw intelligence gave us an unprecedented ability to think outside the box, innovating solutions to thorny problems as people migrated across the globe. But a growing number of cognitive scientists and anthropologists(人类学家) are rejecting that explanation. They think that, rather than making our living as innovators, we survive and thrive precisely because we don''t think for ourselves. Instead, people cope with challenging climates and ecological contexts by carefully copying others. In a famous study, psychologists Victoria Horner and Andrew Whiten showed two groups of test subjects— children and chimpanzees—a mechanical box with a treat inside. In one condition, the box was opaque, while in the other it was transparent. The experimenters demonstrated how to open the box to retrieve the treat, but they also included the irrelevant step of tapping on the box with a stick. Oddly, the children carefully copied all the steps to open the box, even when they could see that the stick had no practical effect. That is, they copied irrationally: Instead of doing only what was necessary to get their reward, children slavishly imitated every action they''d witnessed. Of course, that study only included three—and four-year-olds. But additional research has shown that older children and adults are even more likely to mindlessly copy others'' actions, and infants are less likely to over- imitate—that is, to precisely copy even impractical actions. By contrast, chimpanzees in the study only over-imitated in the opaque condition. In the transparent condition—where they saw that the stick was mechanically useless—they ignored that step entirely. Other research has since supported these findings. When it comes to copying, chimpanzees are more rational than human children or adults. Where does the seemingly irrational human preference for over-imitation come from? Anthropologist Joseph Henrich points out that people around the world rely on technologies that are often so complex that no one can learn them rationally. Instead, people must learn them step by step, trusting in the wisdom of more experienced elders and peers. So the next time you hear someone arguing passionately that everyone should embrace nonconformity and avoid imitating others, you might laugh a little bit. We''re not chimpanzees, after all.', NULL, NULL, 439, 'IMPORT', 'cet6-2023-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-3-r4'
);
SET @pg_cet6_2023_06_3_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet6-2023-06-3-r4' LIMIT 1);

-- 翻译 cet6-2023-06-3
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-translation', 3, 'CET6', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-translation'
);
SET @q_cet6_2023_06_3_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_01, '近年来,中国城市加快发展,城市人居环境得到显著改善。许多城市努力探索中国特色的城市高质量发展之路,城市功能不断完善,治理水平明显提高。中国持续开展城市生态修复和功能修补,全面实施城镇老旧小区改造,大力推进城市园林绿化,消除污染 ;同时大力推进城市基础设施体系化建设,开展房屋建筑和市政设施普查以及安全隐患排查整治,努力为市民创造高品质的生活环境,让城市更美丽、更安全、更宜居。', NULL, 'In recent years, Chinese cities have accelerated their development, and the urban living environment has improved significantly. Many cities strive to explore a path of high-quality urban development with Chinese characteristics, with urban functions being steadily improved and governance markedly enhanced. China has been carrying out a series of efforts, including the ecological restoration and functional improvement of cities, the comprehensive renovation of old urban residential communities, the vigorous promotion of urban landscaping and afforestation, and the elimination of pollution. At the same time, it vigorously advances the systematic construction of urban infrastructure and conducts surveys of housing and municipal facilities as well as the investigation and rectification of potential safety hazards, striving to create a high-quality living environment for citizens and to make cities more beautiful, safer and more livable.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_01
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q26', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q26'
);
SET @q_cet6_2023_06_3_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_02, NULL, '{"A":"A) activated","B":"B) articulates","C":"C) assessment","D":"D) consecutive","E":"E) cues","F":"F) deny","G":"G) discrepancy","H":"H) probably","I":"I) probes","J":"J) random","K":"K) recall","L":"L) relatively","M":"M) saturated","N":"N) symptoms","O":"O) terminate"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_02
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q27', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q27'
);
SET @q_cet6_2023_06_3_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_03, NULL, '{"A":"A) activated","B":"B) articulates","C":"C) assessment","D":"D) consecutive","E":"E) cues","F":"F) deny","G":"G) discrepancy","H":"H) probably","I":"I) probes","J":"J) random","K":"K) recall","L":"L) relatively","M":"M) saturated","N":"N) symptoms","O":"O) terminate"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_03
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q28', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q28'
);
SET @q_cet6_2023_06_3_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_04, NULL, '{"A":"A) activated","B":"B) articulates","C":"C) assessment","D":"D) consecutive","E":"E) cues","F":"F) deny","G":"G) discrepancy","H":"H) probably","I":"I) probes","J":"J) random","K":"K) recall","L":"L) relatively","M":"M) saturated","N":"N) symptoms","O":"O) terminate"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_04
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q29', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q29'
);
SET @q_cet6_2023_06_3_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_05, NULL, '{"A":"A) activated","B":"B) articulates","C":"C) assessment","D":"D) consecutive","E":"E) cues","F":"F) deny","G":"G) discrepancy","H":"H) probably","I":"I) probes","J":"J) random","K":"K) recall","L":"L) relatively","M":"M) saturated","N":"N) symptoms","O":"O) terminate"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_05
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q30', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q30'
);
SET @q_cet6_2023_06_3_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_06, NULL, '{"A":"A) activated","B":"B) articulates","C":"C) assessment","D":"D) consecutive","E":"E) cues","F":"F) deny","G":"G) discrepancy","H":"H) probably","I":"I) probes","J":"J) random","K":"K) recall","L":"L) relatively","M":"M) saturated","N":"N) symptoms","O":"O) terminate"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_06
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q31', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q31'
);
SET @q_cet6_2023_06_3_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_07, NULL, '{"A":"A) activated","B":"B) articulates","C":"C) assessment","D":"D) consecutive","E":"E) cues","F":"F) deny","G":"G) discrepancy","H":"H) probably","I":"I) probes","J":"J) random","K":"K) recall","L":"L) relatively","M":"M) saturated","N":"N) symptoms","O":"O) terminate"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_07
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q32', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q32'
);
SET @q_cet6_2023_06_3_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_08, NULL, '{"A":"A) activated","B":"B) articulates","C":"C) assessment","D":"D) consecutive","E":"E) cues","F":"F) deny","G":"G) discrepancy","H":"H) probably","I":"I) probes","J":"J) random","K":"K) recall","L":"L) relatively","M":"M) saturated","N":"N) symptoms","O":"O) terminate"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_08
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q33', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q33'
);
SET @q_cet6_2023_06_3_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_09, NULL, '{"A":"A) activated","B":"B) articulates","C":"C) assessment","D":"D) consecutive","E":"E) cues","F":"F) deny","G":"G) discrepancy","H":"H) probably","I":"I) probes","J":"J) random","K":"K) recall","L":"L) relatively","M":"M) saturated","N":"N) symptoms","O":"O) terminate"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_09
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q34', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q34'
);
SET @q_cet6_2023_06_3_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_10, NULL, '{"A":"A) activated","B":"B) articulates","C":"C) assessment","D":"D) consecutive","E":"E) cues","F":"F) deny","G":"G) discrepancy","H":"H) probably","I":"I) probes","J":"J) random","K":"K) recall","L":"L) relatively","M":"M) saturated","N":"N) symptoms","O":"O) terminate"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_10
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q35', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q35'
);
SET @q_cet6_2023_06_3_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_11, NULL, '{"A":"A) activated","B":"B) articulates","C":"C) assessment","D":"D) consecutive","E":"E) cues","F":"F) deny","G":"G) discrepancy","H":"H) probably","I":"I) probes","J":"J) random","K":"K) recall","L":"L) relatively","M":"M) saturated","N":"N) symptoms","O":"O) terminate"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_11
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q36', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q36'
);
SET @q_cet6_2023_06_3_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_12, 'One tiny American college situated on a cattle farm is devoted to educating students to serve mankind throughout their lives.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_12
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q37', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q37'
);
SET @q_cet6_2023_06_3_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_13, 'Much to the author''s disappointment, the three institutions of higher learning where she taught largely ignore students'' growth as social beings.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_13
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q38', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q38'
);
SET @q_cet6_2023_06_3_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_14, 'Tiny colleges must be made affordable in order to play a role in higher education.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_14
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q39', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q39'
);
SET @q_cet6_2023_06_3_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_15, 'According to a recent graduate from a tiny college, living together with faculty and fellow students is conducive to a student''s growth as a person.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_15
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q40', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q40'
);
SET @q_cet6_2023_06_3_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_16, 'Rather than going small, most American universities are trying to go big.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_16
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q41', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q41'
);
SET @q_cet6_2023_06_3_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_17, 'In a certain tiny college, rigorous academic work and traditional manual labor are integrated.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_17
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q42', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q42'
);
SET @q_cet6_2023_06_3_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_18, 'Tiny colleges focus on educating students to become well-rounded citizens instead of seeking their own expansion.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_18
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q43', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q43'
);
SET @q_cet6_2023_06_3_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_19, 'The essence of education lies in the interaction between people.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_19
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q44', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q44'
);
SET @q_cet6_2023_06_3_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_20, 'After her retirement, the author has decided to set up a tiny college in her hometown.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_20
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q45', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q45'
);
SET @q_cet6_2023_06_3_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_21, 'Tiny colleges are justified as it is believed that our growth into full humanity comes through interaction with people near and dear to us.', NULL, 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_21
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q46', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q46'
);
SET @q_cet6_2023_06_3_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_22, 'In what way does Michael Moss think processed food is comparable to alcohol and cigarettes?', '{"A":"A) They are all addictive.","B":"B) They are all necessary evils.","C":"C) They are all engineered to be enjoyed.","D":"D) They are all in increasingly great demand."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_22
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q47', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q47'
);
SET @q_cet6_2023_06_3_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_23, 'What does the author say plays a key role in the foods we crave?', '{"A":"A) The food environment.","B":"B) Aggressive marketing.","C":"C) Convenience.","D":"D) Memory."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_23
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q48', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q48'
);
SET @q_cet6_2023_06_3_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_24, 'What do food companies do to capitalize on consumers'' association with their food products?', '{"A":"A) They strive to influence how consumers remember their products.","B":"B) They attempt to use consumers'' long-term memories to promote addiction.","C":"C) They try to exploit consumers'' memories for their products as early as possible.","D":"D) They endeavor to find what consumers remember about their products."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_24
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q49', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q49'
);
SET @q_cet6_2023_06_3_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_25, 'How does the food industry operate from manufacturing to packaging, according to Moss?', '{"A":"A) Placing the idea of fast food in an entirely new light.","B":"B) Setting no limit to the number of fast food chains.","C":"C) Focusing on how quickly the work is done.","D":"D) Prioritizing the quality of their products."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_25
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q50', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q50'
);
SET @q_cet6_2023_06_3_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_26, 'Why are companies finding it difficult to satisfy consumers'' demand for healthier food products?', '{"A":"A) They think speed of production outweighs consumers'' health.","B":"B) They believe their industry would perish without fast foods.","C":"C) They have to strike a balance between taste and nutrition.","D":"D) They are hooked on manufacturing convenience foods."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_26
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q51', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q51'
);
SET @q_cet6_2023_06_3_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_27, 'What might explain humans'' having the largest population of almost all mammals?', '{"A":"A) They are equipped with raw strength for solving the most challenging problems.","B":"B) They cope with the outside world more effectively than their animal relatives.","C":"C) They possess the most outstanding ability to think.","D":"D) They know how to survive everywhere on earth."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_27
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q52', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q52'
);
SET @q_cet6_2023_06_3_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_28, 'What accounts for humans'' evolutionary successes according to a growing number of cognitive scientists and anthropologists?', '{"A":"A) They are better at innovating solutions.","B":"B) They thrive through creative strategies.","C":"C) They are naturally adaptive to ecological contexts.","D":"D) They meet challenges by imitating others carefully."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_28
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q53', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q53'
);
SET @q_cet6_2023_06_3_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_29, 'What does the author think is odd about the findings of the study by Victoria Horner and Andrew Whiten?', '{"A":"A) Children irrationally imitated every action of the experimenters.","B":"B) Chimpanzees could tell the transparent box from the opaque one.","C":"C) Chimpanzees could retrieve the treat more quickly than children did.","D":"D) Children omitted the step of tapping on the box with a stick to open it."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_29
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q54', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q54'
);
SET @q_cet6_2023_06_3_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_30, 'What is anthropologist Joseph Henrich''s explanation for the human preference for copying?', '{"A":"A) It originates in the rationality of people around the world.","B":"B) It stems from the way people learn complex technologies.","C":"C) It results from people distrusting their own wisdom.","D":"D) It derives from the desire to acquire knowledge step by step."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_30
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet6-2023-06-3-q55', 7, 'CET6', 3, 'CHOICE', NULL, @pg_cet6_2023_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet6-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q55'
);
SET @q_cet6_2023_06_3_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet6-2023-06-3-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet6_2023_06_3_31, 'What point does the author want to emphasize when he says "We''re not chimpanzees"?', '{"A":"A) It is arguable whether everyone should avoid imitation.","B":"B) It is characteristic of human beings to copy others.","C":"C) It is desirable to trust in more knowledgeable peers.","D":"D) It is naive to laugh at someone embracing nonconformity."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet6_2023_06_3_31
);

COMMIT;
