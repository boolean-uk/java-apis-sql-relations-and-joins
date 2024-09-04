CREATE TABLE IF NOT EXISTS Film (
    id SERIAL PRIMARY KEY,
    title TEXT,
    release_year INTEGER,
    genre TEXT,
    score INTEGER
);

-- Extension Task 1.1
CREATE TABLE IF NOT EXISTS People (
    id SERIAL PRIMARY KEY,
    film_id INTEGER,
    name TEXT,
    country TEXT,
    email TEXT,
    birth DATE,
    role TEXT,
    CONSTRAINT fk_film FOREIGN KEY(film_id) REFERENCES Film(id)
);

-- New insert into people table
INSERT INTO People (name, country, email, birth, role, film_id)
VALUES
('Stanley Kubrick', 'USA', NULL, NULL, 'Director', 1),
('George Lucas', 'USA', NULL, NULL, 'Director', 2),
('Robert Mulligan', 'USA', NULL, NULL, 'Director', 3),
('James Cameron', 'Canada', NULL, NULL, 'Director', 4),
('David Lean', 'UK', NULL, NULL, 'Director', 5),
('Anthony Mann', 'USA', NULL, NULL, 'Director', 6),
('Theodoros Angelopoulos', 'Greece', NULL, NULL, 'Director', 7),
('Paul Verhoeven', 'Netherlands', NULL, NULL, 'Director', 8),
('Krzysztof Kieslowski', 'Poland', NULL, NULL, 'Director', 9),
('Jean-Paul Rappeneau', 'France', NULL, NULL, 'Director', 10);

INSERT INTO People (name, country, email, birth, role, film_id)
VALUES
('Keir Dullea', NULL, NULL, '1936-05-30', 'Star', 1),
('Mark Hamill', NULL, NULL, '1951-09-25', 'Star', 2),
('Gregory Peck', NULL, NULL, '1916-04-05', 'Star', 3),
('Leonardo DiCaprio', NULL, NULL, '1974-11-11', 'Star', 4),
('Julie Christie', NULL, NULL, '1940-04-14', 'Star', 5),
('Charlton Heston', NULL, NULL, '1923-10-04', 'Star', 6),
('Manos Katrakis', NULL, NULL, '1908-08-14', 'Star', 7),
('Rutger Hauer', NULL, NULL, '1944-01-23', 'Star', 8),
('Juliette Binoche', NULL, NULL, '1964-03-09', 'Star', 9),
('Gerard Depardieu', NULL, NULL, '1948-12-27', 'Star', 10);

INSERT INTO People (name, country, email, birth, role, film_id)
VALUES
('Arthur C Clarke', NULL, 'arthur@clarke.com', NULL, 'Writer', 1),
('George Lucas', NULL, 'george@email.com', NULL, 'Writer', 2),
('Harper Lee', NULL, 'harper@lee.com', NULL, 'Writer', 3),
('James Cameron', NULL, 'james@cameron.com', NULL, 'Writer', 4),
('Boris Pasternak', NULL, 'boris@boris.com', NULL, 'Writer', 5),
('Frederick Frank', NULL, 'fred@frank.com', NULL, 'Writer', 6),
('Theodoros Angelopoulos', NULL, 'theo@angelopoulos.com', NULL, 'Writer', 7),
('Erik Hazelhoff Roelfzema', NULL, 'erik@roelfzema.com', NULL, 'Writer', 8),
('Krzysztof Kieslowski', NULL, 'email@email.com', NULL, 'Writer', 9),
('Edmond Rostand', NULL, 'edmond@rostand.com', NULL, 'Writer', 10);

-- Extension Task 1.2

-- Show the title and director name for all films
    SELECT f.title, p.name AS director_name
    FROM Film f
    JOIN People p ON f.id = p.film_id
    WHERE p.role = 'Director';

-- Show the title, director and star name for all films
    SELECT f.title, p1.name AS director_name, p2.name AS star_name
    FROM Film f
      JOIN People p1 ON f.id = p1.film_id
      JOIN People p2 ON f.id = p2.film_id
    WHERE p1.role = 'Director' AND p2.role = 'Star';

-- Show the title of films where the director is from the USA
    SELECT f.title, p.country
    FROM Film f
      JOIN People p ON f.id = p.film_id
    WHERE p.role = 'Director' AND p.country = 'USA';

-- Show only those films where the writer and the director are the same person
    SELECT f.title, p1.name AS director, p2.name AS writer
    FROM Film f
      JOIN People p1 ON f.id = p1.film_id
      JOIN People p2 ON f.id = p2.film_id
    WHERE p1.role = 'Director' AND p2.role = 'Writer' AND p1.name = p2.name;

-- Show directors and film titles for films with a score of 8 or higher
    SELECT f.title, p.name AS director, f.score
    FROM Film f
      JOIN People p ON f.id = p.film_id
    WHERE p.role = 'Director' AND f.score >= 8;

-- 1. Show all actors that has been in films directed by a specific director (e.g. David Lean).
    SELECT f.title, p2.name AS star_name, p1.name AS director_name
    FROM Film f
      JOIN People p1 ON f.id = p1.film_id
      JOIN People p2 ON f.id = p2.film_id
    WHERE p1.role = 'Director' AND p1.name = 'David Lean' AND p2.role = 'Star';

-- 2. Show films and writers for films that has a score under or equal to 6.
    SELECT f.title, f.release_year, p.name AS writer_name, f.score
    FROM Film f
      JOIN People p ON f.id = p.film_id
    WHERE p.role = 'Writer' AND f.score <= 6;