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
CREATE TABLE IF NOT EXISTS actors (
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
    writer_id INTEGER,

    CONSTRAINT fk_director_id
        FOREIGN KEY(director_id) REFERENCES people(id),

    CONSTRAINT fk_writer_id
            FOREIGN KEY(writer_id) REFERENCES people(id)
);

--Cast table
CREATE TABLE IF NOT EXISTS film_cast (
    id SERIAL PRIMARY KEY,
    film_id INT REFERENCES films(id),
    actor_id INT REFERENCES actors(id),
    star_id INT REFERENCES actors(id)
);


--Populate Tables

--Populate People Table
INSERT INTO people (name) VALUES
  ('Stanley Kubrick'),('George Lucas'),('Robert Mulligan'),('James Cameron'),('David Lean'),
  ('Anthony Mann'),('Theodoros Angelopoulos'),('Paul Verhoeven'),('Krzysztof Kieślowski'),('Jean-Paul Rappeneau'),
  ('Keir Dullea'),('Mark Hamill'),('Gregory Peck'),('Leonardo DiCaprio'),('Julie Christie'),
  ('Charlton Heston'),('Manos Katrakis'),('Rutger Hauer'),('Juliette Binoche'),('Gerard Depardieu'),
  ('Arthur C Clarke'),('Harper Lee'),('Boris Pasternak'),('Frederick Frank'),('Theodoros Angelopoulos'),
  ('Erik Hazelhoff Roelfzema'),('Edmond Rostand'),
  ('Tom Hanks'),
  ('Meryl Streep'),
  ('Robert De Niro'),
  ('Brad Pitt');

--Populate Directors table
INSERT INTO directors (country, person_id)
VALUES
    ('USA', 1),('USA', 2),('USA', 3),('Canada', 4),('UK', 5),
    ('USA', 6),('Greece', 7),('Netherlands', 8),('Poland', 9),('France', 10);

--Populate Actors table
INSERT INTO actors (dob, person_id)
VALUES
    ('1936-05-30', 11),('1951-09-25', 12),('1916-04-05', 13),('1974-11-11', 14),('1940-04-14', 15),
    ('1923-10-04', 16),('1908-08-14', 17),('1944-01-23', 18),('1964-03-09', 19),('1948-12-27', 20),
    ('1945-07-03', 28),('1968-12-21', 29), ('1982-04-12', 30), ('1966-01-11', 31);


--Populate Films table
INSERT INTO films (title, year, genre, score, director_id, writer_id)
VALUES
    ('2001: A Space Odyssey', 1968, 'Science Fiction', 10, 1, 21),
    ('Star Wars: A New Hope', 1977, 'Science Fiction', 7, 2, 2),
    ('To Kill A Mockingbird', 1962, 'Drama', 10, 3, 22),
    ('Titanic', 1997, 'Romance', 5, 4, 23),
    ('Dr Zhivago', 1965, 'Historical', 8, 5, 24),
    ('El Cid', 1961, 'Historical', 6, 6, 25),
    ('Voyage to Cythera', 1984, 'Drama', 8, 7, 7),
    ('Soldier of Orange', 1977, 'Thriller', 8, 8, 26),
    ('Three Colours: Blue', 1993, 'Drama', 8, 9, 9),
    ('Cyrano de Bergerac', 1990, 'Historical', 9, 10, 27);


--Populate FilmCast table
INSERT INTO film_cast (film_id, actor_id, star_id)
VALUES
    (1, 1, 1), (1,2,1), (1,5,1),
    (2, 6, 2), (2, 12, 2), (2, 1, 2),
    (3, 1, 3),(3, 5, 3),(3, 11, 3),
    (4, 4, 4),(4, 1, 4),(4, 14, 4),(4, 6, 4),
    (5, 12, 5),(5, 1, 5),(5, 3, 5),
    (6, 14, 6),(6, 2, 6),
    (7, 11, 7),(7, 1, 7),(7, 8, 7),(7, 13, 7),(7, 10, 7),
    (8, 3, 8),
    (9, 2, 9),(9, 12, 9),(9, 3, 9),
    (10, 7, 10),(10, 2, 10);


--Select queries

--return all films with the actors and the star
SELECT title, pa.name as actor, ps.name as star FROM films
JOIN film_cast on film_cast.film_id = films.id
JOIN actors acs on acs.id = film_cast.actor_id
JOIN actors st on st.id = film_cast.star_id
JOIN people pa on pa.id = acs.person_id
JOIN people ps on ps.id = st.person_id;