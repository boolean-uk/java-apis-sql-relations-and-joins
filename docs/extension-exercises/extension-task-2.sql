-- EXTENSION TASK 2 --
-- 1. Add a `Cast` table that links Films to Actors (ie the Cast table contains details of
--    all of the Actors in addition to the Star who appear in the Film).
-- 2. You can either add some more people as actors (these can be real actors or just made
--    up names) or just reuse all of the existing people.

CREATE TABLE Stars (
    id SERIAL PRIMARY KEY,
    name TEXT,
    birthday TEXT
);

CREATE TABLE Films (
    id SERIAL PRIMARY KEY,
    title TEXT,
    director TEXT,
    star_id INT,
    writer TEXT,
    year INT,
    genre TEXT,
    score INT,
    UNIQUE(title),
    CONSTRAINT fk_star
        FOREIGN KEY (star_id)
            REFERENCES Stars(id)
);

CREATE TABLE TheCast (
    id SERIAL PRIMARY KEY,
    film_id INT,
    actors TEXT,
    star_id INT,
    CONSTRAINT fk_film
        FOREIGN KEY (film_id)
            REFERENCES Films(id),
    CONSTRAINT fk_star
        FOREIGN KEY (star_id)
            REFERENCES Stars(id)
)
