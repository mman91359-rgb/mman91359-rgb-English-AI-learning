# 词汇填空题生成报告

- 生成时间：2026-11-08T11:55:40.984Z
- 模式：write（已生成分片 SQL）
- 词条范围：ALL
- 例句长度区间：20~160

## 1. 总量

| 指标 | 数值 |
|---|---|
| 词条总数 | 5805 |
| 生成题数 | **4466** |
| 跳过数 | 1339 |
| 生成率 | 76.9% |

## 2. 命中分支

| 分支 | 数量 |
|---|---|
| exact-form（例句用原形） | 4291 |
| inflected（例句用变形） | 175 |

## 3. 跳过原因分布

| 原因 | 数量 |
|---|---|
| `no-example` | 1009 |
| `length` | 178 |
| `no-form-match` | 48 |
| `sense-mismatch` | 39 |
| `fixed-phrase` | 37 |
| `multi-occurrence` | 25 |
| `not-single-word` | 3 |

### 3.1 跳过样本（每类最多 10 个，便于核对判定是否过严）

- **no-example**：accessory、acquisition、adhere、affluent、ascribe、comparable、comparatively、cue、delegate、disapprove
- **length**：add、adverb、advice、ambulance、amplify、angel、auto、bachelor、badly、balcony
- **no-form-match**：boast、coordinate、distress、dive、drain、drip、elect、elimination、erect、flare
- **sense-mismatch**：breed、calm、cheer、discharge、drawing、exclude、feeling、handwriting、harm、heading
- **fixed-phrase**：against、although、amongst、anyone、beneath、besides、beyond、billion、concerning、eighteen
- **multi-occurrence**：activity、atom、connect、conquest、doubt、happiness、ice-cream、lantern、living、medal
- **not-single-word**：B.C.、i.e.、P.M.

## 4. 等级分布

| 等级 | 生成题数 |
|---|---|
| CET4 | 3451 |
| CET6 | 1015 |

## 5. 难度分布

| 难度 | 题数 |
|---|---|
| 2 | 626 |
| 3 | 695 |
| 4 | 786 |
| 5 | 829 |
| 6 | 814 |
| 7 | 716 |

## 5.1 accepted 伪形态自检（名词/形容词/副词出现 -ed/-ing，目标 0）

- 命中条数：**0**


## 6. 幂等校验

| 项 | 值 |
|---|---|
| external_key 总数 | 4466 |
| 去重后数量 | 4466 |
| 集合 SHA-256（前 12 位） | `7fc1e4cef17a` |

> 同一份输入重复 dry-run，上表三项必须完全一致。

## 7. 分片

| 文件 | 题数 | 首键 | 尾键 |
|---|---|---|---|
| V1.0.13__seed_vocab_auto_part01.sql | 500 | vocab-auto-2-1 | vocab-auto-6362-1 |
| V1.0.14__seed_vocab_auto_part02.sql | 500 | vocab-auto-6364-1 | vocab-auto-6897-1 |
| V1.0.15__seed_vocab_auto_part03.sql | 500 | vocab-auto-6898-1 | vocab-auto-7455-1 |
| V1.0.16__seed_vocab_auto_part04.sql | 500 | vocab-auto-7457-1 | vocab-auto-8001-1 |
| V1.0.17__seed_vocab_auto_part05.sql | 500 | vocab-auto-8002-1 | vocab-auto-8568-1 |
| V1.0.18__seed_vocab_auto_part06.sql | 500 | vocab-auto-8569-1 | vocab-auto-9148-1 |
| V1.0.19__seed_vocab_auto_part07.sql | 500 | vocab-auto-9149-1 | vocab-auto-9757-1 |
| V1.0.20__seed_vocab_auto_part08.sql | 500 | vocab-auto-9758-1 | vocab-auto-10712-1 |
| V1.0.21__seed_vocab_auto_part09.sql | 466 | vocab-auto-10714-1 | vocab-auto-11637-1 |

### 7.1 遗留分片（本次未覆盖、**不要导入**）

- `V1.0.22__seed_vocab_auto_part10.sql`：上一轮生成物，内容已过期，建议导入前删除


## 8. 抽样

见同目录 `vocab-auto-sample.json`（20 条，随机种子 20261108）。
