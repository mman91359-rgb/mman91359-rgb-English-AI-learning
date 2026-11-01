-- V1.0.4：修正 pilot 听力题目 OCR 文本（选项撇号、解析截断/串入下一段）
-- 目标库：exercise_db；纯 DML；按 external_key 定向更新 18 条。
-- 执行前仍按迁移规范预览、备份、审批。

START TRANSACTION;

-- Q1
UPDATE `question_content` qc
JOIN `question_info` qi ON qi.id = qc.question_id
SET qc.`options` = '{"A":"She hasn''t started writing it.","B":"She hasn''t decided on a topic.","C":"She is proofreading the first draft.","D":"She is working on the references."}',
    qc.`analysis` = '细节辨认题。对话一开始, 男士询问女士的论文进度，女士在句(1)中回答说她还没开始写。 因此答案为 A )。',
    qc.`updated_at` = NOW()
WHERE qi.`external_key` = 'cet6-2022-12-1-q01';

-- Q2
UPDATE `question_content` qc
JOIN `question_info` qi ON qi.id = qc.question_id
SET qc.`options` = '{"A":"He lent many books to the man for reference.","B":"He offered the man advice on resource hunting.","C":"He published a lot in a number of reputable journals.","D":"He told the man to be selective when using e-resources."}',
    qc.`analysis` = '细节辨认题。句(2)中男士提到，他在开始写论文之前先和教授讨论了去哪里找资料的问题。 基于这个讨论，他在图书馆找到了参考书，并在网上找到了大量知名期刊文章。因此答案为 B )。',
    qc.`updated_at` = NOW()
WHERE qi.`external_key` = 'cet6-2022-12-1-q02';

-- Q3
UPDATE `question_content` qc
JOIN `question_info` qi ON qi.id = qc.question_id
SET qc.`options` = '{"A":"He didn''t think her dissertation topic viable.","B":"He wasn''t interested in her dissertation topic.","C":"He didn''t want her to rush through her dissertation.","D":"He wasn''t specific about the length of her dissertation."}',
    qc.`analysis` = '细节辨认题。女士认为自己无法开始写论文是因为自己的题目不可行。根据句(3 )可知，她的教授确实在一开始的时候提醒她可能会找不到足够的资料。因此答案为 A )。',
    qc.`updated_at` = NOW()
WHERE qi.`external_key` = 'cet6-2022-12-1-q03';

-- Q4
UPDATE `question_content` qc
JOIN `question_info` qi ON qi.id = qc.question_id
SET qc.`options` = '{"A":"Change her research methodology.","B":"Narrow down her dissertation topic.","C":"Consult her professor more.","D":"Follow the man''s advice."}',
    qc.`analysis` = '细节推断题。男士认为女士的论文题目太过狭窄，如果将题目扩大可能会找到更多资料。根据句(4)可知，女士认为扩大题目是个好主意, 她会将对其他地区的民间传说的描述囊括进来。由此可知，女士会听从男士的建议。因此答案为 D )。',
    qc.`updated_at` = NOW()
WHERE qi.`external_key` = 'cet6-2022-12-1-q04';

-- Q5
UPDATE `question_content` qc
JOIN `question_info` qi ON qi.id = qc.question_id
SET qc.`options` = '{"A":"He has translated 12 books.","B":"He is a well-known nutritionist.","C":"His books sell well worldwide.","D":"His latest book sold a million copies."}',
    qc.`analysis` = '细节推断题。句（5-1）中女士介绍说，约翰不仅是一位受人尊敬的作家, 还是当今为数不多的撰写科学类文书的名人作家之一。根据句（5-2）可知, 男士的 4 部著作在全球总共售出了 700 万册， 并被翻译成 12 种不同的语言。由此可知, 男士的著作畅销全世界。因此答案为 C）。',
    qc.`updated_at` = NOW()
WHERE qi.`external_key` = 'cet6-2022-12-1-q05';

-- Q6
UPDATE `question_content` qc
JOIN `question_info` qi ON qi.id = qc.question_id
SET qc.`options` = '{"A":"The desire of Americans to try exotic cuisines.","B":"The demand for information about food safety.","C":"The fact that over half of Americans are overweight.","D":"The fact that science books are difficult to read."}',
    qc.`analysis` = '细节推断题。女士问男士是什么让人们对他的书作如此着迷。男士在句（6）中回答，人们读他的书是因为超过 60%的美国人超重或肥胖，其他国家也面临类似的问题。总的来说，大家都想知道如何解决问题。也就是说, 超过一半美国人都超重的事实让人们都想知道如何解决这个问题，这也就驱动了男士去写相关的书。因此答案为 C）。',
    qc.`updated_at` = NOW()
