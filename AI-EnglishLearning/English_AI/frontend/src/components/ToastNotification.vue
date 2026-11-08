<template>
  <Teleport to="body">
    <!-- 窄屏左右留白铺满，sm 以上固定 320px 靠右，避免小屏贴边溢出 -->
    <div class="pointer-events-none fixed inset-x-4 top-24 z-[9999] flex flex-col gap-3 sm:left-auto sm:w-80">
      <TransitionGroup name="toast">
        <div
          v-for="t in toasts"
          :key="t.id"
          :role="t.type === 'error' ? 'alert' : 'status'"
          :class="[
            'pointer-events-auto relative flex items-start gap-3 overflow-hidden rounded-2xl border p-4 soft-shadow backdrop-blur-md',
            toneClass(t.type),
          ]"
          @mouseenter="onPause(t)"
          @mouseleave="onResume(t)"
          @focusin="onPause(t)"
          @focusout="onResume(t)"
        >
          <span class="material-symbols-outlined shrink-0 text-icon-md" aria-hidden="true">{{ iconName(t.type) }}</span>
          <p class="min-w-0 flex-1 break-words font-body-sm text-body-sm">{{ t.message }}</p>
          <button
            type="button"
            class="-mr-1 -mt-1 flex h-7 w-7 shrink-0 items-center justify-center rounded-full opacity-70 transition hover:bg-on-surface/10 hover:opacity-100 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-current"
            :aria-label="$t('common.close')"
            @click="remove(t.id)"
          >
            <span class="material-symbols-outlined text-icon-sm" aria-hidden="true">close</span>
          </button>
          <!-- 倒计时进度条：与计时器同步暂停，让用户看见还剩多少时间 -->
          <span
            v-if="t.duration > 0"
            class="toast-progress absolute inset-x-0 bottom-0 h-0.5 bg-on-surface/20"
            :style="{
              animationDuration: `${t.duration}ms`,
              animationPlayState: pausedId === t.id ? 'paused' : 'running',
            }"
            aria-hidden="true"
          />
        </div>
      </TransitionGroup>
    </div>
  </Teleport>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useToast, type Toast } from '@/composables/useToast'

const { toasts, remove, pause, resume } = useToast()

/** 记录当前被悬停/聚焦的提示 id，驱动进度条 animation-play-state 与计时器同步 */
const pausedId = ref<string | null>(null)

/** 图标映射：四类提示各自形状，颜色统一跟随容器 on-color 保证对比度 */
const iconMap: Record<Toast['type'], string> = {
  success: 'check_circle',
  error: 'error',
  warning: 'warning',
  info: 'info',
}

/** 配色映射：全部走 M3 语义令牌，令牌自身随主题切换，无需 dark: 变体 */
const toneMap: Record<Toast['type'], string> = {
  success: 'bg-tertiary-container border-tertiary/30 text-on-tertiary-container',
  error: 'bg-error-container border-error/30 text-on-error-container',
  warning: 'bg-warning-container border-warning/30 text-on-warning-container',
  info: 'bg-info-container border-info/30 text-on-info-container',
}

const iconName = (type: Toast['type']) => iconMap[type]
const toneClass = (type: Toast['type']) => toneMap[type]

const onPause = (t: Toast) => {
  if (t.duration <= 0) return
  pausedId.value = t.id
  pause(t.id)
}

const onResume = (t: Toast) => {
  if (t.duration <= 0) return
  if (pausedId.value === t.id) pausedId.value = null
  resume(t.id)
}
</script>

<style scoped>
.toast-enter-active,
.toast-leave-active {
  transition: opacity 0.2s ease, transform 0.2s ease;
}
.toast-enter-from,
.toast-leave-to {
  opacity: 0;
  transform: translateY(-8px);
}
.toast-move {
  transition: transform 0.2s ease;
}

/* 底部倒计时条：从左向右收缩，时长由 style 上的 animationDuration 决定 */
.toast-progress {
  transform-origin: left center;
  animation-name: toast-countdown;
  animation-timing-function: linear;
  animation-fill-mode: forwards;
}

@keyframes toast-countdown {
  from {
    transform: scaleX(1);
  }
  to {
    transform: scaleX(0);
  }
}

/* 尊重系统「减少动效」偏好 */
@media (prefers-reduced-motion: reduce) {
  .toast-enter-active,
  .toast-leave-active,
  .toast-move {
    transition: none !important;
  }
  .toast-progress {
    animation: none !important;
    opacity: 0;
  }
}
</style>
