INSERT INTO users (user_name)
VALUES ('meg-bot'), ('tom-bot');

DO
$do$
DECLARE
_megId uuid;
_tomId uuid;
BEGIN
SELECT INTO _megId id FROM users WHERE user_name = 'meg-bot';
SELECT INTO _tomId id FROM users WHERE user_name = 'tom-bot';

IF (_megId) IS NOT NULL THEN
    INSERT INTO user_roles (user_id, role)
        VALUES (_megId, 'BOT');
END IF;

IF (_tomId) IS NOT NULL THEN
    INSERT INTO user_roles (user_id, role)
        VALUES (_tomId, 'BOT');
END IF;
END
$do$;
