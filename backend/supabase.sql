-- Wedly: paste this whole file into Supabase > SQL Editor > New query, then Run.
-- Two tables, locked down. All access goes through the functions at the bottom, so nobody
-- can read another couple's private edit key or change a plan without it.

create table if not exists plans (
  code text primary key,
  edit_key text not null,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

create table if not exists helper_responses (
  plan_code text not null references plans(code) on delete cascade,
  person_id text not null,
  accepted text,
  done jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (plan_code, person_id)
);

alter table plans enable row level security;
alter table helper_responses enable row level security;
-- No policies on purpose: the anon key cannot touch the tables directly.

-- Save a plan. Creates it if the code is new; otherwise the edit key must match.
create or replace function save_plan(p_code text, p_key text, p_data jsonb)
returns void language plpgsql security definer set search_path = public as $$
begin
  if exists (select 1 from plans where code = p_code) then
    update plans set data = p_data, updated_at = now() where code = p_code and edit_key = p_key;
    if not found then raise exception 'wrong edit key'; end if;
  else
    insert into plans (code, edit_key, data) values (p_code, p_key, p_data);
  end if;
end $$;

-- Read a plan by its share code. Never returns the edit key.
create or replace function get_plan(p_code text)
returns jsonb language sql security definer set search_path = public stable as $$
  select data from plans where code = p_code;
$$;

-- A helper says yes or ticks their tasks.
create or replace function respond(p_code text, p_person text, p_accepted text, p_done jsonb)
returns void language plpgsql security definer set search_path = public as $$
begin
  insert into helper_responses (plan_code, person_id, accepted, done, updated_at)
  values (p_code, p_person, p_accepted, coalesce(p_done, '{}'::jsonb), now())
  on conflict (plan_code, person_id) do update
    set accepted = coalesce(excluded.accepted, helper_responses.accepted),
        done = excluded.done,
        updated_at = now();
end $$;

-- The couple reads every helper's answers for their plan.
create or replace function get_responses(p_code text)
returns setof helper_responses language sql security definer set search_path = public stable as $$
  select * from helper_responses where plan_code = p_code;
$$;

grant execute on function save_plan(text, text, jsonb) to anon, authenticated;
grant execute on function get_plan(text) to anon, authenticated;
grant execute on function respond(text, text, text, jsonb) to anon, authenticated;
grant execute on function get_responses(text) to anon, authenticated;
