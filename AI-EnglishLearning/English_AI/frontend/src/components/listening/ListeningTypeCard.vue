<template>
  <label class="cursor-pointer">
    <input
      type="radio"
      class="peer sr-only"
      :value="value"
      :checked="modelValue === value"
      @change="$emit('update:modelValue', value)"
    />
    <div class="bg-surface-container-lowest/15 border-2 border-surface-container-lowest/30 peer-checked:border-surface-container-lowest peer-checked:bg-surface-container-lowest/25 rounded-[16px] p-4 transition-all">
      <div class="flex items-center gap-3">
        <span class="w-9 h-9 rounded-full bg-surface-container-lowest/20 flex items-center justify-center flex-shrink-0">
          <span class="material-symbols-outlined text-on-tertiary text-[20px]">{{ icon }}</span>
        </span>
        <div>
          <div class="font-label-lg text-label-lg text-on-tertiary">{{ label }}</div>
          <p class="font-label-md text-label-md text-on-tertiary/70">{{ description }}</p>
        </div>
      </div>
    </div>
  </label>
</template>

<script setup lang="ts">
defineProps<{
  modelValue: string
  value: string
  label: string
  description: string
  icon: string
}>()

defineEmits<{
  'update:modelValue': [value: string]
}>()
</script>
