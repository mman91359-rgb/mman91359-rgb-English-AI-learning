<template>
  <AppLayout>
    <PageHeader
      :title="$t('wallet.title')"
      :subtitle="$t('wallet.subtitle')"
      back
      back-to="/profile"
    />

    <LoadingState v-if="loading && !loaded" />

    <ErrorState
      v-else-if="error && !loaded"
      :message="$t('wallet.loadFailed')"
      :action-label="$t('common.retry')"
      @retry="ledger.load"
    />

    <div v-else class="space-y-6">
      <!-- 账户概览：大数字只用 headline-lg，不与 display-lg 同页（契约 §6.1） -->
      <AppCard padding="regular">
        <div class="flex items-center gap-4">
          <div class="flex h-12 w-12 shrink-0 items-center justify-center rounded-full bg-tertiary-container/20">
            <AppIcon name="account_balance_wallet" size="lg" filled tone="tertiary" />
          </div>
          <div class="min-w-0">
            <p class="font-label-md text-label-md text-on-surface-variant">{{ $t('wallet.balance') }}</p>
            <p class="font-headline-lg text-headline-lg text-on-surface tabular-nums">{{ balanceText }}</p>
            <p class="mt-1 font-body-sm text-body-sm text-on-surface-variant">{{ $t('wallet.balanceHint') }}</p>
            <p class="mt-1 font-label-sm text-label-sm text-outline">{{ $t('coin.rateHint', { coins: userStore.coinsPerYuan }) }}</p>
          </div>
        </div>

        <!-- 三格小统计：无底色，靠分隔线分组，避免 StatTile 再叠一层卡 -->
        <div class="mt-6 grid grid-cols-3 divide-x divide-outline-variant/40 border-t border-outline-variant/40 pt-5">
          <div class="pr-4">
            <p class="font-label-md text-label-md text-on-surface-variant">{{ $t('wallet.totalEarned') }}</p>
            <p class="mt-1 font-headline-md text-headline-md text-on-surface tabular-nums">{{ earnedText }}</p>
          </div>
          <div class="px-4">
            <p class="font-label-md text-label-md text-on-surface-variant">{{ $t('wallet.totalSpent') }}</p>
            <p class="mt-1 font-headline-md text-headline-md text-on-surface tabular-nums">{{ spentText }}</p>
          </div>
          <div class="pl-4">
            <p class="font-label-md text-label-md text-on-surface-variant">{{ $t('wallet.monthSpent') }}</p>
            <p class="mt-1 font-headline-md text-headline-md text-on-surface tabular-nums">{{ monthSpentText }}</p>
          </div>
        </div>
      </AppCard>

      <!-- 规则说明：兑换未开放，这一条必须写在页面上，不能让用户以为金币能换东西 -->
      <AppCard tone="container-low" padding="compact">
        <div class="flex gap-3">
          <AppIcon name="info" size="md" tone="variant" class="mt-0.5 shrink-0" />
          <div class="min-w-0">
            <p class="font-label-lg text-label-lg text-on-surface">{{ $t('wallet.rules.title') }}</p>
            <ul class="mt-2 space-y-1 font-body-sm text-body-sm text-on-surface-variant">
              <li>{{ $t('wallet.rules.redeem') }}</li>
              <li>{{ $t('wallet.rules.sources') }}</li>
              <li>{{ $t('coin.rateHint', { coins: userStore.coinsPerYuan }) }}</li>
            </ul>
          </div>
        </div>
      </AppCard>

      <!-- 流水：日期分组头 + 卡内行 -->
      <AppCard padding="compact">
        <SectionHeader
          :title="$t('wallet.ledgerTitle')"
          :subtitle="$t('wallet.ledgerHint')"
          :level="2"
        />

        <div class="mb-4">
          <ChipGroup
            :model-value="selectedBiz"
            :options="chipOptions"
            :aria-label="$t('wallet.filter.label')"
            @update:model-value="onBizChange"
          />
        </div>

        <EmptyState
          v-if="isEmpty()"
          icon="receipt_long"
          :title="selectedBiz === 'ALL' ? $t('wallet.emptyTitle') : $t('wallet.emptyFilteredTitle')"
          :description="selectedBiz === 'ALL' ? $t('wallet.emptyDesc') : $t('wallet.emptyFilteredDesc')"
        />

        <div v-else class="space-y-4">
          <div v-for="group in grouped" :key="group.key">
            <p class="px-1 pb-1 font-label-sm text-label-sm text-on-surface-variant">{{ group.label }}</p>
            <ListRow
              v-for="row in group.items"
              :key="row.id"
              :title="bizLabel(row)"
              :subtitle="formatDateTime(row.createdAt, locale)"
            >
              <template #leading>
                <div
                  class="flex h-9 w-9 shrink-0 items-center justify-center rounded-full"
                  :class="metaOf(row.bizType).wrap"
                >
                  <AppIcon :name="metaOf(row.bizType).icon" size="md" :tone="metaOf(row.bizType).tone" />
                </div>
              </template>
              <template #trailing>
                <div class="text-right">
                  <!-- 这里显示的是「本笔变动值」。不能复用顶栏 CoinBadge：
                       它没有 amount 入参，渲染的是 userStore.coinBalance（当前余额），
                       且整个组件是跳 /wallet 的 router-link，放进列表会每行都指向本页。 -->
                  <p
                    class="font-label-lg text-label-lg tabular-nums"
                    :class="row.amount >= 0 ? 'text-tertiary' : 'text-error'"
                  >
                    {{ signedAmount(row.amount) }}
                  </p>
                  <p class="mt-1 font-label-sm text-label-sm text-on-surface-variant tabular-nums">
                    {{ balanceAfterText(row.balanceAfter) }}
                  </p>
                </div>
              </template>
            </ListRow>
          </div>

          <div v-if="hasMore" class="flex justify-center">
            <button type="button" :class="btnSecondary" :disabled="loadingMore" @click="ledger.loadMore()">
              {{ loadingMore ? $t('common.loading') : $t('wallet.loadMore') }}
            </button>
          </div>
          <p v-else class="text-center font-label-sm text-label-sm text-on-surface-variant">
            {{ $t('wallet.noMore') }}
          </p>

          <p v-if="error && items.length > 0" class="text-center font-label-sm text-label-sm text-error">
            {{ $t('wallet.loadFailed') }} · {{ error }}
          </p>
        </div>
      </AppCard>
    </div>
  </AppLayout>
