<template>
  <div class="space-y-4">
    <div class="flex flex-col lg:flex-row lg:items-center justify-between gap-3">
      <div class="flex gap-2 overflow-x-auto">
        <button
          v-for="tab in tabs"
          :key="tab.value"
          type="button"
          class="px-4 py-2 rounded-full font-label-lg text-label-lg whitespace-nowrap transition-colors"
          :class="status === tab.value ? 'bg-primary text-on-primary' : 'bg-surface-container-lowest text-on-surface-variant hover:bg-surface-container'"
          @click="switchStatus(tab.value)"
        >{{ tab.label }}</button>
      </div>
      <button type="button" class="px-5 py-2.5 rounded-full bg-primary text-on-primary font-label-lg text-label-lg flex items-center justify-center gap-2" @click="generateVisible = true">
        <span class="material-symbols-outlined">auto_awesome</span>{{ $t('admin.generate') }}
      </button>
    </div>

    <div class="bg-surface-container-lowest rounded-[20px] p-4 shadow-soft-glow border border-outline-variant/20 flex flex-col md:flex-row gap-3">
      <input v-model="keyword" :placeholder="$t('admin.keyword')" class="flex-1 h-10 rounded-xl border border-outline-variant/40 bg-surface px-3 font-body-md text-body-md" @keyup.enter="applyFilters" />
      <select v-model="moduleType" class="h-10 rounded-xl border border-outline-variant/40 bg-surface px-3 font-body-md text-body-md">
        <option value="">{{ $t('admin.all') }}</option>
        <option value="1">词汇</option>
        <option value="2">语法</option>
        <option value="4">听力</option>
      </select>
      <select v-model="targetLevel" class="h-10 rounded-xl border border-outline-variant/40 bg-surface px-3 font-body-md text-body-md">
        <option value="">{{ $t('admin.all') }}</option>
        <option value="CET4">CET4</option>
        <option value="CET6">CET6</option>
      </select>
      <button type="button" class="px-5 h-10 rounded-full bg-primary text-on-primary font-label-lg text-label-lg" @click="applyFilters">{{ $t('admin.search') }}</button>
      <button type="button" class="px-5 h-10 rounded-full border border-outline-variant text-on-surface-variant font-label-lg text-label-lg" @click="resetFilters">{{ $t('admin.clear') }}</button>
    </div>

    <LoadingState v-if="loading" :message="$t('admin.loading')" />
    <ErrorState v-else-if="error" :message="error" :action-label="$t('common.retry')" @retry="load" />
    <div v-else class="space-y-3">
      <div v-if="questions.length === 0" class="bg-surface-container-lowest rounded-[20px] py-16 text-center text-on-surface-variant font-body-md text-body-md border border-outline-variant/20">
        {{ $t('admin.empty') }}
      </div>
      <article v-for="question in questions" :key="question.id" class="bg-surface-container-lowest rounded-[20px] p-5 shadow-soft-glow border border-outline-variant/20">
        <div class="flex flex-col lg:flex-row lg:items-start justify-between gap-4">
          <div class="min-w-0 flex-1">
            <div class="flex flex-wrap items-center gap-2 mb-3">
              <StatusBadge :status="question.status" :text="statusLabel(question.status)" />
              <span class="rounded-full bg-surface-container-high text-on-surface-variant px-2.5 py-1 font-label-md text-label-md">{{ moduleLabel(question.moduleType) }}</span>
              <span class="rounded-full bg-surface-container-high text-on-surface-variant px-2.5 py-1 font-label-md text-label-md">{{ question.targetLevel }} · Lv.{{ question.difficultyLevel }}</span>
              <span class="font-label-md text-label-md text-on-surface-variant">{{ formatDate(question.createdAt) }}</span>
            </div>
            <p class="font-body-lg text-body-lg text-on-surface whitespace-pre-line">{{ question.stem }}</p>
            <pre v-if="question.options" class="mt-3 whitespace-pre-wrap font-body-md text-body-md text-on-surface-variant bg-surface-container-low rounded-xl p-3 max-h-40 overflow-y-auto">{{ formatOptions(question.options) }}</pre>
            <p v-if="question.analysis" class="mt-3 font-body-md text-body-md text-on-surface-variant">解析：{{ question.analysis }}</p>
            <p v-if="question.reviewComment" class="mt-2 font-label-md text-label-md text-error">驳回意见：{{ question.reviewComment }}</p>
          </div>
          <div v-if="question.status === 'PENDING'" class="flex lg:flex-col gap-2 flex-shrink-0">
            <button type="button" class="px-4 py-2 rounded-full bg-tertiary text-on-tertiary font-label-md text-label-md" @click="approve(question)">{{ $t('admin.approve') }}</button>
            <button type="button" class="px-4 py-2 rounded-full bg-error-container/40 text-error font-label-md text-label-md" @click="openReject(question)">{{ $t('admin.reject') }}</button>
          </div>
        </div>
      </article>
      <div v-if="questions.length > 0" class="bg-surface-container-lowest rounded-[20px] px-4 pb-4 border border-outline-variant/20">
        <AdminPagination :page="page" :size="size" :total="total" @update:page="changePage" @update:size="changeSize" />
      </div>
    </div>

    <ConfirmDialog
      :visible="approveVisible"
      :title="$t('admin.confirmTitle')"
      :message="approveMessage"
      :loading="approveLoading"
      @update:visible="approveVisible = $event"
      @confirm="runApprove"
    />

    <BaseDialog :visible="rejectVisible" max-width="max-w-lg" @update:visible="closeReject">
      <h3 class="font-headline-md text-headline-md text-on-surface mb-3">{{ $t('admin.reject') }}</h3>
      <textarea v-model="rejectComment" rows="4" class="w-full rounded-xl border border-outline-variant/40 bg-surface p-3 font-body-md text-body-md text-on-surface" :placeholder="$t('admin.rejectComment')"></textarea>
      <div class="mt-4 flex justify-end gap-3">
        <button type="button" class="px-4 py-2 rounded-full border border-outline-variant font-label-lg text-label-lg" @click="closeReject">{{ $t('admin.cancel') }}</button>
        <button type="button" class="px-4 py-2 rounded-full bg-error text-on-error font-label-lg text-label-lg disabled:opacity-50" :disabled="!rejectComment.trim() || rejectLoading" @click="submitReject">{{ rejectLoading ? $t('common.loading') : $t('admin.confirm') }}</button>
      </div>
    </BaseDialog>

    <BaseDialog :visible="generateVisible" max-width="max-w-xl" @update:visible="generateVisible = $event">
      <h3 class="font-headline-md text-headline-md text-on-surface mb-4">{{ $t('admin.generateTitle') }}</h3>
      <div class="grid grid-cols-1 sm:grid-cols-2 gap-3">
        <input v-model="genForm.knowledgePoint" class="h-10 rounded-xl border border-outline-variant/40 bg-surface px-3 font-body-md text-body-md" placeholder="知识点" />
        <select v-model="genForm.cetLevel" class="h-10 rounded-xl border border-outline-variant/40 bg-surface px-3 font-body-md text-body-md">
          <option value="CET4">CET4</option>
          <option value="CET6">CET6</option>
        </select>
        <input v-model.number="genForm.difficulty" type="number" min="1" max="8" class="h-10 rounded-xl border border-outline-variant/40 bg-surface px-3 font-body-md text-body-md" placeholder="难度 1-8" />
        <input v-model="genForm.questionType" class="h-10 rounded-xl border border-outline-variant/40 bg-surface px-3 font-body-md text-body-md" placeholder="题型，如 FILL_BLANK" />
        <input v-model.number="genForm.count" type="number" min="1" max="20" class="h-10 rounded-xl border border-outline-variant/40 bg-surface px-3 font-body-md text-body-md" placeholder="数量" />
      </div>
      <div class="mt-5 flex justify-end gap-3">
        <button type="button" class="px-4 py-2 rounded-full border border-outline-variant font-label-lg text-label-lg" @click="generateVisible = false">{{ $t('admin.cancel') }}</button>
        <button type="button" class="px-4 py-2 rounded-full bg-primary text-on-primary font-label-lg text-label-lg disabled:opacity-50" :disabled="generateLoading" @click="submitGenerate">{{ generateLoading ? $t('common.loading') : $t('admin.generate') }}</button>
      </div>
    </BaseDialog>
  </div>
