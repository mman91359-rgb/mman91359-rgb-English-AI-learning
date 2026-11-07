import { ref } from 'vue'

export type Accent = 'US' | 'UK'

/**
 * 单词发音封装：基于浏览器 Web Speech API（零依赖、零后端）。
 * 英音/美音通过 lang 切换；后续若引入真人音频包，仅需替换 speak 内部实现。
 */
export function useSpeech() {
    const speaking = ref(false)
    const supported = typeof window !== 'undefined' && 'speechSynthesis' in window

    /** 当前发音口音 */
    const accent = ref<Accent>('US')

    /**
     * 朗读单词。
     * @param text 待朗读文本
     * @param preferred 指定口音，缺省用当前 accent
     */
    function speak(text: string, preferred?: Accent): void {
        if (!supported || !text) return
        const a = preferred ?? accent.value
        const lang = a === 'UK' ? 'en-GB' : 'en-US'

        window.speechSynthesis.cancel()
        const utterance = new SpeechSynthesisUtterance(text)
        utterance.lang = lang
        utterance.rate = 0.9
        utterance.onstart = () => { speaking.value = true }
        utterance.onend = () => { speaking.value = false }
        utterance.onerror = () => { speaking.value = false }
        window.speechSynthesis.speak(utterance)
    }

    function toggleAccent(): void {
        accent.value = accent.value === 'US' ? 'UK' : 'US'
    }

    return { speaking, accent, supported, speak, toggleAccent }
}
