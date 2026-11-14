package com.english.ai.user.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.user.entity.UserRefreshToken;
import com.english.ai.user.mapper.UserRefreshTokenMapper;
import com.english.ai.user.util.RefreshTokenUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * 记住我 Refresh Token 服务。
 *
 * <p>核心安全点：token 复用检测 —— 已轮换（status=0）的 token 再次出现，
 * 说明令牌泄漏，立即吊销该 series 全部会话。</p>
 *
 * <p>刷新限流：单实例内存限流（未引入 Redis）。按「IP + 用户」粗粒度计数，
 * 配合 token_hash 唯一索引 + 复用检测兜底，足以覆盖常规暴力枚举场景。</p>
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class RefreshTokenService {

    private final UserRefreshTokenMapper refreshTokenMapper;

    /** 有效期（秒），默认 7 天 */
    @Value("${auth.refresh.max-age-seconds:604800}")
    private long maxAgeSeconds;

    /** 刷新限流：同一 key 每分钟最大次数 */
    @Value("${auth.refresh.rate-limit:10}")
    private int rateLimit;

    /** 单实例内存限流计数器（key -> 一分钟内计数），后续多实例可替换为分布式限流 */
    private final ConcurrentHashMap<String, AtomicInteger> rateCounter = new ConcurrentHashMap<>();
    private final ConcurrentHashMap<String, Long> rateWindowStart = new ConcurrentHashMap<>();

    /**
     * 登录时签发：rememberMe=true 才调用。
     *
     * @return 明文 Refresh Token（用于下发 Cookie）
     */
    @Transactional
    public String issue(Long userId) {
        String raw = RefreshTokenUtil.generate();
        String series = RefreshTokenUtil.newSeries();

        UserRefreshToken entity = new UserRefreshToken();
        entity.setUserId(userId);
        entity.setTokenHash(RefreshTokenUtil.sha256(raw));
        entity.setSeries(series);
        entity.setExpiresAt(LocalDateTime.now().plusSeconds(maxAgeSeconds));
        entity.setStatus(1);
        refreshTokenMapper.insert(entity);
        return raw;
    }

    /**
     * 刷新：校验 + 轮换 + 复用检测。
     *
     * @param rawToken Cookie 里的明文 token
     * @return 新的明文 Refresh Token；null 表示需要重新登录（校验失败/已吊销/复用）
     */
    @Transactional
    public String rotate(String rawToken) {
        String hash = RefreshTokenUtil.sha256(rawToken);
        UserRefreshToken existing = refreshTokenMapper.selectOne(
                new LambdaQueryWrapper<UserRefreshToken>()
                        .eq(UserRefreshToken::getTokenHash, hash));

        if (existing == null) {
            // 库里没有：伪造或明文被篡改，直接拒绝
            return null;
        }

        // 复用检测：token 已被吊销（轮换过或主动吊销），却再次被提交 → 泄漏，吊销整条系列
        if (existing.getStatus() == 0) {
            log.warn("检测到 Refresh Token 复用，吊销整条系列: userId={}, series={}",
                    existing.getUserId(), existing.getSeries());
            refreshTokenMapper.revokeAllBySeries(existing.getSeries());
            return null;
        }

        // 过期校验
        if (existing.getExpiresAt() != null && existing.getExpiresAt().isBefore(LocalDateTime.now())) {
            return null;
        }

        // 轮换：旧 token 作废（标记为已轮换），生成新 token 入库，series 不变
        existing.setStatus(0);
        existing.setRevokedAt(LocalDateTime.now());
        refreshTokenMapper.updateById(existing);

        String newRaw = RefreshTokenUtil.generate();
        UserRefreshToken next = new UserRefreshToken();
        next.setUserId(existing.getUserId());
        next.setTokenHash(RefreshTokenUtil.sha256(newRaw));
        next.setSeries(existing.getSeries());
        next.setExpiresAt(LocalDateTime.now().plusSeconds(maxAgeSeconds));
        next.setStatus(1);
        next.setLastUsedAt(LocalDateTime.now());
        refreshTokenMapper.insert(next);
        return newRaw;
    }

    /**
     * 按明文 token 反查 userId（哈希后查库），供刷新接口做越权前置校验与限流 key 计算。
     */
    public Long findUserIdByToken(String rawToken) {
        String hash = RefreshTokenUtil.sha256(rawToken);
        UserRefreshToken entity = refreshTokenMapper.selectOne(
                new LambdaQueryWrapper<UserRefreshToken>()
                        .eq(UserRefreshToken::getTokenHash, hash));
        return entity == null ? null : entity.getUserId();
    }

    /**
     * 登出：吊销当前 token。
     */
    public void revokeByToken(String rawToken) {
        String hash = RefreshTokenUtil.sha256(rawToken);
        UserRefreshToken existing = refreshTokenMapper.selectOne(
                new LambdaQueryWrapper<UserRefreshToken>()
                        .eq(UserRefreshToken::getTokenHash, hash));
        if (existing != null && existing.getStatus() == 1) {
            existing.setStatus(0);
            existing.setRevokedAt(LocalDateTime.now());
            refreshTokenMapper.updateById(existing);
        }
    }

    /**
     * 吊销某用户全部 Refresh Token（改密码、冻结账号时调用）。
     */
    public void revokeAllByUserId(Long userId) {
        refreshTokenMapper.revokeAllByUserId(userId);
    }

    /**
     * 单实例内存限流：同一 key 每分钟最多 rateLimit 次。
     *
     * @return true 表示放行，false 表示超限
     */
    public boolean tryAcquire(String key) {
        long now = System.currentTimeMillis();
        long windowStart = rateWindowStart.getOrDefault(key, 0L);
        if (now - windowStart > 60_000L) {
            // 新窗口，重置
            rateWindowStart.put(key, now);
            rateCounter.put(key, new AtomicInteger(1));
            return true;
        }
        int count = rateCounter.computeIfAbsent(key, k -> new AtomicInteger(0)).incrementAndGet();
        return count <= rateLimit;
    }
}
