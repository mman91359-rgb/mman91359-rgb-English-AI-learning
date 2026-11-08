#!/usr/bin/env node
/**
 * 从 word_dictionary 的例句批量生成词汇填空题（FILL_BLANK）。
 *
 * 用法：
 *   node scripts/generate-vocab-questions.mjs --dry-run
 *   node scripts/generate-vocab-questions.mjs --out docs/pending-migrations --batch-size 500
 *   node scripts/generate-vocab-questions.mjs --level CET4 --limit 50 --dry-run
 *
 * 数据来源：系统 mysql 客户端导出 word_dictionary（不引入 npm 依赖）。
 * 难度来源：优先用 difficulty_hint 列；列不存在时读 --difficulty 指定的 JSON。
 *
 * 规则：
 *   - 整词边界、大小写不敏感匹配；词形集合 = 原形 + 规则变形 + 不规则表 + z/s 变体
 *   - 每题只挖一处；命中 0 次或 ≥2 次都跳过
 *   - correct_answer = 句中表面词形（小写）；answer_word = 词条原形
 *   - analysis 里的原句同样挖空（toQuestionVO 会无条件下发 analysis，否则泄题）
 */

import fs from 'node:fs'
import path from 'node:path'
import crypto from 'node:crypto'
import { execFileSync } from 'node:child_process'
import { fileURLToPath } from 'node:url'
import { readEnv, sqlEscape } from './lib/dump-parse.mjs'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const ROOT = path.resolve(__dirname, '..')
const DB = 'exercise_db'

// ---------------------------------------------------------------- 词形

const IRREGULAR = {
  be: ['am', 'is', 'are', 'was', 'were', 'been', 'being'],
  go: ['went', 'gone', 'goes', 'going'],
  have: ['has', 'had', 'having'],
  do: ['did', 'done', 'does', 'doing'],
  make: ['made', 'makes', 'making'],
  take: ['took', 'taken', 'takes', 'taking'],
  come: ['came', 'comes', 'coming'],
  see: ['saw', 'seen', 'sees', 'seeing'],
  get: ['got', 'gotten', 'gets', 'getting'],
  give: ['gave', 'given', 'gives', 'giving'],
  know: ['knew', 'known', 'knows', 'knowing'],
  think: ['thought', 'thinks', 'thinking'],
  buy: ['bought', 'buys', 'buying'],
  bring: ['brought', 'brings', 'bringing'],
  teach: ['taught', 'teaches', 'teaching'],
  catch: ['caught', 'catches', 'catching'],
  build: ['built', 'builds', 'building'],
  send: ['sent', 'sends', 'sending'],
  spend: ['spent', 'spends', 'spending'],
  find: ['found', 'finds', 'finding'],
  tell: ['told', 'tells', 'telling'],
  say: ['said', 'says', 'saying'],
  pay: ['paid', 'pays', 'paying'],
  meet: ['met', 'meets', 'meeting'],
  keep: ['kept', 'keeps', 'keeping'],
  sleep: ['slept', 'sleeps', 'sleeping'],
  feel: ['felt', 'feels', 'feeling'],
  leave: ['left', 'leaves', 'leaving'],
  lose: ['lost', 'loses', 'losing'],
  win: ['won', 'wins', 'winning'],
  sit: ['sat', 'sits', 'sitting'],
  stand: ['stood', 'stands', 'standing'],
  understand: ['understood', 'understands', 'understanding'],
  write: ['wrote', 'written', 'writes', 'writing'],
  speak: ['spoke', 'spoken', 'speaks', 'speaking'],
  break: ['broke', 'broken', 'breaks', 'breaking'],
  choose: ['chose', 'chosen', 'chooses', 'choosing'],
  freeze: ['froze', 'frozen', 'freezes', 'freezing'],
  hide: ['hid', 'hidden', 'hides', 'hiding'],
  ride: ['rode', 'ridden', 'rides', 'riding'],
  rise: ['rose', 'risen', 'rises', 'rising'],
  drive: ['drove', 'driven', 'drives', 'driving'],
  eat: ['ate', 'eaten', 'eats', 'eating'],
  fall: ['fell', 'fallen', 'falls', 'falling'],
  forget: ['forgot', 'forgotten', 'forgets', 'forgetting'],
  begin: ['began', 'begun', 'begins', 'beginning'],
  drink: ['drank', 'drunk', 'drinks', 'drinking'],
  sing: ['sang', 'sung', 'sings', 'singing'],
  swim: ['swam', 'swum', 'swims', 'swimming'],
  run: ['ran', 'runs', 'running'],
  become: ['became', 'becomes', 'becoming'],
  hold: ['held', 'holds', 'holding'],
  lead: ['led', 'leads', 'leading'],
  grow: ['grew', 'grown', 'grows', 'growing'],
  throw: ['threw', 'thrown', 'throws', 'throwing'],
  draw: ['drew', 'drawn', 'draws', 'drawing'],
  fly: ['flew', 'flown', 'flies', 'flying'],
  wear: ['wore', 'worn', 'wears', 'wearing'],
  bear: ['bore', 'borne', 'bears', 'bearing'],
  beat: ['beaten', 'beats', 'beating'],
  bite: ['bit', 'bitten', 'bites', 'biting'],
  blow: ['blew', 'blown', 'blows', 'blowing'],
  deal: ['dealt', 'deals', 'dealing'],
  dig: ['dug', 'digs', 'digging'],
  fight: ['fought', 'fights', 'fighting'],
  hang: ['hung', 'hangs', 'hanging'],
  hit: ['hits', 'hitting'],
  hurt: ['hurts', 'hurting'],
  lend: ['lent', 'lends', 'lending'],
  lie: ['lay', 'lain', 'lies', 'lying'],
  mean: ['meant', 'means', 'meaning'],
  put: ['puts', 'putting'],
  read: ['reads', 'reading'],
  ring: ['rang', 'rung', 'rings', 'ringing'],
  seek: ['sought', 'seeks', 'seeking'],
  sell: ['sold', 'sells', 'selling'],
  shut: ['shuts', 'shutting'],
  sink: ['sank', 'sunk', 'sinks', 'sinking'],
  steal: ['stole', 'stolen', 'steals', 'stealing'],
  wear_out: [],
  child: ['children'],
  man: ['men'],
  woman: ['women'],
  foot: ['feet'],
  tooth: ['teeth'],
  mouse: ['mice'],
  goose: ['geese'],
  criterion: ['criteria'],
  phenomenon: ['phenomena'],
  datum: ['data'],
  analysis: ['analyses'],
  basis: ['bases'],
  crisis: ['crises'],
  thesis: ['theses'],
  index: ['indices', 'indexes'],
  leaf: ['leaves'],
  life: ['lives'],
  wife: ['wives'],
  knife: ['knives'],
  half: ['halves'],
  shelf: ['shelves'],
  thief: ['thieves'],
  wolf: ['wolves'],
  good: ['better', 'best'],
  bad: ['worse', 'worst'],
  far: ['farther', 'further', 'farthest', 'furthest'],
  little: ['less', 'least'],
  many: ['more', 'most'],
  much: ['more', 'most'],
}

