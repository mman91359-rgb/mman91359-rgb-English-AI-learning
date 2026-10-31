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
          class="modal-card w-full rounded-[28px] bg-surface p-6 sm:p-8 soft-shadow"
          :class="maxWidth"
          @click.stop
        >
          <slot />
        </div>
      </div>
    </Transition>
  </Teleport>
</template>

<script setup lang="ts">
import { onBeforeUnmount, watch } from 'vue'

interface Props {
  visible: boolean
  maxWidth?: string
  closeOnBackdrop?: boolean
  closeOnEsc?: boolean
}

const props = withDefaults(defineProps<Props>(), {
  maxWidth: 'max-w-2xl',
  closeOnBackdrop: true,
  closeOnEsc: true,
})

const emit = defineEmits<{
  (e: 'update:visible', value: boolean): void
  (e: 'close'): void
}>()

let previousOverflow = ''
let listening = false

const close = () => {
  if (!props.visible) return
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