WHERE qi.`external_key` = 'cet6-2022-12-1-q06';

-- Q7
UPDATE `question_content` qc
JOIN `question_info` qi ON qi.id = qc.question_id
SET qc.`options` = '{"A":"The general public.","B":"Those who are overweight.","C":"Those who want to lose weight.","D":"The medical community."}',
    qc.`analysis` = '细节辨认题。男士在句（7）中明确提到，他的上一部书主要是为医学界写的。因此答案为 D）。',
    qc.`updated_at` = NOW()
WHERE qi.`external_key` = 'cet6-2022-12-1-q07';

-- Q8
UPDATE `question_content` qc
JOIN `question_info` qi ON qi.id = qc.question_id
SET qc.`options` = '{"A":"Switch to a vegetarian diet.","B":"Follow a personalized diet.","C":"Adhere to doctors'' advice.","D":"Cut carbohydrate intake."}',
    qc.`analysis` = '细节推断题。句（8）中男士提到，他认为每个人都需要考虑自己的新陈代谢, 吃适合自己身体需求的东西。他不提倡单一饮食。有些人应该比其他人摄入更多的碳水化合物。不同的人对蛋白质和脂肪的需求量不同。也就是说, 男士建议人们遵循个性化饮食。因此答案为 B）。',
    qc.`updated_at` = NOW()
WHERE qi.`external_key` = 'cet6-2022-12-1-q08';

-- Q16
UPDATE `question_content` qc
JOIN `question_info` qi ON qi.id = qc.question_id
SET qc.`options` = '{"A":"The key to increasing healthy food supply.","B":"The best way to improve marketing research.","C":"The impact of advertisements on consumption.","D":"The importance of the appearance of food."}',
    qc.`analysis` = '细节辨认题。句（16）中提到，一个营销教授团队研究了食物视觉方面的重要性以及它如何影响食物选择。因此答案为 D）。',
    qc.`updated_at` = NOW()
WHERE qi.`external_key` = 'cet6-2022-12-1-q16';

-- Q17
UPDATE `question_content` qc
JOIN `question_info` qi ON qi.id = qc.question_id
SET qc.`options` = '{"A":"By focusing on the nutrients in different foods.","B":"By emphasizing the diversity of food.","C":"By stressing pleasing aesthetics of food.","D":"By winning the support of marketing professors."}',
    qc.`analysis` = '细节辨认题。根据句（17）可知，医疗专业人员试图通过关注不同食物中的营养成分和强调碳水化合物、脂肪、糖和卡路里等的含量来对抗肥胖流行病。因此答案为 A）。',
    qc.`updated_at` = NOW()
WHERE qi.`external_key` = 'cet6-2022-12-1-q17';

-- Q18
UPDATE `question_content` qc
JOIN `question_info` qi ON qi.id = qc.question_id
SET qc.`options` = '{"A":"They can attract customers with the healthy qualities of their products.","B":"They can boost sales of healthy foods by making them visually appealing.","C":"They can turn to marketing professors for advice.","D":"They can rely on advertising for sales promotion."}',
    qc.`analysis` = '细节辨认题。讲座中提到了一个通过强调胡萝卜的外观和口感而成功将胡萝卜的销售量提高的案例。句（18）中讲话者提到，研究人员认为， 其他公司可以通过类似的广告来增加健康食品的销量, 将他们的产品描述为有吸引力和快乐的源泉。因此答案为 B）。',
    qc.`updated_at` = NOW()
WHERE qi.`external_key` = 'cet6-2022-12-1-q18';

-- Q19
UPDATE `question_content` qc
JOIN `question_info` qi ON qi.id = qc.question_id
SET qc.`options` = '{"A":"It has witnessed a spectacular surge in demand.","B":"It has met much criticism from environmentalists.","C":"It has seen more small businesses offering environment-friendly products.","D":"It has experienced increasingly fierce competition among global companies."}',
    qc.`analysis` = '细节辨认题。句（19）中提到，近年来，许多国家提供更多环保清洁产品的小公司的数量激增，而且他们的生意也做得很好。因此答案为 C）。',
    qc.`updated_at` = NOW()
WHERE qi.`external_key` = 'cet6-2022-12-1-q19';

