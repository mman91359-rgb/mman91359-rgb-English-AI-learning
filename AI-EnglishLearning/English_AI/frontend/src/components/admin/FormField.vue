<template>
  <label class="flex flex-col gap-2" :class="{ 'is-invalid': !!error }">
    <span class="flex items-center gap-1 font-label-lg text-label-lg text-on-surface">
      {{ label }}
      <span v-if="required" class="text-error">*</span>
    </span>
    <slot />
    <span v-if="error" class="font-label-md text-label-md text-error" role="alert">{{ error }}</span>
    <span v-else-if="hint" class="font-label-md text-label-md text-on-surface-variant">{{ hint }}</span>
  </label>
</template>

<script setup lang="ts">
withDefaults(defineProps<{
  label: string
  required?: boolean
  hint?: string
  error?: string
}>(), {
  required: false,
})
</script>

<style scoped>
/*
 * 校验失败时让插槽内的原生控件边框与聚焦环转为错误色。
 * 控件由调用方经 slot 传入，组件拿不到元素引用，因此用状态类向下穿透。
 */
.is-invalid :deep(input),
.is-invalid :deep(select),
.is-invalid :deep(textarea) {
  border-color: rgb(var(--color-error));
}

.is-invalid :deep(input:focus),
.is-invalid :deep(select:focus),
.is-invalid :deep(textarea:focus) {
  border-color: rgb(var(--color-error));
  --tw-ring-color: rgb(var(--color-error) / 0.2);
}
</style>
