<template>
  <AppLayout>
    <PageHeader :title="$t('notifications.title')" :subtitle="$t('notifications.subtitle')" back>
      <template #actions>
        <button
          v-if="unreadTotal > 0"
          type="button"
          :class="btnSecondarySm"
          @click="handleMarkAllRead"
        >
          {{ $t('notifications.markAllRead') }}
        </button>
        <button
          v-if="items.length > 0"
          type="button"
          :class="btnIconDanger"
          :aria-label="$t('notifications.clearAll')"
          @click="confirmClear = true"
        >
          <AppIcon name="delete_sweep" size="lg" />
        </button>
      </template>
    </PageHeader>

    <div class="mb-6">
      <ChipGroup
        :options="filterOptions"
        :model-value="filter"
        @update:model-value="handleFilterChange"
      />
    </div>

    <LoadingState v-if="loading && items.length === 0" />

    <ErrorState
      v-else-if="loadError && items.length === 0"
      :message="loadError"
      :action-label="$t('common.retry')"
      @retry="load"
    />

    <EmptyState
      v-else-if="items.length === 0"
      icon="notifications_off"
      :title="filter === 'unread' ? $t('notifications.noUnread') : $t('notifications.empty')"
      :description="$t('notifications.emptyHint')"
    />

    <template v-else>
      <div class="space-y-3">
        <div
          v-for="item in items"
          :key="item.id"
          class="bg-surface-container-lowest rounded-2xl shadow-soft-glow transition-colors"
          :class="item.read ? '' : 'bg-primary-container/5'"
        >
          <ListRow :title="resolveText(item.titleKey, item.titleParams, fallbackTitle(item.type))" @click="handleOpen(item)">
            <template #leading>
              <span
                class="flex h-10 w-10 shrink-0 items-center justify-center rounded-full"
                :class="typeTone(item.type).containerClass"
              >
                <AppIcon :name="typeTone(item.type).icon" size="lg" :tone="typeTone(item.type).tone" />
              </span>
            </template>
            <div class="flex items-center gap-2">
              <p class="truncate font-body-md text-body-md text-on-surface">
                {{ resolveText(item.titleKey, item.titleParams, fallbackTitle(item.type)) }}
              </p>
              <span v-if="!item.read" class="h-2 w-2 shrink-0 rounded-full bg-primary" />
            </div>
            <p class="mt-1 line-clamp-2 font-body-sm text-body-sm text-on-surface-variant">
              {{ resolveText(item.contentKey, item.contentParams, fallbackContent(item.type)) }}
            </p>
            <p class="mt-1 font-label-sm text-label-sm text-on-surface-variant/60">
              {{ relativeTime(item.createdAt) }}
            </p>
            <template #trailing>
              <span class="font-label-sm text-label-sm text-on-surface-variant">
                {{ $t(typeTone(item.type).labelKey) }}
              </span>
            </template>
          </ListRow>
        </div>
      </div>

      <div v-if="hasMore" class="mt-6 flex justify-center">
        <button
          type="button"
          :class="btnSecondary"
          :disabled="loadingMore"
          @click="loadMore"
        >
          {{ loadingMore ? $t('common.loading') : $t('notifications.loadMore') }}
        </button>
      </div>
    </template>

    <BaseDialog
      :visible="confirmClear"
      :title="$t('notifications.clearConfirmTitle')"
      @close="confirmClear = false"
    >
      <p class="font-body-md text-body-md text-on-surface-variant">
        {{ $t('notifications.clearConfirmMessage') }}
      </p>
      <template #footer>
        <button type="button" :class="btnDialogSecondary" @click="confirmClear = false">
          {{ $t('common.cancel') }}
        </button>
        <button type="button" :class="btnDialogPrimary" @click="handleClear">
          {{ $t('common.confirm') }}
        </button>
      </template>
    </BaseDialog>
  </AppLayout>
</template>

