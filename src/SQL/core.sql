-- Create tables

CREATE TABLE IF NOT EXISTS Writers (
	id SERIAL PRIMARY KEY,
  name TEXT,
  email TEXT);


CREATE TABLE IF NOT EXISTS Stars (
	id SERIAL PRIMARY KEY,
  name TEXT,
  date_of_birth TEXT
);

CREATE TABLE IF NOT EXISTS Directors (
	id SERIAL PRIMARY KEY,
  name TEXT,
  country TEXT);

CREATE TABLE IF NOT EXISTS Films (
	id SERIAL PRIMARY KEY,
  title TEXT,
  year INT,
  genre TEXT,
  score INT,
  writer_id INT,
  star_id INT,
  director_id INT,
  CONSTRAINT fk_writer
  	FOREIGN KEY(writer_id)
  		REFERENCES Writers(id),
 	CONSTRAINT fk_star
  	FOREIGN KEY(star_id)
  		REFERENCES Stars(id),
	CONSTRAINT fk_director
  	FOREIGN KEY(director_id)
  		REFERENCES Directors(id)
);


-- Insert data
INSERT INTO Writers (name, email) VALUES
  ('Arthur C Clarke', 'arthur@clarke.com'),
  ('George Lucas', 'george@email.com'),
  ('Harper Lee', 'harper@lee.com'),
  ('James Cameron', 'james@cameron.com'),
  ('Boris Pasternak', 'boris@boris.com'),
  ('Frederick Frank', 'fred@frank.com'),
  ('Theodoros Angelopoulos', 'theo@angelopoulos.com'),
  ('Erik Hazelhoff Roelfzema', 'erik@roelfzema.com'),
  ('Krzysztof Kieslowski', 'email@email.com'),
  ('Edmond Rostand', 'edmond@rostand.com');

INSERT INTO Stars (name, date_of_birth) VALUES
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

INSERT INTO Directors (name, country) VALUES
  ('Stanley Kubrick', 'USA'),
  ('George Lucas', 'USA'),
  ('Robert Mulligan', 'USA'),
  ('James Cameron', 'Canada'),
  ('David Lean', 'UK'),
  ('Anthony Mann', 'USA'),
  ('Theodoros Angelopoulos', 'Greece'),
  ('Paul Verhoeven', 'Netherlands'),
  ('Krzysztof Kieslowski', 'Poland'),
  ('Jean-Paul Rappeneau', 'France');

INSERT INTO Films (title, year, genre, score, writer_id, star_id, director_id) VALUES
  ('2001: A Space Odyssey', 1968, 'Science Fiction', 10, 1, 1, 1),
  ('Star Wars: A New Hope', 1977, 'Science Fiction', 7, 2, 2, 2),
  ('To Kill A Mockingbird', 1962, 'Drama', 10, 3, 3, 3),
  ('Titanic', 1997, 'Romance', 5, 4, 4, 4),
  ('Dr Zhivago', 1965, 'Historical', 8, 5, 5, 5),
  ('El Cid', 1961, 'Historical', 6, 6, 6, 6),
  ('Voyage to Cythera', 1984, 'Drama', 8, 7, 7, 7),
  ('Soldier of Orange', 1977, 'Thriller', 8, 8, 8, 8),
  ('Three Colours: Blue', 1993, 'Drama', 8, 9, 9, 9),
  ('Cyrano de Bergerac', 1990, 'Historical', 9, 10, 10, 10);


-- Show the title and director name for all films

SELECT title, directors.name AS director
FROM films
INNER JOIN directors
	on films.director_id = directors.id;

-- Show the title, director and star name for all films

SELECT title, directors.name AS director, stars.name AS star
FROM films
INNER JOIN directors
	on films.director_id = directors.id
INNER JOIN Stars
	on films.star_id = stars.id;

-- Show the title of films where the director is from the USA

SELECT title
FROM films
INNER JOIN directors
	on films.director_id = directors.id
WHERE directors.country = 'USA';

-- Show only those films where the writer and the director are the same person

SELECT title
FROM films
INNER JOIN directors
	on films.director_id = directors.id
INNER JOIN writers
	on films.writer_id = writers.id
WHERE directors.name = writers.name;

-- Show directors and film titles for films with a score of 8 or higher

SELECT title, directors.name AS director
FROM films
INNER JOIN directors
	on films.director_id = directors.id
WHERE score >= 8;

/* Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables. */

-- Show title and the name of the star in all movies with a star born in april

SELECT title,  stars.name AS star
FROM films
INNER JOIN Stars
	on films.star_id = stars.id
WHERE stars.date_of_birth LIKE ('%/04/%');

-- Show title and writer of all movies that were released between 1968 and 1992

SELECT title, writers.name AS writer
FROM films
INNER JOIN writers
	on films.writer_id = writers.id
WHERE year BETWEEN 1968 AND 1992;

-- Show title and director of all movies that are not dramas and the director is not from the USA

SELECT title, directors.name AS director
FROM films
INNER JOIN directors
	on films.director_id = directors.id
WHERE genre <> 'Drama' AND directors.country <> 'USA';

-- Show title, director and the director country of all movies where the director is not from USA, UK or Canada

SELECT title, directors.name AS director, directors.country AS director_country
FROM films
INNER JOIN directors
	on films.director_id = directors.id
WHERE directors.country NOT IN ('USA', 'UK', 'Canada');

-- Show title, writer and director of all movies that were released in an odd year

SELECT title, directors.name AS director, writers.name AS writer
FROM films
INNER JOIN directors
	on films.director_id = directors.id
INNER JOIN writers
	on films.writer_id = writers.id
WHERE year % 2 = 1;

