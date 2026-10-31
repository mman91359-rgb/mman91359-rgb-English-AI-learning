package com.english.ai.user.service;

import com.english.ai.common.BusinessException;
import com.english.ai.user.config.AdminContext;
import com.english.ai.user.dto.admin.NoticeRequest;
import com.english.ai.user.entity.SysNotice;
import com.english.ai.user.mapper.SysNoticeMapper;
import com.english.ai.user.mapper.UserMapper;
import com.english.ai.user.service.impl.AdminNoticeServiceImpl;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.io.Serializable;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class AdminNoticeServiceImplTest {

    @Mock
    private SysNoticeMapper noticeMapper;
    @Mock
    private UserMapper userMapper;
    @Mock
    private AdminAuditService auditService;

    private AdminNoticeServiceImpl service;

    @BeforeEach
    void setUp() {
        service = new AdminNoticeServiceImpl(noticeMapper, userMapper, auditService);
        AdminContext.set(1L, "admin", "127.0.0.1");
    }

    @AfterEach
    void tearDown() {
        AdminContext.clear();
    }

    @Test
    void cannotEditPublishedNotice() {
        when(noticeMapper.selectById(1L)).thenReturn(notice("PUBLISHED"));
        assertThrows(BusinessException.class, () -> service.update(1L, request()));
        verify(noticeMapper, never()).updateById(any());
    }

    @Test
    void cannotDeletePublishedNotice() {
        when(noticeMapper.selectById(1L)).thenReturn(notice("PUBLISHED"));
        assertThrows(BusinessException.class, () -> service.delete(1L));
        verify(noticeMapper, never()).deleteById(any(Serializable.class));
    }

    @Test
    void publishDraftSetsStatusAndPublishTime() {
        SysNotice notice = notice("DRAFT");
        when(noticeMapper.selectById(1L)).thenReturn(notice);

        service.publish(1L);

        assertEquals("PUBLISHED", notice.getStatus());
        assertNotNull(notice.getPublishAt());
        verify(noticeMapper).updateById(notice);
    }

    private SysNotice notice(String status) {
        SysNotice notice = new SysNotice();
        notice.setId(1L);
        notice.setTitle("通知");
        notice.setContent("内容");
        notice.setNoticeType("SYSTEM");
        notice.setTargetAudience("ALL");
        notice.setStatus(status);
        notice.setCreatedBy(1L);
        return notice;
    }

    private NoticeRequest request() {
        NoticeRequest request = new NoticeRequest();
        request.setTitle("通知");
        request.setContent("内容");
        request.setNoticeType("SYSTEM");
        request.setTargetAudience("ALL");
        return request;
    }
}
