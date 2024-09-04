DROP DATABASE IF EXISTS films;
DROP TABLE IF EXISTS films CASCADE;
DROP TABLE IF EXISTS directors CASCADE;
DROP TABLE IF EXISTS stars CASCADE;
DROP TABLE IF EXISTS writers CASCADE;

CREATE DATABASE films;
-- psql specific command:
\c films;

CREATE TABLE stars(
  id SERIAL PRIMARY KEY,
  name varchar(255) NOT NULL,
  birthday date NOT NULL
);

CREATE TABLE writers(
  email varchar(255) PRIMARY KEY,
  name varchar(255) NOT NULL
);

CREATE TABLE directors(
  id SERIAL PRIMARY KEY,
  name varchar(255) NOT NULL,
  country varchar(255) NOT NULL
);

CREATE TABLE films(
  id SERIAL PRIMARY KEY,
  title varchar(255) NOT NULL,
  year integer NOT NULL,
  genre varchar(255) NOT NULL,
  score integer NOT NULL,

  star_id integer,
  director_id integer,
  writer_email varchar(255),

  UNIQUE(title),
  FOREIGN KEY(star_id) REFERENCES stars(id),
  FOREIGN KEY(director_id) REFERENCES directors(id),
  FOREIGN KEY(writer_email) REFERENCES writers(email)
);


INSERT INTO directors(name, country) VALUES
  ('Stanley Kubrick', 'USA'),
  ('George Lucas', 'USA'),
  ('Robert Mulligan', 'USA'),
  ('James Cameron', 'Canada'),
  ('David Lean', 'UK'),
  ('Anthony Mann', 'USA'),
  ('Theodoros Angelopoulos', 'Greece'),
  ('Paul Verhoeven', 'Netherlands'),
  ('Krzysztof Kieslowski', 'Poland'),
  ('Jean-Paul Rappeneua', 'France');

INSERT INTO writers(email, name) VALUES
  ('arthur@clarke.com', 'Arthur C Clarke'),
  ('george@email.com', 'George Lucas'),
  ('harper@lee.com', 'Harper Lee'),
  ('james@cameron.com', 'James Cameron'),
  ('boris@boris.com', 'Boris Pasternak'),
  ('fred@frank.com', 'Frederick Frank'),
  ('theo@angelopoulos.com', 'Theodoros Angelopoulos'),
  ('erik@roelfzema.com', 'Hazelhoff Roelfzema'),
  ('email@email.com', 'Krzysztof Kieslowski'),
  ('edmond@rostand.com', 'Edmond Rostand');

INSERT INTO stars(name, birthday) VALUES
  ('Keir Dullea', '30/05/1936'),
  ('Mark Hamill', '25/09/1951'),
  ('Gregory Peck', '05/04/1916'),
  ('Leonardo DiCaprio', '11/11/1974'),
  ('Julie Christie', '14/04/1940'),
  ('Charlton Heston', '04/10/1923'),
  ('Manos Katrakis', '14/08/1908'),
  ('Rutger Hauer', '23/01/1944'),
  ('Juliette Binoche', '09/03/1964'),
  ('Gerard Depardieu', '27/12/1948');

INSERT INTO films(title, year, genre, score, star_id, director_id, writer_email) VALUES
  ('2001: A Space Odyssey', 1968, 'Science Fiction', 10, 1, 1, 'arthur@clarke.com'),
  ('Star Wars: A New Hope', 1977, 'Science Fiction', 7, 2, 2, 'george@email.com'),
  ('To Kill A Mockingbird', 1962, 'Drama', 10, 3, 3, 'harper@lee.com'),
  ('Titanic', 1997, 'Romance', 5, 4, 4, 'james@cameron.com'),
  ('Dr Zhivago', 1965, 'Historical', 8, 5, 5, 'boris@boris.com'),
  ('El Cid', 1961, 'Historical', 6, 6, 6, 'fred@frank.com'),
  ('Voyage to Cythera', 1984, 'Drama', 8, 7, 7, 'theo@angelopoulos.com'),
  ('Soldier of Orange', 1977, 'Thriller', 8, 8, 8, 'erik@roelfzema.com'),
  ('Three Colours: Blue', 1993, 'Drama', 8, 9, 9, 'email@email.com'),
  ('Cyrano de Bergerac', 1990, 'Historical', 9, 10, 10, 'edmond@rostand.com');
