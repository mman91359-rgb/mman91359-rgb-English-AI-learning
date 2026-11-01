export interface TableColumn {
  key: string
  header: string
  align?: 'left' | 'right' | 'center'
  width?: string
}

export type BadgeTone = 'success' | 'danger' | 'warning' | 'info' | 'neutral'
