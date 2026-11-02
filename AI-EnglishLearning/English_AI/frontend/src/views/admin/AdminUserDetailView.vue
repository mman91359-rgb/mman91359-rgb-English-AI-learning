<template>
  <LoadingState v-if="loading && !data" :message="$t('adminConsole.common.loading')" />
  <ErrorState
    v-else-if="error"
    :message="error instanceof Error ? error.message : $t('adminConsole.error.generic')"
    :action-label="$t('adminConsole.common.retry')"
    @retry="reload"
  />
  <div v-else-if="data" class="flex flex-col gap-6">
    <RouterLink to="/admin/users" class="inline-flex w-fit items-center gap-1 font-label-lg text-label-lg text-primary hover:underline">
      <span class="material-symbols-outlined text-icon-md">arrow_back</span>
      {{ $t('adminConsole.users.backToList') }}
    </RouterLink>

    <section class="flex flex-col gap-6 rounded-[16px] border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow md:flex-row md:items-center">
      <UserAvatar :name="displayName" :avatar-url="data.user.avatarUrl" size="lg" />
      <div class="flex min-w-0 flex-1 flex-col gap-2">
        <div class="flex flex-wrap items-center gap-3">
          <h2 class="font-headline-md text-headline-md text-on-surface">{{ displayName }}</h2>
          <StatusBadge :tone="statusTone(data.user.status)" :label="statusLabel(data.user.status)" />
        </div>
        <p class="font-body-sm text-body-sm text-on-surface-variant">
          {{ data.user.username }} · {{ displayOrDash(data.user.phoneMasked) }}
        </p>
        <div class="flex flex-wrap gap-2">
          <StatusBadge v-for="role in data.user.roles" :key="role" :tone="roleTone(role)" :label="roleLabel(role)" />
        </div>
      </div>
      <div class="flex flex-wrap gap-2">
        <button
          type="button"
          class="flex items-center gap-2 rounded-full px-4 py-2 font-label-lg text-label-lg text-on-primary"
          :class="data.user.status === 1 ? 'bg-error' : 'bg-primary'"
          @click="action = { kind: 'status', user: data.user }"
        >
          <span class="material-symbols-outlined text-icon-sm">{{ data.user.status === 1 ? 'block' : 'check_circle' }}</span>
          {{ data.user.status === 1 ? $t('adminConsole.users.actionDisable') : $t('adminConsole.users.actionEnable') }}
        </button>
        <button type="button" class="flex items-center gap-2 rounded-full border border-outline-variant px-4 py-2 font-label-lg text-label-lg text-on-surface-variant" @click="action = { kind: 'reset', user: data.user }">
          <span class="material-symbols-outlined text-icon-sm">lock_reset</span>
          {{ $t('adminConsole.users.actionReset') }}
        </button>
        <button type="button" class="flex items-center gap-2 rounded-full border border-outline-variant px-4 py-2 font-label-lg text-label-lg text-on-surface-variant" @click="action = { kind: 'setPassword', user: data.user }">
          <span class="material-symbols-outlined text-icon-sm">key</span>
          {{ $t('adminConsole.users.actionSetPassword') }}
        </button>
        <button type="button" class="flex items-center gap-2 rounded-full border border-outline-variant px-4 py-2 font-label-lg text-label-lg text-on-surface-variant" @click="action = { kind: 'role', user: data.user }">
          <span class="material-symbols-outlined text-icon-sm">manage_accounts</span>
          {{ $t('adminConsole.users.actionRole') }}
        </button>
      </div>
    </section>

    <section class="grid grid-cols-1 gap-gutter lg:grid-cols-2">
      <section class="flex flex-col gap-4 rounded-[16px] border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
        <h3 class="font-headline-sm text-headline-sm text-on-surface">{{ $t('adminConsole.detail.basicInfo') }}</h3>
        <dl class="grid grid-cols-2 gap-x-6 gap-y-4">
          <div class="flex flex-col gap-1">
            <dt class="font-label-md text-label-md text-on-surface-variant">{{ $t('adminConsole.users.colCet') }}</dt>
            <dd class="tabular-nums font-body-md text-body-md text-on-surface">{{ displayOrDash(data.user.cetLevel) }}</dd>
          </div>
          <div class="flex flex-col gap-1">
            <dt class="font-label-md text-label-md text-on-surface-variant">{{ $t('adminConsole.detail.elo') }}</dt>
            <dd class="tabular-nums font-body-md text-body-md text-on-surface">{{ formatNumber(data.user.eloScore, locale) }}</dd>
          </div>
          <div class="flex flex-col gap-1">
            <dt class="font-label-md text-label-md text-on-surface-variant">{{ $t('adminConsole.users.colCreatedAt') }}</dt>
            <dd class="tabular-nums font-body-md text-body-md text-on-surface">{{ formatAdminDateTime(data.user.createdAt) }}</dd>
          </div>
          <div class="flex flex-col gap-1">
            <dt class="font-label-md text-label-md text-on-surface-variant">{{ $t('adminConsole.users.colLastLogin') }}</dt>
            <dd class="tabular-nums font-body-md text-body-md text-on-surface">{{ formatAdminDateTime(data.user.lastLoginAt) }}</dd>
          </div>
        </dl>
      </section>

      <section class="flex flex-col gap-4 rounded-[16px] border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
        <h3 class="font-headline-sm text-headline-sm text-on-surface">{{ $t('adminConsole.detail.coinInfo') }}</h3>
        <div class="flex flex-col gap-1">
          <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('adminConsole.users.colCoin') }}</span>
          <span class="tabular-nums font-body-md text-body-md text-on-surface">{{ formatNumber(data.user.coinBalance, locale) }}</span>
        </div>
      </section>
    </section>

    <section class="grid grid-cols-1 gap-gutter lg:grid-cols-3">
      <DetailRecordCard :title="$t('adminConsole.detail.abilityCard')" :data="data.radar" />
      <DetailRecordCard :title="$t('adminConsole.detail.coinCard')" :data="data.coin" />
      <DetailRecordCard :title="$t('adminConsole.detail.statsCard')" :data="data.stats" />
    </section>

    <UserActionDialog v-if="action" :key="`${action.kind}-${action.user.id}`" :action="action" @close="onActionClose" />
  </div>
