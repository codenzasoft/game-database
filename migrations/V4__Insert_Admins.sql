INSERT INTO users (email, user_name, password)
    VALUES ('isaac@codenzasoft.ca',
            'isaac',
            '{bcrypt}$2a$10$8jVY7P30S3QmT7kJF3Lt5.SD7JE4fXFwChjuZRlz0rw/XkZx6j0Vm');

DO
$do$
DECLARE
    _adminId uuid;
BEGIN
    SELECT INTO _adminId id FROM users WHERE user_name = 'isaac';

    IF (_adminId) IS NOT NULL THEN
        INSERT INTO user_roles (user_id, role)
            VALUES (_adminId, 'ADMIN');
    END IF;
END
$do$;
