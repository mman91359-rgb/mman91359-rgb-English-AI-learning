# -*- coding: utf-8 -*-
"""任务书对齐毕业设计成果文档：

1. 企业指导教师 王义枭 → 胡意强
2. 单人开发口径：分工句、素养条目、进程第 1 行、"参与"改"完成"
3. 签名日期 2025 年 11 月 → 2026 年 11 月（与成果文档封面 2026 年 11 月一致）
4. 选题类型：产品设计类 ☐→☑、作品设计类 ☑→☐（按成果文档封面勾选）

用法：python _fix_taskbook.py <源docx> <目标docx>
"""
import sys
import zipfile

from lxml import etree

W = 'http://schemas.openxmlformats.org/wordprocessingml/2006/main'
W_TAG = '{%s}' % W

TEXT_MAP = [
    ("王义枭", "胡意强"),
    # 分工句被拆成 3 个 run（中间一段加粗），分段替换以保留加粗
    ("本小组两人分工，本人主要负责", "本项目由本人独立完成，负责"),
    ("前端页面开发、页面交互、原型设计、系统测试以及全套文档编写",
     "系统架构与数据库设计、后端五个微服务开发、前端页面实现、系统测试以及全套文档撰写"),
    ("培养小组协作能力，共同解决项目开发遇到的各类技术问题",
     "培养独立分析与解决问题的能力，自主攻克项目开发中的技术难点"),
    ("完成毕业设计选题、分组及开题", "完成毕业设计选题与开题"),
    ("参与数据库、系统整体方案设计", "完成数据库、系统整体方案设计"),
    ("参与系统功能测试", "完成系统功能测试"),
    ("2025年11月13日", "2026年11月13日"),
    ("2025年11月19日", "2026年11月19日"),
    ("2025年11月21日", "2026年11月21日"),
]


def q(tag):
    return W_TAG + tag


def main(src, dst):
    zin = zipfile.ZipFile(src)
    root = etree.fromstring(zin.read('word/document.xml'))
    log = []

    # ---- 文本替换 ----
    for old, new in TEXT_MAP:
        hit = 0
        for t in root.iter(q('t')):
            if t.text and old in t.text:
                t.text = t.text.replace(old, new)
                hit += 1
        log.append('%s → %s（%d 处）' % (old[:14], new[:14], hit))

    # ---- 复选框：按后随文字定位 ----
    syms = list(root.iter(q('sym')))
    target = {'产品设计类': 'F0FE', '作品设计类': '00A8'}
    for s in syms:
        run = s.getparent()
        nxt = run.getnext()
        label = ''
        while nxt is not None and not label:
            texts = nxt.findall('.//' + q('t'))
            for t in texts:
                if t.text and t.text.strip():
                    label = t.text.strip()
                    break
            nxt = nxt.getnext()
        for name, code in target.items():
            if label.startswith(name):
                old = s.get(q('char'))
                s.set(q('char'), code)
                log.append('复选框 %s：%s → %s' % (name, old, code))

    data = etree.tostring(root, xml_declaration=True, encoding='UTF-8', standalone=True)
    with zipfile.ZipFile(dst, 'w', zipfile.ZIP_DEFLATED) as zout:
        for name in zin.namelist():
            zout.writestr(name, data if name == 'word/document.xml' else zin.read(name))
    zin.close()
    print('\n'.join(log))
    print('写入:', dst)


if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2])
