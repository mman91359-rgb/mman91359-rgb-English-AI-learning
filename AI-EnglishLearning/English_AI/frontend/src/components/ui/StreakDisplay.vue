<template>
  <div class="flex flex-col">
    <span class="font-label-md text-label-md text-on-surface-variant">{{ labelText }}</span>
    <div class="flex h-8 items-center gap-1">
      <span
        class="streak-days font-headline-md text-headline-md font-bold tabular-nums text-primary"
        :class="{ 'is-igniting': igniting }"
      >{{ days }}</span>
      <span class="font-label-lg text-label-lg text-primary/60">{{ unitText }}</span>

      <!--
        火焰槽位固定 h-8 w-11，火焰本体在槽内居中且尺寸随档位变化，
        超出部分只是视觉溢出、不参与布局，所以侧栏导航不会随天数抖动。
      -->
      <span
        class="flame-slot relative ml-1 inline-flex h-8 w-12 shrink-0 items-center justify-center"
        :class="{ 'is-lit': visual.lit }"
        :style="slotStyle"
        aria-hidden="true"
      >
        <!-- 1. 环境光：暗色下把侧栏这块区域「照亮」，亮色下压到几乎不可见 -->
        <span
          v-if="visual.lit"
          class="flame-halo pointer-events-none absolute"
          :class="{ 'is-igniting': igniting }"
        ></span>

        <!-- 2. 近场光晕：贴着火焰的一圈暖光，随档位扩散 -->
        <span
          v-if="visual.lit"
          class="flame-aura pointer-events-none absolute"
          :class="{ 'is-igniting': igniting }"
        ></span>

        <!-- 3. 地面光斑：让火「立」在某个平面上，而不是飘在文字旁 -->
        <span
          v-if="visual.lit"
          class="flame-ground pointer-events-none absolute"
          :class="{ 'is-igniting': igniting }"
        ></span>

        <!-- 4. 火身。plume 只负责投影（filter），body 只负责形变动画，两者分离，
               复燃时 body 的 brightness 不会把 plume 的投影一起冲掉 -->
        <span
          class="flame-plume relative inline-flex items-center justify-center"
          :class="[visual.sizeClass, { 'is-igniting': igniting }]"
        >
          <span class="flame-body relative inline-flex items-center justify-center">
            <span class="material-symbols-outlined flame-glyph" :class="visual.bodyClass">local_fire_department</span>
            <!-- 内焰：同一图标缩小后叠在中下部，形成「橙火包黄芯」 -->
            <span
              v-if="visual.coreClass"
              class="material-symbols-outlined flame-glyph flame-inner fill absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-[38%] scale-[0.55]"
              :class="visual.coreClass"
            >local_fire_department</span>
            <!-- 焰心高光：只在 34px 以上出现，再小会糊成一团 -->
            <span
              v-if="visual.highlightClass"
              class="material-symbols-outlined flame-glyph flame-heart fill absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-[18%] scale-[0.26]"
              :class="visual.highlightClass"
            >local_fire_department</span>
          </span>
        </span>

        <!-- 5. 火星：常驻档位往上飘，复燃瞬间额外迸发一波 -->
        <span
          v-for="ember in embers"
          :key="ember.id"
          class="flame-ember pointer-events-none absolute h-1 w-1 rounded-full"
          :class="ember.burst ? 'flame-ember-burst' : ''"
          :style="{ left: ember.left, animationDelay: ember.delay, '--ember-drift': ember.drift }"
        ></span>
      </span>

      <span class="sr-only">{{ visual.lit ? t('checkIn.checkedIn') : t('checkIn.notCheckedIn') }}</span>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed, onBeforeUnmount, ref, watch } from 'vue'
import { useI18n } from 'vue-i18n'
import { resolveStreakVisual } from './streakStyles'

const props = withDefaults(defineProps<{
  /** 连续签到天数 */
  days: number
  /** 今日是否已签到。false 时火焰整体落到熄灭态（灰、静止、缩小） */
  lit?: boolean
  /**
   * 复燃信号：每次「刚刚签到成功」时自增一次。
   * 用独立计数而不是监听 lit，是因为首次加载金币信息会把 lit 从 false 刷成 true，
   * 那时候不该放复燃动画。
   */
  igniteToken?: number
  /** 自定义标签文案，缺省取 i18n 的「连续签到天数」 */
  label?: string
  /** 自定义单位文案，缺省取 i18n 的「天」 */
  unit?: string
}>(), {
  lit: true,
  igniteToken: 0,
  label: '',
  unit: '',
})

