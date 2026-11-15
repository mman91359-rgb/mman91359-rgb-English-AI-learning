package com.english.ai.exercise.constant;

import java.util.List;
import java.util.Set;

/**
 * 用户词汇库学习状态契约。
 *
 * <p>状态枚举只有四个，取值与 {@code user_vocabulary.status} 列一一对应。
 * 「标熟」（FAMILIAR）是用户唯一可操作的排除动作：标熟即退出新词池与复习队列，
 * 但仍计入已学词库——这是它与「未学习」的根本差别。</p>
 *
 * <p>历史说明：早先版本还有一个 {@code IGNORE}（忽略）状态，语义是「这个词我不学」，
 * 不计入已学。2026-11-15 产品确认「只有标熟，没有忽略」，两者合并，
 * {@code IGNORE} 就地重命名为 {@code FAMILIAR}（迁移 V1.0.54）。
 * 合并时存量核查：user_vocabulary 中 status='IGNORE' 为 0 行，事件表 IGNORE 事件 0 条。</p>
 *
 * <p>本类是后端唯一事实来源，前端 {@code config/modules.ts} 之外的词汇状态映射
 * （{@code api/exercise.ts} 的 LearnedWordVO、WordBooksView 的标签）必须与此处一致。</p>
 */
public final class VocabularyStatus {

    /** 学习中：刚学会，还没进入复习节奏 */
    public static final String LEARNING = "LEARNING";

    /** 复习中：进入艾宾浩斯复习计划 */
    public static final String REVIEWING = "REVIEWING";

    /** 复习完成：系统判定已掌握（is_mastered=1） */
    public static final String MASTERED = "MASTERED";

    /** 已标熟：用户手动标记，从此不再复习，但计入已学 */
    public static final String FAMILIAR = "FAMILIAR";

    /** 页面上「复习中」合并展示的两个状态 */
    public static final List<String> IN_REVIEW = List.of(LEARNING, REVIEWING);

    /** 全部状态 */
    public static final Set<String> ALL = Set.of(LEARNING, REVIEWING, MASTERED, FAMILIAR);

    /**
     * 「已学词库」按日期分组的分组键表达式。
     *
     * <p>复习中按首次学习日、复习完成按达成已掌握的时间、已标熟按标熟的时间，
     * 三个语义各按自己的达成时刻归组。数据库 datetime 无时区，
     * 分组在 SQL 层用 DATE() 截断，前端不得再对返回值做时区二次转换。</p>
     */
    public static final String GROUP_DATE_EXPR =
            "COALESCE(mastered_at, familiar_at, first_learned_at)";

    private VocabularyStatus() {
    }
}
