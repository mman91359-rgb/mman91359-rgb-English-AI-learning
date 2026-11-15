package com.english.ai.user.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.english.ai.user.entity.SmsVerificationCode;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.time.LocalDateTime;

/**
 * 验证码记录 Mapper。
 * 消费与限频都用条件 UPDATE 保证并发下不会被重复使用。
 */
public interface SmsVerificationCodeMapper extends BaseMapper<SmsVerificationCode> {

    /** 原子消费：仅当仍未使用时才置为已使用，返回 0 表示并发下已被消费 */
    @Update("UPDATE sms_verification_code SET used = 1 WHERE id = #{id} AND used = 0")
    int consume(@Param("id") Long id);

    /** 重新发码前作废同一接收地址、同一场景下的所有未使用记录 */
    @Update("UPDATE sms_verification_code SET used = 1 " +
            "WHERE recipient = #{recipient} AND scene = #{scene} AND used = 0")
    int invalidateUnused(@Param("recipient") String recipient, @Param("scene") String scene);

    /** 失败次数累加 */
    @Update("UPDATE sms_verification_code SET try_count = try_count + 1 WHERE id = #{id}")
    int increaseTryCount(@Param("id") Long id);

    /** 作废单条记录（过期或失败次数达上限） */
    @Update("UPDATE sms_verification_code SET used = 1 WHERE id = #{id}")
    int invalidateById(@Param("id") Long id);

    /** 惰性清理：仅删除指定时间之前的历史验证码记录，不触碰任何业务表 */
    @Delete("DELETE FROM sms_verification_code WHERE created_at < #{before}")
    int deleteHistoryBefore(@Param("before") LocalDateTime before);
}
