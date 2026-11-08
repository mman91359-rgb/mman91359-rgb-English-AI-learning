import { School, Home, BookOpen, Languages, Headphones, SpellCheck, LayoutGrid, PenLine } from "lucide-react";
import { AdminApp } from "@/admin/AdminApp";
import { WritingApp } from "@/writing/WritingApp";

type PageLink = {
  title: string;
  desc: string;
  href: string;
  icon: typeof Home;
  accent: string;
};

const pages: PageLink[] = [
  {
    title: "首页 Dashboard",
    desc: "欢迎页、每日目标进度环、学习连续天数、本周学习量图表与快捷入口。",
    href: "/src/pages/index.html",
    icon: Home,
    accent: "from-[#67558c] to-[#d2bcfb]",
  },
  {
    title: "学习中心",
    desc: "模块导航入口，包含词汇、语法、翻译、听力、造句五大模块切换与功能卡片。",
    href: "/src/pages/leaning_center.html",
    icon: LayoutGrid,
    accent: "from-[#0c6780] to-[#89d0ed]",
  },
  {
    title: "词汇学习界面（拖拽）",
    desc: "拖拽词块组句做题界面，带词库区、答案区与进度条。",
    href: "/src/pages/词汇学习界面（可拖拽优化）.html",
    icon: SpellCheck,
    accent: "from-[#006e20] to-[#77dc7a]",
  },
  {
    title: "词汇学习界面（AI 反馈）",
    desc: "填空做题界面，带顶部进度条与 AI 错误反馈卡片。",
    href: "/src/pages/词汇学习界面（带ai反馈）.html",
    icon: BookOpen,
    accent: "from-[#67558c] to-[#d2bcfb]",
  },
  {
    title: "翻译模块入口",
    desc: "翻译模块首页，含每日目标卡片与收藏、错题集、学习历史等入口。",
    href: "/src/pages/翻译模块入口.html",
    icon: Languages,
    accent: "from-[#0c6780] to-[#89d0ed]",
  },
  {
    title: "翻译做题界面",
    desc: "左右分栏布局：左侧中文句意+英文填空，右侧单状态 AI 反馈卡片。",
    href: "/src/pages/翻译做题界面.html",
    icon: Languages,
    accent: "from-[#0c6780] to-[#89d0ed]",
  },
  {
    title: "听力模块入口",
    desc: "听力模块首页，含每日目标卡片与收藏、错题集、听力历史等入口。",
    href: "/src/pages/听力模块入口.html",
    icon: Headphones,
    accent: "from-[#006e20] to-[#77dc7a]",
  },
  {
    title: "听力做题界面",
    desc: "左右分栏布局：左侧静态波形音频+英文填空，右侧单状态 AI 反馈卡片。",
    href: "/src/pages/听力做题界面.html",
    icon: Headphones,
    accent: "from-[#006e20] to-[#77dc7a]",
  },
  {
    title: "写作训练",
    desc: "写作题库、限时练习、五维评分报告与历史记录，支持草稿自动保存和收藏题目。",
    href: "/writing",
    icon: PenLine,
    accent: "from-[#0c6780] to-[#89d0ed]",
  },
];

function App() {
  if (window.location.pathname.startsWith("/admin")) {
    return <AdminApp />;
  }
  if (window.location.pathname.startsWith("/writing")) {
    return <WritingApp />;
  }
  return (
    <div className="min-h-screen bg-[#f8f9fc] text-[#191c1e]">
      {/* Top bar */}
      <header className="sticky top-0 z-40 bg-[#f8f9fc]/80 backdrop-blur-md border-b border-[#cbc4d0]/30">
        <div className="max-w-[1200px] mx-auto px-6 h-20 flex items-center gap-3">
          <span className="w-10 h-10 rounded-full bg-[#67558c]/15 flex items-center justify-center text-[#67558c]">
            <School size={22} />
          </span>
          <span className="text-2xl font-bold text-[#67558c]">Recall-睿考</span>
          <span className="ml-3 text-sm text-[#49454f]">页面预览导航</span>
        </div>
      </header>

      {/* Content */}
      <main className="max-w-[1200px] mx-auto px-6 py-10">
        <div className="mb-8">
          <h1 className="text-3xl font-semibold text-[#191c1e] mb-2">页面总览</h1>
          <p className="text-base text-[#49454f]">
            点击任意卡片进入对应的静态设计页面。所有页面遵循 Epop 设计系统，纯 HTML + Tailwind CSS。
          </p>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          {pages.map((p) => {
            const Icon = p.icon;
            return (
              <a
                key={p.href}
                href={p.href}
                className="group bg-white rounded-[24px] p-6 shadow-[0_4px_20px_rgba(51,58,72,0.05)] border border-[#cbc4d0]/20 hover:border-[#67558c]/30 hover:shadow-[0_8px_28px_rgba(103,85,140,0.12)] transition-all"
              >
                <div
                  className={`w-12 h-12 rounded-2xl bg-gradient-to-br ${p.accent} text-white flex items-center justify-center mb-4 group-hover:scale-110 transition-transform`}
                >
                  <Icon size={24} />
                </div>
                <h2 className="text-lg font-semibold text-[#191c1e] mb-1.5">{p.title}</h2>
                <p className="text-sm text-[#49454f] leading-relaxed">{p.desc}</p>
                <div className="mt-4 inline-flex items-center gap-1 text-sm font-medium text-[#67558c] group-hover:gap-2 transition-all">
                  打开页面
                </div>
              </a>
            );
          })}
        </div>
      </main>

      <footer className="max-w-[1200px] mx-auto px-6 py-8 text-center text-sm text-[#7a757f]">
        Recall-睿考 · Epop 英语学习 · 静态设计稿预览
      </footer>
    </div>
  );
}

export default App;
