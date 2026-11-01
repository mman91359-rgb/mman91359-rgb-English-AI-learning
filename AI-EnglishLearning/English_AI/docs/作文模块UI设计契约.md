# 作文模块 UI 设计契约

**用途**：给其他 AI / 设计师生成 Recall·睿考“写作模块” UI 设计稿的约束与功能说明。  
**当前阶段**：只做前端设计与 mock 展示，不接后端；页面需标注“预览模式 · 未接后端”。

---

## 1. 设计系统事实（必须遵守）

| 项目 | 约定 |
|---|---|
| 产品 | Recall·睿考，CET4/CET6 AI 学习系统 |
| 框架 | Vue3 + Vite + Tailwind CSS 3.4 + M3 语义 token |
| 字体 | Inter；图标 Material Symbols Outlined（已本地化） |
| 侧栏 | 桌面 280px 固定左侧；移动端底部导航 |
| 内容容器 | 最大 1200px，居中；桌面左右 padding 24px |
| 圆角 | 24px（大卡）、20px（中卡）、16px（按钮/输入） |
| 主色 | `primary` 紫 `#67558c` |
| 次色 | `secondary` 青 `#0c6780` |
| 第三色 | `tertiary` 绿 `#006e20` |
| 表面色 | `background/surface/surface-container-lowest` 等 |
| 错误色 | `error` / `error-container` / `on-error-container` |
| 暗色 | 必须支持 `html.dark`，沿用现有 CSS 变量 |
| 响应式 | 375 / 768 / 1440 三档必须检查 |
| 字体层级 | `font-headline-lg`、`text-headline-md`、`font-body-md`、`font-label-md` 等 |
| 禁止 | Element Plus `el-*`；硬编码 hex；内联大段 style；伪造后端成功 |

**Tab 约定**：学习中心 Tab 为 词汇 / 语法 / 翻译 / 听力 / **写作**。写作替换原“造句”Tab；后端 `module_type=5` 保留但不展示。

---

## 2. 页面清单

### 2.1 写作入口（学习中心 → 写作 Tab）

不是独立“写作模块”页，而是学习中心内的 Tab 内容，标题始终是“学习中心”，**不要**出现“写作模块”和“返回学习中心”。

布局与词汇/语法一致：

- 8/4 栅格：主 CTA 占 8 列，右侧快捷卡占 4 列；
- 下方 3 张卡各 4 列。
- 主 CTA：
  - 标题“写作练习”；
  - 说明“按题目要求完成作文，提交后获得 AI 分项评分与逐句批改”；
  - 题型选择：短文写作 / 应用文 / 议论文 / 图表作文 / 书信；
  - 字数范围提示（CET4 120–180，CET6 150–200）；
  - “开始练习”按钮。
- 右侧：我的收藏、我的错题。
- 下方：写作历史、评分报告、AI 问答（或词典）。
- 所有卡片使用 `bg-surface-container-lowest rounded-[24px] shadow-soft-glow`。
- 顶部由 LearningView 提供标题和 Tab；面板内不要重复。

### 2.2 写作做题页 `/writing/practice`

顶部栏（参考词汇/语法做题页）：

- 返回按钮；
- 奖杯 + 横向进度条（`w-14 h-14` 奖杯，`h-12` 轨道，显示 `已提交/总数` 或 `当前/总数`）；
- 右侧主题切换、通知、语言、头像。

主体（桌面）：

- 左栏约 768px：写作题卡。
  - 题型 badge、来源、`第 N 题`、`全新`；
  - 题目 directions / topic / requirements；
  - 30:00 倒计时；
  - 字数统计 `已输入 0 词 / 建议 120–180 词`；
  - 大 textarea（至少 260px 高）；
  - 提纲/提示折叠区、草稿保存状态（“已自动保存 10:32”）；
  - 底部按钮：保存草稿 / 查看提示 / 提交作文。
- 右栏约 400px：AI 评分区。
  - 提交前：评分维度说明（内容/结构/语言/词汇/语法）+ “提交后生成评分”；
  - 评分中：进度环/步骤（语法检查 → 结构分析 → 词汇升级 → 生成报告）；
  - 评分后：总分、等级、分项分、亮点、问题、逐句批改入口；
  - 参考范文在提交后显示，不要提前泄题。
- 小屏单列，右栏折叠到题目下方；底部导航不遮挡操作栏。

### 2.3 评分报告页 `/writing/report`