/** 不可数名词：不加规则复数（仍可用于句中命中） */
const UNCOUNTABLE = new Set([
  'hardware', 'software', 'furniture', 'equipment', 'information', 'advice', 'news',
  'luggage', 'machinery', 'merchandise', 'baggage', 'homework', 'knowledge', 'research',
  'evidence', 'traffic', 'weather', 'clothing', 'jewelry', 'scenery', 'poetry',
])

/** CVC 结尾且需要双写的动词白名单（多音节也会双写） */
const DOUBLING_WHITELIST = new Set([
  'begin', 'occur', 'refer', 'prefer', 'infer', 'admit', 'commit', 'permit',
  'regret', 'forget', 'control', 'patrol', 'compel', 'expel', 'rebel', 'transfer',
  'upset', 'omit', 'submit', 'equip', 'recur', 'confer', 'deter', 'forbid',
])

/** IRREGULAR 里属于"不规则复数"的词；其余条目是动词/形容词的不规则变形 */
const IRREGULAR_NOUNS = new Set([
  'child', 'man', 'woman', 'foot', 'tooth', 'mouse', 'goose', 'criterion',
  'phenomenon', 'datum', 'analysis', 'basis', 'crisis', 'thesis', 'index',
  'leaf', 'life', 'wife', 'knife', 'half', 'shelf', 'thief', 'wolf',
])

/** IRREGULAR 里属于"不规则比较级"的形容词 */
const IRREGULAR_ADJS = new Set(['good', 'bad', 'far', 'little', 'many', 'much'])

/** 精确屏蔽的 external_key（例句涉及敏感政治事件，报告中不复述原句） */
const EXACT_BLOCKED_KEYS = new Set(['vocab-auto-10765-1'])

/**
 * 政治敏感事件 / 人物：与目标词无关，整句命中即跳过。
 */
const POLITICAL_PATTERNS = [
  /tiananmen/i,
  /falun/i,
  /dalai\s+lama/i,
  /tibet\w*\s+\w*\s*independen/i,
  /taiwan\w*\s+\w*\s*independen/i,
  /xinjiang\w*\s+\w*\s*independen/i,
]

/**
 * 暴力 / 色情 / 歧视：允许目标词本身作为答案出现，只拦"句中其它位置"的敏感情节。
 * 判定前会先把目标词所在片段删掉（见 classify），这样 massacre 这类词条仍可出题。
 */
const CONTENT_PATTERNS = [
  /massacre/i,
  /genocide/i,
  /bloodbath/i,
  /behead/i,
  /decapitat/i,
  /dismember/i,
  /porn/i,
  /prostitut/i,
  /brothel/i,
  /\brape\b/i,
  /sexual\s+intercourse/i,
  /nigger/i,
  /\bchink\b/i,
  /faggot/i,
  /\bretard/i,
  /\bslut\b/i,
  /\bwhore\b/i,
]

function isPoliticalSensitive(text) {
  return POLITICAL_PATTERNS.some((re) => re.test(text))
}

function isContentSensitive(text) {
  return CONTENT_PATTERNS.some((re) => re.test(text))
}

const isVowel = (c) => 'aeiou'.includes(c)

/**
 * 按词性归类为六类：verb / noun / adj / adv / other / unknown。
 * other（介词、连词、代词、数词、冠词、助动词）不生成任何变形；
 * unknown 只用于句中命中，不写入 accepted_answers。
 */
function categoryOf(pos) {
  // 词库里的 pos 有两种写法：导入词条是缩写（vt/n/a），V1.0.1 种子是全称（verb/adjective/noun）
  const p = String(pos || '').trim().toLowerCase()
  const hit = (re) => re.test(p)
  if (hit(/^(vt|vi|v|verb)(\.|\b|$)/)) return 'verb'
  if (hit(/^(n|noun)(\.|\b|$)/)) return 'noun'
  if (hit(/^(adv|adverb)(\.|\b|$)/)) return 'adv'
  if (hit(/^(adj|adjective|a)(\.|\b|$)/)) return 'adj'
  if (hit(/^(prep|conj|pron|num|aux|art|interj|int)(\.|\b|$)/)) return 'other'
  return 'unknown'
}

/**
 * 可分级形容词/副词：只有单音节、或以 y/le/ow/er 结尾的短双音节词才加 er/est。
 * 避免 recent → recenter/recentest 这类不地道形态。
 */
