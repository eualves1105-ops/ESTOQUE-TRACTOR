-- Execute no SQL Editor do seu projeto Supabase.
create table if not exists public.app_state (
  owner_id uuid primary key references auth.users(id) on delete cascade,
  state jsonb not null default '{"sellers":[],"suppliers":[],"items":[]}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.app_state enable row level security;
drop policy if exists "Users can read own state" on public.app_state;
create policy "Users can read own state" on public.app_state for select to authenticated using (auth.uid() = owner_id);
drop policy if exists "Users can insert own state" on public.app_state;
create policy "Users can insert own state" on public.app_state for insert to authenticated with check (auth.uid() = owner_id);
drop policy if exists "Users can update own state" on public.app_state;
create policy "Users can update own state" on public.app_state for update to authenticated using (auth.uid() = owner_id) with check (auth.uid() = owner_id);
-- Realtime para a tabela usada pela sincronização
alter publication supabase_realtime add table public.app_state;
