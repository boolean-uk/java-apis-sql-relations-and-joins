
--Core
--
-- CREATE tables
--

CREATE TABLE directors (
    id SERIAL PRIMARY KEY,
    directorName VARCHAR(255),
    country VARCHAR(255)
);

CREATE TABLE stars (
    id SERIAL PRIMARY KEY,
    starName VARCHAR(255),
    birthYear DATE
);

CREATE TABLE writers (
    id SERIAL PRIMARY KEY,
    writerName VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE films (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    directorID INT,
    starID INT,
    writerID INT,
    releaseYear INT,
    genre VARCHAR(255),
    score INT,
    FOREIGN KEY (directorID) REFERENCES directors(id),
    FOREIGN KEY (starID) REFERENCES stars(id),
    FOREIGN KEY (writerID) REFERENCES writers(id)
);

--
-- POPULATE TABLES
--

-- Directors
INSERT INTO directors (id, directorName, country) VALUES
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

-- Stars
INSERT INTO stars (id, starName, birthYear) VALUES
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

-- Writers
INSERT INTO writers (id, writerName, email) VALUES
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

INSERT INTO films (id, title, directorID, starID, writerID, releaseYear, genre, score) VALUES
(1, '2001: A Space Odyssey', 1, 1, 1, 1968, 'Science Fiction', 10),
(2, 'Star Wars: A New Hope', 2, 2, 2, 1977, 'Science Fiction', 7),
(3, 'To Kill A Mockingbird', 3, 3, 3, 1962, 'Drama', 10),
(4, 'Titanic', 4, 4, 4, 1997, 'Romance', 5),
(5, 'Dr Zhivago', 5, 5, 5, 1965, 'Historical', 8),
(6, 'El Cid', 6, 6, 6, 1961, 'Historical', 6),
(7, 'Voyage to Cythera', 7, 7, 7, 1984, 'Drama', 8),
(8, 'Soldier of Orange', 8, 8, 8, 1977, 'Thriller', 8),
(9, 'Three Colours: Blue', 9, 9, 9, 1993, 'Drama', 8),
(10, 'Cyrano de Bergerac', 10, 10, 10, 1990, 'Historical', 9);

--
-- QUERIES
--

--Show the title and director name for all films
SELECT f.title, d.directorName
FROM films as f, directors as d
where f.directorid = d.id;

--Show the title, director and star name for all films
SELECT f.title, d.directorName, s.starName
FROM films as f, directors as d, stars as s
where f.directorid = d.id and f.starid = s.id;

--Show the title of films where the director is from the USA
SELECT f.title
FROM films f
JOIN directors d ON f.directorID = d.id
WHERE d.country LiKE '%USA%';

--Show only those films where the writer and the director are the same person
SELECT f.title
FROM films f
WHERE f.directorID = f.writerID;

--Show directors and film titles for films with a score of 8 or higher
SELECT d.directorName, f.title
FROM films f
JOIN directors d ON f.directorID = d.id
WHERE f.score >= 8;


--Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.
-- show name of stars and films they are in
SELECT s.name AS star_name, f.title AS film_title
FROM film f
JOIN star s ON f.starID = s.starID;

-- list films with writer info
SELECT f.title AS film_title, w.name AS writer_name, w.email
FROM film f
JOIN writer w ON f.writerID = w.writerID;

-- count how many films from (director) country
SELECT d.country, COUNT(f.id) AS filmCount
FROM films f
JOIN directors d ON f.directorID = d.id;
GROUP BY d.country;

-- list all genres an num films in each
SELECT genre, COUNT(*)
FROM films
GROUP BY genre;