function isGradable(base) {
  if (base.length > 7) return false
  if (/(ed|ing|ous|ful|less|ive|able|ible|al|ary|ic)$/.test(base)) return false
  const groups = (base.match(/[aeiouy]+/g) || []).length
  if (groups <= 1) return true
  return base.length <= 6 && /(y|le|ow|er)$/.test(base)
}

/**
 * 生成某个词干的规则变形。
 * - accepted：可以进入 accepted_answers 的合法变形
 * - matchOnly：只用于"句中命中"、但不预先接受的形态（未知词性、CVC 双写与非双写并存等）
 */
function inflect(base, cat, opts = {}) {
  const accepted = new Set()
  const matchOnly = new Set()

  if (cat === 'other') {
    return { accepted: [], matchOnly: [] }
  }

  const unknownOnly = cat === 'unknown'
  // unknown 时所有变形都只用于命中，不预先接受
  const add = (s) => {
    if (!s || s === base) return
    matchOnly.add(s)
    if (!unknownOnly) accepted.add(s)
  }
  const addMatch = (s) => {
    if (s && s !== base) matchOnly.add(s)
  }

  const last = base.slice(-1)
  const cvc =
    base.length >= 3 &&
    !isVowel(base[base.length - 3]) &&
    isVowel(base[base.length - 2]) &&
    !isVowel(last) &&
    !'wxy'.includes(last)

  const wantsPlural = cat === 'noun' || cat === 'verb' || cat === 'unknown'
  const wantsVerb = cat === 'verb' || cat === 'unknown'

  // 名词复数：不可数名词与不规则名词都不加规则复数
  const skipRegularPlural = cat === 'noun' && (opts.uncountable || opts.hasIrregular)

  if (wantsPlural && !skipRegularPlural) {
    let plural = null
    if (/(s|x|z|ch|sh)$/.test(base)) plural = base + 'es'
    else if (/[^aeiou]y$/.test(base)) plural = base.slice(0, -1) + 'ies'
    else plural = base + 's'

    if (plural !== base) {
      // 抽象名词不加复数；已是复数的 s 结尾词（goods/news/means）不再加 -es
      const abstractNoun = cat === 'noun' && /(ment|ness|ship|ism|hood|ity)$/.test(base)
      const alreadyPlural = cat === 'noun' && /s$/.test(base) && !/(ss|us|is)$/.test(base)
      if (abstractNoun || alreadyPlural) addMatch(plural)
      else add(plural)
    }
  }

  // CVC 动词：单音节或白名单词双写，其余（多音节如 abandon）接受非双写形态
  const syllables = (base.match(/[aeiouy]+/g) || []).length
  const doublingAccepted = DOUBLING_WHITELIST.has(base) || syllables <= 1

  if (wantsVerb) {
    if (last === 'e') add(base + 'd')
    else if (/[^aeiou]y$/.test(base)) add(base.slice(0, -1) + 'ied')
    else if (cvc) {
      if (doublingAccepted) {
        add(base + last + 'ed')
        addMatch(base + 'ed')
      } else {
        add(base + 'ed')
        addMatch(base + last + 'ed')
      }
    } else add(base + 'ed')

    if (/ie$/.test(base)) add(base.slice(0, -2) + 'ying')
    else if (last === 'e' && !/ee$/.test(base)) add(base.slice(0, -1) + 'ing')
    else if (cvc) {
      if (doublingAccepted) {
        add(base + last + 'ing')
        addMatch(base + 'ing')
      } else {
        add(base + 'ing')
        addMatch(base + last + 'ing')
      }
    } else add(base + 'ing')
  }

  // 形容词/副词默认不变形，只有可分级词给比较级/最高级
  if (cat === 'adj' || cat === 'adv') {
    if (isGradable(base)) {
      if (last === 'e') {
        add(base + 'r')
        add(base + 'st')
      } else if (/[^aeiou]y$/.test(base)) {
        add(base.slice(0, -1) + 'ier')
        add(base.slice(0, -1) + 'iest')
      } else {
        add(base + 'er')
        add(base + 'est')
      }
    }
  }

  return { accepted: [...accepted], matchOnly: [...matchOnly] }
}

function buildForms(word, pos) {
  const w = word.toLowerCase()
  const cat = categoryOf(pos)
  const bases = [w]
  // z/s 拼写变体：paralyze→paralyse、organize→organise、analyze→analyse
  if (/ze$/.test(w)) bases.push(w.replace(/ze$/, 'se'))

  const match = new Set([w])
  const accepted = new Set([w])
  const uncountable = UNCOUNTABLE.has(w) || /ware$/.test(w)
  const hasIrregular = Object.prototype.hasOwnProperty.call(IRREGULAR, w)

  for (const base of bases) {
    const { accepted: ok, matchOnly } = inflect(base, cat, { uncountable, hasIrregular })
    ok.forEach((f) => {
      match.add(f)
      accepted.add(f)
    })
    matchOnly.forEach((f) => match.add(f))
  }

  // 不规则表同时含动词、名词、形容词条目，按词性决定能否预先接受
  const acceptIrregular =
    cat === 'verb' ||
    (cat === 'noun' && IRREGULAR_NOUNS.has(w)) ||
    (cat === 'adj' && IRREGULAR_ADJS.has(w))

  for (const f of IRREGULAR[w] || []) {
    match.add(f)
    if (acceptIrregular) accepted.add(f)
  }

  return { matchForms: [...match], acceptedForms: [...accepted], category: cat }
}

const escapeReg = (s) => s.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')

/** 找出所有整词命中（跨 forms 去重位置） */
function findMatches(sentence, forms) {
  const hits = []
  const seen = new Set()
  for (const form of forms) {
    const re = new RegExp(`(?<![A-Za-z])${escapeReg(form)}(?![A-Za-z])`, 'gi')
    let m
    while ((m = re.exec(sentence)) !== null) {
      const key = `${m.index}:${m[0].length}`
      if (seen.has(key)) continue
      seen.add(key)
      hits.push({ start: m.index, end: m.index + m[0].length, text: m[0], form })
    }
  }
  hits.sort((a, b) => a.start - b.start)
  return hits
}

