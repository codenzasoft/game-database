CREATE TABLE public.users (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    created_at timestamp WITH TIME ZONE NOT NULL DEFAULT NOW(),
    modified_at timestamp WITH TIME ZONE NOT NULL DEFAULT NOW(),
    email varchar(255) NULL,
    user_name varchar(255) NOT NULL,
    password varchar(500),
    CONSTRAINT unique_email UNIQUE (email),
    CONSTRAINT unique_user_name UNIQUE (user_name),
    CONSTRAINT users_pkey PRIMARY KEY (id)
);
