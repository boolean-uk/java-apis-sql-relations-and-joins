DROP TABLE IF EXISTS films CASCADE;
DROP TABLE IF EXISTS people CASCADE;
DROP TABLE IF EXISTS directors CASCADE;
DROP TABLE IF EXISTS writers  CASCADE;
DROP TABLE IF EXISTS stars CASCADE;



CREATE TABLE IF NOT EXISTS people (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    UNIQUE(name)
);


CREATE TABLE IF NOT EXISTS directors(
    person_id INT NOT NULL PRIMARY KEY,
    country TEXT NOT NULL,
    CONSTRAINT fk_person FOREIGN KEY (person_id) REFERENCES people(id)
);

CREATE TABLE IF NOT EXISTS writers(
    person_id INT NOT NULL PRIMARY KEY,
    email TEXT NOT NULL UNIQUE,
    CONSTRAINT fk_person FOREIGN KEY (person_id) REFERENCES people(id)
);

CREATE TABLE IF NOT EXISTS stars (
    person_id INT NOT NULL PRIMARY KEY,
    birthdate TEXT,
    CONSTRAINT fk_person FOREIGN KEY (person_id) REFERENCES people(id)
);


CREATE TABLE IF NOT EXISTS films(
    id SERIAL PRIMARY KEY,
    title TEXT,
    director_id INT NOT NULL,
    star_id INT NOT NULL,
    writer_id INT NOT NULL,
    year INT NOT NULL,
    genre TEXT NOT NULL,
    score INT NOT NULL,
    CONSTRAINT fk_director FOREIGN KEY (director_id) REFERENCES people(id),
    CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES people(id),
    CONSTRAINT fk_writer FOREIGN KEY (writer_id) REFERENCES people(id)
);
