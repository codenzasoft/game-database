CREATE TABLE kh_game_results
(
    game_id          UUID             NOT NULL REFERENCES games (id) ON DELETE CASCADE,
    user_id          UUID             NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    year_survived    INT              NOT NULL,
    season_survived  VARCHAR(10)      NOT NULL,
    season_order     INT              NOT NULL, -- 0=SPRING 1=SUMMER 2=FALL 3=WINTER, used for sorting
    peak_population  DOUBLE PRECISION NOT NULL,
    created_at       TIMESTAMP        NOT NULL DEFAULT now(),
    CONSTRAINT kh_game_results_pkey PRIMARY KEY (game_id)
);

CREATE INDEX idx_kh_results_duration   ON kh_game_results (year_survived DESC, season_order DESC);
CREATE INDEX idx_kh_results_population ON kh_game_results (peak_population DESC);
