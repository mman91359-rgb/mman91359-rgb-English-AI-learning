<template>
  <AppLayout>
    <h2 class="font-headline-lg text-headline-lg text-on-surface mb-8">{{ $t('settings.title') }}</h2>

    <!-- 通用设置 -->
    <section class="mb-8">
      <h3 class="font-label-lg text-label-lg text-on-surface-variant uppercase tracking-wider mb-3 px-2">{{ $t('settings.general') }}</h3>
      <div class="bg-surface rounded-2xl shadow-soft-glow overflow-hidden divide-y divide-outline-variant/30">

        <!-- 主题模式 -->
        <div class="flex items-center gap-4 p-5">
          <div class="w-10 h-10 rounded-full bg-primary-container/30 flex items-center justify-center text-primary flex-shrink-0">
            <AppIcon :name="appStore.isDark ? 'dark_mode' : 'light_mode'" size="lg" />
          </div>
          <div class="flex-1 min-w-0">
            <p class="font-body-lg text-body-lg text-on-surface">{{ $t('settings.theme') }}</p>
            <p class="font-label-md text-label-md text-on-surface-variant">{{ $t('settings.current') }}{{ themeModeLabel }}</p>
          </div>
          <div class="flex bg-surface-container-low rounded-full p-1 gap-1">
            <button
              v-for="m in themeOptions"
              :key="m.value"
              :class="[
                'px-3 py-1.5 rounded-full font-label-md text-label-md transition-all',
                appStore.themeMode === m.value
                  ? 'bg-primary text-on-primary shadow-sm'
                  : 'text-on-surface-variant hover:text-on-surface'
              ]"
              @click="appStore.setThemeMode(m.value)"
            >
              {{ m.label }}
            </button>
          </div>
        </div>

        <!-- 语言设置 -->
        <div class="flex items-center gap-4 p-5 cursor-pointer hover:bg-surface-container-low/50 transition-colors" @click="showLang = !showLang">
          <div class="w-10 h-10 rounded-full bg-secondary-container/30 flex items-center justify-center text-secondary flex-shrink-0">
            <AppIcon name="language" size="lg" />
          </div>
          <div class="flex-1 min-w-0">
            <p class="font-body-lg text-body-lg text-on-surface">{{ $t('settings.language') }}</p>
            <p class="font-label-md text-label-md text-on-surface-variant">{{ $t('settings.currentLanguage') }}{{ currentLangLabel }}</p>
          </div>
          <AppIcon :name="showLang ? 'expand_less' : 'chevron_right'" size="lg" tone="outline" />
        </div>

        <!-- 语言选项展开区 -->
        <div v-if="showLang" class="bg-surface-container-low/40">
          <div
            v-for="l in languageOptions"
            :key="l.value"
            :class="[
              'flex items-center gap-3 px-5 py-4 cursor-pointer transition-colors',
              appStore.language === l.value
                ? 'bg-primary-container/10 text-primary'
                : 'text-on-surface hover:bg-surface-container-low'
            ]"
            @click="selectLang(l.value)"
          >
            <span class="text-xl">{{ l.flag }}</span>
            <span class="font-body-md text-body-md">{{ l.label }}</span>
            <AppIcon v-if="appStore.language === l.value" name="check_circle" size="lg" tone="primary" class="ml-auto" />
          </div>
        </div>

        <!-- 通知设置 -->
        <div class="flex items-center gap-4 p-5 cursor-pointer hover:bg-surface-container-low/50 transition-colors" @click="toastComingSoon">
          <div class="w-10 h-10 rounded-full bg-tertiary-container/30 flex items-center justify-center text-tertiary flex-shrink-0">
            <AppIcon name="notifications" size="lg" />
          </div>
          <div class="flex-1 min-w-0">
            <p class="font-body-lg text-body-lg text-on-surface">{{ $t('profile.notificationSettings') }}</p>
            <p class="font-label-md text-label-md text-on-surface-variant">{{ $t('settings.notificationDesc') }}</p>
          </div>
          <AppIcon name="chevron_right" size="lg" tone="outline" />
        </div>
      </div>
    </section>

    <!-- 账户设置 -->
    <section class="mb-8">
      <h3 class="font-label-lg text-label-lg text-on-surface-variant uppercase tracking-wider mb-3 px-2">{{ $t('settings.account') }}</h3>
      <div class="bg-surface rounded-2xl shadow-soft-glow overflow-hidden divide-y divide-outline-variant/30">
        <div class="flex items-center gap-4 p-5 cursor-pointer hover:bg-surface-container-low/50 transition-colors" @click="toastComingSoon">
          <div class="w-10 h-10 rounded-full bg-primary-container/30 flex items-center justify-center text-primary flex-shrink-0">
            <AppIcon name="shield" size="lg" />
          </div>
          <div class="flex-1 min-w-0">
            <p class="font-body-lg text-body-lg text-on-surface">{{ $t('profile.privacySettings') }}</p>
            <p class="font-label-md text-label-md text-on-surface-variant">{{ $t('settings.privacyDesc') }}</p>
          </div>
          <AppIcon name="chevron_right" size="lg" tone="outline" />
        </div>

        <!-- 修改密码 -->
        <div class="flex items-center gap-4 p-5 cursor-pointer hover:bg-surface-container-low/50 transition-colors" @click="openPasswordDialog">
          <div class="w-10 h-10 rounded-full bg-primary-container/30 flex items-center justify-center text-primary flex-shrink-0">
            <AppIcon name="lock" size="lg" />
          </div>
          <div class="flex-1 min-w-0">
            <p class="font-body-lg text-body-lg text-on-surface">{{ $t('profile.changePassword') }}</p>
            <p class="font-label-md text-label-md text-on-surface-variant">{{ $t('settings.passwordDesc') }}</p>
          </div>
          <AppIcon name="chevron_right" size="lg" tone="outline" />
        </div>

        <!-- 绑定手机 -->
        <div class="flex items-center gap-4 p-5 cursor-pointer hover:bg-surface-container-low/50 transition-colors" @click="openPhoneDialog">
          <div class="w-10 h-10 rounded-full bg-primary-container/30 flex items-center justify-center text-primary flex-shrink-0">
            <AppIcon name="phone_iphone" size="lg" />
          </div>
          <div class="flex-1 min-w-0">
            <p class="font-body-lg text-body-lg text-on-surface">{{ $t('settings.bindPhone') }}</p>
            <p class="font-label-md text-label-md text-on-surface-variant">
              {{ userStore.phone ? maskPhone(userStore.phone) : $t('settings.phoneNotBound') }}
            </p>
          </div>
          <AppIcon name="chevron_right" size="lg" tone="outline" />
        </div>
      </div>
    </section>

    <!-- 退出登录 -->
    <button
      class="w-full bg-error-container/30 text-error font-label-lg text-label-lg py-4 rounded-2xl hover:bg-error-container/60 transition-colors flex items-center justify-center gap-2"
      @click="handleLogout"
    >
      <AppIcon name="logout" size="lg" />
      {{ $t('profile.logout') }}
    </button>

    <!-- 修改密码弹窗 -->
    <BaseDialog
      :visible="passwordDialogVisible"
      :title="$t('profile.changePassword')"
      max-width="max-w-md"
      @close="closePasswordDialog"
    >
      <div class="space-y-4">
        <input
          ref="oldPwdInputRef"
          v-model="oldPassword"
          type="password"
          data-autofocus
          :placeholder="$t('settings.oldPassword')"
          :class="inputClassLg"
        />
        <input
          v-model="newPassword"
          type="password"
          :placeholder="$t('settings.newPassword')"
          :class="inputClassLg"
        />
        <input
          v-model="confirmPassword"
          type="password"
          :placeholder="$t('settings.confirmPassword')"
          :class="inputClassLg"
          @keyup.enter="submitPassword"
        />
      </div>
      <template #footer>
        <div class="flex w-full gap-3">
          <button type="button" :class="btnDialogSecondary" @click="closePasswordDialog">
            {{ $t('profile.cancel') }}
          </button>
          <button type="button" :disabled="passwordSubmitting" :class="btnDialogPrimary" @click="submitPassword">
            {{ passwordSubmitting ? $t('settings.saving') : $t('profile.confirm') }}
          </button>
        </div>
      </template>
    </BaseDialog>

    <!-- 绑定手机号弹窗 -->
    <BaseDialog
      :visible="phoneDialogVisible"
      :title="$t('settings.bindPhone')"
      max-width="max-w-md"
      @close="closePhoneDialog"
    >
      <div class="space-y-4">
        <div>
          <input
            ref="phoneInputRef"
            v-model="phoneInput"
            type="tel"
            maxlength="11"
            data-autofocus
            :placeholder="$t('settings.phonePlaceholder')"
            :class="[inputClassLg, phoneError && inputErrorClass]"
            :aria-invalid="phoneError ? 'true' : 'false'"
            @input="onPhoneInput"
          />
          <FormHint v-if="phoneError" :message="phoneError" />
        </div>
        <div>
          <div class="flex items-start gap-3">
            <input
              v-model="codeInput"
              type="text"
              inputmode="numeric"
              maxlength="6"
              :placeholder="$t('auth.codePlaceholder')"
              :class="[inputClassLg, 'tracking-widest', codeError && inputErrorClass]"
              :aria-invalid="codeError ? 'true' : 'false'"
              @input="codeError = ''"
              @keyup.enter="submitPhone"
            />
            <button
              type="button"
              :class="[btnSecondarySm, 'shrink-0 whitespace-nowrap']"
              :disabled="codeSending || (codeSent && remaining > 0)"
              @click="sendCode"
            >
              {{ codeSending ? $t('settings.saving') : (codeSent && remaining > 0 ? $t('auth.resendIn', { seconds: remaining }) : $t('auth.sendCode')) }}
            </button>
          </div>
          <FormHint v-if="codeError" :message="codeError" />
        </div>
      </div>
      <template #footer>
        <div class="flex w-full gap-3">
          <button type="button" :class="btnDialogSecondary" @click="closePhoneDialog">
            {{ $t('profile.cancel') }}
          </button>
          <button type="button" :disabled="phoneSubmitting" :class="btnDialogPrimary" @click="submitPhone">
            {{ phoneSubmitting ? $t('settings.saving') : $t('profile.confirm') }}
          </button>
        </div>
      </template>
    </BaseDialog>
  </AppLayout>
