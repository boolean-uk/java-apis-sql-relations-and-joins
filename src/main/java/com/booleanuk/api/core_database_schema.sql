-- 1. Normalise the data shown in the table so that it has multiple tables (Film, Director, Star and Writer).
CREATE TABLE IF NOT EXISTS Film (
    id SERIAL PRIMARY KEY,
    title TEXT,
    release_year INTEGER,
    genre TEXT,
    score INTEGER
);

CREATE TABLE IF NOT EXISTS Director (
    id SERIAL PRIMARY KEY,
    film_id INTEGER,
    name TEXT UNIQUE,
    country TEXT,
    CONSTRAINT FOREIGN KEY (film_id) REFERENCES Film(id)
);

CREATE TABLE IF NOT EXISTS Star (
    id SERIAL PRIMARY KEY,
    film_id INTEGER,
    name TEXT,
    birth DATE,
    CONSTRAINT FOREIGN KEY (film_id) REFERENCES Film(id)
);

CREATE TABLE IF NOT EXISTS Writer (
    id SERIAL PRIMARY KEY,
    film_id INTEGER,
    name TEXT,
    email TEXT,
    CONSTRAINT FOREIGN KEY (film_id) REFERENCES Film(id)
);

-- 5. Populate the tables with the data shown.
INSERT INTO Film (title, release_year, genre, score)
VALUES
('2001: A Space Odyssey', 1968, 'Science Fiction', 10),
('Star Wars: A New Hope', 1977, 'Science Fiction', 7),
('To Kill A Mockingbird', 1962, 'Drama', 10),
('Titanic', 1997, 'Romance', 5),
('Dr Zhivago', 1965, 'Historical', 8),
('El Cid', 1961, 'Historical', 6),
('Voyage to Cythera', 1984, 'Drama', 8),
('Soldier of Orange', 1977, 'Thriller', 8),
('Three Colours: Blue', 1993, 'Drama', 8),
('Cyrano de Bergerac', 1990, 'Historical', 9);

INSERT INTO Director (film_id, name, country)
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

INSERT INTO Star (film_id, name, birth)
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

INSERT INTO Writer (film_id, name, email)
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


-- 6. Once you have the tables and data set up then you need to create queries to return the data needed as shown below:

   -- Show the title and director name for all films
       SELECT f.title, d.name AS director_name
       FROM Film f JOIN Director d ON f.id = d.film_id;

   -- Show the title, director and star name for all films
       SELECT f.title, d.name AS director_name, s.name AS star_name
       FROM film f
        JOIN director d ON f.id = d.film_id
        JOIN star s ON f.id = s.film_id;

   -- Show the title of films where the director is from the USA
       SELECT f.title, d.country
       FROM film f JOIN director d ON f.id = d.film_id
       WHERE d.country = 'USA';

   -- Show only those films where the writer and the director are the same person
       SELECT f.title, d.name AS director, w.name AS writer
       FROM film f
        JOIN director d ON f.id = d.film_id
         JOIN writer w ON f.id = w.film_id
       WHERE d.name = w.name;

   -- Show directors and film titles for films with a score of 8 or higher
       SELECT f.title, d.name AS director, f.score
       FROM film f JOIN director d ON f.id = d.film_id
       WHERE f.score >= 8;

   -- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.
      -- 1. Show all actors that has been in films directed by a specific director (e.g. David Lean).
            SELECT f.title, s.name AS star_name, d.name AS director_name
            FROM film f
              JOIN director d ON f.id = d.film_id
              JOIN star s ON f.id = s.film_id
            WHERE d.name = 'David Lean';

      -- 2. Show films and writers for films that has a score under or equal to 6.
            SELECT f.title, f.release_year, w.name AS writer_name, f.score
            FROM film f JOIN writer w ON f.id = w.film_id
            WHERE f.score <= 6;

      -- 3. Show the titles of films made after 1980 that have an actor born before 1950.
            SELECT f.title
            FROM film f JOIN star s ON f.id = s.film_id
            WHERE f.release_year > 1980 AND s.birth < '1950-01-01';

      -- 4. Show titles of movies and number of actors in each movie.
            SELECT f.title AS film_title, COUNT(s.id) AS number_of_actors
            FROM film f JOIN star s ON f.id = s.film_id
            GROUP BY f.title;

      -- 5. Show the films made in a specific genre (e.g. "Drama") and where the star's date of birth is
      --    within the same decade as the film's release year.
            SELECT f.title, f.release_year, s.name AS star_name, s.birth
            FROM film f JOIN star s ON f.id = s.film_id
            WHERE f.genre = 'Drama'
            	AND FLOOR(f.release_year / 10) = FLOOR(EXTRACT(YEAR FROM s.birth) / 10);





