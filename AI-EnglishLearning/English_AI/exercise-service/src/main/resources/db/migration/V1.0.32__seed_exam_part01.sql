-- 由 scripts/import-exam.mjs 自动生成，请勿手工修改。
-- 版本: V1.0.32
-- 生成时间: 2026-11-09T14:51:12.461Z
-- 目标库: exercise_db
-- 执行前必须按 docs/数据库迁移规范.md 预览、备份、审批。
-- 范围：正常套 + 仅借听力套（残卷留后）；听力无音频不写 listening_audio。

START TRANSACTION;

-- ==================== cet4-2022-06-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-r1', 'BANKED_CLOZE', 'CET4', NULL, 'You might think of your teeth as tools, like built-in knives and forks, but if they are mere tools, why do they feel pain and wouldn''t it be better if they could just __26__ under any condition? In spite of our __27__ discomfort, it turns out there''s a good reason our teeth are so sensitive. Tooth pain is a __28__ mechanism that ensures when a tooth is being damaged we''ll notice and do something about it. If we eat something too hot or too cold, or if the tooth is worn down enough where the tissue __29__ is exposed, all of those things cause pain, and then the pain causes the person not to use that tooth to try to protect it a little bit more. So it''s really a protective mechanism more than anything else. If teeth didn''t feel pain, we might __30__ to use them in situations that damage them, and for humans, damaging __31__ teeth is a problem because, unlike crocodiles, we can''t __32__ them. Teeth have three layers, only one of which—the innermost layer of the tooth—can hurt, as that layer of the tooth __33__ both blood vessels and nerves. Pain is the only feeling to which the nerves in that layer respond. Whereas people with tooth sensitivity may complain, for example, of tooth pain __34__ by heat or cold, the nerves in the inner layer don''t sense temperature. Rather, they feel pain, which may be __35__ with, say, drinking something very cold.', NULL, '["A) adult","B) associated","C) chew","D) contains","E) continue","F) defense","G) dental","H) downward","I) emotional","J) implies","K) mammal","L) replace","M) swallow","N) triggered","O) underneath"]', 247, 'IMPORT', 'cet4-2022-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-06-1-r1'
);
SET @pg_cet4_2022_06_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-06-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-r2', 'MATCHING', 'CET4', 'How to determine if a company is a good fit for you', 'A) On paper, the job seemed perfect for me: The position was completely in line with my degree, the duties and responsibilities were compatible with my interests, and the office maintained a well-stocked kitchen that would satisfy my every snack desire. B) Sounds like my dream job, right? There was only one small problem: I simply didn''t get along with the company culture. They favored a more rigid, closed-door, corporate atmosphere, while I would have preferred something more collaborative and open. They were complete clock watchers, while I would have liked a more flexible schedule. To put it plainly, we just weren''t on the same page. C) When it comes to looking for a new job, you already know that a big part of the interview process involves the company evaluating whether or not you''re a good fit for their open role. But, it''s important to keep in mind that the employer isn''t the only one who needs to identify a good match—you should be looking for that same exact thing. Company culture can have a big impact on how you feel about your work, so you want to make sure you sign an offer letter with an organization you''re truly excited about. D) However, figuring out what a company is like before you actually work there can be a bit of a challenge. Luckily, there are a few things you can do to determine whether or not a company is a good fit for you— before you ever sign your name on that dotted line. E) First of all, know what you want. It''s hard to make any decisions when you don''t really know what you''re looking for. So before you can determine whether you and a specific company would be compatible together, it''s important to have a solid handle on what exactly you want from your employer. Many of us have an easier time identifying the things that we absolutely don''t want. If those are the only things you can think of, don''t worry! That''s still a good place to start. F) Start by writing down the things you didn''t like about previous employers, as well as the parts you really valued. There''s no wrong answer here—so from big things to small details, write them all down on your list. This will help you immediately identify what you''re looking for in an organization, as well as the things you''re trying to stay far, far away from. G) Make sure to do your research. Now comes the part when you put on your detective hat and do a little digging. The Internet will be your best friend when you''re trying to familiarize yourself with a company''s culture before ever walking through their office doors. And where exactly should you look for these culture clues? Start with the most obvious place first: the company''s website. Read through their copy and blog. Do they use formal, direct language? Or is it casual, conversational, and maybe even a little humorous? This can be a big indicator of what sort of atmosphere the company is trying to cultivate. H) Next, turn your attention toward their social media outlets. Are they sharing photos of their team''s Thursday afternoon barbeque or Halloween costume contest? Or are their social media accounts strictly reserved for company-related announcements and product launches? I) An industry review website like Glassdoor is another spot to check in order to find some insider information about what you can expect about a company. However, remember to take the reviews you read with a grain of salt—many of them are written by scorned(被鄙视的) employees. J) Finally, you can never fail with personal connections. Send a quick message to a current or previous company employee on LinkedIn or by email and ask if they would be willing to have a quick conversation with you about the organization in general. If you get a yes to your request for a chat, you''ll be armed with some pretty powerful and helpful information heading into your interview! K) Learn more by asking questions. You know that part at the end of a job interview when the hiring manager asks if you have any questions, and you just stare across the table blankly with your mouth hanging open? That''s the perfect opportunity to speak up and get your burning company culture questions answered! So yes, you can definitely ask your interviewer about what it''s like to work for that particular organization. Simple questions like, "What three words would you use to describe the culture here?" or "What''s your favorite part about working for this company?" can reveal a lot about what it''s really like behind closed doors. L) Prioritize your values. What does my dream company culture look like? Well, I could come and go as I please, as long as I was getting the work done. My boss would genuinely listen to and value all of my ideas and suggestions. My co-workers would all be friendly with one another, without ever falling into the office gossip trap. The kitchen would have endless options of pizza and cookies. Oh, and they''d give me two months of paid vacation with a very generous salary. M) What are my chances of finding all of those things with one employer? Slim to none—believe me, I''ve looked. This is why it''s so important to know which aspects of a company''s culture you value most. Is it an open communication style or a flexible schedule? Focus on the top spots on your priority list, and ensure a potential employer at least checks those boxes. Unfortunately, this is reality, you can''t have everything you want but a few are certainly achievable. N) When you''re hunting for a new job, you already know that the employer is trying to decide whether or not you''re a good fit for the position. But you should also look at the process through a similar lens. You may not be the one conducting the actual interview, but you''re still trying to determine whether or not the company is a good fit for you. O) Keep these tips in mind to figure out whether you and a potential employer are a perfect match or just a recipe(方案) for disaster. After all, it''s a good thing to know before actually accepting an offer.', NULL, NULL, 1051, 'IMPORT', 'cet4-2022-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-06-1-r2'
);
SET @pg_cet4_2022_06_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-06-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-r3', 'CAREFUL_READING', 'CET4', NULL, 'Online classes began to be popularized just a few decades ago. They are advertised as a way for adults to finish their education and students to learn the material at their own pace—it is far more compatible for people with busy schedules. But after being enrolled in an online course last fall semester, I came to realize online classes were merely a means to fulfil course requirements. First of all, students lack the desire to learn, and they simply complete their assignments to receive credit for a passing grade rather than genuinely engage with the course material. As online courses tend to have more than 100 students, most of the assignments are short and simple. They are not designed for students to interact with the material in depth but designed to be graded easily to accommodate such a large number of students. Perhaps the biggest disadvantage of taking an online class is the absence of face-to-face interaction between the teacher and their students. Live sessions are infrequent and are often scheduled during the middle of the day when students have to attend other classes or work. The office hours of the professor may also be during inconvenient times for many students as well. Most interaction with the professor has to be through email which is often impersonal. It is nearly impossible for students to build a relationship with their professor. There is also little interaction amongst students. It can be harder for students to create study groups and form relationships with their peers. Online classes also require either a computer or laptop and a reliable internet connection. Not all students have access to these types of resources, whether it is for financial or other reasons, and some students can be put at a disadvantage. Offering online classes certainly helps students who would otherwise not be able to attend classroom sessions. However, they fail to provide a genuine education with an emphasis on convenience rather than critical thinking. We need restructured online classes in which students can have a learning experience that will actually provide quality education.', NULL, NULL, 346, 'IMPORT', 'cet4-2022-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-06-1-r3'
);
SET @pg_cet4_2022_06_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-06-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-r4', 'CAREFUL_READING', 'CET4', NULL, 'In the age of the internet, there''s no such thing as a private debate. But is that bad for science? Some scientists have had concerns. When debates in any sector move beyond the halls of universities and government agencies, there''s potential for information to be used incorrectly, leading to public confusion; yet, open debate can also promote communication between the scientific community and the public. Recent open debates on scientific research, health, and policy have aroused greater public attention and encouraged more diverse voices. If this trend spurs scientists to agree more quickly about the best solutions to our problems—and at the same time helps the public observe the process of scientific discourse more clearly—then this is good for everyone, including scientists. A recent debate published in The New York Times discussed the question of how quickly medicine should be developed and produced. Issues such as safety of the product and perception of the public were examined and considered. But some experts worried that such public speculation might lead people to believe that disagreement about the details meant a lack of adequate scientific consensus over the safety and efficiency of modern-day medicine. The anxiety seems misplaced. Gone are the days of going to a conference and debating scientific issues, and that''s good because those gatherings were not diverse enough and excluded many important voices. These days, the public can access debates about science regardless of where they take place. For many scientists, public debate is a new frontier and it may feel like a place with few restraints or rules. But rather than avoiding such conversations, let the debates be transparent and vigorous, wherever they are held. If the public is to understand that science is an honorably self-correcting process, the idea that science is a fixed set of facts in a textbook needs to be dismissed. With the validity of science coming under attack, there''s a need for scientific debates to be perceived as open and true to life. Let everyone see the noisy, messy deliberations that advance science and lead to decisions that benefit us all.', NULL, NULL, 348, 'IMPORT', 'cet4-2022-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-06-1-r4'
);
SET @pg_cet4_2022_06_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-06-1-r4' LIMIT 1);

-- 翻译 cet4-2022-06-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-translation'
);
SET @q_cet4_2022_06_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_01, '从前有个农夫嫌他种的禾苗长得慢，就到地里把禾苗一株株地拔高了一点。回家后他对家人说："今天可真把我累坏了！但我总算让禾苗一下子长高了。"他儿子到地里去一看，禾苗都已死光了。 现在有些家长急于让孩子成功，往往步那个农夫的后尘，搞得孩子苦不堪言，却不见孩子学业长进。这样的家长是否该对这个问题有所醒悟，让孩子自然成长呢？', NULL, 'Once upon a time, a farmer, thinking that the rice seedlings he had planted were growing too slowly, went into the field and pulled them up one by one to make each a little taller. After returning home, he told his family, "I''m really worn out today, but I have finally made the rice seedlings grow taller all at once!" When his son went to the field, he found that all the rice seedlings had already withered. Nowadays, some parents, eager to see their children succeed, often follow in the farmer''s footsteps, causing their children great suffering, yet seeing no progress in their studies. Shouldn''t such parents wake up to this problem and let their children grow naturally?', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_01
);

-- 听力 Q1 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q01', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q01'
);
SET @q_cet4_2022_06_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_02, NULL, '{"A":"A) It studied the effects of exercise on sleep.","B":"B) Its participants came from various walks of life.","C":"C) Its findings confirmed those of previous studies.","D":"D) It ran for as long as some thirty years."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_02
);

-- 听力 Q2 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q02', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q02'
);
SET @q_cet4_2022_06_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_03, NULL, '{"A":"A) Eating more vegetables instead of meats.","B":"B) Drinking water instead of beverages with added sugar.","C":"C) Consuming more energy drinks and sports drinks.","D":"D) Forming the habit of exercising regularly."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_03
);

-- 听力 Q3 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q03', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q03'
);
SET @q_cet4_2022_06_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_04, NULL, '{"A":"A) He asked them about his lost paintings.","B":"B) He knew the owner of two missing paintings.","C":"C) He left his paintings at a highway rest stop.","D":"D) He found two 17th-century oil paintings."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_04
);

-- 听力 Q4 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q04', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q04'
);
SET @q_cet4_2022_06_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_05, NULL, '{"A":"A) They are imitations.","B":"B) They are originals.","C":"C) They were stolen by an Italian boy.","D":"D) They came from the same artist."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_05
);

-- 听力 Q5 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q05', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q05'
);
SET @q_cet4_2022_06_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_06, NULL, '{"A":"A) Look after her grandfather.","B":"B) Leave the remote cold region.","C":"C) Save her sick grandmother.","D":"D) Flee from the threat of bears."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_06
);

-- 听力 Q6 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q06', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q06'
);
SET @q_cet4_2022_06_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_07, NULL, '{"A":"A) She has to face a criminal charge.","B":"B) She was found lying motionless in the snow.","C":"C) She searched for her daughter in freezing cold.","D":"D) She works in childcare services."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_07
);

-- 听力 Q7 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q07', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q07'
);
SET @q_cet4_2022_06_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_08, NULL, '{"A":"A) She was found in a forest after three days.","B":"B) She lay totally unconscious for three days.","C":"C) She suffered from the effects of severe cold.","D":"D) She was finally rescued by her relatives."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q08', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q08'
);
SET @q_cet4_2022_06_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_09, NULL, '{"A":"A) She shows a real passion for taking photos.","B":"B) She has just returned from her hometown.","C":"C) She comes from the city of Cape Town.","D":"D) She has a truly amazing appearance."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_09
);

-- 听力 Q9 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q09', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q09'
);
SET @q_cet4_2022_06_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_10, NULL, '{"A":"A) It is as famous as Cape Town.","B":"B) It has a flat surface at the top.","C":"C) It is green and free from pollution.","D":"D) It was named by European settlers."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_10
);

-- 听力 Q10 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q10', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q10'
);
SET @q_cet4_2022_06_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_11, NULL, '{"A":"A) She has British ancestors.","B":"B) She is of mixed blood.","C":"C) She grew up in India.","D":"D) She speaks several languages."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_11
);

-- 听力 Q11 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q11', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q11'
);
SET @q_cet4_2022_06_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_12, NULL, '{"A":"A) It is an extremely violent sport.","B":"B) It is becoming a national sport.","C":"C) It is originated in New Zealand.","D":"D) It is more popular than football."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_12
);

-- 听力 Q12 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q12', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q12'
);
SET @q_cet4_2022_06_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_13, NULL, '{"A":"A) Prepare a study guide.","B":"B) Consult his advisors.","C":"C) Go over his notes regularly.","D":"D) Take stress-relief sessions."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_13
);

-- 听力 Q13 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q13', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q13'
);
SET @q_cet4_2022_06_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_14, NULL, '{"A":"A) His worksheets are terribly messy.","B":"B) He finds the workload too heavy.","C":"C) His study folder is badly disorganized.","D":"D) He has difficulty taking notes quickly."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_14
);

-- 听力 Q14 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q14', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q14'
);
SET @q_cet4_2022_06_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_15, NULL, '{"A":"A) A visual learner.","B":"B) An emotional learner.","C":"C) An organized learner.","D":"D) A logical learner."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_15
);

-- 听力 Q15 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q15', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q15'
);
SET @q_cet4_2022_06_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_16, NULL, '{"A":"A) Arrange them using color and pictures.","B":"B) Restructure them in a logical way.","C":"C) Commit them to memory after class.","D":"D) Organize them into a well-connected story."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_16
);

-- 听力 Q16 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q16', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q16'
);
SET @q_cet4_2022_06_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_17, NULL, '{"A":"A) It is mainly based on a society''s religion.","B":"B) It is interpreted differently in different times.","C":"C) It is a code of conduct based on laws and ethics.","D":"D) It is a moral principle to guide people''s behavior."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_17
);

-- 听力 Q17 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q17', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q17'
);
SET @q_cet4_2022_06_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_18, NULL, '{"A":"A) It may lead to misunderstanding despite good intentions.","B":"B) It assumes that human beings are all good-natured.","C":"C) It may sometimes produce undesirable outcomes.","D":"D) It fails to consider the complexity of human relationships."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_18
);

-- 听力 Q18 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q18', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q18'
);
SET @q_cet4_2022_06_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_19, NULL, '{"A":"A) The golden rule is often in conflict with certain laws and ethical principles.","B":"B) The golden rule must sometimes give way to more important principles.","C":"C) Failure to follow the golden rule may lead to violation of laws and ethics.","D":"D) Observing the golden rule is the first step to becoming a responsible citizen."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_19
);

-- 听力 Q19 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q19', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q19'
);
SET @q_cet4_2022_06_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_20, NULL, '{"A":"A) Many of them find it rather difficult to manage.","B":"B) They have not seen as much diversity as desired.","C":"C) Many of them have an increasingly diversified staff.","D":"D) They have not quite grasped the concept of diversity."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_20
);

-- 听力 Q20 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q20', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q20'
);
SET @q_cet4_2022_06_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_21, NULL, '{"A":"A) Initiatives to achieve diversity in large corporations.","B":"B) Advantages and disadvantages of a diversified team.","C":"C) People''s attitudes towards diversity at the workplace.","D":"D) Innovative ideas and solutions resulting from diversity."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_21
);

-- 听力 Q21 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q21', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q21'
);
SET @q_cet4_2022_06_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_22, NULL, '{"A":"A) People prefer to work with team members similar to themselves.","B":"B) Employers attach great importance to their corporations'' diversity.","C":"C) Employers differ from employees in their perspectives on diversity.","D":"D) Doubts about the practicability of diversity are gradually disappearing."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_22
);

-- 听力 Q22 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q22', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q22'
);
SET @q_cet4_2022_06_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_23, NULL, '{"A":"A) Choosing the best time for signing a business contract.","B":"B) Changing one''s form of communication from time to time.","C":"C) Laying equal stress on written and spoken communication.","D":"D) Using different forms of communication appropriately."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_23
);

-- 听力 Q23 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q23', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q23'
);
SET @q_cet4_2022_06_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_24, NULL, '{"A":"A) They are regarded as seriously binding.","B":"B) They are seldom honored by business partners.","C":"C) They are taken as memos of understanding.","D":"D) They are to be confirmed in written form."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_24
);

-- 听力 Q24 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q24', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q24'
);
SET @q_cet4_2022_06_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_25, NULL, '{"A":"A) It has reached the highest level of evolution.","B":"B) It places a high value on written contracts.","C":"C) It regards written contracts as unalterable.","D":"D) It has seen a decline in verbal agreements."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_25
);

-- 听力 Q25 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q25', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q25'
);
SET @q_cet4_2022_06_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_26, NULL, '{"A":"A) Its details cannot be renegotiated.","B":"B) It has to be carried out to the letter.","C":"C) It strengthens business partnerships.","D":"D) Its terms may not be strictly binding."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q26'
);
SET @q_cet4_2022_06_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_27, NULL, '{"A":"A) adult","B":"B) associated","C":"C) chew","D":"D) contains","E":"E) continue","F":"F) defense","G":"G) dental","H":"H) downward","I":"I) emotional","J":"J) implies","K":"K) mammal","L":"L) replace","M":"M) swallow","N":"N) triggered","O":"O) underneath"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q27'
);
SET @q_cet4_2022_06_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_28, NULL, '{"A":"A) adult","B":"B) associated","C":"C) chew","D":"D) contains","E":"E) continue","F":"F) defense","G":"G) dental","H":"H) downward","I":"I) emotional","J":"J) implies","K":"K) mammal","L":"L) replace","M":"M) swallow","N":"N) triggered","O":"O) underneath"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q28'
);
SET @q_cet4_2022_06_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_29, NULL, '{"A":"A) adult","B":"B) associated","C":"C) chew","D":"D) contains","E":"E) continue","F":"F) defense","G":"G) dental","H":"H) downward","I":"I) emotional","J":"J) implies","K":"K) mammal","L":"L) replace","M":"M) swallow","N":"N) triggered","O":"O) underneath"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q29'
);
SET @q_cet4_2022_06_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_30, NULL, '{"A":"A) adult","B":"B) associated","C":"C) chew","D":"D) contains","E":"E) continue","F":"F) defense","G":"G) dental","H":"H) downward","I":"I) emotional","J":"J) implies","K":"K) mammal","L":"L) replace","M":"M) swallow","N":"N) triggered","O":"O) underneath"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q30'
);
SET @q_cet4_2022_06_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_31, NULL, '{"A":"A) adult","B":"B) associated","C":"C) chew","D":"D) contains","E":"E) continue","F":"F) defense","G":"G) dental","H":"H) downward","I":"I) emotional","J":"J) implies","K":"K) mammal","L":"L) replace","M":"M) swallow","N":"N) triggered","O":"O) underneath"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q31'
);
SET @q_cet4_2022_06_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_32, NULL, '{"A":"A) adult","B":"B) associated","C":"C) chew","D":"D) contains","E":"E) continue","F":"F) defense","G":"G) dental","H":"H) downward","I":"I) emotional","J":"J) implies","K":"K) mammal","L":"L) replace","M":"M) swallow","N":"N) triggered","O":"O) underneath"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q32'
);
SET @q_cet4_2022_06_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_33, NULL, '{"A":"A) adult","B":"B) associated","C":"C) chew","D":"D) contains","E":"E) continue","F":"F) defense","G":"G) dental","H":"H) downward","I":"I) emotional","J":"J) implies","K":"K) mammal","L":"L) replace","M":"M) swallow","N":"N) triggered","O":"O) underneath"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q33'
);
SET @q_cet4_2022_06_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_34, NULL, '{"A":"A) adult","B":"B) associated","C":"C) chew","D":"D) contains","E":"E) continue","F":"F) defense","G":"G) dental","H":"H) downward","I":"I) emotional","J":"J) implies","K":"K) mammal","L":"L) replace","M":"M) swallow","N":"N) triggered","O":"O) underneath"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q34'
);
SET @q_cet4_2022_06_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_35, NULL, '{"A":"A) adult","B":"B) associated","C":"C) chew","D":"D) contains","E":"E) continue","F":"F) defense","G":"G) dental","H":"H) downward","I":"I) emotional","J":"J) implies","K":"K) mammal","L":"L) replace","M":"M) swallow","N":"N) triggered","O":"O) underneath"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q35'
);
SET @q_cet4_2022_06_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_36, NULL, '{"A":"A) adult","B":"B) associated","C":"C) chew","D":"D) contains","E":"E) continue","F":"F) defense","G":"G) dental","H":"H) downward","I":"I) emotional","J":"J) implies","K":"K) mammal","L":"L) replace","M":"M) swallow","N":"N) triggered","O":"O) underneath"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q36'
);
SET @q_cet4_2022_06_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_37, 'Clues about the culture of a company can be found on its website.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q37'
);
SET @q_cet4_2022_06_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_38, 'It can be difficult to know the real situation in a company until you become part of it.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q38'
);
SET @q_cet4_2022_06_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_39, 'It is impossible for a job applicant to have every expectation met.', NULL, 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q39'
);
SET @q_cet4_2022_06_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_40, 'Simply by reading its description, the author found the job offered ideal.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q40'
);
SET @q_cet4_2022_06_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_41, 'Job applicants are advised to make a written list of their likes and dislikes in their previous employment.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q41'
);
SET @q_cet4_2022_06_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_42, 'At the end of an interview, a job applicant should seize the opportunity to get answers to their urgent questions.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q42'
);
SET @q_cet4_2022_06_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_43, 'To begin with, job applicants should be clear what they expect from their future employer.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q43'
);
SET @q_cet4_2022_06_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_44, 'Job applicants should read with a critical eye what is written about a company on the website.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q44'
);
SET @q_cet4_2022_06_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_45, 'Job satisfaction has a lot to do with company culture.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q45'
);
SET @q_cet4_2022_06_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_46, 'A chat with an insider of a company can give job applicants very useful information when they prepare for an interview.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q46'
);
SET @q_cet4_2022_06_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_47, 'What does the author say about students enrolled in online classes?', '{"A":"A) They can access course materials easily.","B":"B) They are unmotivated to learn.","C":"C) They can learn at their own pace.","D":"D) They rarely fulfil the course requirements."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q47'
);
SET @q_cet4_2022_06_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_48, 'What does the author think of online course assignments?', '{"A":"A) They are made convenient to mark.","B":"B) They are meant to facilitate interaction.","C":"C) They are based on easily accessible material.","D":"D) They are given to accommodate students'' needs."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q48'
);
SET @q_cet4_2022_06_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_49, 'What does the author say is one disadvantage of online classes?', '{"A":"A) They are frequently scheduled at irregular times.","B":"B) They make professors'' offices much less accessible.","C":"C) They tend to increase professors'' burden of responding to students'' emails.","D":"D) They provide little chance for students to build relationships with each other"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q49'
);
SET @q_cet4_2022_06_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_50, 'What problem may arise if classes go online?', '{"A":"A) More students may find it easy to be absent from them.","B":"B) Teachers will worry about poor internet connections.","C":"C) Some students may have difficulty attending them.","D":"D) Schools with limited resources will be at a disadvantage."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q50'
);
SET @q_cet4_2022_06_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_51, 'What does the author think constitutes a key part of genuine education?', '{"A":"A) Acquisition of useful knowledge.","B":"B) Training of real-life skills on campus.","C":"C) Development of students'' personalities.","D":"D) Cultivation of analytical thinking ability."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q51'
);
SET @q_cet4_2022_06_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_52, 'What does the author think open debate can do?', '{"A":"A) Help the public to better understand science.","B":"B) Clear up confusion in the scientific community.","C":"C) Settle disputes between universities and government agencies.","D":"D) Prevent information from being used incorrectly by the public."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q52'
);
SET @q_cet4_2022_06_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_53, 'Why did a recent debate published in The New York Times arouse concerns among experts?', '{"A":"A) It might hinder the progress in medical research.","B":"B) It might breed public distrust in modern medicine.","C":"C) It might add to the difficulty of getting research funds.","D":"D) It might prevent medical scientists reaching consensus."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q53'
);
SET @q_cet4_2022_06_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_54, 'Why does the author say some experts'' anxiety seems misplaced?', '{"A":"A) Debating scientific issues at a conference is now old-fashioned.","B":"B) Diverse topics can be debated by both scientists and the public.","C":"C) Debates about science are accessible to the public anyway.","D":"D) Scientists can voice their opinions whatever way they like."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q54'
);
SET @q_cet4_2022_06_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_55, 'What does the author suggest scientists do about public debate?', '{"A":"A) Have more discussions about it.","B":"B) Embrace it with open arms.","C":"C) Formulate new rules for it.","D":"D) Restrain it to a rational degree."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-1-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q55'
);
SET @q_cet4_2022_06_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_1_56, 'What does the author say about science in the last paragraph?', '{"A":"A) It is transmitted through textbooks.","B":"B) It is what proves valid and true to life.","C":"C) It is a dynamic and self-improving process.","D":"D) It is a collection of facts and established rules."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_1_56
);

