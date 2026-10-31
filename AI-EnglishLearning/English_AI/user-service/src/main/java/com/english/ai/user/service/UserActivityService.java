package com.english.ai.user.service;

import com.english.ai.common.PageResult;
import com.english.ai.user.dto.admin.UserActivityVO;

public interface UserActivityService {

    PageResult<UserActivityVO> page(Long userId, int page, int size);

    UserActivityVO get(Long userId, Long id);
}
