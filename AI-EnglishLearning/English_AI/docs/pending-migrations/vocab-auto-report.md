# 词汇填空题生成报告

- 生成时间：2026-11-08T11:13:29.432Z
- 模式：write（已生成分片 SQL）
- 词条范围：ALL
- 例句长度区间：20~160

## 1. 总量

| 指标 | 数值 |
|---|---|
| 词条总数 | 5805 |
| 生成题数 | **4539** |
| 跳过数 | 1266 |
| 生成率 | 78.2% |

## 2. 命中分支

| 分支 | 数量 |
|---|---|
| exact-form（例句用原形） | 4362 |
| inflected（例句用变形） | 177 |

## 3. 跳过原因分布

| 原因 | 数量 |
|---|---|
| `no-example` | 1009 |
| `length` | 178 |
| `no-form-match` | 48 |
| `multi-occurrence` | 25 |
| `not-single-word` | 3 |
| `leak-guard` | 3 |

## 4. 等级分布

| 等级 | 生成题数 |
|---|---|
| CET4 | 3512 |
| CET6 | 1027 |

## 5. 难度分布

| 难度 | 题数 |
|---|---|
| 2 | 639 |
| 3 | 707 |
| 4 | 797 |
| 5 | 840 |
| 6 | 827 |
| 7 | 729 |

## 6. 幂等校验

| 项 | 值 |
|---|---|
| external_key 总数 | 4539 |
| 去重后数量 | 4539 |
| 集合 SHA-256（前 12 位） | `c5a4eb73b76a` |

> 同一份输入重复 dry-run，上表三项必须完全一致。

## 7. 分片

| 文件 | 题数 | 首键 | 尾键 |
|---|---|---|---|
| V1.0.13__seed_vocab_auto_part01.sql | 500 | vocab-auto-2-1 | vocab-auto-6352-1 |
| V1.0.14__seed_vocab_auto_part02.sql | 500 | vocab-auto-6353-1 | vocab-auto-6884-1 |
| V1.0.15__seed_vocab_auto_part03.sql | 500 | vocab-auto-6885-1 | vocab-auto-7435-1 |
| V1.0.16__seed_vocab_auto_part04.sql | 500 | vocab-auto-7436-1 | vocab-auto-7973-1 |
| V1.0.17__seed_vocab_auto_part05.sql | 500 | vocab-auto-7974-1 | vocab-auto-8526-1 |
| V1.0.18__seed_vocab_auto_part06.sql | 500 | vocab-auto-8527-1 | vocab-auto-9093-1 |
| V1.0.19__seed_vocab_auto_part07.sql | 500 | vocab-auto-9094-1 | vocab-auto-9657-1 |
| V1.0.20__seed_vocab_auto_part08.sql | 500 | vocab-auto-9658-1 | vocab-auto-10586-1 |
| V1.0.21__seed_vocab_auto_part09.sql | 500 | vocab-auto-10588-1 | vocab-auto-11560-1 |
| V1.0.22__seed_vocab_auto_part10.sql | 39 | vocab-auto-11563-1 | vocab-auto-11637-1 |

## 8. 抽样

见同目录 `vocab-auto-sample.json`（10 条，随机种子 20261108）。
