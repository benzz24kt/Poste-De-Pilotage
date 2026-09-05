-- Poste de pilotage — schéma Supabase
-- À coller UNE SEULE FOIS dans : ton projet Supabase → SQL Editor → New query → coller → Run.

create table if not exists profiles (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  pin text not null,
  role text not null default 'member' check (role in ('super_admin','admin','member')),
  status text not null default 'pending' check (status in ('active','pending','closed')),
  interests text[] not null default '{}'::text[], -- coding / trading / memecoin, choisis à la première connexion
  created_at timestamptz not null default now()
);

create table if not exists trades (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null references profiles(id) on delete cascade,
  token text not null,
  invested numeric not null,
  mcap_in numeric not null,
  mcap_out numeric,
  created_at timestamptz not null default now(),
  closed_at timestamptz
);

alter table profiles enable row level security;
alter table trades enable row level security;

-- IMPORTANT — lis ceci avant de continuer :
-- Ces règles sont volontairement ouvertes (lecture/écriture publique via la clé "anon").
-- Ce n'est PAS un vrai système de sécurité : quiconque connaît l'URL et la clé "anon" de ton
-- projet (visibles dans le code source de la page, donc récupérables par n'importe qui) peut
-- lire et modifier ces deux tables directement, sans passer par le site. C'est un système
-- "entre amis de confiance" (façon profils Netflix, code à 4 chiffres), pas un coffre-fort.
-- Ne stocke jamais d'information sensible (vraie clé privée de wallet, mot de passe réel,
-- coordonnées bancaires...) dans ces tables.

create policy "public read profiles" on profiles for select using (true);
create policy "public insert profiles" on profiles for insert with check (true);
create policy "public update profiles" on profiles for update using (true);

create policy "public read trades" on trades for select using (true);
create policy "public insert trades" on trades for insert with check (true);
create policy "public update trades" on trades for update using (true);
create policy "public delete trades" on trades for delete using (true);