</template>

<script setup lang="ts">
import { computed, ref, nextTick } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import AppLayout from '../components/AppLayout.vue'
import { useAppStore } from '@/stores/app'
import { useUserStore } from '@/stores/user'
import { useToast } from '@/composables/useToast'
import { updatePassword, updatePhone, sendPhoneBindCode } from '@/api/user'
import { inputClassLg, inputErrorClass } from '@/components/ui/formStyles'
import { btnDialogPrimary, btnDialogSecondary, btnSecondarySm } from '@/components/ui/buttonStyles'
import BaseDialog from '@/components/ui/BaseDialog.vue'
import FormHint from '@/components/ui/FormHint.vue'
import AppIcon from '@/components/ui/AppIcon.vue'
import { useCountdown } from '@/composables/useCountdown'

const router = useRouter()
const { t } = useI18n()
const appStore = useAppStore()
const userStore = useUserStore()
const { show: toast } = useToast()

const showLang = ref(false)

const themeOptions = computed(() => [
  { value: 'light', label: t('settings.themeLight') },
  { value: 'dark', label: t('settings.themeDark') },
  { value: 'system', label: t('settings.themeSystem') },
])

const languageOptions = computed(() => [
  { value: 'zh-CN', label: t('settings.langZhCN'), flag: '🇨🇳' },
  { value: 'en-US', label: t('settings.langEnUS'), flag: '🇺🇸' },
])

