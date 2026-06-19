CREATE TABLE kh_game_state (
    game_id    UUID                     NOT NULL,
    state      JSONB                    NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    CONSTRAINT pk_kh_game_state PRIMARY KEY (game_id),
    CONSTRAINT fk_kh_game_state_game FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE
);
