-- Кошелёк: таблицы и правила доступа.
-- Запустите целиком в Supabase: SQL Editor → New query → вставить → Run.
-- Каждый пользователь видит и меняет только свои строки (row level security).

create table if not exists public.wallets (
  user_id    uuid primary key default auth.uid() references auth.users (id) on delete cascade,
  data       jsonb not null,
  updated_at timestamptz not null default now()
);

create table if not exists public.transactions (
  user_id    uuid not null default auth.uid() references auth.users (id) on delete cascade,
  id         text not null,
  data       jsonb not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, id)
);

create table if not exists public.debts (
  user_id    uuid not null default auth.uid() references auth.users (id) on delete cascade,
  id         text not null,
  data       jsonb not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, id)
);

alter table public.wallets      enable row level security;
alter table public.transactions enable row level security;
alter table public.debts        enable row level security;

drop policy if exists "own wallet" on public.wallets;
create policy "own wallet" on public.wallets
  for all to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

drop policy if exists "own transactions" on public.transactions;
create policy "own transactions" on public.transactions
  for all to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

drop policy if exists "own debts" on public.debts;
create policy "own debts" on public.debts
  for all to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

grant select, insert, update, delete on public.wallets, public.transactions, public.debts to authenticated;
