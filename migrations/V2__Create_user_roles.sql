CREATE TABLE public.user_roles (
    user_id uuid NOT NULL references public.users(id),
    role varchar(32) NOT NULL,
    created_at timestamp WITH TIME ZONE NOT NULL DEFAULT NOW(),
    CONSTRAINT user_roles_pkey primary key (user_id, role)
);
