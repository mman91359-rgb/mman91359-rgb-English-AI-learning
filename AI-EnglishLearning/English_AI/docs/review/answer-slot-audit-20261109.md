# 答案槽位离线校验报告

- 生成时间：2026-11-09T11:17:27.854Z
- 数据来源：`exercise_db.question_info` + `question_content`（只读）
- CSV：`docs/review/answer-slot-audit-20261109.csv`

## 汇总

| 指标 | 数值 |
|---|---|
| 扫描题目 | 4537 |
| 变体总数 | 9440 |
| 问题项 | 934 |
| 无法解析词干的题 | 5 |

## 按问题类型

| 问题类型 | 数量 | 置信度 | 建议操作 |
|---|---|---|---|
| DUPLICATE_VARIANT | 0 | 1.00 | MERGE_DUPLICATE |
| PSEUDO_FORM | 12 | 0.90 | DELETE_VARIANT |
| UNEXPECTED_VARIANT | 0 | 0.60 | REVIEW |
| SLOT_POS_MISMATCH | 0 | 0.60 | REVIEW |
| COLLOCATION_CONFLICT | 922 | 0.50 | REVIEW |

## 槽位线索覆盖

| 情况 | 题数 |
|---|---|
| no-cue | 4271 |
| ok | 266 |

> 线索未命中或自相矛盾的题不输出槽位类问题（宁可漏报，不制造噪声）。

## 已知局限

1. **槽位线索覆盖率有限**：只有题干含 `to ___`、`very/too ___`、`___ is/are` 等强线索时才做词性推断；
   限定词、情态动词后的槽位既可能是名词也可能是形容词/副词（`an ___ ability`、`could ___ stay`），一律不推断。
2. **COLLOCATION_CONFLICT 反映的是「accepted 偏宽松」这一既定设计**，不是错题：
   生成器会收录词条的全部合法变形，而具体题干往往只容得下其中一种。是否收紧需人工判断，脚本只负责列出。
3. **伪形态判定基于词库主词性**：词库只记录一个主词性，脚本用中文释义补充第二词性；
   释义缺失时可能漏判。
4. **不做语义判断**：不判断近义词是否可接受，也不判断答案与题干的语义是否搭调。
