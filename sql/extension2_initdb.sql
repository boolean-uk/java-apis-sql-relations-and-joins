DROP DATABASE IF EXISTS films;
DROP TABLE IF EXISTS films CASCADE;
DROP TABLE IF EXISTS directors CASCADE;
DROP TABLE IF EXISTS stars CASCADE;
DROP TABLE IF EXISTS writers CASCADE;
DROP TABLE IF EXISTS people CASCADE;
DROP TABLE IF EXISTS casts CASCADE;
DROP TABLE IF EXISTS actors CASCADE;

CREATE DATABASE films;
-- psql specific command:
\c films;

CREATE TABLE people(
  id SERIAL PRIMARY KEY,
  name varchar(255) NOT NULL
);

CREATE TABLE stars(
  id SERIAL PRIMARY KEY,
  people_id integer NOT NULL,
  birthday date NOT NULL,

  FOREIGN KEY(people_id) REFERENCES people(id)
);

CREATE TABLE writers(
  email varchar(255) PRIMARY KEY,
  people_id integer NOT NULL,

  FOREIGN KEY(people_id) REFERENCES people(id)
);

CREATE TABLE directors(
  id SERIAL PRIMARY KEY,
  people_id integer NOT NULL,
  country varchar(255) NOT NULL,

  FOREIGN KEY(people_id) REFERENCES people(id)
);

CREATE TABLE casts(
  id SERIAL PRIMARY KEY,

  star_id integer NOT NULL,
  director_id integer NOT NULL,
  writer_email varchar(255) NOT NULL,

  FOREIGN KEY(star_id) REFERENCES stars(id),
  FOREIGN KEY(director_id) REFERENCES directors(id),
  FOREIGN KEY(writer_email) REFERENCES writers(email)
);

CREATE TABLE actors(
  id SERIAL PRIMARY KEY,

  cast_id integer NOT NULL,
  people_id integer NOT NULL,

  FOREIGN KEY(cast_id) REFERENCES casts(id),
  FOREIGN KEY(people_id) REFERENCES people(id)
);

CREATE TABLE films(
  id SERIAL PRIMARY KEY,
  title varchar(255) NOT NULL,
  year integer NOT NULL,
  genre varchar(255) NOT NULL,
  score integer NOT NULL,

  cast_id integer NOT NULL,

  UNIQUE(title),
  FOREIGN KEY(cast_id) REFERENCES casts(id)
);


INSERT INTO people(name) VALUES
  ('Stanley Kubrick'),
  ('George Lucas'),
  ('Robert Mulligan'),
  ('James Cameron'),
  ('David Lean'),
  ('Anthony Mann'),
  ('Theodoros Angelopoulos'),
  ('Paul Verhoeven'),
  ('Krzysztof Kieslowski'),
  ('Jean-Paul Rappeneua'),

  ('Arthur C Clarke'),
  ('George Lucas'),
  ('Harper Lee'),
  ('James Cameron'),
  ('Boris Pasternak'),
  ('Frederick Frank'),
  ('Theodoros Angelopoulos'),
  ('Hazelhoff Roelfzema'),
  ('Krzysztof Kieslowski'),
  ('Edmond Rostand'),

  ('Keir Dullea'),
  ('Mark Hamill'),
  ('Gregory Peck'),
  ('Leonardo DiCaprio'),
  ('Julie Christie'),
  ('Charlton Heston'),
  ('Manos Katrakis'),
  ('Rutger Hauer'),
  ('Juliette Binoche'),
  ('Gerard Depardieu');


INSERT INTO directors(people_id, country) VALUES
  (1, 'USA'),
  (2, 'USA'),
  (3, 'USA'),
  (4, 'Canada'),
  (5, 'UK'),
  (6, 'USA'),
  (7, 'Greece'),
  (8, 'Netherlands'),
  (9, 'Poland'),
  (10, 'France');

INSERT INTO writers(people_id, email) VALUES
  (11, 'arthur@clarke.com'),
  (12, 'george@email.com'),
  (13, 'harper@lee.com'),
  (14, 'james@cameron.com'),
  (15, 'boris@boris.com'),
  (16, 'fred@frank.com'),
  (17, 'theo@angelopoulos.com'),
  (18, 'erik@roelfzema.com'),
  (19, 'email@email.com'),
  (20, 'edmond@rostand.com');

INSERT INTO stars(people_id, birthday) VALUES
  (21, '30/05/1936'),
  (22, '25/09/1951'),
  (23, '05/04/1916'),
  (24, '11/11/1974'),
  (25, '14/04/1940'),
  (26, '04/10/1923'),
  (27, '14/08/1908'),
  (28, '23/01/1944'),
  (29, '09/03/1964'),
  (30, '27/12/1948');

INSERT INTO casts(star_id, director_id, writer_email) VALUES
  (1, 1, 'arthur@clarke.com'),
  (2, 2, 'george@email.com'),
  (3, 3, 'harper@lee.com'),
  (4, 4, 'james@cameron.com'),
  (5, 5, 'boris@boris.com'),
  (6, 6, 'fred@frank.com'),
  (7, 7, 'theo@angelopoulos.com'),
  (8, 8, 'erik@roelfzema.com'),
  (9, 9, 'email@email.com'),
  (10, 10, 'edmond@rostand.com');

INSERT INTO actors(cast_id, people_id) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);

INSERT INTO films(title, year, genre, score, cast_id) VALUES
  ('2001: A Space Odyssey', 1968, 'Science Fiction', 10, 1),
  ('Star Wars: A New Hope', 1977, 'Science Fiction', 7, 2),
  ('To Kill A Mockingbird', 1962, 'Drama', 10, 3),
  ('Titanic', 1997, 'Romance', 5, 4),
  ('Dr Zhivago', 1965, 'Historical', 8, 5),
  ('El Cid', 1961, 'Historical', 6, 6),
  ('Voyage to Cythera', 1984, 'Drama', 8, 7),
  ('Soldier of Orange', 1977, 'Thriller', 8, 8),
  ('Three Colours: Blue', 1993, 'Drama', 8, 9),
  ('Cyrano de Bergerac', 1990, 'Historical', 9, 10);
