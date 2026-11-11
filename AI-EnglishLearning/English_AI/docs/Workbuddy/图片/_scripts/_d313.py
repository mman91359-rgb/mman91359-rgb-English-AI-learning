# -*- coding: utf-8 -*-
import sys, os
sys.path.insert(0, r"D:\AI-EnglishLearning\AI-EnglishLearning\English_AI\docs\Workbuddy\图片")
from _render_class import render, OUT

W, H = 605, 706
cls = [
    dict(name='JudgmentEngine', kind='I', x=4, y=6, w=596,
         fields=[],
         methods=[('+', 'judge(SubmitRequest, String, String)', 'JudgmentResult'),
                  ('+', 'judgeTranslation(SubmitRequest, String, String, String, boolean)', 'JudgmentResult')]),
    dict(name='JudgmentEngineImpl', kind='C', x=4, y=110, w=596,
         fields=[('-', 'buggyPathMapper', 'QuestionBuggyPathMapper'),
                 ('-', 'questionInfoMapper', 'QuestionInfoMapper'),
                 ('-', 'translationScoreClient', 'TranslationScoreClient')],
         methods=[('+', 'judge(SubmitRequest, String, String)', 'JudgmentResult'),
                  ('+', 'judgeTranslation(SubmitRequest, String, String, String, boolean)', 'JudgmentResult')]),
    dict(name='AnswerNormalizer', kind='C', x=4, y=280, w=290,
         fields=[],
         methods=[('+', 'normalize(String)', 'String'),
                  ('+', 'toHalfWidth(String)', 'String')]),
    dict(name='GrammarRuleChecker', kind='C', x=310, y=280, w=290,
         fields=[],
         methods=[('+', 'checkGrammarRules(String, String)', 'String'),
                  ('+', 'checkPreposition(String)', 'String'),
                  ('+', 'checkArticle(String, String)', 'String'),
                  ('+', 'checkTense(String, String)', 'String')]),
    dict(name='LevenshteinUtil', kind='C', x=4, y=380, w=290,
         fields=[],
         methods=[('+', 'calculateDistance(String, String)', 'int'),
                  ('+', 'calculateSimilarity(String, String)', 'double'),
                  ('+', 'isSpellingError(String, String)', 'boolean')]),
    dict(name='JudgmentResult', kind='C', x=310, y=414, w=290,
         fields=[('-', 'isCorrect', 'Boolean'),
                 ('-', 'heuristicHint', 'String'),
                 ('-', 'errorType', 'String'),
                 ('-', 'matchedLevel', 'Integer'),
                 ('-', 'suggestions', 'List<String>'),
                 ('-', 'isSemanticMatch', 'Boolean')],
         methods=[]),
    dict(name='QuestionBuggyPath', kind='C', x=4, y=497, w=290,
         fields=[('-', 'id', 'Long'),
                 ('-', 'questionId', 'Long'),
                 ('-', 'wrongAnswer', 'String'),
                 ('-', 'heuristicHint', 'String'),
                 ('-', 'errorType', 'String'),
                 ('-', 'occurrenceCount', 'Integer')],
         methods=[]),
]

links = [
    dict(path='M 150 110 L 150 86', arrow=(150, 86, 270), style='impl'),
    dict(path='M 100 246 L 100 280', arrow=(100, 280, 90), style='dep'),
    dict(path='M 400 246 L 400 280', arrow=(400, 280, 90), style='dep'),
    dict(path='M 298 246 L 298 540 L 294 540', arrow=(294, 540, 180), style='dep'),
    dict(path='M 308 246 L 308 470 L 310 470', arrow=(310, 470, 0), style='dep'),
]

notes = [
    dict(x=4, y=662, w=290, t='注：LevenshteinUtil 为静态工具类，由 L1 规则层调用'),
]

render(os.path.join(OUT, '图3.13 词汇语法练习与AI判题业务类图.html'), cls, links, W, H, notes)
