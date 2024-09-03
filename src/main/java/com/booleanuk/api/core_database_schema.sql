
CREATE TABLE IF NOT EXISTS Film (
    id SERIAL PRIMARY KEY,
    title TEXT,
    release_year INTEGER,
    genre TEXT,
    score INTEGER
);

CREATE TABLE IF NOT EXISTS Director (
    id SERIAL PRIMARY KEY,
    film_id INTEGER,
    name TEXT UNIQUE,
    country TEXT,
    FOREIGN KEY (film_id) REFERENCES Film(id)
);

CREATE TABLE IF NOT EXISTS Star (
    id SERIAL PRIMARY KEY,
    film_id INTEGER,
    name TEXT,
    birth DATE,
    FOREIGN KEY (film_id) REFERENCES Film(id)
);

CREATE TABLE IF NOT EXISTS Writer (
    id SERIAL PRIMARY KEY,
    film_id INTEGER,
    name TEXT,
    email TEXT,
    FOREIGN KEY (film_id) REFERENCES Film(id)
);