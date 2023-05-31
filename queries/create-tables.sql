CREATE TABLE IF NOT EXISTS directors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(70) NOT NULL,
    country VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS stars (
    id SERIAL PRIMARY KEY,
    name VARCHAR(70) NOT NULL,
    dob DATE
);

CREATE TABLE IF NOT EXISTS writers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(70) NOT NULL,
    email VARCHAR(70)
);

CREATE TABLE IF NOT EXISTS films (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    year INTEGER NOT NULL,
    genre VARCHAR(50) NOT NULL,
    score INTEGER,
    director_id INTEGER,
    star_id INTEGER,
    writer_id INTEGER,

    CONSTRAINT fk_director_id
        FOREIGN KEY(director_id) REFERENCES directors(id),

    CONSTRAINT fk_star_id
            FOREIGN KEY(star_id) REFERENCES stars(id),

    CONSTRAINT fk_writer_id
            FOREIGN KEY(writer_id) REFERENCES writers(id)
);