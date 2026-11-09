# 答案槽位离线校验（scripts/check-answer-slots.mjs）

只读扫描全量填空题的 `accepted_answers`，输出可筛选的 CSV 问题清单。**不写库、不自动改数据、不生成迁移。**

## 用法

```bash
# 全量扫描，写 docs/review/answer-slot-audit-YYYYMMDD.csv + 同名 .md
node scripts/check-answer-slots.mjs

# 只看统计，不落盘
node scripts/check-answer-slots.mjs --dry-run

# 单题调试：逐条打印每个变体的判定依据
node scripts/check-answer-slots.mjs --question-id 4987

# 只跑某几类规则（便于分批处理）
node scripts/check-answer-slots.mjs --only-types PSEUDO_FORM,DUPLICATE_VARIANT

# 对验证库跑（默认 exercise_db）
node scripts/check-answer-slots.mjs --db flyway_verify_exercise_db2
```

| 参数 | 说明 |
|---|---|
| `--out <path>` | CSV 输出路径，默认 `docs/review/answer-slot-audit-YYYYMMDD.csv` |
| `--dry-run` | 只打印统计与每类前 5 条，不写文件 |
| `--question-id <id>` | 单题调试，不写 CSV |
| `--db <name>` | 目标库，默认 `exercise_db` |
| `--limit <n>` | 只扫前 n 题（调试用） |
| `--only-types <A,B>` | 只输出指定问题类型 |

依赖 `.env` 里的 `MYSQL_HOST / MYSQL_PORT / MYSQL_USERNAME / MYSQL_PASSWORD`，以及可用的 `mysql` 客户端（找不到时设 `MYSQL_BIN`）。

## 判定基准

用**生成器的合法集合**做参照，不另写一套英语词法：

```
legit = correct_answer ∪ matchForms(lemma) ∪ acceptedForms(lemma)
      ∪ britishAmericanForms(lemma) ∪ {lemma}
```

`lemma` 优先取 `question_info.answer_word`，否则用 `resolveLemma(correct_answer)` 回退。
词性来自 `word_dictionary.pos`，并用中文释义补第二词性（`complete` 是 `a.` + `vt.`）。

## 五条规则

| 问题类型 | 判定 | 置信度 | 建议操作 |
|---|---|---|---|
| `DUPLICATE_VARIANT` | 同题内两条 accepted 归一化后相同（`Fiber` vs `fiber`） | 1.00 | `MERGE_DUPLICATE` |
| `PSEUDO_FORM` | 变体不在合法集合内，且形如名词加比较级（`fiberer`/`fiberest`/`kneer`/`poetrier`）、形容词加复数、动词加名词后缀等 | 0.90 | `DELETE_VARIANT` |
| `UNEXPECTED_VARIANT` | 不在合法集合内，但不符合任何伪形态特征 | 0.60 | `REVIEW` |
| `SLOT_POS_MISMATCH` | 题干强线索要求的词性与词干词性不符（题目级） | 0.60 | `REVIEW` |
| `COLLOCATION_CONFLICT` | 变体形态与题干限定结构冲突（`to ___` 要原形、`a/an ___` 要单数） | 0.50 | `REVIEW` |

**只报问题项，合法变体不输出。** 线索没命中或自相矛盾的题直接跳过——宁可漏报，不制造噪声。

### 关于 `COLLOCATION_CONFLICT` 数量多

这是「accepted 偏宽松」这一既定设计的直接体现：生成器把词条的全部合法变形都写进 accepted，而具体题干往往只容得下其中一种。例如 "We need to ___ the problem" 只接受 `analyze`，但 accepted 里有 `analyzes / analyzed / analyzing`。

这不是错题，是**误判风险**。脚本只负责列出来，是否收紧由人工判断。

## CSV 字段

| 列 | 说明 | 对接审核队列 |
|---|---|---|
| `question_id` | 题目 ID | `questionId` |
| `answer` | 问题变体原文 | `userAnswer` |
| `issue_type` | 五类问题之一 | `reason` |
| `confidence` | 0.00~1.00 | — |
| `suggestion` | `DELETE_VARIANT` / `MERGE_DUPLICATE` / `REVIEW` | — |
| `external_key` | 题目外部键 | — |
| `answer_word` | 词条原形（可能为空） | — |
| `lemma_pos` | 词性 | — |
| `target_level` | CET4 / CET6 | — |
| `evidence` | 判定依据 | — |
| `stem_excerpt` | 题干前 120 字 | `judge_context` |

- 编码 **UTF-8 with BOM**，CRLF 换行，Excel 双击直接打开不乱码。
- 含逗号、引号、换行的字段按 RFC 4180 加引号、内部引号双写。

## 对接审核队列（本轮未启用）

本阶段只出 CSV 人工筛选，**不自动入队**。需要入队时按上表映射调用：

```http
POST /internal/judge/review
X-Internal-Token: <INTERNAL_TOKEN>

{"questionId": 4987, "userId": 0, "userAnswer": "fiberer",
 "correctAnswer": "fiber", "matchedLevel": 1, "reason": "PSEUDO_FORM"}
```

- `userId` 用 **0 作为系统哨兵值**（离线问题没有真实用户）。
- 接口本身幂等：`(question_id, user_id, user_answer)` 唯一键，重复提交返回 `false`。

## 结果怎么用

1. 先按 `confidence` 降序看：0.90 的 `PSEUDO_FORM` 基本可以直接确认。
2. `COLLOCATION_CONFLICT` 按 `answer_word` 排序，同词批量判断是否收紧。
3. 确认要改的，走「清单 → 白名单 → 单独一条迁移」三步，**不要直接改库**（见 `docs/数据库迁移规范.md`）。
