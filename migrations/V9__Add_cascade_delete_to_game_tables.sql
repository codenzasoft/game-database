ALTER TABLE public.game_players
    DROP CONSTRAINT game_players_game_id_fkey,
    ADD CONSTRAINT game_players_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id) ON DELETE CASCADE;

ALTER TABLE public.xo_game_pieces
    DROP CONSTRAINT xo_game_pieces_game_id_fkey,
    ADD CONSTRAINT xo_game_pieces_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id) ON DELETE CASCADE;

ALTER TABLE public.xo_game_moves
    DROP CONSTRAINT xo_game_moves_game_id_fkey,
    ADD CONSTRAINT xo_game_moves_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id) ON DELETE CASCADE;
