# -*- coding: utf-8 -*-
"""修复毕业设计文档两处结构问题（lxml 实现，避免正则误伤）：

1) 2.1 标题段被设为居中，且图2.1 以浮动锚定塞在标题段落内
   → 图片拆成独立行内段落（只保留 distT/B/L/R），标题恢复左对齐并加「与下段同页」
2) 两处空「标题2」段落（2.4 技术方案前、3.1.2 用户能力雷达表前）
   → 追加 outlineLvl=9，目录不再收录，外观与行距不变

用法：python _fix_2_1_and_toc.py <源docx> <目标docx>
"""
import sys
import zipfile

from lxml import etree

W = 'http://schemas.openxmlformats.org/wordprocessingml/2006/main'
WP = 'http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing'
NS = {'w': W, 'wp': WP}
W_TAG = '{%s}' % W


def q(tag):
    return '{%s}%s' % (W, tag)


def main(src, dst):
    zin = zipfile.ZipFile(src)
    root = etree.fromstring(zin.read('word/document.xml'))
    body = root.find(q('body'))
    log = []

    # ---------- 1. 2.1 标题：拆图 + 去居中 ----------
    heads = [
        p for p in body.iter(q('p'))
        if p.find('.//' + q('bookmarkStart')) is not None
        and '_Toc240808986' in [b.get(q('name')) for b in p.iter(q('bookmarkStart'))]
    ]
    if not heads:
        raise SystemExit('未找到 2.1 标题段')
    head = heads[0]

    drawing = head.find('.//' + q('drawing'))
    if drawing is None:
        raise SystemExit('2.1 标题段内没有图片')
    anchor = drawing.find('{%s}anchor' % WP)
    if anchor is None:
        raise SystemExit('2.1 图片不是浮动锚定，无需处理')

    inline = etree.SubElement(drawing, '{%s}inline' % WP)
    inline.set('distT', '0')
    inline.set('distB', '0')
    inline.set('distL', '0')
    inline.set('distR', '0')
    for child in list(anchor):
        local = etree.QName(child).localname
        if local in ('extent', 'effectExtent', 'docPr', 'cNvGraphicFramePr', 'graphic'):
            anchor.remove(child)
            inline.append(child)
    drawing.remove(anchor)

    # 图片所在 run 整体从标题段移除
    run = drawing.getparent()
    head.remove(run)

    # 标题段：删掉 jc，加 keepNext
    ppr = head.find(q('pPr'))
    for jc in ppr.findall(q('jc')):
        ppr.remove(jc)
    kn = etree.Element(q('keepNext'))
    ppr.insert(1 if ppr.find(q('pStyle')) is not None else 0, kn)
    log.append('2.1 标题段：去居中、加 keepNext、图片移出')

    # 新建图片段落，插到标题段之后
    img_p = etree.Element(q('p'))
    ippr = etree.SubElement(img_p, q('pPr'))
    etree.SubElement(ippr, q('keepNext'))
    sp = etree.SubElement(ippr, q('spacing'))
    sp.set(q('before'), '80')
    sp.set(q('after'), '0')
    sp.set(q('line'), '240')
    sp.set(q('lineRule'), 'auto')
    ind = etree.SubElement(ippr, q('ind'))
    ind.set(q('left'), '0')
    ind.set(q('right'), '0')
    ind.set(q('firstLineChars'), '0')
    ind.set(q('firstLine'), '0')
    jc = etree.SubElement(ippr, q('jc'))
    jc.set(q('val'), 'center')
    img_r = etree.SubElement(img_p, q('r'))
    img_r.append(drawing)
    head.addnext(img_p)
    log.append('新建图2.1 行内图片段落（distT/B/L/R=0）')

    # ---------- 2. 空「标题2」段：不进目录 ----------
    for p in body.iter(q('p')):
        txt = ''.join(t.text or '' for t in p.iter(q('t')))
        ppr = p.find(q('pPr'))
        if ppr is None or txt.strip():
            continue
        ps = ppr.find(q('pStyle'))
        if ps is None or ps.get(q('val')) != '2':
            continue
        if p.find('.//' + q('drawing')) is not None:
            continue
        if ppr.find(q('outlineLvl')) is not None:
            continue
        ol = etree.Element(q('outlineLvl'))
        ol.set(q('val'), '9')
        rpr = ppr.find(q('rPr'))
        if rpr is not None:
            rpr.addprevious(ol)
        else:
            ppr.append(ol)
        log.append('空标题2段追加 outlineLvl=9')

    data = etree.tostring(root, xml_declaration=True, encoding='UTF-8', standalone=True)

    with zipfile.ZipFile(dst, 'w', zipfile.ZIP_DEFLATED) as zout:
        for name in zin.namelist():
            zout.writestr(name, data if name == 'word/document.xml' else zin.read(name))
    zin.close()
    print('\n'.join(log))
    print('写入:', dst)


if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2])
