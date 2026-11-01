# 听力音频资源

## 目录约定

- 短音频（旧版一题一音频）：直接放在本目录，文件名与 `listening_audio.audio_url` 一致。
- 完整真题音频：放在 `audio/exams/`，通过 `audio_url=/audio/exams/xxx.mp3` 引用，前端用 `audio_start_seconds`/`audio_end_seconds` 截取片段，不预切文件。
- 真题音频、LRC、听力原文 docx 含版权，**不要提交公开仓库**；`frontend/public/audio/exams/*.mp3` 与 `listening-source/` 已在 `.gitignore` 中忽略。

## 旧版短音频

| 文件 | 对应题目 |
|---|---|
| `listening-cet4-01.mp3` | What is the man looking for? |
| `listening-cet4-02.mp3` | Why did the woman miss the meeting? |
| `listening-cet6-01.mp3` | What does the speaker suggest about online learning? |
| `listening-cet6-02.mp3` | What is the main reason for the decline in bee populations? |

开发环境由 Vite 直接服务 `/audio/*`；生产环境由 nginx 提供静态资源，并开启 range 请求以支持大文件拖动。
