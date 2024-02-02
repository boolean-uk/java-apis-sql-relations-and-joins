CREATE TABLE IF NOT EXISTS Actors (
  id SERIAL PRIMARY KEY,
  name TEXT,
  dob TEXT
);

CREATE TABLE IF NOT EXISTS Directors (
  id SERIAL PRIMARY KEY,
  name TEXT,
  country TEXT
);

CREATE TABLE IF NOT EXISTS Writers (
  id SERIAL PRIMARY KEY,
  name TEXT,
  email TEXT
);

CREATE TABLE IF NOT EXISTS Films (
  id SERIAL PRIMARY KEY,
  title TEXT,
  year INT,
  genre TEXT,
  score INT,
  star_id INT,
  director_id INT,
  writer_id INT,
  UNIQUE(title),
  CONSTRAINT fk_star
      FOREIGN KEY(star_id)
          REFERENCES Actors(id),
  CONSTRAINT fk_director
      FOREIGN KEY(director_id)
          REFERENCES Directors(id),
  CONSTRAINT fk_writer
      FOREIGN KEY(writer_id)
          REFERENCES Writers(id)
);

INSERT INTO Actors
	(name, dob)
VALUES
	('Keir Dullea', '30/05/1936'),
    ('Mark Hamill', '25/09/1951'),
    ('Gregory Peck', '05/04/1916'),
    ('Leonardo DiCaprio', '11/11/1974'),
    ('Julie Christie', '14/04/1940'),
    ('Charlton Heston', '04/10/1923'),
    ('Manos Katrakis', '14/08/1908'),
    ('Rutger Hauer', '23/01/1944'),
    ('Juliette Binoche', '09/03/1964'),
    ('Gerard Depardieu', '27/12/1948')
;

INSERT INTO Films
	(title, year, genre, score, star_id, director_id, writer_id)
VALUES
	('2001: A Space Odyssey', 1968, 'Science Fiction', 10, 1, 1, 1),
    ('Star Wars: A New Hope', 1977, 'Science Fiction', 7, 2, 2, 2),
    ('To Kill A Mockingbird', 1962, 'Drama', 10, 3, 3, 3),
    ('Titanic', 1997, 'Romance', 5, 4, 4, 4),
    ('Dr Zhivago', 1965, 'Historical', 8, 5, 5, 5),
    ('El Cid', 1961, 'Historical', 6, 6, 6, 6),
    ('Voyage to Cythera', 1984, 'Drama', 8, 7, 7, 7),
    ('Soldier of Orange', 1977, 'Thriller', 8, 8, 8, 8),
    ('Three Colours: Blue', 1993, 'Drama', 8, 9, 9, 9),
    ('Odyssey', 1968, 'Romance', 9, 10, 10, 10)
;

CREATE TABLE IF NOT EXISTS Casting (
  id SERIAL PRIMARY KEY,
  film_id INT,
  actor_id INT,
  CONSTRAINT fk_film
      FOREIGN KEY(film_id)
          REFERENCES Films(id),
  CONSTRAINT fk_actor
      FOREIGN KEY(actor_id)
          REFERENCES Actors(id)
);

INSERT INTO Casting
	(film_id, actor_id)
VALUES
	(1, 2),
    (1, 4),
    (1, 7),
    (4, 2),
    (4, 9),
    (4, 10)
;

SELECT films.title, normal.name AS casting, star.name AS star
  FROM casting
    JOIN actors AS normal
      ON actor_id = normal.id
    JOIN films
      ON film_id = films.id
    JOIN actors AS star
  		ON films.star_id = star.id
;