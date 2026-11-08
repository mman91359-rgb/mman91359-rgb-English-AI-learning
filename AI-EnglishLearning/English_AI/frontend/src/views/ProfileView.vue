<template>
  <AppLayout>
    <!-- 个人信息头部 -->
    <section class="bg-surface-container-low rounded-[32px] overflow-hidden relative soft-shadow">
      <div class="h-48 bg-primary-fixed-dim/30 w-full absolute top-0 left-0"></div>
      <div class="relative z-10 pt-24 pb-12 px-8 flex flex-col items-center text-center">
        <!-- 头像区域：点击可上传 -->
        <div
          class="w-40 h-40 bg-surface-container-lowest rounded-3xl soft-shadow mb-6 flex items-center justify-center border-4 border-surface relative cursor-pointer group overflow-hidden"
          @click="triggerAvatarUpload"
        >
          <img
            v-if="avatarFullUrl"
            :src="avatarFullUrl"
            alt="头像"
            class="w-full h-full object-cover"
          />
          <span v-else class="material-symbols-outlined text-[80px] text-primary fill">featured_seasonal_and_gifts</span>
          <!-- 悬浮遮罩提示 -->
          <div class="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center rounded-3xl">
            <span class="material-symbols-outlined text-white text-icon-2xl">camera_alt</span>
          </div>
        </div>
        <!-- 隐藏的文件输入框 -->
        <input
          ref="avatarInputRef"
          type="file"
          accept="image/*"
          class="hidden"
          @change="handleAvatarChange"
        />
        <!-- 上传提示 -->
        <p v-if="avatarUploading" class="text-label-sm font-label-sm text-primary mb-2">上传中...</p>
        <div class="flex items-center gap-2 group cursor-pointer" @click="openNicknameDialog">
          <h1 class="font-headline-lg text-headline-lg text-on-background">{{ displayName }}</h1>
          <span class="material-symbols-outlined text-outline group-hover:text-primary transition-colors text-xl">edit</span>
        </div>
        <p class="font-body-md text-body-md text-on-surface-variant mt-2">{{ userLevel }}</p>

        <!-- 修改昵称弹窗 -->
        <BaseDialog
          :visible="nicknameDialogVisible"
          :title="$t('profile.editNickname')"
          max-width="max-w-md"
          @close="closeNicknameDialog"
        >
          <input
            ref="nicknameInputRef"
            v-model="nicknameInput"
            type="text"
            maxlength="20"
            data-autofocus
            :placeholder="$t('profile.nicknamePlaceholder')"
            :class="inputClassLg"
            @keyup.enter="submitNickname"
          />
          <template #footer>
            <div class="flex w-full gap-3">
              <button
                type="button"
                :class="btnDialogSecondary"
                @click="closeNicknameDialog"
              >
                {{ $t('profile.cancel') }}
              </button>
              <button
                type="button"
                :disabled="nicknameSubmitting || !nicknameInput.trim()"
                :class="btnDialogPrimary"
                @click="submitNickname"
              >
                {{ nicknameSubmitting ? $t('profile.saving') : $t('profile.save') }}
              </button>
            </div>
          </template>
        </BaseDialog>
        <div class="grid grid-cols-3 gap-8 mt-12 w-full max-w-2xl mx-auto border-t border-outline-variant/20 pt-8">
          <div class="flex flex-col items-center">
            <span class="material-symbols-outlined text-secondary-fixed-dim mb-2 text-3xl fill">schedule</span>
            <span class="font-label-lg text-label-lg text-on-surface-variant mb-1">{{ $t('profile.totalStudyTime') }}</span>
            <span class="font-headline-md text-headline-md text-on-background">{{ totalStudyTime }}</span>
          </div>
          <div class="flex flex-col items-center border-l border-r border-outline-variant/20 px-4">
            <span class="material-symbols-outlined text-primary-container mb-2 text-3xl fill" :class="{ 'opacity-30': userStore.checkInStreak < 3 }">local_fire_department</span>
            <span class="font-label-lg text-label-lg text-on-surface-variant mb-1">{{ $t('dashboard.streakDays') }}</span>
            <span class="font-headline-md text-headline-md text-on-background">{{ userStore.checkInStreak }}{{ $t('stats.days') }}</span>
          </div>
          <div class="flex flex-col items-center">
            <span class="material-symbols-outlined text-tertiary-fixed-dim mb-2 text-3xl fill">calendar_month</span>
            <span class="font-label-lg text-label-lg text-on-surface-variant mb-1">{{ $t('stats.activeDays') }}</span>
            <span class="font-headline-md text-headline-md text-on-background">{{ activeDays }}{{ $t('stats.days') }}</span>
          </div>
        </div>
      </div>
    </section>

    <!-- 金币与签到 -->
    <section class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <div class="bg-surface-container-lowest rounded-[24px] p-8 soft-shadow border border-surface-container-low">
        <div class="flex items-center gap-4 mb-6">
          <div class="w-12 h-12 rounded-full bg-tertiary-container/20 flex items-center justify-center">
            <span class="material-symbols-outlined text-tertiary text-3xl fill">paid</span>
          </div>
          <div>
            <p class="font-label-md text-label-md text-on-surface-variant">{{ $t('coin.balance') }}</p>
            <p class="font-headline-lg text-headline-lg text-on-surface tabular-nums">
              {{ formatNumber(userStore.coinBalance, 'zh-CN') }}
            </p>
          </div>
        </div>
        <div class="flex items-center justify-between p-4 rounded-xl bg-surface-container-low">
          <span class="font-body-md text-body-md text-on-surface-variant">{{ $t('coin.totalEarned') }}</span>
          <span class="font-label-lg text-label-lg text-on-surface tabular-nums">
            {{ formatNumber(userStore.totalEarned, 'zh-CN') }}
          </span>
        </div>
      </div>

      <div class="bg-surface-container-lowest rounded-[24px] p-8 soft-shadow border border-surface-container-low">
        <div class="flex items-start justify-between gap-3 mb-6">
          <div class="flex items-center gap-4">
            <div class="w-12 h-12 rounded-full bg-primary-container/20 flex items-center justify-center">
              <span class="material-symbols-outlined text-primary text-3xl">event_available</span>
            </div>
            <div>
              <p class="font-label-md text-label-md text-on-surface-variant">{{ $t('checkIn.title') }}</p>
              <p class="font-body-md text-body-md text-on-surface">
                {{ $t('checkIn.streak', { days: userStore.checkInStreak }) }}
              </p>
            </div>
          </div>
          <span
            class="px-3 py-1 rounded-full font-label-sm text-label-sm whitespace-nowrap"
            :class="userStore.todayCheckedIn
              ? 'bg-primary-container/20 text-primary'
              : 'bg-surface-container-high text-on-surface-variant'"
          >
            {{ userStore.todayCheckedIn ? $t('checkIn.checkedIn') : $t('checkIn.notCheckedIn') }}
          </span>
        </div>

        <button
          v-if="!userStore.todayCheckedIn"
          :disabled="profileCheckingIn"
          class="w-full py-3 rounded-full bg-tertiary text-on-tertiary font-label-lg text-label-lg transition-all duration-200 hover:bg-tertiary/90 hover:shadow-sm active:scale-[0.98] disabled:opacity-60 disabled:cursor-not-allowed"
          @click="handleProfileCheckIn"
        >
          {{ profileCheckingIn
            ? $t('common.saving')
            : (userStore.previewSignInReward > 0
              ? $t('checkIn.button', { reward: userStore.previewSignInReward })
              : $t('checkIn.action')) }}
        </button>
        <p v-else class="text-center font-body-md text-body-md text-on-surface-variant py-3">
          {{ $t('checkIn.checkedInTip') }}
        </p>
      </div>
    </section>

    <!-- 能力画像与设置 -->
    <section class="grid grid-cols-1 md:grid-cols-3 gap-8">
      <!-- 能力画像：分数 + 雷达图 -->
      <div class="md:col-span-2 bg-surface-container-lowest rounded-[24px] p-8 soft-shadow border border-surface-container-low">
        <div class="flex items-center justify-between gap-4 mb-6">
          <h3 class="font-headline-md text-headline-md text-on-background">{{ $t('profile.ability.title') }}</h3>
          <span
            v-if="radar"
            class="px-3 py-1 rounded-full bg-primary-container/20 font-label-sm text-label-sm text-primary whitespace-nowrap"
          >
            {{ radar.eloLevel || $t('profile.beginner') }}
          </span>
        </div>

        <!-- 加载态 -->
        <div v-if="radarLoading" class="grid grid-cols-1 lg:grid-cols-2 gap-8">
          <div class="space-y-3">
            <div class="h-3 w-16 rounded-full bg-surface-container animate-pulse"></div>
            <div class="h-12 w-28 rounded-xl bg-surface-container animate-pulse"></div>
            <div class="h-1.5 w-full rounded-full bg-surface-container animate-pulse"></div>
          </div>
          <div class="h-[280px] w-full rounded-2xl bg-surface-container animate-pulse"></div>
        </div>

        <!-- 错误态 -->
        <div v-else-if="radarError" class="flex flex-col items-center gap-3 py-12 text-center">
          <span class="material-symbols-outlined text-icon-2xl text-error">error_outline</span>
          <p class="font-body-md text-body-md text-on-surface-variant">{{ radarError }}</p>
          <button
            type="button"
            class="mt-1 rounded-full border border-outline-variant px-5 py-2 font-label-sm text-label-sm text-on-surface-variant transition-colors hover:bg-surface-variant"
            @click="loadRadar"
          >
            {{ $t('common.retry') }}
          </button>
        </div>

        <template v-else>
          <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 items-center">
            <!-- 左：ELO 总分与等级区间 -->
            <div class="text-center lg:text-left">
              <p class="font-label-md text-label-md uppercase tracking-wider text-on-surface-variant">
                {{ $t('profile.ability.totalScore') }}
              </p>
              <p class="mt-1 font-display-lg text-display-lg text-primary tabular-nums">{{ radar?.eloScore ?? 0 }}</p>
              <div class="mt-5">
                <div class="flex items-center justify-between font-label-sm text-label-sm text-on-surface-variant tabular-nums">
                  <span>{{ radar?.eloFloor ?? 0 }}</span>
                  <span>{{ radar?.eloCeil ?? 0 }}</span>
                </div>
                <div class="mt-1.5 h-1.5 w-full overflow-hidden rounded-full bg-outline-variant/30">
                  <div
                    class="h-full rounded-full bg-primary transition-all"
                    :style="{ width: `${radar?.eloProgress ?? 0}%` }"
                  ></div>
                </div>
              </div>
            </div>

            <!-- 右：六维雷达图 -->
            <AbilityRadarChart :items="radarAxes" />
          </div>

          <!-- 六维分数明细 -->
          <div class="mt-6 grid grid-cols-1 gap-x-8 lg:grid-cols-2 border-t border-outline-variant/20 pt-4">
            <div v-for="axis in radarAxes" :key="axis.key" class="flex items-center gap-3 py-2">
              <span class="material-symbols-outlined text-icon-sm text-on-surface-variant">{{ axis.icon }}</span>
              <span class="w-20 shrink-0 truncate font-body-sm text-body-sm text-on-surface">{{ axis.label }}</span>
              <div class="h-1 flex-1 overflow-hidden rounded-full bg-outline-variant/30">
                <div
                  class="h-full rounded-full bg-primary transition-all"
                  :style="{ width: `${axis.hasData ? axis.score : 0}%` }"
                ></div>
              </div>
              <span
                class="w-10 shrink-0 text-right font-label-lg text-label-lg tabular-nums"
                :class="axis.hasData ? 'text-on-surface' : 'text-on-surface-variant/50'"
              >
                {{ axis.hasData ? axis.score : '—' }}
              </span>
            </div>
          </div>

          <p class="mt-4 font-label-sm text-label-sm leading-relaxed text-on-surface-variant/70">
            {{ $t('profile.ability.footnote') }}
          </p>
        </template>
      </div>

      <!-- 设置入口 -->
      <div class="flex flex-col gap-4">
        <router-link to="/settings/privacy" class="bg-surface-container-lowest rounded-[24px] p-6 soft-shadow flex items-center justify-between hover:-translate-y-1 transition-transform group">
          <div class="flex items-center gap-4">
            <div class="w-12 h-12 rounded-full bg-surface-container-low flex items-center justify-center group-hover:bg-primary-fixed-dim/20 transition-colors">
              <span class="material-symbols-outlined text-on-surface-variant group-hover:text-primary transition-colors">shield_person</span>
            </div>
            <span class="font-body-lg text-body-lg text-on-surface font-medium">{{ $t('profile.privacySettings') }}</span>
          </div>
          <span class="material-symbols-outlined text-outline-variant">chevron_right</span>
        </router-link>
        <router-link to="/settings/account" class="bg-surface-container-lowest rounded-[24px] p-6 soft-shadow flex items-center justify-between hover:-translate-y-1 transition-transform group">
          <div class="flex items-center gap-4">
            <div class="w-12 h-12 rounded-full bg-surface-container-low flex items-center justify-center group-hover:bg-primary-fixed-dim/20 transition-colors">
              <span class="material-symbols-outlined text-on-surface-variant group-hover:text-primary transition-colors">manage_accounts</span>
            </div>
            <span class="font-body-lg text-body-lg text-on-surface font-medium">{{ $t('profile.accountSettings') }}</span>
          </div>
          <span class="material-symbols-outlined text-outline-variant">chevron_right</span>
        </router-link>
        <router-link to="/settings/notifications" class="bg-surface-container-lowest rounded-[24px] p-6 soft-shadow flex items-center justify-between hover:-translate-y-1 transition-transform group">
          <div class="flex items-center gap-4">
            <div class="w-12 h-12 rounded-full bg-surface-container-low flex items-center justify-center group-hover:bg-primary-fixed-dim/20 transition-colors">
              <span class="material-symbols-outlined text-on-surface-variant group-hover:text-primary transition-colors">notifications_active</span>
            </div>
            <span class="font-body-lg text-body-lg text-on-surface font-medium">{{ $t('profile.notificationSettings') }}</span>
          </div>
          <span class="material-symbols-outlined text-outline-variant">chevron_right</span>
        </router-link>
        <div class="mt-auto bg-primary-fixed-dim/10 rounded-[24px] p-6 border border-primary-fixed-dim/20 flex flex-col items-center justify-center text-center">
          <span class="material-symbols-outlined text-primary text-icon-2xl mb-2">workspace_premium</span>
          <h4 class="font-label-lg text-label-lg text-primary mb-1">{{ $t('profile.upgradePro') }}</h4>
          <p class="font-label-md text-label-md text-on-surface-variant mb-4">{{ $t('profile.upgradeDesc') }}</p>
          <button class="w-full bg-primary text-on-primary py-2 rounded-xl font-label-lg text-label-lg hover:bg-primary/90 transition-colors">
            {{ $t('profile.viewPlans') }}
          </button>
        </div>
      </div>
    </section>
  </AppLayout>