/** 泄漏校验：文本中不得再出现任何词形 */
function hasAnyForm(text, forms) {
  return forms.some((form) => new RegExp(`(?<![A-Za-z])${escapeReg(form)}(?![A-Za-z])`, 'i').test(text))
}

// ---------------------------------------------------------------- 数据源

function resolveMysql() {
  if (process.env.MYSQL_BIN) {
    for (const name of ['mysql.exe', 'mysql']) {
      const p = path.join(process.env.MYSQL_BIN, name)
      if (fs.existsSync(p)) return p
    }
  }
  for (const p of [
    'C:/Program Files/MySQL/MySQL Server 8.0/bin/mysql.exe',
    '/c/Program Files/MySQL/MySQL Server 8.0/bin/mysql.exe',
    '/usr/bin/mysql',
    '/usr/local/bin/mysql',
  ]) {
    if (fs.existsSync(p)) return p
  }
  throw new Error('找不到 mysql 客户端，请设置 MYSQL_BIN 指向 MySQL bin 目录')
}

function runQuery(mysqlBin, conn, sql) {
  return execFileSync(
    mysqlBin,
    [
      '-h', conn.host,
      '-P', conn.port,
      '-u', conn.user,
      '--default-character-set=utf8mb4',
      '--batch',
      '--skip-column-names',
      DB,
      '-e', sql,
    ],
    {
      encoding: 'utf8',
      env: { ...process.env, MYSQL_PWD: conn.password },
      maxBuffer: 256 * 1024 * 1024,
    },
  )
}

/** mysql --batch 会把值里的 \t \n \\ 转义，这里还原 */
function unescapeTsv(v) {
  return v.replace(/\\(.)/g, (_, c) => {
    if (c === 'n' || c === 't' || c === 'r') return ' '
    if (c === '0') return ''
    return c
  })
}

function loadWords(mysqlBin, conn, level) {
  const where = level && level !== 'ALL' ? ` WHERE \`level\` = '${sqlEscape(level)}'` : ''
  const sql =
    'SELECT `id`, `word`, `translation`, `example`, `level`, `pos` FROM `word_dictionary`' +
    where +
    ' ORDER BY `id`'
  const out = runQuery(mysqlBin, conn, sql)
  const rows = []
  for (const line of out.split('\n')) {
    if (!line) continue
    const parts = line.split('\t')
    if (parts.length < 6) continue
    rows.push({
      id: Number(parts[0]),
      word: unescapeTsv(parts[1]),
      translation: unescapeTsv(parts[2]),
      example: unescapeTsv(parts[3]),
      level: parts[4],
      pos: unescapeTsv(parts[5]),
    })
  }
  return rows
}

function columnExists(mysqlBin, conn, table, column) {
  const n = runQuery(
    mysqlBin,
    conn,
    `SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='${DB}' AND TABLE_NAME='${table}' AND COLUMN_NAME='${column}'`,
  ).trim()
  return n === '1'
}

function loadDifficultyFromJson(file) {
  if (!fs.existsSync(file)) throw new Error(`难度文件不存在: ${file}`)
  const data = JSON.parse(fs.readFileSync(file, 'utf8'))
  // 统一小写建键：dump 里的拼写可能带首字母大写（如 P.M.），与库中小写词对不上
  const map = new Map(
    Object.entries(data.words || {}).map(([w, d]) => [w.trim().toLowerCase(), d]),
  )
  console.log(`[info] 难度来源：${file}（${map.size} 条）`)
  return map
}

function loadDifficultyFromDb(mysqlBin, conn) {
  const out = runQuery(mysqlBin, conn, 'SELECT `word`, `difficulty_hint` FROM `word_dictionary` WHERE `difficulty_hint` IS NOT NULL')
  const map = new Map()
  for (const line of out.split('\n')) {
    if (!line) continue
    const i = line.lastIndexOf('\t')
    if (i < 0) continue
    map.set(unescapeTsv(line.slice(0, i)).trim().toLowerCase(), Number(line.slice(i + 1)))
  }
  return map
}

// ---------------------------------------------------------------- 生成

/**
 * 根据空位前的上下文推断该词的"用法词性"。
 * 只做保守判断，识别不出返回 null（不据此跳过）。
 */
function impliedUsage(sentence, start, surface) {
  const before = sentence.slice(Math.max(0, start - 48), start).toLowerCase()
  // 助动词规则只在空位是 -ing/-ed 形态时成立，否则 "have absolute trust" 这类会被误判为动词用法
  const inflected = /(ing|ed)$/.test(surface)
  if (
    inflected &&
    /\b(am|is|are|was|were|be|been|being|do|does|did|have|has|had|will|would|can|could|may|might|must|shall|should)(\s+\w+){0,2}\s*$/.test(
      before,
    )
  ) {
    return 'verb'
  }
  // 冠词/物主紧邻 → 名词用法（注意 "a brilliant mind" 里冠词修饰的是形容词，冲突判定见调用处）
  if (/\b(a|an|the|my|your|his|her|its|our|their|this|that|these|those)\s+$/.test(before)) return 'noun'
  // 程度副词紧邻 → 形容词/副词用法
  if (/\b(very|too|so|quite|rather|more|most|less|least)\s+$/.test(before)) return 'adj'
  return null
}

