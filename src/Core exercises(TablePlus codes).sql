--Create the film table
CREATE TABLE IF NOT EXISTS film (
    film_id SERIAL PRIMARY KEY,
    title TEXT,
    year INTEGER,
    genre TEXT,
    score INTEGER
);

--Create the director table
CREATE TABLE IF NOT EXISTS director (
    director_id SERIAL PRIMARY KEY,
    name TEXT,
    country TEXT

);

--Create the writer table
CREATE TABLE IF NOT EXISTS writer (
    writer_id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT

);

--Create the star table
CREATE TABLE IF NOT EXISTS star (
    star_id SERIAL PRIMARY KEY,
    name TEXT,
    dob TEXT

);

--Insert the values for the film table
INSERT INTO film
(title,year,genre,score)
VALUES
	('2001: A Space Odyssey',1968,'ScienceFiction',10),
	('Star Wars:A NewHope',1977,'ScienceFiction',7),
	('To Kill A Mockingbird',1962,'Drama',10),
	('Titanic',1997,'Romance',5),
	('Dr Zhivago',1965,'Historical',8),
	('El Cid',1961,'Historical',6),
	('Voyage to Cythera',1984,'Drama',8),
	('Soldier of Orange',1977,'Thriller',8)
	('ThreeColours:Blue',1993,'Drama',8),
	('Cyrano de Bergerac',1990,'Historical',9);

--Insert the values for the director table
INSERT INTO director (director,country)
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

--Insert the values for the writer table
INSERT INTO writer (writer, email)
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

--Insert the values star table
INSERT INTO star(star dob)
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
    ('Gerard Depardieu', '27/12/1948');


SELECT*FROM writer;

---------------------
--
--core query exercises
--
---------------------

--1:
SELECT title, director
FROM film
  JOIN director
    ON film_id = director_id;

--2:
SELECT fi.title, dir.director, str.star
FROM film AS fi
LEFT JOIN director as dir on fi.film_id = dir.director_id
LEFT JOIN star as str on dir.director_id = str.star_id;

--3:
SELECT fi.title
FROM film AS fi
LEFT JOIN director as dir on fi.film_id = dir.director_id
WHERE dir.country ='USA';

--4:
SELECT fi.title
FROM film AS fi
LEFT JOIN director as dir on fi.film_id = dir.director_id
LEFT JOIN writer as wri on fi.film_id = wri.writer_id
WHERE wri.writer = dir.director;

--5:
SELECT dir.director, fi.title
FROM film AS fi
LEFT JOIN director as dir on fi.film_id = dir.director_id
WHERE fi.score >= 8;

--6:
--EXTRA QUERY FOR 6TH QUERIES ASSIGNMENT OF CORE

--EXTRA QUERY 1:
SELECT
director.director AS directorName, film.title

FROM film
LEFT JOIN director  on film.film_id = director.director_id
	WHERE
	director.director = 'Stanley Kubrick';

--EXTRA QUERY 2:
SELECT
    film_id,
    film.title,
    director.director,
    director.country,
    star.star,
    star.dob,
    writer.writer,
    writer.email,
    film.year,
    film.genre,
    film.score
FROM
    film
JOIN
    director ON film_id = director_id
JOIN
    star ON film_id = star_id
JOIN
    writer ON film_id = writer_id;

--EXTRA QUERY 3:
SELECT
    film_id,
    film.title,
    star.star,
    writer.writer,
	film.year,
	film.score
FROM
    film
JOIN
    star ON film_id = star_id
JOIN
    writer ON film_id = writer_id
	WHERE
		film.year <2000;

--EXTRA QUERY 4:
SELECT
    film_id,
    film.title,
    director.director,
    star.star,
    writer.writer,
    film.year
FROM
    film
JOIN
    director ON film_id = director_id
JOIN
    star ON film_id = star_id
JOIN
    writer ON film_id = writer_id
    ORDER BY
    	star.star ASC;


--EXTRA QUERY 5:
SELECT
    film_id,
    film.title,
    director.country,
    star.star,
    star.dob,
    writer.writer,
    film.year
FROM
    film
JOIN
    director ON film_id = director_id
JOIN
    star ON film_id = star_id
JOIN
    writer ON film_id = writer_id
    WHERE
    	director.country != 'USA'
    AND
    	film.year >= 1965
	ORDER BY
		film.title DESC
    ;




