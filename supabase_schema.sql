-- Supabase SQL Editor में पूरा SQL चलाएँ.
-- Tables में RLS लागू है; authenticated users के लिए policy है.
-- महत्वपूर्ण: केवल विभाग द्वारा स्वीकृत उपयोग के लिए; नीचे का policy model सभी logged-in users को साझा डेटा पढ़ने/बदलने देता है.
-- अधिक सुरक्षित deployment में role-based policies और audit logs लागू करें.
create table if not exists public.app_records (
  id text primary key,
  record_type text not null check (record_type in ('staff','duties','incidents','contacts')),
  payload jsonb not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
alter table public.app_records enable row level security;
drop policy if exists "authenticated users can read app records" on public.app_records;
drop policy if exists "authenticated users can insert app records" on public.app_records;
drop policy if exists "authenticated users can update app records" on public.app_records;
drop policy if exists "authenticated users can delete app records" on public.app_records;
create policy "authenticated users can read app records" on public.app_records for select to authenticated using (true);
create policy "authenticated users can insert app records" on public.app_records for insert to authenticated with check (true);
create policy "authenticated users can update app records" on public.app_records for update to authenticated using (true) with check (true);
create policy "authenticated users can delete app records" on public.app_records for delete to authenticated using (true);
