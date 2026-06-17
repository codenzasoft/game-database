CREATE TABLE password_reset_tokens (
    token      UUID        NOT NULL,
    user_id    UUID        NOT NULL,
    expires_at TIMESTAMPTZ NOT NULL,
    CONSTRAINT pk_password_reset_tokens PRIMARY KEY (token),
    CONSTRAINT fk_password_reset_tokens_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE INDEX idx_password_reset_tokens_user ON password_reset_tokens(user_id);
