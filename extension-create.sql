DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS directors;
DROP TABLE IF EXISTS writers;

CREATE TABLE people (
    id serial PRIMARY KEY,
    name text
);

CREATE TABLE actors (
    people_id int PRIMARY KEY,
    dob date,
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE IF NOT EXISTS directors (
    people_id int PRIMARY KEY,
    country text,
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE IF NOT EXISTS writers (
    people_id int PRIMARY KEY,
    email text UNIQUE,
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE IF NOT EXISTS films (
    id serial PRIMARY KEY,
    title text NOT NULL,
    year int NOT NULL,
    director_id int NOT NULL,
    star_id int NOT NULL,
    writer_id int NOT NULL,
    genre text,
    score int,
    FOREIGN KEY (director_id) REFERENCES directors(people_id),
    FOREIGN KEY (star_id) REFERENCES actors(people_id),
    FOREIGN KEY (writer_id) REFERENCES writers(people_id)
);

INSERT INTO people (name)
VALUES
    ('Keir Dullea'),
    ('Mark Hamill'),
    ('Gregory Peck'),
    ('Leonardo DiCaprio'),
    ('Julie Christie'),
    ('Charlton Heston'),
    ('Manos Katrakis'),
    ('Rutger Hauer'),
    ('Juliette Binoche'),
    ('Gerard Depardieu'),
    ('Stanley Kubrick'),
    ('George Lucas'),
    ('Robert Mulligan'),
    ('James Cameron'),
    ('David Lean'),
    ('Anthony Mann'),
    ('Theodoros Angelopoulos'),
    ('Paul Verhoeven'),
    ('Krzysztof Kieslowski'),
    ('Jean-Paul Rappeneau'),
    ('Arthur C Clarke'),
    ('George Lucas'),
    ('Harper Lee'),
    ('James Cameron'),
    ('Boris Pasternak'),
    ('Frederick Frank'),
    ('Theodoros Angelopoulos'),
    ('Erik Hazelhoff Roelfzema'),
    ('Krzysztof Kieslowski'),
    ('Edmond Rostand')

INSERT INTO actors (people_id, dob)
VALUES
    (1, '1936-05-30'),
    (2, '1951-09-25'),
    (3, '1916-04-05'),
    (4, '1974-11-11'),
    (5, '1940-04-14'),
    (6, '1923-10-04'),
    (7, '1908-08-14'),
    (8, '1944-01-23'),
    (9, '1964-03-09'),
    (10, '1948-12-27')

INSERT INTO directors (people_id, country)
VALUES
    (11, 'USA'),
    (12, 'USA'),
    (13, 'USA'),
    (14, 'Canada'),
    (15, 'UK'),
    (16, 'USA'),
    (17, 'Greece'),
    (18, 'Netherlands'),
    (19, 'Poland'),
    (20, 'France')

INSERT INTO writers (people_id, email)
VALUES
    (21, 'arthur@clarke.com'),
    (22, 'george@email.com'),
    (23, 'harper@lee.com'),
    (24, 'james@cameron.com'),
    (25, 'boris@boris.com'),
    (26, 'fred@frank.com'),
    (27, 'theo@angelopoulos.com'),
    (28, 'erik@roelfzema.com'),
    (29, 'email@email.com'),
    (30, 'edmond@rostand.com')

INSERT INTO films(
    title,
    year,
    director_id,
    star_id,
    writer_id,
    genre,
    score
) VALUES
    ('2001: A Space Odyssey', 1968, 11, 1, 21, 'Science Fiction', 10),
    ('Star Wars: A New Hope', 1977, 12, 2, 22, 'Science Fiction', 7),
    ('To Kill A Mockingbird', 1962, 13, 3, 23, 'Drama', 10),
    ('Titanic', 1997, 14, 4, 24, 'Romance', 5),
    ('Dr Zhivago', 1965, 15, 5, 25, 'Historical', 8),
    ('El Cid', 1961, 16, 6, 26, 'Historical', 6),
    ('Voyage to Cythera', 1984, 17, 7, 27, 'Drama', 8),
    ('Soldier of Orange', 1977, 18, 8, 28, 'Thriller', 8),
    ('Three Colours: Blue', 1993, 19, 9, 29, 'Drama', 8),
    ('Cyrano de Bergerac', 1990, 20, 10, 30, 'Historical', 9)