</template>

<script setup lang="ts">
import { computed, ref } from 'vue'
import { useRoute, RouterLink } from 'vue-router'
import { useI18n } from 'vue-i18n'
import ErrorState from '../../components/ui/ErrorState.vue'
import LoadingState from '../../components/ui/LoadingState.vue'
import StatusBadge from '../../components/admin/StatusBadge.vue'
import UserAvatar from '../../components/admin/UserAvatar.vue'
import UserActionDialog from '../../components/admin/UserActionDialog.vue'
import DetailRecordCard from './components/DetailRecordCard.vue'
import type { UserAction } from '../../components/admin/userActionTypes'
import { useAsyncData } from '../../composables/useAsyncData'
import { getAdminUser, type UserRole, type UserStatus } from '../../api/admin'
import { USER_ROLE_META, USER_STATUS_META } from '../../utils/adminEnums'
import { displayOrDash, formatAdminDateTime, formatNumber } from '../../utils/format'

const route = useRoute()
const { t, locale } = useI18n()

const statusTone = (value: UserStatus) => USER_STATUS_META[value].tone
const statusLabel = (value: UserStatus) => t(USER_STATUS_META[value].labelKey)
const roleTone = (value: UserRole) => USER_ROLE_META[value].tone
const roleLabel = (value: UserRole) => t(USER_ROLE_META[value].labelKey)

const userId = computed(() => Number(route.params.id))
const { data, error, loading, reload } = useAsyncData(() => getAdminUser(userId.value), () => [userId.value])

const displayName = computed(() => data.value?.user.nickname || data.value?.user.username || '')
const action = ref<UserAction | null>(null)

const onActionClose = (changed: boolean) => {
  action.value = null
  if (changed) void reload()
}
</script>
