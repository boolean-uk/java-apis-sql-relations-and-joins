--CREATING THE TABLES
CREATE TABLE IF NOT EXISTS director (
  id SERIAL PRIMARY KEY,
  name TEXT,
  country TEXT
);

CREATE TABLE IF NOT EXISTS star (
  id SERIAL PRIMARY KEY,
  name TEXT,
  date_of_birth TEXT
);

CREATE TABLE IF NOT EXISTS writer (
  id SERIAL PRIMARY KEY,
  name TEXT,
  email TEXT
);

--INSERTING THE DATA
INSERT INTO director(name, country)
VALUES
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

INSERT INTO star(name, date_of_birth)
VALUES
('Keir Dullea', '30/05/1936'),
('Mark Hamill', '25/09/1951'),
('Gregory Peck', '05/04/1916'),
('Leonardo DiCaprio', '11/11/1974'),
('Julie Christie','14/04/1940'),
('Charlton Heston','04/10/1923'),
('Manos Katrakis','14/08/1908'),
('Rutger Hauer','23/01/1944'),
('Juliette Binoche','09/03/1964'),
('Gerard Depardieu','27/12/1948');

INSERT INTO writer(name, email)
VALUES
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

-- CREATING THE film TABLE WITH FK
CREATE TABLE IF NOT EXISTS film (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  director_id INTEGER,
  star_id INTEGER,
  writer_id INTEGER,
  year INTEGER,
  genre TEXT,
  score INTEGER,
  	CONSTRAINT fk_director
  			FOREIGN KEY(director_id)
  					REFERENCES director(id),

  	CONSTRAINT fk_star
  			FOREIGN KEY(star_id)
  					REFERENCES star(id),

  	CONSTRAINT fk_writer
  			FOREIGN KEY(writer_id)
  					REFERENCES writer(id)

);

--INSERTING DATA INTO film WITH THE CORRECT FKs
INSERT INTO film (title, director_id, star_id, writer_id, year, genre, score)
VALUES
('2001: A Space Odyssey', 1, 1, 1, 1968, 'Science Fiction', 10),
('Star Wars: A New Hope', 2, 2, 2, 1977, 'Science Fiction', 7),
('To Kill A Mockingbird', 3, 3, 3, 1962, 'Drama', 10),
('Titanic', 4, 4, 4, 1997, 'Romance', 5),
('Dr Zhivago', 5, 5, 5, 1965, 'Historical', 8),
('El Cid', 6, 6, 6, 1961, 'Historical', 6),
('Voyage to Cythera', 7, 7, 7, 1984, 'Drama', 8),
('Soldier of Orange', 8, 8, 8, 1977, 'Thriller', 8),
('Three Colours: Blue', 9, 9, 9, 1993, 'Drama', 8),
('Cyrano de Bergerac', 10, 10, 10, 1990, 'Historical', 9);

-- Queries
-- Show the title and director name for all films
SELECT film.title, director.name
FROM film
INNER JOIN director
    ON film.director_id=director.id;

-- Show the title, director and star name for all films
SELECT film.title, director.name, star.name
FROM film
INNER JOIN director
		ON film.director_id=director.id
INNER JOIN star
		ON film.star_id=star.id;

-- Show the title of films where the director is from the USA
SELECT film.title
FROM film
INNER JOIN director
				ON film.director_id=director.id
WHERE director.country = 'USA';

-- Show only those films where the writer and the director are the same person
SELECT * FROM film
INNER JOIN director
				ON film.director_id=director.id
INNER JOIN writer
				ON film.writer_id=writer.id
WHERE director.name = writer.name;

-- Show directors and film titles for films with a score of 8 or higher
SELECT director.name, film.title FROM film
INNER JOIN director
				ON film.director_id=director.id
WHERE film.score >= 8;

-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.

-- 1. Show the title and director name for films created before 1965
SELECT film.title, director.name
FROM film
INNER JOIN director
		ON film.director_id=director.id
WHERE film.year < 1965

-- 2. Show the title, star's name and DOB and the name of the writer for movies created after 1965
SELECT film.title, star.name, star.date_of_birth, writer.name
FROM film
INNER JOIN star
				ON film.star_id=star.id
INNER JOIN writer
				ON film.writer_id=writer.id
WHERE film.year > 1965;

-- 3. Show the writer name and email for all movies where the Leonardo DiCaprio have stared in.

SELECT writer.name, writer.email
FROM film
INNER JOIN writer
				ON film.writer_id=writer.id
INNER JOIN star
				ON film.star_id=star.id
WHERE star.name = 'Leonardo DiCaprio';

-- 4. Show title and the stars name for the genre Historical

SELECT film.title, star.name FROM film
INNER JOIN star
				ON film.star_id=star.id
WHERE film.genre = 'Historical';

-- 5. Show the title, writers name and score from the best score to the worst for the genre Science Fiction.
SELECT film.title, writer.name, film.score
FROM FILM
INNER JOIN writer
				ON film.writer_id=writer.id
WHERE film.genre = 'Science Fiction'
		ORDER BY film.score DESC;
