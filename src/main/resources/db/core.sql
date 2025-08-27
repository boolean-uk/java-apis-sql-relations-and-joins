

-- Create tables
CREATE TABLE directors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    country VARCHAR(64) NOT NULL
);

CREATE TABLE stars (
    id SERIAL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    dob DATE NOT NULL
);

CREATE TABLE writers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    email VARCHAR(64) NOT NULL
);

CREATE TABLE films (
    id SERIAL PRIMARY KEY,
    title VARCHAR(64) NOT NULL,
    director_id INT REFERENCES directors(id),
    star_id INT REFERENCES stars(id),
    writer_id INT REFERENCES writers(id),
    year INT NOT NULL,
    genre VARCHAR(64) NOT NULL,
    score INT CHECK (score >= 1 AND score <= 10)
);

-- Insert data into tables
INSERT INTO directors (name, country) VALUES
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

INSERT INTO stars (name, dob) VALUES
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

INSERT INTO writers (name, email) VALUES
('Arthur C Clarke', 'aurthut@clarke.com'),
('George Lucas', 'george@email.com'),
('Harper Lee', 'harper@lee.com'),
('James Cameron', 'james@cameron.com'),
('Boris Pasternak', 'boris@boris.com'),
('Frederick Frank', 'fred@frank.com'),
('Theodoros Angelopoulos', 'theo@angelopoulos'),
('Erik Hazelhoff Roelfzema', 'erik@roelfzema.com'),
('Krzysztof Kieslowski', 'email@email.com'),
('Edmond Rostand', 'edmund@rostand.com');

INSERT INTO films (title, director_id, star_id, writer_id, year, genre, score) VALUES
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
SELECT f.title, d.name AS director
FROM films f
JOIN directors d ON f.director_id = d.id;

-- Show the title, director and star name for all films
SELECT f.title, d.name AS director, s.name AS star
FROM films f
JOIN directors d ON f.director_id = d.id
JOIN stars s ON f.star_id = s.id;

-- Show the title of films where the director is from the USA
SELECT f.title
FROM films f
JOIN directors d ON f.director_id = d.id
WHERE d.country = 'USA';

-- Show only those films where the writer and the director are the same person
SELECT f.title, d.name AS director, w.name AS writer
FROM films f
JOIN directors d ON f.director_id = d.id
JOIN writers w ON f.writer_id = w.id
WHERE d.name = w.name;

-- Show directors and film titles for films with a score of 8 or higher
SELECT f.title, d.name AS director, f.score
FROM films f
JOIN directors d ON f.director_id = d.id
WHERE f.score >= 8;

-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.
-- Show the title and star name for films released after 1990
SELECT f.title, s.name AS star
FROM films f
JOIN stars s ON f.star_id = s.id
WHERE f.year > 1990;

-- Show the title and writer email for films in a specific genre
SELECT f.title, w.email AS writer_email
FROM films f
JOIN writers w ON f.writer_id = w.id
WHERE f.genre = 'Historical';

-- Use of inner join to show all films with their directors, stars, and writers (inner doesnt change anything because all tables match)
SELECT f.title, d.name AS director, s.name AS star, w.name AS writer
FROM films f
INNER JOIN directors d ON f.director_id = d.id
INNER JOIN stars s ON f.star_id = s.id
INNER JOIN writers w ON f.writer_id = w.id;

-- Show the average score of films by genre
SELECT f.genre, AVG(f.score) AS average_score
FROM films f
GROUP BY f.genre;

-- Use of left join to show all directors and their films (left doesnt change anything because all films have a director from directors table)
SELECT d.name AS director, f.title AS film
FROM directors d
LEFT JOIN films f ON d.id = f.director_id;