-- ==================== cet4-2022-06-2 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-r1', 'BANKED_CLOZE', 'CET4', NULL, 'If you''ve ever looked at the ingredients list while grocery shopping, chances are you''ve seen the term "natural flavors". But have you taken a __26__ to consider what these natural flavors actually are? Most of us might think that "natural flavors" are, well, naturally good for us. A recent study in the journal Appetite found that when the word "natural" appears on packaging, people __27__ that the food within is indeed healthier. In truth, natural flavors do not __28__ much, at least chemically speaking, from their flavor- boosting __29__ : artificial flavors. Both can be made in a lab by trained flavorists, but artificial flavors use chemicals to give a product a __30__ smell or taste. Natural flavors come from plant or animal __31__ , like fruit, vegetable, meat, fish or milk that is then processed or refined in some way. In short, natural flavors are __32__ from plants and animals to create specific flavors for processed foods. But that does not __33__ make it easier to tell what is really in your food. Because the Food and Drug Administration (FDA) has not __34__ the term, companies can use it to refer to pretty much anything derived from a plant or animal. And natural flavors can also include a variety of chemical additives, such as preservatives. The FDA doesn''t require companies to reveal what additional chemicals a specific item __35__ . So if you want to know for certain what you''re getting with your groceries, you might want to stick to the farmer''s market.', NULL, '["A) acknowledge","B) chance","C) contains","D) counterparts","E) defined","F) differ","G) especially","H) extracted","I) implies","J) necessarily","K) particular","L) perceive","M) second","N) sources","O) strange"]', 254, 'IMPORT', 'cet4-2022-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-06-2-r1'
);
SET @pg_cet4_2022_06_2_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-06-2-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-r2', 'MATCHING', 'CET4', 'Fake holiday villa websites prompt warning', 'A) During the British winter, the thought of two weeks in a coastal villa(别墅) with soul-stirring views of the sea and a huge pool to enjoy is enough to offset(抵消) the labor until the holidays start. For a growing number of people, however, their yearly break is turning into a nightmare as they find that the property they have paid thousands for does not exist and the website through which they booked it has disappeared. B) Consumers have been warned to be aware of the potential for deception in this market, which is far from uncommon. In 2017 there were 1,632 cases of reported "villa fraud(诈骗)", with victims losing an average of £2,052, according to Action Fraud, the national center for reporting such frauds. "Millions of pounds are lost each year by defrauded holidaymakers," says Sean Tipton of the Association of British Travel Agents (ABTA). C) The problem has ballooned in the last 10 years, with frauds becoming more and more sophisticated. The fake websites have authentic-sounding names involving a mix of keywords, typically including the place name, "summer", "villas" or "rentals". Details of legitimate(合法的) villas are often stolen from other sites. "When the fraudsters first started it was unsophisticated—the websites looked amateur and there wasn''t a lot of effort," says Tipton. "Now they are clever. They extensively rip off legitimate websites and use a different website name. They''ll have pictures of a sales team and it might be a poor actor in New York that is down as their head of sales." D) Fraudsters target popular seaside destinations for British tourists visiting Spain where prices can soar if demand exceeds supply. Prices are kept within reasonable ranges to avoid arousing suspicion. "A villa might cost £5,000 elsewhere and they will offer it at say £3,500. But a bit of a giveaway is that the villa will be cheaper than on other websites and there''s unlimited availability," says Tipton. Fraudsters also invest in pay- per-click advertising to feature at the top of search engines when people type in phrases such as "Spanish seaside villas". E) With such a degree of professionalism, how can consumers find out if the website they''re looking to book with is trustworthy? "When people book holiday villas they are doing so through rose-colored glasses," says Tony Neate, chief executive of Get Safe Online, "They should be Googling the property, and looking on websites like Google Maps and StreetView to see if it''s there. Also, speak to the person you''re booking the villa with on a landline phone, as fraudsters tend to only use mobiles." He also suggests asking someone not going on the holiday to have a look at the website. "They might spot problems you don''t spot." Another potential red flag is being asked to pay by bank transfer. "The problem is that when the money leaves your account it''s in theirs straightaway and it''s very hard to track it," says Barclays Bank head of digital safety, Jodie Gilbert. "We generally recommend other forms of payment, like credit card." F) Little seems to be known about these fraudsters, "There is no way to definitely know who they are," says Neate. "It could be anyone. It could be your next-door neighbor or organized crime in Russia." Action Fraud says people should ensure the company renting the villa is a member of a recognized trade body such as ABTA. G) "By working with industry partners such as ABTA and Get Safe Online, we are able to issue alerts about the latest threats they should be aware of. If you believe you have fallen victim to fraud or cyber-crime, please report it to Action Fraud," it adds. ABTA says it is trying to combat the issue by running public awareness campaigns. "It''s a growing problem and people can''t stop fraudsters being dishonest," says Tipton. "They''re still going to do it. It''s not impossible to stop but as it''s internet-based it''s harder to pursue." H) Nick Cooper, the founder and co-owner of villa booking company Villa Plus, estimates his company has uncovered more than 200 fake villa websites over the past two years, and doesn''t believe enough is being done. "It is hopeless to report fake villa websites to the internet giants who host them," he says. "I found it impossible to speak to anyone. Also, once one bank account gets reported, they simply use another." I) For now the only way to stop fraudsters appears ultimately to lie in the hands of the consumer. "When people book their holidays they get so emotionally involved, and when they find that villa at a good price with availability in peak season, they are an easy target," says Cooper. "The public has to learn to be far more aware they are a target for these sort of frauds." But it''s not just the financial cost. "A family will turn up at a villa and find out it doesn''t exist or the owner doesn''t know who you are," says Tipton. "The problem then is you have to find accommodation at short notice. It can be incredibly expensive but it''s the emotional cost, too." J) Carla O''Shaughnessy from Sydenham was searching last year for a good deal to book a villa in Majorca for a summer break for the family. "I was comparing prices online and found one that came in a bit cheaper than others," says O''Shaughnessy. She emailed the company via its website, asking how far the villa was from the airport and about local restaurants. "They came back with believable answers; it was all very friendly and professional," she says. Happy with the responses, O''Shaughnessy paid the full amount of £ 3,000 via bank transfer into the travel agent''s account and then forgot about it until a month before the booking. K) "I tried logging on to the website and couldn''t," she recalls. "I Googled the agent''s name and there were lots of complaints about him being a fraudster. If only I''d Googled before but I never thought of it." Although she found another villa in time for their holiday, she admits she was much more cautious. "I paid through a secure third-party site and had phone conversations with the agent. But I wasn''t able to relax until we turned up and I had the keys."', NULL, NULL, 1046, 'IMPORT', 'cet4-2022-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-06-2-r2'
);
SET @pg_cet4_2022_06_2_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-06-2-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-r3', 'CAREFUL_READING', 'CET4', NULL, 'Social media can be a powerful communication tool for employees, helping them to collaborate, share ideas and solve problems. Research has shown that 82% of employees think social media can improve work relationships and 60% believe it can support decision-making processes. These beliefs contribute to a majority of workers connecting with colleagues on social media, even during work hours. Employers typically worry that social media is a productivity killer; more than half of U.S. employers reportedly block access to social media at work. In my research with 277 employees of a healthcare organization I found these concerns to be misguided. Social media doesn''t reduce productivity nearly as much as it kills employee retention. In the first part of the study I surveyed the employees about why and how they used platforms like Facebook, Twitter, or LinkedIn. Respondents were then asked about their work behaviors, including whether they felt motivated in their jobs and showed initiative at work. I found employees who engage in online social interactions with co-workers through social media blogs tend to be more motivated and come up with innovative ideas. But when employees interact with individuals outside the organization, they are less motivated and show less initiative. In the second part of the study I found 76% of employees using social media for work took an interest in other organizations they found on social media. When I examined how respondents expressed openness to new careers and employers, I found that they engaged in some key activities including researching new organizations and making new work connections. These findings present a dilemma for managers: employees using social media at work are more engaged and more productive, but they are also more likely to leave your company. Managers should implement solutions that neutralize the retention risk caused by social media. They can create social media groups in which employees will be more likely to collaborate and less likely to share withdrawal intentions or discussions about external job opportunities. Managers can also use social media to directly reduce turnover( 跳槽) intentions, by recognizing employees'' accomplishments and giving visibility to employees'' success stories.', NULL, NULL, 351, 'IMPORT', 'cet4-2022-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-06-2-r3'
);
SET @pg_cet4_2022_06_2_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-06-2-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-r4', 'CAREFUL_READING', 'CET4', NULL, 'In the coming era of budget cuts to education, distance learning could become the norm. The temptation for those in charge of education budgets to trade teachers for technology could be so strong that they ignore the disadvantages of distance learning. School facilities are expensive to build and maintain, and teachers are expensive to employ. Online classes do not require buildings and each class can host hundreds of people simultaneously, resulting in greater savings, thus increasing the temptation of distance education for those concerned more about budgets than learning. But moving away from a traditional classroom in which a living, breathing human being teaches and interacts with students daily would be a disaster. Physically attending school has hidden benefits: getting up every morning, interacting with peers, and building relationships with teachers are essential skills to cultivate in young people. Moreover, schools should be more than simple institutions of traditional learning. They are now places that provide meals. They are places where students receive counseling and other support. Those policy-makers are often fascinated by the latest technology in education and its potential to "transform" education overnight. But online education does not allow a teacher to keep a struggling student after class and offer help. Educational videos may deliver academic content, but they are unable to make eye contact or assess a student''s level of engagement. Distance education will never match the personal teaching in a traditional classroom. In their first 18 years of life, American children spend only 9% of their time in school. Yet teachers are expected to prepare them to be responsible citizens, cultivate their social skills, encourage successful time management, and enhance their capacity to flourish in an increasingly harsh labor market. Given these expectations, schools should not become permanently "remote". The power of the classroom is rooted in the humanity of the people gathered in the same place, at the same time. Personal teaching is about teachers showing students a higher path, and about young people going through the process together. Technology, no matter how advanced, should simply be a tool of a good teacher.', NULL, NULL, 348, 'IMPORT', 'cet4-2022-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-06-2-r4'
);
SET @pg_cet4_2022_06_2_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-06-2-r4' LIMIT 1);

-- 翻译 cet4-2022-06-2
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-translation'
);
SET @q_cet4_2022_06_2_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_01, '从前有个人养了一群羊。一天早上他准备出去放羊，发现少了一只。他仔细一看，看到羊栏 (sheepfold)上有个窟窿。显然，夜间有狼钻进羊圈叼走了羊。 邻居劝他修羊栏，可是他不听。 第二天，他发现狼又通过窟窿叼走一只羊。他想起邻居的话，就赶快堵上窟窿,把羊栏补好。此后，他的羊再也没有被狼叼走。 故事告诉我们:出了问题及时补救，可以防止蒙受更大损失。', NULL, 'Long long ago, there was a man who raised a flock of sheep. One morning, when he was about to take the sheep out to graze, he found that one of them was missing. On a closer look, he saw that there was a hole in the sheepfold. Obviously, during the night a wolf had got into the sheepfold and carried off a sheep. His neighbour advised him to mend the sheepfold, but he would not listen. The next day, he found that another sheep had been carried off by the wolf through the hole. Remembering what his neighbour had said, he quickly blocked up the hole and mended the sheepfold. From then on, his sheep were never carried off by wolves again. The story tells us that fixing problems in time can prevent us from suffering greater losses.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_01
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q26'
);
SET @q_cet4_2022_06_2_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_02, NULL, '{"A":"A) acknowledge","B":"B) chance","C":"C) contains","D":"D) counterparts","E":"E) defined","F":"F) differ","G":"G) especially","H":"H) extracted","I":"I) implies","J":"J) necessarily","K":"K) particular","L":"L) perceive","M":"M) second","N":"N) sources","O":"O) strange"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_02
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q27'
);
SET @q_cet4_2022_06_2_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_03, NULL, '{"A":"A) acknowledge","B":"B) chance","C":"C) contains","D":"D) counterparts","E":"E) defined","F":"F) differ","G":"G) especially","H":"H) extracted","I":"I) implies","J":"J) necessarily","K":"K) particular","L":"L) perceive","M":"M) second","N":"N) sources","O":"O) strange"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_03
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q28'
);
SET @q_cet4_2022_06_2_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_04, NULL, '{"A":"A) acknowledge","B":"B) chance","C":"C) contains","D":"D) counterparts","E":"E) defined","F":"F) differ","G":"G) especially","H":"H) extracted","I":"I) implies","J":"J) necessarily","K":"K) particular","L":"L) perceive","M":"M) second","N":"N) sources","O":"O) strange"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_04
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q29'
);
SET @q_cet4_2022_06_2_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_05, NULL, '{"A":"A) acknowledge","B":"B) chance","C":"C) contains","D":"D) counterparts","E":"E) defined","F":"F) differ","G":"G) especially","H":"H) extracted","I":"I) implies","J":"J) necessarily","K":"K) particular","L":"L) perceive","M":"M) second","N":"N) sources","O":"O) strange"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_05
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q30'
);
SET @q_cet4_2022_06_2_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_06, NULL, '{"A":"A) acknowledge","B":"B) chance","C":"C) contains","D":"D) counterparts","E":"E) defined","F":"F) differ","G":"G) especially","H":"H) extracted","I":"I) implies","J":"J) necessarily","K":"K) particular","L":"L) perceive","M":"M) second","N":"N) sources","O":"O) strange"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_06
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q31'
);
SET @q_cet4_2022_06_2_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_07, NULL, '{"A":"A) acknowledge","B":"B) chance","C":"C) contains","D":"D) counterparts","E":"E) defined","F":"F) differ","G":"G) especially","H":"H) extracted","I":"I) implies","J":"J) necessarily","K":"K) particular","L":"L) perceive","M":"M) second","N":"N) sources","O":"O) strange"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_07
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q32'
);
SET @q_cet4_2022_06_2_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_08, NULL, '{"A":"A) acknowledge","B":"B) chance","C":"C) contains","D":"D) counterparts","E":"E) defined","F":"F) differ","G":"G) especially","H":"H) extracted","I":"I) implies","J":"J) necessarily","K":"K) particular","L":"L) perceive","M":"M) second","N":"N) sources","O":"O) strange"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_08
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q33'
);
SET @q_cet4_2022_06_2_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_09, NULL, '{"A":"A) acknowledge","B":"B) chance","C":"C) contains","D":"D) counterparts","E":"E) defined","F":"F) differ","G":"G) especially","H":"H) extracted","I":"I) implies","J":"J) necessarily","K":"K) particular","L":"L) perceive","M":"M) second","N":"N) sources","O":"O) strange"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_09
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q34'
);
SET @q_cet4_2022_06_2_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_10, NULL, '{"A":"A) acknowledge","B":"B) chance","C":"C) contains","D":"D) counterparts","E":"E) defined","F":"F) differ","G":"G) especially","H":"H) extracted","I":"I) implies","J":"J) necessarily","K":"K) particular","L":"L) perceive","M":"M) second","N":"N) sources","O":"O) strange"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_10
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q35'
);
SET @q_cet4_2022_06_2_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_11, NULL, '{"A":"A) acknowledge","B":"B) chance","C":"C) contains","D":"D) counterparts","E":"E) defined","F":"F) differ","G":"G) especially","H":"H) extracted","I":"I) implies","J":"J) necessarily","K":"K) particular","L":"L) perceive","M":"M) second","N":"N) sources","O":"O) strange"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_11
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q36'
);
SET @q_cet4_2022_06_2_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_12, 'Fraudsters often steal villa-booking information from authentic holiday websites.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_12
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q37'
);
SET @q_cet4_2022_06_2_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_13, 'Fraudsters keep changing their bank accounts to avoid being tracked.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_13
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q38'
);
SET @q_cet4_2022_06_2_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_14, 'It is suggested that people not going on the holiday might help detect website frauds.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_14
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q39'
);
SET @q_cet4_2022_06_2_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_15, 'More and more British holidaymakers find the seaside villas they booked online actually nonexistent.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_15
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q40'
);
SET @q_cet4_2022_06_2_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_16, 'By checking an agent''s name online before booking a villa, holidaymakers can avoid falling into traps.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_16
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q41'
);
SET @q_cet4_2022_06_2_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_17, 'Fraudsters are difficult to identify, according to an online safety expert.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_17
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q42'
);
SET @q_cet4_2022_06_2_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_18, 'Holidaymakers have been alerted to the frequent occurrence of online villa-booking frauds.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_18
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q43'
);
SET @q_cet4_2022_06_2_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_19, 'It is holidaymakers that can protect themselves from falling victim to frauds.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_19
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q44'
);
SET @q_cet4_2022_06_2_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_20, 'Holidaymakers are advised not to make payments by bank transfer.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_20
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q45'
);
SET @q_cet4_2022_06_2_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_21, 'Fraudsters advertise their villas at reasonable prices so as not to be suspected.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_21
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q46'
);
SET @q_cet4_2022_06_2_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_22, 'What does previous research about social media reveal?', '{"A":"A) Most employees think positively of it.","B":"B) It improves employees'' work efficiency.","C":"C) It enables employees to form connections.","D":"D) Employees spend much of their work time on it."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_22
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q47'
);
SET @q_cet4_2022_06_2_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_23, 'What did the author''s own research find about social media?', '{"A":"A) It influences employees'' work negatively.","B":"B) It does much harm to employee loyalty.","C":"C) It kills employees'' motivation for work","D":"D) It affects employers'' decision-making."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_23
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q48'
);
SET @q_cet4_2022_06_2_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_24, 'What did the author find in his study about the effect of online social interactions?', '{"A":"A) It differs from employee to employee.","B":"B) It tends to vary with the platform used.","C":"C) It has much to do with whom employees interact with.","D":"D) It is hard to measure when employees interact with outsiders."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_24
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q49'
);
SET @q_cet4_2022_06_2_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_25, 'What problem was found with employees using social media for work?', '{"A":"A) They seldom expressed their inner thoughts.","B":"B) Most of them explored new job opportunities.","C":"C) They were reluctant to collaborate with others.","D":"D) Many of them ended with lower productivity."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_25
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q50'
);
SET @q_cet4_2022_06_2_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_26, 'What does the author suggest managers do to neutralize the retention risk?', '{"A":"A) Give promotions to employees for their accomplishments.","B":"B) Create opportunities for employees to share success stories.","C":"C) Acknowledge employees'' achievements through social media.","D":"D) Encourage employees to increase their visibility on social media."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_26
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q51'
);
SET @q_cet4_2022_06_2_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_27, 'What mainly accounts for the possibility that distance learning could become the norm?', '{"A":"A) Advances in education technology.","B":"B) Shrinking financial resources.","C":"C) Shortage of school facilities.","D":"D) Lack of qualified teachers."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_27
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q52'
);
SET @q_cet4_2022_06_2_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_28, 'What does the author say is one possible benefit of students attending school physically?', '{"A":"A) Developing the habit of getting up early.","B":"B) Eating nutritionally well-balanced meals.","C":"C) Growing into living and breathing human beings.","D":"D) Cultivating relationships with peers and teachers."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_28
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q53'
);
SET @q_cet4_2022_06_2_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_29, 'What does the author think of the latest technology in education?', '{"A":"A) It may have potential disadvantages.","B":"B) It may render many teachers jobless.","C":"C) It may add to students'' financial burden.","D":"D) It may revolutionize classroom teaching"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_29
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q54'
);
SET @q_cet4_2022_06_2_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_30, 'What does the author say teachers are expected to do?', '{"A":"A) Enhance students'' leadership capacity.","B":"B) Elevate students to managerial positions.","C":"C) Enable students to adapt to the changes in life.","D":"D) Prepare students to be competitive in the future."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_30
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-06-2-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q55'
);
SET @q_cet4_2022_06_2_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-06-2-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_06_2_31, 'Why couldn''t technology replace a good teacher?', '{"A":"A) It lacks humanity.","B":"B) It is still immature.","C":"C) It cannot track students'' growth.","D":"D) It cannot cater to personal needs."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_06_2_31
);

