package com.english.ai.user.service;

import com.english.ai.common.PageResult;
import com.english.ai.user.dto.admin.ActivityQuery;
import com.english.ai.user.dto.admin.ActivityRequest;
import com.english.ai.user.dto.admin.ActivityVO;

public interface AdminActivityService {

    PageResult<ActivityVO> page(ActivityQuery query);

    ActivityVO get(Long id);

    Long create(ActivityRequest request);

    ActivityVO update(Long id, ActivityRequest request);

    ActivityVO publish(Long id);

    ActivityVO end(Long id);

    void delete(Long id);
}
