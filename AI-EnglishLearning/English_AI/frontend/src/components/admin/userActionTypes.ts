import type { AdminUserRow } from '../../api/admin'

export type UserActionKind = 'status' | 'role' | 'reset' | 'setPassword'

export interface UserAction {
  kind: UserActionKind
  user: AdminUserRow
}
