DROP TABLE film, director, star, writer;

CREATE TABLE IF NOT EXISTS director (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE,
    country TEXT
);

CREATE TABLE IF NOT EXISTS star (
    id SERIAL PRIMARY KEY,
    name TEXT,
    birth DATE
);

CREATE TABLE IF NOT EXISTS writer (
    id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT
);

CREATE TABLE IF NOT EXISTS film (
    id SERIAL PRIMARY KEY,
    title TEXT,
    release_year INTEGER,
    genre TEXT,
    score INTEGER,
  	director_id INTEGER,
  	star_id INTEGER,
  	writer_id INTEGER,
    CONSTRAINT fk_director
  		FOREIGN KEY (director_id)
  			REFERENCES director(id),
  	CONSTRAINT fk_star
  		FOREIGN KEY (star_id)
  			REFERENCES star(id),
  	CONSTRAINT fk_writer
  		FOREIGN KEY(writer_id)
  			REFERENCES writer(id)
);


INSERT INTO director (id, name, country)
VALUES
(1, 'Stanley Kubrick', 'USA'),
(2, 'George Lucas', 'USA'),
(3, 'Robert Mulligan', 'USA'),
(4, 'James Cameron', 'Canada'),
(5, 'David Lean', 'UK'),
(6, 'Anthony Mann', 'USA'),
(7, 'Theodoros Angelopoulos', 'Greece'),
(8, 'Paul Verhoeven', 'Netherlands'),
(9, 'Krzysztof Kieslowski', 'Poland'),
(10, 'Jean-Paul Rappeneau', 'France');

INSERT INTO star (id, name, birth)
VALUES
(1, 'Keir Dullea', '1936-05-30'),
(2, 'Mark Hamill', '1951-09-25'),
(3, 'Gregory Peck', '1916-04-05'),
(4, 'Leonardo DiCaprio', '1974-11-11'),
(5, 'Julie Christie', '1940-04-14'),
(6, 'Charlton Heston', '1923-10-04'),
(7, 'Manos Katrakis', '1908-08-14'),
(8, 'Rutger Hauer', '1944-01-23'),
(9, 'Juliette Binoche', '1964-03-09'),
(10, 'Gerard Depardieu', '1948-12-27');

INSERT INTO writer (id, name, email)
VALUES
(1, 'Arthur C Clarke', 'arthur@clarke.com'),
(2, 'George Lucas', 'george@email.com'),
(3, 'Harper Lee', 'harper@lee.com'),
(4, 'James Cameron', 'james@cameron.com'),
(5, 'Boris Pasternak', 'boris@boris.com'),
(6, 'Frederick Frank', 'fred@frank.com'),
(7, 'Theodoros Angelopoulos', 'theo@angelopoulos.com'),
(8, 'Erik Hazelhoff Roelfzema', 'erik@roelfzema.com'),
(9, 'Krzysztof Kieslowski', 'email@email.com'),
(10, 'Edmond Rostand', 'edmond@rostand.com');

INSERT INTO film (id, title, release_year, genre, score, director_id, star_id, writer_id)
VALUES
(1, '2001: A Space Odyssey', 1968, 'Science Fiction', 10, 1, 1, 1),
(2, 'Star Wars: A New Hope', 1977, 'Science Fiction', 7, 2, 2, 2),
(3, 'To Kill A Mockingbird', 1962, 'Drama', 10, 3, 3, 3),
(4, 'Titanic', 1997, 'Romance', 5, 4, 4, 4),
(5, 'Dr Zhivago', 1965, 'Historical', 8, 5, 5, 5),
(6, 'El Cid', 1961, 'Historical', 6, 6, 6, 6),
(7, 'Voyage to Cythera', 1984, 'Drama', 8, 7, 7, 7),
(8, 'Soldier of Orange', 1977, 'Thriller', 8, 8, 8, 8),
(9, 'Three Colours: Blue', 1993, 'Drama', 8, 9, 9, 9),
(10, 'Cyrano de Bergerac', 1990, 'Historical', 9, 10, 10, 10);


-- Start of exercise queries
-- Show the title and director name for all films
SELECT film.title, director.name AS director_name
FROM film
JOIN director ON film.director_id = director.id;

--Show the title, director and star name for all films
SELECT film.title, director.name AS director_name, star.name AS star_name
FROM film
JOIN director ON film.director_id = director.id
JOIN star on film.star_id = star.id;

--Show the title of films where the director is from the USA
SELECT film.title
FROM film
JOIN director on film.director_id = director.id;

--Show only those films where the writer and the director are the same person
SELECT film.title
FROM film
JOIN director on film.director_id = director.id
JOIN writer on film.writer_id = writer.id
WHERE director.name = writer.name;

--Show directors and film titles for films with a score of 8 or higher
SELECT director.name, film.title
FROM film
JOIN director on film.director_id = director.id
WHERE film.score >= 8;

--Show title, genre and stars birthdate
SELECT film.title, film.genre, star.name AS star_name, star.birth AS star_birthdate
FROM film
JOIN star ON film.star_id = star.id;

--Find all films by a specific writer
SELECT film.title, writer.name
FROM film
JOIN writer ON film.writer_id = writer.id
WHERE writer.name = 'George Lucas';


--Find all directors that have made more than one movie
SELECT director.name, COUNT(film.id)
FROM film
JOIN director ON film.director_id = director.id
GROUP BY director.name
HAVING COUNT(film.id) > 1;

--show title, genre and directors country of origin
SELECT film.title, film.genre, director.name AS director_name, director.country AS director_country
FROM film
JOIN director ON film.director_id = director.id;

--Show director name, film count, and average score for all directors
SELECT director.name AS director_name, COUNT(film.id) AS film_count, AVG(film.score) AS average_score
FROM director
JOIN film ON director.id = film.director_id
GROUP BY director.name;