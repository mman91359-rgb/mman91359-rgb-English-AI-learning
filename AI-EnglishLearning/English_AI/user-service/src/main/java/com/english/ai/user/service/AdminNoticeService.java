package com.english.ai.user.service;

import com.english.ai.common.PageResult;
import com.english.ai.user.dto.admin.NoticeQuery;
import com.english.ai.user.dto.admin.NoticeRequest;
import com.english.ai.user.dto.admin.NoticeVO;

public interface AdminNoticeService {

    PageResult<NoticeVO> page(NoticeQuery query);

    NoticeVO get(Long id);

    Long create(NoticeRequest request);

    NoticeVO update(Long id, NoticeRequest request);

    NoticeVO publish(Long id);

    NoticeVO expire(Long id);

    void delete(Long id);
}
