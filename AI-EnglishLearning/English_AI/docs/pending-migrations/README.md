# 待审批迁移暂存区

Flyway 只扫描各服务 `src/main/resources/db/migration/`。本目录用于**审批前**暂存待执行的迁移脚本，避免服务重启时 Flyway 自动执行尚未批准的 SQL。

流程：

1. 新迁移先写到 `docs/pending-migrations/V1.0.x__描述.sql`；
2. 向用户展示：迁移文件、目标库、完整 SQL、风险等级、回滚方式；
3. 获得明确批准后，复制到对应服务的 `db/migration/`；
4. 备份 → `scripts/flyway.sh <module> migrate` → `validate`；
5. 执行成功后删除本目录中的副本，避免与正式迁移重复。

禁止在本目录放已应用的迁移或生产数据。
