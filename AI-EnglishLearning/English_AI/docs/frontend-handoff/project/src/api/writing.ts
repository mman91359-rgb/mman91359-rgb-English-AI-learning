import { WRITING_SAMPLE_SCORE, WRITING_TOPICS } from '@/mock/writing';
import { supabase } from '@/lib/supabase';
import { countWords } from '@/lib/writing';
import type { WritingDraft, WritingScore, WritingSubmission, WritingTopic } from '@/types/writing';

const SUBMISSION_LIST_LIMIT = 100;

export class WritingServiceError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'WritingServiceError';
  }
}

interface DraftRow {
  topic_id: string;
  content: string;
  updated_at: string;
}

interface SubmissionRow {
  id: string;
  topic_id: string;
  word_count: number;
  duration_seconds: number;
  total_score: number;
  report: unknown;
  created_at: string;
}

export interface SubmitEssayInput {
  topicId: string;
  content: string;
  durationSeconds: number;
}

function ensureOk(error: { message: string } | null, action: string): void {
  if (error) throw new WritingServiceError(`${action}: ${error.message}`);
}

function toDraft(row: DraftRow): WritingDraft {
  return { topicId: row.topic_id, content: row.content, wordCount: countWords(row.content), updatedAt: row.updated_at };
}

/** 报告以 JSON 形式保存，读取时确认结构完整，避免损坏数据进入界面 */
function toSubmission(row: SubmissionRow): WritingSubmission {
  const report = row.report as Partial<WritingScore> | null;
  if (!report || typeof report !== 'object' || typeof report.total !== 'number' || !report.dimensions) {
    throw new WritingServiceError('submission report is malformed');
  }
  return {
    id: row.id,
    topicId: row.topic_id,
    wordCount: row.word_count,
    durationSeconds: row.duration_seconds,
    totalScore: row.total_score,
    createdAt: row.created_at,
    report: report as WritingScore,
  };
}

const SUBMISSION_COLUMNS = 'id, topic_id, word_count, duration_seconds, total_score, report, created_at';

/** 题库为固定内容，暂不入库，保持同步返回 */
export function fetchWritingTopics(): Promise<WritingTopic[]> {
  return Promise.resolve(WRITING_TOPICS);
}

export async function fetchDraft(topicId: string): Promise<WritingDraft | null> {
  const { data, error } = await supabase
    .from('writing_drafts')
    .select('topic_id, content, updated_at')
    .eq('topic_id', topicId)
    .maybeSingle();
  ensureOk(error, 'load draft');
  return data ? toDraft(data as DraftRow) : null;
}

export async function saveDraft(topicId: string, content: string): Promise<WritingDraft> {
  const { data, error } = await supabase
    .from('writing_drafts')
    .upsert({ topic_id: topicId, content, updated_at: new Date().toISOString() }, { onConflict: 'topic_id' })
    .select('topic_id, content, updated_at')
    .single();
  ensureOk(error, 'save draft');
  return toDraft(data as DraftRow);
}

export async function fetchDraftTopicIds(): Promise<string[]> {
  const { data, error } = await supabase.from('writing_drafts').select('topic_id').neq('content', '');
  ensureOk(error, 'load draft topics');
  return (data ?? []).map((row) => (row as { topic_id: string }).topic_id);
}

export async function fetchFavoriteIds(): Promise<string[]> {
  const { data, error } = await supabase.from('writing_favorites').select('topic_id');
  ensureOk(error, 'load favorites');
  return (data ?? []).map((row) => (row as { topic_id: string }).topic_id);
}

export async function setFavorite(topicId: string, favorite: boolean): Promise<void> {
  if (favorite) {
    const { error } = await supabase
      .from('writing_favorites')
      .upsert({ topic_id: topicId }, { onConflict: 'topic_id', ignoreDuplicates: true });
    ensureOk(error, 'add favorite');
  } else {
    const { error } = await supabase.from('writing_favorites').delete().eq('topic_id', topicId);
    ensureOk(error, 'remove favorite');
  }
}

/** TODO: 接入真实评分服务后替换示例报告；当前报告为固定示例内容 */
export async function submitWritingEssay(input: SubmitEssayInput): Promise<WritingSubmission> {
  const { data, error } = await supabase
    .from('writing_submissions')
    .insert({
      topic_id: input.topicId,
      content: input.content,
      word_count: countWords(input.content),
      duration_seconds: input.durationSeconds,
      total_score: WRITING_SAMPLE_SCORE.total,
      report: WRITING_SAMPLE_SCORE,
    })
    .select(SUBMISSION_COLUMNS)
    .single();
  ensureOk(error, 'submit essay');
  const submission = toSubmission(data as SubmissionRow);
  const { error: draftError } = await supabase.from('writing_drafts').delete().eq('topic_id', input.topicId);
  ensureOk(draftError, 'clear draft');
  return submission;
}

export async function fetchSubmission(submissionId: string): Promise<WritingSubmission | null> {
  const { data, error } = await supabase
    .from('writing_submissions')
    .select(SUBMISSION_COLUMNS)
    .eq('id', submissionId)
    .maybeSingle();
  ensureOk(error, 'load submission');
  return data ? toSubmission(data as SubmissionRow) : null;
}

export async function fetchSubmissions(): Promise<WritingSubmission[]> {
  const { data, error } = await supabase
    .from('writing_submissions')
    .select(SUBMISSION_COLUMNS)
    .order('created_at', { ascending: false })
    .limit(SUBMISSION_LIST_LIMIT);
  ensureOk(error, 'load submissions');
  return (data ?? []).map((row) => toSubmission(row as SubmissionRow));
}
