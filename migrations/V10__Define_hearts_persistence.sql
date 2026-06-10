CREATE TABLE hearts_round_hands (
    game_id      UUID        NOT NULL,
    round_number SMALLINT    NOT NULL,
    user_id      UUID        NOT NULL,
    card_rank    VARCHAR(10) NOT NULL,
    card_suit    VARCHAR(10) NOT NULL,
    CONSTRAINT pk_hearts_round_hands PRIMARY KEY (game_id, round_number, user_id, card_rank, card_suit),
    CONSTRAINT fk_hearts_round_hands_game FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE,
    CONSTRAINT fk_hearts_round_hands_user FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE hearts_round_passes (
    game_id      UUID        NOT NULL,
    round_number SMALLINT    NOT NULL,
    user_id      UUID        NOT NULL,
    card_rank    VARCHAR(10) NOT NULL,
    card_suit    VARCHAR(10) NOT NULL,
    CONSTRAINT pk_hearts_round_passes PRIMARY KEY (game_id, round_number, user_id, card_rank, card_suit),
    CONSTRAINT fk_hearts_round_passes_game FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE,
    CONSTRAINT fk_hearts_round_passes_user FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE hearts_tricks (
    game_id      UUID        NOT NULL,
    round_number SMALLINT    NOT NULL,
    trick_number SMALLINT    NOT NULL,
    play_order   SMALLINT    NOT NULL,
    user_id      UUID        NOT NULL,
    card_rank    VARCHAR(10) NOT NULL,
    card_suit    VARCHAR(10) NOT NULL,
    CONSTRAINT pk_hearts_tricks PRIMARY KEY (game_id, round_number, trick_number, play_order),
    CONSTRAINT fk_hearts_tricks_game FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE,
    CONSTRAINT fk_hearts_tricks_user FOREIGN KEY (user_id) REFERENCES users(id)
);
