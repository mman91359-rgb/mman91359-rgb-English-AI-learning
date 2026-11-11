# -*- coding: utf-8 -*-
"""顺序图渲染器：605 CSS px 宽（=6.3 inch @96dpi），字号 11px，2 倍出图。"""
import os, subprocess, math

OUT = r"D:\AI-EnglishLearning\AI-EnglishLearning\English_AI\docs\Workbuddy\图片"
CHROME = r"C:\Program Files\Google\Chrome\Application\chrome.exe"

W = 605
MARGIN = 12
HEAD_H = 36
TOP = 16
MSG_GAP = 9
LINE_H = 14


def render(fname, participants, msgs, frags=(), H=None, notes=()):
    n = len(participants)
    gap = (W - 2 * MARGIN) / n
    xs = {}
    for i, p in enumerate(participants):
        xs[p['id']] = MARGIN + gap * (i + 0.5)

    # 计算每条消息的 y
    y = TOP + HEAD_H + 22
    coords = []
    for m in msgs:
        lines = m['text'].split('\n')
        h = 16 + (len(lines) - 1) * LINE_H
        if m.get('self'):
            h += 10
        coords.append((y, h, lines))
        y += h + MSG_GAP
    bottom = y + 10
    H = H or int(bottom + 16)

    svg = []
    # 碎片框（alt）先画，作为背景
    for fr in frags:
        ins = fr.get('inset', 0)
        fx = MARGIN - 4 + ins
        fw = W - 2 * MARGIN + 8 - 2 * ins
        y0 = coords[fr['from']][0] - 14
        y1 = coords[fr['to']][0] + coords[fr['to']][1] + 6
        svg.append(f'<rect x="{fx}" y="{y0}" width="{fw}" height="{y1-y0}" '
                   f'fill="none" stroke="#8FA6BF" stroke-width="1"/>')
        tw = 8 * len(fr['label']) + 14
        svg.append(f'<polygon points="{fx},{y0} {fx+tw},{y0} {fx+tw},{y0+7} '
                   f'{fx+tw-7},{y0+15} {fx},{y0+15}" fill="#EDF2F9" stroke="#8FA6BF" stroke-width="1"/>')
        svg.append(f'<text x="{fx+4}" y="{y0+11}" font-size="9.5" fill="#3C5A7D" '
                   f'font-family="Microsoft YaHei">{fr["label"]}</text>')
        for ey, etxt in fr.get('else', []):
            yy = coords[ey][0] - 14
            svg.append(f'<line x1="{fx}" y1="{yy}" x2="{fx+fw}" y2="{yy}" '
                       f'stroke="#8FA6BF" stroke-width="1" stroke-dasharray="4,3"/>')
            svg.append(f'<text x="{fx+4}" y="{yy+12}" font-size="9.5" fill="#3C5A7D" '
                       f'font-family="Microsoft YaHei">[{etxt}]</text>')

    # 生命线
    for p in participants:
        x = xs[p['id']]
        svg.append(f'<line x1="{x}" y1="{TOP+HEAD_H}" x2="{x}" y2="{H-6}" '
                   f'stroke="#9DB2C8" stroke-width="1" stroke-dasharray="4,3"/>')

    # 激活条
    for p in participants:
        for seg in p.get('act', []):
            y0 = coords[seg[0]][0] - 6
            y1 = coords[seg[1]][0] + coords[seg[1]][1] + 2
            x = xs[p['id']]
            svg.append(f'<rect x="{x-4.5}" y="{y0}" width="9" height="{y1-y0}" fill="#DCE7F4" stroke="#7C99B8" stroke-width="1"/>')

    # 消息
    for i, m in enumerate(msgs):
        y, h, lines = coords[i]
        x1, x2 = xs[m['f']], xs[m['t']]
        ty = y + 4
        if m.get('self'):
            est = max(sum(11 if ord(c) > 0x2000 else 5.9 for c in ln) * 10.5 / 11 for ln in lines)
            to_left = (x1 + 28 + est) > (W - 8)
            d = -1 if to_left else 1
            x = x1 + 5 * d
            svg.append(f'<path d="M {x} {ty-2} L {x+22*d} {ty-2} L {x+22*d} {ty+14} L {x+6*d} {ty+14}" '
                       f'fill="none" stroke="#4A6787" stroke-width="1.1"/>')
            svg.append(f'<polygon points="{x+6*d},{ty+14} {x+14*d},{ty+10.5} {x+14*d},{ty+17.5}" fill="#4A6787"/>')
            for k, ln in enumerate(lines):
                if to_left:
                    svg.append(f'<text x="{x-4}" y="{ty+2+k*LINE_H}" font-size="10.5" fill="#26364A" '
                               f'text-anchor="end" font-family="Microsoft YaHei">{ln}</text>')
                else:
                    svg.append(f'<text x="{x+28}" y="{ty+2+k*LINE_H}" font-size="10.5" fill="#26364A" '
                               f'font-family="Microsoft YaHei">{ln}</text>')
            continue
        dash = ' stroke-dasharray="5,3"' if m['type'] == 'ret' else ''
        color = '#7A8FA6' if m['type'] == 'ret' else '#3F5E80'
        svg.append(f'<line x1="{x1 + (5 if x2>x1 else -5)}" y1="{ty}" x2="{x2 - (6 if x2>x1 else -6)}" y2="{ty}" '
                   f'stroke="{color}" stroke-width="1.1"{dash}/>')
        ang = 0 if x2 > x1 else 180
        r = math.radians(ang)
        if m['type'] == 'ret':
            px, py = x2 + (-6 if x2 > x1 else 6), ty
            p2 = (px - 9*math.cos(r) + 3.6*math.sin(r), py - 9*math.sin(r) - 3.6*math.cos(r))
            p3 = (px - 9*math.cos(r) - 3.6*math.sin(r), py - 9*math.sin(r) + 3.6*math.cos(r))
            svg.append(f'<polyline points="{p2[0]:.1f},{p2[1]:.1f} {px},{py} {p3[0]:.1f},{p3[1]:.1f}" '
                       f'fill="none" stroke="{color}" stroke-width="1.1"/>')
        else:
            p2 = (x2 - 8*math.cos(r) + 3.4*math.sin(r), ty - 8*math.sin(r) - 3.4*math.cos(r))
            p3 = (x2 - 8*math.cos(r) - 3.4*math.sin(r), ty - 8*math.sin(r) + 3.4*math.cos(r))
            svg.append(f'<polygon points="{x2},{ty} {p2[0]:.1f},{p2[1]:.1f} {p3[0]:.1f},{p3[1]:.1f}" fill="{color}"/>')
        # 文字位置
        left, right = min(x1, x2), max(x1, x2)
        maxw = right - left - 10
        for k, ln in enumerate(lines):
            est = sum(11 if ord(c) > 0x2000 else 5.9 for c in ln) * 10.5 / 11
            tx = left + 6 if est < maxw else left + 3
            svg.append(f'<text x="{tx:.0f}" y="{ty-3+k*LINE_H}" font-size="10.5" fill="#26364A" '
                       f'font-family="Microsoft YaHei">{ln}</text>')

    # 头部
    for p in participants:
        x = xs[p['id']]
        w = gap - 6
        if p.get('actor'):
            cx, cy = x, TOP + 4
            svg.append(f'<circle cx="{cx}" cy="{cy+4}" r="3.6" fill="none" stroke="#3F5E80" stroke-width="1.1"/>')
            svg.append(f'<line x1="{cx}" y1="{cy+8}" x2="{cx}" y2="{cy+16}" stroke="#3F5E80" stroke-width="1.1"/>')
            svg.append(f'<line x1="{cx-5}" y1="{cy+11}" x2="{cx+5}" y2="{cy+11}" stroke="#3F5E80" stroke-width="1.1"/>')
            svg.append(f'<line x1="{cx}" y1="{cy+16}" x2="{cx-4}" y2="{cy+22}" stroke="#3F5E80" stroke-width="1.1"/>')
            svg.append(f'<line x1="{cx}" y1="{cy+16}" x2="{cx+4}" y2="{cy+22}" stroke="#3F5E80" stroke-width="1.1"/>')
            for k, ln in enumerate(p['lines']):
                svg.append(f'<text x="{cx}" y="{TOP+HEAD_H-4+k*0}" font-size="10.5" fill="#1B2A3D" '
                           f'text-anchor="middle" font-family="Microsoft YaHei">{ln}</text>')
        else:
            hh = HEAD_H - 8
            svg.append(f'<rect x="{x-w/2}" y="{TOP}" width="{w}" height="{hh}" rx="2.5" fill="#E9F1FB" '
                       f'stroke="#7C99B8" stroke-width="1.1"/>')
            for k, ln in enumerate(p['lines']):
                yy = TOP + hh/2 + (k - (len(p['lines'])-1)/2) * 12 + 3.6
                svg.append(f'<text x="{x}" y="{yy:.1f}" font-size="10.5" fill="#16233A" text-anchor="middle" '
                           f'font-family="Microsoft YaHei">{ln}</text>')

    for nt in notes:
        svg.append(f'<text x="{nt["x"]}" y="{nt["y"]}" font-size="9.5" fill="#5E6E82" '
                   f'font-family="Microsoft YaHei">{nt["t"]}</text>')

    html = f'''<!DOCTYPE html><html lang="zh-CN"><head><meta charset="UTF-8"><style>
*{{box-sizing:border-box}} body{{margin:0;background:#fff}}
.canvas{{position:relative;width:{W}px;height:{H}px;background:#fff}}
</style></head><body><div class="canvas">
<svg width="{W}" height="{H}">{''.join(svg)}</svg></div></body></html>'''

    p_html = os.path.join(OUT, fname + '.html')
    open(p_html, 'w', encoding='utf-8').write(html)
    subprocess.run([CHROME, '--headless=new', '--disable-gpu', '--hide-scrollbars',
                    '--force-device-scale-factor=2', f'--window-size={W},{H}',
                    f'--screenshot={p_html.replace(".html", ".png")}',
                    'file:///' + p_html.replace('\\', '/')], capture_output=True)
    print('OK', fname, f'({W}x{H})')
    return W, H
