DROP TABLE IF EXISTS persons CASCADE;
DROP TABLE IF EXISTS directors CASCADE;
DROP TABLE IF EXISTS stars CASCADE;
DROP TABLE IF EXISTS writers CASCADE;
DROP TABLE IF EXISTS films CASCADE;


CREATE TABLE IF NOT EXISTS persons(
    person_id SERIAL PRIMARY KEY,
    person_name VARCHAR(50) NOT NULL,
    person_email VARCHAR(50),
    person_country VARCHAR(30),
    person_dob DATE
);

CREATE TABLE IF NOT EXISTS directors(
    director_id SERIAL PRIMARY KEY,
    person_id INTEGER,
    CONSTRAINT fk_person_id
        FOREIGN KEY (person_id)
            REFERENCES persons(person_id)
);


CREATE TABLE IF NOT EXISTS stars(
    star_id SERIAL PRIMARY KEY,
    person_id INTEGER,
    CONSTRAINT fk_person_id
        FOREIGN KEY (person_id)
            REFERENCES persons(person_id)
);

CREATE TABLE IF NOT EXISTS writers(
    writer_id SERIAL PRIMARY KEY,
    person_id INTEGER,
    CONSTRAINT fk_person_id
        FOREIGN KEY (person_id)
            REFERENCES persons(person_id)
);


CREATE TABLE IF NOT EXISTS films(
    film_id serial PRIMARY KEY,
    film_name VARCHAR(255) NOT NULL UNIQUE,
    film_genre VARCHAR(50) NOT NULL,
    film_release_year INT NOT NULL CHECK (1800 <= film_release_year AND film_release_year <= 9999),
    film_score INT NOT NULL CHECK (0 <= film_score AND film_score <= 10),
    director_id INTEGER,
    star_id INTEGER,
    writer_id INTEGER,
    CONSTRAINT fk_director_id
        FOREIGN KEY (director_id)
            REFERENCES directors(director_id),
    CONSTRAINT fk_star_id
        FOREIGN KEY (star_id)
            REFERENCES stars(star_id),
    CONSTRAINT fk_writer_id
        FOREIGN KEY (writer_id)
            REFERENCES writers(writer_id)
);


INSERT INTO persons (person_name, person_email, person_country, person_dob) VALUES
('Stanley Kubrick', NULL, 'USA', NULL),
('George Lucas', 'george@email.com', 'USA', NULL),
('Robert Mulligan', NULL, 'USA', NULL),
('James Cameron', 'james@cameron.com', 'Canada', NULL),
('David Lean', NULL, 'UK', NULL),
('Anthony Mann', NULL, 'USA', NULL),
('Theodoros Angelopoulos', 'theo@angelopoulos.com', 'Greece', NULL),
('Paul Verhoeven', NULL, 'Netherlands', NULL),
('Krzysztof Kieslowski', 'email@email.com', 'Poland', NULL),
('Jean-Paul Rappeneau', NULL, 'France', NULL),

('Keir Dullea', NULL, NULL, '1936-05-30'),
('Mark Hamill', NULL, NULL, '1951-09-25'),
('Gregory Peck', NULL, NULL, '1916-04-05'),
('Leonardo DiCaprio', NULL, NULL, '1974-11-11'),
('Julie Christie', NULL, NULL, '1940-04-14'),
('Charlton Heston', NULL, NULL, '1923-10-04'),
('Manos Katrakis', NULL, NULL, '1908-08-14'),
('Rutger Hauer', NULL, NULL, '1944-01-23'),
('Juliette Binoche', NULL, NULL, '1964-03-09'),
('Gerard Depardieu', NULL, NULL, '1948-12-27'),

('Arthur C Clarke', 'arthur@clarke.com', NULL, NULL),
('Harper Lee', 'harper@lee.com', NULL, NULL),
('Boris Pasternak', 'boris@boris.com', NULL, NULL),
('Frederick Frank', 'fred@frank.com', NULL, NULL),
('Erik Hazelhoff Roelfzema', 'erik@roelfzema.com', NULL, NULL),
('Edmond Rostand', 'edmond@rostand.com', NULL, NULL);


INSERT INTO directors (person_id) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

INSERT INTO stars (person_id) VALUES
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20);