</template>

<script setup lang="ts">
import { computed, onMounted } from 'vue'
import { useI18n } from 'vue-i18n'
import AppLayout from '@/components/AppLayout.vue'
import PageHeader from '@/components/ui/PageHeader.vue'
import AppCard from '@/components/ui/AppCard.vue'
import AppIcon from '@/components/ui/AppIcon.vue'
import SectionHeader from '@/components/ui/SectionHeader.vue'
import ListRow from '@/components/ui/ListRow.vue'
import ChipGroup from '@/components/ui/ChipGroup.vue'
import EmptyState from '@/components/ui/EmptyState.vue'
import LoadingState from '@/components/ui/LoadingState.vue'
import ErrorState from '@/components/ui/ErrorState.vue'
import { btnSecondary } from '@/components/ui/buttonStyles'
import { useCoinLedger } from '@/composables/useCoinLedger'
import { formatDateTime, formatNumber } from '@/utils/format'
import { useUserStore } from '@/stores/user'
import type { CoinTransactionVO } from '@/api/coin'

const { t, locale } = useI18n()
const userStore = useUserStore()
const ledger = useCoinLedger()
const { items, balance, totalEarned, totalSpent, monthSpent, hasMore, loading, loadingMore, error, loaded, counts, bizType, load, setBizType, isEmpty } = ledger

/** 筛选胶囊：计数来自后端全量 bizTypeCounts，切换筛选时不变 */
const chipOptions = computed(() => {
  const c = counts.value
  const total = Object.values(c).reduce((sum, n) => sum + n, 0)
  return [
    { value: 'ALL', label: t('wallet.filter.all'), count: total },
    { value: 'CHECK_IN', label: t('wallet.biz.CHECK_IN'), count: c.CHECK_IN ?? 0 },
    { value: 'CHECK_IN_MILESTONE', label: t('wallet.biz.CHECK_IN_MILESTONE'), count: c.CHECK_IN_MILESTONE ?? 0 },
    { value: 'VOCAB_GROUP', label: t('wallet.biz.VOCAB_GROUP'), count: c.VOCAB_GROUP ?? 0 },
    { value: 'CHECK_IN_MAKEUP', label: t('wallet.biz.CHECK_IN_MAKEUP'), count: c.CHECK_IN_MAKEUP ?? 0 },
  ]
})

