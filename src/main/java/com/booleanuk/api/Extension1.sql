-- EXTENSION 1
-- Refactor the database tables so that the Actors, Directors and Writers
-- all identify people (using a Foreign Key) that are present in a single People table
-- Where necessary refactor the queries to take advantage of this new structure

-- DROP TABLE film, people;

CREATE TABLE people(
	id serial PRIMARY KEY,
	name TEXT NOT NULL,
	dob DATE,
	country TEXT,
	email TEXT
);

CREATE TABLE film(
	id serial PRIMARY KEY,
	title TEXT NOT NULL,
	directorId INTEGER NOT NULL REFERENCES people,
	starId INTEGER NOT NULL REFERENCES people,
	writerId INTEGER NOT NULL REFERENCES people,
	year INTEGER NOT NULL,
	genre TEXT NOT NULL,
	score int NOT NULL
);

-- Then populate the tables with the data shown
INSERT INTO people(name, country)
VALUES
	('Stanley Kubrick','USA'),
	('George Lucas','USA'),
	('Robert Mulligan','USA'),
	('James Cameron','Canada'),
	('David Lean','UK'),
	('Anthony Mann','USA'),
	('Theodoros Angelopoulos','Greece'),
	('Paul Verhoeven','Netherlands'),
	('Krzysztof Kieslowski','Poland'),
	('Jean-Paul Rappeneau','France');

INSERT INTO people(name, dob)
VALUES
	('Keir Dullea','1936-05-30'),
	('Mark Hamill','1951-09-25'),
	('Gregory Peck','1916-04-05'),
	('Leonardo DiCaprio','1974-11-11'),
	('Julie Christie','1940-04-14'),
	('Charlton Heston','1923-10-04'),
	('Manos Katrakis','1908-08-14'),
	('Rutger Hauer','1944-01-23'),
	('Juliette Binoche','1964-03-09'),
	('Gerard Depardieu','1948-12-27');

INSERT INTO people(name, email)
VALUES
	('Arthur C Clarke','arthur@clarke.com'),
-- 	('George Lucas','george@email.com'),
	('Harper Lee','harper@lee.com'),
	('James Cameron','james@cameron.com'),
	('Boris Pasternak','boris@boris.com'),
	('Frederick Frank','fred@frank.com'),
	('Theodoros Angelopoulos','theo@angelopoulos.com'),
	('Erik Hazelhoff Roelfzema','erik@roelfzema.com'),
	('Krzysztof Kieslowsk','email@email.com'),
	('Edmond Rostand','edmond@rostand.com');

INSERT INTO film(title, directorId, starId, writerId, year, genre, score) VALUES
	('2001: A Space Odyssey', 1, 11, 21, 1968, 'Science Fiction', 10),
	('Star Wars: A New Hope', 2, 12, 2, 1977, 'Science Fiction', 7),
	('To Kill A Mockingbird', 3, 13, 22, 1962, 'Drama', 10),
	('Titanic', 4, 14, 23, 1997, 'Romance', 5),
	('Dr Zhivago', 5, 15, 24, 1965, 'Historical', 8),
	('El Cid', 6, 16, 25, 1961, 'Historical', 6),
	('Voyage to Cythera', 7, 17, 26, 1984, 'Drama', 8),
	('Soldier of Orange', 8, 18, 27, 1977, 'Thriller', 8),
	('Three Colours: Blue', 9, 19, 28, 1993, 'Drama', 8),
	('Cyrano de Bergerac', 10, 20, 29, 1990, 'Historical', 9);



-- Once you have the tables and data set up then you need to create queries to return the data needed as shown below:

-- Show the title and director name for all films
SELECT film.title, people.name
FROM film
JOIN people ON film.directorid = people.id;


-- Show the title, director and star name for all films
-- Multiple joins with different alias to be able to write out both director and star name
SELECT
    film.title AS film_title,
    director.name AS director,
    film.directorid,
    star.name AS star,
    film.starid
FROM
    film
LEFT JOIN
    people AS director ON film.directorid = director.id
LEFT JOIN
    people AS star ON film.starid = star.id;


-- Show the title of films where the director is from the USA
SELECT film.title AS film_title
FROM film
JOIN people ON film.directorid = people.id
WHERE people.country = 'USA';

-- Show only those films where the writer and the director are the same person
SELECT film.title AS film_title
FROM film
WHERE film.directorId = film.writerId;

-- Show directors and film titles for films with a score of 8 or higher
SELECT
	film.title AS film_title,
	people.name AS director
FROM film
JOIN people ON film.directorid = people.id
WHERE film.score >= 8;

-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.
-- 1. Count number of genres
SELECT
	film.genre AS film_genre,
	COUNT(people.name)
FROM film
JOIN people ON film.starid = people.id
GROUP BY film.genre;

-- 2. Show film year and date of birth for the star in each film
SELECT
	film.title AS film_title,
	film.year AS film_year,
	people.dob AS star_dob
FROM film
JOIN people ON film.starid = people.id;

-- 3. Show the film and director for all directors that starts with J
SELECT
	film.title AS film_title,
	people.name
FROM film
JOIN people ON film.directorid = people.id
WHERE people.name LIKE 'J%';

-- 4. Show all films where Boris Pasternak and Frederick Frank are the writers.
SELECT film.title AS film_title, people.id, people.name
FROM film
JOIN people ON film.writerId = people.id
WHERE people.name IN ('Boris Pasternak', 'Frederick Frank');

-- 5. Same as above but with check for ID instead.
SELECT film.title AS film_title, people.name
FROM film
JOIN people ON film.writerId = people.id
WHERE people.id IN (24, 25);