const { t } = useI18n()

const visual = computed(() => resolveStreakVisual(props.days, props.lit))
const labelText = computed(() => props.label || t('dashboard.streakDays'))
const unitText = computed(() => props.unit || t('stats.days'))

/** 复燃动画的持续时长，须 ≥ keyframes 里最长的一条（1.35s） */
const IGNITE_MS = 1400

const igniting = ref(false)
let igniteTimer: number | undefined

const playIgnite = (): void => {
  // 先落回 false 让浏览器丢掉上一次的动画状态，下一帧再置 true，连点也能重播
  igniting.value = false
  window.requestAnimationFrame(() => {
    igniting.value = true
  })
  window.clearTimeout(igniteTimer)
  igniteTimer = window.setTimeout(() => {
    igniting.value = false
  }, IGNITE_MS)
}

watch(() => props.igniteToken, (next, prev) => {
  if (!next || next === prev) return
  playIgnite()
})

onBeforeUnmount(() => window.clearTimeout(igniteTimer))

const slotStyle = computed(() => ({
  '--flame-duration': visual.value.duration,
  '--aura-scale': String(visual.value.auraScale || 0.7),
  '--quiet-scale': String(visual.value.quietScale),
}))

interface EmberSpec {
  id: string
  left: string
  delay: string
  drift: string
  burst: boolean
}

/** 常驻火星（高档位才有）与复燃迸发火星共用一块渲染逻辑 */
const embers = computed<EmberSpec[]>(() => {
  if (!visual.value.lit && !igniting.value) return []

  if (igniting.value) {
    return [
      { id: 'b1', left: '30%', delay: '0.02s', drift: '-14px', burst: true },
      { id: 'b2', left: '46%', delay: '0.08s', drift: '-5px', burst: true },
      { id: 'b3', left: '58%', delay: '0.04s', drift: '4px', burst: true },
      { id: 'b4', left: '70%', delay: '0.12s', drift: '13px', burst: true },
      { id: 'b5', left: '52%', delay: '0.26s', drift: '-8px', burst: true },
    ]
  }

  return Array.from({ length: visual.value.embers }, (_, i) => ({
    id: `p${i}`,
    left: i % 2 === 0 ? '38%' : '58%',
    delay: i % 2 === 0 ? '0s' : '-1.2s',
    drift: i % 2 === 0 ? '-3px' : '3px',
    burst: false,
  }))
})
</script>

<style scoped>
/* ─────────────────────────────────────────────────────────────
   层次（由外到内）：环境光 → 近场光晕 → 地面光斑 → 火身 → 内焰 → 焰心
   所有关键参数在 main.css 的 `--flame-*` 里按亮暗主题分档，改观感不必进组件。
   ───────────────────────────────────────────────────────────── */

/* ── 环境光：暗色下承担「照亮周围」，范围约 130×100px ── */
.flame-halo {
  inset: -32px -42px;
  border-radius: 999px;
  background: radial-gradient(
    ellipse at 50% 60%,
    rgb(var(--color-flame-mid) / var(--flame-halo-alpha)) 0%,
    rgb(var(--color-flame-deep) / calc(var(--flame-halo-alpha) * 0.45)) 44%,
    transparent 72%
  );
  filter: blur(4px);
  animation: flame-halo-breathe 4.6s ease-in-out infinite;
  will-change: opacity, transform;
}

/* ── 近场光晕：贴在字形外侧的一圈暖光，尺寸跟着档位走 ── */
.flame-aura {
  inset: -18px -20px;
  border-radius: 999px;
  background: radial-gradient(
    circle at 50% 58%,
    rgb(var(--color-flame-mid) / var(--flame-aura-core)) 0%,
    rgb(var(--color-flame-deep) / var(--flame-aura-mid)) 34%,
    rgb(var(--color-flame-deep) / var(--flame-aura-edge)) 56%,
    transparent 72%
  );
  filter: blur(1px);
  transform: scale(var(--aura-scale, 1));
  animation: flame-aura-breathe calc(var(--flame-duration, 2.8s) * 1.35) ease-in-out infinite;
  will-change: opacity, transform;
}