INSERT INTO writers (person_id) VALUES
(21),
(2),
(22),
(4),
(23),
(24),
(7),
(25),
(9),
(26);



INSERT INTO films (film_name, film_genre, film_release_year, film_score, director_id, star_id, writer_id) VALUES
('2001: A Space Odyssey', 'Science Fiction', 1968, 10,
(SELECT director_id FROM directors JOIN persons ON directors.person_id = persons.person_id WHERE persons.person_name = 'Stanley Kubrick'),
(SELECT star_id FROM stars JOIN persons ON stars.person_id = persons.person_id WHERE person_name = 'Keir Dullea'),
(SELECT writer_id FROM writers Join persons ON writers.person_id = persons.person_id WHERE person_name = 'Arthur C Clarke')),

('Star Wars: A New Hope', 'Science Fiction', 1977, 7,
    (SELECT director_id FROM directors JOIN persons ON directors.person_id = persons.person_id WHERE persons.person_name = 'George Lucas'),
    (SELECT star_id FROM stars JOIN persons ON stars.person_id = persons.person_id WHERE person_name = 'Mark Hamill'),
    (SELECT writer_id FROM writers Join persons ON writers.person_id = persons.person_id WHERE person_name = 'George Lucas')),

('To Kill A Mockingbird', 'Drama', 1962, 10,
    (SELECT director_id FROM directors JOIN persons ON directors.person_id = persons.person_id WHERE persons.person_name = 'Robert Mulligan'),
    (SELECT star_id FROM stars JOIN persons ON stars.person_id = persons.person_id WHERE person_name = 'Gregory Peck'),
    (SELECT writer_id FROM writers Join persons ON writers.person_id = persons.person_id WHERE person_name = 'Harper Lee')),

('Titanic', 'Romance', 1997, 5,
    (SELECT director_id FROM directors JOIN persons ON directors.person_id = persons.person_id WHERE persons.person_name = 'James Cameron'),
    (SELECT star_id FROM stars JOIN persons ON stars.person_id = persons.person_id WHERE person_name = 'Leonardo DiCaprio'),
    (SELECT writer_id FROM writers Join persons ON writers.person_id = persons.person_id WHERE person_name = 'James Cameron')),

('Dr Zhivago', 'Historical', 1965, 8,
    (SELECT director_id FROM directors JOIN persons ON directors.person_id = persons.person_id WHERE persons.person_name = 'David Lean'),
    (SELECT star_id FROM stars JOIN persons ON stars.person_id = persons.person_id WHERE person_name = 'Julie Christie'),
    (SELECT writer_id FROM writers Join persons ON writers.person_id = persons.person_id WHERE person_name = 'Boris Pasternak')),

('El Cid', 'Historical', 1961, 6,
    (SELECT director_id FROM directors JOIN persons ON directors.person_id = persons.person_id WHERE persons.person_name = 'Anthony Mann'),
    (SELECT star_id FROM stars JOIN persons ON stars.person_id = persons.person_id WHERE person_name = 'Charlton Heston'),
    (SELECT writer_id FROM writers Join persons ON writers.person_id = persons.person_id WHERE person_name = 'Frederick Frank')),

('Voyage to Cythera', 'Drama', 1984, 8,
    (SELECT director_id FROM directors JOIN persons ON directors.person_id = persons.person_id WHERE persons.person_name = 'Theodoros Angelopoulos'),
    (SELECT star_id FROM stars JOIN persons ON stars.person_id = persons.person_id WHERE person_name = 'Manos Katrakis'),
    (SELECT writer_id FROM writers Join persons ON writers.person_id = persons.person_id WHERE person_name = 'Theodoros Angelopoulos')),

('Soldier of Orange', 'Thriller', 1977, 8,
    (SELECT director_id FROM directors JOIN persons ON directors.person_id = persons.person_id WHERE persons.person_name = 'Paul Verhoeven'),
    (SELECT star_id FROM stars JOIN persons ON stars.person_id = persons.person_id WHERE person_name = 'Rutger Hauer'),
    (SELECT writer_id FROM writers Join persons ON writers.person_id = persons.person_id WHERE person_name = 'Erik Hazelhoff Roelfzema')),

