INSERT INTO public.users (user_id, username, email, created_at, status) VALUES (1, 'Masoud', 'test@hotmail.com', '2026-02-24 15:44:41.883111', 'active');
INSERT INTO public.users (user_id, username, email, created_at, status) VALUES (2, 'alice', 'alice@email.com', '2026-02-24 15:44:41.883111', 'active');
INSERT INTO public.users (user_id, username, email, created_at, status) VALUES (3, 'bob', 'bob@email.com', '2026-02-24 15:44:41.883111', 'active');
INSERT INTO public.users (user_id, username, email, created_at, status) VALUES (4, 'charlie', 'charlie@email.com', '2026-02-24 15:44:41.883111', 'active');

INSERT INTO public.channels (channel_id, name, is_private) VALUES (1, 'general', false);
INSERT INTO public.channels (channel_id, name, is_private) VALUES (2, 'dev-team', true);

INSERT INTO public.roles (role_id, role_name, permission_level) VALUES (1, 'admin', 10);
INSERT INTO public.roles (role_id, role_name, permission_level) VALUES (2, 'moderator', 7);
INSERT INTO public.roles (role_id, role_name, permission_level) VALUES (3, 'member', 3);

INSERT INTO public.user_channel_memberships (membership_id, user_id, channel_id) VALUES (1, 1, 1);
INSERT INTO public.user_channel_memberships (membership_id, user_id, channel_id) VALUES (2, 2, 1);
INSERT INTO public.user_channel_memberships (membership_id, user_id, channel_id) VALUES (3, 3, 2);

INSERT INTO public.user_roles (user_id, role_id, assigned_at) VALUES (1, 1, '2026-02-24 15:44:41.933005');
INSERT INTO public.user_roles (user_id, role_id, assigned_at) VALUES (2, 3, '2026-02-24 15:44:41.933005');
INSERT INTO public.user_roles (user_id, role_id, assigned_at) VALUES (3, 2, '2026-02-24 15:44:41.933005');



