</template>

<script setup lang="ts">
import { ref, computed, watch, nextTick } from 'vue'
import { useI18n } from 'vue-i18n'
import AppLayout from '../components/AppLayout.vue'
import { useUserStore } from '@/stores/user'
import { formatNumber } from '@/utils/format'
import { getAbilityRadar } from '@/api/stats'
import { getExerciseStats } from '@/api/exercise'
import { uploadAvatar, updateNickname } from '@/api/user'
import { useToast } from '@/composables/useToast'
import AbilityRadarChart from '@/components/profile/AbilityRadarChart.vue'
import BaseDialog from '@/components/ui/BaseDialog.vue'
import { inputClassLg } from '@/components/ui/formStyles'
import { btnDialogPrimary, btnDialogSecondary } from '@/components/ui/buttonStyles'
import type { AbilityDimensionKey, AbilityRadar } from '@/api/stats'

const { t } = useI18n()
const userStore = useUserStore()
const { show: toast } = useToast()

// ========== 用户基本信息 ==========
const displayName = computed(() => {
  return userStore.user?.nickname || userStore.user?.username || '同学'
})

const userLevel = ref(t('profile.beginner'))

// ========== 头像上传 ==========
const avatarInputRef = ref<HTMLInputElement | null>(null)
const avatarUploading = ref(false)

