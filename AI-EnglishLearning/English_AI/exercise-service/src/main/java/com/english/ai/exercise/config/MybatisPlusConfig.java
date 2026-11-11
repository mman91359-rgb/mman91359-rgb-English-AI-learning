package com.english.ai.exercise.config;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * MyBatis-Plus 配置。
 *
 * <p>MyBatis-Plus 的 {@code selectPage} 分页依赖分页拦截器：不注册时既不生成 LIMIT
 * 也不发 COUNT，导致 {@code Page.getTotal()} 恒为 0、行却整批返回。本服务此前没有分页
 * 需求，故一直未注册；判题复核后台列表首次引入分页，因此补上。</p>
 */
@Configuration
public class MybatisPlusConfig {

    /**
     * 分页拦截器。上限 100 条，挡掉 ?size=100000 一类的超大批量请求。
     */
    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
        PaginationInnerInterceptor pagination = new PaginationInnerInterceptor(DbType.MYSQL);
        pagination.setMaxLimit(100L);
        interceptor.addInnerInterceptor(pagination);
        return interceptor;
    }
}
