CREATE TABLE user_games_played (
    user_id        UUID        NOT NULL,
    game_type      VARCHAR(20) NOT NULL,
    wins           INT         NOT NULL DEFAULT 0,
    losses         INT         NOT NULL DEFAULT 0,
    draws          INT         NOT NULL DEFAULT 0,
    last_played_at TIMESTAMP   NOT NULL,
    CONSTRAINT pk_user_games_played PRIMARY KEY (user_id, game_type),
    CONSTRAINT fk_user_games_played_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