-- ==================== cet4-2022-09-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-r1', 'BANKED_CLOZE', 'CET4', NULL, 'Public perception of success in the U.S. might be totally misguided. While 92% of people believe others care most about fame and __26__ , fewer than 10% factor those qualities into their own success. This is according to the newly __27__ study by Harvard Graduate School of Education professor Todd Smith. Smith says he was __28__ by how past studies on success "assumed what people will care about." In this study, his team "went the __29__ direction" by spending years carrying out individual interviews and group surveys to see what people really talk about when they talk about success. As a scientist, Smith __30__ studied individuality for a living, and even he was surprised to find younger respondents cared more about having a __31__ in life. Those between the ages of 18 and 34 prioritized it most, and that prioritization dropped off as respondents'' ages went up. Perhaps this is because older people had fewer options when they were starting their careers, at a time when values focused more on stable incomes than __32__ personal missions. Other trends included an emphasis on the importance of parenting. Being a parent __33__ very high across the priorities of all study participants. Ultimately, Smith hopes institutions will take note of these insights __34__ . Higher education institutions tend to focus on preparing students for high-paying jobs. For such institutions, from universities to workplaces, to better __35__ people in the U.S., they''ll need to understand "what the American public highly prioritizes," Smith says.', NULL, '["A) accommodate","B) accordingly","C) acquiring","D) bothered","E) fortune","F) fulfilling","G) identify","H) literally","I) opposite","J) profession","K) purpose","L) ranked","M) released","N) similarly","O) wrong"]', 249, 'IMPORT', 'cet4-2022-09-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-09-1-r1'
);
SET @pg_cet4_2022_09_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-09-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-r2', 'MATCHING', 'CET4', 'How a rabbit study and an ex-student boost my hopes for a future of ''love and dignity''', 'A) At whatever grade level teachers find themselves, from kindergarten to the final class at medical or law school, few moments stir the emotions as deeply as when former students reappear years and often decades later with an update on where their journey has taken them and what resiliencies( 韧性) have been the pavement on which they''ve traveled. B) So it was when a recent letter came from Kelli Harding, a student 21 years ago in my Peace Studies summer course in Washington. The weekly tuition-free class, in a roomy space that Ralph Nader and his Public Citizen nonprofit group provided, was discussion-based and required no useless homework or exams. Just come in and figure out how to increase peace and decrease violence. And do it today, tomorrow is too late. The course attracted mostly congressional interns( 实习生), with a few exceptions like Kelli who was in Washington as an AmeriCorps volunteer. C) Her year-long service included comforting AIDS patients at a free health clinic and delivering meals to the homebound. It was a world apart from her undergraduate days at the University of California-Berkeley majoring in political science. The Washington experience, which Kelli would later call "transformative", was the fuel that carried her into medicine to earn a master''s degree in public health from Columbia University and a medical degree from the University of Rochester, and almost two decades of practice as an emergency- room psychiatrist(精神科医生) at New York-Presbyterian Hospital and a clinical professor of psychiatry at Columbia University Irving Medical Center. D) Kelli''s letter, a literate update on both her personal and professional life, touched my heart, and especially so when saying that two decades later she still has the course text, "Solutions to Violence," and that "it remains one of my favorite possessions." She lives in Lower Manhattan with her husband, Padraic, whom she met on a flight to London, and their three boys. E) If Kelli stands out, it''s because she is also a gifted writer. Last month, Atria Books published her book The Rabbit Effect: Live Longer, Happier, and Healthier with the Groundbreaking Science of Kindness. F) With a blending of free-flowing confessional prose and scholarly research found in 461 notes, Kelli met my expectations that her ideas and ideals would be sound and singular. "Despite our scientific progress," she writes, "Americans are remarkably unhealthy. In 2016, the United States ranked forty-third in the world for life expectancy. It is also by far the world''s most expensive place to get sick." G) Enter the rabbits—not those running around in our woodlands but ones serving in two month-long medical experiments to test the effects of eating a high-fat diet and the connections between cholesterol and heart disease. With similar diets, the expectations were that all the rabbits would have similar cloggings of their arteries(动脉堵塞). Yet one group had 60% fewer of them. H) The reason? Instead of receiving the standard care given to lab animals, the 60% group was watched over by a newcomer to the lab who, Kelli writes, "handled the animals differently. When she fed her rabbits she talked to them and petted them. She didn''t just pass out food, she gave them love. The studies indicate something is missing in the traditional biomedical model. It wasn''t diet or genetics that made a difference in which rabbits got sick and which stayed healthy. It was kindness." I) Amid the political noise about Obamacare, Medicare, Medicaid, health insurance and thieving pharmaceutical(医药的) companies, Kelli Harding stands apart from the crowd calling for quick fixes, the simpler the better. She has walked too many miles in the halls of hospitals visiting too many far-gone patients and seeing too many medical mistakes to go along with conventional thinking. J) "The rabbit effect," she explains, means that "when it comes to our health, we''ve been missing some crucial pieces: hidden factors behind what really makes us healthy. Factors like love, friendship, and dignity. The designs of our neighborhoods, schools, and workplaces. There''s a social dimension to health that we''ve completely overlooked in our efforts to find the best and most cutting-edge medical care … Ultimately, what affects our health in the most meaningful ways has more to do with how we treat one another, how we live, and how we think about what it means to be human than with anything that happens in the doctor''s office." K) In more than a few passages, she relates the stories of men and women who came up against assembly-line medicine where patients were treated mostly as pieces of flesh. "Clinically," she writes, "it''s common to see two patients with the same condition, such as recovering from a heart attack, have two very different courses based on seemingly irrelevant factors, such as their family relationships or their educational levels. In my practice, the sickest people I see often share similar backgrounds: loneliness, abuse, poverty, or discrimination. For them, the medical model isn''t enough. It''s like fixing up an airplane engine and ignoring that the pilot is on his third drink at the bar and a massive storm is overhead … To properly care for patients, we also need to care about the lives of the people getting the care." L) Kelli wastes no time taking potshots at( 随意批评) the medical establishment and its body-centered biomedicine methods. Instead, she remains positive, holding up for praise one of her medical school professors, George Engel, "who always noticed not just a patient''s physical condition but little details about her life, such as if she had family pictures up in her hospital room or flowers delivered. He was the kind of trusted doctor you''d feel relieved to see and welcome into the room with a sick family member. He''d sit down to talk with the patient not just about medical problems, but about her life and priorities. He built a large consultation service to address the holistic( 整体的) needs of hospitalized patients, including psychological and social factors." M) It''s a guess how many George Engels in their white jackets are at work these days and another speculation on the number of Kelli Hardings the nation is blessed with. May the totals be large and getting larger.', NULL, NULL, 1030, 'IMPORT', 'cet4-2022-09-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-09-1-r2'
);
SET @pg_cet4_2022_09_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-09-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-r3', 'CAREFUL_READING', 'CET4', NULL, 'Academic dishonesty is nothing new. As long as there have been homework assignments and tests, there have been cheaters. The way that cheating looks has changed over time, though, particularly now that technology has made it easier than ever. A study by the Josephson Institute of Ethics interviewed 23,000 high school students and asked them a variety of questions about academic ethics. Of the teens surveyed, 51 percent said that they had knowingly cheated at some point on an exam but that they did not feel uneasy about the behavior. A Common Sense Media survey found that 35 percent of students had cheated via smartphone, though the parents surveyed in that particular study did not believe their kids had ever cheated. In many cases, students did not realize that strategies like looking up answers on a smartphone were actually cheating at all. In today''s classrooms, students who cheat are rarely caught. There are no formulas written on the insides of hands or students looking across the aisle, or whispering answers to their classmates. Today''s students use smartphones, tablets or even in-class computers to aid their cheating attempts and leave no trace of their crimes. Since cheating through technology is not listed specifically as being against the rules in many school policies, students do not view the actions as unethical. The technology is being adopted so quickly that school districts cannot adequately keep up with cheating policies, or even awareness campaigns that alert students to the problem with using technology to find answers in a certain way. From a young age, students learn that answers exist conveniently at their fingertips through search engines and expert websites. Schools must develop anti-cheating policies that include technology and these policies must be updated consistently. Teachers must stay on guard when it comes to what their students are doing in classrooms and how technology could be playing a negative role in the learning process. Parents must also talk to their kids about the appropriate ways to find academic answers and alert them to unethical behaviours that may seem innocent in their own eyes.', NULL, NULL, 348, 'IMPORT', 'cet4-2022-09-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-09-1-r3'
);
SET @pg_cet4_2022_09_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-09-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-r4', 'CAREFUL_READING', 'CET4', NULL, 'Remote work is about more than just working from home—it means working differently. Organizations should reconsider the appropriateness of their performance evaluation procedures in light of the shift to remote work. This requires a fundamental rethinking of what organizations expect from employees and what companies would look for in a model employee in a remote work context. It is likely that the "first to arrive and last to leave" mentality is no longer relevant, but should be replaced by a regard for the quality of an employee''s contribution to the organization. This means that work should be measured in terms of the quality of the work, not just the quality of the process. As remote work is largely unobservable to supervisors, employers need to think about how they can objectively measure the quality of work in a way that is consistent for employees of similar rank. Focusing on output alone can have unintended consequences. Employers should think instead about the values and soft skills they want to emphasize in a remote work environment. Qualities like flexibility and the ability to work under minimal supervision might become critical. Much has been written about the importance of timely feedback. In the context of a global pandemic(大流 行病), firms may want to provide additional support to employees by providing more frequent communication. This allows managers to both keep an eye on struggling employees and provide ongoing feedback on how employees are adapting to their new work environment. Compensation also needs to be revisited. The purpose of performance evaluation is ultimately to determine how to reward employees for their work. This means that pay structures need to adapt to the reality of working from home. However, organizations also need to be honest with employees about the financial impact of COVID-19. For organizations that have struggled to keep the lights on due to the pandemic, this might mean thinking of non-financial ways to reward employees, like unpaid time off or flexible work schedules. Employers can also consider how to bundle different types of compensation to help employees cope with their unique situations.', NULL, NULL, 347, 'IMPORT', 'cet4-2022-09-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-09-1-r4'
);
SET @pg_cet4_2022_09_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-09-1-r4' LIMIT 1);

-- 翻译 cet4-2022-09-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-translation'
);
SET @q_cet4_2022_09_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_01, '太极拳 (Taijiquan)起源于中国古代，是中国武术 (martial art) 的一个重要分支。练太极拳最初是为了自卫，现在是促进身心健康的有效锻炼方式。大量研究表明，这种锻炼方式有助于保持力量、灵活性和平衡力，并减少压力和焦虑。太极拳练习起来既容易又愉快，通过轻柔、流畅的动作，促使心情平静、头脑清晰。今天，太极拳已经传播到世界各地，深受广大健身者的喜爱。', NULL, 'Taijiquan originated from ancient China and is an important branch of Chinese martial arts. Practicing Taijiquan was originally for self-defense, but it is now an effective form of exercise to promote physical and mental health. A large number of studies show that this form of exercise helps maintain strength, flexibility and balance, and reduce stress and anxiety. Taijiquan is both easy and enjoyable to practice, and with its gentle and flowing movements, it calms the mind and clears the head. Today, Taijiquan has spread to all parts of the world and is widely loved by fitness enthusiasts.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_01
);

-- 听力 Q1 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q01', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q01'
);
SET @q_cet4_2022_09_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_02, NULL, '{"A":"A) It examines the effect of cholesterol on people''s health.","B":"B) Its participants all had high blood cholesterol levels.","C":"C) It questions the benefits of a vegetarian protein diet.","D":"D) Its finding came as a surprise to the researchers."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_02
);

-- 听力 Q2 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q02', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q02'
);
SET @q_cet4_2022_09_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_03, NULL, '{"A":"A) They do not know all the effects of eating meat.","B":"B) Red meat itself does not cause heart diseases.","C":"C) White meat may be healthier than red meat.","D":"D) Vegetarian protein may be easier to absorb."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_03
);

-- 听力 Q3 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q03', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q03'
);
SET @q_cet4_2022_09_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_04, NULL, '{"A":"A) It may have been due to the lorry driver''s drunk driving.","B":"B) It may affect the local supply of turkeys for Christmas.","C":"C) It interrupted traffic for several hours running.","D":"D) It was caused by a lorry running into a trailer."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_04
);

-- 听力 Q4 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q04', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q04'
);
SET @q_cet4_2022_09_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_05, NULL, '{"A":"A) It has been the scene of several fatal accidents recently.","B":"B) It is the spot that causes the local police a lot of worry.","C":"C) It has witnessed several traffic accidents this year.","D":"D) It is a location frequented by local traffic police."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_05
);

-- 听力 Q5 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q05', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q05'
);
SET @q_cet4_2022_09_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_06, NULL, '{"A":"A) Get approval to add more routes.","B":"B) Attract more international tourists.","C":"C) Advertise it through a mobile app.","D":"D) Make it affordable to common folk."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_06
);

-- 听力 Q6 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q06', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q06'
);
SET @q_cet4_2022_09_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_07, NULL, '{"A":"A) It costs more than twice as much as a car ride.","B":"B) It is gaining popularity among ordinary Indians.","C":"C) It symbolizes India''s advancement in high-tech.","D":"D) It can get anywhere in the city within 15 minutes."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_07
);

-- 听力 Q7 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q07', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q07'
);
SET @q_cet4_2022_09_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_08, NULL, '{"A":"A) International tourists.","B":"B) High-class travelers.","C":"C) Prominent superstars.","D":"D) Customers in a hurry."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q08', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q08'
);
SET @q_cet4_2022_09_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_09, NULL, '{"A":"A) Treat her friends in a bar.","B":"B) Take a trip to Washington.","C":"C) Make some cheese.","D":"D) Throw a party."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_09
);

-- 听力 Q9 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q09', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q09'
);
SET @q_cet4_2022_09_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_10, NULL, '{"A":"A) Spend no more than 30 dollars.","B":"B) Buy different kinds of cheese.","C":"C) Help him prepare the barbecue.","D":"D) Find out different people''s tastes."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_10
);

-- 听力 Q10 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q10', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q10'
);
SET @q_cet4_2022_09_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_11, NULL, '{"A":"A) It is the best kind of hard cheese.","B":"B) It is the most popular in Spain.","C":"C) It is more delicious than honey.","D":"D) It is a good choice for children."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_11
);

-- 听力 Q11 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q11', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q11'
);
SET @q_cet4_2022_09_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_12, NULL, '{"A":"A) Buy what the man recommended.","B":"B) Have a taste of both of the cheeses.","C":"C) Choose one of the two types of cheese.","D":"D) Ask the man to cut the cheese into slices."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_12
);

-- 听力 Q12 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q12', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q12'
);
SET @q_cet4_2022_09_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_13, NULL, '{"A":"A) New teachers and staff have to be recruited.","B":"B) It might take some time for students to adapt.","C":"C) It involves buying lots of tablets and software.","D":"D) The software has to be constantly upgraded."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_13
);

-- 听力 Q13 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q13', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q13'
);
SET @q_cet4_2022_09_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_14, NULL, '{"A":"A) It can greatly improve their learning efficiency.","B":"B) It can help them to interact more with teachers.","C":"C) It can save their trouble of carrying printed books.","D":"D) It can develop their skills in using electronic devices."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_14
);

-- 听力 Q14 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q14', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q14'
);
SET @q_cet4_2022_09_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_15, NULL, '{"A":"A) They may have trouble comprehending texts.","B":"B) They may encounter technological problems.","C":"C) They may pay less respect to teachers.","D":"D) They may get distracted more easily."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_15
);

-- 听力 Q15 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q15', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q15'
);
SET @q_cet4_2022_09_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_16, NULL, '{"A":"A) It generates a great deal of electronic garbage.","B":"B) It does a lot of damage to the environment.","C":"C) It emits huge amounts of harmful radiation.","D":"D) It accelerates the exhaustion of rare minerals."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_16
);

-- 听力 Q16 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q16', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q16'
);
SET @q_cet4_2022_09_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_17, NULL, '{"A":"A) Communicate with our coworkers.","B":"B) Encounter people in different places.","C":"C) Judge people based on our first impressions.","D":"D) Engage in a variety of psychological activities."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_17
);

-- 听力 Q17 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q17', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q17'
);
SET @q_cet4_2022_09_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_18, NULL, '{"A":"A) It is an objective evaluation of a person''s character.","B":"B) It is a mental process influenced by many factors.","C":"C) It contributes to the formation of personal traits.","D":"D) It varies greatly among different social groups."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_18
);

-- 听力 Q18 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q18', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q18'
);
SET @q_cet4_2022_09_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_19, NULL, '{"A":"A) It can lead to incorrect judgments.","B":"B) It can cause mistrust among people.","C":"C) It can result in instant losses.","D":"D) It can give rise to gender bias."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_19
);

-- 听力 Q19 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q19', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q19'
);
SET @q_cet4_2022_09_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_20, NULL, '{"A":"A) Both groups spend a lot of time on mobile devices.","B":"B) Both groups attach importance to social connections.","C":"C) They are equally competent in using new technology.","D":"D) They are similar in terms of social skills."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_20
);

-- 听力 Q20 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q20', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q20'
);
SET @q_cet4_2022_09_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_21, NULL, '{"A":"A) Their social skills were negatively affected.","B":"B) Their school performance was slightly lower.","C":"C) Their emotions were much harder to regulate.","D":"D) Their relations with peers were badly strained."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_21
);

-- 听力 Q21 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q21', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q21'
);
SET @q_cet4_2022_09_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_22, NULL, '{"A":"A) It may pose a threat to their children''s safety.","B":"B) It may affect society''s traditional values.","C":"C) It may hurt their relations with children.","D":"D) It may change their children''s ethical values."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_22
);

-- 听力 Q22 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q22', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q22'
);
SET @q_cet4_2022_09_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_23, NULL, '{"A":"A) It is motivating.","B":"B) It is passive.","C":"C) It is incredible.","D":"D) It is impracticable."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_23
);

-- 听力 Q23 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q23', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q23'
);
SET @q_cet4_2022_09_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_24, NULL, '{"A":"A) It results in short-term excitement.","B":"B) It helps us avoid making mistakes.","C":"C) It breeds long-term passion and enthusiasm.","D":"D) It is bound to help us achieve greater success."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_24
);

-- 听力 Q24 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q24', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q24'
);
SET @q_cet4_2022_09_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_25, NULL, '{"A":"A) Drive us forward.","B":"B) Bring us power.","C":"C) Spur us to action.","D":"D) Give us ideas."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_25
);

-- 听力 Q25 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q25', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q25'
);
SET @q_cet4_2022_09_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_26, NULL, '{"A":"A) Listening to success stories.","B":"B) Applying ideas to one''s life.","C":"C) Following the advice of experts.","D":"D) Consuming the world around us."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q26'
);
SET @q_cet4_2022_09_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_27, NULL, '{"A":"A) accommodate","B":"B) accordingly","C":"C) acquiring","D":"D) bothered","E":"E) fortune","F":"F) fulfilling","G":"G) identify","H":"H) literally","I":"I) opposite","J":"J) profession","K":"K) purpose","L":"L) ranked","M":"M) released","N":"N) similarly","O":"O) wrong"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q27'
);
SET @q_cet4_2022_09_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_28, NULL, '{"A":"A) accommodate","B":"B) accordingly","C":"C) acquiring","D":"D) bothered","E":"E) fortune","F":"F) fulfilling","G":"G) identify","H":"H) literally","I":"I) opposite","J":"J) profession","K":"K) purpose","L":"L) ranked","M":"M) released","N":"N) similarly","O":"O) wrong"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q28'
);
SET @q_cet4_2022_09_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_29, NULL, '{"A":"A) accommodate","B":"B) accordingly","C":"C) acquiring","D":"D) bothered","E":"E) fortune","F":"F) fulfilling","G":"G) identify","H":"H) literally","I":"I) opposite","J":"J) profession","K":"K) purpose","L":"L) ranked","M":"M) released","N":"N) similarly","O":"O) wrong"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q29'
);
SET @q_cet4_2022_09_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_30, NULL, '{"A":"A) accommodate","B":"B) accordingly","C":"C) acquiring","D":"D) bothered","E":"E) fortune","F":"F) fulfilling","G":"G) identify","H":"H) literally","I":"I) opposite","J":"J) profession","K":"K) purpose","L":"L) ranked","M":"M) released","N":"N) similarly","O":"O) wrong"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q30'
);
SET @q_cet4_2022_09_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_31, NULL, '{"A":"A) accommodate","B":"B) accordingly","C":"C) acquiring","D":"D) bothered","E":"E) fortune","F":"F) fulfilling","G":"G) identify","H":"H) literally","I":"I) opposite","J":"J) profession","K":"K) purpose","L":"L) ranked","M":"M) released","N":"N) similarly","O":"O) wrong"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q31'
);
SET @q_cet4_2022_09_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_32, NULL, '{"A":"A) accommodate","B":"B) accordingly","C":"C) acquiring","D":"D) bothered","E":"E) fortune","F":"F) fulfilling","G":"G) identify","H":"H) literally","I":"I) opposite","J":"J) profession","K":"K) purpose","L":"L) ranked","M":"M) released","N":"N) similarly","O":"O) wrong"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q32'
);
SET @q_cet4_2022_09_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_33, NULL, '{"A":"A) accommodate","B":"B) accordingly","C":"C) acquiring","D":"D) bothered","E":"E) fortune","F":"F) fulfilling","G":"G) identify","H":"H) literally","I":"I) opposite","J":"J) profession","K":"K) purpose","L":"L) ranked","M":"M) released","N":"N) similarly","O":"O) wrong"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q33'
);
SET @q_cet4_2022_09_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_34, NULL, '{"A":"A) accommodate","B":"B) accordingly","C":"C) acquiring","D":"D) bothered","E":"E) fortune","F":"F) fulfilling","G":"G) identify","H":"H) literally","I":"I) opposite","J":"J) profession","K":"K) purpose","L":"L) ranked","M":"M) released","N":"N) similarly","O":"O) wrong"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q34'
);
SET @q_cet4_2022_09_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_35, NULL, '{"A":"A) accommodate","B":"B) accordingly","C":"C) acquiring","D":"D) bothered","E":"E) fortune","F":"F) fulfilling","G":"G) identify","H":"H) literally","I":"I) opposite","J":"J) profession","K":"K) purpose","L":"L) ranked","M":"M) released","N":"N) similarly","O":"O) wrong"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q35'
);
SET @q_cet4_2022_09_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_36, NULL, '{"A":"A) accommodate","B":"B) accordingly","C":"C) acquiring","D":"D) bothered","E":"E) fortune","F":"F) fulfilling","G":"G) identify","H":"H) literally","I":"I) opposite","J":"J) profession","K":"K) purpose","L":"L) ranked","M":"M) released","N":"N) similarly","O":"O) wrong"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q36'
);
SET @q_cet4_2022_09_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_37, 'Kelli Harding also distinguishes herself by her literary talent.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q37'
);
SET @q_cet4_2022_09_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_38, 'Kelli Harding doesn''t think America''s medical model is sufficient for patients who need help most.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q38'
);
SET @q_cet4_2022_09_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_39, 'Kelli Harding differs from those seeking quick and simple solutions to America''s medical problems.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q39'
);
SET @q_cet4_2022_09_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_40, 'Kelli Harding was a participant in a summer course the author taught.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q40'
);
SET @q_cet4_2022_09_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_41, 'According to Kelli Harding, scientific advances have not made Americans healthier, nor prolonged their life.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q41'
);
SET @q_cet4_2022_09_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_42, 'The author was deeply moved by what Kelli Harding wrote about her current life.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q42'
);
SET @q_cet4_2022_09_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_43, 'George Engel, in treating his patients, not only looks into their symptoms but also into things like the emotional support they receive.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q43'
);
SET @q_cet4_2022_09_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_44, 'According to Kelli Harding, rabbits'' health had more to do with humans'' kindness to them than their diet or genetics.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q44'
);
SET @q_cet4_2022_09_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_45, 'What Kelli Harding went through in Washington changed her life.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q45'
);
SET @q_cet4_2022_09_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_46, 'A social aspect to health has not been taken into account in trying to provide the best medical care.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q46'
);
SET @q_cet4_2022_09_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_47, 'What do we learn from the study by the Josephson Institute of Ethics?', '{"A":"A) Over half of the students interviewed were unaware they were cheating.","B":"B) Cheating was becoming a way of life for a majority of high school teens.","C":"C) More than half of the interviewees felt no sense of guilt over cheating.","D":"D) Cheating was getting more and more difficult for high school students."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q47'
);
SET @q_cet4_2022_09_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_48, 'What did the Common Sense Media survey reveal?', '{"A":"A) Most parents tended to overprotect their children.","B":"B) Many students committed cheating unknowingly.","C":"C) Students were in urgent need of ethical education.","D":"D) Parents and kids had conflicting ideas over cheating."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q48'
);
SET @q_cet4_2022_09_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_49, 'Why do students rarely get caught cheating nowadays?', '{"A":"A) They copy formulas on their palms.","B":"B) They help each other to cover up their acts.","C":"C) They keep changing their ways of cheating.","D":"D) They make use of modern technology."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q49'
);
SET @q_cet4_2022_09_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_50, 'What does the author think schools should do to tackle cheating?', '{"A":"A) Bring policies against cheating up to date.","B":"B) Reform their exam methods constantly.","C":"C) Take advantage of the latest technologies.","D":"D) Alert parents to their children''s behaviour."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q50'
);
SET @q_cet4_2022_09_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_51, 'What does the author suggest teachers do in the classroom?', '{"A":"A) Prevent students from overusing electronic devices.","B":"B) Develop more effective anti-cheating strategies.","C":"C) Find more ways to curb students'' unethical acts.","D":"D) Guard against students'' misuse of technology."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q51'
);
SET @q_cet4_2022_09_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_52, 'What does the author say companies should do in the context of remote work?', '{"A":"A) Reform performance evaluation.","B":"B) Rethink the organizational fundamentals.","C":"C) Reexamine its effects on employees'' behaviors.","D":"D) Reflect on its differences from working in the office."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q52'
);
SET @q_cet4_2022_09_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_53, 'What should be prioritized in assessing employees'' remote work?', '{"A":"A) The quantity of their output.","B":"B) The length of their work time.","C":"C) The quality of their contribution.","D":"D) The flexibility of their work schedules."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q53'
);
SET @q_cet4_2022_09_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_54, 'What quality in the employees would be of great importance in a remote work context?', '{"A":"A) The ability to produce quality work.","B":"B) The ability to maximize work efficiency.","C":"C) The ability to finish tasks in a timely manner.","D":"D) The ability to work with the least supervision."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q54'
);
SET @q_cet4_2022_09_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_55, 'Why is it important for firms to provide timely feedback during the pandemic?', '{"A":"A) To evaluate their employees of similar rank in a consistent way.","B":"B) To keep a watchful eye on those employees who perform poorly.","C":"C) To help employees in need adapt to the new work environment.","D":"D) To maintain connections with their employees away from office."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-09-1-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_09_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-09-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q55'
);
SET @q_cet4_2022_09_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-09-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_09_1_56, 'What is the author''s suggestion to employers who experience the financial impact of the pandemic?', '{"A":"A) Urging their employees to adapt to the new situation.","B":"B) Rewarding their employees in unconventional ways.","C":"C) Identifying employees who make little contribution.","D":"D) Allowing their employees to look for part-time jobs."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_09_1_56
);

-- ==================== cet4-2022-12-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-r1', 'BANKED_CLOZE', 'CET4', NULL, 'Researchers, writing in the journal Heart, pooled data from 23 studies and found that social isolation or feelings of loneliness were tied to an increased risk of coronary heart disease(冠心病) and strokes. The studies included data from 181,006 men and women ages 18 and over. There were 4,628 coronary events and 3,002 strokes in follow-up periods __26__ from three to 21 years. Three of the papers __27__ loneliness, 18 looked at social isolation and two included both. Social isolation and loneliness were determined with questionnaires; the researchers depended on medical records and death __28__ for determining coronary events and strokes. The scientists found that loneliness and social isolation increased the __29__ risk of having a heart attack or a death from heart disease by 29 percent, and the risk of stroke by 32 percent. There were no __30__ between men and women. "People have tended to focus from a policy point of view on __31__ lonely people to make them more __32__ ," said the lead author, Nicole K. Valtorta, a research fellow at the University of York in England. "Our study __33__ that if this is a risk factor, then we should be trying to prevent the risk factor in the first place." The authors __34__ that this was a review of observational studies and did not __35__ cause and effect.', NULL, '["A) acknowledge","B) certificates","C) connected","D) demonstrates","E) differences","F) establish","G) formats","H) measured","I) narrow","J) permanent","K) produces","L) ranging","M) relative","N) submitting","O) targeting"]', 222, 'IMPORT', 'cet4-2022-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-1-r1'
);
SET @pg_cet4_2022_12_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-r2', 'MATCHING', 'CET4', 'The hidden costs colleges don''t want you to know about', 'A) This fall, thousands of college students from across the country will begin their undergraduate studies at colleges around the nation. They will inevitably pack too much to fit in their tiny dorm rooms. They will also carry with them a huge student loan debt, in addition to countless "hidden" out-of-pocket costs paid for by their bank accounts and the bank accounts of their families. B) At my well-respected, private, four-year university in Washington, D.C., which boasts a yearly tuition of $44,046 not including room and board, I receive over $57,000 yearly in financial aid. As a student from a family that is struggling to make ends meet, my financial aid package is a combination of federal grants and federal work study, university merit scholarships and financial aid awards, and about $8,000 yearly in federally subsidized(有补贴的) and unsubsidized loans. On paper, my expenses and my financial aid just about even out. Off paper, they don''t. C) Universities today are in the business of making money, and mine is no exception. They hit me right out of the gate with a $160 fee to attend my freshman orientation, a price which does not include the cost of travel to and from the District. Almost every class has an associated fee not included in the cost of tuition, most between $40 and $100. Fees for lab science classes are the highest, and all students at my university are required to take at least one lab before they graduate. Buying a laptop proved a necessity and, thankfully, a relative bought me one as a gift. Renting a mini-fridge for my dorm room costs my roommates and me about $140 a year. D) Schools will charge you whatever they can. The costs of any damage to the dorm, including elevators, bathrooms, and common areas, are billed to every person on a dorm floor, or even the entire building if they do not know who caused the damage. After I fell out of my bed twice during my freshman year, the university installed a railing—for $20, billed to my student account. My financial aid did not anticipate any of these costs, and so it did not cover them. E) An Internet search of "hidden costs" of college turns up a host of articles on parent-centered websites on the college application process. These articles are almost always geared towards upper- and middle-class families. For students already struggling to pay tuition, these costs may be the least of their worries. F) So what hidden costs should low-income students really be paying attention to? My college experience offers a few examples. G) If you are a low-income student who will be attending school out-of-state, make sure you know if you can use your state benefits, such as the Supplemental Nutrition Assistance Program, or SNAP. It wasn''t until after I had accepted admission to an out-of-state school that I learned that I could not use my Ohio Medicaid on campus for anything other than emergency care. My benefits became invalid the second I moved out of Ohio. After my freshman year, I had to opt for the school''s insurance plan, which costs around $2,000 a year. Even if your school offers a flat-rate fee for a doctor''s appointment at the student health center (mine is $20 a visit), these fees often do not include extra fees for lab tests or prescription medications(药物). H) If you plan on paying off bills in your student account with a credit card, be aware of any additional costs. My school charges an additional fee for the use of a credit card to settle outstanding charges, which can add upwards of 3% of the balance to your bill. I) There is another depressing reality hidden within even the largest financial aid packages: Colleges often offer the most generous packages during freshman year as a way to attract new students. My family was careful to ask about the chances of financial aid being taken away after my freshman year. We were assured that, except for low grades or a raise in family income, no money would be taken away. We did not know to ask—and the school did not readily point out—that even if tuition rises, my financial aid package will stay the same. So when my university voted to raise tuition costs 3% at the end of my freshman year, my financial aid package remained the same and I was suddenly responsible for an additional $1,200 for the next year. The university administration will likely vote to raise costs at least once more before my graduation. J) Yes, I chose to attend an expensive university far from my hometown. Yes, there were cheaper options. But there are promising students from struggling families across the nation who should not rule out their dream schools entirely. All things considered, I am paying significantly less than the ticket price of my university, and having an educational experience in Washington, D.C., that I would not have had anywhere else. As a low-income student from a down-and-out Rust Belt community, these educational experiences have enormous potential to brighten my future—and my family''s future. K) The key is to make sure that students and their families understand that hidden costs exist, and that they may prove problematic. Fill out a more comprehensive checklist, and be wary of listed prices that seem too low. Understand just how complicated the financial aid process is. L) Students and families must also understand their ability to self-advocate. They should not pay student bills or excess fees blindly. If something does not look right, ask about it. If it still doesn''t look right, negotiate it. In cases where parents are working multiple jobs, are less knowledgeable about college bureaucracies, have limited English language skills, or are not contributing financially to their child''s education, the burden of self-advocacy will fall on the student. I understand the difficulty, and the embarrassment. But it is necessary. M) In the grand scheme of things, however, colleges also must come to understand that the hidden fees they ask for may prove unmanageable for the very kinds of low-income or first-generation students they are trying desperately to attract.', NULL, NULL, 1027, 'IMPORT', 'cet4-2022-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-1-r2'
);
SET @pg_cet4_2022_12_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-r3', 'CAREFUL_READING', 'CET4', NULL, 'To write his 2010 book, The 5-Factor World Diet, nutritionist Harley Pasternak traveled to the healthiest countries around the world to learn more about what made their meals extra nourishing. He noted that Japanese people ate a wonderful variety of seaweeds, and that Chinese people tried to include at least five different colors in every meal. Pasternak also came away with some valuable observations about how different the North American way of life was, compared with many other countries. For starters, Americans eat much bigger portions than people in other countries. "We don''t prioritize eating seasonally or locally, and we also add lots of salt, sugar and thickening agents to our foods," explained Pasternak. Contrast that to the healthy Mediterranean, Nordic and Okinawan diets listed in Pasternak''s book. They all seem to stick to the ethos(特质) of regional, seasonal produce. For example, a traditional Mediterranean diet includes fruits, vegetables, whole grains, nuts and olive oil as the main components of nutritional intake. Fish, chicken and red wine make moderate appearances, while red meat, salt and sugar are used much less often. The benefits of a traditional Mediterranean diet have been studied since the 1970s, and researchers have found that living that olive oil life can help people lose weight, lower their heart disease risk and reverse diabetes. Most other healthy eating cultures also make meals an event—say, multiple courses around the family table, or a glass or two of red wine at a long lunch—as opposed to hastily wolfing down handfuls of cereal above the kitchen sink and calling it dinner. Each of the healthy eating cultures has its own unique feature. But Pasternak did take note of one unifying factor in all of the healthy societies he observed. "The only overlapping feature in most of these healthy countries is that they all walk way more than the average American," said Pasternak, "So really, regardless of what you''re eating, if someone''s walking four miles more than you each day, they''re going to be a lot thinner and live a lot longer than you."', NULL, NULL, 343, 'IMPORT', 'cet4-2022-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-1-r3'
);
SET @pg_cet4_2022_12_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-r4', 'CAREFUL_READING', 'CET4', NULL, 'Recognizing when a friend or colleague feels sad, angry or surprised is key to getting along with others. But a new study suggests that being sensitive to people''s feelings may sometimes come with an extra dose of stress. This and other research challenge the prevailing view that emotional intelligence is uniformly beneficial to its bearer. In a study, psychologist Myriam Bechtoldt of the Frankfurt School of Finance and Management in Germany asked 166 male university students a series of questions to measure their emotional intelligence. For example, they showed the students photographs of people''s faces and asked them to what extent feelings such as happiness or disgust were being expressed. The students then had to give job talks in front of judges who displayed serious facial expressions. The scientists measured concentrations of stress hormones in the students'' saliva(唾液) before and after the talk. In students who were rated more emotionally intelligent, the stress measures increased more during the experiment and took longer to go back to baseline. The findings suggest that some people may be too emotionally clever for their own good, says Bechtoldt. "Sometimes you can be so good at something that it causes trouble," she notes. Indeed, the study adds to previous research hinting at a dark side of emotional intelligence. A study published in 2002 in Personality and Individual Differences suggested that emotionally perceptive people might be particularly influenced by feelings of depression and hopelessness. Furthermore, several studies have implied that emotional intelligence can be used to manipulate others for personal gains. More research is needed to see how exactly the relation between emotional intelligence and stress would play out in women and in people of different ages and education levels. Nevertheless, emotional intelligence is a useful skill to have, as long as you learn to also properly cope with emotions—both others'' and your own, says Bechtoldt. For example, some sensitive individuals may assume responsibility for other people''s sadness or anger, which ultimately stresses them out. Remember, as Bechtoldt says, "you are not responsible for how other people feel."', NULL, NULL, 342, 'IMPORT', 'cet4-2022-12-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-1-r4'
);
SET @pg_cet4_2022_12_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-1-r4' LIMIT 1);

-- 翻译 cet4-2022-12-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-translation'
);
SET @q_cet4_2022_12_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_01, '在中国农历中，立秋 (Start of Autumn)意味着夏天的结束和秋天的开始。立秋带来的首先是天气的变化，气温逐渐下降。人们看到树叶开始变黄飘落时，知道秋天已经来临，这就是所谓的"一叶知秋"。但此时酷热的天气并未完全结束，高温通常还会持续一段时间，被称为"秋老虎"。立秋对农民意义重大，这时各种秋季作物迅速生长、开始成熟，收获的季节即将到来。', NULL, 'In the Chinese lunar calendar, the Start of Autumn marks the end of summer and the beginning of autumn. It first brings a change in the weather, as temperatures gradually drop. When people see the leaves begin to turn yellow and fall, they know that autumn has arrived; this is the so-called principle that "one falling leaf heralds the coming of autumn." However, the hot weather has not completely ended at this time; high temperatures usually continue for a while, a period known as the "Autumn Tiger." The Start of Autumn is of great significance to farmers, as various autumn crops grow rapidly and begin to ripen at this time, and the harvest season is approaching.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_01
);

-- 听力 Q1 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q01', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q01'
);
SET @q_cet4_2022_12_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_02, NULL, '{"A":"A) Part of its dam wall collapsed.","B":"B) It released a lot of harmful gases.","C":"C) It was destroyed by an earthquake.","D":"D) Some miners were trapped underground."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_02
);

-- 听力 Q2 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q02', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q02'
);
SET @q_cet4_2022_12_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_03, NULL, '{"A":"A) It posed a safety threat to the miners.","B":"B) It caused damage too heavy to assess.","C":"C) It brought the mine''s operations to a halt.","D":"D) It was followed by two more earthquakes."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_03
);

-- 听力 Q3 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q03', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q03'
);
SET @q_cet4_2022_12_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_04, NULL, '{"A":"A) It prepared beds for all the six new citizens.","B":"B) It assigned a team of doctors for each expected baby.","C":"C) It made ample preparations for various possibilities.","D":"D) It brought in the most advanced instruments."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_04
);

-- 听力 Q4 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q04', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q04'
);
SET @q_cet4_2022_12_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_05, NULL, '{"A":"A) They had to undergo 2-3 physical checkups.","B":"B) They were all of normal size except the sixth.","C":"C) They could go home together with their mother a day later.","D":"D) They needed to stay in the hospital for a couple of months."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_05
);

-- 听力 Q5 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q05', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q05'
);
SET @q_cet4_2022_12_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_06, NULL, '{"A":"A) It is owned by the local government.","B":"B) It has been turned into a public park.","C":"C) It has been bought by an American.","D":"D) It is a perfect tourist destination."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_06
);

-- 听力 Q6 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q06', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q06'
);
SET @q_cet4_2022_12_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_07, NULL, '{"A":"A) Its seafood.","B":"B) Its unusual coastline.","C":"C) Its unspoiled beaches.","D":"D) Its architecture."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_07
);

-- 听力 Q7 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q07', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q07'
);
SET @q_cet4_2022_12_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_08, NULL, '{"A":"A) It has an unmatched location.","B":"B) It is worth over 18 million euros.","C":"C) It has beautiful weather all year round.","D":"D) It is an ideal place to meet famous stars."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q08', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q08'
);
SET @q_cet4_2022_12_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_09, NULL, '{"A":"A) She has been attending some group classes.","B":"B) She has registered for two new gym classes.","C":"C) She became a member of the gym two months ago.","D":"D) She is entitled to a discount on all the gym exercises."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_09
);

-- 听力 Q9 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q09', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q09'
);
SET @q_cet4_2022_12_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_10, NULL, '{"A":"A) Considering the promotion of its regular classes.","B":"B) Taking measures to expand its exercise programs.","C":"C) Recruiting coaches for hot yoga and advanced spinning.","D":"D) Offering existing members a discount off two new classes."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_10
);

-- 听力 Q10 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q10', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q10'
);
SET @q_cet4_2022_12_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_11, NULL, '{"A":"A) She missed the deadline for the 10-week course.","B":"B) She missed out on the gym''s general discount.","C":"C) She didn''t sign up for membership in time.","D":"D) She wasn''t so much interested in hot yoga."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_11
);

-- 听力 Q11 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q11', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q11'
);
SET @q_cet4_2022_12_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_12, NULL, '{"A":"A) She doesn''t want to reveal her card details over the phone.","B":"B) She doesn''t think it wise to pay before attending any class.","C":"C) She might have to cancel her registration any minute.","D":"D) She prefers to have the fee added to her monthly bill."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_12
);

-- 听力 Q12 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q12', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q12'
);
SET @q_cet4_2022_12_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_13, NULL, '{"A":"A) To make investments.","B":"B) To sign a business contract.","C":"C) To research new markets.","D":"D) To open a new office."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_13
);

-- 听力 Q13 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q13', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q13'
);
SET @q_cet4_2022_12_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_14, NULL, '{"A":"A) Dubai.","B":"B) Beijing.","C":"C) Amsterdam.","D":"D) Earl''s Court."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_14
);

-- 听力 Q14 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q14', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q14'
);
SET @q_cet4_2022_12_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_15, NULL, '{"A":"A) Rent a bike for him to get around the town.","B":"B) Reserve a meeting room in the head office.","C":"C) Help him prepare his presentation.","D":"D) Send him a map of the hotel area."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_15
);

-- 听力 Q15 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q15', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q15'
);
SET @q_cet4_2022_12_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_16, NULL, '{"A":"A) Bring his projector.","B":"B) Keep all his receipts.","C":"C) Submit his claims form.","D":"D) Pay with his credit card."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_16
);

-- 听力 Q16 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q16', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q16'
);
SET @q_cet4_2022_12_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_17, NULL, '{"A":"A) Whether a country''s educational level is linked to women''s rights.","B":"B) Whether women''s rights are making good progress around the world.","C":"C) Whether a country''s protection of women''s rights is related to its public health.","D":"D) Whether women''s rights are more often overlooked in less-developed countries."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_17
);

-- 听力 Q17 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q17', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q17'
);
SET @q_cet4_2022_12_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_18, NULL, '{"A":"A) Their people still have better health if women''s rights are respected.","B":"B) They must make efforts to increase women''s access to health care.","C":"C) Their people tend to attach importance to women''s rights.","D":"D) They need to invest more in hospital staff and facilities."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_18
);

-- 听力 Q18 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q18', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q18'
);
SET @q_cet4_2022_12_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_19, NULL, '{"A":"A) Their link with a country''s public health.","B":"B) Their potential impact on social progress.","C":"C) Their value to a country''s international image.","D":"D) Their positive effect on economic development."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_19
);

-- 听力 Q19 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q19', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q19'
);
SET @q_cet4_2022_12_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_20, NULL, '{"A":"A) It creates a wonderful setting for dating.","B":"B) It may cause strange physical reactions.","C":"C) It turns parks into picnic sites.","D":"D) It may result in a crowded beach."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_20
);

-- 听力 Q20 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q20', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q20'
);
SET @q_cet4_2022_12_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_21, NULL, '{"A":"A) Breathing difficulty.","B":"B) Bad breath.","C":"C) Excessive sweating.","D":"D) High blood pressure."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_21
);

-- 听力 Q21 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q21', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q21'
);
SET @q_cet4_2022_12_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_22, NULL, '{"A":"A) It protects people against bacteria.","B":"B) It enables people to build up endurance.","C":"C) It accelerates people''s blood circulation.","D":"D) It provides people with extra energy."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_22
);

-- 听力 Q22 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q22', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q22'
);
SET @q_cet4_2022_12_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_23, NULL, '{"A":"A) They are more likely to win in combat sports.","B":"B) They are in the minority among the population.","C":"C) They have a higher chance of joining sports teams.","D":"D) They have more disadvantages in getting ahead."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_23
);

-- 听力 Q23 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q23', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q23'
);
SET @q_cet4_2022_12_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_24, NULL, '{"A":"A) Their brain is more powerful than that of right-handed people.","B":"B) The left side of their brain is more powerful than its right side.","C":"C) They tend to be a lot more aggressive than right-handed people.","D":"D) Their brain has a stronger connection between its two sides."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_24
);

-- 听力 Q24 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q24', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q24'
);
SET @q_cet4_2022_12_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_25, NULL, '{"A":"A) They have a larger brain.","B":"B) It still remains unknown.","C":"C) It is related to their genes.","D":"D) They are better at reasoning."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_25
);

-- 听力 Q25 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q25', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q25'
);
SET @q_cet4_2022_12_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_26, NULL, '{"A":"A) Teach them how to perform tasks with their right hand.","B":"B) Help them fully develop their mathematical abilities.","C":"C) Encourage them to play fast-paced interactive sports.","D":"D) Advise them to choose jobs that require quick reactions."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q26'
);
SET @q_cet4_2022_12_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_27, NULL, '{"A":"A) acknowledge","B":"B) certificates","C":"C) connected","D":"D) demonstrates","E":"E) differences","F":"F) establish","G":"G) formats","H":"H) measured","I":"I) narrow","J":"J) permanent","K":"K) produces","L":"L) ranging","M":"M) relative","N":"N) submitting","O":"O) targeting"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q27'
);
SET @q_cet4_2022_12_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_28, NULL, '{"A":"A) acknowledge","B":"B) certificates","C":"C) connected","D":"D) demonstrates","E":"E) differences","F":"F) establish","G":"G) formats","H":"H) measured","I":"I) narrow","J":"J) permanent","K":"K) produces","L":"L) ranging","M":"M) relative","N":"N) submitting","O":"O) targeting"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q28'
);
SET @q_cet4_2022_12_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_29, NULL, '{"A":"A) acknowledge","B":"B) certificates","C":"C) connected","D":"D) demonstrates","E":"E) differences","F":"F) establish","G":"G) formats","H":"H) measured","I":"I) narrow","J":"J) permanent","K":"K) produces","L":"L) ranging","M":"M) relative","N":"N) submitting","O":"O) targeting"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q29'
);
SET @q_cet4_2022_12_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_30, NULL, '{"A":"A) acknowledge","B":"B) certificates","C":"C) connected","D":"D) demonstrates","E":"E) differences","F":"F) establish","G":"G) formats","H":"H) measured","I":"I) narrow","J":"J) permanent","K":"K) produces","L":"L) ranging","M":"M) relative","N":"N) submitting","O":"O) targeting"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q30'
);
SET @q_cet4_2022_12_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_31, NULL, '{"A":"A) acknowledge","B":"B) certificates","C":"C) connected","D":"D) demonstrates","E":"E) differences","F":"F) establish","G":"G) formats","H":"H) measured","I":"I) narrow","J":"J) permanent","K":"K) produces","L":"L) ranging","M":"M) relative","N":"N) submitting","O":"O) targeting"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q31'
);
SET @q_cet4_2022_12_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_32, NULL, '{"A":"A) acknowledge","B":"B) certificates","C":"C) connected","D":"D) demonstrates","E":"E) differences","F":"F) establish","G":"G) formats","H":"H) measured","I":"I) narrow","J":"J) permanent","K":"K) produces","L":"L) ranging","M":"M) relative","N":"N) submitting","O":"O) targeting"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q32'
);
SET @q_cet4_2022_12_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_33, NULL, '{"A":"A) acknowledge","B":"B) certificates","C":"C) connected","D":"D) demonstrates","E":"E) differences","F":"F) establish","G":"G) formats","H":"H) measured","I":"I) narrow","J":"J) permanent","K":"K) produces","L":"L) ranging","M":"M) relative","N":"N) submitting","O":"O) targeting"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q33'
);
SET @q_cet4_2022_12_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_34, NULL, '{"A":"A) acknowledge","B":"B) certificates","C":"C) connected","D":"D) demonstrates","E":"E) differences","F":"F) establish","G":"G) formats","H":"H) measured","I":"I) narrow","J":"J) permanent","K":"K) produces","L":"L) ranging","M":"M) relative","N":"N) submitting","O":"O) targeting"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q34'
);
SET @q_cet4_2022_12_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_35, NULL, '{"A":"A) acknowledge","B":"B) certificates","C":"C) connected","D":"D) demonstrates","E":"E) differences","F":"F) establish","G":"G) formats","H":"H) measured","I":"I) narrow","J":"J) permanent","K":"K) produces","L":"L) ranging","M":"M) relative","N":"N) submitting","O":"O) targeting"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q35'
);
SET @q_cet4_2022_12_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_36, NULL, '{"A":"A) acknowledge","B":"B) certificates","C":"C) connected","D":"D) demonstrates","E":"E) differences","F":"F) establish","G":"G) formats","H":"H) measured","I":"I) narrow","J":"J) permanent","K":"K) produces","L":"L) ranging","M":"M) relative","N":"N) submitting","O":"O) targeting"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q36'
);
SET @q_cet4_2022_12_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_37, 'Students'' financial aid remains unchanged even when tuition rises.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q37'
);
SET @q_cet4_2022_12_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_38, 'Students may not be able to enjoy their state benefits when they go to college out of the state.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q38'
);
SET @q_cet4_2022_12_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_39, 'The financial aid the author receives is supposed to cover all her college expenses.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q39'
);
SET @q_cet4_2022_12_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_40, 'When the person who damages dorm facilities is not identified, students are required to share the cost.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q40'
);
SET @q_cet4_2022_12_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_41, 'Though it is difficult and embarrassing, students should make inquiries about what fees they have to pay and why.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q41'
);
SET @q_cet4_2022_12_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_42, 'Today, many Americans have to go to college on student loans.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q42'
);
SET @q_cet4_2022_12_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_43, 'Receiving education in a private university in the nation''s capital may change the author''s future life and that of her family''s.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q43'
);
SET @q_cet4_2022_12_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_44, 'Students may no longer be qualified for financial aid if they perform poorly in school or if their family income has increased.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q44'
);
SET @q_cet4_2022_12_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_45, 'In addition to tuition, college students have to pay extra fees for the courses they take.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q45'
);
SET @q_cet4_2022_12_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_46, 'Some schools charge students a fee to their student accounts for using credit cards to pay bills.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q46'
);
SET @q_cet4_2022_12_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_47, 'What characterizes Japanese and Chinese foods?', '{"A":"A) Variety.","B":"B) Flavor.","C":"C) Color.","D":"D) Naturalness."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q47'
);
SET @q_cet4_2022_12_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_48, 'What is typical of Americans in the way of eating?', '{"A":"A) They emphasize nutrition.","B":"B) They tend to eat quite a lot.","C":"C) They prioritize convenience.","D":"D) They care about flavors."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q48'
);
SET @q_cet4_2022_12_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_49, 'What features are in Mediterranean, Nordic and Okinawan diets?', '{"A":"A) Fruits and vegetables.","B":"B) Olive oil and red wine.","C":"C) Seasonal local produce.","D":"D) Unprocessed ingredients."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q49'
);
SET @q_cet4_2022_12_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_50, 'What do people in most healthy eating cultures have in common?', '{"A":"A) They get the whole family to eat at a table.","B":"B) They eat their meals regularly and punctually.","C":"C) They consume plenty of cereal for breakfast.","D":"D) They attach great importance to their meals."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q50'
);
SET @q_cet4_2022_12_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_51, 'Compared with the average American, people in healthy societies ___________.', '{"A":"A) walk at least 4 miles a day","B":"B) do considerably more walking","C":"C) pay more attention to body shape","D":"D) consume a lot more organic food"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q51'
);
SET @q_cet4_2022_12_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_52, 'What is the finding of the new study?', '{"A":"A) Emotional intelligence helps people get along with others.","B":"B) Emotional intelligence is generally beneficial to its bearer.","C":"C) People who are aware of others'' feelings may experience more stress.","D":"D) People who are emotionally stressed may have trouble making friends."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q52'
);
SET @q_cet4_2022_12_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_53, 'What was the purpose of psychologist Myriam Bechtoldt''s experiment?', '{"A":"A) To define different types of human feelings.","B":"B) To assess the impacts of being emotionally clever.","C":"C) To demonstrate how to distinguish different feelings.","D":"D) To identify gender differences in emotional intelligence."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q53'
);
SET @q_cet4_2022_12_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_54, 'What does the finding of Myriam Bechtoldt''s study indicate?', '{"A":"A) Greater emotional cleverness means less trouble in one''s life.","B":"B) Emotional intelligence helps people succeed in job interviews.","C":"C) People''s psychological wellbeing is related to various factors.","D":"D) People may suffer from having a high emotional intelligence"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q54'
);
SET @q_cet4_2022_12_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_55, 'What do we learn about emotional intelligence from a number of studies?', '{"A":"A) People suffering from depression are emotionally immature.","B":"B) People who look at the dark side of life often feel depressed.","C":"C) Some people may take advantage of it and benefit themselves.","D":"D) Some people may lack it and are easily manipulated by others."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-1-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q55'
);
SET @q_cet4_2022_12_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_1_56, 'What does the author suggest sensitive individuals do?', '{"A":"A) Avoid burdening themselves with others'' feelings.","B":"B) Rid themselves of worries over worldly affairs.","C":"C) Learn to cope with people''s negative feelings.","D":"D) Help people to deal with their troubles in life."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_1_56
);

-- ==================== cet4-2022-12-2 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-r1', 'BANKED_CLOZE', 'CET4', NULL, 'Parenting brings fathers more joy than it does mothers, according to a new study. The research examined three studies __26__ more than 18,000 participants. Across all three, parenthood was __27__ with more positive wellbeing outcomes for dads than for mums. So why are fathers happier than mothers? "Fathers may fare better than mothers in part due to how they spend time with their children," said lead author Katherine Nelson-Coffey. In one study, the authors __28__ that dads were more likely to take "playing" as an __29__ activity both when caring for their kids and spending time with their kids. "Playing with their children likely offers parents opportunities to experience positive feelings and __30__ closeness with their children," they say. Fathers also did better than men without kids, reporting greater happiness, life satisfaction, and fewer __31__ symptoms. They also reported greater connectedness and autonomy( 自主). For mums, __32__ , compared to women without children, the results weren''t quite as positive. Mums reported greater autonomy, but also "greater trouble" and fewer positive __33__ . Mums reported happier moods while interacting with their kids, compared to other experiences, but not while engaging __34__ in childcare. "This difference suggests that how mothers and fathers spend time with their children might have important __35__ for their wellbeing," the authors write. They suspect that mums may be less happy than dads because they''re more likely to have higher expectations about parenthood. As such, they''re more likely to be "let down" by the experience.', NULL, '["A) additional","B) associated","C) composing","D) cultivate","E) depressive","F) directly","G) emotions","H) however","I) implications","J) interfered","K) involving","L) note","M) precisely","N) superficial","O) therefore"]', 247, 'IMPORT', 'cet4-2022-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-2-r1'
);
SET @pg_cet4_2022_12_2_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-2-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-r2', 'MATCHING', 'CET4', 'Learning to say no', 'A) Not doing something will always be faster than doing it. This philosophy applies in many areas of life. For example, there is no meeting that goes faster than not having a meeting at all. This is not to say you should never attend another meeting, but the truth is that we say "yes" to too many things we don''t actually want to do. B) How often do people ask you to do something and you just reply, "Sure." Three days later, you''re overwhelmed by how much is on your to-do list. We become frustrated by our obligations even though we were the ones who said "yes" to them in the first place. Even worse, people will occasionally fight to do things that waste time. You don''t have to do something just because it exists. It''s worth asking if things are necessary. Many of them are not, and a simple "no" will be more productive than whatever work the most efficient person can cope with. But if the benefits of saying "no" are so obvious, then why do we say "yes" so often? C) We say "yes" to many requests not because we want to do them, but because we don''t want to be seen as rude or unhelpful. Often, we have to consider saying "no" to someone we will interact with again in the future—our co-worker, our spouse, our family and friends. Saying "no" to our superiors at work can be particularly difficult. In these situations, I like the approach recommended in Essentialism by Greg McKeown. He writes, "Remind your superiors what you would be neglecting if you said ''yes'' and force them to deal with the trade-off. For example, if your manager comes to you and asks you to do X, you can respond with ''Yes, I''m happy to make this the priority. Which of these other projects should I deprioritize to pay attention to this new project?''" D) Collaborating with others is an important element of life. The thought of straining the relationship outweighs the commitment of our time and energy. For this reason, it can be helpful to be gracious in your response. Do whatever favors you can, and be warm-hearted and direct when you have to say no. But even after we have accounted for these social considerations, many of us still seem to do a poor job of managing the trade-off between yes and no. We find ourselves over-committed to things that don''t meaningfully improve or support those around us, and certainly don''t improve our own lives. E) Perhaps one issue is how we think about the meaning of yes and no. The words "yes" and "no" get so often used in comparison with each other that it feels like they carry equal weight in conversation. In reality, they''re not just opposite in meaning, but of entirely different magnitudes in commitment. When you say "no", you''re only saying "no" to one option. When you say "yes", you''re saying "no" to every other option. I like how economist Tim Harford put it, "Every time we say ''yes'' to a request, we''re also saying ''no'' to anything else we might accomplish with the time?" Once you''re committed to something, you''ve already decided how that future block of time will be spent. In other words, saying "no" saves you time in the future. Saying "yes" costs you time in the future. "No" is a form of time credit. You retain the ability to spend your future time however you want. "Yes" is a form of time debt. You have to pay back your commitment at some point. F) "No" is a decision. "Yes" is a responsibility. Saying "no" is sometimes seen as a luxury that only those in power can afford. And it''s true: turning down opportunities is easier when you can fall back on the safety net provided by power, money, and authority. But it''s also true that saying "no" is not merely a privilege reserved for the successful. It''s also a strategy that can help you become successful. Saying "no" is an important skill to develop at any stage of your career because it retains the most important asset in life: your time. As investor Pedro Sorrentino put it, "If you don''t guard your time, people will steal it from you." You need to say "no" to whatever isn''t leading you toward your goals. G) Nobody embodied this idea better than Steve Jobs, who said, "People think focus means saying ''yes'' to the thing you''ve got to focus on. But that''s not what it means at all. It means saying ''no'' to the hundred other good ideas that there are. You have to pick carefully." Jobs had another great quote about saying "no": "I''m actually as proud of the things we haven''t done as the things I have done. Innovation is saying ''no'' to 1,000 things." H) Over time, as you continue to improve and succeed, your strategy needs to change. The opportunity cost of your time increases as you become more successful. At first, you just eliminate the obvious distractions and explore the rest. As your skills improve and you learn to separate what works from what doesn''t, you have to continually increase your threshold for saying "yes". You still need to say "no" to distractions, but you also need to learn to say "no" to opportunities that were previously good uses of time, so you can make space for better uses of time. It''s a good problem to have, but it can be a tough skill to master. I) What is true about health is also true about productivity: an ounce of prevention is worth a pound of cure. More effort is wasted doing things that don''t matter than is wasted doing things inefficiently. And if that is the case, elimination is a more useful skill than optimization. I''m reminded of the famous Peter Drucker quote, "There is nothing so useless as doing efficiently that which should not be done at all."', NULL, NULL, 999, 'IMPORT', 'cet4-2022-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-2-r2'
);
SET @pg_cet4_2022_12_2_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-2-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-r3', 'CAREFUL_READING', 'CET4', NULL, 'We''re eating more fish than ever these days. At around 20 kilograms per person global fish consumption is now more than twice what it was in the 1960s. What''s really remarkable, though, is where that fish comes from. For the first time in human history, most of our aquatic(水产的) food now comes from farming rather than fishing. People ate around 73 million tonnes of farmed fish—just more than half of the volume of fish that humans consumed—in 2014. That''s out of a total fish supply of 167 million tonnes; the remaining 20 million or so tonnes go into things like animal feed and medical products. To keep eating fish at the current rate, we''re definitely going to need to keep aquaculture( 水产养殖) developing. That''s because the volume of fish caught in the wild has leveled off since the 1990s. Back in 1974, only 10% of marine fish stocks had been overfished. Now, more than three-tenths are. Only a tenth of our oceans'' fish stocks could sustain heavier fishing than current levels. But while catchings at sea have suffered, fish-farming has been growing at a fast rate. A lot of that is coming from China, which produces 60% of the world''s farmed fish. In fact, some 35 countries, including China, now produce more farmed than wild-caught fish. This shift toward aquaculture isn''t just good for ensuring salmon(三文鱼) on your plate; it''s also crucial to ensuring food security and sustainability. By 2050, the world will need to feed an estimated 9.7 billion people. They''ll have to get their protein somewhere. However, raising cattle, pigs, and other land-based animals requires vast sums of grain and water. For example, pound for pound, beef requires 15 times more feed to raise than carp, a freshwater fish farmed all over Asia. That grain—and the water needed to grow it—could be consumed by people instead. However, aquaculture is no silver bullet. In some southeast Asian countries, shrimp farming does disastrous damage to marine ecosystems. Despite these problems, however, shrimp continues to be among the most popular sea foods worldwide.', NULL, NULL, 342, 'IMPORT', 'cet4-2022-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-2-r3'
);
SET @pg_cet4_2022_12_2_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-2-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-r4', 'CAREFUL_READING', 'CET4', NULL, 'In 2020, the Nobel Peace Prize was awarded to the World Food Programme (WFP). Why a Nobel Prize for the WFP, and why now? In 2019, the WFP assisted nearly 100 million people in 88 countries. It is the safety net for those who fall off the edge of existence. It is a response to solving the problem of food instability. Its Nobel Prize reminds us all of the moral hazard in imagining that the poor and vulnerable are somebody else''s problem. The WFP has been around since 1961 and has been the global coordinator of nationally based efforts to avoid disasters with food aid. Despite decades of effort to eliminate hunger, the latest estimate is that about 11% of people on the planet (about 820 million people) are suffering daily undernourishment. Progress at reducing undernourishment has stopped despite gains through the 1990s and 2000s. Developed countries sometimes offer food and aid to developing ones, but at a price. One American philosopher stated that addressing the needs of the poor and vulnerable is about more than money—it is mostly about creating conditions under which prosperity and opportunity can thrive. When aid is offered with heavy conditions attached, like loan repayment or food for resources, it often widens the gap between rich and poor and sustains the old world order. This is why the work of the WFP is so vital. The scientific community, however, can provide a helping hand to the WFP. By sharing knowledge of agriculture and climate with peers in countries most vulnerable to poverty and hunger, scientists can help reduce these problems. By making its voice heard, science can lead by example. The ability to overcome food shortages that must be built into some of the poorest countries will not come from loans from wealthy countries, which may have food problems of their own, or world economic institutions. This ability will be built upon self- confident people using open and shared scientific knowledge to pull themselves out of their misery.', NULL, NULL, 333, 'IMPORT', 'cet4-2022-12-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-2-r4'
);
SET @pg_cet4_2022_12_2_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-2-r4' LIMIT 1);

-- 翻译 cet4-2022-12-2
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-translation'
);
SET @q_cet4_2022_12_2_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_01, '立春 (Start of Spring )在中国农历中表示春天的开始。立春之后， 白天变得更长，天气也愈发温暖，万物开始复苏，大地充满生机。人们常说"一年之计在于春"，农民在这个时节开始播种，为全年的丰收打下基础。中国人早在三千年前就己开始在立春这一天举行庆祝活动。数百年来，迎春一直是民间的重要习俗。在春暖花开的日子里，人们常常外出游玩，欣赏春天的美景。', NULL, 'Lichun (Start of Spring) marks the beginning of spring in the Chinese lunar calendar. After Lichun, the days grow longer and the weather becomes warmer; everything comes back to life, and the earth is full of vitality. As people often say, "The whole year''s work depends on a good start in spring." At this time of year, farmers start sowing to lay the foundation for a good harvest throughout the whole year. In fact, the Chinese have started to hold celebrations on this day as early as 3,000 years ago. For centuries, welcoming spring has been an important folk custom. Today, on warm spring days when flowers are in full bloom, people often go out for outings to enjoy the beautiful scenery of spring.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_01
);

-- 听力 Q1 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q01', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q01'
);
SET @q_cet4_2022_12_2_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_02, NULL, '{"A":"A) A free car show.","B":"B) A yearly concert.","C":"C) A sports competition.","D":"D) A pipe band contest."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_02
);

-- 听力 Q2 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q02', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q02'
);
SET @q_cet4_2022_12_2_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_03, NULL, '{"A":"A) Improve the image of Glasgow city.","B":"B) Enrich the local culture of Glasgow.","C":"C) Contribute a lot to the local economy.","D":"D) Entertain people in local communities."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_03
);

-- 听力 Q3 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q03', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q03'
);
SET @q_cet4_2022_12_2_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_04, NULL, '{"A":"A) Surprising rise in global sea levels.","B":"B) Dangerous ice melts in Greenland.","C":"C) Changing weather patterns in summer.","D":"D) Record growth of Greenland''s ice sheets."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_04
);

-- 听力 Q4 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q04', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q04'
);
SET @q_cet4_2022_12_2_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_05, NULL, '{"A":"A) It began in late May.","B":"B) It lasted three months.","C":"C) It started a month earlier than usual.","D":"D) It ended a month earlier than before."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_05
);

-- 听力 Q5 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q05', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q05'
);
SET @q_cet4_2022_12_2_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_06, NULL, '{"A":"A) Bundles of £20 notes kept turning up.","B":"B) A villager was searching for his lost cash.","C":"C) Local policemen came across bundles of £20 notes.","D":"D) A bundle containing thousands of pounds got stolen."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_06
);

-- 听力 Q6 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q06', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q06'
);
SET @q_cet4_2022_12_2_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_07, NULL, '{"A":"A) They give it to charity.","B":"B) They return it to the finder.","C":"C) They hand it over to the local government.","D":"D) They place a notice in The Northern Echo."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_07
);

-- 听力 Q7 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q07', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q07'
);
SET @q_cet4_2022_12_2_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_08, NULL, '{"A":"A) They cooperated well with the police.","B":"B) They enjoyed a fairly affluent life.","C":"C) They were puzzled by the mystery.","D":"D) They had a strong community spirit."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q08', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q08'
);
SET @q_cet4_2022_12_2_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_09, NULL, '{"A":"A) Excited.","B":"B) Delighted.","C":"C) Indifferent.","D":"D) Strange."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_09
);

-- 听力 Q9 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q09', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q09'
);
SET @q_cet4_2022_12_2_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_10, NULL, '{"A":"A) Search for the meaning of their life.","B":"B) Look back on their years at school.","C":"C) Call on their relatives and friends.","D":"D) Talk about future plans with friends."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_10
);

-- 听力 Q10 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q10', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q10'
);
SET @q_cet4_2022_12_2_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_11, NULL, '{"A":"A) He prefers to have them shown on social media.","B":"B) He loves them but does not want to make a fuss. his own.","C":"C) He enjoys celebrating others'' birthdays rather than","D":"D) He looks forward to receiving presents from his close friends."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_11
);

-- 听力 Q11 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q11', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q11'
);
SET @q_cet4_2022_12_2_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_12, NULL, '{"A":"A) Hold it on a modest scale to remove birthday","B":"B) View it as a chance for people to socialize and have fun.","C":"C) Extend invitation to those he trusts most. anxieties.","D":"D) Make it an occasion to collect donations."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_12
);

-- 听力 Q12 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q12', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q12'
);
SET @q_cet4_2022_12_2_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_13, NULL, '{"A":"A) It was absolutely exhausting.","B":"B) There was a terrible smell.","C":"C) There was too long a delay.","D":"D) She got off at the wrong station."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_13
);

-- 听力 Q13 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q13', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q13'
);
SET @q_cet4_2022_12_2_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_14, NULL, '{"A":"A) She hasn''t saved enough money.","B":"B) She is worried about traffic jams.","C":"C) She hasn''t passed the driving test yet.","D":"D) She is used to taking public transport."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_14
);

-- 听力 Q14 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q14', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q14'
);
SET @q_cet4_2022_12_2_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_15, NULL, '{"A":"A) They are popular.","B":"B) They are dangerous.","C":"C) They are a bit expensive for her.","D":"D) They are environmentally friendly."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_15
);

-- 听力 Q15 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q15', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q15'
);
SET @q_cet4_2022_12_2_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_16, NULL, '{"A":"A) By bus.","B":"B) By jogging.","C":"C) By renting a bike.","D":"D) By sharing a ride."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_16
);

-- 听力 Q16 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q16', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q16'
);
SET @q_cet4_2022_12_2_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_17, NULL, '{"A":"A) He is a sign language interpreter.","B":"B) He is a deaf person working in IT.","C":"C) He doesn''t like speaking at meetings.","D":"D) He doesn''t use email or text messages."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_17
);

-- 听力 Q17 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q17', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q17'
);
SET @q_cet4_2022_12_2_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_18, NULL, '{"A":"A) Improved communication skills.","B":"B) Speech recognition technology.","C":"C) Big advances in sign language.","D":"D) Transformation in the IT industry."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_18
);

-- 听力 Q18 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q18', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q18'
);
SET @q_cet4_2022_12_2_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_19, NULL, '{"A":"A) He can avoid being mistaken.","B":"B) He can take notes on the spot.","C":"C) He can understand with ease.","D":"D) He can see the speakers'' images."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_19
);

-- 听力 Q19 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q19', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q19'
);
SET @q_cet4_2022_12_2_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_20, NULL, '{"A":"A) To find pure white walls shining.","B":"B) To enter a house well looked after.","C":"C) To get a hug from family members.","D":"D) To see cheerful colours all around."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_20
);

-- 听力 Q20 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q20', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q20'
);
SET @q_cet4_2022_12_2_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_21, NULL, '{"A":"A) Choosing a colour because it is fashionable.","B":"B) Painting the interior of their cupboards.","C":"C) Doing the painting job all by themselves.","D":"D) Designing all window frames the same way."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_21
);

-- 听力 Q21 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q21', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q21'
);
SET @q_cet4_2022_12_2_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_22, NULL, '{"A":"A) Fit most of the cupboards into walls.","B":"B) Hang landscape paintings all around.","C":"C) Match the room''s ceiling with all the furniture in colour.","D":"D) Paint the wooden frameworks and walls the same colour."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_22
);

-- 听力 Q22 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q22', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q22'
);
SET @q_cet4_2022_12_2_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_23, NULL, '{"A":"A) Children must read at least 3 times a week.","B":"B) Reading is a habit every child can develop.","C":"C) Reading to their children is important.","D":"D) Children should start reading at age 3."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_23
);

-- 听力 Q23 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q23', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q23'
);
SET @q_cet4_2022_12_2_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_24, NULL, '{"A":"A) The number of books they have read by age four.","B":"B) The speed of their brain development in infancy.","C":"C) The number and quality of books parents read to them in infancy.","D":"D) The quality and quantity of time parents spend playing with them."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_24
);

-- 听力 Q24 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q24', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q24'
);
SET @q_cet4_2022_12_2_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_25, NULL, '{"A":"A) Books with specifically labeled images.","B":"B) Books with pictures of dolls and toys.","C":"C) Books describing the lives of animals.","D":"D) Books telling very interesting stories."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_25
);

-- 听力 Q25 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q25', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q25'
);
SET @q_cet4_2022_12_2_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_26, NULL, '{"A":"A) Read as many books as possible to their children.","B":"B) Choose carefully what to read to their children.","C":"C) Share experience with other parents.","D":"D) Create picture books for their children."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q26'
);
SET @q_cet4_2022_12_2_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_27, NULL, '{"A":"A) additional","B":"B) associated","C":"C) composing","D":"D) cultivate","E":"E) depressive","F":"F) directly","G":"G) emotions","H":"H) however","I":"I) implications","J":"J) interfered","K":"K) involving","L":"L) note","M":"M) precisely","N":"N) superficial","O":"O) therefore"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q27'
);
SET @q_cet4_2022_12_2_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_28, NULL, '{"A":"A) additional","B":"B) associated","C":"C) composing","D":"D) cultivate","E":"E) depressive","F":"F) directly","G":"G) emotions","H":"H) however","I":"I) implications","J":"J) interfered","K":"K) involving","L":"L) note","M":"M) precisely","N":"N) superficial","O":"O) therefore"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q28'
);
SET @q_cet4_2022_12_2_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_29, NULL, '{"A":"A) additional","B":"B) associated","C":"C) composing","D":"D) cultivate","E":"E) depressive","F":"F) directly","G":"G) emotions","H":"H) however","I":"I) implications","J":"J) interfered","K":"K) involving","L":"L) note","M":"M) precisely","N":"N) superficial","O":"O) therefore"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q29'
);
SET @q_cet4_2022_12_2_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_30, NULL, '{"A":"A) additional","B":"B) associated","C":"C) composing","D":"D) cultivate","E":"E) depressive","F":"F) directly","G":"G) emotions","H":"H) however","I":"I) implications","J":"J) interfered","K":"K) involving","L":"L) note","M":"M) precisely","N":"N) superficial","O":"O) therefore"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q30'
);
SET @q_cet4_2022_12_2_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_31, NULL, '{"A":"A) additional","B":"B) associated","C":"C) composing","D":"D) cultivate","E":"E) depressive","F":"F) directly","G":"G) emotions","H":"H) however","I":"I) implications","J":"J) interfered","K":"K) involving","L":"L) note","M":"M) precisely","N":"N) superficial","O":"O) therefore"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q31'
);
SET @q_cet4_2022_12_2_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_32, NULL, '{"A":"A) additional","B":"B) associated","C":"C) composing","D":"D) cultivate","E":"E) depressive","F":"F) directly","G":"G) emotions","H":"H) however","I":"I) implications","J":"J) interfered","K":"K) involving","L":"L) note","M":"M) precisely","N":"N) superficial","O":"O) therefore"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q32'
);
SET @q_cet4_2022_12_2_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_33, NULL, '{"A":"A) additional","B":"B) associated","C":"C) composing","D":"D) cultivate","E":"E) depressive","F":"F) directly","G":"G) emotions","H":"H) however","I":"I) implications","J":"J) interfered","K":"K) involving","L":"L) note","M":"M) precisely","N":"N) superficial","O":"O) therefore"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q33'
);
SET @q_cet4_2022_12_2_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_34, NULL, '{"A":"A) additional","B":"B) associated","C":"C) composing","D":"D) cultivate","E":"E) depressive","F":"F) directly","G":"G) emotions","H":"H) however","I":"I) implications","J":"J) interfered","K":"K) involving","L":"L) note","M":"M) precisely","N":"N) superficial","O":"O) therefore"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q34'
);
SET @q_cet4_2022_12_2_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_35, NULL, '{"A":"A) additional","B":"B) associated","C":"C) composing","D":"D) cultivate","E":"E) depressive","F":"F) directly","G":"G) emotions","H":"H) however","I":"I) implications","J":"J) interfered","K":"K) involving","L":"L) note","M":"M) precisely","N":"N) superficial","O":"O) therefore"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q35'
);
SET @q_cet4_2022_12_2_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_36, NULL, '{"A":"A) additional","B":"B) associated","C":"C) composing","D":"D) cultivate","E":"E) depressive","F":"F) directly","G":"G) emotions","H":"H) however","I":"I) implications","J":"J) interfered","K":"K) involving","L":"L) note","M":"M) precisely","N":"N) superficial","O":"O) therefore"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q36'
);
SET @q_cet4_2022_12_2_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_37, 'People often grant a request just because they want to appear polite and helpful.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q37'
);
SET @q_cet4_2022_12_2_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_38, 'It''s no easy job learning to say "no" to opportunities that were once considered worth grasping.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q38'
);
SET @q_cet4_2022_12_2_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_39, 'When you decline a request, you are saving your future time.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q39'
);
SET @q_cet4_2022_12_2_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_40, 'People sometimes struggle to do things that are simply a waste of time.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q40'
);
SET @q_cet4_2022_12_2_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_41, 'Doing efficiently what is not worth doing is the most useless effort.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q41'
);
SET @q_cet4_2022_12_2_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_42, 'It is especially difficult for people to decline to do what their superiors ask them to do.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q42'
);
SET @q_cet4_2022_12_2_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_43, 'People agree to do too many things they are in fact unwilling to do.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q43'
);
SET @q_cet4_2022_12_2_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_44, 'According to one famous entrepreneur, innovation means refusal to do an enormous number of things.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q44'
);
SET @q_cet4_2022_12_2_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_45, 'It is an essential aspect of life to cooperate with other people.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q45'
);
SET @q_cet4_2022_12_2_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_46, 'Refusing a request is sometimes seen as a privilege not enjoyed by ordinary people.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q46'
);
SET @q_cet4_2022_12_2_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_47, 'What does the author say is remarkable about the fish we eat?', '{"A":"A) They reproduce quickly.","B":"B) They are mostly farmed.","C":"C) They have become as important as grain.","D":"D) They have a longer history than humans."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q47'
);
SET @q_cet4_2022_12_2_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_48, 'What do we need to do if we keep consuming fish at the current rate?', '{"A":"A) Increase the fishing volume considerably.","B":"B) Develop more advanced fishing technology.","C":"C) Enlarge the marine fish stocks effectively.","D":"D) Expand the scale of fish-farming continuously."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q48'
);
SET @q_cet4_2022_12_2_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_49, 'What does the author say about China in terms of aquatic food?', '{"A":"A) It places increasing emphasis on fishing now.","B":"B) It boasts of the world''s largest fishing stocks.","C":"C) It raises more fish than caught from the wild.","D":"D) It supplies 60% of the world''s fish products."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q49'
);
SET @q_cet4_2022_12_2_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_50, 'Why does the author say aquaculture is so important these days?', '{"A":"A) It is a must for feeding the world''s fast-growing population.","B":"B) It proves a reliable source of protein for humans and animals","C":"C) It is essential to maintaining both mental and physical health.","D":"D) It ensures a balanced healthy diet for people the world over."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q50'
);
SET @q_cet4_2022_12_2_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_51, 'What does the author imply by saying aquaculture is no silver bullet?', '{"A":"A) Shrimp-farming is a risky business.","B":"B) Fish-farming will not be sustainable.","C":"C) Fish-farming may cause serious problems too.","D":"D) Shrimp-farming can become quite expensive."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q51'
);
SET @q_cet4_2022_12_2_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_52, 'What does the WFP''s winning of the Nobel Peace Prize make us realize?', '{"A":"A) More and more people in the world are suffering from starvation.","B":"B) All of us can be affected by food instability one way or another.","C":"C) It is hazardous to leave millions of people poor and vulnerable.","D":"D) It is morally wrong to think helping the poor is not our business."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q52'
);
SET @q_cet4_2022_12_2_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_53, 'What do we learn about the WFP''s effort to eliminate hunger?', '{"A":"A) It has ensured a sufficient food supply to millions.","B":"B) It is still far from its goal despite the progress made.","C":"C) It has done a good job in combating natural disasters.","D":"D) It is preventing starvation occurring on a global scale."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q53'
);
SET @q_cet4_2022_12_2_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_54, 'What will happen when food aid is offered at a price?', '{"A":"A) The rich will become richer and the poor poorer.","B":"B) More people will be willing to join in the effort.","C":"C) More food will be made available to the needy.","D":"D) The relief effort will be rendered less sustainable."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q54'
);
SET @q_cet4_2022_12_2_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_55, 'How can scientists help cope with poverty and hunger?', '{"A":"A) By collaborating closely with world economic institutions.","B":"B) By sharing expertise with peers in poverty-stricken nations.","C":"C) By setting up more food research programs in developing countries.","D":"D) By building self-respect in people suffering from undernutrition."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-2-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q55'
);
SET @q_cet4_2022_12_2_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-2-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_2_56, 'What message does the author try to convey at the end of the passage?', '{"A":"A) Wealthy nations should solve their own food problems first.","B":"B) Rich countries should be more generous in providing food aid.","C":"C) Poor nations should enhance their own ability to solve their food shortages.","D":"D) World economic institutions should play a bigger role in fighting hunger."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_2_56
);

-- ==================== cet4-2022-12-3 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-r1', 'BANKED_CLOZE', 'CET4', NULL, 'Phones influence all aspects of teenage life. Ninety-five percent of Americans ages 13 to 17 have a smartphone or have access to one, and nearly half report using the internet "almost __26__ ." But as recent survey data and interviews have suggested, many teens find much of that time to be unsatisfyingly spent. Continuous __27__ shouldn''t be mistaken for endless enjoyment. A new __28__ representative survey about "screen time and device distractions" from the Pew Research Center indicates that it''s not just parents who think teenagers are worryingly __29__ from their phones—many teens themselves do too. Fifty-four percent of the 13- to 17-year-olds surveyed said they spend too much time __30__ in their phones. Vicky Rideout, who runs a research firm that studies children''s interactions with media and technology, was not surprised by this finding. She says it''s hardly __31__ to teenagers. "They are dealing with the same challenges that adults are, as far as they are living in the __32__ of a tech environment designed to suck as much of their time onto their devices as possible," Rideout says. The way parents interact with technology can __33__ the way they interact with their kids. Rideout thus thinks it''s up to parents to model good __34__ : Kids tend to take note if their parents put their phone away at dinner or charge it in another room while they sleep. Witnessing habits like that can help kids "realize that they can __35__ some more control over their devices," she says.', NULL, '["A) absorbed","B) addicted","C) behavior","D) constantly","E) context","F) exercise","G) inseparable","H) nationally","I) recruited","J) shape","K) solution","L) specific","M) summary","N) usage","O) vaguely"]', 250, 'IMPORT', 'cet4-2022-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-3-r1'
);
SET @pg_cet4_2022_12_3_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-3-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-r2', 'MATCHING', 'CET4', 'Evil Genius', 'A) A few years ago I found myself teaching a university class on evil. It was for third-year criminology students to help them contextualize theory and research within controversial current topics. It was a huge success. The debates were heated and interesting. I could see people''s views change within the course of a single lecture. Over the past 13 years, as a student, lecturer and researcher, I''ve enjoyed discussing the science of evil with anyone willing to listen. What I like most is destroying the cliche(陈词滥调) of good and evil, and replacing them with scientific insight. We need a more informed way of discussing behavior that at first we cannot, or should not, begin to understand. B) Without understanding, we risk dehumanizing others, writing off human beings simply because we don''t comprehend them. We must try to understand what we have labeled evil. We tend to think evil is something that other people are. We think of ourselves as "good people", and even when we do morally wrong things, we understand the context of our decisions. With others, however, it is far easier to write them off. If their actions deviate(偏离) substantially from what we consider acceptable, we may label them evil. We need to be careful with this. Calling someone evil is often similar to saying they cannot change, and perhaps aren''t even a human at all. However, when you actually go monster-hunting, and you look deeply at the people behind shocking behavior, you may be surprised. C) As a child I used to love the Scooby-Doo cartoons. Arriving in their "Mystery Machine", the gang would have to find a monster who was terrorizing a neighborhood. They would run around looking for clues and at the end unmask the bad guy. It was always a normal person in a costume. There were no monsters. Like the Scooby crew, we may find ourselves hunting for an easy fix, one word for people who do bad things. But if we take a good look, the word "evil" is insufficient—there are no simple explanations for why humans do bad things: instead there are many, and they are all marvelously different. D) Evil is typically referred to when there is deviance from social norms: formal deviance is the violation of laws, like theft, murder, and attacks, while informal deviance involves violations of social norms, like lying. Evil behavior is typically thought to embrace one or both forms. However, deviance can also describe a behavior that simply differs from the norm. E) Perhaps this is where we can find the good side of our bad side. Deviating from the norm can make us villains(恶棍), but it can also make us heroes. A child deviates from social pressures when they stand up for another child being bullied in school. A soldier deviates when they choose not to follow orders to kill an innocent civilian. An employee in a big tech company deviates when they expose its wrongdoings. F) Creativity is also a deviation. Here, too, things are complex. Thinking creatively has given us modern medicine, technology and modern political structures, but it has also given us poison and nuclear weapons. Great benefit and great harm can come from the same human tendency. G) In a research paper, Evil Genius, published in 2014, the behavioral scientists Francesca Gino and Scott Wiltermuth wanted to examine whether people who behave unethically in one task are more creative than others on a subsequent task, even after controlling for differences in baseline creative skills. The unethical behavior they chose was dishonesty. H) Over five experiments, researchers gave participants tasks in which they could cheat. In one study, they were given matrices(矩阵) and had to find two numbers that added up to 10. Participants were asked to self-report how well they did at the end of the study: 59% cheated by saying that they solved more matrices than they actually had. I) After each task, the researchers measured participants'' performance on the Remote Associates Test. This shows participants three words at a time that appear to be unrelated, and the person has to think of a fourth word that is associated with all of them. For example, you might get "Fox, Man, Peep", or "Dust, Cereal, Fish". In order to find the linking words ("Hole" for the first, "Bowl" for the second) you need to be creative. The more you get right, the more creative you are thought to be because you have come up with uncommon associations. J) For every one of the five studies, they found the same thing—participants who cheated in the first task did better on the creativity task. Why? Like other forms of unethical behavior, lying means breaking rules. It involves being deviant, going against the social principle that people should tell the truth. Similarly, being creative involves "thinking outside the box", deviating from expectations. They involve similar thought patterns, so stimulating one stimulates the other. Can we learn from this? Perhaps. To be more creative, we could try lying in a controlled environment. Find online logic games and cheat at them, play Scrabble(拼字游 戏) with a dictionary, or write a story about something that is untrue? Such tasks can get our brains thinking flexibly, beyond our normal comfort zone. This is not a call to become a compulsive(强迫性的) liar, but a controlled liar. K) In addition to benefits for creativity, deviance can be a good thing in other ways. Even Philip Zimbardo, the author of the Stanford prison experiment, who showed how easily we can be led to behave badly, believes that the future of deviance research may lie more in understanding extreme pro-social behavior, such as heroism. Like evil, we often view heroism as only a possibility for outliers—for people who are abnormal. But Zimbardo asks: "What if the capability to act heroically is also fundamentally ordinary and available to all of us?" Some say we should never meet our heroes, lest they disappoint us when we find out how normal they are. But this should be liberating, not disappointing. We are all capable of behaving like outliers. It''s time for us to understand deviance, and realize its potential for good as well as for harm.', NULL, NULL, 1032, 'IMPORT', 'cet4-2022-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-3-r2'
);
SET @pg_cet4_2022_12_3_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-3-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-r3', 'CAREFUL_READING', 'CET4', NULL, 'Even though we are living in an age where growing old is thought of as an inevitable misery, this doctor has been changing the game for seniors over the last 25 years. It all started in 1991 when the Harvard-educated physician was transferred from working in a stressful emergency room to being the medical director of a nursing home in upstate New York. The depressing and regimented(严格管制的) environment got him thinking on what exactly could improve the residents'' conditions. Even though animals in nursing homes were illegal at the time, Dr. Bill Thomas took a chance. Based on a hunch(直觉), he brought in two dogs, four cats, hens, rabbits, 100 birds, a multitude of plants, a flower garden, and a vegetable patch. The change was dramatic. There was a 50% drop in medical prescriptions along with a dramatic decrease in death rates—but most importantly, the residents were simply happier. Dr. Thomas''s approach, named the Eden Alternative, has driven nursing homes to allow a more autonomous( 自主的) and creative living space for their elderly. It erases the belief that growing old means growing useless. He encourages residents to think of their age as an enriching new phase of life rather than the end of it. Thomas, now a speaker and author of several books, also created small, independently-run residences with their own bedrooms and bathrooms, and he has been preaching a singular message that getting old is not a bad thing. "Within six weeks, they had to send a truck around to pick up all the wheelchairs," Thomas told the Washington Post. "You know why most people in nursing homes use wheelchairs? Because the buildings are so big." The 56-year-old doctor''s methods have been adopted in Australia, Japan, Canada, and America with enormous success. Last year he published Second Wind: Navigating the Passage to a Slower, Deeper, and More Connected Life, a guide on how to shift our perspectives on aging and growth. He is currently traveling through North America performing with his guitar and his enthusiasm on his Age of Disruption Tour.', NULL, NULL, 342, 'IMPORT', 'cet4-2022-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-3-r3'
);
SET @pg_cet4_2022_12_3_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-3-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-r4', 'CAREFUL_READING', 'CET4', NULL, 'Research shows that in developed countries, more affluent and educated people tend to consume higher- quality diets—including more fruits and vegetables, fish and whole grains. On the contrary, economically disadvantaged people report diets that are nutrient-poor and energy-dense. They are less likely to have food- purchasing habits that conform to public health recommendations. These dietary differences are often accompanied by higher rates of obesity and diabetes among lower-income people. This relationship between social class and diet quality and health is extensively documented. However, the research does not explain why this is the case—a question that has significant implications for designing effective policies and initiatives to improve diets and prevent chronic diseases. Public-health initiatives to promote healthy diets often focus on providing nutrition education and recipes(食 谱). These approaches, however, often presume less food literacy (i.e., food knowledge and skills) among low- income people. Are unhealthy diets really the result of poor choices, limited food skills and knowledge? Research suggests that adults in food-insecure households are just as likely as those in food-secure households to adjust recipes to make them more healthy. They are also just as proficient in food preparation and cooking skills. There is no indication that increasing food skills or budgeting skills will reduce food insecurity. Instead, disadvantaged groups are constrained by their economic, material and social circumstances. For example, low income is the strongest predictor of food insecurity in Canada, where one in eight households experiences insufficient access to nutritious foods. It''s well-established that food prices are an important determinant of food choice. Low-income households report that they find it difficult to adopt dietary guidelines because food prices are a barrier to improving their diets. When researchers estimate the cost of diets people actually eat, higher-quality diets are typically more costly. While this may be so, it does not, in itself, prove that healthy diets are necessarily more expensive or cost- prohibitive. After all, not all socioeconomically disadvantaged people consume poor diets. We can easily think of a number of foods and recipes that are both inexpensive and nutritious. The internet is full of recipes for "eating well on a budget."', NULL, NULL, 354, 'IMPORT', 'cet4-2022-12-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-3-r4'
);
SET @pg_cet4_2022_12_3_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2022-12-3-r4' LIMIT 1);

-- 翻译 cet4-2022-12-3
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-translation'
);
SET @q_cet4_2022_12_3_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_01, '冬至(Winter Solstice)是全年白昼最短、黑夜最长的一天，标志着一年中最寒冷时节的开始。冬至过后，气温越来越低，人们的户外活动逐渐减少。农民地里活儿不多，主要忙于灌溉系统的维护和农作物的防冻，同时为来年春天播种做准备。 中国人历来很重视冬至，许多地方都把冬至当作一个节日，庆祝方式各地不尽相同。北方人有冬至吃饺子(jiaozi)的习俗，南方人有冬至吃汤圆(tangyuan)的传统。', NULL, 'The Winter Solstice is the day on which daytime is the shortest and night is the longest in the whole year, marking the beginning of the coldest period of the year. After the Winter Solstice, the temperature drops lower and lower, and people''s outdoor activities gradually decrease. Since there is not much work to do in the fields, farmers are mainly busy with maintaining the irrigation system and protecting crops from freezing, while preparing for next spring''s sowing. Chinese people have always attached great importance to the Winter Solstice and regard it as a festival in many places, though the ways of celebrating it vary from place to place. Northerners have the custom of eating jiaozi on the Winter Solstice, while Southerners have the tradition of eating tangyuan on this day.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_01
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q26'
);
SET @q_cet4_2022_12_3_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_02, NULL, '{"A":"A) absorbed","B":"B) addicted","C":"C) behavior","D":"D) constantly","E":"E) context","F":"F) exercise","G":"G) inseparable","H":"H) nationally","I":"I) recruited","J":"J) shape","K":"K) solution","L":"L) specific","M":"M) summary","N":"N) usage","O":"O) vaguely"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_02
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q27'
);
SET @q_cet4_2022_12_3_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_03, NULL, '{"A":"A) absorbed","B":"B) addicted","C":"C) behavior","D":"D) constantly","E":"E) context","F":"F) exercise","G":"G) inseparable","H":"H) nationally","I":"I) recruited","J":"J) shape","K":"K) solution","L":"L) specific","M":"M) summary","N":"N) usage","O":"O) vaguely"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_03
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q28'
);
SET @q_cet4_2022_12_3_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_04, NULL, '{"A":"A) absorbed","B":"B) addicted","C":"C) behavior","D":"D) constantly","E":"E) context","F":"F) exercise","G":"G) inseparable","H":"H) nationally","I":"I) recruited","J":"J) shape","K":"K) solution","L":"L) specific","M":"M) summary","N":"N) usage","O":"O) vaguely"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_04
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q29'
);
SET @q_cet4_2022_12_3_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_05, NULL, '{"A":"A) absorbed","B":"B) addicted","C":"C) behavior","D":"D) constantly","E":"E) context","F":"F) exercise","G":"G) inseparable","H":"H) nationally","I":"I) recruited","J":"J) shape","K":"K) solution","L":"L) specific","M":"M) summary","N":"N) usage","O":"O) vaguely"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_05
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q30'
);
SET @q_cet4_2022_12_3_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_06, NULL, '{"A":"A) absorbed","B":"B) addicted","C":"C) behavior","D":"D) constantly","E":"E) context","F":"F) exercise","G":"G) inseparable","H":"H) nationally","I":"I) recruited","J":"J) shape","K":"K) solution","L":"L) specific","M":"M) summary","N":"N) usage","O":"O) vaguely"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_06
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q31'
);
SET @q_cet4_2022_12_3_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_07, NULL, '{"A":"A) absorbed","B":"B) addicted","C":"C) behavior","D":"D) constantly","E":"E) context","F":"F) exercise","G":"G) inseparable","H":"H) nationally","I":"I) recruited","J":"J) shape","K":"K) solution","L":"L) specific","M":"M) summary","N":"N) usage","O":"O) vaguely"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_07
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q32'
);
SET @q_cet4_2022_12_3_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_08, NULL, '{"A":"A) absorbed","B":"B) addicted","C":"C) behavior","D":"D) constantly","E":"E) context","F":"F) exercise","G":"G) inseparable","H":"H) nationally","I":"I) recruited","J":"J) shape","K":"K) solution","L":"L) specific","M":"M) summary","N":"N) usage","O":"O) vaguely"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_08
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q33'
);
SET @q_cet4_2022_12_3_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_09, NULL, '{"A":"A) absorbed","B":"B) addicted","C":"C) behavior","D":"D) constantly","E":"E) context","F":"F) exercise","G":"G) inseparable","H":"H) nationally","I":"I) recruited","J":"J) shape","K":"K) solution","L":"L) specific","M":"M) summary","N":"N) usage","O":"O) vaguely"}', 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_09
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q34'
);
SET @q_cet4_2022_12_3_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_10, NULL, '{"A":"A) absorbed","B":"B) addicted","C":"C) behavior","D":"D) constantly","E":"E) context","F":"F) exercise","G":"G) inseparable","H":"H) nationally","I":"I) recruited","J":"J) shape","K":"K) solution","L":"L) specific","M":"M) summary","N":"N) usage","O":"O) vaguely"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_10
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q35'
);
SET @q_cet4_2022_12_3_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_11, NULL, '{"A":"A) absorbed","B":"B) addicted","C":"C) behavior","D":"D) constantly","E":"E) context","F":"F) exercise","G":"G) inseparable","H":"H) nationally","I":"I) recruited","J":"J) shape","K":"K) solution","L":"L) specific","M":"M) summary","N":"N) usage","O":"O) vaguely"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_11
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q36'
);
SET @q_cet4_2022_12_3_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_12, 'A behavior that does not conform to social norms may be described as being deviant.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_12
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q37'
);
SET @q_cet4_2022_12_3_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_13, 'Various experiments found that participants who cheated in the initial task performed better in the creativity test.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_13
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q38'
);
SET @q_cet4_2022_12_3_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_14, 'People may be simply considered evil if their behaviors are morally unacceptable to us.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_14
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q39'
);
SET @q_cet4_2022_12_3_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_15, 'The research published by two scientists was intended to examine the relationship between dishonesty and creativity.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_15
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q40'
);
SET @q_cet4_2022_12_3_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_16, 'The author''s lectures sparked lively discussions in his class.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_16
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q41'
);
SET @q_cet4_2022_12_3_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_17, 'The researchers tested the participants'' creativity by asking them to play a word game.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_17
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q42'
);
SET @q_cet4_2022_12_3_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_18, 'It is time we realized that deviance may be capable of doing both good and harm to individuals and society.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_18
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q43'
);
SET @q_cet4_2022_12_3_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_19, 'The reasons for people''s evil behaviors can be explained in more ways than one.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_19
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q44'
);
SET @q_cet4_2022_12_3_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_20, 'The math task in one experiment was designed to test participants'' tendency to cheat.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_20
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q45'
);
SET @q_cet4_2022_12_3_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_21, 'Some creative ideas have turned out to do harm to human society.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_21
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q46'
);
SET @q_cet4_2022_12_3_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_22, 'What has Bill Thomas been doing for a quarter of a century?', '{"A":"A) Transforming people''s lifestyle.","B":"B) Honoring his Harvard education.","C":"C) Changing people''s philosophy of life.","D":"D) Shifting people''s perspective on aging."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_22
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q47'
);
SET @q_cet4_2022_12_3_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_23, 'Why did Bill Thomas try something different in the nursing home?', '{"A":"A) He wanted to make it more pleasant for seniors.","B":"B) He wanted to apply his Harvard training to practice.","C":"C) He felt it his duty to revolutionize its management.","D":"D) He felt disappointed working in the environment."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_23
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q48'
);
SET @q_cet4_2022_12_3_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_24, 'What do we learn about Bill Thomas bringing animals and plants into the nursing home?', '{"A":"A) He made a mess of the nursing home.","B":"B) He did something all professionals would do.","C":"C) He won instant support from the state authorities.","D":"D) He acted in violation of the state law."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_24
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q49'
);
SET @q_cet4_2022_12_3_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_25, 'What has Bill Thomas been persistently advocating?', '{"A":"A) Good health is not just a privilege of the young.","B":"B) Nursing homes should be strictly limited in size.","C":"C) Getting old is by no means something miserable.","D":"D) Residences for seniors should be run independently."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_25
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q50'
);
SET @q_cet4_2022_12_3_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_26, 'How is Bill Thomas''s new concept received?', '{"A":"A) It is gaining ground in many countries.","B":"B) It is being heatedly debated worldwide.","C":"C) It is considered revolutionary everywhere.","D":"D) It is winning approval from the government."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_26
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q51'
);
SET @q_cet4_2022_12_3_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_27, 'What can we learn from research on diets in developed countries?', '{"A":"A) Dietary recommendations are not fit for underprivileged people.","B":"B) People from different social groups vary in their dietary habits.","C":"C) People''s choice of food depends on their individual taste","D":"D) There is no consensus on what high-quality diets are."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_27
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q52'
);
SET @q_cet4_2022_12_3_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_28, 'What does the author say is important in formulating policies to improve diets and health?', '{"A":"A) A better understanding of the relationship between social class and health.","B":"B) A greater emphasis on studying the cause of obesity and chronic diseases.","C":"C) Prioritizing the provision of better nutrition for lower classes.","D":"D) Designing education programs and initiatives on public health."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_28
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q53'
);
SET @q_cet4_2022_12_3_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_29, 'What does research reveal about adults in food-insecure households?', '{"A":"A) Their eating habits need to be changed.","B":"B) Their food literacy has been improving.","C":"C) They do not pay much attention to their food recipes.","D":"D) They do not lack food knowledge or budgeting skills."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_29
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q54'
);
SET @q_cet4_2022_12_3_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_30, 'What would help improve food security among the disadvantaged groups in Canada?', '{"A":"A) Teaching them budgeting skills.","B":"B) Increasing their food choices.","C":"C) Enabling them to have more access to nutritious foods.","D":"D) Taking more effective measures to increase food supplies."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_30
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2022-12-3-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2022_12_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2022-12-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q55'
);
SET @q_cet4_2022_12_3_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2022-12-3-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2022_12_3_31, 'What does the author suggest disadvantaged people do to improve their health?', '{"A":"A) Adopt a positive attitude towards dietary guidelines.","B":"B) Choose diets that are both healthy and affordable.","C":"C) Make sure to purchase healthy foods on the internet.","D":"D) Change their eating habits and consumption patterns."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2022_12_3_31
);

-- ==================== cet4-2023-03-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-r1', 'BANKED_CLOZE', 'CET4', NULL, 'It''s a fantasy that goes back centuries: a message in a bottle, carried ashore from far-off lands. Authors, artists and children __26__ have dreamed of such a gift from the sea. This time, though, it''s not a bottle that washes ashore. It''s eggs—thousands of little toy eggs. That''s what happened on the German island of Langeoog this week. Lying just off the North Sea coast, it found itself __27__ by an invasion of colored plastic eggs—much to the __28__ of local children, because the eggs contained toys. Police __29__ the eggs came from a freighter that lost part of its cargo during an unusually __30__ storm, the worst to hit Germany''s northeastern coast since 2006. At any rate, what was lost has now been found by many of the community''s littlest residents. "The surprise eggs have found their way to freedom," said Mayor Uwe Garrels. However, the joy of the moment __31__ off soon. "At first I thought this was a wonder, because everything was so __32__ , but then we realized that this is a huge __33__ in the end," said the mayor. He also noted the plastic bags and other materials that have washed ashore on the island can cause serious problems for __34__ . Still, all these little eggs contained an extra treat with their toys. They __35__ notes from afar. There was just one problem for the German children who received them: They were written in Russian.', NULL, '["A) wore","B) wildlife","C) suspect","D) struck","E) similar","F) quantity","G) overthrown","H) mess","I) intense","J) human","K) effective","L) delight","M) colorful","N) bore","O) alike"]', 241, 'IMPORT', 'cet4-2023-03-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-03-1-r1'
);
SET @pg_cet4_2023_03_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-03-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-r2', 'MATCHING', 'CET4', 'Hyphenating your last name after marriage?', 'A) Congratulations on deciding to get married! While being married is great and wonderful, the act of getting married can be quite stressful. There is the planning of the ceremony itself, the merging( 合并) of two households and all of the details involved in that. You also have to take the time to apply for your marriage license and then decide whether or not you are going to keep your last name or change it. B) This is where a lot of people have trouble. Once upon a time, it was just customary for a bride to take her groom''s last name as her own and abandon her maiden name completely. The act of keeping her own last name was considered taboo(禁忌) and people''s eyebrows would raise right off their faces when they found out that the bride was even considering something so radical. Over time, though, more and more women are deciding to keep their last names. C) There are a lot of reasons to want to keep your own last name. Hopefully you have a supportive groom who understands why this idea is the most appealing to you. A lot of times, though, the act of keeping your name is still something that causes concern. Even if your groom is fine with it, his family (or your own) might not be so understanding. D) There are a couple of ways to compromise on the issue. You could choose an entirely new last name for the two of you to share. This way neither of you gets "your" way and you both have to deal with the legalities of going through a name change. Most of the time, though, the most popular compromise is to hyphenate your last name and the last name of your groom. For example, if your groom''s name is John Smith and your name is Kate Jones, you would name yourself Kate Jones-Smith or Kate Smith-Jones. This allows you to keep going by your own last name while legally adopting your husband''s last name at the same time. E) The compromise is the biggest reason that so many women choose to hyphenate their last names. It is a way of you keeping your own identity while also making your future husband happy. It allows you to stay connected to accomplishments that you achieved before you got married. For example, many women who choose to hyphenate do so partially because they have earned higher educational degrees and certifications under their maiden names. They might have also had things published or publicized and want to stay connected to that identity. Hyphenating your last name can help you bridge the gap between your personal and professional lives. Many women who opt to simply keep their own names do so because they don''t want to give up all that they have accomplished professionally. Adopting their husband''s last name makes it hard for them to claim ownership of these accomplishments personally because they happened under their "other" name. F) While tradition is one thing, there isn''t any logical reason to completely change your name. Keeping your name and joining it to your husband''s through hyphenation is as legal as simply adopting his name or as simply keeping your own and leaving his out of the picture entirely. G) Probably the most important reason to consider hyphenation is your identity. You''ve spent your whole life building your identity under a certain name. Obviously you will still be you even if you''ve taken on your husband''s last name and omitted yours entirely. At the same time, your name is associated with the identity you''ve built up and hyphenation allows you to respect that while also respecting tradition and your husband''s family''s identity. H) If you care about outside opinions on your name, you should know that a large portion of today''s society is annoyed by the hyphenated name. Some people find it "snobby"(势利的) and others simply find it irritating because they have a hard time remembering which last name they are supposed to say first. Some people even believe that not simply adopting your husband''s last name is a huge sign of disrespect and a lack of commitment. I) It is possible that your future husband will find this choice offensive. Some men, regardless of how you might feel about such things, are traditionalists and feel that it is simply "right" for the woman to take the man''s last name as her own. Whether your future husband insisting on your adopting his last name is a red flag to you or not, it is still something that you should take into consideration. J) There are all sorts of reasons to hyphenate your name or not to hyphenate your name. The basis for each of these things, however, is whether or not you are willing to make a compromise when it comes to changing your name. The hyphenation is the epitome(体现) of a compromise. One spouse wants a complete name change. The other spouse wants no name change. Hyphenating the two names is a way for each person to, at least a little bit, "win" the argument. K) And don''t forget the legal stuff! Making the decision is just part of the process. From there you are going to have to legally change your name all over the place. You''ll need to change your name at the bank, with social security, with your credit cards, on your driver''s license, at the gym…everywhere. It''s easy to get overwhelmed just thinking about it. L) What matters, of course, is that the two of you are going to be happily married—hopefully for the rest of your lives. At the end of the day, whether you each keep your names, whether you come up with an entirely new name for the two of you to share or whether you hyphenate your current last names, what matters is that you love each other and are going to be joining your lives together. Try to remember that as you are staring at the application for your marriage license and filling out the portion that reads "name after you get married" (or whatever the legalese for that might be).', NULL, NULL, 1029, 'IMPORT', 'cet4-2023-03-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-03-1-r2'
);
SET @pg_cet4_2023_03_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-03-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-r3', 'CAREFUL_READING', 'CET4', NULL, 'It''s good to be smart. After all, intelligent people earn more money, accumulate more wealth, and even live longer. But there''s another side to the story. The brightest people and strongest leaders sometimes make errors others don''t, especially in situations that require common sense. Travis Bradberry, president at TalentSmart, explained in his post Why Smart People Act So Stupid that "Rational thinking and intelligence don''t tend to go hand in hand. Intelligent people are more prone to silly mistakes because of blind spots in how they use logic. These blind spots exist because smart people tend to be overconfident in their reasoning abilities." They are so used to being right and having quick answers that they don''t even realise when they''re making a mess by answering without thinking things through. A lifetime of praise leads smart people to develop too much faith in their intelligence and abilities. They often fail to recognise when they need help, and when they do recognise it, they tend to believe that no one else is capable of providing it. "It''s hard for anyone to graciously accept the fact that they''re wrong. It''s even harder for smart people because they grow so used to being right all the time that it becomes a part of their identity," Bradberry wrote. "For smart people, being wrong can feel like a personal attack, and being right, a necessity." Smart people also have a hard time accepting feedback. They tend to undervalue the opinions of others, which means they have trouble believing that anyone is qualified to give them useful feedback. Not only does this tendency hinder their growth and performance, it can lead to harmful relationships, both personally and professionally. Smart people develop overachieving personalities because things come so easily to them. They simply don''t understand how hard some people have to work to accomplish the same things, and because of that, they push people too hard. They set the bar too high, and when people take too long or don''t get things quite right, they assume it''s due to a lack of effort. So they push even harder.', NULL, NULL, 351, 'IMPORT', 'cet4-2023-03-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-03-1-r3'
);
SET @pg_cet4_2023_03_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-03-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-r4', 'CAREFUL_READING', 'CET4', NULL, 'Of the endless troubles that come with being driven from one''s home country, losing educational certificates may seem small. But it isn''t. Refugees who settle in other countries often find themselves unable to continue on their previous career path due to a new set of employer standards or skills requirements. To solve this problem, the U.S. State Department is posing a solution: online learning. The State Department will announce a partnership with an online education platform called Coursera. The platform will allow refugees worldwide to take thousands of online courses for free. "Coursera for Refugees" will be available for any non-profit group that supports refugees in any country, as well as individual refugees. They can apply for fully funded access to Coursera''s course catalog, which means they can take all of the platform''s classes and obtain professional certificates for free. The platform currently offers professor-led lectures on a broad range of topics, from data science to fashion design. As the world migrant crisis intensifies, employment is becoming a global concern. The new program aims to aid refugees by offering "important skills that will help them in the global economy," Evan Ryan, U.S. assistant secretary of state for educational and cultural affairs, said on a press call last week. "What we don''t want to do is not act," added Coursera chief operations officer Lila Ibrahim. The idea isn''t without problems. For one, starting a new career path isn''t as simple as watching a few videos and obtaining an online certificate; even those looking to continue previous careers can''t simply rely on an online lecture to get them up-to-date on standards, policies, and practices. For another, most of the classes on Coursera are in English, and though there are plans to add translations, language barriers can be a big obstacle. Then there are the questions over the value of massive open online courses (MOOCs) themselves—both for refugees and for average learners. But it''s still early days and there are signs of hope. In 2015, a joint study found 72% of people taking the MOOCs saw career benefits afterwards.', NULL, NULL, 346, 'IMPORT', 'cet4-2023-03-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-03-1-r4'
);
SET @pg_cet4_2023_03_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-03-1-r4' LIMIT 1);

-- 翻译 cet4-2023-03-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-translation'
);
SET @q_cet4_2023_03_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_01, '随着生活水平的提高，更多人开始加入到自驾游的行列之中。自驾游者既可驾驶自家车也可借车或租车出游。司机可能是车主或结伴出游者。自驾游与传统的组团旅游不同，它能够更好地满足旅游者的个性化需求，使他们更好地享受旅游的过程。自驾游尤其受到年轻出游者的欢迎。年轻人追求独立自由的生活，而自驾游恰好满足了他们的这一需求。', NULL, 'With the improvement of living standards, more and more people are joining self-driving tours. A self-driving tourist can either drive their own car or borrow or rent one for the trip, and the driver may be the car owner or a travel companion. Unlike traditional group tours, self-driving tours can better satisfy tourists'' personalized needs and thus help them enjoy the travel experience more fully. They are especially popular among young travelers. Young people pursue an independent and free life, while self- driving tours happen to meet this very need.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_01
);

-- 听力 Q1 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q01', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q01'
);
SET @q_cet4_2023_03_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_02, NULL, '{"A":"A) A proposed policy allowing Africans to travel in Africa without a visa.","B":"B) An agreement among 13 African countries to set up a free-trade zone.","C":"C) A plan to invite all African countries to join the African Union.","D":"D) An important initiative to permit tourists to visit Africa without a visa."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_02
);

-- 听力 Q2 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q02', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q02'
);
SET @q_cet4_2023_03_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_03, NULL, '{"A":"A) It will attract more investments from all over the world.","B":"B) It will help many African countries reduce trade deficits.","C":"C) It will reduce the cost of trade between African countries.","D":"D) It will allow Africans to play a bigger role in world trade."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_03
);

-- 听力 Q3 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q03', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q03'
);
SET @q_cet4_2023_03_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_04, NULL, '{"A":"A) Cooling down volcanic rock with sea water.","B":"B) Storing carbon dioxide underground as a gas.","C":"C) Capturing carbon dioxide and burying it under the sea.","D":"D) Pumping carbon dioxide underground to form stone."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_04
);

-- 听力 Q4 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q04', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q04'
);
SET @q_cet4_2023_03_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_05, NULL, '{"A":"A) Lack of burying ground.","B":"B) Long time for processing.","C":"C) High consumption of water.","D":"D) Enormous cost of energy."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_05
);

-- 听力 Q5 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q05', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q05'
);
SET @q_cet4_2023_03_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_06, NULL, '{"A":"A) It varies with the seasons.","B":"B) It has been on the decline.","C":"C) It has caused nationwide concern.","D":"D) It is ninety grams daily on average."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_06
);

-- 听力 Q6 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q06', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q06'
);
SET @q_cet4_2023_03_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_07, NULL, '{"A":"A) They emphasize food variety.","B":"B) They prefer French stick loaves.","C":"C) They do more cooking than men.","D":"D) They favor diets lower in calories."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_07
);

-- 听力 Q7 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q07', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q07'
);
SET @q_cet4_2023_03_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_08, NULL, '{"A":"A) They bake more bread at home.","B":"B) They spend less time eating breakfast.","C":"C) They eat more fruit than they used to.","D":"D) They put jam instead of butter on bread."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q08', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q08'
);
SET @q_cet4_2023_03_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_09, NULL, '{"A":"A) After the rush hour.","B":"B) Early in the morning.","C":"C) As soon as possible.","D":"D) Around lunch time."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_09
);

-- 听力 Q9 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q09', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q09'
);
SET @q_cet4_2023_03_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_10, NULL, '{"A":"A) Two first class seats.","B":"B) Two seats together.","C":"C) One window seat.","D":"D) One seat near the exit."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_10
);

-- 听力 Q10 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q10', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q10'
);
SET @q_cet4_2023_03_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_11, NULL, '{"A":"A) In the middle of the platform.","B":"B) At the far end of the platform.","C":"C) Behind the yellow line.","D":"D) In the waiting room."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_11
);

-- 听力 Q11 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q11', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q11'
);
SET @q_cet4_2023_03_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_12, NULL, '{"A":"A) Wait in a queue for his turn.","B":"B) Go to the baggage claim area.","C":"C) Pay an extra fee for the service.","D":"D) Give the ticket to the train guard."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_12
);

-- 听力 Q12 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q12', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q12'
);
SET @q_cet4_2023_03_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_13, NULL, '{"A":"A) Almost all of them were operating at a deficit.","B":"B) They have all been turned into movie theatres.","C":"C) Nearly all of them closed down decades ago.","D":"D) They have adapted to meet fashion changes."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_13
);

-- 听力 Q13 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q13', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q13'
);
SET @q_cet4_2023_03_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_14, NULL, '{"A":"A) It shows foreign movies exclusively.","B":"B) It shows movies from the 1950s.","C":"C) It is the oldest theatre in London.","D":"D) It is located next to a hat factory."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_14
);

-- 听力 Q14 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q14', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q14'
);
SET @q_cet4_2023_03_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_15, NULL, '{"A":"A) They wear hats on social occasions.","B":"B) They don''t speak foreign languages.","C":"C) They enjoy watching foreign movies.","D":"D) They don''t go to movie theatres often."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_15
);

-- 听力 Q15 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q15', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q15'
);
SET @q_cet4_2023_03_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_16, NULL, '{"A":"A) They are meant mostly for immigrants.","B":"B) They attract large crowds of young Londoners.","C":"C) They are hard for English people to appreciate.","D":"D) They have an English translation on the screen."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_16
);

-- 听力 Q16 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q16', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q16'
);
SET @q_cet4_2023_03_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_17, NULL, '{"A":"A) She doesn''t think smartphones can replace tablets.","B":"B) She incorporates smartphones into her teaching.","C":"C) She cannot stop children using smartphones.","D":"D) She regards smartphones as a distraction."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_17
);

-- 听力 Q17 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q17', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q17'
);
SET @q_cet4_2023_03_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_18, NULL, '{"A":"A) To enforce school discipline.","B":"B) To make students concentrate.","C":"C) To help children grow up to be professionals.","D":"D) To cultivate children''s good study habits."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_18
);

-- 听力 Q18 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q18', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q18'
);
SET @q_cet4_2023_03_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_19, NULL, '{"A":"A) Use books and pens only.","B":"B) Cut down their screen time.","C":"C) Make full use of electronic devices.","D":"D) Learn to use the internet for research."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_19
);

-- 听力 Q19 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q19', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q19'
);
SET @q_cet4_2023_03_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_20, NULL, '{"A":"A) By cleaning the kitchen floor.","B":"B) By looking after her baby brother.","C":"C) By helping her mother do the dishes.","D":"D) By helping her brother wash windows."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_20
);

-- 听力 Q20 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q20', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q20'
);
SET @q_cet4_2023_03_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_21, NULL, '{"A":"A) She ordered a large number of dolls.","B":"B) She checked if a purple doll was ordered.","C":"C) She mistakenly canceled her mom''s order.","D":"D) She ordered a more expensive doll instead."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_21
);

-- 听力 Q21 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q21', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q21'
);
SET @q_cet4_2023_03_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_22, NULL, '{"A":"A) They asked the children''s hospital to pick them.","B":"B) They took all of them to the children''s hospital.","C":"C) They opened all of them one by one.","D":"D) They discussed where to keep them."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_22
);

-- 听力 Q22 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q22', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q22'
);
SET @q_cet4_2023_03_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_23, NULL, '{"A":"A) The time one starts school.","B":"B) The classroom atmosphere.","C":"C) The school that one attends.","D":"D) The relationship with classmates."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_23
);

-- 听力 Q23 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q23', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q23'
);
SET @q_cet4_2023_03_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_24, NULL, '{"A":"A) To help parents decide when to send their children to school.","B":"B) To find causes for differences in the participants'' performance.","C":"C) To identify students having potential to be professional athletes.","D":"D) To offer constructive suggestions for making educational policies."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_24
);

-- 听力 Q24 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q24', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q24'
);
SET @q_cet4_2023_03_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_25, NULL, '{"A":"A) Political leaders.","B":"B) Financial analysts.","C":"C) Professional athletes.","D":"D) High-school students."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_25
);

-- 听力 Q25 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q25', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q25'
);
SET @q_cet4_2023_03_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_26, NULL, '{"A":"A) Leadership ability.","B":"B) Commitment to work.","C":"C) Risk-taking.","D":"D) Self-confidence."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q26'
);
SET @q_cet4_2023_03_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_27, NULL, '{"A":"A) wore","B":"B) wildlife","C":"C) suspect","D":"D) struck","E":"E) similar","F":"F) quantity","G":"G) overthrown","H":"H) mess","I":"I) intense","J":"J) human","K":"K) effective","L":"L) delight","M":"M) colorful","N":"N) bore","O":"O) alike"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q27'
);
SET @q_cet4_2023_03_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_28, NULL, '{"A":"A) wore","B":"B) wildlife","C":"C) suspect","D":"D) struck","E":"E) similar","F":"F) quantity","G":"G) overthrown","H":"H) mess","I":"I) intense","J":"J) human","K":"K) effective","L":"L) delight","M":"M) colorful","N":"N) bore","O":"O) alike"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q28'
);
SET @q_cet4_2023_03_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_29, NULL, '{"A":"A) wore","B":"B) wildlife","C":"C) suspect","D":"D) struck","E":"E) similar","F":"F) quantity","G":"G) overthrown","H":"H) mess","I":"I) intense","J":"J) human","K":"K) effective","L":"L) delight","M":"M) colorful","N":"N) bore","O":"O) alike"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q29'
);
SET @q_cet4_2023_03_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_30, NULL, '{"A":"A) wore","B":"B) wildlife","C":"C) suspect","D":"D) struck","E":"E) similar","F":"F) quantity","G":"G) overthrown","H":"H) mess","I":"I) intense","J":"J) human","K":"K) effective","L":"L) delight","M":"M) colorful","N":"N) bore","O":"O) alike"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q30'
);
SET @q_cet4_2023_03_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_31, NULL, '{"A":"A) wore","B":"B) wildlife","C":"C) suspect","D":"D) struck","E":"E) similar","F":"F) quantity","G":"G) overthrown","H":"H) mess","I":"I) intense","J":"J) human","K":"K) effective","L":"L) delight","M":"M) colorful","N":"N) bore","O":"O) alike"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q31'
);
SET @q_cet4_2023_03_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_32, NULL, '{"A":"A) wore","B":"B) wildlife","C":"C) suspect","D":"D) struck","E":"E) similar","F":"F) quantity","G":"G) overthrown","H":"H) mess","I":"I) intense","J":"J) human","K":"K) effective","L":"L) delight","M":"M) colorful","N":"N) bore","O":"O) alike"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q32'
);
SET @q_cet4_2023_03_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_33, NULL, '{"A":"A) wore","B":"B) wildlife","C":"C) suspect","D":"D) struck","E":"E) similar","F":"F) quantity","G":"G) overthrown","H":"H) mess","I":"I) intense","J":"J) human","K":"K) effective","L":"L) delight","M":"M) colorful","N":"N) bore","O":"O) alike"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q33'
);
SET @q_cet4_2023_03_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_34, NULL, '{"A":"A) wore","B":"B) wildlife","C":"C) suspect","D":"D) struck","E":"E) similar","F":"F) quantity","G":"G) overthrown","H":"H) mess","I":"I) intense","J":"J) human","K":"K) effective","L":"L) delight","M":"M) colorful","N":"N) bore","O":"O) alike"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q34'
);
SET @q_cet4_2023_03_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_35, NULL, '{"A":"A) wore","B":"B) wildlife","C":"C) suspect","D":"D) struck","E":"E) similar","F":"F) quantity","G":"G) overthrown","H":"H) mess","I":"I) intense","J":"J) human","K":"K) effective","L":"L) delight","M":"M) colorful","N":"N) bore","O":"O) alike"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q35'
);
SET @q_cet4_2023_03_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_36, NULL, '{"A":"A) wore","B":"B) wildlife","C":"C) suspect","D":"D) struck","E":"E) similar","F":"F) quantity","G":"G) overthrown","H":"H) mess","I":"I) intense","J":"J) human","K":"K) effective","L":"L) delight","M":"M) colorful","N":"N) bore","O":"O) alike"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q36'
);
SET @q_cet4_2023_03_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_37, 'Many people today still find name hyphenation upon marriage unacceptable.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q37'
);
SET @q_cet4_2023_03_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_38, 'As a compromise, a bride will in most cases adopt a name that combines the couple''s last names.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q38'
);
SET @q_cet4_2023_03_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_39, 'The bride should consider adopting her groom''s last name whether he feels strongly about it or not.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q39'
);
SET @q_cet4_2023_03_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_40, 'Making preparations for marriage causes a lot of stress.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q40'
);
SET @q_cet4_2023_03_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_41, 'Hyphenating the last names could be a win-win solution should arguments arise about what name to adopt upon marriage.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q41'
);
SET @q_cet4_2023_03_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_42, 'It used to be considered socially unacceptable for a bride to retain her maiden name.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q42'
);
SET @q_cet4_2023_03_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_43, 'The bride who adopts a hyphenated last name after marriage can maintain connections with their past achievements.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q43'
);
SET @q_cet4_2023_03_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_44, 'Hyphenating names allows the bride to preserve her own identity while respecting tradition.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q44'
);
SET @q_cet4_2023_03_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_45, 'No matter what name the bride adopts, it is most important that the newlyweds truly love each other.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q45'
);
SET @q_cet4_2023_03_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_46, 'Legally speaking, the bride is free to choose whatever name she prefers.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q46'
);
SET @q_cet4_2023_03_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_47, 'What do we learn from the passage about the brightest people?', '{"A":"A) They can make silly mistakes in straightforward situations.","B":"B) They usually turn a blind eye to their own weaknesses.","C":"C) They are admired by people around them.","D":"D) They can differ in their personalities."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q47'
);
SET @q_cet4_2023_03_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_48, 'What accounts for the existence of intelligent people''s logical blind spots?', '{"A":"A) Their irrational way of thinking.","B":"B) Too much faith in their ability to think.","C":"C) Their ignorance of behavioural science.","D":"D) Too much concern about their work"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q48'
);
SET @q_cet4_2023_03_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_49, 'How do smart people react when they are found to be wrong?', '{"A":"A) They shift the blame to others.","B":"B) They graciously accept the facts.","C":"C) They may feel shocked.","D":"D) They may get offended."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q49'
);
SET @q_cet4_2023_03_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_50, 'What may happen to smart people who find it difficult to accept suggestions?', '{"A":"A) They may suffer in their professional and private life.","B":"B) They may lose faith in their administrative abilities.","C":"C) They may commit more errors than ever before.","D":"D) They may experience a lot of emotional stress."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q50'
);
SET @q_cet4_2023_03_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_51, 'What is said about those working with or under overachieving people?', '{"A":"A) They put a lot of effort into their work.","B":"B) They set higher goals for themselves.","C":"C) They are under increasing pressure.","D":"D) They take less time to get things done."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q51'
);
SET @q_cet4_2023_03_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_52, 'Why is the U.S. State Department launching an online learning program for refugees?', '{"A":"A) To enable them to settle down in host countries.","B":"B) To allow them to learn as many job skills as possible.","C":"C) To offer them a platform to pursue advanced degrees.","D":"D) To help them to meet new employment standards."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q52'
);
SET @q_cet4_2023_03_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_53, 'What do we know about "Coursera for Refugees"?', '{"A":"A) It provides refugees with a wide range of courses free of charge.","B":"B) It offers free online data services for refugees around the world.","C":"C) It allows refugees to obtain degrees in various academic fields.","D":"D) It supplies refugees with a great variety of job opportunities."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q53'
);
SET @q_cet4_2023_03_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_54, 'What does the passage say is a consequence of the global migrant crisis?', '{"A":"A) Instability increases in host countries.","B":"B) The global economic crisis intensifies.","C":"C) A lot more refugees die during migration.","D":"D) Refugees find it more difficult to get a job."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q54'
);
SET @q_cet4_2023_03_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_55, 'What does the author say causes refugees'' difficulty in taking online courses?', '{"A":"A) Cultural environment.","B":"B) Changed academic requirements.","C":"C) Lack of language skills.","D":"D) Difference in teaching platforms."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-03-1-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_03_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-03-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q55'
);
SET @q_cet4_2023_03_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-03-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_03_1_56, 'What did the joint study find about the MOOCs several years ago?', '{"A":"A) They helped solve learners'' financial problems.","B":"B) They benefited most of the learners.","C":"C) They changed some learners'' career path.","D":"D) They provided the most needed vocational skills."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_03_1_56
);

-- ==================== cet4-2023-06-1 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-r1', 'BANKED_CLOZE', 'CET4', NULL, 'You probably haven''t taken the time to think of all the work that went into creating the shirt on your back. I mean, how hard it could be to create fabric and __26__ it into a shirt shape. Don''t machines do all that? Well, creating fabric from cotton, which is the most __27__ clothing material, is actually a process that involves a lot of water, 2,700 liters per shirt to be __28__ . Take a look at the video below from National Geographic for some more mind-blowing __29__ about cotton clothing production. Clean water is __30__ becoming one of the most sought-after resources in the world. Given how large the __31__ and cotton industries are, they take up a lot of our fresh water demands across the world, according to The Huffington Post. The video from National Geographic was created to spread __32__ of how environmentally harmful cotton is. But the situation can be made better. Through better water management and farming practices, water usage in cotton production can be cut down by __33__ 40 percent. Called "Better Cotton", this environmentally conscious product will save millions of liters of water a year simply from __34__ the demands of cotton production. Cotton doesn''t have to go, since it is, after all, one of the most useful cash crops across the globe. However, as water supplies __35__ , farmers and consumers need to be more conscious of the effect that these products have on the environment as a whole.', NULL, '["A) abstracts","B) abundant","C) awareness","D) conscience","E) exact","F) increasingly","G) intense","H) mend","I) nearly","J) reckoning","K) reducing","L) sew","M) shrink","N) statistics","O) textile"]', 247, 'IMPORT', 'cet4-2023-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-1-r1'
);
SET @pg_cet4_2023_06_1_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-1-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-r2', 'MATCHING', 'CET4', 'The spoken web', 'A) We''re growing more used to chatting to our computers, phones and smart speakers through voice assistants like Amazon''s Alexa, Apple''s Siri and Microsoft''s Cortana. Blind and partially sighted people have been using text-to-speech converters for decades. B) Out of these assistants, Siri is the most well-known. The assistant uses voice inquiries and a natural-language user interface(界面) to answer questions. The software adapts to users'' individual language usages, searches, and preferences, with continuing use. C) Some think voice could soon take over from typing and clicking as the main way to interact online. But what are the challenges of moving to "the spoken web"? D) What use is written online content if you can''t read? That is the situation facing illiterate(不识字的) African farmers. They are often denied crucial information the web offers many others. With a literacy rate in some parts of Africa at only 22.6%, farmers are often "underpaid for their produce because they might be unaware of the prevailing prices," says Francis Dittoh, a researcher behind Mr Meteo, a speech-based weather information service. E) "The most frequently heard complaint is about rainfall predictions," says Mr Dittoh, who lives in Tamale, northern Ghana. "They tell us the methods their forefathers used to predict the weather don''t seem to work as well these days." This is down to climate change, he believes. Yet knowing when it''s going to rain is vital for farmers wanting to sow seeds, irrigate crops or take their animals out to the fields to feed on grass. F) Mr Dittoh says the idea of converting online weather reports into speech came from the farmers themselves, after a workshop in the village of Guabuligah. "They came up with this," he says. Mr Meteo takes the online weather forecast, converts it to a short recording in the appropriate language and makes it available on a basic phone. Farmers ring up to receive the information. The local language Dagbani is spoken by 1.2 million people but is not served by any online translation applications. The service was designed to be cheap and easy to run, says Mr Dittoh. He plans to begin field tests this month, working with Tamale''s Savanna Agricultural Research Institute. G) The spoken web could also help the one-in-five adults in Europe and the U.S. with poor reading skills. But building the spoken web—web-to-voice and voice-to-web—isn''t straightforward. For software to understand that pizza is served at Italian restaurants is easy. To cover multiple domains and to be able to have a conversation with users on every single topic is still a long way off. H) So although many computer assistants can answer simple questions about the weather and play music for us, anything resembling a wide-ranging human conversation is decades away. Artificial intelligence just isn''t smart enough yet. Even turning your voice into text—automatic speech recognition—is one of the hardest problems to solve, as there are as many ways to pronounce things as there are people on the planet. I) Siri has often been praised for its ability to interpret our casual language and deliver very specific and accurate results, sometimes even providing additional information. But it is still somewhat restricted, particularly when the language moves away from stiffer commands into more human interactions. In one example, the phrase "Send a text to Jason, Clint, Sam, and Lee saying we''re having dinner at Silver Cloud restaurant" was interpreted as sending a message to Jason only, containing the text "Clint Sam and Lee saying we''re having dinner at Silver Cloud restaurant". It has also been noted that Siri lacks a proper editing function, as saying "Edit message to say: we''re at Silver Cloud restaurant and you should come find us" generates "Clint Sam and Lee saying we''re having dinner at Silver Cloud restaurant to say we''re at Silver Cloud restaurant and you should come find us". J) Using voice interaction feels far more intimate than surfing the net the old-fashioned way. This is intentional as the informal tone of the assistant helps create an emotional attachment. But if something speaks, it must also listen. Our phones are always near us and they are collecting data about us all the time. This has already raised privacy concerns. The American Civil Liberties Union has stated that digital assistants create a threat to privacy from hackers. Some people have other concerns. They worry assistants will one day be used to deliver advertising directly to us. K) But digital voices need more personality to make them popular. Robots are not yet witty, Siri is boring. The benefits of using voice instead of tapping fingers obviously depend on the context. Doctors completing online forms about their patients by speech, for example, can dictate 150 words a minute, three times faster than typing on a keyboard. This enables them to spend less time on administration and more time with patients. L) Last year, speech recognition company Nuance helped a doctors'' surgery in Dukinfield, near Manchester, set up a speech system for the practice''s six doctors. Now they can dictate notes on a patient''s health condition and treatment and a smart assistant automatically enters the information into the right fields on a web form. Previously, the doctors made voice recordings that were then transcribed by secretaries—a process that was costly and likely to cause delays. The new system means letters to patients now have more detail. M) Using voice also makes sense when you''re doing other things with your hands. Think about when you''re cooking, and you just want to know what the next step in the recipe is. Your hands are covered with oil; you''re not going to get on the iPad, so it''s a lot more natural to talk. And speech obviously makes sense when you''re driving. In the U.S., 29% of drivers admit they surf behind the wheel, according to insurance firm State Farm. This is up from 13% in 2009. No wonder using mobile phones while driving causes more crashes a year than drink driving, says the U.S. National Safety Council.', NULL, NULL, 1001, 'IMPORT', 'cet4-2023-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-1-r2'
);
SET @pg_cet4_2023_06_1_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-1-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-r3', 'CAREFUL_READING', 'CET4', NULL, 'The United States is facing a housing crisis: Affordable housing is inadequate, while luxury homes abound( 充裕), and homelessness remains a persistent problem. Despite this, popular culture and the housing industry market happiness as living with both more space and more amenities( 便利设施). Big houses are advertised as a reward for hard work and diligence, turning housing from a basic necessity into a luxury. This is reflected in our homes. The average single-family home built in the United States before 1970 was less than 1,500 square feet in size. By 2016, the average size of a new, single-family home was 2,422 square feet. What''s more, homes built in the 2000s were more likely than earlier models to have more of all types of spaces: bedrooms, bathrooms, living rooms, dining rooms, recreation rooms and garages. There are consequences of living big. As middle-class houses have grown larger, two things have happened. First, large houses take time to maintain, so cleaners and other low-wage service workers are required to keep these houses in order. Second, once-public spaces, where people from diverse backgrounds used to come together, have increasingly become privatized, leading to a reduction in the number of public facilities available to all, and a reduced quality of life for many. Take swimming pools. While in 1950, only 2,500 U.S. families owned pools, by 1999 this number was 4 million. At the same time, public municipal pools were often closed, leaving low-income people nowhere to swim. The trend for bigger housing thus poses ethical questions. Should Americans accept a system in which the middle and upper classes enjoy a luxurious lifestyle, using the low-wage labor of others? Are we willing to accept a system in which an increase in amenities purchased by the affluent means a reduction in amenities for the poor? I believe neither is acceptable. We must change the way we think: living well does not need to mean having more private spaces; instead, it could mean having more public spaces. A better goal than building bigger houses for some is to create more publicly accessible spaces and amenities for all.', NULL, NULL, 351, 'IMPORT', 'cet4-2023-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-1-r3'
);
SET @pg_cet4_2023_06_1_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-1-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-r4', 'CAREFUL_READING', 'CET4', NULL, 'Most of us in the entrepreneurial community are blessed—or cursed—with higher-than-average ambition. Ambitious people strongly desire accomplishments and are willing to take more risks and spend more effort to get them. Overall, this is a positive quality, especially for people trying to build their own businesses. Apparently, if you''re more naturally driven to set goals, you are more likely to succeed. Actually, this isn''t always the case. In fact, in some cases, extreme ambition may end up doing more harm than good. One major side effect of excessive ambition is the tendency to focus too determinedly on one particular vision or end goal. This is problematic because it hinders your ability to adapt to new circumstances, which is vital if you want to be a successful entrepreneur. If a new competitor emerges to threaten your business, you may need to change direction, even if that means straying from your original vision. If you have too much ambition, you''ll find this hard, if not impossible. Few people are successful when they try to build their first brand. Unfortunately, for the most ambitious entrepreneurs, a failure is seen as disastrous, and impossible to recover from. It''s a clear departure from the intended plan toward the intended goal. For people with limited ambition, however, failure is viewed as something closer to reality. Remember, failure is inevitable, and every failure you survive is a learning experience. Ambitious people tend to be more materialistically successful than their non-ambitious counterparts. However, they''re only slightly happier than their less-ambitious counterparts, and tend to live significantly shorter lives. This implies that even though ambitious people are more likely to achieve conventional "success," such success means nothing for their health and happiness—and if you don''t have health and happiness, what else could possibly matter? Clearly, some amount of ambition is good for your motivation. Without any ambition, you wouldn''t start your own business, set or achieve goals and get far in life. But an excess of ambition can also be dangerous, putting you at risk of burnout, stubbornness and even a shorter life.', NULL, NULL, 344, 'IMPORT', 'cet4-2023-06-1', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-1-r4'
);
SET @pg_cet4_2023_06_1_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-1-r4' LIMIT 1);

-- 翻译 cet4-2023-06-1
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-translation'
);
SET @q_cet4_2023_06_1_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_01, '中国越来越重视终身教育,发展继续教育是构建终身教育体系的有效途径。高校作为人才培养的基地, 拥有先进的教学理念和优越的教学资源, 理应成为继续教育的办学主体。因此，近年来许多高校适应社会需求, 加强与用人单位沟通, 努力探索一条符合中国国情的继续教育发展新路, 以使继续教育在国家发展战略中发挥更大的作用。', NULL, 'China attaches increasing importance to lifelong education, and developing continuing education is an effective way to build a lifelong education system. As a base for cultivating talent, universities, possessing advanced teaching philosophies and superior teaching resources, should be the main providers of continuing education. Therefore, in recent years, many universities have been exploring a new path of continuing education that suits China''s national conditions by adapting to social needs and strengthening communication with employers, so as to enable continuing education to play a greater role in the national development strategy.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_01
);

-- 听力 Q1 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q01', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q01'
);
SET @q_cet4_2023_06_1_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_02, NULL, '{"A":"A) She was involved in a conflict with bird lovers.","B":"B) She was charged with mistreating animals.","C":"C) She was on bad terms with her neighbors.","D":"D) She was accused of violating a city law."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_02
);

-- 听力 Q2 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q02', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q02'
);
SET @q_cet4_2023_06_1_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_03, NULL, '{"A":"A) It will take time to solve the rat problem.","B":"B) All wild animals should be well protected.","C":"C) The woman was not to blame for the situation.","D":"D) No one should go unpunished for violating law."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_03
);

-- 听力 Q3 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q03', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q03'
);
SET @q_cet4_2023_06_1_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_04, NULL, '{"A":"A) Communicate with astronauts in Mars Dune Alpha.","B":"B) Work in an environment resembling Mars.","C":"C) Build a Martian habitat in Houston.","D":"D) Send in applications before Friday."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_04
);

-- 听力 Q4 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q04', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q04'
);
SET @q_cet4_2023_06_1_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_05, NULL, '{"A":"A) Ready-made food.","B":"B) Food that is organic.","C":"C) Food they grow.","D":"D) Potatoes mostly."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_05
);

-- 听力 Q5 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q05', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q05'
);
SET @q_cet4_2023_06_1_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_06, NULL, '{"A":"A) He apologized for scratching an athlete''s gold medal.","B":"B) He was asked to present a gold medal to Miu Goto.","C":"C) He bit a softball player''s Olympic gold medal.","D":"D) He attracted public attention at a media event."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_06
);

-- 听力 Q6 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q06', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q06'
);
SET @q_cet4_2023_06_1_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_07, NULL, '{"A":"A) Have another picture taken with the Olympic medalist.","B":"B) Apologize to the International Olympic Committee.","C":"C) Get the damaged medal repaired.","D":"D) Pay for the cost of a new medal."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_07
);

-- 听力 Q7 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q07', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q07'
);
SET @q_cet4_2023_06_1_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_08, NULL, '{"A":"A) Allow no one to touch them.","B":"B) See them as symbols of honor.","C":"C) Treat them as treasures.","D":"D) Keep them in a safe place."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q08', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q08'
);
SET @q_cet4_2023_06_1_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_09, NULL, '{"A":"A) She covered its screen with a plastic sheet.","B":"B) She connected it with her smartphone.","C":"C) She decorated it with colorful stickers.","D":"D) She bought some new software for it."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_09
);

-- 听力 Q9 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q09', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q09'
);
SET @q_cet4_2023_06_1_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_10, NULL, '{"A":"A) It may not be simply blue.","B":"B) It includes unnatural light.","C":"C) It is more harmful to young people.","D":"D) It induces people to fall asleep."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_10
);

-- 听力 Q10 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q10', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q10'
);
SET @q_cet4_2023_06_1_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_11, NULL, '{"A":"A) He has had much trouble falling asleep.","B":"B) He has had some sort of health problems.","C":"C) He has stayed up playing computer games.","D":"D) He has been burdened with excessive work."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_11
);

-- 听力 Q11 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q11', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q11'
);
SET @q_cet4_2023_06_1_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_12, NULL, '{"A":"A) Exposure to blue light is the chief cause of obesity.","B":"B) Sleep may be more important than people assumed.","C":"C) Sleep may also be negatively affected by natural light.","D":"D) Overuse of electronic devices may cause heart disease."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_12
);

-- 听力 Q12 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q12', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q12'
);
SET @q_cet4_2023_06_1_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_13, NULL, '{"A":"A) What they wanted to be when grown up.","B":"B) What their favorite cartoon character was.","C":"C) What they learned from computer games.","D":"D) What they liked to do most after school."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_13
);

-- 听力 Q13 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q13', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q13'
);
SET @q_cet4_2023_06_1_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_14, NULL, '{"A":"A) A stock broker.","B":"B) A pop singer.","C":"C) A mechanical engineer.","D":"D) A basketball player."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_14
);

-- 听力 Q14 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q14', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q14'
);
SET @q_cet4_2023_06_1_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_15, NULL, '{"A":"A) Ambitious.","B":"B) Sensible.","C":"C) Imaginative.","D":"D) Practical."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_15
);

-- 听力 Q15 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q15', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q15'
);
SET @q_cet4_2023_06_1_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_16, NULL, '{"A":"A) Relax their strict control of their kids.","B":"B) Help their kids understand themselves.","C":"C) Impose their own dreams on their kids.","D":"D) Dismiss their high expectations of their kids."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_16
);

-- 听力 Q16 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q16', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q16'
);
SET @q_cet4_2023_06_1_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_17, NULL, '{"A":"A) Set up company branches.","B":"B) Improve its infrastructure.","C":"C) Introduce iPhones into its markets.","D":"D) Promote Internet-ready phones."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_17
);

-- 听力 Q17 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q17', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q17'
);
SET @q_cet4_2023_06_1_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_18, NULL, '{"A":"A) They cater to Africans'' needs.","B":"B) They are more expensive models.","C":"C) They are more powerful and capable","D":"D) They boast the longest battery life."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_18
);

-- 听力 Q18 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q18', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q18'
);
SET @q_cet4_2023_06_1_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_19, NULL, '{"A":"A) A large touchscreen.","B":"B) An old-school keypad.","C":"C) A voice-response device.","D":"D) A digitally-designed system."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_19
);

-- 听力 Q19 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q19', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q19'
);
SET @q_cet4_2023_06_1_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_20, NULL, '{"A":"A) It ensured sustainable economic growth.","B":"B) It was strongly opposed by manufacturers.","C":"C) It was cheaper than using fossil fuel plastic.","D":"D) It satisfied consumer demands on the whole."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_20
);

-- 听力 Q20 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q20', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q20'
);
SET @q_cet4_2023_06_1_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_21, NULL, '{"A":"A) The capacity to mass produce it.","B":"B) The U.S. federal government''s regulations.","C":"C) A boom in market demand for clear plastic bottles.","D":"D) A rapid increase in U.S. petroleum chemical production."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_21
);

-- 听力 Q21 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q21', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q21'
);
SET @q_cet4_2023_06_1_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_22, NULL, '{"A":"A) Require companies to use 30% of new plastic.","B":"B) Increase the supply of new plastic in the market.","C":"C) Reduce the amount of plastic pollution in local areas.","D":"D) Take measures to promote the use of recycled plastic."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_22
);

-- 听力 Q22 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q22', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q22'
);
SET @q_cet4_2023_06_1_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_23, NULL, '{"A":"A) It studies dreams.","B":"B) It rents a place for nap-takers.","C":"C) It is a hotel for business people.","D":"D) It is a nap research institute."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_23
);

-- 听力 Q23 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q23', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q23'
);
SET @q_cet4_2023_06_1_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_24, NULL, '{"A":"A) To find out creative people''s work performance.","B":"B) To see how many people can go without napping.","C":"C) To understand the obvious importance of napping.","D":"D) To feel how difficult it is to get his idea across."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_24
);

-- 听力 Q24 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q24', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q24'
);
SET @q_cet4_2023_06_1_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_25, NULL, '{"A":"A) They decline due to pointless meetings.","B":"B) They depend on his ability to concentrate.","C":"C) They enable him to enjoy a creative career.","D":"D) They are affected by the overuse of social media."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_25
);

-- 听力 Q25 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q25', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q25'
);
SET @q_cet4_2023_06_1_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_26, NULL, '{"A":"A) Some bosses associate napping with laziness.","B":"B) Many office workers nap during work hours.","C":"C) Some bosses can concentrate without napping.","D":"D) Many of his friends daydream in the office."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q26'
);
SET @q_cet4_2023_06_1_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_27, NULL, '{"A":"A) abstracts","B":"B) abundant","C":"C) awareness","D":"D) conscience","E":"E) exact","F":"F) increasingly","G":"G) intense","H":"H) mend","I":"I) nearly","J":"J) reckoning","K":"K) reducing","L":"L) sew","M":"M) shrink","N":"N) statistics","O":"O) textile"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q27'
);
SET @q_cet4_2023_06_1_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_28, NULL, '{"A":"A) abstracts","B":"B) abundant","C":"C) awareness","D":"D) conscience","E":"E) exact","F":"F) increasingly","G":"G) intense","H":"H) mend","I":"I) nearly","J":"J) reckoning","K":"K) reducing","L":"L) sew","M":"M) shrink","N":"N) statistics","O":"O) textile"}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q28'
);
SET @q_cet4_2023_06_1_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_29, NULL, '{"A":"A) abstracts","B":"B) abundant","C":"C) awareness","D":"D) conscience","E":"E) exact","F":"F) increasingly","G":"G) intense","H":"H) mend","I":"I) nearly","J":"J) reckoning","K":"K) reducing","L":"L) sew","M":"M) shrink","N":"N) statistics","O":"O) textile"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q29'
);
SET @q_cet4_2023_06_1_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_30, NULL, '{"A":"A) abstracts","B":"B) abundant","C":"C) awareness","D":"D) conscience","E":"E) exact","F":"F) increasingly","G":"G) intense","H":"H) mend","I":"I) nearly","J":"J) reckoning","K":"K) reducing","L":"L) sew","M":"M) shrink","N":"N) statistics","O":"O) textile"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q30'
);
SET @q_cet4_2023_06_1_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_31, NULL, '{"A":"A) abstracts","B":"B) abundant","C":"C) awareness","D":"D) conscience","E":"E) exact","F":"F) increasingly","G":"G) intense","H":"H) mend","I":"I) nearly","J":"J) reckoning","K":"K) reducing","L":"L) sew","M":"M) shrink","N":"N) statistics","O":"O) textile"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q31'
);
SET @q_cet4_2023_06_1_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_32, NULL, '{"A":"A) abstracts","B":"B) abundant","C":"C) awareness","D":"D) conscience","E":"E) exact","F":"F) increasingly","G":"G) intense","H":"H) mend","I":"I) nearly","J":"J) reckoning","K":"K) reducing","L":"L) sew","M":"M) shrink","N":"N) statistics","O":"O) textile"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q32'
);
SET @q_cet4_2023_06_1_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_33, NULL, '{"A":"A) abstracts","B":"B) abundant","C":"C) awareness","D":"D) conscience","E":"E) exact","F":"F) increasingly","G":"G) intense","H":"H) mend","I":"I) nearly","J":"J) reckoning","K":"K) reducing","L":"L) sew","M":"M) shrink","N":"N) statistics","O":"O) textile"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q33'
);
SET @q_cet4_2023_06_1_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_34, NULL, '{"A":"A) abstracts","B":"B) abundant","C":"C) awareness","D":"D) conscience","E":"E) exact","F":"F) increasingly","G":"G) intense","H":"H) mend","I":"I) nearly","J":"J) reckoning","K":"K) reducing","L":"L) sew","M":"M) shrink","N":"N) statistics","O":"O) textile"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q34'
);
SET @q_cet4_2023_06_1_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_35, NULL, '{"A":"A) abstracts","B":"B) abundant","C":"C) awareness","D":"D) conscience","E":"E) exact","F":"F) increasingly","G":"G) intense","H":"H) mend","I":"I) nearly","J":"J) reckoning","K":"K) reducing","L":"L) sew","M":"M) shrink","N":"N) statistics","O":"O) textile"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q35'
);
SET @q_cet4_2023_06_1_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_36, NULL, '{"A":"A) abstracts","B":"B) abundant","C":"C) awareness","D":"D) conscience","E":"E) exact","F":"F) increasingly","G":"G) intense","H":"H) mend","I":"I) nearly","J":"J) reckoning","K":"K) reducing","L":"L) sew","M":"M) shrink","N":"N) statistics","O":"O) textile"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q36'
);
SET @q_cet4_2023_06_1_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_37, 'According to Francis Dittoh, their speech-based weather information service was meant to be inexpensive and easy to use.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q37'
);
SET @q_cet4_2023_06_1_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_38, 'Using voice instead of typing enables doctors to spend more time taking care of patients.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q38'
);
SET @q_cet4_2023_06_1_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_39, 'It is extremely difficult to convert voice into text because of different pronunciations.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q39'
);
SET @q_cet4_2023_06_1_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_40, 'African farmers unable to read often don''t have access to important information conveyed online.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q40'
);
SET @q_cet4_2023_06_1_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_41, 'Some phone users worry advertisers will take advantage of voice assistants to send ads directly to them.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q41'
);
SET @q_cet4_2023_06_1_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_42, 'The spoken web is helpful when one''s hands are occupied.', NULL, 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q42'
);
SET @q_cet4_2023_06_1_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_43, 'Some people believe online interaction would soon depend mainly on voice.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q43'
);
SET @q_cet4_2023_06_1_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_44, 'Setting up a spoken web is by no means an easy task.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q44'
);
SET @q_cet4_2023_06_1_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_45, 'Weather information is extremely important to farmers.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q45'
);
SET @q_cet4_2023_06_1_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_46, 'Some people are concerned about privacy because their phones are constantly collecting their personal information.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q46'
);
SET @q_cet4_2023_06_1_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_47, 'What are big houses promoted to be in the United States?', '{"A":"A) A luxury for the homeless.","B":"B) A reward for industriousness.","C":"C) An abundant source of comforts.","D":"D) An absolute necessity for happiness."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q47'
);
SET @q_cet4_2023_06_1_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_48, 'What is one of the consequences of living big?', '{"A":"A) Many Americans'' quality of life has become lower.","B":"B) People from diverse backgrounds no longer socialize.","C":"C) People no longer have access to public swimming pools.","D":"D) Many Americans'' private life has been negatively affected."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q48'
);
SET @q_cet4_2023_06_1_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_49, 'What questions arise from living big?', '{"A":"A) Questions related to moral principles.","B":"B) Questions having to do with labor cost.","C":"C) Questions about what lifestyle to promote.","D":"D) Questions concerning housing development."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q49'
);
SET @q_cet4_2023_06_1_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_50, 'What kind of social system does the author think is unacceptable?', '{"A":"A) One in which the wealthy exploit the low-wage laborers building their houses.","B":"B) One in which the rich purchase amenities at an increasingly unjustifiable price.","C":"C) One in which the upper classes deprive the lower classes of affordable housing.","D":"D) One in which the affluent enjoy a more comfortable life at the expense of the poor."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q50'
);
SET @q_cet4_2023_06_1_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_51, 'What does the author advocate for people to live well?', '{"A":"A) Finding ways to turn private spaces into public ones.","B":"B) Building more houses affordable to those less affluent.","C":"C) More public spaces created for everyone to enjoy.","D":"D) All amenities made accessible to the rich and the poor alike."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q51'
);
SET @q_cet4_2023_06_1_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_52, 'What does the author think of most entrepreneurs?', '{"A":"A) They are more willing to risk their own lives.","B":"B) They are more ambitious than ordinary people.","C":"C) They achieve greater nonconventional success.","D":"D) They have more positive qualities than most of us."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q52'
);
SET @q_cet4_2023_06_1_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_53, 'What does the author imply by saying "this isn''t always the case" (Line 1, Para. 3)?', '{"A":"A) Ambitious people may not have a greater chance of success.","B":"B) Ambitious people may not have more positive qualities.","C":"C) Entrepreneurs'' ambition does as much good as harm.","D":"D) Entrepreneurs are more naturally driven to success."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q53'
);
SET @q_cet4_2023_06_1_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_54, 'What does the author say is of extreme importance for one to become a successful entrepreneur?', '{"A":"A) Holding on to one''s original vision.","B":"B) Being able to adapt to new situations.","C":"C) Focusing determinedly on one particular goal.","D":"D) Avoiding radical change in one''s career direction."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q54'
);
SET @q_cet4_2023_06_1_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_55, 'How do the most ambitious entrepreneurs regard failure in their endeavor?', '{"A":"A) It will awaken them to reality.","B":"B) It is a lesson they have to learn.","C":"C) It means the end of their career.","D":"D) It will result in a slow recovery."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-1-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_1_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-1', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q55'
);
SET @q_cet4_2023_06_1_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-1-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_1_56, 'What does the author advise us to do concerning ambition?', '{"A":"A) Distinguish between conventional success and our life goal.","B":"B) Follow the example of the most ambitious entrepreneurs.","C":"C) Avoid taking unnecessary risks when starting a business.","D":"D) Prioritize health and happiness over material success."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_1_56
);

-- ==================== cet4-2023-06-2 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-r1', 'BANKED_CLOZE', 'CET4', NULL, 'Morocco is responding to increasing energy demands by setting up one of the largest solar plants in the world. The Noor solar power station is __26__ in the city of Ouarzazate and, once completed, will generate 580 million watts of electricity. The World Bank estimates it will serve 1.1 million people. It''s __27__ to be completed soon. Morocco''s current energy comes __28__ from imports. The nation hopes to get 50 percent of its energy from renewable sources by 2030. With demand for energy __29__ at an annual rate of 7 percent, the new solar plant could be a __30__ part of that goal. "This makes Morocco a big __31__ in the field of solar energy in the Arab region and the African continent. It could also be a forerunner for many other countries in the world that __32__ on foreign imports of energy," said Ali Hajji, a solar energy specialist and engineering professor. Experts believe that the Middle East and North Africa have huge __33__ for solar energy projects. This is partly because of adequate sunlight and partly because technology has become more __34__ in the region. "The last few years have seen a realization of __35__ how competitive solar technologies can be," said Michael Taylor, a senior analyst at the International Renewable Energy Agency.', NULL, '["A) affordable","B) ancestor","C) crucial","D) depend","E) initial","F) insist","G) just","H) located","I) mostly","J) operating","K) perhaps","L) pioneer","M) potential","N) rising","O) scheduled"]', 215, 'IMPORT', 'cet4-2023-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-2-r1'
);
SET @pg_cet4_2023_06_2_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-2-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-r2', 'MATCHING', 'CET4', 'New Formula One Chief Hopes to Grab Americans'' Attention', 'A) For the past four decades, the leader of Formula One car racing, one of the biggest annual sporting series in the world, was Bernie Ecclestone, a former motorcycle parts dealer who built it into an international presence essentially on his own. B) A skilled backroom operator who speaks without a filter, Ecclestone said often that in his opinion, the sport was at its best when he was allowed to act as "a dictator." C) Yet now the dictator is gone. After an American company, Liberty Media, acquired the Formula One competition recently, Chase Carey—a former executive with Fox Broadcasting Company and DirecTV who by his own admission is not a fierce racing fan—was named to replace Ecclestone and to try to renovate the organization''s management, reach and ambition. D) Among the goals, Carey said in an interview on Tuesday, is one that just about every global sport seems interested in chasing: increasing interest in the United States. "People have said we''re going to ''Americanize'' it," Carey said. "And we''re not going to do that totally. But realistically, there are some elements of Americanization that the sport could use." E) While Formula One commands enormous audiences throughout much of the world, many American sports fans know it as that other motorsport, the one that is not Nascar(纳斯卡车赛). Formula One teams race far more technologically advanced vehicles around tracks all over the world—in magnificent events in places like Malaysia, Monaco, Singapore and the United Arab Emirates, and on tradition-rich tracks like Silverstone in England and Monza in Italy too. F) The series has an annual race in Austin, Texas. But within "a few years," Carey said, he plans to bring another to a destination American city, like New York, Los Angeles, Miami or Las Vegas. Carey''s ambitious plan is two-fold: first, change the business model of Formula One, which he said was a "one-man show" under Ecclestone that had a largely narrow vision when it came to negotiating partnership deals; and second, alter the way fans experience the sport, both in person and remotely, so that connections between the audience and people within the series are easier to make. G) Increased digital access for fans, a more behind-the-scenes experience for broadcast viewers and innovation in areas like virtual reality—what is it like to speed around a track inside a Ferrari?—are among the possibilities. "The sport has clearly been underserved," Carey said. "It doesn''t do anything digitally. There''s no marketing. It doesn''t tell any stories. The goal in this is to make the fans connect to the live experience as much as possible, and the tools you have to do that, we''re not using at all." H) The larger question, though, is a familiar one: Is there room for Formula One in the ever-crowded sports landscape of the United States? Opinions vary, particularly because viewing habits among consumers continue to evolve. John Bloom, a professor at Shippensburg University who has studied American sports history, said the biggest challenge for any sport trying to increase its presence in the United States was framing itself in a way that had lasting appeal. "Sports generally become popular in some way because they establish a narrative," Bloom said. "When I think of motorsports in the U.S., what we all think of is Nascar, and the narrative of Nascar is sort of rural, white, working-class Americans, mostly in the South, connecting with the atmosphere of those races. That''s the narrative. When I think of the narrative of Formula One, it''s a very different kind of audience." I) That difference, Carey said, is significant. While some might immediately link Formula One to Nascar in terms of American growth, Carey said Formula One''s brand research had indicated there was very little crossover; rather, Formula One fans generally cite other so-called elite events, like Wimbledon or the Ryder Cup, as competitions they enjoy. "Other than they''re both cars, the Nascar fan base is a very different fan base," Carey said. "It''s a very regional fan base. Formula One is a global, famous brand of stars. These are machines that shock and awe you." J) Carey''s background is in deal making and innovation. At Fox Broadcasting Company, he was a top advisor for years, known for his skill in helping to lead the launch of the company into sports, as well as the start of Fox News Channel. After going to DirecTV, he positioned the satellite provider as a mainstream option in millions of households. K) Now, after Liberty Media paid $4.4 billion to acquire Formula One, he is charged with making the investment pay off. "I think they can build Formula One in the U.S.," said Patrick Crakes, an executive at InVivo Media Group who spent 25 years at Fox Broadcasting Company before leaving in 2016 as a senior manager at Fox Sports. "People don''t work on their cars anymore. They don''t want that connection anymore. It''s about technology and pushing the limits. It''s about speed, danger and risk. And Formula One has that more than any other racing series." L) That is what hooked Carey, and he said he thought his experience was not unusual. He recalled attending Formula One''s Monaco race last year and being overwhelmed by the ceremony leading up to the event, the way the race charmed the city for days ahead of the start. In his mind, it felt like a Super Bowl(超级碗橄榄 球赛). M) Then, on race day, he watched as the cars rocketed out of a tunnel and went screaming toward a tight turn with the city''s harbor and the Mediterranean Sea in the background framing the scene. He was fascinated. "You can''t help but be awed," he said, "and I think that feeling can be translated to the viewer." N) He added: "The broader sport is a little too inward-looking, and we need to be more open. In some ways, I''m glad to be coming from the outside. The guys who are in the sport forever are sitting there saying: ''We can''t do that. We can''t do that because it''s never been done that way.''"', NULL, NULL, 1013, 'IMPORT', 'cet4-2023-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-2-r2'
);
SET @pg_cet4_2023_06_2_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-2-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-r3', 'CAREFUL_READING', 'CET4', NULL, 'Supermarkets have long been suffering as one of the thinnest-margined businesses in existence and one of the least-looked-forward-to places to work or visit. For more than a decade, they have been under attack from e- commerce giants, blamed for making Americans fat, and accused of contributing to climate change. Supermarkets can technically be defined as giants housing 15,000 to 60,000 different products. The revolutionary idea of a self-service grocery, where people could hunt and gather food from aisles rather than asking a clerk to fetch items from behind a counter, first came about in America. There is some debate about which was the very first, but over the years a consensus has built around King Kullen Supermarket, founded in New York in 1930. For some 300 years, Americans had fed themselves from small stores and public markets. Shopping for food involved mud, noisy chickens, clouds of flies, nasty smells, bargaining, and getting short-changed. The supermarket imitated the Fordist factory, with its emphasis on efficiency and standardization, and reimagined it as a place to buy food. Supermarkets may not feel cutting-edge now, but they were a revolution in distribution at the time. They were such strange marvels that, on her first official state visit to the United States in 1957, Queen Elizabeth II insisted on an impromptu(即兴的) tour of a suburban-Maryland Giant Food. The typical supermarket layout has barely changed over the past 90 years. Most stores open with flowers, fruit and vegetables at the front as a breath of freshness to arouse our appetite. Meanwhile, they keep the milk, eggs, and other daily basics all the way back so you''ll travel through as much of the store as possible, and be tempted along the way. In the early days, as the supermarket multiplied, so did our suspicion of it. We have long feared that this "revolution in distribution" uses corporate black magic on our appetite. The book The Hidden Persuaders, published in 1957, warned that supermarkets were putting women in a "hypnoidal trance( 催眠恍惚状态)," causing them to wander aisles bumping into boxes and "picking things off shelves at random."', NULL, NULL, 349, 'IMPORT', 'cet4-2023-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-2-r3'
);
SET @pg_cet4_2023_06_2_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-2-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-r4', 'CAREFUL_READING', 'CET4', NULL, 'The traditional school year, with three months of vacation every summer, was first implemented when America was an agricultural society and the summer months were needed for farm work. Since then, we''ve completely changed as a nation. Students no longer spend summers farming, but they aren''t in school, either. The average American student receives 13 weeks off from school each calendar year-with about 11 of those during the summer. Few other countries have more than seven weeks off in a school calendar. With the U.S. lagging behind other countries in academics, it''s time to consider year-round schooling. One benefit of this change is that students will not fall victim to the "summer slide," or the well-documented phenomenon where students forget some of the knowledge they have acquired when too much time is taken off from school. Decades of research shows that it can take from 8 to 13 weeks at the beginning of every school year for students to get back to where they were before the summer holiday. But year-round schooling isn''t just about academics. Teachers and students experience a closer relationship in year-round schools than they do in traditional schools and, in the absence of any long-term break, students do not feel detached from the school environment. These closer bonds and greater attachment pay off. Research shows that students in year-round schools are more self-confident and feel more positive about their schooling experience. But don''t kids need time to relax? Some childhood development experts believe that time off from school is vital to healthy development as kids are not designed to spend so much of their time inside classrooms and the summer break provides a perfect opportunity to get outside. The problem with this argument is that most children aren''t playing outside or even spending time with other kids. While some children visit summer camps, most stay at home, watching TV or playing games on electronic devices, which hardly benefits them. The U.S. has changed from a farming economy to a knowledge- and innovation-based economy, so it makes sense for the school year to change as well.', NULL, NULL, 349, 'IMPORT', 'cet4-2023-06-2', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-2-r4'
);
SET @pg_cet4_2023_06_2_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-2-r4' LIMIT 1);

-- 翻译 cet4-2023-06-2
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-translation'
);
SET @q_cet4_2023_06_2_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_01, '改革开放40多年以来，中国政府对高等教育越来越重视，高等教育已经进入稳步发展阶段。高校学生总数已接近4,700万人，位居世界第一。随着我国经济的快速发展，人民生活水平不断提高，越来越多的人渴望接受高等教育。我国高校的数量和学科专业持续增加，招生人数逐年上升，教学质量也在不断改进，为更多年轻人创造了接受高等教育的机会。', NULL, 'Since the reform and opening-up over 40 years ago, the Chinese government has attached increasing importance to higher education, which has now entered a stage of steady development. Today, the total number of college students has reached nearly 47 million, ranking first in the world. With the rapid development of China''s economy and the steady improvement of people''s living standards, more and more people are eager to receive higher education. Meanwhile, the number of colleges and universities in China and the disciplines they offer continue to increase, student enrollment rises year by year, and teaching quality is constantly improving, creating opportunities for more young people to receive such education.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_01
);

-- 听力 Q1 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q01', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q01'
);
SET @q_cet4_2023_06_2_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q01' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_02, NULL, '{"A":"A) A man was bitten by a snake.","B":"B) A man was taken to a hospital.","C":"C) A man kept a 4-foot snake as a pet.","D":"D) A man fell off his toilet seat."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_02
);

-- 听力 Q2 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q02', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q02'
);
SET @q_cet4_2023_06_2_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q02' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_03, NULL, '{"A":"A) Where the snake had been taken.","B":"B) Whether the snake was infected.","C":"C) How the snake was captured.","D":"D) Who owned the snake."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_03
);

-- 听力 Q3 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q03', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q03'
);
SET @q_cet4_2023_06_2_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q03' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_04, NULL, '{"A":"A) Taking her trash out in fancy dresses.","B":"B) Amusing herself by going to ball parties.","C":"C) Sharing her photos with famous movie stars.","D":"D) Posting her daughter''s photos on social media."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_04
);

-- 听力 Q4 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q04', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q04'
);
SET @q_cet4_2023_06_2_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q04' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_05, NULL, '{"A":"A) To make herself popular.","B":"B) To amuse people.","C":"C) To please her daughter.","D":"D) To record her achievements."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_05
);

-- 听力 Q5 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q05', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q05'
);
SET @q_cet4_2023_06_2_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q05' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_06, NULL, '{"A":"A) Eat as much as they want for $10.","B":"B) Have a chance of winning a $100 prize.","C":"C) Have a meal even if they have no money.","D":"D) Get a free meal after answering some questions."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_06
);

-- 听力 Q6 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q06', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q06'
);
SET @q_cet4_2023_06_2_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q06' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_07, NULL, '{"A":"A) It was brought up by two staffers.","B":"B) It helped to popularize her restaurant.","C":"C) It originated from a donation to her staff.","D":"D) It was suggested by some of her customers."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_07
);

-- 听力 Q7 NEWS
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q07', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q07'
);
SET @q_cet4_2023_06_2_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q07' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_08, NULL, '{"A":"A) Fifty customers have offered donations.","B":"B) More people have been giving than taking.","C":"C) Many people have come to eat at the restaurant.","D":"D) Most staffers have received messages of kindness."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_08
);

-- 听力 Q8 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q08', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q08'
);
SET @q_cet4_2023_06_2_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q08' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_09, NULL, '{"A":"A) He is a psychologist.","B":"B) He is a famous writer.","C":"C) He is a host for a TV program.","D":"D) He is a primary school teacher."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_09
);

-- 听力 Q9 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q09', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q09'
);
SET @q_cet4_2023_06_2_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q09' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_10, NULL, '{"A":"A) Why social media accounts vanish without a trace.","B":"B) Why parents raise their children in different ways.","C":"C) Why people fail to respond to emails promptly.","D":"D) Why friends break off contact all of a sudden."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_10
);

-- 听力 Q10 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q10', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q10'
);
SET @q_cet4_2023_06_2_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q10' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_11, NULL, '{"A":"A) They simply shut themselves down.","B":"B) They avoid showing their emotions.","C":"C) They scream to get their parents back.","D":"D) They attempt to ignore the whole situation."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_11
);

-- 听力 Q11 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q11', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q11'
);
SET @q_cet4_2023_06_2_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q11' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_12, NULL, '{"A":"A) They may regard any difference as the end of a relationship.","B":"B) They are on better terms with friends and romantic partners.","C":"C) They try to express their feelings and thoughts effectively.","D":"D) They attach more value to their relationships with others."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_12
);

-- 听力 Q12 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q12', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q12'
);
SET @q_cet4_2023_06_2_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q12' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_13, NULL, '{"A":"A) Their price.","B":"B) Their color.","C":"C) Their quality.","D":"D) Their design."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_13
);

-- 听力 Q13 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q13', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q13'
);
SET @q_cet4_2023_06_2_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q13' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_14, NULL, '{"A":"A) Jeans are a typical American garment.","B":"B) America makes the best-known brands of jeans.","C":"C) America has the best weaving tools in the world.","D":"D) Jeans are available in a greater variety in America."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_14
);

-- 听力 Q14 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q14', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q14'
);
SET @q_cet4_2023_06_2_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q14' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_15, NULL, '{"A":"A) They are artificial.","B":"B) They are natural.","C":"C) They are unique.","D":"D) They are special."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_15
);

-- 听力 Q15 LONG_DIALOGUE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q15', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q15'
);
SET @q_cet4_2023_06_2_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q15' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_16, NULL, '{"A":"A) They are for casual wearing.","B":"B) They are popular with boys.","C":"C) They are much too pricey.","D":"D) They are worth the price."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_16
);

-- 听力 Q16 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q16', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q16'
);
SET @q_cet4_2023_06_2_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q16' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_17, NULL, '{"A":"A) He desires more in life.","B":"B) He wants to see it again.","C":"C) He feels as inspired as other audience members.","D":"D) He longs to become a superstar himself."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_17
);

-- 听力 Q17 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q17', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q17'
);
SET @q_cet4_2023_06_2_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q17' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_18, NULL, '{"A":"A) It is rather unrealistic.","B":"B) It is extremely artistic.","C":"C) It is somewhat complicated.","D":"D) It is relatively predictable."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_18
);

-- 听力 Q18 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q18', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q18'
);
SET @q_cet4_2023_06_2_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q18' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_19, NULL, '{"A":"A) They are biased against women.","B":"B) They are basically misleading.","C":"C) They are full of shootings.","D":"D) They are too simple."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_19
);

-- 听力 Q19 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q19', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q19'
);
SET @q_cet4_2023_06_2_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q19' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_20, NULL, '{"A":"A) It can highlight leadership.","B":"B) It can help connect people.","C":"C) It is a means to inspire creative thinking.","D":"D) It is an intuitive way to solidify friendship."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_20
);

-- 听力 Q20 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q20', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q20'
);
SET @q_cet4_2023_06_2_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q20' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_21, NULL, '{"A":"A) Allow them to recite data points.","B":"B) Make them more open to learning.","C":"C) Enable them to remember the main idea.","D":"D) Stimulate them to engage in discussions."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_21
);

-- 听力 Q21 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q21', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q21'
);
SET @q_cet4_2023_06_2_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q21' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_22, NULL, '{"A":"A) Inspire listeners'' imagination.","B":"B) Convey fundamental values.","C":"C) Enrich their own experience.","D":"D) Explain insightful ideas."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_22
);

-- 听力 Q22 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q22', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q22'
);
SET @q_cet4_2023_06_2_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q22' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_23, NULL, '{"A":"A) Immigrants outnumber U.S.-born Americans.","B":"B) Immigrants have been contributing to the U.S.","C":"C) Another wave of immigrants is hitting the U.S.","D":"D) The number of immigrants to the U.S. is declining."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_23
);

-- 听力 Q23 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q23', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q23'
);
SET @q_cet4_2023_06_2_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q23' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_24, NULL, '{"A":"A) More of them expect their children to succeed in business.","B":"B) They have fewer chances to be hired by U.S. companies.","C":"C) They have founded most Fortune 500 companies.","D":"D) More of them are successful business people."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_24
);

-- 听力 Q24 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q24', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q24'
);
SET @q_cet4_2023_06_2_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q24' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_25, NULL, '{"A":"A) They have higher installment loan debt than native-born Americans.","B":"B) Nineteen percent of them borrow money from friends and family.","C":"C) Their level of debt is lower than that of native-born Americans.","D":"D) Thirty-four percent of them use credit for their daily purchases."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_25
);

-- 听力 Q25 PASSAGE
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q25', 4, 'CET4', 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q25'
);
SET @q_cet4_2023_06_2_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q25' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_26, NULL, '{"A":"A) Keep their traditional values and old habits.","B":"B) Find employment in competitive businesses.","C":"C) Borrow money from financial institutions.","D":"D) Collaborate with native-born Americans."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_26
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q26'
);
SET @q_cet4_2023_06_2_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_27, NULL, '{"A":"A) affordable","B":"B) ancestor","C":"C) crucial","D":"D) depend","E":"E) initial","F":"F) insist","G":"G) just","H":"H) located","I":"I) mostly","J":"J) operating","K":"K) perhaps","L":"L) pioneer","M":"M) potential","N":"N) rising","O":"O) scheduled"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_27
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q27'
);
SET @q_cet4_2023_06_2_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_28, NULL, '{"A":"A) affordable","B":"B) ancestor","C":"C) crucial","D":"D) depend","E":"E) initial","F":"F) insist","G":"G) just","H":"H) located","I":"I) mostly","J":"J) operating","K":"K) perhaps","L":"L) pioneer","M":"M) potential","N":"N) rising","O":"O) scheduled"}', 'O', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_28
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q28'
);
SET @q_cet4_2023_06_2_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_29, NULL, '{"A":"A) affordable","B":"B) ancestor","C":"C) crucial","D":"D) depend","E":"E) initial","F":"F) insist","G":"G) just","H":"H) located","I":"I) mostly","J":"J) operating","K":"K) perhaps","L":"L) pioneer","M":"M) potential","N":"N) rising","O":"O) scheduled"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_29
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q29'
);
SET @q_cet4_2023_06_2_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_30, NULL, '{"A":"A) affordable","B":"B) ancestor","C":"C) crucial","D":"D) depend","E":"E) initial","F":"F) insist","G":"G) just","H":"H) located","I":"I) mostly","J":"J) operating","K":"K) perhaps","L":"L) pioneer","M":"M) potential","N":"N) rising","O":"O) scheduled"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_30
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q30'
);
SET @q_cet4_2023_06_2_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_31, NULL, '{"A":"A) affordable","B":"B) ancestor","C":"C) crucial","D":"D) depend","E":"E) initial","F":"F) insist","G":"G) just","H":"H) located","I":"I) mostly","J":"J) operating","K":"K) perhaps","L":"L) pioneer","M":"M) potential","N":"N) rising","O":"O) scheduled"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_31
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q31'
);
SET @q_cet4_2023_06_2_32 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_32, NULL, '{"A":"A) affordable","B":"B) ancestor","C":"C) crucial","D":"D) depend","E":"E) initial","F":"F) insist","G":"G) just","H":"H) located","I":"I) mostly","J":"J) operating","K":"K) perhaps","L":"L) pioneer","M":"M) potential","N":"N) rising","O":"O) scheduled"}', 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_32
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q32'
);
SET @q_cet4_2023_06_2_33 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_33, NULL, '{"A":"A) affordable","B":"B) ancestor","C":"C) crucial","D":"D) depend","E":"E) initial","F":"F) insist","G":"G) just","H":"H) located","I":"I) mostly","J":"J) operating","K":"K) perhaps","L":"L) pioneer","M":"M) potential","N":"N) rising","O":"O) scheduled"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_33
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q33'
);
SET @q_cet4_2023_06_2_34 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_34, NULL, '{"A":"A) affordable","B":"B) ancestor","C":"C) crucial","D":"D) depend","E":"E) initial","F":"F) insist","G":"G) just","H":"H) located","I":"I) mostly","J":"J) operating","K":"K) perhaps","L":"L) pioneer","M":"M) potential","N":"N) rising","O":"O) scheduled"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_34
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q34'
);
SET @q_cet4_2023_06_2_35 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_35, NULL, '{"A":"A) affordable","B":"B) ancestor","C":"C) crucial","D":"D) depend","E":"E) initial","F":"F) insist","G":"G) just","H":"H) located","I":"I) mostly","J":"J) operating","K":"K) perhaps","L":"L) pioneer","M":"M) potential","N":"N) rising","O":"O) scheduled"}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_35
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q35'
);
SET @q_cet4_2023_06_2_36 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_36, NULL, '{"A":"A) affordable","B":"B) ancestor","C":"C) crucial","D":"D) depend","E":"E) initial","F":"F) insist","G":"G) just","H":"H) located","I":"I) mostly","J":"J) operating","K":"K) perhaps","L":"L) pioneer","M":"M) potential","N":"N) rising","O":"O) scheduled"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_36
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q36'
);
SET @q_cet4_2023_06_2_37 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_37, 'Chase Carey believes greater use should be made of digital technology to make Formula One more accessible to its fans.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_37
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q37'
);
SET @q_cet4_2023_06_2_38 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_38, 'Chase Carey was deeply impressed by the ceremony preceding last year''s Monaco race.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_38
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q38'
);
SET @q_cet4_2023_06_2_39 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_39, 'One of Chase Carey''s goals is to make Formula One more appealing to Americans.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_39
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q39'
);
SET @q_cet4_2023_06_2_40 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_40, 'A former motorbike parts dealer led Formula One for the past forty years.', NULL, 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_40
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q40'
);
SET @q_cet4_2023_06_2_41 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_41, 'Chase Carey thought the audience of Formula One could be made to share his feeling about the race.', NULL, 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_41
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q41'
);
SET @q_cet4_2023_06_2_42 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_42, 'Chase Carey used to serve as a top advisor for a major broadcasting company.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_42
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q42'
);
SET @q_cet4_2023_06_2_43 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_43, 'Chase Carey intends to make connections easier between the audience and the Formula One racers.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_43
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q43'
);
SET @q_cet4_2023_06_2_44 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_44, 'The new leader of Formula One admitted he was not super interested in car racing.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_44
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q44'
);
SET @q_cet4_2023_06_2_45 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_45, 'People''s opinions differ as to whether Formula One can be promoted in the U.S.', NULL, 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_45
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q45'
);
SET @q_cet4_2023_06_2_46 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_46, 'Compared with other racing series, Formula One focuses more on speed and involves more danger.', NULL, 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_46
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q46'
);
SET @q_cet4_2023_06_2_47 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_47, 'What problem have supermarkets been facing?', '{"A":"A) They are actually on the way to bankruptcy.","B":"B) They have been losing customers and profits.","C":"C) They are forced to use e-commerce strategies.","D":"D) They have difficulty adapting to climate change."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_47
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q47'
);
SET @q_cet4_2023_06_2_48 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_48, 'What does the passage say about the idea of a self-service grocery?', '{"A":"A) It was put forward by King Kullen.","B":"B) It originated in the United States.","C":"C) It has been under constant debate.","D":"D) It proves revolutionary even today."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_48
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q48'
);
SET @q_cet4_2023_06_2_49 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_49, 'What did supermarkets do by adopting the Fordist factory approach?', '{"A":"A) They modernized traditional groceries in many ways.","B":"B) They introduced cutting-edge layout of their stores.","C":"C) They improved the quality of the food they sold.","D":"D) They revolutionized the distribution of goods."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_49
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q49'
);
SET @q_cet4_2023_06_2_50 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_50, 'What is the typical supermarket layout intended to do?', '{"A":"A) Arouse customers'' appetite to buy flowers, fruit and vegetables.","B":"B) Provide customers easy access to items they want to buy.","C":"C) Induce customers to make more unplanned purchases.","D":"D) Enable customers to have a more enjoyable shopping experience."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_50
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q50'
);
SET @q_cet4_2023_06_2_51 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_51, 'What have people long feared about supermarkets?', '{"A":"A) They use tricky strategies to promote their business.","B":"B) They are going to replace the local groceries entirely.","C":"C) They apply corporate black magic to the goods on display.","D":"D) They take advantage of the weaknesses of women shoppers."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_51
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q51'
);
SET @q_cet4_2023_06_2_52 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_52, 'Why did America''s traditional school year have a three-month summer vacation?', '{"A":"A) Students needed to help with farm work.","B":"B) Students needed time to learn necessary farming skills.","C":"C) The agricultural society then attached less importance to academics.","D":"D) America lagged behind other countries in making a scientific school calendar."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_52
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q52'
);
SET @q_cet4_2023_06_2_53 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_53, 'What benefit will year-round schooling bring students in addition to improving their learning?', '{"A":"A) It will help them get back to where their lessons started.","B":"B) It will enable them to absorb what they have learned.","C":"C) It will familiarize them with the school environment.","D":"D) It will strengthen their relationship with teachers."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_53
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q53'
);
SET @q_cet4_2023_06_2_54 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_54, 'What do some childhood development experts believe about the long summer vacation?', '{"A":"A) It meets students'' need to study on their own.","B":"B) It enables students to learn about the outside world.","C":"C) It satisfies students'' desire to stay longer at home.","D":"D) It contributes to students'' healthy growth."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_54
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q54'
);
SET @q_cet4_2023_06_2_55 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_55, 'What is the argument against the experts'' idea of a long summer vacation?', '{"A":"A) It does little good to most students.","B":"B) It benefits few students playing outside.","C":"C) It leads students to neglect their studies.","D":"D) It makes students addicted to computer games."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_55
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-2-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_2_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-2', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q55'
);
SET @q_cet4_2023_06_2_56 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-2-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_2_56, 'What does the author think of the traditional school year in the U.S. today?', '{"A":"A) Well-grounded.","B":"B) Culture-bound.","C":"C) Outdated.","D":"D) Welcomed."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_2_56
);

-- ==================== cet4-2023-06-3 ====================
-- 文章 r1
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-r1', 'BANKED_CLOZE', 'CET4', NULL, 'Whether you''re just having a down day or a down period, taking a walk can instantly lift your mood, especially when you go outdoors. Not only can walking make you less depressed, but according to a new study, depression sufferers who took a __26__ walk showed just as much improvement in their __27__ as people taking medicine. In fact, 60-70 percent of the participants in the study could no longer even be __28__ as depressed. Bone density may not be one of the most exciting health benefits of walking, but it''s an important one. People with stronger bones avoid osteoporosis(骨质疏松症) and all the problems that __29__ with it, like breaks and other disabilities. And the best way to get strong, healthy bones is by doing weight-bearing exercises like running, dancing and walking, according to a large study. But as regards bones, it''s __30__ use it or lose it: To keep your bones strong you have to keep exercising. The researchers found that adults who walked regularly had better bone density throughout their lives than their __31__ friends. Taking a walk can be great for __32__ your head or blowing off some steam. It also provides a great opportunity to __33__ with friends and family, far away from electronics and other __34__ at home. Even better, you set a powerful example because when they see you __35__ the benefits of walking, they''ll be encouraged to walk more, too.', NULL, '["A) accompany","B) approved","C) bond","D) classified","E) clearing","F) come","G) daily","H) definitely","I) distractions","J) exclusively","K) inactive","L) occurrences","M) reaping","N) symptoms","O) typical"]', 237, 'IMPORT', 'cet4-2023-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-3-r1'
);
SET @pg_cet4_2023_06_3_r1 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-3-r1' LIMIT 1);

-- 文章 r2
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-r2', 'MATCHING', 'CET4', 'A Club Where Lions Dance and Traditions Take Root', 'A) The first thing you notice in the staircase to the fourth-floor studio on Canal Street in Manhattan, New York, is the measured thumping(嘭嘭声) coming from behind a metal door. Just beyond the entrance, large lion masks were twisting and turning to the drum-beat. On a recent Friday evening, the teenagers made their way across the studio floor as they practiced Chinese lion dancing. B) "You want to play in a circle," Victor Fong, aged 24, told his students at the New York Chinese Freemasons Athletic Club. "Take it slow and do it again." The dance group, made up of 60 members, performs throughout the year but was now preparing for its biggest events, Chinese Lunar New Year celebrations, which will begin on Saturday and conclude on February 15. Teenagers comprise about half of the group, many of whom began lion dancing at the age of 14. About 100 current and past members of the dance group —which has been performing since 1956—will be among the 220 groups marching through Chinatown in Manhattan for the 18th Lunar New Year Parade on February 5. C) Mr. Fong has been involved in the organization since he was 15 and began teaching lion dancing three years ago. But the club also acts as a recreation center and safe haven(庇护所) for teenagers, with video games readily available. As many as 20 students show up after school. "The basic requirement for hanging out here is you have to learn how to lion dance," Mr. Fong said. While that is not a formal requirement for being a member, everyone finds a way to participate in the Lunar New Year Parade, whether it''s by dancing, carrying a flag or beating a drum. D) Alvin Chau, aged 26, is an environmental consultant by day and a lion dancer on weekends. He has been a club member for 10 years and joined because of an interest in lion dance. "We''re a big family," he said, shaking hands with other members as they walked through the door. "You know everyone." E) It is believed that the lion dance began in the third century. Stories vary about how lion dancing came to be, but most of them include a monster named Nian who would terrorize a village. The villagers finally banded together and scared the beast away with firecrackers(爆竹) and drums. While lions are not native to China, some versions of the story include the villagers creating a monster of their own in the shape of a lion to fight off the beast. F) Today, the dancers travel across Chinatown going from business to business to bring good luck for the coming year. The new year—according to the Chinese lunar calendar—will begin on Saturday and marks the Year of the Rooster(鸡年), which is thought to be a symbol of positivity. "It''s almost like the dark night is ending and the sun is coming up," said Ya Yung Teng, the digital collections coordinator for the Museum of Chinese in America. "It''s hopeful that we''re going to have a new day." Roosters and chickens are not particularly strong creatures, Ms. Teng said, but they are numerous. "In a way," she said, the rooster "stands for ''We the People.''" G) The lion head and tail are operated by two people. As one person controls the head, a second follows under a train of fabric representing the body. The dancers move in harmony as they imitate the animal''s natural movements in the wild, including the aggressiveness of an attack. A lion head figure weighs under 10 pounds and sits squarely on the dancer''s shoulders. Inside, the dancer manipulates strings that open and close the lion''s eyes, shake its ears and open its mouth to reveal a fire-orange tongue. H) "A good lion dancer will imitate a living creature," said Karlin Chan, aged 59, who heads the athletic club''s community public relations. "I started lion dancing when I was a kid," he said. "Chinatown was much smaller then and it was a celebration with fireworks and firecrackers, which added a lot of flavor and meaning to it." I) Mr. Chan buys a new lion head each year when he travels to China. A head costs about $1,500. "If you want the good stuff, the quality, you have to see it for yourself," he said. "I''ll inspect the product before we put it in the container and ship it over." Mr. Chan, who has been involved with the club for nearly 50 years, said that passing the dance from one generation to the next was vital. "You need to pass on the traditions and the culture, and this is a part of our culture," he said. "It''s a great way to promote cultural understanding and exchange; we welcome that." J) For Sara Pore, aged 17, another club member, lion dance is more than just tradition; it provides a creative outlet. "Lion dancing started 2,000 years ago—that''s incredible," she said. "But what makes you a competent lion dancer is that there''s a sense of imagination involved. Lion dancing teaches competence in leadership because of this. You''re constantly forced to push yourself past your limit." K) Back at rehearsal(排练), Just in Le, aged 18, tied a red ribbon around his waist to practice jumping. The dancers use the ribbons to pull themselves up over their partners'' heads. The room''s ceilings are too low to wear the lion heads for jumping practice, so once up on his partner''s head, Mr. Le held out his arms as if in offering. L) Mr. Le comes by the dance as a legacy(传承). "I was born into it," Mr. Le said, noting that his uncle and father were club members. "Growing up, I would always watch my family and see the lion dance, and I slowly grew interested in it." By the age of 14, he was fully enrolled in the athletic club''s lion dance group. "I value my culture and tradition, being Chinese or Asian-American. I have a lot of pride in that," he said. "I want to contribute and give back to the community."', NULL, NULL, 1012, 'IMPORT', 'cet4-2023-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-3-r2'
);
SET @pg_cet4_2023_06_3_r2 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-3-r2' LIMIT 1);

-- 文章 r3
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-r3', 'CAREFUL_READING', 'CET4', NULL, 'Team-building exercises have become popular for managers trying to increase organisational and team harmony and productivity. Unfortunately many employees resent compulsory bonding and often regard these exercises as a nuisance. A paper published this week by University of Sydney researchers in Social Networks has reported participants'' feelings about team-building interventions(干预), revealing ethical implications in forcing employees to take part. "Many people see team-building activities as a waste of time, so we decided to look in more depth at what''s behind this," said the paper''s lead researcher, Dr. Peter Matous. "Teams are formed, combined and restructured. Staff are relocated and office spaces redesigned. All this is done with the aim of improving workplace efficiency, collaboration and cohesion. But does any of this work?" said Dr. Matous. The study found that team-building exercises which focused on the sharing of and intervening into personal attitudes and relationships between team members were considered too heavy-handed and intrusive, although the researchers say some degree of openness and vulnerability is often necessary to make deep, effective connections with colleagues. "Some participants were against team-building exercises because they were implicitly compulsory. They didn''t welcome management''s interest in their lives beyond their direct work performance," said Matous. "Many people don''t want to be forced into having fun or making friends, especially not on top of their busy jobs. They feel management is being too nosy or trying to control their lives too much." In this study the researchers recommended a self-disclosure(表露) approach where participants were guided through a series of questions that allowed them to increasingly disclose personal information and values. The method is well-tested and has been shown to increase interpersonal closeness. However, to be successful it must be voluntary. The researchers said there are numerous schools of thought that propose differing psychological methods for strengthening relationships. "With caution, many relational methods to improve teams and organisations can be borrowed from other fields. The question is how to apply them effectively to strengthen an entire collective, which is more than just the sum of individual relationships," said Dr. Matous.', NULL, NULL, 342, 'IMPORT', 'cet4-2023-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-3-r3'
);
SET @pg_cet4_2023_06_3_r3 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-3-r3' LIMIT 1);

-- 文章 r4
INSERT INTO `reading_passage`
  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-r4', 'CAREFUL_READING', 'CET4', NULL, 'There are close to 58,000 homeless people in Los Angeles county. That''s a shocking and tragic number for a region that''s home to some of the richest people in the world. At last, the problem became so acute—and so visible—that Los Angeles took extraordinary action. The citizens of this county voted in November 2016 and again in March 2017 to raise their own taxes. The purpose of such action is to fund an enormous multibillion- dollar, 10-year program of housing and social services for the homeless. As a result, Los Angeles now has its best chance in decades to combat homelessness. This is an opportunity that surely all can agree must not be wasted. It is neither desirable nor morally acceptable nor practical for this county to tolerate the signs of deprivation more commonly associated with the slums(贫民窟) of Rio de Janiero. How did we get here? For as long as there are homeless people, there is a tendency to blame the victims themselves for their condition—to see their failure to thrive as an issue of character, of moral weakness, of laziness. But contrary to popular belief, the homeless in Los Angeles are not mostly mentally ill or drug addicted or frightening, although a sizable minority meet some of those descriptions. Today, a greater and greater proportion of people living on the streets are there because of bad luck or a series of mistakes, or because the economy forgot them—they lost a job or were evicted(逐出) or fled an abusive marriage just as the housing market was growing increasingly unforgiving. The challenges are enormous, even if everyone is pulling in the same direction. That reality was driven home this month by a new Los Angeles Homeless Services Authority report showing that the county''s homeless population is growing faster than the supply of new housing. In the world''s richest nation, homelessness on this scale should be shameful and shocking. But most Los Angeles residents are no longer either shocked or shamed. Increasingly, we are uncomfortable, annoyed, disgusted, scared or unaware. Compassion(同情心) is being replaced by resignation.', NULL, NULL, 345, 'IMPORT', 'cet4-2023-06-3', 0, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-3-r4'
);
SET @pg_cet4_2023_06_3_r4 = (SELECT `id` FROM `reading_passage` WHERE `external_key` = 'cet4-2023-06-3-r4' LIMIT 1);

-- 翻译 cet4-2023-06-3
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-translation', 3, 'CET4', 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-translation'
);
SET @q_cet4_2023_06_3_01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-translation' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_01, '中国政府一直大力推行义务教育(compulsory education) ,以使每个儿童都享有受教育的机会。自1986年《义务教育法》生效以来，经过不懈努力，实现了在全国推行义务教育的目标。如今，在中国, 儿童年满六周岁开始上小学, 从小学到初中一共接受九年义务教育。从2008年秋季学期开始, 义务教育阶段学生无须缴纳学费。随着一系列教育改革举措的实施, 中国义务教育的质量也有显著提高。', NULL, 'The Chinese government has been vigorously promoting compulsory education so that every child can have access to education. Since the Compulsory Education Law came into effect in 1986, China has, through unremitting efforts, achieved the goal of making compulsory education available nationwide. Today in China, children start primary school at the age of six and receive a total of nine years of compulsory education from primary school to junior high school. Since the autumn semester of 2008, students in the compulsory education stage have no longer had to pay tuition fees. With the implementation of a series of educational reform measures, the quality of compulsory education in China has also improved significantly.', '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_01
);

-- 阅读 Q26 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q26', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q26'
);
SET @q_cet4_2023_06_3_02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q26' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_02, NULL, '{"A":"A) accompany","B":"B) approved","C":"C) bond","D":"D) classified","E":"E) clearing","F":"F) come","G":"G) daily","H":"H) definitely","I":"I) distractions","J":"J) exclusively","K":"K) inactive","L":"L) occurrences","M":"M) reaping","N":"N) symptoms","O":"O) typical"}', 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_02
);

-- 阅读 Q27 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q27', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q27'
);
SET @q_cet4_2023_06_3_03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q27' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_03, NULL, '{"A":"A) accompany","B":"B) approved","C":"C) bond","D":"D) classified","E":"E) clearing","F":"F) come","G":"G) daily","H":"H) definitely","I":"I) distractions","J":"J) exclusively","K":"K) inactive","L":"L) occurrences","M":"M) reaping","N":"N) symptoms","O":"O) typical"}', 'N', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_03
);

-- 阅读 Q28 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q28', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q28'
);
SET @q_cet4_2023_06_3_04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q28' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_04, NULL, '{"A":"A) accompany","B":"B) approved","C":"C) bond","D":"D) classified","E":"E) clearing","F":"F) come","G":"G) daily","H":"H) definitely","I":"I) distractions","J":"J) exclusively","K":"K) inactive","L":"L) occurrences","M":"M) reaping","N":"N) symptoms","O":"O) typical"}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_04
);

-- 阅读 Q29 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q29', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q29'
);
SET @q_cet4_2023_06_3_05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q29' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_05, NULL, '{"A":"A) accompany","B":"B) approved","C":"C) bond","D":"D) classified","E":"E) clearing","F":"F) come","G":"G) daily","H":"H) definitely","I":"I) distractions","J":"J) exclusively","K":"K) inactive","L":"L) occurrences","M":"M) reaping","N":"N) symptoms","O":"O) typical"}', 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_05
);

-- 阅读 Q30 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q30', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q30'
);
SET @q_cet4_2023_06_3_06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q30' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_06, NULL, '{"A":"A) accompany","B":"B) approved","C":"C) bond","D":"D) classified","E":"E) clearing","F":"F) come","G":"G) daily","H":"H) definitely","I":"I) distractions","J":"J) exclusively","K":"K) inactive","L":"L) occurrences","M":"M) reaping","N":"N) symptoms","O":"O) typical"}', 'H', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_06
);

-- 阅读 Q31 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q31', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q31'
);
SET @q_cet4_2023_06_3_07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q31' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_07, NULL, '{"A":"A) accompany","B":"B) approved","C":"C) bond","D":"D) classified","E":"E) clearing","F":"F) come","G":"G) daily","H":"H) definitely","I":"I) distractions","J":"J) exclusively","K":"K) inactive","L":"L) occurrences","M":"M) reaping","N":"N) symptoms","O":"O) typical"}', 'K', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_07
);

-- 阅读 Q32 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q32', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q32'
);
SET @q_cet4_2023_06_3_08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q32' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_08, NULL, '{"A":"A) accompany","B":"B) approved","C":"C) bond","D":"D) classified","E":"E) clearing","F":"F) come","G":"G) daily","H":"H) definitely","I":"I) distractions","J":"J) exclusively","K":"K) inactive","L":"L) occurrences","M":"M) reaping","N":"N) symptoms","O":"O) typical"}', 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_08
);

-- 阅读 Q33 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q33', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q33'
);
SET @q_cet4_2023_06_3_09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q33' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_09, NULL, '{"A":"A) accompany","B":"B) approved","C":"C) bond","D":"D) classified","E":"E) clearing","F":"F) come","G":"G) daily","H":"H) definitely","I":"I) distractions","J":"J) exclusively","K":"K) inactive","L":"L) occurrences","M":"M) reaping","N":"N) symptoms","O":"O) typical"}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_09
);

-- 阅读 Q34 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q34', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q34'
);
SET @q_cet4_2023_06_3_10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q34' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_10, NULL, '{"A":"A) accompany","B":"B) approved","C":"C) bond","D":"D) classified","E":"E) clearing","F":"F) come","G":"G) daily","H":"H) definitely","I":"I) distractions","J":"J) exclusively","K":"K) inactive","L":"L) occurrences","M":"M) reaping","N":"N) symptoms","O":"O) typical"}', 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_10
);

-- 阅读 Q35 BANKED_CLOZE (r1)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q35', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r1, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q35'
);
SET @q_cet4_2023_06_3_11 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q35' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_11, NULL, '{"A":"A) accompany","B":"B) approved","C":"C) bond","D":"D) classified","E":"E) clearing","F":"F) come","G":"G) daily","H":"H) definitely","I":"I) distractions","J":"J) exclusively","K":"K) inactive","L":"L) occurrences","M":"M) reaping","N":"N) symptoms","O":"O) typical"}', 'M', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_11
);

-- 阅读 Q36 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q36', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q36'
);
SET @q_cet4_2023_06_3_12 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q36' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_12, 'The lion dancers perform from door to door to bring New Year wishes to business people.', NULL, 'F', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_12
);

-- 阅读 Q37 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q37', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q37'
);
SET @q_cet4_2023_06_3_13 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q37' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_13, 'The New York dance club also serves as a place for entertainment where youngsters can enjoy themselves safely.', NULL, 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_13
);

-- 阅读 Q38 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q38', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q38'
);
SET @q_cet4_2023_06_3_14 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q38' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_14, 'Lion dancers need to have a little imagination to perform well.', NULL, 'J', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_14
);

-- 阅读 Q39 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q39', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q39'
);
SET @q_cet4_2023_06_3_15 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q39' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_15, 'There are a number of different versions about the origin of the lion dance.', NULL, 'E', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_15
);

-- 阅读 Q40 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q40', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q40'
);
SET @q_cet4_2023_06_3_16 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q40' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_16, 'Some 50% of the members of a New York lion dance club are teenagers.', NULL, 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_16
);

-- 阅读 Q41 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q41', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q41'
);
SET @q_cet4_2023_06_3_17 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q41' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_17, 'One club member says he feels proud of his cultural tradition.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_17
);

-- 阅读 Q42 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q42', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q42'
);
SET @q_cet4_2023_06_3_18 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q42' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_18, 'Two dancers coordinate their movements, one manipulating the lion''s head and the other its body.', NULL, 'G', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_18
);

-- 阅读 Q43 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q43', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q43'
);
SET @q_cet4_2023_06_3_19 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q43' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_19, 'One lion dancer compares their New York dance club to a family.', NULL, 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_19
);

-- 阅读 Q44 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q44', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q44'
);
SET @q_cet4_2023_06_3_20 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q44' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_20, 'Lion dance should be handed down to future generations as part of Chinese culture.', NULL, 'I', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_20
);

-- 阅读 Q45 MATCHING (r2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q45', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r2, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q45'
);
SET @q_cet4_2023_06_3_21 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q45' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_21, 'One lion dancer learned how to perform from his elders.', NULL, 'L', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_21
);

-- 阅读 Q46 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q46', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q46'
);
SET @q_cet4_2023_06_3_22 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q46' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_22, 'Why are many employees opposed to team-building exercises?', '{"A":"A) They consider such exercises annoying.","B":"B) They deem these exercises counter-productive.","C":"C) They see such exercises as harmful to harmony.","D":"D) They find these exercises too demanding."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_22
);

-- 阅读 Q47 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q47', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q47'
);
SET @q_cet4_2023_06_3_23 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q47' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_23, 'What did Dr. Matous and his team do to find out whether team-building activities would improve productivity?', '{"A":"A) They relocated team leaders and their offices.","B":"B) They rearranged the staff and office spaces.","C":"C) They redesigned the staff''s work schedules.","D":"D) They reintroduced some cohesive activities."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_23
);

-- 阅读 Q48 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q48', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q48'
);
SET @q_cet4_2023_06_3_24 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q48' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_24, 'What did the study by Matous'' team find about some team-building exercises?', '{"A":"A) They were intended to share personal attitudes and relationships.","B":"B) They implicitly added to the vulnerability of team members.","C":"C) They invariably strengthened connections among colleagues.","D":"D) They were regarded as an intrusion into employees'' private lives."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_24
);

-- 阅读 Q49 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q49', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q49'
);
SET @q_cet4_2023_06_3_25 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q49' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_25, 'How can the self-disclosure approach succeed in increasing interpersonal closeness?', '{"A":"A) By allowing participants freedom to express themselves.","B":"B) By applying it to employees who volunteer to participate.","C":"C) By arranging in proper order the questions participants face.","D":"D) By guiding employees through a series of steps in team building."}', 'B', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_25
);

-- 阅读 Q50 CAREFUL_READING (r3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q50', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r3, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q50'
);
SET @q_cet4_2023_06_3_26 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q50' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_26, 'What does Matous think of the various psychological methods borrowed from other fields for strengthening relationships?', '{"A":"A) They must be used in combination for an entire collective.","B":"B) They prioritise some psychological aspects over others.","C":"C) They place too much stress on individual relationships.","D":"D) They have to be applied cautiously to be effective."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_26
);

-- 阅读 Q51 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q51', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q51'
);
SET @q_cet4_2023_06_3_27 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q51' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_27, 'Why did the citizens of Los Angeles vote to raise their own taxes?', '{"A":"A) To combat the county''s homelessness.","B":"B) To reform the county''s service system.","C":"C) To fund the development of local infrastructure.","D":"D) To narrow the gap between the rich and the poor."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_27
);

-- 阅读 Q52 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q52', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q52'
);
SET @q_cet4_2023_06_3_28 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q52' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_28, 'What do people tend to believe about the homeless?', '{"A":"A) They seldom meet the descriptions of homelessness.","B":"B) They are the victims of fast economic development.","C":"C) They are responsible for their own condition.","D":"D) They account for the majority of drug addicts."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_28
);

-- 阅读 Q53 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q53', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q53'
);
SET @q_cet4_2023_06_3_29 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q53' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_29, 'What is one of the causes for more and more people in Los Angeles to become homeless?', '{"A":"A) They find it increasingly difficult to afford a place to live.","B":"B) The divorce rate in the county has been on a steady rise.","C":"C) They have been compelled to take low-paying jobs.","D":"D) The society fails to forgive them for their mistakes."}', 'A', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_29
);

-- 阅读 Q54 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q54', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q54'
);
SET @q_cet4_2023_06_3_30 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q54' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_30, 'What do we learn from the new Los Angeles Homeless Services Authority report?', '{"A":"A) Supplying enough job opportunities for the homeless remains a challenge.","B":"B) Everyone is pulling in the same direction to solve the homelessness problem.","C":"C) The increase in new housing falls short of the demand of the growing homeless population.","D":"D) Los Angeles'' homeless condition is deteriorating faster than many people predict."}', 'C', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_30
);

-- 阅读 Q55 CAREFUL_READING (r4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)
SELECT
  'cet4-2023-06-3-q55', 7, 'CET4', 3, 'CHOICE', NULL, @pg_cet4_2023_06_3_r4, 'IMPORT', NULL, 0, 0, 0, 'cet4-2023-06-3', NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q55'
);
SET @q_cet4_2023_06_3_31 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'cet4-2023-06-3-q55' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT
  @q_cet4_2023_06_3_31, 'How do most Los Angeles residents now feel about homelessness?', '{"A":"A) They are increasingly ashamed about its scale.","B":"B) They find it no more scaring than it appears.","C":"C) They are less and less indifferent to it.","D":"D) They no longer find it shocking."}', 'D', NULL, NOW(), NOW()
WHERE NOT EXISTS (
  SELECT 1 FROM `question_content` WHERE `question_id` = @q_cet4_2023_06_3_31
);

COMMIT;
