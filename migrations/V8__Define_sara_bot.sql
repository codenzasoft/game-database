INSERT INTO users (user_name)
VALUES ('sara-bot');

DO
$do$
DECLARE
_adminId uuid;
BEGIN
SELECT INTO _adminId id FROM users WHERE user_name = 'sara-bot';

IF (_adminId) IS NOT NULL THEN
        INSERT INTO user_roles (user_id, role)
            VALUES (_adminId, 'BOT');
END IF;
END
$do$;