const themeModeLabel = computed(() => {
  const m = themeOptions.value.find(o => o.value === appStore.themeMode)
  return m?.label || t('settings.themeLight')
})

const currentLangLabel = computed(() => {
  const l = languageOptions.value.find(o => o.value === appStore.language)
  return l?.label || t('settings.langZhCN')
})

const selectLang = (val: string) => {
  appStore.setLanguage(val)
  showLang.value = false
}

const handleLogout = () => {
  userStore.logout()
  router.push('/login')
}

const toastComingSoon = () => {
  toast(t('settings.comingSoon'), 'info')
}

// 手机号脱敏显示（中间4位用 * 替换）
const maskPhone = (phone: string) => {
  if (phone.length !== 11) return phone
  return phone.substring(0, 3) + '****' + phone.substring(7)
}

// ========== 修改密码 ==========
const passwordDialogVisible = ref(false)
const oldPassword = ref('')
const newPassword = ref('')
const confirmPassword = ref('')
const passwordSubmitting = ref(false)
const oldPwdInputRef = ref<HTMLInputElement | null>(null)

const openPasswordDialog = () => {
  oldPassword.value = ''
  newPassword.value = ''
  confirmPassword.value = ''
  passwordDialogVisible.value = true
  nextTick(() => oldPwdInputRef.value?.focus())
}

