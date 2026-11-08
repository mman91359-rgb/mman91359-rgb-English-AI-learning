<template>
  <label ref="rootRef" class="flex flex-col gap-2" :class="{ 'is-invalid': !!error }">
    <span class="flex items-center gap-1 font-label-lg text-label-lg text-on-surface">
      {{ label }}
      <span v-if="required" class="text-error">*</span>
    </span>
    <slot />
    <span v-if="error" :id="errorId" class="font-label-md text-label-md text-error" role="alert">{{ error }}</span>
    <span v-else-if="hint" class="font-label-md text-label-md text-on-surface-variant">{{ hint }}</span>
  </label>
</template>

<script setup lang="ts">
import { onMounted, ref, useId, watch } from 'vue'

const props = withDefaults(defineProps<{
  label: string
  required?: boolean
  hint?: string
  error?: string
}>(), {
  required: false,
})

const rootRef = ref<HTMLElement | null>(null)
const errorId = `form-field-error-${useId()}`

/**
 * 将校验状态同步到插槽内的原生控件。
 * 控件由调用方经 slot 传入，组件拿不到元素引用，因此挂载后按 DOM 反射写入 ARIA 属性，
 * 所有调用方无需改动即可获得 aria-invalid 与 aria-describedby 关联。
 */
const syncAria = (invalid: boolean) => {
  const controls = rootRef.value?.querySelectorAll<HTMLElement>('input, select, textarea')
  if (!controls) return
  controls.forEach((el) => {
    el.setAttribute('aria-invalid', invalid ? 'true' : 'false')
    if (invalid) {
      el.setAttribute('aria-describedby', errorId)
    } else if (el.getAttribute('aria-describedby') === errorId) {
      el.removeAttribute('aria-describedby')
    }
  })
}

onMounted(() => syncAria(!!props.error))
watch(() => props.error, (val) => syncAria(!!val), { flush: 'post' })
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
