CREATE TABLE feedback
(
    id         UUID        NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id    UUID        NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    type       VARCHAR(20) NOT NULL CHECK (type IN ('BUG', 'FEEDBACK')),
    subject    VARCHAR(255) NOT NULL,
    message    TEXT        NOT NULL,
    status     VARCHAR(20) NOT NULL DEFAULT 'NEW' CHECK (status IN ('NEW', 'REVIEWED', 'RESOLVED')),
    created_at TIMESTAMP   NOT NULL DEFAULT now()
);

CREATE INDEX idx_feedback_user_id  ON feedback (user_id);
CREATE INDEX idx_feedback_status   ON feedback (status);
CREATE INDEX idx_feedback_created  ON feedback (created_at DESC);
