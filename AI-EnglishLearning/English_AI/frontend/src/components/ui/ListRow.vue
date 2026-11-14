<template>
  <div
    class="flex items-center gap-3 px-4 py-3"
    :class="rowClass"
    :role="clickable ? 'button' : undefined"
    :tabindex="clickable ? 0 : undefined"
    @click="onClick"
    @keydown.enter="onKeyEnter"
    @keydown.space.prevent="onKeyEnter"
  >
    <slot name="leading" />
    <div class="min-w-0 flex-1">
      <slot>
        <p class="truncate font-body-md text-body-md text-on-surface">{{ title }}</p>
        <p v-if="subtitle" class="mt-0.5 truncate font-body-sm text-body-sm text-on-surface-variant">
          {{ subtitle }}
        </p>
      </slot>
    </div>
    <!-- trailing 容器阻断冒泡：行内按钮的点击不应同时触发整行跳转 -->
    <div v-if="$slots.trailing" class="flex shrink-0 items-center gap-2" @click.stop>
      <slot name="trailing" />
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'

/**
 * ListRow —— 列表行（左侧主副文案 + 右侧动作）。
 *
 * 覆盖 History / ErrorBook / Favorites 的条目行。行内边距固定 px-4 py-3（16/12px），
 * 与审计记录的历史值 p-4（16px 四周）不同：垂直方向从 16 收到 12，同一列表内更紧凑，
 * 接线时会有约 8px 的行高变化，属预期。
 *
 * ## 禁止用法
 * - 禁止给整行加 shadow-soft-glow：行是「卡片内的行」，抬升由外层 AppCard 负责，
 *   逐行加阴影会形成 10 层嵌套投影。
 * - 禁止用 ListRow 表示表格行；admin 的表格继续用 AdminDataTable。
 * - clickable 为真时，trailing 内的按钮会自动阻断冒泡，但仍建议只放 1 个动作；
 *   超过 2 个请收进行内菜单，否则窄屏下标题会被挤成省略号。
 * - 禁止在默认 slot 里再输出一个完整的卡片结构，那等于行中套卡。
 * - 禁止用 title 传已拼接的多段文案（如「模块 · 等级 · 耗时」），副信息请走 subtitle 或默认 slot。
 */
const props = withDefaults(defineProps<{
  /** 主文案，超长截断 */
  title: string
  /** 副文案，超长截断 */
  subtitle?: string
  /** 整行可点击（带 hover 底与键盘 Enter/Space 支持） */
  clickable?: boolean
  /** 行底分隔线 */
  divider?: boolean
}>(), {
  subtitle: '',
  clickable: false,
  divider: true,
})

const emit = defineEmits<{
  click: []
}>()

const rowClass = computed(() => [
  props.divider ? 'border-b border-outline-variant/40 last:border-b-0' : '',
  props.clickable
    ? 'cursor-pointer transition-colors hover:bg-surface-container focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary'
    : '',
])

const onClick = () => {
  if (props.clickable) emit('click')
}

/** 竖屏键盘/读屏用户无法触发 click，需要显式响应 Enter 与 Space */
const onKeyEnter = () => {
  if (props.clickable) emit('click')
}
</script>
