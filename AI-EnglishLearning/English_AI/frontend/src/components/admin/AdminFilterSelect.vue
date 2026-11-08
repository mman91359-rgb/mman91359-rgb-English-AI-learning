<template>
  <select
    :value="modelValue === undefined ? '' : String(modelValue)"
    :class="inputClass"
    class="h-10 py-0"
    @change="onChange"
  >
    <option value="">{{ allLabel }}</option>
    <option v-for="option in options" :key="String(option.value)" :value="String(option.value)">
      {{ option.label }}
    </option>
  </select>
</template>

<script setup lang="ts" generic="V extends string | number">
import { inputClass } from '@/components/ui/formStyles'

interface FilterSelectOption<T> {
  value: T
  label: string
}

const props = defineProps<{
  modelValue: V | undefined
  options: FilterSelectOption<V>[]
  allLabel: string
}>()

const emit = defineEmits<{ 'update:modelValue': [value: V | undefined] }>()

const onChange = (event: Event) => {
  const raw = (event.target as HTMLSelectElement).value
  if (!raw) {
    emit('update:modelValue', undefined)
    return
  }
  const selected = props.options.find((option) => String(option.value) === raw)
  emit('update:modelValue', selected?.value)
}
</script>