const closePasswordDialog = () => {
  passwordDialogVisible.value = false
  oldPassword.value = ''
  newPassword.value = ''
  confirmPassword.value = ''
}

const submitPassword = async () => {
  if (!oldPassword.value) {
    toast(t('settings.oldPasswordEmpty'), 'warning')
    return
  }
  if (!newPassword.value || newPassword.value.length < 6) {
    toast(t('settings.passwordTooShort'), 'warning')
    return
  }
  if (newPassword.value !== confirmPassword.value) {
    toast(t('settings.passwordMismatch'), 'warning')
    return
  }
  if (newPassword.value === oldPassword.value) {
    toast(t('settings.passwordSameError'), 'warning')
    return
  }

  const userId = userStore.userId
  if (!userId) return

  passwordSubmitting.value = true
  try {
    await updatePassword(userId, oldPassword.value, newPassword.value)
    toast(t('settings.passwordChangeSuccess'), 'success')
    closePasswordDialog()
  } catch (e: any) {
    toast(e.message || t('settings.passwordChangeFail'), 'error')
  } finally {
    passwordSubmitting.value = false
  }
}

// ========== 绑定手机号（更换绑定需新号验证码） ==========
const phoneDialogVisible = ref(false)
const phoneInput = ref('')
const codeInput = ref('')
const phoneSubmitting = ref(false)
const codeSending = ref(false)
const codeSent = ref(false)
const phoneError = ref('')
const codeError = ref('')
const phoneInputRef = ref<HTMLInputElement | null>(null)
const { remaining, reset, stop } = useCountdown(60, undefined, false)

const phonePattern = /^1\d{10}$/

/** 号码变化后旧验证码必须失效：清空输入并停止倒计时 */
const onPhoneInput = () => {
  phoneError.value = ''
  codeInput.value = ''
  codeError.value = ''
  codeSent.value = false
  stop()
}

const openPhoneDialog = () => {
  phoneInput.value = userStore.phone || ''
  codeInput.value = ''
  phoneError.value = ''
  codeError.value = ''
  codeSent.value = false
  stop()
  phoneDialogVisible.value = true
  nextTick(() => phoneInputRef.value?.focus())
}

const closePhoneDialog = () => {
  phoneDialogVisible.value = false
  phoneInput.value = ''
  codeInput.value = ''
  phoneError.value = ''
  codeError.value = ''
  codeSent.value = false
  stop()
}

/** 向新号码发送验证码（需登录，验证码与当前账号绑定） */
const sendCode = async () => {
  const phone = phoneInput.value.trim()
  if (!phonePattern.test(phone)) {
    phoneError.value = t('settings.phoneInvalid')
    return
  }
  phoneError.value = ''
  codeError.value = ''
  codeSending.value = true
  try {
    const result = await sendPhoneBindCode(phone)
    codeSent.value = true
    toast(t('auth.codeSentMock', { code: result.mockCode ?? '------' }), 'success')
    reset()
  } catch (error) {
    codeError.value = error instanceof Error ? error.message : t('auth.codeSendFailed')
  } finally {
    codeSending.value = false
  }
}

const submitPhone = async () => {
  const phone = phoneInput.value.trim()
  phoneError.value = ''
  codeError.value = ''
  if (!phone) {
    phoneError.value = t('settings.phoneEmpty')
    return
  }
  if (!phonePattern.test(phone)) {
    phoneError.value = t('settings.phoneInvalid')
    return
  }
  if (!/^\d{6}$/.test(codeInput.value.trim())) {
    codeError.value = t('auth.invalidCode')
    return
  }

  const userId = userStore.userId
  if (!userId) return

  // 号码未变化直接关闭
  if (phone === userStore.phone) {
    closePhoneDialog()
    return
  }

  phoneSubmitting.value = true
  try {
    await updatePhone(userId, phone, codeInput.value.trim())
    userStore.updatePhone(phone)
    toast(t('settings.phoneBindSuccess'), 'success')
    closePhoneDialog()
  } catch (error) {
    codeError.value = error instanceof Error ? error.message : t('settings.phoneBindFail')
  } finally {
    phoneSubmitting.value = false
  }
}
</script>
