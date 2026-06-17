ALTER TABLE users ADD COLUMN email_verified_at TIMESTAMPTZ;

-- Backfill existing accounts — all were created via admin whitelist and are implicitly trusted.
UPDATE users SET email_verified_at = NOW();

CREATE TABLE email_verification_tokens (
    token      UUID        NOT NULL,
    user_id    UUID        NOT NULL,
    expires_at TIMESTAMPTZ NOT NULL,
    CONSTRAINT pk_email_verification_tokens PRIMARY KEY (token),
    CONSTRAINT fk_email_verification_tokens_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE INDEX idx_email_verification_tokens_user ON email_verification_tokens(user_id);
