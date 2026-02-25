-- Query 1: Users and their channels
SELECT u.username, c.name
FROM users u
JOIN user_channel_memberships m ON u.user_id = m.user_id
JOIN channels c ON m.channel_id = c.channel_id;

-- Query 2: Users and their roles
SELECT u.username, r.role_name
FROM users u
JOIN user_roles ur ON u.user_id = ur.user_id
JOIN roles r ON ur.role_id = r.role_id;

-- Query 3: Number of members per channel
SELECT c.name, COUNT(m.user_id) AS member_count
FROM channels c
LEFT JOIN user_channel_memberships m ON c.channel_id = m.channel_id
GROUP BY c.name;

-- Query 4: Active users
SELECT * FROM users WHERE status = 'active';

-- Query 5: Private channels
SELECT * FROM channels WHERE is_private = TRUE;

-- 6
SELECT * FROM roles WHERE permission_level>=7;




