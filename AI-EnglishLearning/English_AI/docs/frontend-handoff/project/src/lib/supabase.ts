import { createClient } from '@supabase/supabase-js';

/** 浏览器端 Supabase 客户端，使用匿名密钥访问已开放 RLS 策略的写作数据表 */
export const supabase = createClient(import.meta.env.VITE_SUPABASE_URL, import.meta.env.VITE_SUPABASE_ANON_KEY);