- 顶部返回 + 总分大圆环 + 等级（如 CET4 12/15）。
- 分项卡：内容、结构、语言、词汇、语法（进度条/雷达可选）。
- 逐句批改：原文、建议、原因、错误类型标签。
- 亮点表达 / 可替换高级表达。
- 参考范文。
- 操作：重写、收藏、查看历史、返回写作入口。

### 2.4 写作历史 `/writing/history`

- 筛选：题型、等级、时间、分数区间。
- 列表：题目、题型、分数、字数、用时、日期、状态。
- 分数趋势图（ECharts 或简单柱状图）。
- 空状态、加载态、错误态。

---

## 3. 功能要点

1. **题型**：短文写作、应用文、议论文、图表作文、书信；CET4/CET6 分难度。
2. **计时**：30 分钟倒计时；剩余 5 分钟变 `text-error`；时间到自动提交/提示。
3. **字数**：实时统计；低于下限提示“字数不足”，超过上限提示“可能偏长”；CET4 120–180，CET6 150–200。
4. **草稿**：每 10 秒自动保存；刷新/返回后恢复；显示保存时间。
5. **提交**：二次确认；提交中禁用编辑器；评分中显示步骤进度。
6. **AI 评分**：总分 + 5 个维度（内容、结构、语言、词汇、语法）+ 优点 + 问题 + 逐句批改 + 参考范文 + 高级表达。
7. **重写**：基于原题和评分建议再次写作；保留历史版本。
8. **收藏/错题**：收藏题目或范文；低分作文进错题/待重写。
9. **历史**：按时间/题型/分数筛选；查看报告。
10. **预览模式**：所有提交只走 mock，不调用后端；页面常驻“预览模式 · 未接后端”。

---

## 4. 数据契约（mock）

```ts
interface WritingTopic {
  id: string
  type: 'SHORT_ESSAY' | 'PRACTICAL' | 'ARGUMENTATIVE' | 'CHART' | 'LETTER'
  level: 'CET4' | 'CET6'
  title: string
  directions: string
  requirements: string[]
  wordRange: [number, number]
  timeLimitSeconds: number
  source?: string
}

interface WritingDraft {
  topicId: string
  content: string
  wordCount: number
  updatedAt: string
}

interface WritingScore {
  total: number              // 0-15 或 0-100，页面需明确口径
  level: string              // 如“良好”
  dimensions: {
    content: number
    structure: number
    language: number
    vocabulary: number
    grammar: number
  }
  strengths: string[]
  issues: string[]
  corrections: Array<{
    original: string
    suggestion: string
    reason: string
    type: 'GRAMMAR' | 'VOCABULARY' | 'STRUCTURE' | 'SPELLING'
  }>
  highlights: string[]
  modelEssay: string
}

interface WritingHistoryItem {
  id: string
  topicId: string
  title: string
  type: string
  score: number
  wordCount: number
  durationSeconds: number
  createdAt: string
  status: 'SCORED' | 'DRAFT' | 'SCORING' | 'FAILED'
}
```

---

## 5. 状态与交互

必须覆盖：

- loading（骨架/转圈）
- empty（无题目、无历史）
- error（加载失败、评分失败、网络异常）
- 未登录（跳登录）
- 提交中（按钮 loading、编辑器禁用）
- 评分中（步骤进度、可取消/返回）
- 评分失败（重试、保留作文）
- 草稿恢复（弹窗：恢复/放弃）
- 字数不足/超限
- 计时结束

---

## 6. 约束

- 不引入 Element Plus `el-*`；
- 不写死 hex，使用 M3 语义类（`bg-surface`、`text-on-surface`、`bg-primary-container/20` 等）；
- 不直接复制静态 HTML 到 Vue 生产代码；先出设计稿，再按现有组件规范落地；
- 不做真实后端调用；提交/评分全部 mock；
- 中文文案走 i18n key，不硬编码；
- 桌面/移动端、亮/暗色、键盘可访问性都要考虑；
- 不要伪造“已保存到服务器”“已同步”等后端状态。

---

## 7. 交付物

1. `写作入口` 静态 HTML/Tailwind 设计稿；
2. `写作做题页` 静态设计稿（含提交前、评分中、评分后三种状态）；
3. `评分报告页` 静态设计稿；
4. `写作历史页` 静态设计稿；
5. 一份 mock 数据 JSON；
6. 交互说明：计时、字数、草稿、提交、评分、重写。

交付时每个页面顶部标注“预览模式 · 未接后端”。

---

## 8. 验收清单