/** 拼接头像完整URL（加上网关前缀） */
const avatarFullUrl = computed(() => {
  const url = userStore.avatarUrl
  if (!url) return ''
  // avatarUrl 格式: /user/avatar/xxx.jpg，前端需要加 /api 前缀走网关
  return `/api${url}`
})

/** 点击头像触发文件选择 */
const triggerAvatarUpload = () => {
  avatarInputRef.value?.click()
}

/** 选择文件后上传 */
const handleAvatarChange = async (e: Event) => {
  const input = e.target as HTMLInputElement
  const file = input.files?.[0]
  if (!file) return

  // 前端校验
  if (!file.type.startsWith('image/')) {
    toast('请选择图片文件', 'error')
    return
  }
  if (file.size > 5 * 1024 * 1024) {
    toast('头像文件不能超过5MB', 'error')
    return
  }

  const userId = userStore.userId
  if (!userId) return

  avatarUploading.value = true
  try {
    const avatarUrl = await uploadAvatar(userId, file)
    userStore.updateAvatar(avatarUrl)
    toast('头像更新成功', 'success')
  } catch (e: any) {
    toast(e.message || '头像上传失败', 'error')
  } finally {
    avatarUploading.value = false
    // 重置 input，允许再次选择同一文件
    input.value = ''
  }
}

