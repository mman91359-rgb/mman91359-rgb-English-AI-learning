<template>
  <AppLayout>
    <PageHeader :title="$t('app.title') + ' - ' + $t('learning.myFavorites')" back />

    <div class="bg-surface-container-lowest rounded-2xl p-6 shadow-soft-glow mb-6">
      <div class="relative">
        <AppIcon name="search" size="lg" class="pointer-events-none absolute left-4 top-1/2 -translate-y-1/2 text-outline" />
        <input
          v-model="searchKeyword"
          :class="[inputClassOnCard, 'pl-12']"
          :placeholder="$t('learning.searchFavorites')"
        />
      </div>
    </div>

    <LoadingState v-if="loading" />

    <ErrorState
      v-else-if="loadError"
      :message="loadError"
      :action-label="$t('common.retry')"
      @retry="load"
    />

    <EmptyState
      v-else-if="favorites.length === 0"
      icon="favorite_border"
      :title="$t('learning.noFavorites')"
      :description="$t('learning.noFavoritesHint')"
    />

    <EmptyState
      v-else-if="filteredFavorites.length === 0"
      icon="search_off"
      :title="$t('learning.noMatchingFavorites')"
      :description="$t('learning.tryOtherKeywords')"
    />

    <div v-else class="space-y-4">
      <div
        v-for="fav in filteredFavorites"
        :key="fav.id"
        class="bg-surface-container-lowest rounded-2xl p-4 shadow-soft-glow flex items-start justify-between gap-4"
      >
        <div class="flex items-start gap-3 flex-1 min-w-0">
          <AppIcon name="favorite" size="lg" filled tone="error" class="shrink-0 mt-0.5" />
          <div class="min-w-0 flex-1">
            <p
              :class="[
                'font-body-md text-body-md break-words',
                fav.questionId && getModuleInfo(fav)
                  ? 'text-primary hover:underline cursor-pointer'
                  : 'text-on-surface'
              ]"
              @click="handleReanswer(fav)"
            >
              {{ fav.sentenceText }}
            </p>
            <div class="flex items-center gap-2 mt-1 flex-wrap">
              <span class="font-label-sm text-label-sm text-on-surface-variant">
                {{ formatDate(fav.createdAt, locale) }}
              </span>
              <Tag
                v-if="getModuleInfo(fav)"
                tone="primary"
                size="sm"
              >
                {{ getModuleInfo(fav)?.name }}
              </Tag>
            </div>
          </div>
        </div>
        <div class="flex items-center gap-2 shrink-0">
          <button
            v-if="fav.questionId && getModuleInfo(fav)"
            :class="btnPrimarySm"
            @click="handleReanswer(fav)"
          >
            <AppIcon name="replay" size="sm" />
            {{ $t('learning.retry') }}
          </button>
          <button
            :class="btnIconDanger"
            @click="handleRemove(fav)"
          >
            <AppIcon name="delete" size="lg" tone="error" />
          </button>
        </div>
      </div>
    </div>
  </AppLayout>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import AppLayout from '../components/AppLayout.vue'
import AppIcon from '@/components/ui/AppIcon.vue'
import PageHeader from '@/components/ui/PageHeader.vue'
import Tag from '@/components/ui/Tag.vue'
import LoadingState from '@/components/ui/LoadingState.vue'
import EmptyState from '@/components/ui/EmptyState.vue'
import ErrorState from '@/components/ui/ErrorState.vue'
import { useUserStore } from '@/stores/user'
import { moduleName, moduleTypeFromSource } from '@/config/modules'
import { formatDate } from '@/utils/format'
import { getFavorites, removeFavorite, type FavoriteVO } from '@/api/exercise'
import { btnIconDanger, btnPrimarySm } from '@/components/ui/buttonStyles'
import { inputClassOnCard } from '@/components/ui/formStyles'

const { t, locale } = useI18n()
const router = useRouter()
const userStore = useUserStore()
const favorites = ref<FavoriteVO[]>([])
const loading = ref(true)
const loadError = ref('')
const searchKeyword = ref('')

/** 只展示词汇(1)/语法(2)两类收藏；moduleType 优先，存量数据用 sourceType 兜底 */
const getModuleInfo = (fav: FavoriteVO): { type: number; name: string } | null => {
  const type = fav.moduleType || moduleTypeFromSource(fav.sourceType)
  if (type !== 1 && type !== 2) return null
  return { type, name: moduleName(type, t) }
}

const filteredFavorites = computed(() => {
  const scoped = favorites.value.filter(fav => getModuleInfo(fav) !== null)
  const keyword = searchKeyword.value.trim().toLowerCase()
  if (!keyword) return scoped
  return scoped.filter(fav =>
    fav.sentenceText.toLowerCase().includes(keyword)
  )
})

const load = async () => {
  const uid = userStore.userId
  if (!uid) return
  loading.value = true
  loadError.value = ''
  try {
    // 收藏页只展示词汇(1)/语法(2)，由后端按 moduleTypes 过滤，减少传输与前端过滤负担
    favorites.value = await getFavorites(uid, [1, 2])
  } catch (e) {
    console.warn('加载收藏列表失败', e)
    loadError.value = e instanceof Error ? e.message : '加载收藏列表失败'
  } finally {
    loading.value = false
  }
}

/** 重做：按模块跳到对应练习页并带上 questionId，由承接页拉取该题单题作答 */
const handleReanswer = (fav: FavoriteVO) => {
  if (!fav.questionId) return
  const info = getModuleInfo(fav)
  if (!info) return
  if (info.type === 2) {
    // 语法拼接题只有 GrammarQuizView 能作答
    router.push({ path: '/grammar-quiz', query: { questionId: fav.questionId } })
  } else {
    router.push({ path: '/learning/practice', query: { moduleType: info.type, questionId: fav.questionId } })
  }
}

const handleRemove = async (fav: FavoriteVO) => {
  const uid = userStore.userId
  if (!uid) return
  try {
    await removeFavorite(fav.id, uid)
    favorites.value = favorites.value.filter(f => f.id !== fav.id)
  } catch (e) {
    console.warn('删除收藏失败', e)
  }
}

onMounted(load)
</script>
