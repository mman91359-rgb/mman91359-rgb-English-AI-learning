# Recall·睿考 管理员端 API 契约（V1）

**基座**：`/admin/**`（前端请求 `/api/admin/**`，Vite/Nginx 会剥掉 `/api`）
**鉴权**：`Authorization: Bearer <JWT>`；JWT 必须含 `ROLE_ADMIN`。网关校验后注入可信头
`X-User-Id`、`X-Username`、`X-User-Role`、`X-Gateway-Token`；客户端自带的同名头会被网关剥离。
**响应**：`{ code, message, data, traceId }`
**分页**：`{ records, total, page, size }`；`page >= 1`，`size` 默认 20，最大 100。
**错误码**：400 参数错误、401 未登录、403 无权限、404 不存在、409 状态冲突、500 系统异常。

---

## 1. 概览

### GET `/admin/overview`

返回：

```json
{
  "generatedAt": "2026-10-31 12:00:00",
  "exerciseDegraded": false,
  "totalUsers": 100,
  "enabledUsers": 96,
  "disabledUsers": 4,
  "newUsersToday": 3,
  "newUsers7d": 20,
  "adminUsers": 1,
  "totalCoinBalance": 12345,
  "todayCheckIns": 18,
  "activeNotices": 2,
  "activeActivities": 1,
  "exercise": {
    "questionTotal": 500,
    "pendingReview": 8,
    "approvedTotal": 460,
    "rejectedTotal": 32,
    "answeredLast30d": 12000,
    "todayAnswered": 300,
    "activeUsersToday": 45,
    "activeUsers7d": 80,
    "totalStudySeconds": 360000,
    "dataWindowDays": 30
  }
}
```

`exerciseDegraded=true` 时 `exercise` 为零值，HTTP 仍为 200。

---

## 2. 用户管理

### GET `/admin/users`

Query：`keyword, role, status, cetLevel, startDate, endDate, page, size`

`records[]` 字段：

```
id, username, nickname, avatarUrl, cetLevel, phoneMasked,
roles, status, lastLoginAt, createdAt, eloScore, coinBalance
```

### GET `/admin/users/{id}`

返回 `{ user, radar, coin, preference, stats }`；`stats` 可能为 `null`（exercise-service 不可用）。

### PUT `/admin/users/{id}/status`

Body：`{ "status": 0 | 1 }`

规则：不能禁用自己；目标不存在 404。

### PUT `/admin/users/{id}/role`

Body：`{ "role": "ROLE_USER" | "ROLE_ADMIN" }`

规则：不能修改自己的角色；必须至少保留一个启用状态的管理员，否则 409。

### POST `/admin/users/{id}/reset-password`

无请求体。返回：

```json
{ "userId": 6, "temporaryPassword": "Ab3xY9kLm2Qp" }
```

临时密码只在本次响应返回一次；服务端 BCrypt 入库；审计只记录“已重置”，不记录密码。

### PUT `/admin/users/{id}/password`

管理员直接设置指定用户的新密码（不要求旧密码）：

```json
{ "password": "NewPass123" }
```

规则：密码长度 6–72 位；服务端 BCrypt(work factor 12) 入库；审计动作 `USER_PASSWORD_SET`，只记录用户名，不记录密码。目标不存在返回 404。

### 用户端：POST `/user/forgot-password/reset`（本地模拟）

```json
{ "phone": "13912345678", "code": "123456", "newPassword": "NewPass123" }
```

- 当前为本地模拟验证码：固定 `123456`；仅在非 `prod` profile 可用，生产 profile 返回 400。
- 按手机号查找 `sys_user`，必须恰好匹配一个启用账号；0 条返回 400，多条返回 409。
- 成功后用 BCrypt 更新密码；不返回密码。
- 网关白名单包含 `/user/forgot-password`。

---

## 3. 通知管理

### GET `/admin/notices`

Query：`status, noticeType, targetAudience, keyword, page, size`

字段：

```
id, title, content, noticeType, targetAudience, status,
publishAt, expireAt, createdBy, createdByName, createdAt, updatedAt
```

### GET `/admin/notices/{id}`

### POST `/admin/notices`

```json
{
  "title": "国庆学习活动",
  "content": "活动期间完成每日目标可获得额外奖励。",
  "noticeType": "ACTIVITY",
  "targetAudience": "ALL",
  "publishAt": "2026-10-01 00:00:00",
  "expireAt": "2026-10-07 23:59:59"
}
```

### PUT `/admin/notices/{id}`

仅 `DRAFT` 可编辑；`PUBLISHED`/`EXPIRED` 返回 409。

### POST `/admin/notices/{id}/publish`

`DRAFT -> PUBLISHED`；`publishAt` 为空或已过则设为当前时间；`expireAt <= now` 返回 400。