/* ── 地面光斑：一条压扁的暖色椭圆，制造「火有立足面」的纵深 ── */
.flame-ground {
  left: 50%;
  bottom: 0;
  width: 30px;
  height: 8px;
  border-radius: 999px;
  transform: translateX(-50%) scaleX(var(--aura-scale, 1));
  background: radial-gradient(
    ellipse at center,
    rgb(var(--color-flame-mid) / var(--flame-ground-alpha)) 0%,
    transparent 70%
  );
  filter: blur(2.5px);
  animation: flame-ground-breathe calc(var(--flame-duration, 2.8s) * 1.35) ease-in-out infinite;
  will-change: opacity;
}

/* ── 投影：沿字形轮廓投出的暖色影子，让火焰从侧栏表面「浮」起来 ──
   放在 plume 上而不是 body 上，复燃时 body 的 filter 就不会把它冲掉 */
.flame-plume {
  filter:
    drop-shadow(0 1.5px 1.5px rgb(var(--color-flame-deep) / var(--flame-shadow-alpha, 0.3)))
    drop-shadow(0 4px 9px rgb(var(--color-flame-deep) / calc(var(--flame-shadow-alpha, 0.3) * 0.45)));
}

/* ── 火身：熄灭态静态缩到 0.86，点燃后接上摆动动画 ── */
.flame-body {
  transform-origin: 50% 96%;
  transform: scale(var(--quiet-scale, 1));
  transition: transform 0.45s cubic-bezier(0.22, 1, 0.36, 1);
  will-change: transform;
}

.flame-slot.is-lit .flame-body {
  animation: flame-flicker var(--flame-duration, 2.8s) ease-in-out infinite;
}

/* ── 字形：亮色主题靠深色描边把亮橙的轮廓咬死，暗色主题描边宽度归零 ── */
.flame-glyph {
  font-size: 1em;
  line-height: 1;
  paint-order: stroke fill;
  -webkit-text-stroke: var(--flame-stroke-width, 0px) rgb(var(--color-flame-deep) / var(--flame-stroke-alpha, 0));
}

.flame-inner {
  transform-origin: 50% 60%;
}

.flame-slot.is-lit .flame-inner {
  animation: flame-inner-pulse calc(var(--flame-duration, 2.8s) * 0.9) ease-in-out infinite;
}

/* 焰心再提亮一档，逼近白黄，形成「白心 → 黄芯 → 橙火 → 橙红火尖」四层 */
.flame-heart {
  filter: brightness(1.32) saturate(0.85);
}

/* ── 火星 ── */
.flame-ember {
  bottom: 26%;
  background-color: rgb(var(--color-flame-core));
  box-shadow: 0 0 3px rgb(var(--color-flame-mid) / 0.85);
  opacity: 0;
  animation: flame-ember 2.4s ease-out infinite;
  will-change: transform, opacity;
}

/* ── 数字：签到成功时跟着跳一下，颜色短暂落到火尖橙红 ── */
.streak-days {
  display: inline-block;
  transform-origin: 50% 60%;
}

.streak-days.is-igniting {
  animation: streak-day-pop 1.3s cubic-bezier(0.3, 0.9, 0.3, 1) both;
}

/* ── 复燃：必须写在闪烁规则之后，同特异性靠顺序覆盖 ──
   0~12% 保留灰度（视觉上仍是死灰）→ 26% 爆亮窜高 → 56% 回弹 → 归位 */
.flame-plume.is-igniting .flame-body {
  animation: flame-reignite 1.15s cubic-bezier(0.3, 0.9, 0.3, 1) both;
}

.flame-aura.is-igniting {
  animation: flame-aura-burst 1.25s ease-out both;
}

.flame-halo.is-igniting {
  animation: flame-halo-burst 1.35s ease-out both;
}

.flame-ground.is-igniting {
  animation: flame-ground-burst 1.25s ease-out both;
}

.flame-ember-burst {
  animation: flame-ember-burst 1.1s ease-out both;
}

/* ─────────────────────────── keyframes ─────────────────────────── */

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

@keyframes flame-inner-pulse {
  0%,
  100% {
    opacity: 0.92;
    transform: translate(-50%, -38%) scale(0.55);
  }
  50% {
    opacity: 1;
    transform: translate(-50%, -38%) scale(0.6);
  }
}

@keyframes flame-aura-breathe {
  0%,
  100% {
    opacity: 0.8;
    transform: scale(var(--aura-scale, 1));
  }
  50% {
    opacity: 1;
    transform: scale(calc(var(--aura-scale, 1) * 1.12));
  }
}