- [ ] 学习中心标题、Tab、8/4 比例与词汇/语法一致；
- [ ] 写作入口没有“写作模块/返回学习中心”；
- [ ] 做题页顶部有奖杯进度条，左右约 768/400；
- [ ] 375/768/1440 三档不溢出、底部导航不遮操作栏；
- [ ] 暗色模式下文字/卡片/进度条对比度正常；
- [ ] 提交前不显示参考范文/分数；
- [ ] 提交后能展示总分、分项、逐句批改、亮点、范文；
- [ ] 计时、字数、草稿、评分中、评分失败状态齐全；
- [ ] 无 `el-*`、无硬编码 hex、无真实后端请求。

---

## 9. 可直接复制给其他 AI 的提示词

```text
你是 Recall·睿考（CET4/CET6 AI 学习系统）的资深 UI/前端设计师。请为“写作模块”生成一套可交付的静态 HTML + Tailwind CSS 设计稿（后续由 Vue3 工程接入），只做前端样式与 mock 交互，不要写后端。

【设计系统】
- 桌面左侧固定侧栏 280px；内容最大 1200px 居中，左右 padding 24px；移动端底部导航。
- 字体 Inter；图标 Material Symbols Outlined；圆角 24/20/16px。
- 颜色使用 M3 语义 token：primary #67558c、secondary #0c6780、tertiary #006e20、surface/background/outline 等；必须支持亮/暗色。
- 禁止 Element Plus el-*；禁止硬编码 hex；使用 Tailwind 语义类。
- 学习中心 Tab：词汇 / 语法 / 翻译 / 听力 / 写作（写作替换“造句”）。

【页面 1：写作入口】
学习中心内的“写作”Tab，不要出现“写作模块”和“返回学习中心”。
- 标题由学习中心提供；Tab 中“写作”为 active。
- 8/4 栅格：主 CTA 占 8 列，右侧快捷卡占 4 列，下方 3 张卡各 4 列。
- 主 CTA：标题“写作练习”，说明“按题目要求完成作文，提交后获得 AI 分项评分与逐句批改”；题型卡（短文/应用文/议论文/图表/书信）；字数范围提示（CET4 120-180，CET6 150-200）；“开始练习”按钮。
- 右侧：我的收藏、我的错题；下方：写作历史、评分报告、AI 问答。
- 卡片使用 bg-surface-container-lowest、rounded-[24px]、shadow-soft-glow。

【页面 2：写作做题页】
- 顶部栏：返回 + 奖杯 + 横向进度条（参考词汇/语法：w-14 奖杯、h-12 轨道、已提交/总数）+ 主题/通知/语言/头像。
- 桌面左栏约 768px：题型 badge、来源、第 N 题、全新；题目 directions/topic/requirements；30:00 倒计时；字数统计；大 textarea（≥260px）；提纲/提示折叠；草稿保存状态；底部“保存草稿/查看提示/提交作文”。
- 右栏约 400px：提交前评分维度说明；评分中步骤进度；评分后总分/等级/分项/亮点/问题/逐句批改入口；参考范文提交后才显示。
- 小屏单列，右栏折叠到题目下方。
- 状态：loading/empty/error/提交中/评分中/评分失败/字数不足/计时结束。

【页面 3：评分报告页】
- 总分大圆环 + 等级；内容/结构/语言/词汇/语法五个分项；逐句批改（原文/建议/原因/类型标签）；亮点表达；参考范文；重写/收藏/历史。

【页面 4：写作历史页】
- 筛选（题型/等级/时间/分数）；列表（题目/分数/字数/用时/日期/状态）；分数趋势图；空/加载/错误状态。

【数据 mock】
- WritingTopic { id,type,level,title,directions,requirements[],wordRange,timeLimitSeconds,source }
- WritingScore { total,level,dimensions{content,structure,language,vocabulary,grammar},strengths[],issues[],corrections[],highlights[],modelEssay }
- WritingHistoryItem { id,title,type,score,wordCount,durationSeconds,createdAt,status }

【交互】
- 30 分钟倒计时；每 10 秒自动保存草稿；刷新恢复；提交二次确认；评分步骤进度；失败重试；重写保留历史；收藏/错题。

【约束】
- 所有提交/评分只用 mock，不调用后端；页面常驻“预览模式 · 未接后端”。
- 375/768/1440 三档、亮/暗色、i18n、键盘可访问性都要检查。
- 交付：4 个页面的静态 HTML/Tailwind + mock 数据 + 交互说明 + 验收清单。
```
