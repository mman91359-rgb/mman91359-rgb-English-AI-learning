package com.english.ai.user.service;

/**
 * 练习积分称号（五段位）。
 *
 * <p>段位区间上限即积分总上限 10000，跨度递进（1000/1500/2000/2500/3000），
 * 让前期反馈密集、后期留存拉长，避免称号快速贬值。</p>
 */
public enum PracticeTitle {

    /** 0 ~ 999 */
    BEGINNER("初心者", 0, 999),
    /** 1000 ~ 2499 */
    FOUNDATION("筑基者", 1000, 2499),
    /** 2500 ~ 4499 */
    THROUGH("贯通者", 2500, 4499),
    /** 4500 ~ 6999 */
    PROFICIENT("精熟者", 4500, 6999),
    /** 7000 ~ 10000（封顶） */
    PEAK("登峰者", 7000, PracticePointCalculator.MAX_POINTS);

    private final String label;
    private final int floor;
    private final int ceil;

    PracticeTitle(String label, int floor, int ceil) {
        this.label = label;
        this.floor = floor;
        this.ceil = ceil;
    }

    /**
     * 按积分定位称号；负数按 0 处理，超过上限按最高段位处理。
     */
    public static PracticeTitle of(int points) {
        int safe = Math.max(0, points);
        for (PracticeTitle title : values()) {
            if (safe <= title.ceil) {
                return title;
            }
        }
        return PEAK;
    }

    /** 下一段位；已封顶返回自身 */
    public PracticeTitle next() {
        int index = ordinal() + 1;
        return index < values().length ? values()[index] : this;
    }

    /** 是否已封顶 */
    public boolean isMax() {
        return this == PEAK;
    }

    /** 当前段位内的进度百分比（0~100），已封顶固定 100 */
    public int progressOf(int points) {
        if (isMax() && points >= ceil) {
            return 100;
        }
        int span = ceil - floor;
        if (span <= 0) {
            return 100;
        }
        int offset = Math.max(0, Math.min(span, points - floor));
        return Math.round(offset * 100.0f / span);
    }

    public String getLabel() {
        return label;
    }

    public int getFloor() {
        return floor;
    }

    public int getCeil() {
        return ceil;
    }
}
