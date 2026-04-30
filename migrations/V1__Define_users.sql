CREATE TABLE public.users (
                              id uuid NOT NULL,
                              created_at timestamp WITH TIME ZONE NOT NULL DEFAULT NOW(),
                              email varchar(255) NULL,
                              modified_at timestamp WITH TIME ZONE NULL,
                              user_name varchar(255) NOT NULL,
                              password varchar(500),
                              CONSTRAINT unique_email UNIQUE (email),
                              CONSTRAINT unique_user_name UNIQUE (user_name),
                              CONSTRAINT users_pkey PRIMARY KEY (id)
);

