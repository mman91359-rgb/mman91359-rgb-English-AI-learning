<template>
  <header class="flex items-start justify-between gap-4" :class="flush ? '' : 'mb-8'">
    <div class="flex min-w-0 items-center gap-4">
      <slot name="leading" />
      <button
        v-if="back"
        type="button"
        :class="btnIcon"
        :aria-label="$t('common.back')"
        @click="goBack"
      >
        <AppIcon name="arrow_back" size="lg" />
      </button>
      <div class="min-w-0">
        <h1 class="font-headline-lg text-headline-lg text-on-surface truncate">{{ title }}</h1>
        <p v-if="subtitle" class="mt-1 font-body-sm text-body-sm text-on-surface-variant">
          {{ subtitle }}
        </p>
      </div>
    </div>
    <div v-if="$slots.actions" class="flex shrink-0 items-center gap-2">
      <slot name="actions" />
    </div>
  </header>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router'
import AppIcon from './AppIcon.vue'
import { btnIcon } from './buttonStyles'

/**
 * PageHeader —— 页面级标题栏（返回钮 + 32px 标题 + 右侧动作）。
 *
 * 覆盖审计 §3-5 的 4 处同构实现（Favorites / Vocabulary / History / ErrorBook）：
 * 它们此前各自手写 `flex items-center gap-4 mb-8` + `arrow_back` + headline-lg，
 * 且标题拼接方式存在两种写法漂移（`app.title - 模块名` 与直接模块名）。
 * 本组件不负责拼接，title 由调用方传完整文案。
 *
 * ## 禁止用法
 * - 禁止在页面里再手写返回钮 + headline-lg 标题栏，会与本组件形成两套间距（mb-8 vs mb-6）。
 * - 禁止用 `class="!mb-0"` 覆盖外边距：需要去掉 mb-8 时传 `flush`。
 * - 禁止一个页面出现两个 PageHeader。区块级标题请用 SectionHeader。
 * - 禁止把主 CTA 放进 #actions 后再套一个外层按钮容器，动作区已有 shrink-0 + gap-2。
 * - 禁止传 title 里带 HTML：标题按纯文本渲染。
 * - 不传 back 时不会渲染返回钮，但 #leading 仍可放自定义图标圆。
 */
const props = withDefaults(defineProps<{
  /** 页面主标题，按纯文本渲染 */
  title: string
  /** 副标题，可选 */
  subtitle?: string
  /** 是否显示返回按钮 */
  back?: boolean
  /** 指定返回目标路由；留空则 router.back() */
  backTo?: string
  /**
   * 去掉自带的下外边距（mb-8）。
   * 页面容器若已是 `space-y-6` 之类的纵向节奏，mb-8 会与之叠加成 56px —— 此时传 flush，
   * 让外边距交还给容器统一管理。不要再在调用方写 `class="!mb-0"` 覆盖。
   *
   * ⚠️ 与 `AppLayout` 的 `flush` **同名不同义**：那边去掉的是外层容器的 `space-y-8`，
   * 这边只去掉本组件自己的 `mb-8`，两者互不影响，不要互相替代。
   */
  flush?: boolean
}>(), {
  subtitle: '',
  back: false,
  backTo: '',
  flush: false,
})

const router = useRouter()

/** 有 backTo 走显式路由（用于直接落地页无历史栈的场景），否则回退一格 */
const goBack = () => {
  if (props.backTo) {
    router.push(props.backTo)
    return
  }
  router.back()
}
</script>