### POST `/admin/notices/{id}/expire`

`PUBLISHED -> EXPIRED`。

### DELETE `/admin/notices/{id}`

仅 `DRAFT` 可删除；其他状态 409。

### 用户端通知

- `GET /user/notices?page=&size=`：当前登录用户可见通知，含 `read`
- `GET /user/notices/unread-count`
- `PUT /user/notices/{id}/read`
- `PUT /user/notices/read-all`

可见条件：`PUBLISHED` + `publish_at <= now` + (`expire_at` 为空或 > now) + `target_audience in (ALL, 用户 cet_level)`。

---

## 4. 活动管理

### GET `/admin/activities`

Query：`status, activityType, targetAudience, keyword, page, size`

字段：

```
id, title, summary, content, bannerUrl, activityType, targetAudience,
status, startAt, endAt, sortOrder, createdBy, createdAt, updatedAt
```

### GET `/admin/activities/{id}`

### POST `/admin/activities`

```json
{
  "title": "每日打卡挑战",
  "summary": "连续学习 7 天，养成好习惯",
  "content": "活动详情……",
  "bannerUrl": "/images/activity-banner.png",
  "activityType": "BANNER",
  "targetAudience": "CET4",
  "startAt": "2026-11-01 00:00:00",
  "endAt": "2026-11-07 23:59:59",
  "sortOrder": 10
}
```

### PUT `/admin/activities/{id}`

仅 `DRAFT` 可编辑。

### POST `/admin/activities/{id}/publish`

`DRAFT -> PUBLISHED`；要求 `startAt < endAt` 且 `endAt > now`。

### POST `/admin/activities/{id}/end`

`PUBLISHED -> ENDED`。

### DELETE `/admin/activities/{id}`

仅 `DRAFT` 可删除。

### 用户端活动

- `GET /user/activities?page=&size=`
- `GET /user/activities/{id}`

可见条件：`PUBLISHED` + `start_at <= now` + `end_at > now` + 目标人群匹配；按 `sort_order DESC, start_at DESC`。

---

## 5. 操作日志

### GET `/admin/operation-logs`

Query：`operatorId, action, targetType, result, startTime, endTime, page, size`

字段：

```
id, operatorId, operatorName, action, targetType, targetId,
detail, ip, userAgent, result, traceId, createdAt
```

只读，不提供编辑/删除。

内部写入（exercise-service → user-service）：

`POST /internal/admin/operation-logs`，`X-Internal-Token` 鉴权。

---

## 6. 题目审核

### GET `/admin/questions`

Query：`status=PENDING, moduleType, targetLevel, keyword, page, size`

`status` 只允许 `PENDING/APPROVED/REJECTED`，默认 `PENDING`。

### POST `/admin/questions/{id}/approve`

无请求体；审核人取 `X-User-Id`。仅 `PENDING` 可操作；重复/并发审核返回 409。

### POST `/admin/questions/{id}/reject`

Body：`{ "comment": "题干表述不清" }`

仅 `PENDING`；意见必填。

### POST `/admin/questions/generate`

Body：`{ "knowledgePoint": "虚拟语气", "cetLevel": "CET4", "difficulty": 3, "questionType": "FILL_BLANK", "count": 5 }`

`count` 限制 1..20；AI 返回空时 `savedCount=0`。

### 学习统计（可选直连）

`GET /admin/learning-stats/overview` 返回 `ExerciseOverviewVO`；
内部接口 `GET /internal/admin/overview`、`GET /internal/admin/user-stats/{userId}` 由 user-service 聚合调用。

---

## 7. 枚举

| 枚举 | 值 |
|---|---|
| 用户状态 | 1 正常 / 0 禁用 |
| 角色 | ROLE_USER / ROLE_ADMIN |
| 通知状态 | DRAFT / PUBLISHED / EXPIRED |
| 通知类型 | SYSTEM / REMINDER / ACTIVITY |
| 活动状态 | DRAFT / PUBLISHED / ENDED |
| 活动类型 | BANNER / CONTENT |
| 目标人群 | ALL / CET4 / CET6 |
| 审核状态 | PENDING / APPROVED / REJECTED |
| 审计结果 | SUCCESS / FAIL |

---

## 8. 安全约定

1. 所有 `/admin/**` 必须经网关；下游校验 `X-Gateway-Token` 与 `X-User-Role`。
2. 客户端不得自行设置 `X-User-*`/`X-Gateway-Token`，网关会剥离后重写。
3. 管理员 Token 有效期 2 小时；普通用户 7 天。
4. 禁用/降权后旧 Token 可能仍有效至过期；user-service 管理接口会回查数据库，exercise-service 依赖短 TTL。
5. 列表与详情不返回密码；手机号脱敏；审计 detail 不记录密码/完整手机号。
