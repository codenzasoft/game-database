-- Default admin account for local development.
-- Username: admin  Password: admin
-- Change or remove this account before exposing to the public internet.
INSERT INTO users (email, user_name, password, email_verified_at)
    VALUES ('admin@localhost',
            'admin',
            '{bcrypt}$2a$10$.4fLCV3Y796Nu7XgriaCi.CCYkaUE9zDeY2NF92Z.y3WmIq7ZzIn6',
            NOW())
    ON CONFLICT (user_name) DO NOTHING;

DO
$do$
DECLARE
    _adminId uuid;
BEGIN
    SELECT INTO _adminId id FROM users WHERE user_name = 'admin';

    IF (_adminId) IS NOT NULL THEN
        INSERT INTO user_roles (user_id, role)
            VALUES (_adminId, 'ADMIN')
            ON CONFLICT DO NOTHING;
    END IF;
END
$do$;