<script setup lang="ts">
import { computed, onMounted, ref } from 'vue'
import { useI18n } from 'vue-i18n'
import AppLayout from '../components/AppLayout.vue'
import AppIcon from '../components/ui/AppIcon.vue'
import PageHeader from '../components/ui/PageHeader.vue'
import ListRow from '../components/ui/ListRow.vue'
import ChipGroup from '../components/ui/ChipGroup.vue'
import BaseDialog from '../components/ui/BaseDialog.vue'
import LoadingState from '../components/ui/LoadingState.vue'
import ErrorState from '../components/ui/ErrorState.vue'
import EmptyState from '../components/ui/EmptyState.vue'
import {
  btnDialogPrimary,
  btnDialogSecondary,
  btnIconDanger,
  btnSecondary,
  btnSecondarySm,
} from '../components/ui/buttonStyles'
import { relativeTime } from '../composables/useNotifications'
import {
  clearNotifications,
  fetchNotifications,
  fetchNotices,
  fetchUnreadCount,
  markAllNoticesRead,
  markAllNotificationsRead,
  markNoticeRead,
  markNotificationRead,
} from '../api/notification'
import type { ChipOption } from '../components/ui/ChipGroup.vue'
import type { NoticeVO, NotificationType, NotificationVO } from '../api/notification'
import { useToast } from '../composables/useToast'

const { t, te } = useI18n()
const { show: toast } = useToast()

const PAGE_SIZE = 20
const NOTICE_PAGE_SIZE = 100
/** 公告 id 加前缀，与个人通知的字符串 id 区分，避免同号混淆 */
const NOTICE_PREFIX = 'notice:'
type Filter = 'all' | 'unread'

const items = ref<NotificationVO[]>([])
const filter = ref<Filter>('all')
const loading = ref(true)
const loadingMore = ref(false)
const loadError = ref('')
const currentPage = ref(1)
const total = ref(0)
const unreadTotal = ref(0)
const confirmClear = ref(false)

const filterOptions = computed<ChipOption[]>(() => [
  { value: 'all', label: t('notifications.filterAll') },
  { value: 'unread', label: t('notifications.filterUnread') },
])

const isNotice = (item: NotificationVO) => item.id.startsWith(NOTICE_PREFIX)
/** 已加载的个人通知条数：公告不参与个人线的分页判断 */
const personalCount = computed(() => items.value.filter((item) => !isNotice(item)).length)
const hasMore = computed(() => personalCount.value < total.value)

/** 公告 → 统一列表项。标题与正文是整句文本，resolveText 会原样显示而不查 i18n */
function toNotificationItem(notice: NoticeVO): NotificationVO {
  return {
    id: `${NOTICE_PREFIX}${notice.id}`,
    type: 'system',
    titleKey: notice.title,
    contentKey: notice.content,
    titleParams: null,
    contentParams: null,
    createdAt: notice.publishAt ? new Date(notice.publishAt).getTime() : Date.now(),
    read: notice.read,
  }
}

/** 公告在前、个人通知在后，按时间倒序混排 */
function buildItems(notices: NoticeVO[], personal: NotificationVO[]): NotificationVO[] {
  return [...notices.map(toNotificationItem), ...personal].sort((a, b) => b.createdAt - a.createdAt)
}

/** 通知类型 → 图标与语义色档，全部使用 M3 语义令牌（error 仅用于错误，不作业务装饰） */
const TYPE_META: Record<NotificationType, { icon: string; tone: 'primary' | 'tertiary' | 'warning' | 'variant'; containerClass: string; labelKey: string }> = {
  system: { icon: 'info', tone: 'variant', containerClass: 'bg-surface-container-high', labelKey: 'notifications.typeSystem' },
  reminder: { icon: 'schedule', tone: 'warning', containerClass: 'bg-warning-container/20', labelKey: 'notifications.typeReminder' },
  achievement: { icon: 'emoji_events', tone: 'tertiary', containerClass: 'bg-tertiary-container/20', labelKey: 'notifications.typeAchievement' },
  level: { icon: 'trending_up', tone: 'primary', containerClass: 'bg-primary-container/20', labelKey: 'notifications.typeLevel' },
}

