import { createRouter, createWebHistory } from 'vue-router'
import { useUserStore } from '@/stores/user'

// 全部路由懒加载：按页面拆包，避免单一巨型 chunk
const HomeView = () => import('../views/HomeView.vue')
const LearningView = () => import('../views/LearningView.vue')
const WordBooksView = () => import('../views/WordBooksView.vue')
const LearnedWordsView = () => import('../views/LearnedWordsView.vue')
const StatsView = () => import('../views/StatsView.vue')
const ProfileView = () => import('../views/ProfileView.vue')
const LoginView = () => import('../views/LoginView.vue')
const RegisterView = () => import('../views/RegisterView.vue')
const ForgotPasswordView = () => import('../views/ForgotPasswordView.vue')
const SettingsView = () => import('../views/SettingsView.vue')
const FavoritesView = () => import('../views/FavoritesView.vue')
const ErrorBookView = () => import('../views/ErrorBookView.vue')
const HistoryView = () => import('../views/HistoryView.vue')
const VocabularyView = () => import('../views/VocabularyView.vue')
const PracticeView = () => import('../views/PracticeView.vue')
const VocabQuizView = () => import('../views/VocabQuizView.vue')
const GrammarQuizView = () => import('../views/GrammarQuizView.vue')
const AssessView = () => import('../views/AssessView.vue')
const AdminLayout = () => import('../views/admin/AdminLayout.vue')
const AdminOverviewView = () => import('../views/admin/AdminOverviewView.vue')
const AdminUsersView = () => import('../views/admin/AdminUsersView.vue')
const AdminUserDetailView = () => import('../views/admin/AdminUserDetailView.vue')
const AdminQuestionsView = () => import('../views/admin/AdminQuestionsView.vue')
const AdminNoticesView = () => import('../views/admin/AdminNoticesView.vue')
const AdminActivitiesView = () => import('../views/admin/AdminActivitiesView.vue')
const AdminOperationLogsView = () => import('../views/admin/AdminOperationLogsView.vue')
const AdminJudgeReviewView = () => import('../views/admin/AdminJudgeReviewView.vue')
const ForbiddenView = () => import('../views/ForbiddenView.vue')
const ListeningQuizView = () => import('../views/ListeningQuizView.vue')
const TranslationPracticeView = () => import('../views/TranslationPracticeView.vue')
const WritingPracticeView = () => import('../views/writing/WritingPracticeView.vue')
const WritingReportView = () => import('../views/writing/WritingReportView.vue')
const WritingHistoryView = () => import('../views/writing/WritingHistoryView.vue')

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/login',
      name: 'login',
      component: LoginView,
      meta: { requiresAuth: false },
    },
    {
      path: '/register',
      name: 'register',
      component: RegisterView,
      meta: { requiresAuth: false },
    },
    {
      path: '/forgot-password',
      name: 'forgot-password',
      component: ForgotPasswordView,
      meta: { requiresAuth: false },
    },
    {
      path: '/',
      redirect: () => {
        const userStore = useUserStore()
        return userStore.isLoggedIn ? '/dashboard' : '/login'
      },
    },
    {
      path: '/dashboard',
      name: 'home',
      component: HomeView,
      meta: { requiresAuth: true },
    },
    {
      path: '/learning',
      name: 'learning',
      component: LearningView,
      meta: { requiresAuth: true, studyTracked: true },
    },
    {
      path: '/word-books',
      name: 'word-books',
      component: WordBooksView,
      meta: { requiresAuth: true },
    },
    {
      path: '/learned-words',
      name: 'learned-words',
      component: LearnedWordsView,
      meta: { requiresAuth: true },
    },
    {
      path: '/listening',
      redirect: { path: '/learning', query: { tab: 'listening' } },
    },
    {
      path: '/listening/quiz',
      name: 'listening-quiz',
      component: ListeningQuizView,
      meta: { requiresAuth: true, studyTracked: true },
    },
    {
      path: '/translation',
      redirect: { path: '/learning', query: { tab: 'translation' } },
    },
    {
      path: '/translation/practice',
      name: 'translation-practice',
      component: TranslationPracticeView,
      meta: { requiresAuth: true },
    },
    {
      path: '/writing',
      redirect: { path: '/learning', query: { tab: 'writing' } },
    },
    {
      path: '/writing/practice',
      name: 'writing-practice',
      component: WritingPracticeView,
      meta: { requiresAuth: true },
    },
    {
      path: '/writing/report',
      name: 'writing-report',
      component: WritingReportView,
      meta: { requiresAuth: true },
    },
    {
      path: '/writing/history',
      name: 'writing-history',
      component: WritingHistoryView,
      meta: { requiresAuth: true },
    },
    {
      path: '/stats',
      name: 'stats',
      component: StatsView,
      meta: { requiresAuth: true },
    },
    {
      path: '/profile',
      name: 'profile',
      component: ProfileView,
      meta: { requiresAuth: true },
    },
    {
      path: '/settings',
      name: 'settings',
      component: SettingsView,
      meta: { requiresAuth: true },
    },
    {
      path: '/settings/privacy',
      name: 'settings-privacy',
      component: SettingsView,
      meta: { requiresAuth: true },
    },
    {
      path: '/settings/account',
      name: 'settings-account',
      component: SettingsView,
      meta: { requiresAuth: true },
    },
    {
      path: '/settings/notifications',
      name: 'settings-notifications',
      component: SettingsView,
      meta: { requiresAuth: true },
    },
    {
      path: '/assess',
      name: 'assess',
      component: AssessView,
      meta: { requiresAuth: true, studyTracked: true },
    },
    {
      path: '/favorites',
      name: 'favorites',
      component: FavoritesView,
      meta: { requiresAuth: true },
    },
    {
      path: '/error-book',
      name: 'error-book',
      component: ErrorBookView,
      meta: { requiresAuth: true, studyTracked: true },
    },
    {
      path: '/learning/practice',
      name: 'practice',
      component: PracticeView,
      meta: { requiresAuth: true, studyTracked: true },
    },
    {
      path: '/history',
      name: 'history',
      component: HistoryView,
      meta: { requiresAuth: true },
    },
    {
      path: '/vocabulary',
      name: 'vocabulary',
      component: VocabularyView,
      meta: { requiresAuth: true, studyTracked: true },
    },
    {
      path: '/vocab-quiz',
      name: 'vocab-quiz',
      component: VocabQuizView,
      meta: { requiresAuth: true, studyTracked: true },
    },
    {
      path: '/grammar-quiz',
      name: 'grammar-quiz',
      component: GrammarQuizView,
      meta: { requiresAuth: true, studyTracked: true },
    },
    {
      path: '/logout',
      name: 'logout',
      component: LoginView,
      meta: { requiresAuth: true },
      beforeEnter() {
        const userStore = useUserStore()
        userStore.logout()
        return { path: '/login' }
      },
    },
    {
      path: '/403',
      name: 'forbidden',
      component: ForbiddenView,
      meta: { requiresAuth: true },
    },
    {
      path: '/admin',
      component: AdminLayout,
      meta: { requiresAuth: true, requiresAdmin: true },
      children: [
        { path: '', redirect: '/admin/overview' },
        {
          path: 'overview',
          name: 'admin-overview',
          component: AdminOverviewView,
          meta: { requiresAuth: true, requiresAdmin: true, adminTitleKey: 'adminConsole.nav.overview' },
        },
        {
          path: 'users',
          name: 'admin-users',
          component: AdminUsersView,
          meta: { requiresAuth: true, requiresAdmin: true, adminTitleKey: 'adminConsole.nav.users' },
        },
        {
          path: 'users/:id',
          name: 'admin-user-detail',
          component: AdminUserDetailView,
          meta: { requiresAuth: true, requiresAdmin: true, adminTitleKey: 'adminConsole.nav.userDetail' },
        },
        {
          path: 'questions',
          name: 'admin-questions',
          component: AdminQuestionsView,
          meta: { requiresAuth: true, requiresAdmin: true, adminTitleKey: 'adminConsole.nav.questions' },
        },
        {
          path: 'judge-review',
          name: 'admin-judge-review',
          component: AdminJudgeReviewView,
          meta: { requiresAuth: true, requiresAdmin: true, adminTitleKey: 'adminConsole.nav.judgeReview' },
        },
        {
          path: 'notices',
          name: 'admin-notices',
          component: AdminNoticesView,
          meta: { requiresAuth: true, requiresAdmin: true, adminTitleKey: 'adminConsole.nav.notices' },
        },
        {
          path: 'activities',
          name: 'admin-activities',
          component: AdminActivitiesView,
          meta: { requiresAuth: true, requiresAdmin: true, adminTitleKey: 'adminConsole.nav.activities' },
        },
        {
          path: 'operation-logs',
          name: 'admin-operation-logs',
          component: AdminOperationLogsView,
          meta: { requiresAuth: true, requiresAdmin: true, adminTitleKey: 'adminConsole.nav.operationLogs' },
        },
        {
          path: 'logs',
          redirect: '/admin/operation-logs',
        },
      ],
    },
  ],
})

router.beforeEach(async (to, _from, next) => {
  const userStore = useUserStore()

  // 未登录 + 需要登录 → 先尝试静默刷新（用 Cookie 里的 Refresh Token 换回登录态）
  if (to.meta.requiresAuth && !userStore.isLoggedIn) {
    const refreshed = await userStore.refreshAuth()
    if (refreshed) {
      // 刷新成功，放行；若目标需要管理员但刷新出的不是管理员，再走 403
      if (to.meta.requiresAdmin && !userStore.isAdmin) {
        next('/403')
        return
      }
      next()
      return
    }
    // 刷新失败，跳登录
    next({ path: '/login', query: { redirect: to.fullPath } })
    return
  }

  // 管理端：仅 ROLE_ADMIN 可进入
  if (to.meta.requiresAdmin && !userStore.isAdmin) {
    next('/403')
    return
  }

  // 已登录 + 访问公开页面（如 /login、/register）→ 跳到首页
  if (!to.meta.requiresAuth && userStore.isLoggedIn) {
    next({ path: '/dashboard' })
    return
  }

  next()
})

export default router


