-- Whitelist of emails permitted to create an account, with the role they will be granted.
-- Email is stored lowercased (and matched case-insensitively in the application) so a single
-- person can't be whitelisted twice with different casings.
CREATE TABLE public.whitelist (
    email varchar(255) NOT NULL,
    role varchar(32) NOT NULL,
    created_at timestamp WITH TIME ZONE NOT NULL DEFAULT NOW(),
    CONSTRAINT whitelist_pkey PRIMARY KEY (email),
    CONSTRAINT whitelist_email_lowercase CHECK (email = lower(email))
);
