<template>
  <div class="flex flex-wrap items-end gap-3 rounded-[16px] border border-outline-variant/40 bg-surface-container-lowest p-4 shadow-soft-glow">
    <slot />
    <button
      type="button"
      class="h-10 rounded-xl px-3 font-label-lg text-label-lg text-primary transition-colors hover:bg-primary-container/20 disabled:cursor-not-allowed disabled:text-outline disabled:hover:bg-transparent"
      :disabled="!hasActiveFilters"
      @click="$emit('reset')"
    >
      {{ $t('adminConsole.filter.reset') }}
    </button>
  </div>
</template>

<script setup lang="ts">
defineProps<{ hasActiveFilters: boolean }>()
defineEmits<{ reset: [] }>()
</script>
