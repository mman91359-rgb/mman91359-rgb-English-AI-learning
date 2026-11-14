package com.english.ai.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.english.ai.common.ModuleType;
import com.english.ai.common.RadarDimension;
import com.english.ai.user.entity.UserAbilityRadar;
import com.english.ai.user.entity.UserModuleStats;
import com.english.ai.user.mapper.UserAbilityRadarMapper;
import com.english.ai.user.mapper.UserModuleStatsMapper;
import com.english.ai.user.service.EloCalculator;
import com.english.ai.user.service.PracticePointCalculator;
import com.english.ai.user.service.PracticePointService;
import com.english.ai.user.service.PracticeTitle;
import com.english.ai.user.service.UserAbilityRadarService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserAbilityRadarServiceImpl implements UserAbilityRadarService {

    /** 样本不足的阈值：低于该题数不算正确率，避免新用户一进来就显示 0% */
    private static final int MIN_SAMPLE_SIZE = 5;

    /** 计分准入门槛（百分比） */
    private static final double QUALIFY_ACCURACY = PracticePointCalculator.QUALIFY_ACCURACY;

    private final UserAbilityRadarMapper radarMapper;
    private final UserModuleStatsMapper moduleStatsMapper;
    private final PracticePointService practicePointService;

    @Override
    public void initRadar(Long userId, String targetLevel) {
        UserAbilityRadar exist = getByUserId(userId);
        if (exist != null) {
            log.info("雷达记录已存在: userId={}", userId);
            return;
        }
        UserAbilityRadar radar = new UserAbilityRadar();
        radar.setUserId(userId);
        radar.setVocabularyScore(BigDecimal.ZERO);
        radar.setGrammarScore(BigDecimal.ZERO);
        radar.setListeningScore(BigDecimal.ZERO);
        radar.setReadingScore(BigDecimal.ZERO);
        radar.setTranslationScore(BigDecimal.ZERO);
        radar.setWritingScore(BigDecimal.ZERO);
        radar.setEloScore(1000);
        radar.setPracticePoints(0);
        radar.setTargetLevel(targetLevel);
        radarMapper.insert(radar);
        log.info("初始化雷达记录: userId={}, targetLevel={}, elo=1000", userId, targetLevel);
    }

    @Override
    public UserAbilityRadar getByUserId(Long userId) {
        return radarMapper.selectOne(
                new LambdaQueryWrapper<UserAbilityRadar>()
                        .eq(UserAbilityRadar::getUserId, userId));
    }

    @Override
    public int updateElo(Long userId, int questionDifficulty, boolean isCorrect, boolean isAssess) {
        UserAbilityRadar radar = getOrCreateRadar(userId);
        int oldElo = radar.getEloScore();
        int newElo = isAssess
                ? EloCalculator.calculateAssess(oldElo, questionDifficulty, isCorrect)
                : EloCalculator.calculatePractice(oldElo, questionDifficulty, isCorrect);

        // 只更新 elo_score 一列：整对象 updateById 会把并发累加的 practice_points 覆盖回旧值
        radarMapper.update(null, new UpdateWrapper<UserAbilityRadar>()
                .eq("user_id", userId)
                .set("elo_score", newElo));

        log.info("ELO更新: userId={}, difficulty={}, correct={}, isAssess={}, {}→{}",
                userId, questionDifficulty, isCorrect, isAssess, oldElo, newElo);
        return newElo;
    }

    /**
     * 答题后更新模块维度分。
     *
     * <p>口径已由「答对向 100 靠近、答错衰减 10%」改为「累计正确率」：
     * 答错只会拉大分母、压低正确率，不再发生额外扣分。写作模块由 AI 评分写入，
     * 这里只累加计数、不改写写作维度分。</p>
     */
    @Override
    public void updateModuleScore(Long userId, int moduleType, boolean isCorrect) {
        RadarDimension dimension = ModuleType.radarDimensionOf(moduleType);
        if (dimension == null) {
            // 未知模块没有对应雷达列，只做告警，不写模块分
            log.warn("模块无对应雷达维度，跳过模块分更新: userId={}, moduleType={}", userId, moduleType);
            return;
        }
        practicePointService.recordAnswer(userId, moduleType, isCorrect);
        if (dimension == RadarDimension.WRITING) {
            // 写作无对错二值，维度分由 updateModuleScoreByValue 按评分得分率写入
            return;
        }
        BigDecimal accuracy = accuracyOf(userId, dimension);
        if (accuracy == null) {
            return;
        }
        getOrCreateRadar(userId);
        saveDimensionScore(userId, dimension, accuracy);
        log.info("模块正确率更新: userId={}, moduleType={}, dimension={}, correct={}, accuracy={}%",
                userId, moduleType, dimension, isCorrect, accuracy);
    }

    /**
     * 按百分制得分更新模块维度分（写作专用）。
     *
     * <p>保留移动加权，是因为 AI 作文评分本身是连续分，需要平滑抑制单次评分抖动；
     * 这不是「答错扣分」，得分率变化反映的是评分结果。</p>
     */
    @Override
    public void updateModuleScoreByValue(Long userId, int moduleType, double score0to100) {
        RadarDimension dimension = ModuleType.radarDimensionOf(moduleType);
        if (dimension == null) {
            log.warn("模块无对应雷达维度，跳过模块分更新: userId={}, moduleType={}", userId, moduleType);
            return;
        }
        double target = Math.max(0, Math.min(100, score0to100));
        UserAbilityRadar radar = getOrCreateRadar(userId);
        BigDecimal current = getModuleScore(radar, dimension);
        BigDecimal newScore = movingWeighted(current, target);
        saveDimensionScore(userId, dimension, newScore);
        log.info("模块分更新(按分值): userId={}, moduleType={}, dimension={}, target={}, {}→{}",
                userId, moduleType, dimension, target, current, newScore);
    }

    /**
     * 移动加权：向目标值靠近 10%。
     */
    private BigDecimal movingWeighted(BigDecimal current, double target) {
        double base = current == null ? 0 : current.doubleValue();
        double newVal = base + (target - base) * 0.1;
        newVal = Math.max(0, Math.min(100, newVal));
        return BigDecimal.valueOf(Math.round(newVal * 10) / 10.0);
    }

    private UserAbilityRadar getOrCreateRadar(Long userId) {
        UserAbilityRadar radar = getByUserId(userId);
        if (radar == null) {
            log.warn("雷达记录不存在, 自动创建: userId={}", userId);
            initRadar(userId, "CET4");
            radar = getByUserId(userId);
        }
        return radar;
    }

    /**
     * 只更新单个维度列，避免整对象回写覆盖 practice_points。
     *
     * <p>列名由枚举派生（见 {@link #columnOf}），不接受外部输入，
     * 使用字符串列名而非 Lambda 引用是为了让纯单测无需初始化 MyBatis-Plus 元数据缓存。</p>
     */
    private void saveDimensionScore(Long userId, RadarDimension dimension, BigDecimal score) {
        radarMapper.update(null, new UpdateWrapper<UserAbilityRadar>()
                .eq("user_id", userId)
                .set(columnOf(dimension), score));
    }

    /** 维度对应的数据库列名 */
    private String columnOf(RadarDimension dimension) {
        return switch (dimension) {
            case VOCABULARY -> "vocabulary_score";
            case GRAMMAR -> "grammar_score";
            case LISTENING -> "listening_score";
            case READING -> "reading_score";
            case TRANSLATION -> "translation_score";
            case WRITING -> "writing_score";
        };
    }

    private BigDecimal getModuleScore(UserAbilityRadar radar, RadarDimension dimension) {
        return switch (dimension) {
            case VOCABULARY -> radar.getVocabularyScore();
            case GRAMMAR -> radar.getGrammarScore();
            case LISTENING -> radar.getListeningScore();
            case READING -> radar.getReadingScore();
            case TRANSLATION -> radar.getTranslationScore();
            case WRITING -> radar.getWritingScore();
        };
    }

    /**
     * 维度对应的模块编号集合。语法维度由「语法(2) + 造句(5)」共同贡献，其余一对一。
     */
    private List<Integer> moduleCodesOf(RadarDimension dimension) {
        return Arrays.stream(ModuleType.values())
                .filter(type -> type.getRadarDimension() == dimension)
                .map(ModuleType::getCode)
                .toList();
    }

    /**
     * 计算某维度的累计正确率；样本不足返回 null。
     */
    private BigDecimal accuracyOf(Long userId, RadarDimension dimension) {
        Map<Integer, UserModuleStats> statMap = loadStats(userId);
        Counters counters = sumCounters(statMap, dimension);
        if (counters.total() < MIN_SAMPLE_SIZE) {
            return null;
        }
        return BigDecimal.valueOf(counters.accuracy()).setScale(1, RoundingMode.HALF_UP);
    }

    private Map<Integer, UserModuleStats> loadStats(Long userId) {
        Map<Integer, UserModuleStats> map = new HashMap<>();
        for (UserModuleStats stat : moduleStatsMapper.listByUserId(userId)) {
            map.put(stat.getModuleType(), stat);
        }
        return map;
    }

    private Counters sumCounters(Map<Integer, UserModuleStats> statMap, RadarDimension dimension) {
        int total = 0;
        int correct = 0;
        for (Integer code : moduleCodesOf(dimension)) {
            UserModuleStats stat = statMap.get(code);
            if (stat == null) {
                continue;
            }
            total += stat.getTotalCount() == null ? 0 : stat.getTotalCount();
            correct += stat.getCorrectCount() == null ? 0 : stat.getCorrectCount();
        }
        return new Counters(total, correct);
    }

    @Override
    public Map<String, Object> getRadarData(Long userId) {
        UserAbilityRadar radar = getByUserId(userId);
        if (radar == null) {
            return defaultRadarData();
        }

        Map<String, Object> data = new LinkedHashMap<>();
        data.put("userId", userId);
        // ELO 退为内部隐藏分，仅用于选题难度匹配，不再作为画像页主分数
        data.put("eloScore", radar.getEloScore());
        data.put("eloLevel", eloToLevel(radar.getEloScore()));
        data.put("targetLevel", radar.getTargetLevel());

        // ===== 练习积分与称号 =====
        int points = radar.getPracticePoints() == null ? 0 : radar.getPracticePoints();
        PracticeTitle title = PracticeTitle.of(points);
        data.put("practicePoints", points);
        data.put("practiceTitle", title.getLabel());
        data.put("titleFloor", title.getFloor());
        data.put("titleCeil", title.getCeil());
        data.put("titleProgress", title.progressOf(points));
        data.put("nextTitle", title.isMax() ? null : title.next().getLabel());

        // ===== 六维：正确率口径 =====
        Map<Integer, UserModuleStats> statMap = loadStats(userId);
        double countedSum = 0;
        int countedNum = 0;
        for (RadarDimension dimension : RadarDimension.values()) {
            DimensionView view = buildDimensionView(radar, statMap, dimension);
            fillDimension(data, dimension, view);
            if (view.counted()) {
                countedSum += view.score();
                countedNum++;
            }
        }
        // 综合能力分 = 已达标模块的算术平均；全部未达标时返回 null，前端展示「—」
        data.put("overallAbilityScore", countedNum == 0 ? null
                : BigDecimal.valueOf(countedSum / countedNum).setScale(1, RoundingMode.HALF_UP));

        // 保留 ELO 区间字段，供管理端/调试使用
        int[] range = eloRange(radar.getEloScore());
        data.put("eloFloor", range[0]);
        data.put("eloCeil", range[1]);
        data.put("eloProgress", Math.round((radar.getEloScore() - range[0]) * 100.0 / (range[1] - range[0])));

        return data;
    }

    /**
     * 单个维度的展示视图：写作取 AI 评分得分率，其余取累计正确率。
     */
    private DimensionView buildDimensionView(UserAbilityRadar radar, Map<Integer, UserModuleStats> statMap,
                                             RadarDimension dimension) {
        if (dimension == RadarDimension.WRITING) {
            BigDecimal score = radar.getWritingScore();
            double value = score == null ? 0 : score.doubleValue();
            boolean hasScore = value > 0;
            return new DimensionView(round1(value), 0, 0, hasScore && value >= QUALIFY_ACCURACY, hasScore);
        }
        Counters counters = sumCounters(statMap, dimension);
        if (counters.total() <= 0) {
            return new DimensionView(0, 0, 0, false, false);
        }
        double accuracy = counters.accuracy();
        // 样本不足时展示「—」，但保留真实题数，让用户知道还差几题
        boolean enough = counters.total() >= MIN_SAMPLE_SIZE;
        boolean counted = enough && accuracy >= QUALIFY_ACCURACY;
        return new DimensionView(round1(accuracy), counters.total(), counters.correct(), counted, enough);
    }

    private void fillDimension(Map<String, Object> data, RadarDimension dimension, DimensionView view) {
        String prefix = switch (dimension) {
            case VOCABULARY -> "vocabulary";
            case GRAMMAR -> "grammar";
            case LISTENING -> "listening";
            case READING -> "reading";
            case TRANSLATION -> "translation";
            case WRITING -> "writing";
        };
        data.put(prefix + "Score", view.score());
        data.put(prefix + "Total", view.total());
        data.put(prefix + "Correct", view.correct());
        data.put(prefix + "Counted", view.counted());
        data.put(prefix + "HasData", view.hasData());
        data.put(prefix + "Percent", view.score());
    }

    private double round1(double value) {
        return Math.round(value * 10) / 10.0;
    }

    private Map<String, Object> defaultRadarData() {
        Map<String, Object> data = new LinkedHashMap<>();
        data.put("eloScore", 1000);
        data.put("eloLevel", "初心者");
        data.put("practicePoints", 0);
        data.put("practiceTitle", PracticeTitle.BEGINNER.getLabel());
        data.put("titleFloor", PracticeTitle.BEGINNER.getFloor());
        data.put("titleCeil", PracticeTitle.BEGINNER.getCeil());
        data.put("titleProgress", 0);
        data.put("nextTitle", PracticeTitle.BEGINNER.next().getLabel());
        data.put("overallAbilityScore", null);
        for (String prefix : new String[]{"vocabulary", "grammar", "listening", "reading", "translation", "writing"}) {
            data.put(prefix + "Score", 0);
            data.put(prefix + "Total", 0);
            data.put(prefix + "Correct", 0);
            data.put(prefix + "Counted", false);
            data.put(prefix + "HasData", false);
            data.put(prefix + "Percent", 0);
        }
        data.put("eloFloor", 0);
        data.put("eloCeil", 1250);
        data.put("eloProgress", 80);
        return data;
    }

    /** ELO分→等级名称（内部隐藏分分档，画像页不再展示） */
    private String eloToLevel(int elo) {
        if (elo >= 2000) return "宗师";
        if (elo >= 1750) return "大师";
        if (elo >= 1500) return "高手";
        if (elo >= 1250) return "进阶";
        if (elo >= 1000) return "入门";
        return "初心者";
    }

    /** ELO分所在等级区间 */
    private int[] eloRange(int elo) {
        if (elo >= 2000) return new int[]{2000, 2500};
        if (elo >= 1750) return new int[]{1750, 2000};
        if (elo >= 1500) return new int[]{1500, 1750};
        if (elo >= 1250) return new int[]{1250, 1500};
        if (elo >= 1000) return new int[]{1000, 1250};
        return new int[]{0, 1000};
    }

    /** 答题计数（总题数 / 答对数） */
    private record Counters(int total, int correct) {
        double accuracy() {
            return total <= 0 ? 0 : Math.round(correct * 1000.0 / total) / 10.0;
        }
    }

    /** 单维度展示数据 */
    private record DimensionView(double score, int total, int correct, boolean counted, boolean hasData) {
    }
}
