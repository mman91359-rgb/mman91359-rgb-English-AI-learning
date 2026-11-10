<template>
  <component
    :is="to ? 'router-link' : 'div'"
    :to="to || undefined"
    :title="to ? $t('nav.home') : undefined"
    class="group inline-flex items-center gap-2 rounded-lg transition-transform duration-200 active:scale-[0.98] focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-primary"
  >
    <span v-if="badge !== 'none'" :class="badgeClass">
      <span class="material-symbols-outlined logo-glyph fill text-primary">{{ icon }}</span>
    </span>
    <span v-else class="inline-flex text-icon-xl">
      <span class="material-symbols-outlined logo-glyph fill text-primary transition-transform duration-200 group-hover:scale-105">{{ icon }}</span>
    </span>

    <span class="flex min-w-0 flex-col">
      <span class="truncate font-headline-md text-headline-md font-bold text-primary">{{ titleText }}</span>
      <span v-if="subtitle" class="truncate font-label-md text-label-md text-on-surface-variant">{{ subtitle }}</span>
    </span>
  </component>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'

const props = withDefaults(defineProps<{
  /** 跳转目标；传空串则渲染为不可点击的静态标识（登录态之外的场景） */
  to?: string
  /** 图标名（Material Symbols） */
  icon?: string
  /** 图标底衬：none 无底衬 / rounded 圆角方块 / pill 胶囊 */
  badge?: 'none' | 'rounded' | 'pill'
  /** 主标题，缺省取 i18n 的应用名 */
  title?: string
  /** 副标题，传了才渲染 */
  subtitle?: string
}>(), {
  to: '/dashboard',
  icon: 'school',
  badge: 'none',
  title: '',
  subtitle: '',
})

const { t } = useI18n()

const titleText = computed(() => props.title || t('app.title'))

const badgeClass = computed(() => {
  const base = 'inline-flex h-10 w-10 items-center justify-center text-icon-lg'
  return props.badge === 'pill'
    ? `${base} rounded-full bg-primary-container/20`
    : `${base} rounded-xl bg-primary-fixed`
})
</script>

<style scoped>
/* 图标字号统一走 1em，从外层 text-icon-* 令牌继承，
   避开 .material-symbols-outlined 自带的 24px 基础规则（同特异性、后置声明会赢） */
.logo-glyph {
  font-size: 1em;
  line-height: 1;
}
</style>
