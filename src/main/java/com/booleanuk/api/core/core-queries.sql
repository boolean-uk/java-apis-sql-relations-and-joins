CREATE TABLE directors (
    director_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    country VARCHAR(255)
);

CREATE TABLE stars (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    dob DATE
);

CREATE TABLE writers (
    writer_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE films (
    film_id SERIAL PRIMARY KEY,
    title TEXT,
    director_id INTEGER REFERENCES directors(director_id),
    star_id INTEGER REFERENCES stars(star_id),
    writer_id INTEGER REFERENCES writers(writer_id),
    year INTEGER,
    genre TEXT,
    score INTEGER
);



INSERT INTO directors (name, country)
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


INSERT INTO stars (name, dob)
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


INSERT INTO writers(name, email)
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


INSERT INTO films (title, director_id, star_id, writer_id, year, genre, score)
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


-- Show the title and director name for all films
SELECT films.title, directors.name AS director_name
FROM films
INNER JOIN directors ON films.director_id = directors.director_id;

-- Show the title, director, and star name for all films
SELECT films.title, directors.name AS director_name, stars.name AS star_name
FROM films
INNER JOIN directors ON films.director_id = directors.director_id
INNER JOIN stars ON films.star_id = stars.star_id;

-- Show the title of films where the director is from the USA
SELECT films.title
FROM films
INNER JOIN directors ON films.director_id = directors.director_id
WHERE directors.country = 'USA';

-- Show only those films where the writer and the director are the same person
SELECT films.title
FROM films
INNER JOIN directors ON films.director_id = directors.director_id
INNER JOIN writers ON films.writer_id = writers.writer_id
WHERE directors.name = writers.name;

-- Show directors and film titles for films with a score of 8 or higher
SELECT directors.name AS director_name, films.title
FROM films
INNER JOIN directors ON films.director_id = directors.director_id
WHERE films.score >= 8;


-- Additional queries to demonstrate joins and relationships:

-- 1. Show the title, writer name, and genre for all films
SELECT films.title, writers.name AS writer_name, films.genre
FROM films
INNER JOIN writers ON films.writer_id = writers.writer_id;

-- 2. Show the star names and their dates of birth for films with a score of 7 or lower
SELECT stars.name AS star_name, stars.dob
FROM films
INNER JOIN stars ON films.star_id = stars.star_id
WHERE films.score <= 7;

-- 3. Show the director names and the number of films they have directed
SELECT directors.name AS director_name, COUNT(films.film_id) AS film_count
FROM directors
LEFT JOIN films ON directors.director_id = films.director_id
GROUP BY directors.name;

-- 4. Show the writer names and the titles of films they have written
SELECT writers.name AS writer_name, films.title
FROM writers
INNER JOIN films ON writers.writer_id = films.writer_id;

-- 5. Show the genre and the average score for each genre
SELECT films.genre, ROUND(AVG(films.score)::numeric, 2) AS average_score
FROM films
GROUP BY films.genre;