const selectedBiz = computed(() => bizType.value ?? 'ALL')

const onBizChange = (value: string | number | (string | number)[]): void => {
  const next = Array.isArray(value) ? value[0] : value
  setBizType(next === 'ALL' || next === undefined ? null : String(next))
}

/** 业务类型 → 图标与配色。全部写成完整字面量，禁止拼接（契约 §11.4 会静默丢类名） */
type BizTone = 'primary' | 'secondary' | 'tertiary' | 'variant' | 'error'
interface BizMeta {
  icon: string
  wrap: string
  tone: BizTone
}

const BIZ_META: Record<string, BizMeta> = {
  CHECK_IN: { icon: 'event_available', wrap: 'bg-primary-container/30', tone: 'primary' },
  CHECK_IN_MILESTONE: { icon: 'military_tech', wrap: 'bg-tertiary-container/40', tone: 'tertiary' },
  VOCAB_GROUP: { icon: 'menu_book', wrap: 'bg-secondary-container/40', tone: 'secondary' },
  CHECK_IN_MAKEUP: { icon: 'event_available', wrap: 'bg-error-container/40', tone: 'error' },
}

const BIZ_FALLBACK: BizMeta = { icon: 'paid', wrap: 'bg-surface-container-high', tone: 'variant' }

const metaOf = (bizType: string): BizMeta => BIZ_META[bizType] ?? BIZ_FALLBACK

interface DayGroup {
  key: string
  label: string
  items: CoinTransactionVO[]
}

/** 按 createdAt 的日期部分分组；顺序沿用后端倒序，不重排 */
const grouped = computed<DayGroup[]>(() => {
  const buckets = new Map<string, CoinTransactionVO[]>()
  items.value.forEach((row) => {
    const key = row.createdAt ? row.createdAt.slice(0, 10) : 'unknown'
    const bucket = buckets.get(key)
    if (bucket) bucket.push(row)
    else buckets.set(key, [row])
  })
  return Array.from(buckets.entries()).map(([key, rows]) => ({
    key,
    label: dayLabel(key),
    items: rows,
  }))
})

/** 用本地时间构造日期，避免 new Date('2026-11-15') 被当成 UTC 零点而差一天 */
function dayLabel(key: string): string {
  if (key === 'unknown') return t('wallet.unknownDate')
  const [year, month, day] = key.split('-').map(Number)
  if (!year || !month || !day) return t('wallet.unknownDate')
  return new Date(year, month - 1, day).toLocaleDateString(locale.value, {
    year: 'numeric',
    month: 'long',
    day: 'numeric',
  })
}

const balanceText = computed(() => formatNumber(balance.value, locale.value))
const earnedText = computed(() => formatNumber(totalEarned.value, locale.value))
const spentText = computed(() => formatNumber(totalSpent.value, locale.value))
const monthSpentText = computed(() => formatNumber(monthSpent.value, locale.value))

/** 已知业务类型 → i18n key。后端 description 是中文硬编码，英文界面不能直出 */
const BIZ_LABEL_KEYS: Record<string, string> = {
  CHECK_IN: 'wallet.biz.CHECK_IN',
  CHECK_IN_MILESTONE: 'wallet.biz.CHECK_IN_MILESTONE',
  VOCAB_GROUP: 'wallet.biz.VOCAB_GROUP',
  CHECK_IN_MAKEUP: 'wallet.biz.CHECK_IN_MAKEUP',
}

/** 已知类型走 i18n；未知类型才用后端 description 兜底，避免英文界面冒中文 */
const bizLabel = (row: CoinTransactionVO): string => {
  const key = BIZ_LABEL_KEYS[row.bizType]
  if (key) return t(key)
  return row.description || t('wallet.unknownBiz')
}

/** 变动值带正负号；正数=获得用 tertiary，负数=消耗用 error */
const signedAmount = (value: number): string => {
  const abs = formatNumber(Math.abs(value), locale.value)
  return value >= 0 ? `+${abs}` : `-${abs}`
}

const balanceAfterText = (value: number | null): string => {
  if (value === null) return '—'
  return t('wallet.balanceAfter', { value: formatNumber(value, locale.value) })
}

onMounted(() => {
  void load()
})
</script>
