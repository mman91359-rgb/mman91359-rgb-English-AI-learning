# -*- coding: utf-8 -*-
"""第二轮规范化（lxml 实现）：

1) 把 7 张仍以浮动锚定塞在正文/标题段里的图片拆成独立行内图段落
   （图2.2、图2.3、图2.4、图3.1、图3.2、图3.3、图4.2），
   同时把被误设为「居中 + 无首行缩进」的原段落恢复为正文格式（首行缩进 24 磅）
2) 3.2.1~3.2.5 标题补空格（「3.2.1用户登录页面」→「3.2.1 用户登录页面」）
3) 图2.1 换高分辨率版本（1785×2736）并放大到 4.2 英寸宽

用法：python _fix_figs_and_titles.py <源docx> <目标docx> <图2.1高清png>
"""
import io
import struct
import sys
import zipfile

from lxml import etree

W = 'http://schemas.openxmlformats.org/wordprocessingml/2006/main'
WP = 'http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing'
W_TAG = '{%s}' % W
WP_TAG = '{%s}' % WP

EMU = 914400
FIG21_WIDTH_IN = 4.2


def q(tag):
    return W_TAG + tag


def png_size(data):
    return struct.unpack('>II', data[16:24])


def make_inline(drawing, anchor):
    inline = etree.SubElement(drawing, WP_TAG + 'inline')
    for k in ('distT', 'distB', 'distL', 'distR'):
        inline.set(k, '0')
    for child in list(anchor):
        if etree.QName(child).localname in (
                'extent', 'effectExtent', 'docPr', 'cNvGraphicFramePr', 'graphic'):
            anchor.remove(child)
            inline.append(child)
    drawing.replace(anchor, inline)
    return inline


def fix_text_ppr(p, is_heading):
    """去掉居中，恢复首行缩进"""
    ppr = p.find(q('pPr'))
    if ppr is None:
        return
    for jc in ppr.findall(q('jc')):
        ppr.remove(jc)
    ind = ppr.find(q('ind'))
    if ind is None:
        ind = etree.SubElement(ppr, q('ind'))
    for k in ('left', 'right', 'leftChars', 'rightChars', 'firstLineChars'):
        if ind.get(q(k)) is not None:
            del ind.attrib[q(k)]
    ind.set(q('firstLine'), '482' if is_heading else '480')


def main(src, dst, fig_png):
    zin = zipfile.ZipFile(src)
    root = etree.fromstring(zin.read('word/document.xml'))
    body = root.find(q('body'))
    log = []

    # ---------- 1. 浮动图 → 独立行内图段 ----------
    targets = [
        p for p in body.iter(q('p'))
        if p.find('.//' + q('drawing')) is not None
        and p.find('.//' + WP_TAG + 'anchor') is not None
    ]
    for p in targets:
        txt = ''.join(t.text or '' for t in p.iter(q('t'))).strip()
        drawing = p.find('.//' + q('drawing'))
        anchor = drawing.find(WP_TAG + 'anchor')
        make_inline(drawing, anchor)

        run = drawing.getparent()
        p.remove(run)

        ps = p.find(q('pPr') + '/' + q('pStyle'))
        is_heading = ps is not None and ps.get(q('val')) == '3'
        fix_text_ppr(p, is_heading)

        img_p = etree.Element(q('p'))
        ppr = etree.SubElement(img_p, q('pPr'))
        etree.SubElement(ppr, q('keepNext'))
        sp = etree.SubElement(ppr, q('spacing'))
        sp.set(q('before'), '80')
        sp.set(q('after'), '0')
        sp.set(q('line'), '240')
        sp.set(q('lineRule'), 'auto')
        ind = etree.SubElement(ppr, q('ind'))
        for k, v in (('left', '0'), ('right', '0'), ('firstLineChars', '0'), ('firstLine', '0')):
            ind.set(q(k), v)
        jc = etree.SubElement(ppr, q('jc'))
        jc.set(q('val'), 'center')
        r = etree.SubElement(img_p, q('r'))
        r.append(drawing)
        p.addnext(img_p)
        log.append('拆图：%s' % (txt[:18] or '（无文字）'))

    # ---------- 2. 3.2.x 标题补空格 ----------
    import re as _re
    for p in body.iter(q('p')):
        ps = p.find(q('pPr') + '/' + q('pStyle'))
        if ps is None or ps.get(q('val')) != '3':
            continue
        t = ''.join(x.text or '' for x in p.iter(q('t')))
        m = _re.match(r'^(3\.2\.\d+)(\S)', t)
        if not m or m.group(2) in '0123456789':
            continue
        num = m.group(1)
        runs = [r for r in p.iter(q('r')) if r.find(q('t')) is not None]
        acc = ''
        for r in runs:
            acc += ''.join(x.text or '' for x in r.findall(q('t')))
            if len(acc) >= len(num):
                last_t = r.findall(q('t'))[-1]
                last_t.text = (last_t.text or '') + ' '
                last_t.set('{http://www.w3.org/XML/1998/namespace}space', 'preserve')
                break
        log.append('标题补空格：%s' % num)

    # ---------- 2b. 图/表题注补空格（图2.2四六级… → 图2.2 四六级…） ----------
    for p in body.iter(q('p')):
        t = ''.join(x.text or '' for x in p.iter(q('t')))
        m2 = _re.match(r'^(图|表)(\d+\.\d+)(\S)', t)
        if not m2 or m2.group(3) in '0123456789':
            continue
        num = m2.group(1) + m2.group(2)
        runs = [r for r in p.iter(q('r')) if r.find(q('t')) is not None]
        acc = ''
        for r in runs:
            acc += ''.join(x.text or '' for x in r.findall(q('t')))
            if len(acc) >= len(num):
                last_t = r.findall(q('t'))[-1]
                last_t.text = (last_t.text or '') + ' '
                last_t.set('{http://www.w3.org/XML/1998/namespace}space', 'preserve')
                break
        log.append('题注补空格：%s' % num)

    # ---------- 3. 图2.1 换高清图 + 放大 ----------
    new_png = open(fig_png, 'rb').read()
    nw, nh = png_size(new_png)
    cx = int(FIG21_WIDTH_IN * EMU)
    cy = int(round(cx * nh / nw))
    n = 0
    for blip in root.iter('{http://schemas.openxmlformats.org/drawingml/2006/main}blip'):
        if blip.get('{http://schemas.openxmlformats.org/officeDocument/2006/relationships}embed') == 'rId17':
            node = blip
            inline = None
            while node is not None:
                if etree.QName(node).localname == 'inline':
                    inline = node
                    break
                node = node.getparent()
            if inline is None:
                continue
            for ext in inline.findall(WP_TAG + 'extent'):
                ext.set('cx', str(cx))
                ext.set('cy', str(cy))
            n += 1
    log.append('图2.1 尺寸 %.2f x %.2f 英寸（%d 处）' % (cx / EMU, cy / EMU, n))

    data = etree.tostring(root, xml_declaration=True, encoding='UTF-8', standalone=True)
    with zipfile.ZipFile(dst, 'w', zipfile.ZIP_DEFLATED) as zout:
        for name in zin.namelist():
            if name == 'word/document.xml':
                zout.writestr(name, data)
            elif name == 'word/media/image2.png':
                zout.writestr(name, new_png)
            else:
                zout.writestr(name, zin.read(name))
    zin.close()
    print('\n'.join(log))
    print('写入:', dst)


if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2], sys.argv[3])
