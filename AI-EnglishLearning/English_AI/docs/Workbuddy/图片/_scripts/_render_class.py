# -*- coding: utf-8 -*-
"""按 Word 版心宽度 1:1 出类图（605 CSS px = 6.3 inch @96dpi）。"""
import os, subprocess, sys

OUT = r"D:\AI-EnglishLearning\AI-EnglishLearning\English_AI\docs\Workbuddy\图片"
CHROME = r"C:\Program Files\Google\Chrome\Application\chrome.exe"

FS = 11.0          # 行字号
ROWH = 17
HEADH = 26
PADB = 8


def measure(s, fs=FS, bold=False):
    """估算文本宽度：中文=fs，英文=0.55fs"""
    w = 0.0
    for ch in s:
        w += fs if ord(ch) > 0x2000 else fs * (0.575 if bold else 0.55)
    return w


def esc(s):
    return s.replace('&', '&amp;').replace('<', '&lt;').replace('>', '&gt;')


def render(path_html, cls_list, links, W, H, title):
    boxh = {}
    for c in cls_list:
        h = HEADH + len(c['fields']) * ROWH + len(c['methods']) * ROWH + 20
        if c['fields'] and c['methods']:
            h += 5
        if not c['fields'] and not c['methods']:
            h += 0
        c['h'] = h
        boxh[c['name']] = h

    parts = []
    parts.append(f'''<!DOCTYPE html>
<html lang="zh-CN"><head><meta charset="UTF-8"><style>
* {{ box-sizing:border-box; }}
body {{ margin:0; padding:0; background:#fff;
       font-family:"Microsoft YaHei","Segoe UI",sans-serif; color:#22303F; }}
.canvas {{ position:relative; width:{W}px; height:{H}px; background:#fff; }}
svg.links {{ position:absolute; left:0; top:0; width:{W}px; height:{H}px; z-index:1; }}
.cls {{ position:absolute; z-index:2; background:#fff; border:1.2px solid #9BAEC4;
        border-radius:3px; overflow:hidden; box-shadow:0 0 0 0.6px rgba(150,170,195,.25); }}
.hd {{ height:{HEADH}px; display:flex; align-items:center; gap:6px; padding:0 8px;
       background:#ECF2FA; border-bottom:1.2px solid #9BAEC4; }}
.hd .ic {{ width:16px; height:16px; border-radius:50%; border:1.3px solid #5E7FA8;
           color:#4A6C93; font-size:9.5px; font-weight:700; line-height:13px;
           text-align:center; flex:0 0 auto; font-family:Georgia,serif; }}
.hd .nm {{ font-size:11.5px; font-weight:700; color:#16233A; letter-spacing:.2px;
           font-style:italic; }}
.hd .nm.plain {{ font-style:normal; }}
.ft {{ padding:2px 0 {PADB}px; }}
.r {{ height:{ROWH}px; display:flex; align-items:center; padding:0 8px;
      font-size:{FS}px; font-family:Consolas,"Courier New",monospace;
      white-space:nowrap; }}
.r .v {{ flex:0 0 12px; color:#7A8798; }}
.r .s {{ flex:0 1 auto; color:#1E2A3A; }}
.r .t {{ flex:1 1 auto; text-align:right; color:#4C7EA8; padding-left:6px; }}
.sep {{ height:1px; background:#DCE4EE; margin:2px 6px 2px; }}
.note {{ position:absolute; z-index:2; font-size:10px; color:#5E6E82;
         background:#FAFBFD; border:1px dashed #B8C6D8; border-radius:3px;
         padding:4px 8px; }}
.lb {{ position:absolute; z-index:3; font-size:9.5px; color:#4C7EA8; background:#fff;
       padding:0 2px; }}
</style></head><body><div class="canvas">
<svg class="links">''')

    for lk in links:
        d = lk['path']
        dash = ' stroke-dasharray="5,3"' if lk['style'] in ('impl', 'dashdep') else ''
        parts.append(f'<path d="{d}" fill="none" stroke="#6E8CAC" stroke-width="1.15"{dash}/>')
        x, y, ang = lk['arrow']
        if lk['style'] == 'impl':
            # 空心三角
            a = ang
            import math
            r = a * math.pi / 180
            p1 = (x, y)
            p2 = (x - 9 * math.cos(r) + 4.2 * math.sin(r), y - 9 * math.sin(r) - 4.2 * math.cos(r))
            p3 = (x - 9 * math.cos(r) - 4.2 * math.sin(r), y - 9 * math.sin(r) + 4.2 * math.cos(r))
            parts.append(f'<polygon points="{p1[0]:.1f},{p1[1]:.1f} {p2[0]:.1f},{p2[1]:.1f} {p3[0]:.1f},{p3[1]:.1f}" fill="#fff" stroke="#6E8CAC" stroke-width="1.15"/>')
        else:
            import math
            r = ang * math.pi / 180
            p2 = (x - 8 * math.cos(r) + 3.4 * math.sin(r), y - 8 * math.sin(r) - 3.4 * math.cos(r))
            p3 = (x - 8 * math.cos(r) - 3.4 * math.sin(r), y - 8 * math.sin(r) + 3.4 * math.cos(r))
            parts.append(f'<polygon points="{x},{y} {p2[0]:.1f},{p2[1]:.1f} {p3[0]:.1f},{p3[1]:.1f}" fill="#6E8CAC"/>')
        if lk.get('label'):
            parts.append(f'<text x="{lk["lx"]}" y="{lk["ly"]}" font-size="9.5" fill="#4C7EA8" font-family="Microsoft YaHei">{lk["label"]}</text>')

    parts.append('</svg>')

    for c in cls_list:
        parts.append(f'<div class="cls" style="left:{c["x"]}px;top:{c["y"]}px;width:{c["w"]}px;height:{c["h"]}px;">')
        nmcls = 'nm plain' if c.get('plain') else 'nm'
        parts.append(f'<div class="hd"><div class="ic">{c["kind"]}</div><div class="{nmcls}">{esc(c["name"])}</div></div>')
        if c['fields']:
            parts.append('<div class="ft">')
            for f in c['fields']:
                parts.append(f'<div class="r"><span class="v">{f[0]}</span><span class="s">{esc(f[1])}</span>'
                             + (f'<span class="t">{esc(f[2])}</span>' if len(f) > 2 else '')
                             + '</div>')
            parts.append('</div>')
        if c['fields'] and c['methods']:
            parts.append('<div class="sep"></div>')
        if c['methods']:
            parts.append('<div class="ft">')
            for m in c['methods']:
                parts.append(f'<div class="r"><span class="v">{m[0]}</span><span class="s">{esc(m[1])}</span>'
                             + (f'<span class="t">{esc(m[2])}</span>' if len(m) > 2 else '')
                             + '</div>')
            parts.append('</div>')
        parts.append('</div>')

    for nt in (title or []):
        parts.append(f'<div class="note" style="left:{nt["x"]}px;top:{nt["y"]}px;width:{nt["w"]}px;">{nt["t"]}</div>')

    parts.append('</div></body></html>')

    with open(path_html, 'w', encoding='utf-8') as f:
        f.write('\n'.join(parts))

    png = path_html.replace('.html', '.png')
    args = [CHROME, '--headless=new', '--disable-gpu', '--hide-scrollbars',
            '--force-device-scale-factor=2', f'--window-size={W},{H}',
            f'--screenshot={png}', 'file:///' + path_html.replace('\\', '/')]
    subprocess.run(args, capture_output=True)
    print('OK', os.path.basename(png))