</template>

<script setup lang="ts">
import { onMounted, reactive, ref } from 'vue'
import { useI18n } from 'vue-i18n'
import AdminPagination from '../../components/admin/AdminPagination.vue'
import StatusBadge from '../../components/admin/StatusBadge.vue'
import ConfirmDialog from '../../components/admin/ConfirmDialog.vue'
import LoadingState from '../../components/ui/LoadingState.vue'
import ErrorState from '../../components/ui/ErrorState.vue'
import BaseDialog from '../../components/ui/BaseDialog.vue'
import { useToast } from '../../composables/useToast'
import {
  approveQuestion,
  generateQuestions,
  getAdminQuestions,
  rejectQuestion,
  type AdminQuestion,
  type AdminQuestionQuery,
} from '../../api/admin'

const { t } = useI18n()
const { show: toast } = useToast()

const tabs = [
  { value: 'PENDING', label: t('admin.pending') },
  { value: 'APPROVED', label: t('admin.approved') },
  { value: 'REJECTED', label: t('admin.rejected') },
]
const status = ref('PENDING')
const keyword = ref('')
const moduleType = ref('')
const targetLevel = ref('')
const page = ref(1)
const size = ref(20)
const total = ref(0)
const questions = ref<AdminQuestion[]>([])
const loading = ref(false)
const error = ref('')

