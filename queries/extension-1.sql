--People Table
CREATE TABLE IF NOT EXISTS people (
    id SERIAL PRIMARY KEY,
    name VARCHAR(70) NOT NULL
);

-- Directors table
CREATE TABLE IF NOT EXISTS directors (
    id SERIAL PRIMARY KEY,
    country VARCHAR(60) NOT NULL,
    person_id INTEGER,

    CONSTRAINT fk_person_id
        FOREIGN KEY (person_id) REFERENCES people(id)
);

--Stars table
CREATE TABLE IF NOT EXISTS stars (
    id SERIAL PRIMARY KEY,
    dob DATE,
    person_id INTEGER,

        CONSTRAINT fk_person_id
            FOREIGN KEY (person_id) REFERENCES people(id)
);

--Writers table
CREATE TABLE IF NOT EXISTS writers (
    id SERIAL PRIMARY KEY,
    email VARCHAR(70),
    person_id INTEGER,

        CONSTRAINT fk_person_id
            FOREIGN KEY (person_id) REFERENCES people(id)
);

--Films table
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
        FOREIGN KEY(director_id) REFERENCES directors(id), --CHANGED

    CONSTRAINT fk_star_id
            FOREIGN KEY(star_id) REFERENCES stars(id),

    CONSTRAINT fk_writer_id
            FOREIGN KEY(writer_id) REFERENCES writers(id)
);


--Populate Tables

--Populate People Table
INSERT INTO people (name) VALUES
  ('Stanley Kubrick'),('George Lucas'),('Robert Mulligan'),('James Cameron'),('David Lean'),
  ('Anthony Mann'),('Theodoros Angelopoulos'),('Paul Verhoeven'),('Krzysztof Kieślowski'),('Jean-Paul Rappeneau'),
  ('Keir Dullea'),('Mark Hamill'),('Gregory Peck'),('Leonardo DiCaprio'),('Julie Christie'),
  ('Charlton Heston'),('Manos Katrakis'),('Rutger Hauer'),('Juliette Binoche'),('Gerard Depardieu'),
  ('Arthur C Clarke'),('Harper Lee'),('Boris Pasternak'),('Frederick Frank'),('Theodoros Angelopoulos'),
  ('Erik Hazelhoff Roelfzema'),('Edmond Rostand');

--Populate Directors table
INSERT INTO directors (country, person_id)
VALUES
    ('USA', 1),('USA', 2),('USA', 3),('Canada', 4),('UK', 5),
    ('USA', 6),('Greece', 7),('Netherlands', 8),('Poland', 9),('France', 10);

--Populate Stars table
INSERT INTO stars (dob, person_id)
VALUES
    ('1936-05-30', 11),('1951-09-25', 12),('1916-04-05', 13),('1974-11-11', 14),('1940-04-14', 15),
    ('1923-10-04', 16),('1908-08-14', 17),('1944-01-23', 18),('1964-03-09', 19),('1948-12-27', 20);

--Populate Writers table
INSERT INTO writers (email, person_id)
VALUES
    ('arthur@clarke.com', 21),
    ('george@email.com', 2),
    ('harper@lee.com', 22),
    ('james@cameron.com', 23),
    ('boris@boris.com', 24),
    ('fred@frank.com', 25),
    ('theo@angelopoulos.com', 7),
    ('erik@roelfzema.com', 26),
    ('email@email.com', 9),
    ('edmond@rostand.com', 27);


--Populate Films table
INSERT INTO films (title, year, genre, score, director_id, star_id, writer_id)
VALUES
    ('2001: A Space Odyssey', 1968, 'Science Fiction', 10, 1, 11, 21),
    ('Star Wars: A New Hope', 1977, 'Science Fiction', 7, 2, 12, 2),
    ('To Kill A Mockingbird', 1962, 'Drama', 10, 3, 13, 22),
    ('Titanic', 1997, 'Romance', 5, 4, 14, 23),
    ('Dr Zhivago', 1965, 'Historical', 8, 5, 15, 24),
    ('El Cid', 1961, 'Historical', 6, 6, 16, 25),
    ('Voyage to Cythera', 1984, 'Drama', 8, 7, 17, 7),
    ('Soldier of Orange', 1977, 'Thriller', 8, 8, 18, 26),
    ('Three Colours: Blue', 1993, 'Drama', 8, 9, 9, 9),
    ('Cyrano de Bergerac', 1990, 'Historical', 9, 10, 20, 27);


-- Modified select queries

--Show the title and director name for all films
SELECT title, name
FROM films
JOIN people ON director_id = people.id;

--Show the title, director and star name for all films
SELECT
title, director.name AS director, star.name AS star
FROM films
JOIN people director ON director_id = director.id
JOIN people star ON star_id = star.id;

--Show the title of films where the director is from the USA
SELECT title
FROM films
JOIN people ON director_id = people.id
JOIN directors ON people.id = directors.id
WHERE country = 'USA';

--Show only those films where the writer and the director are the same person
SELECT title
FROM films
WHERE director_id = writer_id;

--Show directors and film titles for films with a score of 8 or higher
SELECT name AS director, title
FROM films
JOIN people ON director_id = people.id
WHERE score >= 8;