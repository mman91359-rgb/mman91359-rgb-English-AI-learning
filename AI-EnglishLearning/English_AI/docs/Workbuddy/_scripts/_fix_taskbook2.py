# -*- coding: utf-8 -*-
"""任务书收尾修正：
1) 把被合并的「（3）…；（4）…」拆回两个独立段落；
2) 把「参与」类团队分工措辞改为单人独立完成口径。
"""
import sys, shutil, zipfile, os, copy
import lxml.etree as ET

W = 'http://schemas.openxmlformats.org/wordprocessingml/2006/main'


def q(t):
    return '{%s}%s' % (W, t)


def para_text(p):
    return ''.join(n.text or '' for n in p.iter(q('t')))


def main(src, dst):
    shutil.copy(src, dst)
    zin = zipfile.ZipFile(src)
    items = [(i, zin.read(i.filename)) for i in zin.infolist()]
    zin.close()

    doc = None
    out = []
    for info, data in items:
        if info.filename == 'word/document.xml':
            doc = ET.fromstring(data)
        out.append((info, data))

    body = doc.find(q('body'))

    # ---------- 1. 拆分（3）（4） ----------
    target = None
    for p in body.iter(q('p')):
        t = para_text(p)
        if '（3）完成前端页面' in t and '（4）完成系统功能测试' in t:
            target = p
            break
    if target is None:
        print('!! 未找到合并段落')
    else:
        runs = target.findall(q('r'))
        old = para_text(target)
        head = old.split('（4）')[0]           # （3）…；
        tail = '（4）' + old.split('（4）')[1]  # （4）…
        # 第一个 run 写 head，其余清空
        first_t = runs[0].find(q('t'))
        first_t.text = head
        first_t.set('{http://www.w3.org/XML/1998/namespace}space', 'preserve')
        for r in runs[1:]:
            rt = r.find(q('t'))
            if rt is not None:
                rt.text = ''
        newp = copy.deepcopy(target)
        for r in newp.findall(q('r')):
            rt = r.find(q('t'))
            if rt is not None:
                rt.text = ''
        nr = newp.findall(q('r'))[0]
        nrt = nr.find(q('t'))
        nrt.text = tail
        nrt.set('{http://www.w3.org/XML/1998/namespace}space', 'preserve')
        target.addnext(newp)
        print('拆分：（3）%d 字 / （4）%d 字' % (len(head), len(tail)))

    # ---------- 2. 单人分工口径 ----------
    fix = [
        ('参与数据库、系统整体方案设计', '负责数据库、系统整体方案设计'),
        ('完成前端页面功能实现，对接后端微服务接口', '完成前后端功能实现，对接微服务接口'),
        ('（4）完成系统功能测试', '（4）完成系统功能测试'),
    ]
    for p in body.iter(q('p')):
        for t in p.iter(q('t')):
            if not t.text:
                continue
            for a, b in fix:
                if a in t.text and a != b:
                    t.text = t.text.replace(a, b)
                    print('措辞：%s -> %s' % (a, b))

    # 保持 w:t 空格
    newxml = ET.tostring(doc, xml_declaration=True, encoding='UTF-8', standalone=True)
    with zipfile.ZipFile(dst, 'w', zipfile.ZIP_DEFLATED) as zo:
        for info, data in out:
            if info.filename == 'word/document.xml':
                zo.writestr(info.filename, newxml)
            else:
                zo.writestr(info.filename, data)
    print('写出', dst)


if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2])
