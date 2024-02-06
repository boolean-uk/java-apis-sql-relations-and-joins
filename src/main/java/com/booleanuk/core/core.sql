CREATE TABLE IF NOT EXISTS films (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    director_id INT,
    star_id INT,
    writer_id INT,
    release_year INT NOT NULL,
    genre TEXT NOT NULL,
    score INT NOT NULL
);

CREATE TABLE IF NOT EXISTS directors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    country TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS stars (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    date_of_birth DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS writers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL
);

INSERT INTO directors
(name, country)
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

INSERT INTO stars
(name, date_of_birth)
VALUES
('Keir Dullea', '1936-05-30'),
('Mark Hamill', '1951-09-25'),
('Gregory Peck', '1916-04-05'),
('Leonardo DiCaprio', '1974-11-11'),
('Julie Christie', '1940-04-14'),
('Charlton Heston', '1923-10-04'),
('Manos Katrakis', '1908-08-14'),
('Rutger Hauer', '1944-01-23'),
('Juliette Binoche', '1964-03-09'),
('Gerard Depardieu', '1948-12-27');

INSERT INTO writers
(name, email)
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

INSERT INTO films
(title, director_id, star_id, writer_id, release_year, genre, score)
VALUES
('2001: A Space Odyssey', 1, 1, 1, 1968, 'SciFi', 8),
('Star Wars', 2, 2, 2, 1977, 'SciFi', 9),
('To Kill a Mockingbird', 3, 3, 3, 1962, 'Drama', 8),
('Titanic', 4, 4, 4, 1997, 'Drama', 7),
('Doctor Zhivago', 5, 5, 5, 1965, 'Drama', 8),
('El Cid', 6, 6, 6, 1961, 'Drama', 7),
('Eternity and a Day', 7, 7, 7, 1998, 'Drama', 6),
('RoboCop', 8, 8, 8, 1987, 'SciFi', 7),
('Three Colors: Blue', 9, 9, 9, 1993, 'Drama', 8),
('Cyrano de Bergerac', 10, 10, 10, 1990, 'Drama', 7);


SELECT films.title, directors.name
FROM films
JOIN directors ON films.director_id = directors.id;

SELECT films.title, directors.name, stars.name
FROM films
JOIN directors ON films.director_id = directors.id
JOIN stars ON films.star_id = stars.id;

SELECT films.title
FROM films
JOIN directors ON films.director_id = directors.id
WHERE directors.country = 'USA';

SELECT films.title
FROM films
JOIN directors ON films.director_id = directors.id
JOIN writers ON films.writer_id = writers.id
WHERE writers.name = directors.name;

SELECT films.title, directors.name
FROM films
JOIN directors ON films.director_id = directors.id
WHERE score >= 8;

SELECT films.title, directors.name, stars.name, writers.name
FROM films
JOIN directors ON films.director_id = directors.id
JOIN stars ON films.star_id = stars.id
JOIN writers ON films.writer_id = writers.id
WHERE directors.name = writers.name;

SELECT films.title, directors.name, stars.name, writers.name
FROM films
JOIN directors ON films.director_id = directors.id
JOIN stars ON films.star_id = stars.id
JOIN writers ON films.writer_id = writers.id
WHERE directors.name = writers.name AND films.score >= 8;

SELECT films.title, directors.name, stars.name, writers.name
FROM films
JOIN directors ON films.director_id = directors.id
JOIN stars ON films.star_id = stars.id
JOIN writers ON films.writer_id = writers.id
WHERE directors.name = writers.name AND films.score >= 8 AND directors.country = 'USA';

SELECT directors.name, COUNT(films.director_id) AS movies
FROM directors
LEFT JOIN films ON directors.id = films.director_id
GROUP BY directors.name;

SELECT genre, AVG(score)
FROM films
GROUP BY genre;

SELECT films.title, directors.name, films.score
FROM films
JOIN directors ON films.director_id = directors.id
ORDER BY films.score DESC;