-- Q20
UPDATE `question_content` qc
JOIN `question_info` qi ON qi.id = qc.question_id
SET qc.`options` = '{"A":"Consumers now know much more about technology.","B":"Their mass production has sharply reduced the price.","C":"Consumers tend to favor all that is novel.","D":"Their quality has been greatly improved."}',
    qc.`analysis` = '细节推断题。根据句（20）可知，过去，人们可能会对声称能够达到惊人的清洁效果的新产品持怀疑态度, 但他们现在相信技术有能力完成曾经被认为不可能的事情。也就是说，消费者现在对技术有了更多的了解，所以新兴清洁产品会畅销。因此答案为 A）。',
    qc.`updated_at` = NOW()
WHERE qi.`external_key` = 'cet6-2022-12-1-q20';

-- Q21
UPDATE `question_content` qc
JOIN `question_info` qi ON qi.id = qc.question_id
SET qc.`options` = '{"A":"Purchasing only this kind of products for home cleaning.","B":"Writing positive comments about them on social media.","C":"Demonstrating on TV how effective these products are.","D":"Telling one another about their incomparable virtues."}',
    qc.`analysis` = '细节辨认题。根据句（21）可知，顾客通过在社交媒体上留言（称赞它们的优点）来为这些产品进行营销。因此答案为 B）。',
    qc.`updated_at` = NOW()
WHERE qi.`external_key` = 'cet6-2022-12-1-q21';

-- Q22
UPDATE `question_content` qc
JOIN `question_info` qi ON qi.id = qc.question_id
SET qc.`options` = '{"A":"Increasing cleaners'' workload.","B":"Blocking the fountains, works.","C":"Breaking a time-honored ritual.","D":"Polluting the fountains'' water."}',
    qc.`analysis` = '细节推断题。讲座开头提到，将零钱扔进喷泉是一种历史悠久的仪式:把一便士扔进水里， 你的愿望可能会实现。但这些钱都得去往别处。 根据句（22）可知，否则的话，越来越多的便士、美分和欧元可能会堵塞喷泉装置。因此答案为 B）。',
    qc.`updated_at` = NOW()
WHERE qi.`external_key` = 'cet6-2022-12-1-q22';

-- Q23
UPDATE `question_content` qc
JOIN `question_info` qi ON qi.id = qc.question_id
SET qc.`options` = '{"A":"They are occasionally retrieved by curious tourists.","B":"They are regularly donated to charity organizations.","C":"They are mostly used for the fountains'' maintenance.","D":"They are usually used as wages for fountain cleaners."}',
    qc.`analysis` = '细节辨认题。句（23）中明确提到, 在纽约市，从公园里的喷泉中收集的硬币通常用于喷泉的维护。因此答案为 C）。',
    qc.`updated_at` = NOW()
WHERE qi.`external_key` = 'cet6-2022-12-1-q23';

-- Q24
UPDATE `question_content` qc
JOIN `question_info` qi ON qi.id = qc.question_id
SET qc.`options` = '{"A":"It is invested in a series of businesses.","B":"It is used exclusively for its maintenance.","C":"It is used to run a supermarket for the needy.","D":"It is estimated to be about $ 40,000 a month."}',
    qc.`analysis` = '细节辨认题。讲座中提到, 数百年来都有游客把硬币扔进罗马著名的特雷维喷泉, 罗马官员要求每晚都要清理喷泉，据报道, 每天都会收集到高达 4 000 美元的世界各地的零钱。根据句 （24）可知，每天晚上收集到的大部分钱都用于一家为有需要的人经营的超市。因此答案为 C）。',
    qc.`updated_at` = NOW()
WHERE qi.`external_key` = 'cet6-2022-12-1-q24';

-- Q25
UPDATE `question_content` qc
JOIN `question_info` qi ON qi.id = qc.question_id
SET qc.`options` = '{"A":"He was arrested for stealing money from four fountain cleaners.","B":"He was sentenced to 34 years'' imprisonment.","C":"He collected rare coins from around the world.","D":"He stole a lot of money from a fountain with a magnetic stick."}',
    qc.`analysis` = '细节辨认题。句（25）中提到，当局最终抓住了一个名叫托马斯• 摩根的臭名昭著的小偷, 并禁止他进入喷泉，因为他用一根磁力棒在至少 34 年的时间里从喷泉中捞出了数千美元的零钱。 因此答案为 D）。',
    qc.`updated_at` = NOW()
WHERE qi.`external_key` = 'cet6-2022-12-1-q25';

COMMIT;
