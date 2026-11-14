package com.english.ai.user.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.english.ai.user.entity.UserRefreshToken;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface UserRefreshTokenMapper extends BaseMapper<UserRefreshToken> {

    /**
     * 吊销某用户所有 Refresh Token（改密码、冻结账号时调用）。
     * 只处理仍有效的记录，幂等。
     */
    @Update("UPDATE `user_refresh_token` SET `status` = 0, `revoked_at` = NOW() "
            + "WHERE `user_id` = #{userId} AND `status` = 1")
    int revokeAllByUserId(@Param("userId") Long userId);

    /**
     * 吊销同 series 下所有 token（检测到 token 复用时调用）。
     */
    @Update("UPDATE `user_refresh_token` SET `status` = 0, `revoked_at` = NOW() "
            + "WHERE `series` = #{series} AND `status` = 1")
    int revokeAllBySeries(@Param("series") String series);
}