// ========== 修改昵称 ==========
const nicknameDialogVisible = ref(false)
const nicknameInput = ref('')
const nicknameSubmitting = ref(false)
const nicknameInputRef = ref<HTMLInputElement | null>(null)

/** 打开修改昵称弹窗 */
const openNicknameDialog = () => {
  nicknameInput.value = userStore.user?.nickname || userStore.username || ''
  nicknameDialogVisible.value = true
  // 弹窗渲染后自动聚焦输入框
  nextTick(() => {
    nicknameInputRef.value?.focus()
    nicknameInputRef.value?.select()
  })
}

/** 关闭修改昵称弹窗 */
const closeNicknameDialog = () => {
  nicknameDialogVisible.value = false
  nicknameInput.value = ''
}

/** 提交昵称修改 */
const submitNickname = async () => {
  const newNickname = nicknameInput.value.trim()
  if (!newNickname) {
    toast('昵称不能为空', 'warning')
    return
  }
  if (newNickname.length > 20) {
    toast('昵称长度不能超过20个字符', 'warning')
    return
  }

  const userId = userStore.userId
  if (!userId) return

  // 昵称未变化直接关闭
  if (newNickname === userStore.user?.nickname) {
    closeNicknameDialog()
    return
  }

  nicknameSubmitting.value = true
  try {
    await updateNickname(userId, newNickname)
    userStore.updateNickname(newNickname)
    toast('昵称修改成功', 'success')
    closeNicknameDialog()
  } catch (e: any) {
    toast(e.message || '昵称修改失败', 'error')
  } finally {
    nicknameSubmitting.value = false
  }
}