@keyframes flame-halo-breathe {
  0%,
  100% {
    opacity: 0.85;
    transform: scale(1);
  }
  50% {
    opacity: 1;
    transform: scale(1.06);
  }
}

@keyframes flame-ground-breathe {
  0%,
  100% {
    opacity: 0.8;
  }
  50% {
    opacity: 1;
  }
}

@keyframes flame-ember {
  0% {
    transform: translate(0, 0) scale(1);
    opacity: 0;
  }
  18% {
    opacity: 0.9;
  }
  100% {
    transform: translate(var(--ember-drift, 2px), -18px) scale(0.3);
    opacity: 0;
  }
}

@keyframes flame-reignite {
  0% {
    transform: scale(0.5, 0.38) translateY(7%);
    opacity: 0.28;
    filter: grayscale(1) brightness(0.55);
  }
  12% {
    transform: scale(0.64, 0.88) translateY(4%);
    opacity: 1;
    filter: grayscale(1) brightness(1.05);
  }
  26% {
    transform: scale(0.9, 1.24) translateY(-1%);
    filter: grayscale(0) brightness(1.95) saturate(1.35);
  }
  42% {
    transform: scale(1.1, 1.16);
    filter: grayscale(0) brightness(1.6) saturate(1.2);
  }
  58% {
    transform: scale(1.12, 0.9) translateY(1%);
    filter: brightness(1.32) saturate(1.1);
  }
  74% {
    transform: scale(0.96, 1.06);
    filter: brightness(1.12);
  }
  88% {
    transform: scale(1.02, 0.98);
    filter: brightness(1.04);
  }
  100% {
    transform: scale(1, 1);
    filter: brightness(1) saturate(1);
  }
}

@keyframes flame-aura-burst {
  0% {
    opacity: 0;
    transform: scale(calc(var(--aura-scale, 1) * 0.3));
  }
  18% {
    opacity: 1;
    transform: scale(calc(var(--aura-scale, 1) * 1.75));
  }
  42% {
    opacity: 0.78;
    transform: scale(calc(var(--aura-scale, 1) * 1.35));
  }
  66% {
    opacity: 0.95;
    transform: scale(calc(var(--aura-scale, 1) * 1.08));
  }
  100% {
    opacity: 0.8;
    transform: scale(var(--aura-scale, 1));
  }
}

@keyframes flame-halo-burst {
  0% {
    opacity: 0;
    transform: scale(0.5);
  }
  20% {
    opacity: 1;
    transform: scale(1.8);
  }
  52% {
    opacity: 0.68;
    transform: scale(1.32);
  }
  100% {
    opacity: 0.85;
    transform: scale(1);
  }
}

@keyframes flame-ground-burst {
  0% {
    opacity: 0;
    transform: translateX(-50%) scaleX(calc(var(--aura-scale, 1) * 0.4));
  }
  22% {
    opacity: 1;
    transform: translateX(-50%) scaleX(calc(var(--aura-scale, 1) * 1.5));
  }
  100% {
    opacity: 0.8;
    transform: translateX(-50%) scaleX(var(--aura-scale, 1));
  }
}

@keyframes flame-ember-burst {
  0% {
    transform: translate(0, 0) scale(0.5);
    opacity: 0;
  }
  10% {
    opacity: 1;
  }
  55% {
    opacity: 0.85;
  }
  100% {
    transform: translate(var(--ember-drift, 0), -26px) scale(0.1);
    opacity: 0;
  }
}

@keyframes streak-day-pop {
  0% {
    transform: scale(1);
  }
  22% {
    transform: scale(1.16);
    color: rgb(var(--color-flame-deep));
  }
  52% {
    transform: scale(1.02);
  }
  100% {
    transform: scale(1);
  }
}

/* 减少动态：保留颜色与亮度切换，去掉所有形变与位移 */
@media (prefers-reduced-motion: reduce) {
  .flame-body,
  .flame-aura,
  .flame-halo,
  .flame-ground,
  .flame-inner,
  .flame-ember,
  .streak-days,
  .flame-plume.is-igniting .flame-body,
  .flame-aura.is-igniting,
  .flame-halo.is-igniting,
  .flame-ground.is-igniting {
    animation: none !important;
  }

  .flame-ember {
    display: none;
  }
}
</style>
