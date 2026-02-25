create table if not exists users
(
    user_id    serial
        constraint users_pkey
            primary key,
    username   varchar(20) not null
        constraint users_username_key
            unique,
    email      varchar(50) not null
        constraint users_email_key
            unique,
    created_at timestamp   default CURRENT_TIMESTAMP,
    status     varchar(20) default 'active'::character varying
        constraint chk_user_status
            check ((status)::text = ANY
                   ((ARRAY ['active'::character varying, 'banned'::character varying, 'inactive'::character varying])::text[]))
);

create table if not exists channels
(
    channel_id serial
        constraint channels_pkey
            primary key,
    name       varchar(20) not null
        constraint channels_name_key
            unique,
    is_private boolean default false
);

create table if not exists roles
(
    role_id          serial
        constraint roles_pkey
            primary key,
    role_name        varchar(50) not null
        constraint roles_role_name_key
            unique,
    permission_level integer     not null
        constraint chk_permission_level
            check ((permission_level >= 1) AND (permission_level <= 10))
);

create table if not exists user_channel_memberships
(
    membership_id serial
        constraint user_channel_memberships_pkey
            primary key,
    user_id       integer not null
        constraint user_channel_memberships_user_id_fkey
            references users
            on delete cascade,
    channel_id    integer not null
        constraint user_channel_memberships_channel_id_fkey
            references channels
            on delete cascade,
    constraint user_channel_memberships_user_id_channel_id_key
        unique (user_id, channel_id)
);

create table if not exists user_roles
(
    user_id     integer not null
        constraint user_roles_user_id_fkey
            references users
            on delete cascade,
    role_id     integer not null
        constraint user_roles_role_id_fkey
            references roles
            on delete set null,
    assigned_at timestamp default CURRENT_TIMESTAMP,
    constraint user_roles_pkey
        primary key (user_id, role_id)
);

create or replace view channel_member_view(channel_name, username) as
SELECT c.name AS channel_name,
       u.username
FROM channels c
         JOIN user_channel_memberships m ON c.channel_id = m.channel_id
         JOIN users u ON u.user_id = m.user_id;


