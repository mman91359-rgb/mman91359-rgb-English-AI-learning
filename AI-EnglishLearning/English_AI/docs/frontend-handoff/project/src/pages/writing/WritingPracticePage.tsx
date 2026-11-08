import { useEffect, useRef, useState } from 'react';
import { fetchDraft, fetchWritingTopics, saveDraft, submitWritingEssay } from '@/api/writing';
import { navigate } from '@/admin/router';
import { Button } from '@/components/ui/Button';
import { EmptyState, ErrorState, LoadingState } from '@/components/ui/StateView';
import { useToast } from '@/components/ui/Toast';
import { useI18n } from '@/i18n';
import { useAsync } from '@/lib/useAsync';
import { useCountdown } from '@/lib/useCountdown';
import { countWords } from '@/lib/writing';
import type { WritingDraft, WritingTopic } from '@/types/writing';
import { writingHref } from '@/writing/WritingApp';
import { WritingAnswerSheet, type DraftSaveStatus } from '@/pages/writing/WritingAnswerSheet';

const DRAFT_SAVE_DELAY_MS = 800;
const SCORING_STEP_INTERVAL_MS = 1200;

interface PracticeLoadResult {
  topic: WritingTopic | undefined;
  draft: WritingDraft | null;
}

async function loadPractice(topicId: string): Promise<PracticeLoadResult> {
  const [topics, draft] = await Promise.all([fetchWritingTopics(), fetchDraft(topicId)]);
  return { topic: topics.find((item) => item.id === topicId), draft };
}

interface WritingPracticePageProps {
  topicId: string;
}

export function WritingPracticePage({ topicId }: WritingPracticePageProps) {
  const { t } = useI18n();
  const practice = useAsync(() => loadPractice(topicId), [topicId]);

  if (practice.loading) return <LoadingState rows={6} />;
  if (practice.error != null) return <ErrorState error={practice.error} onRetry={practice.reload} />;
  if (!practice.data?.topic) {
    return (
      <EmptyState
        title={t('writing.practice.notFound')}
        action={
          <Button variant="secondary" icon="arrow_back" onClick={() => navigate(writingHref('library'))}>
            {t('writing.practice.back')}
          </Button>
        }
      />
    );
  }

  return <PracticeWorkspace key={practice.data.topic.id} topic={practice.data.topic} initialDraft={practice.data.draft} />;
}

interface PracticeWorkspaceProps {
  topic: WritingTopic;
  initialDraft: WritingDraft | null;
}

function PracticeWorkspace({ topic, initialDraft }: PracticeWorkspaceProps) {
  const { t } = useI18n();
  const { notify } = useToast();
  const [content, setContent] = useState(initialDraft?.content ?? '');
  const [savedAt, setSavedAt] = useState<string | null>(initialDraft?.updatedAt ?? null);
  const [saveStatus, setSaveStatus] = useState<DraftSaveStatus>('idle');
  const [scoring, setScoring] = useState(false);
  const [scoringStep, setScoringStep] = useState(0);
  const lastSavedRef = useRef(initialDraft?.content ?? '');
  const timeUpNotifiedRef = useRef(false);

  const { remaining } = useCountdown(topic.timeLimitSeconds, !scoring, handleTimeUp);

  function handleTimeUp() {
    if (timeUpNotifiedRef.current) return;
    timeUpNotifiedRef.current = true;
    notify('info', t('writing.practice.timeUp'));
  }

  useEffect(() => {
    if (content === lastSavedRef.current) return;
    setSaveStatus('saving');
    const timer = window.setTimeout(() => {
      saveDraft(topic.id, content).then(
        (draft) => {
          lastSavedRef.current = content;
          setSavedAt(draft.updatedAt);
          setSaveStatus('saved');
        },
        () => setSaveStatus('error'),
      );
    }, DRAFT_SAVE_DELAY_MS);
    return () => window.clearTimeout(timer);
  }, [content, topic.id]);

  useEffect(() => {
    if (!scoring) return;
    const timer = window.setInterval(() => {
      setScoringStep((step) => step + 1);
    }, SCORING_STEP_INTERVAL_MS);
    return () => window.clearInterval(timer);
  }, [scoring]);

  const wordCount = countWords(content);

  async function handleSubmit() {
    if (scoring || wordCount === 0) return;
    setScoringStep(0);
    setScoring(true);
    try {
      const submission = await submitWritingEssay({
        topicId: topic.id,
        content,
        durationSeconds: topic.timeLimitSeconds - remaining,
      });
      navigate(writingHref('report', { submission: submission.id }));
    } catch {
      setScoring(false);
      notify('error', t('writing.practice.submitFailed'));
    }
  }

  return (
    <WritingAnswerSheet
      topic={topic}
      content={content}
      onContentChange={setContent}
      remaining={remaining}
      wordCount={wordCount}
      savedAt={savedAt}
      saveStatus={saveStatus}
      scoring={scoring}
      scoringStep={scoringStep}
      onSubmit={handleSubmit}
      onBack={() => navigate(writingHref('library'))}
    />
  );
}