// ========== 顶部统计（从后端真实数据获取） ==========
const totalStudyTime = ref(`0${t('stats.minutes')}`)
const activeDays = computed(() => userStore.activeDays)

// ========== 能力画像（ELO 总分 + 六维雷达） ==========
const radar = ref<AbilityRadar | null>(null)
const radarLoading = ref(true)
const radarError = ref('')

/** 六个维度的展示元信息：轴顺序与 api/stats.ts 的 dimensions 顺序一致 */
const DIMENSION_META: ReadonlyArray<{
  key: AbilityDimensionKey
  icon: string
  labelKey: string
}> = [
  { key: 'vocabulary', icon: 'menu_book', labelKey: 'dashboard.moduleVocabulary' },
  { key: 'grammar', icon: 'spellcheck', labelKey: 'dashboard.moduleGrammar' },
  { key: 'reading', icon: 'auto_stories', labelKey: 'dashboard.moduleReading' },
  { key: 'listening', icon: 'headphones', labelKey: 'dashboard.moduleListening' },
  { key: 'translation', icon: 'translate', labelKey: 'dashboard.moduleTranslation' },
  { key: 'writing', icon: 'edit_note', labelKey: 'dashboard.moduleWriting' },
]

/** 雷达图与分数明细共用的轴数据；标签在这里统一 i18n 化 */
const radarAxes = computed(() =>
  DIMENSION_META.map((meta) => {
    const dimension = radar.value?.dimensions.find((item) => item.key === meta.key)
    return {
      key: meta.key,
      icon: meta.icon,
      label: t(meta.labelKey),
      score: dimension?.score ?? 0,
      hasData: dimension?.hasData ?? false,
    }
  }),
)

