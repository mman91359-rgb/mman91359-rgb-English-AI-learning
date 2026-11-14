/**
 * StatusBadge 的语义色类型。
 *
 * 单独成文件（而不是写在 .vue 里）的原因：`components/admin/tableTypes.ts` 需要
 * 继续 `export type { BadgeTone }` 给 4 个既有引入点（`utils/adminEnums.ts`、
 * `AdminJudgeReviewView`、`WritingHistoryView`）使用，而 `.ts` 文件无法从 `.vue`
 * 里可靠地 re-export 类型。放在这里，两边都只依赖一个纯类型文件，不产生
 * `ui → admin` 的反向依赖。
 */

/**
 * admin 侧沿用的五档语义，偏「管理动作结果」。
 *
 * 与 `Tag` 的 `TagTone`（primary|tertiary|neutral|warning|error）**不是同一套**，
 * 本轮不合并。映射关系见 `docs/前端UI契约.md` §7：
 * success→tertiary、danger→error、info→primary、warning→warning、neutral→neutral。
 */
export type BadgeTone = 'success' | 'danger' | 'warning' | 'info' | 'neutral'
