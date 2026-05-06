CREATE TABLE public.games (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    game_type varchar(30) NOT NULL,
    created_at timestamp WITH TIME ZONE NOT NULL DEFAULT NOW(),
    over_at timestamp WITH TIME ZONE NULL,
    quit_at timestamp WITH TIME ZONE NULL,
    CONSTRAINT games_pkey PRIMARY KEY (id)
);

CREATE TABLE public.game_players (
    game_id uuid NOT NULL references public.games(id),
    user_id uuid NOT NULL references public.users(id),
    player_order int NOT NULL,
    CONSTRAINT game_players_pkey PRIMARY KEY (game_id, user_id)
);