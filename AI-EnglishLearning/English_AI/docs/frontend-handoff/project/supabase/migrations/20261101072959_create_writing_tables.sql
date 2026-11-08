/*
# 写作模块数据表

1. 新增数据表
- writing_drafts：每道题目的一份草稿，按题目编号唯一，自动保存时覆盖更新。
- writing_submissions：每次提交的作文记录，包含正文、字数、用时、总分与评分报告（JSON）。
- writing_favorites：用户收藏的题目编号。

2. 安全设置
- 三张表均开启行级安全（RLS）。
- 应用没有登录功能，所有访问均以匿名身份进行，因此策略同时授权 anon 与 authenticated。
- 正文字段限制最大 20000 个字符，防止超大内容写入。
- writing_submissions 只允许查询与新增，不允许修改或删除，保证评分记录不可篡改。

3. 注意事项
- 本迁移只创建新表与索引，不删除或修改任何已有数据。
- 语句均为幂等写法，可安全重复执行。
*/

CREATE TABLE IF NOT EXISTS writing_drafts (
  topic_id text PRIMARY KEY,
  content text NOT NULL DEFAULT '' CHECK (char_length(content) <= 20000),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS writing_submissions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  topic_id text NOT NULL,
  content text NOT NULL CHECK (char_length(content) <= 20000),
  word_count integer NOT NULL CHECK (word_count >= 0),
  duration_seconds integer NOT NULL CHECK (duration_seconds >= 0),
  total_score integer NOT NULL CHECK (total_score BETWEEN 0 AND 15),
  report jsonb NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS writing_submissions_topic_created_idx
  ON writing_submissions (topic_id, created_at DESC);

CREATE TABLE IF NOT EXISTS writing_favorites (
  topic_id text PRIMARY KEY,
  created_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE writing_drafts ENABLE ROW LEVEL SECURITY;
ALTER TABLE writing_submissions ENABLE ROW LEVEL SECURITY;
ALTER TABLE writing_favorites ENABLE ROW LEVEL SECURITY;

GRANT SELECT, INSERT, UPDATE, DELETE ON writing_drafts TO anon, authenticated;
GRANT SELECT, INSERT ON writing_submissions TO anon, authenticated;
GRANT SELECT, INSERT, DELETE ON writing_favorites TO anon, authenticated;

DROP POLICY IF EXISTS "anon_select_writing_drafts" ON writing_drafts;
CREATE POLICY "anon_select_writing_drafts" ON writing_drafts FOR SELECT
  TO anon, authenticated USING (true);

DROP POLICY IF EXISTS "anon_insert_writing_drafts" ON writing_drafts;
CREATE POLICY "anon_insert_writing_drafts" ON writing_drafts FOR INSERT
  TO anon, authenticated WITH CHECK (true);

DROP POLICY IF EXISTS "anon_update_writing_drafts" ON writing_drafts;
CREATE POLICY "anon_update_writing_drafts" ON writing_drafts FOR UPDATE
  TO anon, authenticated USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS "anon_delete_writing_drafts" ON writing_drafts;
CREATE POLICY "anon_delete_writing_drafts" ON writing_drafts FOR DELETE
  TO anon, authenticated USING (true);

DROP POLICY IF EXISTS "anon_select_writing_submissions" ON writing_submissions;
CREATE POLICY "anon_select_writing_submissions" ON writing_submissions FOR SELECT
  TO anon, authenticated USING (true);

DROP POLICY IF EXISTS "anon_insert_writing_submissions" ON writing_submissions;
CREATE POLICY "anon_insert_writing_submissions" ON writing_submissions FOR INSERT
  TO anon, authenticated WITH CHECK (true);

DROP POLICY IF EXISTS "anon_select_writing_favorites" ON writing_favorites;
CREATE POLICY "anon_select_writing_favorites" ON writing_favorites FOR SELECT
  TO anon, authenticated USING (true);

DROP POLICY IF EXISTS "anon_insert_writing_favorites" ON writing_favorites;
CREATE POLICY "anon_insert_writing_favorites" ON writing_favorites FOR INSERT
  TO anon, authenticated WITH CHECK (true);

DROP POLICY IF EXISTS "anon_delete_writing_favorites" ON writing_favorites;
CREATE POLICY "anon_delete_writing_favorites" ON writing_favorites FOR DELETE
  TO anon, authenticated USING (true);
