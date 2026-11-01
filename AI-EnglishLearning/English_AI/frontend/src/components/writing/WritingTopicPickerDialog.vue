<template>
  <BaseDialog
    :visible="visible"
    :title="title"
    max-width="max-w-2xl"
    @update:visible="$emit('update:visible', $event)"
  >
    <p v-if="topics.length === 0" class="py-10 text-center font-body-md text-body-md text-on-surface-variant">
      {{ $t('writing.library.emptyFavorites') }}
    </p>
    <ul v-else class="flex flex-col gap-3">
      <li
        v-for="topic in topics"
        :key="topic.id"
        class="flex flex-col gap-2 rounded-2xl border border-outline-variant/40 bg-surface-container-low p-4 sm:flex-row sm:items-center sm:justify-between"
      >
        <div class="flex min-w-0 flex-col gap-1">
          <div class="flex flex-wrap items-center gap-2">
            <span class="rounded-full bg-secondary-container/60 px-2.5 py-0.5 font-label-sm text-label-sm text-on-secondary-container">
              {{ $t(WRITING_TYPE_META[topic.type].labelKey) }}
            </span>
            <span class="font-label-sm text-label-sm text-on-surface-variant">{{ $t(WRITING_LEVEL_LABEL_KEYS[topic.level]) }}</span>
            <span class="font-label-sm text-label-sm text-on-surface-variant">{{ $t('writing.entry.words', { min: topic.wordRange[0], max: topic.wordRange[1] }) }}</span>
          </div>
          <span class="truncate font-body-md text-body-md font-semibold text-on-surface">{{ topic.title }}</span>
        </div>
        <div class="flex items-center gap-2">
          <button
            type="button"
            class="flex h-9 w-9 items-center justify-center rounded-full transition-colors"
            :class="favoriteIds.includes(topic.id) ? 'text-error' : 'text-outline hover:bg-surface-container-high'"
            :aria-label="favoriteIds.includes(topic.id) ? $t('writing.entry.unfavorite') : $t('writing.entry.favorite')"
            @click="$emit('toggleFavorite', topic.id)"
          >
            <span class="material-symbols-outlined text-icon-md">{{ favoriteIds.includes(topic.id) ? 'favorite' : 'favorite_border' }}</span>
          </button>
          <button type="button" class="rounded-full bg-primary px-4 py-2 font-label-lg text-label-lg text-on-primary" @click="$emit('select', topic.id)">
            {{ $t('writing.entry.startPractice') }}
          </button>
        </div>
      </li>
    </ul>
  </BaseDialog>
</template>

<script setup lang="ts">
import BaseDialog from '../ui/BaseDialog.vue'
import type { WritingTopic } from '../../types/writing'
import { WRITING_LEVEL_LABEL_KEYS, WRITING_TYPE_META } from '../../utils/writing'

defineProps<{
  visible: boolean
  title: string
  topics: WritingTopic[]
  favoriteIds: string[]
}>()

defineEmits<{
  'update:visible': [visible: boolean]
  select: [topicId: string]
  toggleFavorite: [topicId: string]
}>()
</script>
