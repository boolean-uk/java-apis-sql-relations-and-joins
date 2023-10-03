CREATE TABLE IF NOT EXISTS directors (
id SERIAL PRIMARY KEY,
name TEXT,
country TEXT
);

CREATE TABLE IF NOT EXISTS stars (
id SERIAL PRIMARY KEY,
name TEXT,
date_of_birth TEXT
);

CREATE TABLE IF NOT EXISTS writers (
id SERIAL PRIMARY KEY,
name TEXT,
email TEXT
);

CREATE TABLE IF NOT EXISTS films (
id SERIAL PRIMARY KEY,
title TEXT,
year INTEGER,
genre TEXT,
score INTEGER,
director_id INTEGER,
star_id INTEGER,
writer_id INTEGER,
CONSTRAINT fk_directors FOREIGN KEY (director_id) REFERENCES directors(id),
CONSTRAINT fk_stars FOREIGN KEY (star_id) REFERENCES stars(id),
CONSTRAINT fk_writers FOREIGN KEY (writer_id) REFERENCES writers(id)
);