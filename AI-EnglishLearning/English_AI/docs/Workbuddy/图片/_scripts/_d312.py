# -*- coding: utf-8 -*-
import sys, os
sys.path.insert(0, r"D:\AI-EnglishLearning\AI-EnglishLearning\English_AI\docs\Workbuddy\图片")
from _render_class import render, OUT

W, H = 605, 592
LX, LW = 4, 392
RX, RW = 416, 185
cx = LX + 140          # 左列内部连线 x
ch = 406               # 列间通道 x

cls = [
    dict(name='ExerciseController', kind='C', x=LX, y=6, w=LW,
         fields=[],
         methods=[('+', 'selectQuestions(Long, Integer, int)', 'Result<List<QuestionVO>>'),
                  ('+', 'getAssessQuestions()', 'Result<List<QuestionVO>>'),
                  ('+', 'submit(SubmitRequest)', 'Result<SubmitResponse>'),
                  ('+', 'errorBook(Long)', 'Result<List<QuestionVO>>'),
                  ('+', 'knowledgePoints(String)', 'Result<List<SysKnowledgePoint>>'),
                  ('+', 'getUserStats(Long)', 'Result<UserExerciseStats>')]),
    dict(name='ExerciseService', kind='I', x=LX, y=178, w=LW,
         fields=[],
         methods=[('+', 'selectQuestions(Long, Integer, int)', 'List<QuestionVO>'),
                  ('+', 'submitAnswer(SubmitRequest)', 'SubmitResponse'),
                  ('+', 'getErrorBook(Long)', 'List<QuestionVO>'),
                  ('+', 'getUserStats(Long)', 'UserExerciseStats'),
                  ('+', 'getKnowledgePoints(String)', 'List<SysKnowledgePoint>')]),
    dict(name='ExerciseServiceImpl', kind='C', x=LX, y=333, w=LW,
         fields=[('-', 'questionInfoMapper', 'QuestionInfoMapper'),
                 ('-', 'errorBookMapper', 'UserErrorBookMapper'),
                 ('-', 'exerciseLogMapper', 'UserExerciseLogMapper'),
                 ('-', 'judgmentEngine', 'JudgmentEngine')],
         methods=[('+', 'selectQuestions(Long, Integer, int)', 'List<QuestionVO>'),
                  ('+', 'submitAnswer(SubmitRequest)', 'SubmitResponse')]),
    dict(name='QuestionInfoMapper', kind='I', x=LX, y=510, w=LW,
         fields=[],
         methods=[('', 'extends BaseMapper<QuestionInfo>', '')]),
    dict(name='UserErrorBook', kind='C', x=RX, y=6, w=RW,
         fields=[('-', 'id', 'Long'),
                 ('-', 'userId', 'Long'),
                 ('-', 'questionId', 'Long'),
                 ('-', 'wrongCount', 'Integer'),
                 ('-', 'isResolved', 'Integer')],
         methods=[]),
    dict(name='UserExerciseLog', kind='C', x=RX, y=161, w=RW,
         fields=[('-', 'id', 'Long'),
                 ('-', 'userId', 'Long'),
                 ('-', 'questionId', 'Long'),
                 ('-', 'userAnswer', 'String'),
                 ('-', 'isCorrect', 'Integer'),
                 ('-', 'durationSeconds', 'Integer')],
         methods=[]),
    dict(name='QuestionInfo', kind='C', x=RX, y=333, w=RW,
         fields=[('-', 'id', 'Long'),
                 ('-', 'moduleType', 'Integer'),
                 ('-', 'targetLevel', 'String'),
                 ('-', 'difficultyLevel', 'Integer'),
                 ('-', 'questionType', 'String'),
                 ('-', 'knowledgePointId', 'Long'),
                 ('-', 'passageId', 'Long'),
                 ('-', 'acceptedAnswers', 'String'),
                 ('-', 'answerWord', 'String')],
         methods=[]),
]

links = [
    dict(path=f'M {cx} 154 L {cx} 178', arrow=(cx, 178, 90), style='dep'),
    dict(path=f'M {cx} 333 L {cx} 309', arrow=(cx, 309, 270), style='impl'),
    dict(path=f'M {cx} 486 L {cx} 510', arrow=(cx, 510, 90), style='dep'),
    dict(path=f'M {LX+LW} 405 L {RX} 405', arrow=(RX, 405, 0), style='dep'),
    dict(path=f'M {LX+LW} 540 L {ch} 540 L {ch} 505 L {RX} 505', arrow=(RX, 505, 0), style='dep'),
    dict(path=f'M {LX+LW} 255 L {RX} 255', arrow=(RX, 255, 0), style='dep'),
    dict(path=f'M {LX+LW} 215 L {ch} 215 L {ch} 70 L {RX} 70', arrow=(RX, 70, 0), style='dep'),
]

render(os.path.join(OUT, '图3.12 词汇语法专项练习业务类图.html'), cls, links, W, H, [])
