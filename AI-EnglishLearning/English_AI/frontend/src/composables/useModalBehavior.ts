import { nextTick, onBeforeUnmount, watch, type Ref } from 'vue'

/**
 * 弹窗/抽屉共用的行为：滚动锁定、ESC 关闭、焦点陷阱、焦点归还。
 *
 * - 滚动锁定与 ESC 均按「栈」处理，支持弹窗嵌套：只有最后打开的那个响应 ESC，
 *   且全部关闭后才恢复 body 滚动。
 * - 打开时焦点移入容器（优先 [data-autofocus]），关闭时还给触发元素。
 */

const FOCUSABLE_SELECTOR = [
  'a[href]',
  'button:not([disabled])',
  'input:not([disabled]):not([type="hidden"])',
  'select:not([disabled])',
  'textarea:not([disabled])',
  '[tabindex]:not([tabindex="-1"])',
].join(',')

let lockCount = 0
let savedOverflow = ''
const escapeStack: symbol[] = []

const lockScroll = () => {
  if (lockCount === 0) {
    savedOverflow = document.body.style.overflow
    document.body.style.overflow = 'hidden'
  }
  lockCount += 1
}

const unlockScroll = () => {
  if (lockCount === 0) return
  lockCount -= 1
  if (lockCount === 0) {
    document.body.style.overflow = savedOverflow
  }
}

const collectFocusable = (container: HTMLElement): HTMLElement[] =>
  Array.from(container.querySelectorAll<HTMLElement>(FOCUSABLE_SELECTOR)).filter(
    (el) => el.tabIndex !== -1 && el.getAttribute('aria-hidden') !== 'true' && el.offsetParent !== null,
  )

export interface ModalBehaviorOptions {
  /** 当前是否展开 */
  isOpen: () => boolean
  /** 弹窗内容容器，用于限定焦点范围 */
  container: Ref<HTMLElement | null>
  /** ESC 触发时调用 */
  onEscape: () => void
  /** 返回 false 时 ESC 不生效，默认可关闭 */
  canEscape?: () => boolean
}

export function useModalBehavior(options: ModalBehaviorOptions) {
  const id = Symbol('modal')
  let returnTarget: HTMLElement | null = null
  let attached = false

  const trapFocus = (event: KeyboardEvent) => {
    const container = options.container.value
    if (!container) return

    const items = collectFocusable(container)
    if (items.length === 0) {
      event.preventDefault()
      container.focus()
      return
    }

    const first = items[0]
    const last = items[items.length - 1]
    const active = document.activeElement as HTMLElement | null
    const inside = active !== null && container.contains(active)

    if (event.shiftKey) {
      if (!inside || active === first) {
        event.preventDefault()
        last.focus()
      }
    } else if (!inside || active === last) {
      event.preventDefault()
      first.focus()
    }
  }

  const onKeydown = (event: KeyboardEvent) => {
    // 只有最后打开的弹窗响应键盘，避免嵌套时多个弹窗同时处理
    if (escapeStack[escapeStack.length - 1] !== id) return

    if (event.key === 'Escape') {
      if (options.canEscape?.() === false) return
      event.stopPropagation()
      options.onEscape()
      return
    }

    if (event.key === 'Tab') trapFocus(event)
  }

  const activate = async () => {
    returnTarget = document.activeElement as HTMLElement | null
    lockScroll()
    escapeStack.push(id)
    if (!attached) {
      window.addEventListener('keydown', onKeydown)
      attached = true
    }

    await nextTick()

    // 等待期间可能已关闭，避免把焦点抢进已经卸载的弹窗
    if (escapeStack[escapeStack.length - 1] !== id) return

    const container = options.container.value
    if (!container) return

    const preferred = container.querySelector<HTMLElement>('[data-autofocus]')
    const target = preferred ?? collectFocusable(container)[0] ?? container
    target.focus()
  }

  const deactivate = () => {
    const index = escapeStack.indexOf(id)
    if (index !== -1) escapeStack.splice(index, 1)

    if (attached) {
      window.removeEventListener('keydown', onKeydown)
      attached = false
    }

    unlockScroll()

    if (returnTarget && typeof returnTarget.focus === 'function' && document.contains(returnTarget)) {
      returnTarget.focus()
    }
    returnTarget = null
  }

  watch(
    options.isOpen,
    (open) => {
      if (open) void activate()
      else deactivate()
    },
    { immediate: true },
  )

  onBeforeUnmount(deactivate)
}
