package com.english.ai.user.controller;

import com.english.ai.common.Result;
import com.english.ai.user.dto.admin.AdminOverviewVO;
import com.english.ai.user.service.AdminOverviewService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminOverviewController {

    private final AdminOverviewService overviewService;

    @GetMapping("/overview")
    public Result<AdminOverviewVO> overview() {
        return Result.success(overviewService.overview());
    }
}
