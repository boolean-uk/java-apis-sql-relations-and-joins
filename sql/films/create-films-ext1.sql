-- Extension Task 1 version of the films table.
-- Run this INSTEAD of create-films.sql, AFTER create-people.sql.
-- All three foreign keys point at the same parent table: the role is decided by
-- which column the id sits in, not by which table it points to.

-- If you already built the core schema, clear it out first:
-- DROP TABLE IF EXISTS films;
-- DROP TABLE IF EXISTS directors;
-- DROP TABLE IF EXISTS stars;
-- DROP TABLE IF EXISTS writers;

CREATE TABLE films (
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    director_id INT REFERENCES people(id),
    star_id INT REFERENCES people(id),
    writer_id INT REFERENCES people(id),
    release_year INT,
    genre VARCHAR(100),
    score INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
