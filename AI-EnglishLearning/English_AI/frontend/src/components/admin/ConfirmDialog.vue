<template>
  <BaseDialog :visible="visible" max-width="max-w-md" @update:visible="$emit('update:visible', $event)">
    <h3 class="font-headline-md text-headline-md text-on-surface mb-2">{{ title || $t('admin.confirmTitle') }}</h3>
    <p class="font-body-md text-body-md text-on-surface-variant leading-relaxed">{{ message }}</p>
    <div class="mt-6 flex justify-end gap-3">
      <button
        type="button"
        class="px-5 py-2.5 rounded-full border border-outline-variant text-on-surface-variant font-label-lg text-label-lg hover:bg-surface-container transition-colors"
        :disabled="loading"
        @click="$emit('update:visible', false)"
      >{{ $t('admin.cancel') }}</button>
      <button
        type="button"
        class="px-5 py-2.5 rounded-full font-label-lg text-label-lg text-on-primary transition-colors disabled:opacity-60"
        :class="danger ? 'bg-error hover:bg-error/90' : 'bg-primary hover:bg-primary/90'"
        :disabled="loading"
        @click="$emit('confirm')"
      >{{ loading ? $t('common.loading') : (confirmText || $t('admin.confirm')) }}</button>
    </div>
  </BaseDialog>
</template>

<script setup lang="ts">
import BaseDialog from '../ui/BaseDialog.vue'

withDefaults(defineProps<{
  visible: boolean
  title?: string
  message: string
  confirmText?: string
  danger?: boolean
  loading?: boolean
}>(), {
  danger: false,
  loading: false,
})

defineEmits<{
  'update:visible': [visible: boolean]
  confirm: []
}>()
</script>
