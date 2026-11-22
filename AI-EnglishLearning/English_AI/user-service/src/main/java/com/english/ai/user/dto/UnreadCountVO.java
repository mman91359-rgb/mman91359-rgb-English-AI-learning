package com.english.ai.user.dto;

import lombok.Data;

/**
 * 红点未读汇总（需求文档 §7.1 方案 3）。
 * <p>
 * 公告线与个人通知线合并成一个数字来源：前端只读 total，不再发两次请求自行相加。
 * notice / personal 保留是为了排查时能看清是哪条线在涨。
 */
@Data
public class UnreadCountVO {

    /** 公告未读数（sys_notice 中该用户未读的条数） */
    private long notice;

    /** 个人通知未读数（notification 中 is_read=0 的条数） */
    private long personal;

    /** 合计，前端红点直接用它 */
    private long total;
}