('Three Colours: Blue', 'Drama', 1993, 8,
    (SELECT director_id FROM directors JOIN persons ON directors.person_id = persons.person_id WHERE persons.person_name = 'Krzysztof Kieslowski'),
    (SELECT star_id FROM stars JOIN persons ON stars.person_id = persons.person_id WHERE person_name = 'Juliette Binoche'),
    (SELECT writer_id FROM writers Join persons ON writers.person_id = persons.person_id WHERE person_name = 'Krzysztof Kieslowski')),

('Cyrano de Bergerac', 'Historical', 1990, 9,
    (SELECT director_id FROM directors JOIN persons ON directors.person_id = persons.person_id WHERE persons.person_name = 'Jean-Paul Rappeneau'),
    (SELECT star_id FROM stars JOIN persons ON stars.person_id = persons.person_id WHERE person_name = 'Gerard Depardieu'),
    (SELECT writer_id FROM writers Join persons ON writers.person_id = persons.person_id WHERE person_name = 'Edmond Rostand'));

-- Select statements from core --
-- Show the title and director name for all films --
SELECT films.film_name, persons.person_name
    FROM films
        JOIN directors ON directors.director_id = films.director_id
        JOIN persons ON persons.person_id = directors.person_id;

-- Show the title, director and star name for all films --
SELECT films.film_name, director.person_name AS director, star.person_name AS star
    FROM films
        JOIN directors ON directors.director_id = films.director_id
        JOIN persons AS director ON  directors.person_id = director.person_id
        JOIN stars ON stars.star_id = films.star_id
        JOIN persons AS star ON stars.person_id = star.person_id;

-- Show the title of films where the director is from the USA --
SELECT film_name
    FROM films
        JOIN directors ON films.director_id = directors.director_id
        JOIN persons ON directors.person_id = persons.person_id
            WHERE persons.person_country='USA';

-- Show only those films where the writer and the director are the same person --
SELECT film_name
    FROM films
        JOIN directors ON films.director_id = directors.director_id
        JOIN persons AS director ON directors.person_id = director.person_id
        JOIN writers ON films.writer_id = writers.writer_id
        JOIN persons AS writer ON writers.person_id = writer.person_id
        WHERE director.person_name = writer.person_name;

-- Show directors and film titles for films with a score of 8 or higher --
SELECT persons.person_name, films.film_name
    FROM films
        JOIN directors ON directors.director_id = films.director_id
        JOIN persons ON persons.person_id = directors.person_id
            WHERE films.film_score >= 8;

-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables. --
-- Get film with director, star and writer for all films in the drama genre
SELECT films.film_name, director.person_name AS director, star.person_name AS star, writer.person_name AS writer
    FROM films
        JOIN directors ON directors.director_id = films.director_id
        JOIN persons AS director ON  directors.person_id = director.person_id
        JOIN stars ON stars.star_id = films.star_id
        JOIN persons AS star ON stars.person_id = star.person_id
        JOIN writers ON writers.writer_id = films.writer_id
        JOIN persons AS writer ON writers.person_id = writer.person_id
            WHERE films.film_genre = 'Drama';

-- Get number of movies each director has directed which scored above 9.
SELECT persons.person_name, COUNT(films.film_id)
    FROM directors
        JOIN films ON films.director_id = directors.director_id
        JOIN persons on persons.person_id = directors.person_id
            WHERE films.film_score > 8
                GROUP BY persons.person_name;

-- Get all movies directed by an american in the drama genre
SELECT persons.person_name, films.film_name
    FROM films
        JOIN directors ON films.director_id = directors.director_id
        JOIN persons ON directors.person_id = persons.person_id
            WHERE persons.person_country = 'USA' AND films.film_genre = 'Drama';

--  Get number of movies each star has starred in which scored below 9
SELECT persons.person_name, COUNT(films.film_id)
    FROM films
        JOIN stars ON stars.star_id = films.star_id
        JOIN persons ON stars.person_id = persons.person_id
            WHERE films.film_score < 9
                GROUP BY persons.person_name;

-- Get number of movies each star has starred in based on the catalog and sort it based on name.
SELECT persons.person_name, COUNT(films.film_id)
    FROM persons
        JOIN stars ON stars.person_id = persons.person_id
        JOIN films ON films.star_id = stars.star_id
            GROUP BY persons.person_name
                ORDER BY persons.person_name ASC;