const typeTone = (type: NotificationType) => TYPE_META[type] ?? TYPE_META.system

/**
 * 文本解析：
 * - i18n 键（个人通知）→ 翻译
 * - 整句文本（公告 title / content）→ 原样显示
 * - 空键 → 按 type 的默认文案
 */
function resolveText(key: string, params: Record<string, unknown> | null, fallback: string): string {
  if (!key) return fallback
  return te(key) ? t(key, (params ?? {}) as Record<string, unknown>) : key
}

const fallbackTitle = (type: NotificationType) => t(`notifications.fallbackTitle.${type}`)
const fallbackContent = (type: NotificationType) => t(`notifications.fallbackContent.${type}`)

/** 刷新红点汇总，供顶栏与页面共用 */
async function refreshUnread(): Promise<void> {
  try {
    const res = await fetchUnreadCount()
    unreadTotal.value = res.total
  } catch {
    // 红点是辅助信息，拉取失败不影响列表
  }
}

async function load(): Promise<void> {
  loading.value = true
  loadError.value = ''
  currentPage.value = 1
  try {
    // 公告与个人通知并发拉取；公告只在首屏出现，不参与「加载更多」
    const [personalRes, noticeRes] = await Promise.all([
      fetchNotifications(1, PAGE_SIZE, filter.value === 'unread'),
      fetchNotices(1, NOTICE_PAGE_SIZE),
    ])
    const notices = (noticeRes?.records ?? []).filter((n) => filter.value === 'all' || !n.read)
    total.value = personalRes.total
    items.value = buildItems(notices, personalRes.records ?? [])
  } catch (e) {
    loadError.value = e instanceof Error ? e.message : t('notifications.loadFailed')
    items.value = []
  } finally {
    loading.value = false
  }
  await refreshUnread()
}

async function loadMore(): Promise<void> {
  if (loadingMore.value || !hasMore.value) return
  loadingMore.value = true
  try {
    const nextPage = currentPage.value + 1
    const res = await fetchNotifications(nextPage, PAGE_SIZE, filter.value === 'unread')
    items.value = [...items.value, ...(res.records ?? [])]
    currentPage.value = nextPage
    total.value = res.total
  } catch (e) {
    toast(e instanceof Error ? e.message : t('notifications.loadFailed'), 'error')
  } finally {
    loadingMore.value = false
  }
}

function handleFilterChange(value: string | number | Array<string | number>): void {
  filter.value = (Array.isArray(value) ? value[0] : value) as Filter
  void load()
}

/** 点开即标已读：先本地乐观更新，失败回滚。公告与个人通知各走各的接口。 */
async function handleOpen(item: NotificationVO): Promise<void> {
  if (item.read) return
  const previous = item.read
  item.read = true
  unreadTotal.value = Math.max(0, unreadTotal.value - 1)
  try {
    if (isNotice(item)) {
      await markNoticeRead(Number(item.id.slice(NOTICE_PREFIX.length)))
    } else {
      await markNotificationRead(item.id)
    }
  } catch (e) {
    item.read = previous
    await refreshUnread()
    toast(e instanceof Error ? e.message : t('notifications.markReadFailed'), 'error')
  }
}

async function handleMarkAllRead(): Promise<void> {
  try {
    // 两条线都要标，否则公告永远未读、红点永远清不掉
    await Promise.all([markAllNotificationsRead(), markAllNoticesRead()])
    items.value.forEach((item) => { item.read = true })
    await refreshUnread()
  } catch (e) {
    toast(e instanceof Error ? e.message : t('notifications.markReadFailed'), 'error')
  }
}

async function handleClear(): Promise<void> {
  confirmClear.value = false
  try {
    await clearNotifications()
    await load()
  } catch (e) {
    toast(e instanceof Error ? e.message : t('notifications.clearFailed'), 'error')
  }
}

onMounted(load)
</script>
