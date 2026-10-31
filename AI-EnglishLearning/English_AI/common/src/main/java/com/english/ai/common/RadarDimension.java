package com.english.ai.common;

/**
 * 能力雷达维度。
 * 与 user_ability_radar 表的四个分数列一一对应，避免各服务各自解释 module_type。
 */
public enum RadarDimension {
    VOCABULARY,
    GRAMMAR,
    LISTENING,
    READING
}
