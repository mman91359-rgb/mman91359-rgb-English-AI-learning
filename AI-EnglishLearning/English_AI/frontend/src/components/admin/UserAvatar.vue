<template>
  <img v-if="resolvedAvatarUrl" :src="resolvedAvatarUrl" alt="" :class="boxClass" class="shrink-0 rounded-full object-cover" />
  <span
    v-else
    :class="boxClass"
    class="flex shrink-0 items-center justify-center rounded-full bg-primary-container font-semibold text-on-primary-container"
    aria-hidden="true"
  >
    {{ initial }}
  </span>
</template>

<script setup lang="ts">
import { computed } from 'vue'

const props = withDefaults(defineProps<{
  name: string
  avatarUrl: string | null
  size?: 'sm' | 'lg'
}>(), {
  size: 'sm',
})

const boxClass = computed(() => (props.size === 'lg' ? 'h-16 w-16 font-headline-sm text-headline-sm' : 'h-9 w-9 font-label-md text-label-md'))
const initial = computed(() => (props.name || 'U').charAt(0).toUpperCase())

// 头像为后端相对路径（如 /user/avatar/xxx.jpg），需拼 /api 前缀走网关
const resolvedAvatarUrl = computed(() => {
  if (!props.avatarUrl) return ''
  return props.avatarUrl.startsWith('/api') ? props.avatarUrl : `/api${props.avatarUrl}`
})
</script>
