CREATE TABLE IF NOT EXISTS directors(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    country TEXT NOT NULL
);


CREATE TABLE IF NOT EXISTS writers(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS stars (
    id SERIAL PRIMARY KEY,
    name TEXT,
    birthdate TEXT
);

CREATE TABLE IF NOT EXISTS films(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    director_id SERIAL NOT NULL,
    star_id SERIAL NOT NULL,
    writer_id SERIAL NOT NULL,
    year INT NOT NULL,
    genre TEXT NOT NULL,
    score INT NOT NULL,
    CONSTRAINT fk_writer FOREIGN KEY (writer_id) REFERENCES writers(id),
    CONSTRAINT fk_director FOREIGN KEY (director_id) REFERENCES directors(id),
    CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES stars(id)
);

