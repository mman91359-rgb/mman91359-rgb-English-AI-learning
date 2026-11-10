<template>
  <div class="flex flex-col">
    <span class="font-label-md text-label-md text-on-surface-variant">{{ labelText }}</span>
    <div class="flex h-8 items-center gap-1">
      <span class="font-headline-md text-headline-md font-bold tabular-nums text-primary">{{ days }}</span>
      <span class="font-label-lg text-label-lg text-primary/60">{{ unitText }}</span>

      <!-- 火焰区：固定 32px 高、36px 宽的槽位，火焰尺寸随档位变化但不参与行高，
           所以下方导航不会因为火焰变大而位移 -->
      <span class="relative ml-0.5 inline-flex h-8 w-9 shrink-0 items-center justify-center" aria-hidden="true">
        <span
          v-if="tier.glowClass"
          class="flame-glow pointer-events-none absolute inset-0 rounded-full blur-md"
          :class="tier.glowClass"
          :style="{ animationDuration: tier.duration }"
        ></span>

        <span
          class="flame-body relative inline-flex items-center justify-center"
          :class="tier.sizeClass"
          :style="{ animationDuration: tier.duration }"
        >
          <!-- 图标字号走 1em：继承外层 text-icon-* 令牌，避开 .material-symbols-outlined 的 24px 基础规则 -->
          <span class="material-symbols-outlined flame-glyph fill" :class="tier.bodyClass">local_fire_department</span>
          <span
            v-if="tier.coreClass"
            class="material-symbols-outlined flame-glyph flame-inner fill absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-[38%] scale-[0.55]"
            :class="tier.coreClass"
          >local_fire_department</span>
        </span>

        <span
          v-for="n in tier.embers"
          :key="n"
          class="flame-ember absolute h-1 w-1 rounded-full bg-flame-core"
          :class="n === 1 ? 'left-[38%]' : 'left-[58%]'"
          :style="{ animationDelay: n === 1 ? '0s' : '-0.75s' }"
        ></span>
      </span>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'
import { resolveStreakTier } from './streakStyles'

const props = withDefaults(defineProps<{
  /** 连续签到天数 */
  days: number
  /** 自定义标签文案，缺省取 i18n 的「连续签到天数」 */
  label?: string
  /** 自定义单位文案，缺省取 i18n 的「天」 */
  unit?: string
}>(), {
  label: '',
  unit: '',
})

const { t } = useI18n()

const tier = computed(() => resolveStreakTier(props.days))
const labelText = computed(() => props.label || t('dashboard.streakDays'))
const unitText = computed(() => props.unit || t('stats.days'))
</script>

<style scoped>
/* 火焰主体的形状来自图标字体，「燃烧」靠 transform 做：纵向拉长 + 横向收窄 +
   轻微左右摆，节奏越快代表烧得越旺。周期由档位通过内联 animationDuration 注入。 */
.flame-body {
  transform-origin: 50% 92%;
  animation: flame-flicker 0s ease-in-out infinite;
  will-change: transform;
}

.flame-glyph {
  font-size: 1em;
  line-height: 1;
}

.flame-glow {
  opacity: 0.6;
  animation: flame-glow 0s ease-in-out infinite;
  will-change: transform, opacity;
}

.flame-inner {
  transform-origin: 50% 60%;
}

.flame-ember {
  bottom: 24%;
  opacity: 0;
  animation: flame-ember 1.6s ease-out infinite;
  will-change: transform, opacity;
}

@keyframes flame-flicker {
  0%,
  100% {
    transform: scale(1, 1) rotate(0deg);
  }
  22% {
    transform: scale(0.97, 1.05) rotate(-1.5deg);
  }
  46% {
    transform: scale(1.03, 0.97) rotate(1deg);
  }
  72% {
    transform: scale(0.99, 1.03) rotate(-0.5deg);
  }
}

@keyframes flame-glow {
  0%,
  100% {
    opacity: 0.4;
    transform: scale(0.85);
  }
  50% {
    opacity: 0.8;
    transform: scale(1.12);
  }
}

@keyframes flame-ember {
  0% {
    transform: translate(0, 0) scale(1);
    opacity: 0;
  }
  20% {
    opacity: 0.9;
  }
  100% {
    transform: translate(1px, -16px) scale(0.35);
    opacity: 0;
  }
}

@media (prefers-reduced-motion: reduce) {
  .flame-body,
  .flame-glow,
  .flame-ember {
    animation: none;
  }
  .flame-ember {
    display: none;
  }
}
</style>
