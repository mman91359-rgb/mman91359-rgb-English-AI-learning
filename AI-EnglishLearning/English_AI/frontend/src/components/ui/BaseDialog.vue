<template>
  <Teleport to="body">
    <Transition name="modal-fade">
      <div
        v-if="visible"
        class="fixed inset-0 z-[120] flex items-center justify-center bg-black/45 px-4 backdrop-blur-[2px]"
        role="dialog"
        aria-modal="true"
        @click.self="onBackdrop"
      >
        <div
          class="modal-card flex max-h-[90vh] w-full flex-col rounded-[28px] bg-surface soft-shadow"
          :class="maxWidth"
          @click.stop
        >
          <template v-if="title || $slots.header">
            <header class="flex items-center justify-between gap-4 border-b border-outline-variant/40 px-6 py-4">
              <slot name="header">
                <h2 class="font-headline-sm text-headline-sm text-on-surface">{{ title }}</h2>
              </slot>
              <button
                type="button"
                class="flex h-8 w-8 items-center justify-center rounded-full text-on-surface-variant transition-colors hover:bg-surface-container-high disabled:opacity-50"
                :disabled="closeDisabled"
                :aria-label="$t('adminConsole.common.close')"
                @click="close"
              >
                <span class="material-symbols-outlined text-icon-md">close</span>
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
import { onBeforeUnmount, watch } from 'vue'

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

let previousOverflow = ''
let listening = false

const close = () => {
  if (!props.visible || props.closeDisabled) return
  emit('update:visible', false)
  emit('close')
}

const onBackdrop = () => {
  if (props.closeOnBackdrop) close()
}

const onKeydown = (event: KeyboardEvent) => {
  if (event.key === 'Escape' && props.closeOnEsc) close()
}

const start = () => {
  if (listening) return
  previousOverflow = document.body.style.overflow
  document.body.style.overflow = 'hidden'
  window.addEventListener('keydown', onKeydown)
  listening = true
}

const stop = () => {
  if (!listening) return
  document.body.style.overflow = previousOverflow
  window.removeEventListener('keydown', onKeydown)
  listening = false
}

watch(
  () => props.visible,
  (visible) => {
    if (visible) start()
    else stop()
  },
  { immediate: true },
)

onBeforeUnmount(stop)
</script>
