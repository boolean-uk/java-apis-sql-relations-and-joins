DROP TABLE IF EXISTS Directors;

CREATE TABLE IF NOT EXISTS Directors(
    id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT,
    unique(email)
);