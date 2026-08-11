-- Persisted mid-game state for King's Hand matches. One row per KH game, holding the entire
-- immutable GameState serialized as JSON. Keyed by game_id with an ON DELETE CASCADE to games so
-- GameCleanupService's bulk-delete of completed games reaps the state row automatically (same
-- pattern as V9's cascade for the XO child tables).
CREATE TABLE public.kh_game_states (
    game_id    UUID PRIMARY KEY REFERENCES public.games(id) ON DELETE CASCADE,
    state      JSONB       NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
