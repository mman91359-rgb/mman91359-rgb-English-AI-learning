<template>
  <Teleport to="body">
    <Transition name="modal-fade">
      <div
        v-if="visible"
        class="fixed inset-0 z-[120] flex items-center justify-center bg-scrim/45 px-4 backdrop-blur-[2px]"
        role="dialog"
        aria-modal="true"
        :aria-labelledby="title ? titleId : undefined"
        @click.self="onBackdrop"
      >
        <div
          ref="panelRef"
          tabindex="-1"
          class="modal-card flex max-h-[90dvh] w-full flex-col rounded-3xl bg-surface soft-shadow focus:outline-none"
          :class="maxWidth"
          @click.stop
        >
          <template v-if="title || $slots.header">
            <header class="flex items-center justify-between gap-4 border-b border-outline-variant/40 px-6 py-4">
              <slot name="header">
                <h2 :id="titleId" class="font-headline-sm text-headline-sm text-on-surface">{{ title }}</h2>
              </slot>
              <button
                type="button"
                :class="btnIconSm"
                :disabled="closeDisabled"
                :aria-label="$t('common.close')"
                @click="close"
              >
                <span class="material-symbols-outlined text-icon-md" aria-hidden="true">close</span>
              </button>
            </header>
            <div class="overflow-y-auto px-6 py-6">
              <slot />
            </div>
            <footer v-if="$slots.footer" class="flex items-center justify-end gap-3 border-t border-outline-variant/40 px-6 py-4">
              <slot name="footer" />
            </footer>
          </template>
          <div v-else class="overflow-y-auto p-6 sm:p-8">
            <slot />
          </div>
        </div>
      </div>
    </Transition>
  </Teleport>
</template>

<script setup lang="ts">
import { ref, useId } from 'vue'
import { useModalBehavior } from '@/composables/useModalBehavior'
import { btnIconSm } from '@/components/ui/buttonStyles'

interface Props {
  visible: boolean
  title?: string
  maxWidth?: string
  closeOnBackdrop?: boolean
  closeOnEsc?: boolean
  closeDisabled?: boolean
}

const props = withDefaults(defineProps<Props>(), {
  title: '',
  maxWidth: 'max-w-2xl',
  closeOnBackdrop: true,
  closeOnEsc: true,
  closeDisabled: false,
})

const emit = defineEmits<{
  (e: 'update:visible', value: boolean): void
  (e: 'close'): void
}>()

const panelRef = ref<HTMLElement | null>(null)
const titleId = `dialog-title-${useId()}`

const close = () => {
  if (!props.visible || props.closeDisabled) return
  emit('update:visible', false)
  emit('close')
}

const onBackdrop = () => {
  if (props.closeOnBackdrop) close()
}

useModalBehavior({
  isOpen: () => props.visible,
  container: panelRef,
  onEscape: close,
  canEscape: () => props.closeOnEsc,
})
</script>
