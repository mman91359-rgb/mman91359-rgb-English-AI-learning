<template>
  <BaseDialog
    :visible="open"
    :title="title"
    max-width="max-w-lg"
    :close-disabled="loading"
    @update:visible="onVisible"
    @close="$emit('cancel')"
  >
    <div class="flex flex-col gap-4">
      <p v-if="targetName" class="rounded-xl bg-surface-container-low px-4 py-3 font-body-sm text-body-sm text-on-surface">
        {{ $t('adminConsole.common.confirmTarget') }}<span class="font-semibold">{{ targetName }}</span>
      </p>
      <p class="font-body-sm text-body-sm leading-relaxed text-on-surface-variant">{{ impact }}</p>
    </div>
    <template #footer>
      <button
        type="button"
        class="rounded-full border border-outline-variant px-5 py-2.5 font-label-lg text-label-lg text-on-surface-variant transition-colors hover:bg-surface-container"
        :disabled="loading"
        @click="$emit('cancel')"
      >
        {{ $t('adminConsole.common.cancel') }}
      </button>
      <button
        type="button"
        class="rounded-full px-5 py-2.5 font-label-lg text-label-lg text-on-primary transition-colors disabled:opacity-60"
        :class="danger ? 'bg-error hover:bg-error/90' : 'bg-primary hover:bg-primary/90'"
        :disabled="loading"
        @click="$emit('confirm')"
      >
        {{ loading ? $t('adminConsole.common.loading') : (confirmLabel || $t('adminConsole.common.confirm')) }}
      </button>
    </template>
  </BaseDialog>
</template>

<script setup lang="ts">
import BaseDialog from '../ui/BaseDialog.vue'

withDefaults(defineProps<{
  open: boolean
  title: string
  targetName?: string
  impact: string
  confirmLabel?: string
  danger?: boolean
  loading?: boolean
}>(), {
  targetName: '',
  confirmLabel: '',
  danger: false,
  loading: false,
})

const emit = defineEmits<{
  cancel: []
  confirm: []
}>()

const onVisible = (visible: boolean) => {
  if (!visible) emit('cancel')
}
</script>
