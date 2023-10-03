first we have to drop all tables and then create from scratch the tables:

DROP TABLE directors
DROP TABLE stars
DROP TABLE writers
DROP TABLE films

CREATE TABLE IF NOT EXISTS people (
id SERIAL PRIMARY KEY,
name TEXT
);

CREATE TABLE IF NOT EXISTS stars (
id SERIAL PRIMARY KEY,
date_of_birth TEXT,
person_id INTEGER,
CONSTRAINT fk_people FOREIGN KEY (person_id) REFERENCES people(id)
);

CREATE TABLE IF NOT EXISTS writers (
id SERIAL PRIMARY KEY,
email TEXT,
person_id INTEGER,
CONSTRAINT fk_people FOREIGN KEY (person_id) REFERENCES people(id)
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