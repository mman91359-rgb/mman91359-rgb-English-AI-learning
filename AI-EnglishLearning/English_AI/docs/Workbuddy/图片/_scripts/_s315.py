# -*- coding: utf-8 -*-
import sys
sys.path.insert(0, r"D:\AI-EnglishLearning\AI-EnglishLearning\English_AI\docs\Workbuddy\图片\_scripts")
from _seq import render

P = [
    dict(id='u', lines=['用户'], actor=True),
    dict(id='v', lines=['RegisterView', '前端注册页']),
    dict(id='c', lines=['UserController']),
    dict(id='s', lines=['UserService', 'Impl']),
    dict(id='m', lines=['UserMapper']),
    dict(id='r', lines=['RadarService']),
]

M = [
    dict(f='u', t='v', text='填写注册表单', type='sync'),
    dict(f='v', t='c', text='POST /api/user/register', type='sync'),
    dict(f='c', t='c', text='校验验证码、密码强度\n手机号或邮箱至少一个', type='sync', self=True),
    dict(f='c', t='v', text='400 参数错误提示', type='ret'),
    dict(f='c', t='s', text='register(RegisterRequest)', type='sync'),
    dict(f='s', t='m', text='getByAccount(phone/email)', type='sync'),
    dict(f='m', t='s', text='SysUser 或 null', type='ret'),
    dict(f='s', t='c', text='"该手机号/邮箱已被注册"', type='ret'),
    dict(f='s', t='s', text='PasswordUtil.encode（BCrypt）', type='sync', self=True),
    dict(f='s', t='m', text='insert(sys_user)', type='sync'),
    dict(f='s', t='r', text='initRadar(userId, cetLevel)', type='sync'),
    dict(f='r', t='r', text='insert(user_ability_radar)\nelo=1000，六维 0', type='sync', self=True),
    dict(f='s', t='c', text='userId', type='ret'),
    dict(f='c', t='v', text='200 + userId', type='ret'),
    dict(f='v', t='u', text='注册成功，跳转定级测评页', type='ret'),
]

F = [
    dict(label='alt', from_=2, to=13, else_=[(3, '校验通过')]),
    dict(label='alt', from_=7, to=12, else_=[(8, '可注册')], inset=6),
]

# 适配渲染器参数名
F2 = [dict(label=f['label'], **{'from': f['from_'], 'to': f['to']},
           **({'else': f['else_']} if 'else_' in f else {}),
           **({'inset': f['inset']} if 'inset' in f else {})) for f in F]

for p in P:
    if p['id'] == 'c':
        p['act'] = [[2, 13]]
    if p['id'] == 's':
        p['act'] = [[4, 12]]
    if p['id'] == 'm':
        p['act'] = [[5, 6], [9, 9]]
    if p['id'] == 'r':
        p['act'] = [[11, 11]]

render('图3.15 用户注册顺序图', P, M, F2)
