# 写作模块 Mock UI 生成提示词（含评分界面与契约）

**用途**：把下面整段提示词复制给其他 AI，生成写作模块的静态 HTML + Tailwind 设计稿。  
**当前阶段**：只做 mock UI，不接后端；生成物后续按本契约接入 Vue3。

---

## 可直接复制的提示词

```text
你是 Recall·睿考（CET4/CET6 AI 学习系统）的资深 UI/前端设计师。请为“写作模块”生成一套可直接预览的静态 HTML + Tailwind CSS 设计稿（后续由 Vue3 工程接入），只做前端样式与 mock 交互，不要写后端、不要调用真实接口。

【设计系统】
- 桌面左侧固定侧栏 280px；内容最大 1200px 居中，左右 padding 24px；移动端底部导航。
- 字体 Inter；图标 Material Symbols Outlined；圆角 24/20/16px。
- 颜色使用 M3 语义 token：primary #67558c、secondary #0c6780、tertiary #006e20、surface/background/outline 等；必须支持亮/暗色。
- 禁止 Element Plus el-*；禁止硬编码 hex/字号；禁止新增依赖；使用 Tailwind 语义类。
- 学习中心 Tab：词汇 / 语法 / 翻译 / 听力 / 写作（写作替换“造句”）。

【页面 1：写作入口 writing-entry.html】
- 学习中心内的“写作”Tab，不要出现“写作模块”和“返回学习中心”。
- 标题由学习中心提供；Tab 中“写作”为 active。
- 8/4 栅格：主 CTA 占 8 列，右侧快捷卡占 4 列，下方 3 张卡各 4 列。
- 主 CTA：标题“写作练习”，说明“按题目要求完成作文，提交后获得 AI 分项评分与逐句批改”；题型卡（短文/应用文/议论文/图表/书信）；字数范围提示（CET4 120-180，CET6 150-200）；“开始练习”按钮。
- 右侧：我的收藏、我的错题；下方：写作历史、评分报告、AI 问答。
- 卡片使用 bg-surface-container-lowest、rounded-[24px]、shadow-soft-glow。

【页面 2：写作做题 writing-practice.html】
- 顶部栏：返回 + 奖杯 + 横向进度条（参考词汇/语法：w-14 奖杯、h-12 轨道、已提交/总数）+ 主题/通知/语言/头像。
- 桌面左栏约 768px：题型 badge、来源、第 N 题、全新；题目 directions/topic/requirements；30:00 倒计时；字数统计；大 textarea（≥260px）；提纲/提示折叠；草稿保存状态；底部“保存草稿/查看提示/提交作文”。
- 右栏约 400px：评分区，必须做三种状态：
  1) 提交前：只显示五维评分说明（内容/结构/语言/词汇/语法）和“提交后生成评分”，不显示分数/范文；
  2) 评分中：步骤进度（语法检查 → 结构分析 → 词汇升级 → 生成报告）+ loading；
  3) 评分后：总分、等级、五维分、亮点、问题、逐句批改入口；参考范文提交后才显示。
- 评分失败：保留作文，显示重试按钮。
- 小屏单列，右栏折叠到题目下方；底部导航不遮挡操作栏。
- 状态：loading/empty/error/提交中/评分中/评分失败/字数不足/计时结束。

【页面 3：评分报告 writing-report.html】
- 顶部返回 + 总分大圆环 + 等级；必须同时显示 rawScore/15 和折算分/106.5。
- 五个分项卡：内容、结构、语言、词汇、语法（各 0-3，进度条/雷达可选）。
- 逐句批改：原文、建议、原因、错误类型标签（GRAMMAR/VOCABULARY/STRUCTURE/SPELLING/PUNCTUATION）。
- 亮点表达 / 可替换高级表达。
- 参考范文。
- 操作：重写、收藏、查看历史、返回写作入口。

【页面 4：写作历史 writing-history.html】
- 筛选：题型、等级、时间、分数区间。
- 列表：题目、题型、分数、字数、用时、日期、状态（SCORED/DRAFT/SCORING/FAILED）。
- 分数趋势图（ECharts 或简单柱状图）。
- 空状态、加载态、错误态。

【数据契约（必须严格使用）】
interface WritingTopic {
  id: string
  type: 'SHORT_ESSAY' | 'PRACTICAL' | 'ARGUMENTATIVE' | 'CHART' | 'LETTER'
  level: 'CET4' | 'CET6'
  title: string
  directions: string
  topic: string
  requirements: string[]
  wordRange: [number, number] // CET4 120-180；CET6 150-200
  timeLimitSeconds: number // 默认 1800
  source?: string
  outlineHints: string[]
  usefulExpressions: string[]
}

interface WritingScore {
  scoreVersion: string
  provider: 'MOCK' | 'LLM'
  scoredAt: string
  rawScore: number // 0-15
  maxRawScore: 15
  weightedScore: number // rawScore / 15 * 106.5
  level: '优秀' | '良好' | '中等' | '较差' | '差'
  dimensions: {
    content: number // 0-3
    structure: number // 0-3
    language: number // 0-3
    vocabulary: number // 0-3
    grammar: number // 0-3
  }
  strengths: string[]
  issues: string[]
  corrections: Array<{
    original: string
    suggestion: string
    reason: string
    type: 'GRAMMAR' | 'VOCABULARY' | 'STRUCTURE' | 'SPELLING' | 'PUNCTUATION'
  }>
  highlights: string[]
  modelEssay: string
  rewriteSuggestions: string[]
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

评分口径：5 维各 0-3，合计 0-15；weightedScore = rawScore/15*106.5；页面同时显示 raw/15 和 106.5 折算分。

【mock 与后续对接约束】
- 所有题目、评分、历史都放在独立 mock 数据文件（如 mocks/writing.ts），不要写死在 HTML 里。
- 评分必须抽象为 WritingScoringService：
  interface WritingScoringService {
    score(input: { topic: WritingTopic; content: string; wordCount: number; durationSeconds: number }): Promise<WritingScore>
  }
- 现在只实现 MockWritingScoringService；后续真实服务替换为 HttpWritingScoringService，页面不改。
- 路由固定：/writing、/writing/practice、/writing/report、/writing/history。
- 组件命名固定：WritingEntryPanel、WritingPracticeView、WritingReportView、WritingHistoryView、WritingScorePanel、WritingDimensionBar、WritingCorrectionList。
- 页面常驻“预览模式 · 未接后端”；提交/评分只走 mock，不调用 /exercise、/ai 等真实接口。
- 不要伪造“已保存到服务器”“已同步”等后端状态；草稿只写 localStorage mock。

【交互】
- 30 分钟倒计时；剩余 5 分钟变 text-error；时间到提示/自动提交。
- 每 10 秒自动保存草稿；刷新恢复；恢复/放弃弹窗。
- 字数实时统计；低于下限/超过上限提示。
- 提交二次确认；提交中禁用编辑器；评分中步骤进度；失败重试。
- 重写保留历史版本；收藏/错题只做 mock。

【交付物】
1. writing-entry.html
2. writing-practice.html（含提交前/评分中/评分后/评分失败四种状态）
3. writing-report.html
4. writing-history.html
5. mocks/writing.ts 或 mock JSON
6. 组件树、状态矩阵、i18n key 清单、验收清单

【验收】
- 学习中心标题、Tab、8/4 比例与词汇/语法一致；
- 写作入口没有“写作模块/返回学习中心”；
- 做题页顶部有奖杯进度条，左右约 768/400；
- 375/768/1440 三档不溢出、底部导航不遮操作栏；
- 暗色模式下文字/卡片/进度条对比度正常；
- 提交前不显示分数/参考范文；评分中/失败状态齐全；
- 评分后同时显示 raw/15 和 106.5 折算分、五维、逐句批改、亮点、范文；
- 无 el-*、无硬编码 hex、无真实后端请求、无新增依赖。
```

---

## 使用说明

1. 把上面代码块整段复制给其他 AI。
2. 让它先输出 4 个页面的静态 HTML 与 mock 数据，不要直接写 Vue。
3. 生成后回到本项目，按 `docs/作文模块UI设计契约.md` 的字段与组件命名接入 Vue3。
4. 评分适配器保持 `WritingScoringService` 边界：现在 `MockWritingScoringService`，后续 `HttpWritingScoringService`。

---

## 与现有契约的关系

- 字段、评分口径、路由、组件命名以本提示词为准。
- 页面视觉、状态、验收细节见 `docs/作文模块UI设计契约.md`。
- 管理员端不涉及本模块；管理员 UI 契约见 `docs/管理员端UI设计契约V2.md`。
