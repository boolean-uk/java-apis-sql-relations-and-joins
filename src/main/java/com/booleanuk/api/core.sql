-- Create Writers table
CREATE TABLE Writers(
    id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT
);

-- Create Directors table
CREATE TABLE Directors(
    id SERIAL PRIMARY KEY,
    name TEXT,
    country TEXT
);

-- Create Stars table
CREATE TABLE Stars(
    id SERIAL PRIMARY KEY,
    name TEXT,
    country TEXT
);


-- Create Films table
CREATE TABLE Films (
    id SERIAL PRIMARY KEY,
    title TEXT,
    year INT,
    genre TEXT,
    score INT,
    writer_id INT,
    director_id INT,
    star_id INT,
    UNIQUE(title),
    CONSTRAINT fk_writer
        FOREIGN KEY(writer_id)
            REFERENCES Writers(id),
    CONSTRAINT fk_star
    	FOREIGN KEY(star_id)
        	REFERENCES Stars(id),
    CONSTRAINT fk_director
    	FOREIGN KEY(director_id)
        	REFERENCES Directors(id)
);

-- Populate Writers table
INSERT INTO Writers (name, email) VALUES
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

-- Populate Directors table
INSERT INTO Directors (name, country) VALUES
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

-- Populate Stars table
INSERT INTO Stars (name, country) VALUES
  ('Keir Dullea', 'USA'),
  ('Mark Hamill', 'USA'),
  ('Gregory Peck', 'USA'),
  ('Leonardo DiCaprio', 'USA'),
  ('Julie Christie', 'UK'),
  ('Charlton Heston', 'USA'),
  ('Manos Katrakis', 'Greece'),
  ('Rutger Hauer', 'Netherlands'),
  ('Juliette Binoche', 'Poland'),
  ('Gerard Depardieu', 'France');

-- Populate Films table
INSERT INTO Films (title, year, genre, score, writer_id, director_id, star_id) VALUES
  ('2001: A Space Odyssey', 1968, 'Science Fiction', 10, 1, 1, 1),
  ('Star Wars: A New Hope', 1977, 'Science Fiction', 7, 2, 2, 2),
  ('To Kill A Mockingbird', 1962, 'Drama', 10, 3, 3, 3),
  ('Titanic', 1997, 'Romance', 5, 4, 4, 4),
  ('Dr Zhivago', 1965, 'Historical', 8, 5, 5, 5),
  ('El Cid', 1961, 'Historical', 6, 6, 6, 6),
  ('Voyage to Cythera', 1984, 'Drama', 8, 7, 7, 7),
  ('Soldier of Orange', 1977, 'Thriller', 8, 8, 8, 8),
  ('Three Colours: Blue', 1993, 'Drama', 8, 9, 9, 9),
  ('Cyrano de Bergerac', 1990, 'Historical', 9, 10, 10, 10);

--Show the title and director name for all films
SELECT title as film_title, directors.name as director_name
FROM films
JOIN directors ON films.director_id = directors.id;

--Show the title, director and star name for all films
SELECT title as film_title, directors.name as director_name, stars.name as star_name
FROM films
JOIN directors ON films.director_id = directors.id
JOIN stars ON films.star_id = stars.id;

--Show the title of films where the director is from the USA
SELECT title
FROM films
JOIN directors ON films.director_id = directors.id
WHERE directors.country = 'USA';

--Show only those films where the writer and the director are the same person
SELECT title as film_title, directors.name as director_name, writers.name as writers_name
FROM films
JOIN directors ON films.director_id = directors.id
JOIN writers ON films.writer_id = writers.id
WHERE directors.name = writers.name;

--Show directors and film titles for films with a score of 8 or higher
SELECT title, year, genre, score, directors.name, directors.country
FROM films
JOIN directors ON films.director_id = directors.id
WHERE score >= 8;

--5 more

--Retrieve the title and release year of the films where the star's name begins with "G"
SELECT films.title, films.year
FROM films
JOIN stars ON films.star_id = stars.id
WHERE stars.name LIKE 'G%';

--Retrieve the names of directors that have directed a historical film with a score of 8 or higher
SELECT name
FROM directors
JOIN films ON directors.id = films.director_id
WHERE films.genre = 'Historical' AND films.score >= 8;

--Retrieve the names of stars who have worked with directors from the USA and starred in a film with a score of 8 or higher
SELECT stars.name FROM stars
JOIN Films ON Stars.id = Films.star_id
JOIN Directors ON Films.director_id = Directors.id
JOIN Writers ON Films.writer_id = Writers.id
WHERE Directors.country = 'USA' AND films.score >= 8;

--Retrieve the genres that containing more than one film, along with the names of the writer for each genre.
SELECT Films.genre, Writers.name AS writer_name
FROM Films
JOIN Writers ON Films.writer_id = Writers.id
WHERE Films.genre IN (
    SELECT genre
    FROM Films
    GROUP BY genre
    HAVING COUNT(*) > 1
)
ORDER BY Films.genre, Writers.name;

--Retrieve the titles of films that are in the same genre as films directed by directors from the USA but not the films where the director is from USA
SELECT title, genre, Directors.country
FROM Films
JOIN Directors ON Films.director_id = Directors.id
WHERE genre IN (
    SELECT DISTINCT genre
    FROM Films
    JOIN Directors ON Films.director_id = Directors.id
    WHERE Directors.country = 'USA'
)
AND Films.director_id NOT IN (
    SELECT id
    FROM Directors
    WHERE country = 'USA'
)
ORDER BY genre, title;