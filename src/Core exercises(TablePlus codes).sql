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

ALTER TABLE star
RENAME COLUMN name TO star;


--Create the film table
CREATE TABLE IF NOT EXISTS film (
    film_id SERIAL PRIMARY KEY,
    title TEXT,
    year INTEGER,
    genre TEXT,
    score INTEGER,
    director_id INTEGER,
    writer_id INTEGER,
    star_id INTEGER,
    CONSTRAINT fk_director_id
    	FOREIGN KEY (director_id)
    		REFERENCES director(director_id),
    CONSTRAINT fk_writer_id
    	FOREIGN KEY (writer_id)
    		REFERENCES writer(writer_id),
    CONSTRAINT fk_star_id
    	FOREIGN KEY (star_id)
    		REFERENCES star(star_id)
);




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
INSERT INTO star(star, dob)
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

--Insert the values for the film table
INSERT INTO film
(title, year, genre, score ,director_id, writer_id, star_id)
VALUES
	('2001: A Space Odyssey',1968,'ScienceFiction',10,1,1,1),
	('Star Wars:A NewHope',1977,'ScienceFiction',7,2,2,2),
	('To Kill A Mockingbird',1962,'Drama',10,3,3,3),
	('Titanic',1997,'Romance',5,4,4,4),
	('Dr Zhivago',1965,'Historical',8,5,5,5),
	('El Cid',1961,'Historical',6,6,6,6),
	('Voyage to Cythera',1984,'Drama',8,7,7,7),
	('Soldier of Orange',1977,'Thriller',8,8,8,8),
	('ThreeColours:Blue',1993,'Drama',8,9,9,9),
	('Cyrano de Bergerac',1990,'Historical',9,10,10,10);


SELECT*FROM writer;

---------------------
--
--core query exercises
--
---------------------

--1:
SELECT f.title, d.director
FROM film AS f
  JOIN director AS d
    ON f.director_id = d.director_id;

--2:
SELECT f.title, dir.director, str.star
FROM film AS f
LEFT JOIN director as dir on f.director_id = dir.director_id
LEFT JOIN star as str on f.star_id = str.star_id;

--3:
SELECT fi.title
FROM film AS fi
LEFT JOIN director as dir on fi.director_id = dir.director_id
WHERE dir.country ='USA';

--4:
SELECT fi.title
FROM film AS fi
LEFT JOIN director as dir on fi.director_id = dir.director_id
LEFT JOIN writer as wri on fi.writer_id = wri.writer_id
WHERE wri.writer = dir.director;

--5:
SELECT dir.director, fi.title
FROM film AS fi
LEFT JOIN director as dir on fi.director_id = dir.director_id
WHERE fi.score >= 8;

--6:
--EXTRA QUERY FOR 6TH QUERIES ASSIGNMENT OF CORE

--EXTRA QUERY 1:
SELECT
director.director AS directorName, film.title
FROM film
LEFT JOIN director  on film.director_id = director.director_id
	WHERE
	director.director = 'Stanley Kubrick';

--EXTRA QUERY 2:
SELECT
    f.film_id AS "Id",
    f.title AS "Title",
    d.director AS "Director",
    d.country AS "Director Country",
    s.star AS "Star DOB",
    s.dob AS "Star DOB",
    w.writer AS "Writer",
    w.email AS "Writer Email",
    f.year AS "Year",
    f.genre AS "Genre",
    f.score AS "Score"
FROM
    film AS f
JOIN
director AS d ON f.director_id = d.director_id
JOIN
writer AS w ON f.writer_id = w.writer_id
JOIN
star AS s ON f.star_id = s.star_id;



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
    star ON film.star_id = star.star_id
JOIN
    writer ON writer.writer_id= film.writer_id
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
    director ON film.director_id = director.director_id
JOIN
    star ON star.star_id= film.star_id
JOIN
    writer ON film.writer_id = writer.writer_id
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
    director ON film.director_id = director.director_id
JOIN
    star ON star.star_id = film.star_id
JOIN
    writer ON writer.writer_id = film.writer_id
    WHERE
    	director.country != 'USA'
    AND
    	film.year >= 1965
	ORDER BY
		film.title DESC
    ;
