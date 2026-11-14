export interface TableColumn {
  key: string
  header: string
  align?: 'left' | 'right' | 'center'
  width?: string
}

/**
 * `BadgeTone` 的实际定义在 `components/ui/statusBadgeTypes.ts`。
 * 这里 re-export 是为了让既有的 4 个引入点（`utils/adminEnums.ts`、
 * `AdminJudgeReviewView`、`WritingHistoryView`、原 StatusBadge）不必改路径。
 * 新代码请直接从 ui 版本引入。
 */
export type { BadgeTone } from '../ui/statusBadgeTypes'