const loadRadar = async () => {
  const userId = userStore.userId
  if (!userId) return
  radarLoading.value = true
  radarError.value = ''
  try {
    const data = await getAbilityRadar(userId)
    radar.value = data
    userLevel.value = data.eloLevel || t('profile.beginner')
  } catch (e) {
    console.warn('获取能力画像失败', e)
    radarError.value = e instanceof Error ? e.message : t('profile.ability.loadFailed')
  } finally {
    radarLoading.value = false
  }
}

// ========== 金币与签到 ==========
const profileCheckingIn = ref(false)

const handleProfileCheckIn = async () => {
  if (profileCheckingIn.value || userStore.todayCheckedIn) return
  profileCheckingIn.value = true
  try {
    const result = await userStore.signIn()
    if (result.alreadyCheckedIn) {
      toast(t('checkIn.already'), 'info')
    } else {
      toast(t('checkIn.success', { reward: result.reward }), 'success')
    }
  } catch (e) {
    const message = e instanceof Error ? e.message : t('checkIn.error')
    toast(message, 'error')
  } finally {
    profileCheckingIn.value = false
  }
}

// ========== 加载数据 ==========
const loadProfileData = async () => {
  const userId = userStore.userId
  if (!userId) return

  // 累计学习时长独立于能力画像，失败只打 warn，不阻塞页面
  const loadStudyTime = async () => {
    try {
      const stats = await getExerciseStats(userId)
      if (stats) {
        const hours = Math.floor(stats.totalHours || 0)
        const mins = stats.totalMinutes || 0
        if (hours > 0) {
          totalStudyTime.value = `${hours}${t('stats.hours')}${mins}${t('stats.minutes')}`
        } else {
          totalStudyTime.value = `${mins}${t('stats.minutes')}`
        }
      }
    } catch (e) {
      console.warn('获取学习时长失败', e)
    }
  }

  // 用户统计与金币在后台刷新，能力画像并行拉取，避免串行等待
  await Promise.all([
    userStore.loadUserStats(),
    userStore.loadCoinInfo(),
    loadRadar(),
    loadStudyTime(),
  ])
}

watch(() => userStore.userId, (newId) => {
  if (newId) loadProfileData()
}, { immediate: true })
</script>
