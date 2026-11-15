<script setup lang="ts">
import AppIcon from '@/components/ui/AppIcon.vue'

const props = defineProps<{
  favorited: boolean
}>()

const emit = defineEmits<{
  toggle: []
}>()
</script>

<template>
  <button
    type="button"
    class="w-full bg-surface border border-outline-variant py-3 rounded-xl font-label-md text-label-md hover:bg-primary-container/20 transition-colors flex items-center justify-center gap-2"
    :class="props.favorited ? 'text-error' : 'text-on-surface'"
    :aria-pressed="props.favorited"
    @click="emit('toggle')"
  >
    <AppIcon name="favorite" :filled="props.favorited" size="lg" />
    <span>{{ props.favorited ? $t('learning.favorited') : $t('learning.favoriteSentence') }}</span>
  </button>
</template>
