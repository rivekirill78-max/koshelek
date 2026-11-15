// Подключение к базе данных Supabase.
// Оба значения берутся в Supabase: Project Settings → API (или Data API).
//   supabaseUrl      — «Project URL», вида https://abcdefgh.supabase.co
//   supabaseAnonKey  — ключ «anon» / «publishable». Он публичный и защищён правилами доступа в базе.
// НИКОГДА не вставляйте сюда ключ «service_role» / «secret» — он даёт полный доступ ко всем данным.
window.KOSHELEK_CONFIG = {
  supabaseUrl: 'https://myvneqqxuzdwjsweuaew.supabase.co',
  supabaseAnonKey: 'sb_publishable_4QeOQYCZcTU3hTHoR3rOAA_4R8sx3-f'
};
