<template>
  <div class="relative w-full sm:w-64">
    <span class="material-symbols-outlined pointer-events-none absolute left-3 top-1/2 -translate-y-1/2 text-icon-md text-outline">
      search
    </span>
    <input
      v-model="draft"
      type="search"
      :placeholder="placeholder"
      :class="inputClass"
      class="pl-10"
    />
  </div>
</template>

<script setup lang="ts">
import { ref, watch } from 'vue'
import { inputClass } from './formStyles'

const props = defineProps<{
  modelValue: string
  placeholder: string
}>()

const emit = defineEmits<{ 'update:modelValue': [value: string] }>()

const draft = ref(props.modelValue)
let timer: ReturnType<typeof setTimeout> | null = null

watch(() => props.modelValue, (value) => {
  if (value !== draft.value) draft.value = value
})

watch(draft, (value) => {
  if (timer) clearTimeout(timer)
  timer = setTimeout(() => {
    if (value.trim() !== props.modelValue) emit('update:modelValue', value.trim())
  }, 300)
})
</script>