const approveVisible = ref(false)
const approveLoading = ref(false)
const approveMessage = ref('')
let approveTarget: AdminQuestion | null = null

const rejectVisible = ref(false)
const rejectLoading = ref(false)
const rejectComment = ref('')
let rejectTarget: AdminQuestion | null = null

const generateVisible = ref(false)
const generateLoading = ref(false)
const genForm = reactive({
  knowledgePoint: '',
  cetLevel: 'CET4',
  difficulty: 3,
  questionType: 'FILL_BLANK',
  count: 5,
})

const statusLabel = (value: string) => {
  if (value === 'PENDING') return t('admin.pending')
  if (value === 'APPROVED') return t('admin.approved')
  if (value === 'REJECTED') return t('admin.rejected')
  return value
}
const moduleLabel = (value: number) => ({ 1: '词汇', 2: '语法', 3: '翻译', 4: '听力', 5: '造句', 6: '写作' }[value] || String(value))
const formatDate = (value?: string) => (value ? value.replace('T', ' ').slice(0, 16) : '—')
const formatOptions = (value: string) => {
  try {
    const parsed = JSON.parse(value)
    if (Array.isArray(parsed)) return parsed.map((item, index) => `${String.fromCharCode(65 + index)}. ${item}`).join('\n')
    return Object.entries(parsed).map(([key, text]) => `${key}. ${text}`).join('\n')
  } catch {
    return value
  }
}

const load = async () => {
  loading.value = true
  error.value = ''
  try {
    const params: AdminQuestionQuery = { status: status.value, page: page.value, size: size.value }
    if (keyword.value.trim()) params.keyword = keyword.value.trim()
    if (moduleType.value) params.moduleType = Number(moduleType.value)
    if (targetLevel.value) params.targetLevel = targetLevel.value
    const result = await getAdminQuestions(params)
    questions.value = result.records
    total.value = result.total
  } catch (e) {
    error.value = e instanceof Error ? e.message : t('admin.error')
  } finally {
    loading.value = false
  }
}

const switchStatus = (value: string) => {
  status.value = value
  page.value = 1
  void load()
}
const applyFilters = () => {
  page.value = 1
  void load()
}
const resetFilters = () => {
  keyword.value = ''
  moduleType.value = ''
  targetLevel.value = ''
  applyFilters()
}
const changePage = (value: number) => {
  page.value = value
  void load()
}
const changeSize = (value: number) => {
  size.value = value
  page.value = 1
  void load()
}

const approve = (question: AdminQuestion) => {
  approveTarget = question
  approveMessage.value = `${t('admin.approve')} #${question.id}?`
  approveVisible.value = true
}
const runApprove = async () => {
  if (!approveTarget) return
  approveLoading.value = true
  try {
    await approveQuestion(approveTarget.id)
    toast(t('admin.confirm'), 'success')
    approveVisible.value = false
    await load()
  } catch (e) {
    toast(e instanceof Error ? e.message : t('admin.error'), 'error')
  } finally {
    approveLoading.value = false
  }
}

const openReject = (question: AdminQuestion) => {
  rejectTarget = question
  rejectComment.value = ''
  rejectVisible.value = true
}
const closeReject = () => {
  rejectVisible.value = false
  rejectTarget = null
  rejectComment.value = ''
}
const submitReject = async () => {
  if (!rejectTarget || !rejectComment.value.trim()) return
  rejectLoading.value = true
  try {
    await rejectQuestion(rejectTarget.id, rejectComment.value.trim())
    toast(t('admin.confirm'), 'success')
    closeReject()
    await load()
  } catch (e) {
    toast(e instanceof Error ? e.message : t('admin.error'), 'error')
  } finally {
    rejectLoading.value = false
  }
}

const submitGenerate = async () => {
  if (!genForm.knowledgePoint.trim()) {
    toast('知识点不能为空', 'warning')
    return
  }
  generateLoading.value = true
  try {
    const count = await generateQuestions({
      knowledgePoint: genForm.knowledgePoint.trim(),
      cetLevel: genForm.cetLevel,
      difficulty: genForm.difficulty,
      questionType: genForm.questionType,
      count: genForm.count,
    })
    toast(`已生成 ${count} 道题`, 'success')
    generateVisible.value = false
    await load()
  } catch (e) {
    toast(e instanceof Error ? e.message : t('admin.error'), 'error')
  } finally {
    generateLoading.value = false
  }
}

onMounted(load)
</script>
