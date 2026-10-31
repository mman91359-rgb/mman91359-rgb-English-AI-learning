# 听力音频资源

把听力 mp3 放在本目录，文件名需与 `sql/10-listening-module.sql` 中的 `audio_url` 一致：

| 文件 | 对应题目 |
|---|---|
| `listening-cet4-01.mp3` | What is the man looking for? |
| `listening-cet4-02.mp3` | Why did the woman miss the meeting? |
| `listening-cet6-01.mp3` | What does the speaker suggest about online learning? |
| `listening-cet6-02.mp3` | What is the main reason for the decline in bee populations? |

建议每段 30~60 秒、单文件小于 2MB。替换音频后，同步更新 SQL 中的
`duration_seconds` 与 `transcript`，保证进度条和原文展示准确。

开发环境由 Vite 直接服务 `/audio/*`；生产环境由 nginx 提供静态资源。
