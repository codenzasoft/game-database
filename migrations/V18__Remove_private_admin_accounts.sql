-- Remove accounts seeded by V3/V4 that belong to specific individuals and
-- should not exist in public deployments. The default admin account (V17)
-- remains. Production operators should create personal accounts after applying
-- this migration.
DO
$do$
DECLARE
    _userId uuid;
    _userNames text[] := ARRAY['darin', 'isaac'];
    _name text;
BEGIN
    FOREACH _name IN ARRAY _userNames LOOP
        SELECT INTO _userId id FROM users WHERE user_name = _name;

        IF _userId IS NOT NULL THEN
            DELETE FROM user_roles   WHERE user_id = _userId;
            DELETE FROM game_players WHERE user_id = _userId;
            DELETE FROM users        WHERE id      = _userId;
        END IF;
    END LOOP;
END
$do$;
