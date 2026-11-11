# -*- coding: utf-8 -*-
import sys, os
sys.path.insert(0, r"D:\AI-EnglishLearning\AI-EnglishLearning\English_AI\docs\Workbuddy\图片")
from _render_class import render, OUT

W, H = 605, 662
cls = [
    dict(name='UserController', kind='C', x=4, y=6, w=330,
         fields=[],
         methods=[('+', 'register(RegisterRequest)', 'Result<Long>'),
                  ('+', 'login(LoginRequest)', 'Result<LoginResponse>'),
                  ('+', 'info(Long)', 'Result<SysUser>'),
                  ('+', 'byUsername(String)', 'Result<SysUser>'),
                  ('+', 'updateNickname(Map)', 'Result<String>'),
                  ('+', 'updatePassword(Map)', 'Result<Boolean>'),
                  ('+', 'updatePhone(Map)', 'Result<String>'),
                  ('+', 'uploadAvatar(Long, MultipartFile)', 'Result<String>')]),
    dict(name='UserService', kind='I', x=4, y=210, w=330,
         fields=[],
         methods=[('+', 'register(RegisterRequest)', 'Long'),
                  ('+', 'login(LoginRequest)', 'LoginResponse'),
                  ('+', 'getById(Long)', 'SysUser'),
                  ('+', 'getByAccount(String)', 'SysUser'),
                  ('+', 'updatePassword(Long, String, String)', 'boolean')]),
    dict(name='UserServiceImpl', kind='C', x=4, y=361, w=330,
         fields=[('-', 'userMapper', 'UserMapper'),
                 ('-', 'radarService', 'UserAbilityRadarService')],
         methods=[('+', 'register(RegisterRequest)', 'Long'),
                  ('+', 'login(LoginRequest)', 'LoginResponse'),
                  ('+', 'getByAccount(String)', 'SysUser')]),
    dict(name='UserMapper', kind='I', x=4, y=517, w=330,
         fields=[],
         methods=[('', 'extends BaseMapper<SysUser>', '')]),
    dict(name='RegisterRequest', kind='C', x=350, y=6, w=251,
         fields=[('-', 'nickname', 'String'),
                 ('-', 'password', 'String'),
                 ('-', 'phone', 'String'),
                 ('-', 'email', 'String'),
                 ('-', 'cetLevel', 'String'),
                 ('-', 'code', 'String')],
         methods=[]),
    dict(name='LoginRequest', kind='C', x=350, y=172, w=251,
         fields=[('-', 'account', 'String'),
                 ('-', 'password', 'String')],
         methods=[]),
    dict(name='LoginResponse', kind='C', x=350, y=262, w=251,
         fields=[('-', 'token', 'String'),
                 ('-', 'userId', 'Long'),
                 ('-', 'nickname', 'String'),
                 ('-', 'avatarUrl', 'String'),
                 ('-', 'cetLevel', 'String'),
                 ('-', 'roles', 'String'),
                 ('-', 'eloScore', 'Integer'),
                 ('-', 'eloLevel', 'String')],
         methods=[]),
    dict(name='SysUser', kind='C', x=350, y=454, w=251,
         fields=[('-', 'id', 'Long'),
                 ('-', 'username', 'String'),
                 ('-', 'password', 'String'),
                 ('-', 'nickname', 'String'),
                 ('-', 'phone', 'String'),
                 ('-', 'email', 'String'),
                 ('-', 'cetLevel', 'String'),
                 ('-', 'roles', 'String'),
                 ('-', 'status', 'Integer')],
         methods=[]),
]

links = [
    dict(path='M 169 188 L 169 210', arrow=(169, 210, 90), style='dep'),
    dict(path='M 169 361 L 169 341', arrow=(169, 341, 270), style='impl'),
    dict(path='M 169 497 L 169 517', arrow=(169, 517, 90), style='dep'),
    dict(path='M 334 80 L 350 80', arrow=(350, 80, 0), style='dep'),
    dict(path='M 334 295 L 350 295', arrow=(350, 295, 0), style='dep'),
    dict(path='M 334 325 L 342 325 L 342 540 L 350 540', arrow=(350, 540, 0), style='dep'),
]

notes = [
    dict(x=4, y=590, w=330, t='注：username 由 nickname 同步生成，登录标识为 phone / email'),
]

render(os.path.join(OUT, '图3.11 用户注册登录业务类图.html'), cls, links, W, H, notes)
