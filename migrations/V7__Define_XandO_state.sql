CREATE TABLE public.xo_game_pieces (
    game_id uuid NOT NULL references public.games(id),
    user_id uuid NOT NULL references public.users(id),
    piece varchar(10) NOT NULL,
    CONSTRAINT xo_game_pieces_pkey PRIMARY KEY (game_id, user_id)
);

CREATE TABLE public.xo_game_moves (
    game_id uuid NOT NULL references public.games(id),
    user_id uuid NOT NULL references public.users(id),
    move_order int NOT NULL,
    move_row int NOT NULL,
    move_column int NOT NULL,
    CONSTRAINT xo_game_moves_pkey PRIMARY KEY (game_id, user_id, move_order)
);
