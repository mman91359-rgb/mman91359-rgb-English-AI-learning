# -*- coding: utf-8 -*-
import os, subprocess

OUT = r"D:\AI-EnglishLearning\AI-EnglishLearning\English_AI\docs\Workbuddy\图片"
CHROME = r"C:\Program Files\Google\Chrome\Application\chrome.exe"
W, H = 605, 600
DX, DY = 12, 7

def cube(x, y, w, h, name, sub=''):
    p = []
    p.append(f'<polygon points="{x},{y} {x+DX},{y-DY} {x+w+DX},{y-DY} {x+w},{y}" fill="#E4ECF7" stroke="#8AA2BE" stroke-width="1.1"/>')
    p.append(f'<polygon points="{x+w},{y} {x+w+DX},{y-DY} {x+w+DX},{y+h-DY} {x+w},{y+h}" fill="#D6E2F1" stroke="#8AA2BE" stroke-width="1.1"/>')
    p.append(f'<polygon points="{x},{y} {x+w},{y} {x+w},{y+h} {x},{y+h}" fill="#FFFFFF" stroke="#8AA2BE" stroke-width="1.1"/>')
    cy = y + h/2 + (0 if not sub else -4)
    p.append(f'<text x="{x+w/2}" y="{cy+4}" text-anchor="middle" font-size="13.5" font-weight="700" fill="#1B2A3D" font-family="Consolas,monospace">{name}</text>')
    if sub:
        p.append(f'<text x="{x+w/2}" y="{y+h/2+13}" text-anchor="middle" font-size="9.5" fill="#6C7C90" font-family="Microsoft YaHei">{sub}</text>')
    return '\n'.join(p)

def arrow(d, dash=False):
    s = f'<path d="{d}" fill="none" stroke="#5F7FA4" stroke-width="1.2"' + (' stroke-dasharray="5,3"' if dash else '') + '/>'
    return s

def tri(x, y, ang):
    import math
    r = ang * math.pi / 180
    p2 = (x - 8*math.cos(r) + 3.4*math.sin(r), y - 8*math.sin(r) - 3.4*math.cos(r))
    p3 = (x - 8*math.cos(r) - 3.4*math.sin(r), y - 8*math.sin(r) + 3.4*math.cos(r))
    return f'<polygon points="{x},{y} {p2[0]:.1f},{p2[1]:.1f} {p3[0]:.1f},{p3[1]:.1f}" fill="#5F7FA4"/>'

def hollow(x, y, ang):
    import math
    r = ang * math.pi / 180
    p2 = (x - 9*math.cos(r) + 4.2*math.sin(r), y - 9*math.sin(r) - 4.2*math.cos(r))
    p3 = (x - 9*math.cos(r) - 4.2*math.sin(r), y - 9*math.sin(r) + 4.2*math.cos(r))
    return f'<polygon points="{x},{y} {p2[0]:.1f},{p2[1]:.1f} {p3[0]:.1f},{p3[1]:.1f}" fill="#fff" stroke="#5F7FA4" stroke-width="1.2"/>'

svg = []
# 分层背景带
bands = [(30, 122, '接入层'), (132, 332, '业务层'), (342, 442, '持久层'), (452, 548, '模型层')]
for y0, y1, nm in bands:
    svg.append(f'<rect x="0" y="{y0}" width="448" height="{y1-y0}" fill="#F1F5FB"/>')
    svg.append(f'<text x="6" y="{y0+16}" font-size="10.5" fill="#8B9BAF" font-family="Microsoft YaHei">{nm}</text>')

# 立方体
svg.append(cube(86, 52, 170, 46, 'controller', '@RestController'))
svg.append(cube(86, 158, 170, 46, 'service', '业务接口'))
svg.append(cube(86, 262, 170, 46, 'service.impl', '业务实现'))
svg.append(cube(86, 366, 170, 46, 'mapper', '数据访问'))
svg.append(cube(86, 470, 170, 46, 'entity', '数据库实体'))
svg.append(cube(296, 470, 152, 46, 'dto', '传输对象'))

# 基础设施包
infra = [('config', 46), ('handler', 116), ('util', 186), ('client', 256), ('event', 326), ('schedule', 396), ('migration', 466)]
for nm, y in infra:
    svg.append(cube(468, y, 118, 40, nm))
svg.append(f'<rect x="454" y="14" width="146" height="516" fill="none" stroke="#B9C7D8" stroke-width="1" stroke-dasharray="4,3" rx="4"/>')
svg.append(f'<text x="428" y="552" text-anchor="start" font-size="9.5" fill="#6C7C90" font-family="Microsoft YaHei">基础设施包（各服务按需依赖）</text>')

# 连线
svg.append(arrow('M 171 98 L 171 158'))
svg.append(tri(171, 158, 90))
svg.append(arrow('M 171 262 L 171 204', True))
svg.append(hollow(171, 204, 270))
svg.append(arrow('M 171 308 L 171 366'))
svg.append(tri(171, 366, 90))
svg.append(arrow('M 171 412 L 171 470'))
svg.append(tri(171, 470, 90))
svg.append(arrow('M 256 292 L 372 292 L 372 470'))
svg.append(tri(372, 470, 90))
svg.append(arrow('M 256 392 L 332 392 L 332 470'))
svg.append(tri(332, 470, 90))

# 标签
lbls = [(178, 132, '调用'), (110, 236, '实现'), (178, 341, '调用'),
        (296, 286, '传参'), (268, 386, '结果映射')]
for x, y, t in lbls:
    svg.append(f'<text x="{x}" y="{y}" font-size="10" fill="#4C7EA8" font-family="Microsoft YaHei">{t}</text>')

html = f'''<!DOCTYPE html><html lang="zh-CN"><head><meta charset="UTF-8"><style>
*{{box-sizing:border-box}} body{{margin:0;background:#fff}}
.canvas{{position:relative;width:{W}px;height:{H}px;background:#fff}}
</style></head><body><div class="canvas">
<svg width="{W}" height="{H}">{''.join(svg)}</svg>
</div></body></html>'''

p = os.path.join(OUT, '图3.14 后端分层结构与包组织图.html')
open(p, 'w', encoding='utf-8').write(html)
subprocess.run([CHROME, '--headless=new', '--disable-gpu', '--hide-scrollbars',
                '--force-device-scale-factor=2', f'--window-size={W},{H}',
                f'--screenshot={p.replace(".html", ".png")}', 'file:///' + p.replace('\\', '/')],
               capture_output=True)
print('OK')
