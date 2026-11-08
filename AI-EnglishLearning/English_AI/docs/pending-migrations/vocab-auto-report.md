# 词汇填空题生成报告

- 生成时间：2026-11-08T13:49:03.217Z
- 模式：dry-run（未写 SQL）
- 词条范围：ALL
- 例句长度区间：20~160

## 1. 总量

| 指标 | 数值 |
|---|---|
| 词条总数 | 5805 |
| 生成题数 | **4475** |
| 跳过数 | 1330 |
| 生成率 | 77.1% |

## 2. 命中分支

| 分支 | 数量 |
|---|---|
| exact-form（例句用原形） | 4299 |
| inflected（例句用变形） | 176 |

## 3. 跳过原因分布

| 原因 | 数量 |
|---|---|
| `no-example` | 1009 |
| `length` | 178 |
| `no-form-match` | 47 |
| `fixed-phrase` | 37 |
| `sense-mismatch` | 27 |
| `multi-occurrence` | 26 |
| `not-single-word` | 3 |
| `blocklist` | 3 |

### 3.1 跳过样本（每类最多 10 个，便于核对判定是否过严）

- **no-example**：accessory、acquisition、adhere、affluent、ascribe、comparable、comparatively、cue、delegate、disapprove
- **length**：add、adverb、advice、ambulance、amplify、angel、auto、bachelor、badly、balcony
- **no-form-match**：boast、coordinate、distress、dive、drain、drip、elect、elimination、erect、flare
- **fixed-phrase**：against、although、amongst、anyone、beneath、besides、beyond、billion、concerning、eighteen
- **sense-mismatch**：discharge、drawing、exclude、feeling、follow、found、handwriting、heading、landing、opening
- **multi-occurrence**：activity、atom、connect、conquest、doubt、happiness、ice-cream、lantern、living、medal
- **not-single-word**：B.C.、i.e.、P.M.
- **blocklist**：

### 3.2 敏感内容过滤（只列 external_key，不复述原句）

- 命中数量：**3**
  - `vocab-auto-7576-1`
  - `vocab-auto-10765-1`
  - `vocab-auto-11034-1`

## 4. 等级分布

| 等级 | 生成题数 |
|---|---|
| CET4 | 3462 |
| CET6 | 1013 |

## 5. 难度分布

| 难度 | 题数 |
|---|---|
| 2 | 627 |
| 3 | 698 |
| 4 | 788 |
| 5 | 831 |
| 6 | 815 |
| 7 | 716 |

## 5.1 accepted 伪形态自检（名词/形容词/副词出现 -ed/-ing，目标 0）

- 命中条数：**0**


## 5.2 accepted 一致性自检

| 检查 | 结果 | 目标 |
|---|---|---|
| 不可数名词出现规则复数 | 0 | 0 |
| 不规则名词出现规则复数 | 0 | 0 |
| `abandon` accepted 含 `abandoning` | PASS | PASS |
| `hardware` 不含 `hardwares` | PASS | PASS |
| `criterion` 不含 `criterions` | PASS | PASS |
| `salesman` 不含 `salesmans` | PASS | PASS |
| `thus` 不含 `thuser`/`thusest` | PASS | PASS |
| `welfare` 不含 `welfares` | PASS | PASS |
| `content` 不含 `contents` | PASS | PASS |
| `hollow` 不含 `hollows` | PASS | PASS |
| `steer`（答案 steering）不含原形 | PASS | PASS |
| 动词 accepted 缺 -ing/-ed（仅统计） | 0 | — |
| 名词 accepted 仅有原形（仅统计） | 273 | — |



## 6. 幂等校验

| 项 | 值 |
|---|---|
| external_key 总数 | 4475 |
| 去重后数量 | 4475 |
| 集合 SHA-256（前 12 位） | `3f96e7268c8b` |

> 同一份输入重复 dry-run，上表三项必须完全一致。

## 7. 分片

_dry-run 模式未生成 SQL 分片_

### 7.1 遗留分片

无。

## 8. 抽样

见同目录 `vocab-auto-sample.json`（20 条，随机种子 20261108）。