function classify(row, opts) {
  const word = (row.word || '').trim()
  if (word.length < 2) return { skip: 'not-single-word' }
  if (!/^[A-Za-z][A-Za-z'-]*$/.test(word)) return { skip: 'not-single-word' }
  const example = (row.example || '').trim()
  if (!example) return { skip: 'no-example' }
  if (example.length < opts.minLen || example.length > opts.maxLen) return { skip: 'length' }
  if (!row.translation) return { skip: 'no-translation' }
  if (!row.difficulty) return { skip: 'missing-difficulty' }

  // 敏感内容过滤（第一层）：精确键 + 政治事件。命中只记录 key，报告里不复述原句
  const externalKey = `vocab-auto-${row.id}-1`
  if (EXACT_BLOCKED_KEYS.has(externalKey)) return { skip: 'blocklist', externalKey }
  if (isPoliticalSensitive(`${example} ${row.translation}`)) return { skip: 'blocklist', externalKey }

  const { matchForms, acceptedForms, category } = buildForms(word, row.pos)
  const hits = findMatches(example, matchForms)
  if (hits.length === 0) return { skip: 'no-form-match' }
  if (hits.length > 1) return { skip: 'multi-occurrence' }

  const hit = hits[0]
  const surface = hit.text.toLowerCase()
  const lemma = word.toLowerCase()

  // 敏感内容过滤（第二层）：先把目标词所在片段删掉再匹配，
  // 这样 massacre 这类词条本身可以作答案，只有句子里出现"别的"敏感情节才拦
  const withoutTarget = `${example.slice(0, hit.start)} ${example.slice(hit.end)}`
  if (isContentSensitive(`${withoutTarget} ${row.translation}`)) {
    return { skip: 'blocklist', externalKey }
  }

  // c. 功能词/固定搭配：介词、连词、代词、数词、冠词、助动词不出词汇题
  if (category === 'other') return { skip: 'fixed-phrase' }

  // b. 词形歧义：表面形是 -ing/-ed，但词典词性是名词/形容词
  if (surface !== lemma && /(ing|ed)$/.test(surface) && (category === 'noun' || category === 'adj')) {
    return { skip: 'sense-mismatch' }
  }

  // a. 用法词性校验：只在"明确冲突"时跳过，避免误杀 "have absolute trust" / "a brilliant mind"
  const usage = impliedUsage(example, hit.start, surface)
  // 助动词 + -ing/-ed 却登记为名词 → 典型的 "Where are you heading?"（heading 词条是名词）
  // 只对名词生效：sophisticated / ashamed 这类以 -ed 结尾的形容词不应被误判
  if (usage === 'verb' && category === 'noun') return { skip: 'sense-mismatch' }
  // 冠词后接动词/功能词 → 该位置应是名词
  if (usage === 'noun' && (category === 'verb' || category === 'other')) return { skip: 'sense-mismatch' }
  // very/too 后接动词/名词 → 该位置应是形容词或副词
  if (usage === 'adj' && (category === 'verb' || category === 'noun')) return { skip: 'sense-mismatch' }

  const stem = `${example.slice(0, hit.start)}____${example.slice(hit.end)}`

  // 硬性泄漏校验：题干里只能有一个空位，且不能再出现任何词形
  if ((stem.match(/____/g) || []).length !== 1) return { skip: 'leak-guard' }
  if (hasAnyForm(stem, matchForms)) return { skip: 'leak-guard' }

  // 解析保存"挖空前"的完整原句；服务端会在答题前截断到 "｜ 原句：" 之前（toQuestionVO）
  const analysis = `${row.translation} ｜ 原句：${example}`

  const accepted = [...new Set([lemma, surface, ...acceptedForms])]

  return {
    branch: surface === word.toLowerCase() ? 'exact-form' : 'inflected',
    record: {
      wordId: row.id,
      lemma: word.toLowerCase(),
      level: row.level,
      difficulty: Number(row.difficulty),
      stem,
      answer: surface,
      analysis,
      accepted,
      category,
      pos: row.pos || '',
    },
  }
}

function mulberry32(seed) {
  let a = seed >>> 0
  return () => {
    a = (a + 0x6d2b79f5) >>> 0
    let t = a
    t = Math.imul(t ^ (t >>> 15), t | 1)
    t ^= t + Math.imul(t ^ (t >>> 7), t | 61)
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296
  }
}

function pickSamples(records, count, seed) {
  const rnd = mulberry32(seed)
  const pool = [...records]
  for (let i = pool.length - 1; i > 0; i -= 1) {
    const j = Math.floor(rnd() * (i + 1))
    ;[pool[i], pool[j]] = [pool[j], pool[i]]
  }
  return pool.slice(0, count)
}

// ---------------------------------------------------------------- SQL

function buildSql(question, version) {
  const key = `vocab-auto-${question.wordId}-1`
  const acceptedSql = `JSON_ARRAY(${question.accepted.map((a) => `'${sqlEscape(a)}'`).join(', ')})`
  return `-- ${version} · ${question.lemma} (${question.level}, 难度 ${question.difficulty})
INSERT INTO \`question_info\`
  (\`external_key\`, \`module_type\`, \`target_level\`, \`difficulty_level\`, \`question_type\`,
   \`source\`, \`answer_word\`, \`accepted_answers\`, \`ai_generated\`, \`usage_count\`, \`is_deleted\`,
   \`created_at\`, \`updated_at\`)
SELECT '${key}', 1, '${question.level}', ${question.difficulty}, 'FILL_BLANK',
       'IMPORT', '${sqlEscape(question.lemma)}', ${acceptedSql}, 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM \`question_info\` WHERE \`external_key\` = '${key}');

SET @qid = (SELECT \`id\` FROM \`question_info\` WHERE \`external_key\` = '${key}' LIMIT 1);

INSERT INTO \`question_content\`
  (\`question_id\`, \`stem\`, \`options\`, \`correct_answer\`, \`analysis\`, \`created_at\`, \`updated_at\`)
SELECT @qid,
       '${sqlEscape(question.stem)}',
       JSON_ARRAY(),
       '${sqlEscape(question.answer)}',
       '${sqlEscape(question.analysis)}',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM \`question_content\` WHERE \`question_id\` = @qid);
`
}

function nextVersion(v) {
  const m = /^V(\d+)\.(\d+)\.(\d+)$/.exec(v)
  if (!m) throw new Error(`版本号格式错误: ${v}`)
  return `V${m[1]}.${m[2]}.${Number(m[3]) + 1}`
}

// ---------------------------------------------------------------- 主流程

function parseArgs(argv) {
  const opts = {
    dryRun: true,
    level: 'ALL',
    limit: 0,
    batchSize: 500,
    startVersion: 'V1.0.13',
    out: path.join(ROOT, 'docs', 'pending-migrations'),
    difficulty: '',
    minLen: 20,
    maxLen: 160,
    seed: 20261108,
    sample: 10,
  }
  for (let i = 0; i < argv.length; i += 1) {
    const a = argv[i]
    if (a === '--dry-run') opts.dryRun = true
    else if (a === '--write') opts.dryRun = false
    else if (a === '--level') opts.level = argv[++i]
    else if (a === '--limit') opts.limit = Number(argv[++i]) || 0
    else if (a === '--batch-size') opts.batchSize = Number(argv[++i]) || 500
    else if (a === '--start-version') opts.startVersion = argv[++i]
    else if (a === '--out') opts.out = argv[++i]
    else if (a === '--difficulty') opts.difficulty = argv[++i]
    else if (a === '--min-len') opts.minLen = Number(argv[++i]) || 20
    else if (a === '--max-len') opts.maxLen = Number(argv[++i]) || 160
    else if (a === '--seed') opts.seed = Number(argv[++i]) || 20261108
    else if (a === '--sample') opts.sample = Number(argv[++i]) || 10
    else if (a === '--explain') opts.explain = String(argv[++i] || '').split(',').filter(Boolean)
    else if (a === '--help' || a === '-h') {
      printUsage()
      process.exit(0)
    }
  }
  return opts
}

function printUsage() {
  console.log(`用法:
  node scripts/generate-vocab-questions.mjs [--dry-run|--write] [--level CET4|CET6|ALL]
    [--limit N] [--batch-size 500] [--start-version V1.0.13] [--out <dir>]
    [--difficulty <word-difficulty.json>] [--min-len 20] [--max-len 160] [--seed N] [--sample 10]`)
}

function main() {
  const opts = parseArgs(process.argv.slice(2))
  const env = readEnv(path.join(ROOT, '.env'))
  const mysqlBin = resolveMysql()
  const conn = {
    host: env.MYSQL_HOST || '127.0.0.1',
    port: env.MYSQL_PORT || '3306',
    user: env.MYSQL_USERNAME,
    password: env.MYSQL_PASSWORD,
  }
  if (!conn.user || conn.password === undefined) {
    throw new Error('缺少 MYSQL_USERNAME / MYSQL_PASSWORD，请检查 .env')
  }

  // 难度来源：显式 --difficulty 优先（回填前也能按 JSON 生成），否则用库里的 difficulty_hint
  let difficultyMap
  if (opts.difficulty) {
    difficultyMap = loadDifficultyFromJson(opts.difficulty)
  } else if (columnExists(mysqlBin, conn, 'word_dictionary', 'difficulty_hint')) {
    difficultyMap = loadDifficultyFromDb(mysqlBin, conn)
    if (difficultyMap.size === 0) {
      throw new Error('difficulty_hint 列存在但没有任何非空值；请先回填，或用 --difficulty 指定 JSON')
    }
    console.log(`[info] 难度来源：word_dictionary.difficulty_hint（${difficultyMap.size} 条）`)
  } else {
    const file = path.resolve(ROOT, '..', '..', '英语资源', '_import', 'word-difficulty.json')
    if (!fs.existsSync(file)) {
      throw new Error(`difficulty_hint 列不存在，且找不到难度 JSON: ${file}\n        请先执行 V1.0.12 并回填，或用 --difficulty 指定 JSON`)
    }
    difficultyMap = loadDifficultyFromJson(file)
  }

  console.log(`[info] 读取 word_dictionary（level=${opts.level}）...`)
  const rows = loadWords(mysqlBin, conn, opts.level)
  console.log(`[info] 词条 ${rows.length}`)

  const skips = {}
  if (opts.explain && opts.explain.length) {
    const wanted = new Set(opts.explain.map((w) => w.trim().toLowerCase()))
    for (const row of rows) {
      if (!wanted.has((row.word || '').trim().toLowerCase())) continue
      const difficulty = difficultyMap.get((row.word || '').trim().toLowerCase())
      const result = classify({ ...row, difficulty }, opts)
      if (result.skip) {
        console.log(`[explain] ${row.word} (pos=${row.pos || '-'}) → 跳过：${result.skip}`)
      } else {
        const r = result.record
        console.log(`[explain] ${row.word} (pos=${row.pos || '-'}) → 生成 [${r.level} d${r.difficulty}]`)
        console.log(`          stem     : ${r.stem}`)
        console.log(`          answer   : ${r.answer}`)
        console.log(`          accepted : ${r.accepted.join(', ')}`)
        console.log(`          analysis : ${r.analysis}`)
      }
      wanted.delete((row.word || '').trim().toLowerCase())
    }
    for (const w of wanted) console.log(`[explain] ${w} → 词库中未找到`)
    console.log('')
  }

  const generated = []
  const skipSamples = {}
  const blockedKeys = []
  const branch = { 'exact-form': 0, inflected: 0 }

  for (const row of rows) {
    const difficulty = difficultyMap.get((row.word || '').trim().toLowerCase())
    const result = classify({ ...row, difficulty }, opts)
    if (result.skip) {
      skips[result.skip] = (skips[result.skip] || 0) + 1
      if (result.skip === 'blocklist') blockedKeys.push(result.externalKey)
      const bucket = (skipSamples[result.skip] = skipSamples[result.skip] || [])
      if (bucket.length < 10 && result.skip !== 'blocklist') bucket.push((row.word || '').trim())
      continue
    }
    branch[result.branch] += 1
    generated.push(result.record)
    if (opts.limit && generated.length >= opts.limit) break
  }

  // 幂等指纹：排序后的 external_key 集合
  const keys = generated.map((q) => `vocab-auto-${q.wordId}-1`).sort()
  const digest = crypto.createHash('sha256').update(keys.join('\n')).digest('hex').slice(0, 12)

  // 伪形态自检：名词/形容词/副词不应出现 -ed/-ing 变形
  const pseudoForms = []
  for (const q of generated) {
    if (!['noun', 'adj', 'adv'].includes(q.category)) continue
    const bad = q.accepted.filter((f) => f !== q.lemma && /(ed|ing)$/.test(f))
    if (bad.length) pseudoForms.push(`${q.lemma}(${q.category}): ${bad.join('/')}`)
  }

  // accepted 一致性：不可数/不规则名词不应出现规则复数
  const rulePluralOf = (w) => {
    if (/(s|x|z|ch|sh)$/.test(w)) return `${w}es`
    if (/[^aeiou]y$/.test(w)) return `${w.slice(0, -1)}ies`
    return `${w}s`
  }
  const pluralErrors = { uncountable: [], irregular: [] }
  const formGaps = { verbs: 0, nouns: 0 }
  for (const q of generated) {
    if (q.category === 'noun') {
      const plural = rulePluralOf(q.lemma)
      if (q.accepted.includes(plural)) {
        if (UNCOUNTABLE.has(q.lemma) || /ware$/.test(q.lemma)) {
          pluralErrors.uncountable.push(`${q.lemma} → ${plural}`)
        } else if (
          Object.prototype.hasOwnProperty.call(IRREGULAR, q.lemma) &&
          // index→indexes 这类本身就在不规则表里的合法复数不算错误
          !(IRREGULAR[q.lemma] || []).includes(plural)
        ) {
          pluralErrors.irregular.push(`${q.lemma} → ${plural}`)
        }
      }
      if (q.accepted.length === 1) formGaps.nouns += 1
    }
    if (q.category === 'verb' && !q.accepted.some((f) => f !== q.lemma && /(ed|ing)$/.test(f))) {
      formGaps.verbs += 1
    }
  }
  const byLemma = new Map(generated.map((q) => [q.lemma, q]))
  const assertions = {
    abandonIng: !byLemma.has('abandon')
      ? 'N/A'
      : byLemma.get('abandon').accepted.includes('abandoning')
        ? 'PASS'
        : 'FAIL',
    hardwareNoS: !byLemma.has('hardware')
      ? 'N/A'
      : byLemma.get('hardware').accepted.includes('hardwares')
        ? 'FAIL'
        : 'PASS',
    criterionNoS: !byLemma.has('criterion')
      ? 'N/A'
      : byLemma.get('criterion').accepted.includes('criterions')
        ? 'FAIL'
        : 'PASS',
  }

  const byLevel = {}
  const byDifficulty = {}
  for (const q of generated) {
    byLevel[q.level] = (byLevel[q.level] || 0) + 1
    byDifficulty[q.difficulty] = (byDifficulty[q.difficulty] || 0) + 1
  }

  const samples = pickSamples(generated, opts.sample, opts.seed).map((q) => ({
    externalKey: `vocab-auto-${q.wordId}-1`,
    moduleType: 1,
    questionType: 'FILL_BLANK',
    targetLevel: q.level,
    difficultyLevel: q.difficulty,
    answerWord: q.lemma,
    stem: q.stem,
    correctAnswer: q.answer,
    acceptedAnswers: q.accepted,
    analysis: q.analysis,
  }))

  fs.mkdirSync(opts.out, { recursive: true })
  const samplePath = path.join(opts.out, 'vocab-auto-sample.json')
  fs.writeFileSync(samplePath, JSON.stringify(samples, null, 2), 'utf8')

  // 分片 SQL（仅 --write）
  const parts = []
  if (!opts.dryRun) {
    let version = opts.startVersion
    for (let i = 0; i < generated.length; i += opts.batchSize) {
      const chunk = generated.slice(i, i + opts.batchSize)
      const partNo = String(Math.floor(i / opts.batchSize) + 1).padStart(2, '0')
      const fileName = `${version}__seed_vocab_auto_part${partNo}.sql`
      const header = `-- ${version}：词汇填空题自动生成（第 ${partNo} 批，${chunk.length} 题）
-- 目标库：exercise_db
-- 来源：word_dictionary 例句挖空；生成脚本 scripts/generate-vocab-questions.mjs
-- 风险：低（纯 DML，NOT EXISTS 双重幂等：external_key + question_content）
-- 回滚：DELETE FROM question_info WHERE external_key LIKE 'vocab-auto-%';
--       DELETE FROM question_content WHERE question_id NOT IN (SELECT id FROM question_info);
-- 校验：stem 含 ___、analysis 无答案残留（生成时已断言）

`
      const body = chunk.map((q) => buildSql(q, version)).join('\n')
      const content = header + body
      fs.writeFileSync(path.join(opts.out, fileName), content, 'utf8')
      parts.push({ file: fileName, version, count: chunk.length, firstKey: `vocab-auto-${chunk[0].wordId}-1`, lastKey: `vocab-auto-${chunk[chunk.length - 1].wordId}-1` })
      version = nextVersion(version)
    }
  }

  // 遗留分片：上一轮生成、本轮没有覆盖到的 part 文件（数量变少时会出现）
  const activeNames = new Set(parts.map((p) => p.file))
  const leftovers = opts.dryRun || !fs.existsSync(opts.out)
    ? []
    : fs.readdirSync(opts.out)
        .filter((f) => /__seed_vocab_auto_part\d+\.sql$/.test(f) && !activeNames.has(f))
        .sort()

  const report = `# 词汇填空题生成报告

- 生成时间：${new Date().toISOString()}
- 模式：${opts.dryRun ? 'dry-run（未写 SQL）' : 'write（已生成分片 SQL）'}
- 词条范围：${opts.level}${opts.limit ? `，上限 ${opts.limit}` : ''}
- 例句长度区间：${opts.minLen}~${opts.maxLen}

## 1. 总量

| 指标 | 数值 |
|---|---|
| 词条总数 | ${rows.length} |
| 生成题数 | **${generated.length}** |
| 跳过数 | ${Object.values(skips).reduce((a, b) => a + b, 0)} |
| 生成率 | ${((generated.length / Math.max(1, rows.length)) * 100).toFixed(1)}% |

## 2. 命中分支

| 分支 | 数量 |
|---|---|
| exact-form（例句用原形） | ${branch['exact-form']} |
| inflected（例句用变形） | ${branch.inflected} |

## 3. 跳过原因分布

| 原因 | 数量 |
|---|---|
${Object.entries(skips)
  .sort((a, b) => b[1] - a[1])
  .map(([k, v]) => `| \`${k}\` | ${v} |`)
  .join('\n')}

### 3.1 跳过样本（每类最多 10 个，便于核对判定是否过严）

${Object.entries(skipSamples)
  .sort((a, b) => (skips[b[0]] || 0) - (skips[a[0]] || 0))
  .map(([reason, words]) => `- **${reason}**：${words.join('、')}`)
  .join('\n')}

### 3.2 敏感内容过滤（只列 external_key，不复述原句）

- 命中数量：**${blockedKeys.length}**
${blockedKeys.map((k) => `  - \`${k}\``).join('\n')}

## 4. 等级分布

| 等级 | 生成题数 |
|---|---|
${Object.entries(byLevel)
  .sort()
  .map(([k, v]) => `| ${k} | ${v} |`)
  .join('\n')}

## 5. 难度分布

| 难度 | 题数 |
|---|---|
${Object.entries(byDifficulty)
  .sort((a, b) => Number(a[0]) - Number(b[0]))
  .map(([k, v]) => `| ${k} | ${v} |`)
  .join('\n')}

## 5.1 accepted 伪形态自检（名词/形容词/副词出现 -ed/-ing，目标 0）

- 命中条数：**${pseudoForms.length}**
${pseudoForms.slice(0, 20).map((x) => `  - ${x}`).join('\n')}

## 5.2 accepted 一致性自检

| 检查 | 结果 | 目标 |
|---|---|---|
| 不可数名词出现规则复数 | ${pluralErrors.uncountable.length} | 0 |
| 不规则名词出现规则复数 | ${pluralErrors.irregular.length} | 0 |
| \`abandon\` accepted 含 \`abandoning\` | ${assertions.abandonIng} | PASS |
| \`hardware\` 不含 \`hardwares\` | ${assertions.hardwareNoS} | PASS |
| \`criterion\` 不含 \`criterions\` | ${assertions.criterionNoS} | PASS |
| 动词 accepted 缺 -ing/-ed（仅统计） | ${formGaps.verbs} | — |
| 名词 accepted 仅有原形（仅统计） | ${formGaps.nouns} | — |

${pluralErrors.uncountable.concat(pluralErrors.irregular).length ? `命中明细：\n\n${pluralErrors.uncountable.concat(pluralErrors.irregular).slice(0, 20).map((x) => `  - ${x}`).join('\n')}` : ''}

## 6. 幂等校验

| 项 | 值 |
|---|---|
| external_key 总数 | ${keys.length} |
| 去重后数量 | ${new Set(keys).size} |
| 集合 SHA-256（前 12 位） | \`${digest}\` |

> 同一份输入重复 dry-run，上表三项必须完全一致。

## 7. 分片

${parts.length ? `| 文件 | 题数 | 首键 | 尾键 |\n|---|---|---|---|\n${parts.map((p) => `| ${p.file} | ${p.count} | ${p.firstKey} | ${p.lastKey} |`).join('\n')}` : '_dry-run 模式未生成 SQL 分片_'}

${leftovers.length ? `### 7.1 遗留分片（本次未覆盖、**不要导入**）\n\n${leftovers.map((f) => `- \`${f}\`：上一轮生成物，内容已过期，建议导入前删除\n`).join('')}` : '### 7.1 遗留分片\n\n无。'}

## 8. 抽样

见同目录 \`vocab-auto-sample.json\`（${samples.length} 条，随机种子 ${opts.seed}）。
`

  fs.writeFileSync(path.join(opts.out, 'vocab-auto-report.md'), report, 'utf8')

  if (!opts.dryRun) {
    fs.writeFileSync(
      path.join(opts.out, 'vocab-auto-manifest.json'),
      JSON.stringify({ generatedAt: new Date().toISOString(), total: generated.length, digest, parts, leftovers, skips, byLevel, byDifficulty }, null, 2),
      'utf8',
    )
  }

  console.log('')
  console.log(`生成题数：${generated.length}（CET4 ${byLevel.CET4 || 0} / CET6 ${byLevel.CET6 || 0}）`)
  console.log(`命中分支：exact-form ${branch['exact-form']} / inflected ${branch.inflected}`)
  console.log(`跳过分布：${JSON.stringify(skips)}`)
  console.log(`幂等指纹：${digest}（去重 ${new Set(keys).size}/${keys.length}）`)
  console.log(`报告：${path.join(opts.out, 'vocab-auto-report.md')}`)
  console.log(`样本：${samplePath}`)
  if (!opts.dryRun) console.log(`分片：${parts.map((p) => p.file).join(', ')}`)
}

try {
  main()
} catch (err) {
  console.error(`[error] ${err.message}`)
  process.exit(1)
}
