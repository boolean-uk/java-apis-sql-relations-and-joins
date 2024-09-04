CREATE TABLE IF NOT EXISTS Director(
    id serial PRIMARY KEY,
    name TEXT NOT NULL,
    country TEXT
);

CREATE TABLE IF NOT EXISTS Star(
    id serial PRIMARY KEY,
    name TEXT NOT NULL,
    dob DATE
);

CREATE TABLE IF NOT EXISTS Writer(
    id serial PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT
);

CREATE TABLE IF NOT EXISTS Film(
    id serial PRIMARY KEY,
    title TEXT NOT NULL,
    year TEXT,
    genre TEXT,
    score INTEGER,
    director_id INTEGER,
    star_id INTEGER,
    writer_id INTEGER,
    CONSTRAINT fk_director FOREIGN KEY(director_id) REFERENCES Director(id),
    CONSTRAINT fk_star FOREIGN KEY(star_id) REFERENCES Star(id),
    CONSTRAINT fk_writer FOREIGN KEY(writer_id) REFERENCES Writer(id)
);

INSERT INTO Director(name, country)
    VALUES ('Stanley Kubrick', 'USA'),
    ('George Lucas', 'USA'), ('Robert Mulligan', 'USA'),
    ('James Cameron', 'Canada'), ('David Lean', 'UK'),
    ('Anthony Mann', 'USA'), ('Theodoros Angelopoulos', 'Greece'),
    ('Paul Verhoeven', 'Netherlands'), ('Krzysztof Kieslowski', 'Poland'),
    ('Jean-Paul Rappeneau', 'France');

INSERT INTO Star(name, dob)
    VALUES ('Keir Dullea', '1936-05-30'),
    ('Mark Hamill', '1951-09-25'), ('Gregory Peck', '1916-04-05'),
    ('Leonardo DiCaprio', '1974-11-11'), ('Julie Christie', '1940-04-14'),
    ('Charlton Heston', '1923-10-04'), ('Manos Katrakis', '1908-08-14'),
    ('Rutger Hauer', '1944-01-23'), ('Juliette Binoche', '1964-03-09'),
    ('Gerard Depardieu', '1948-12-27');

INSERT INTO Writer(name, email)
    VALUES ('Arthur C Clarke', 'arthur@clarke.com'),
    ('George Lucas', 'george@email.com'), ('Harper Lee', 'harper@lee.com'),
    ('James Cameron', 'james@cameron.com'), ('Boris Pasternak', 'boris@boris.com'),
    ('Frederick Frank', 'fred@frank.com'), ('Theodoros Angelopoulos', 'theo@angelopoulos.com'),
    ('Erik Hazelhoff Roelfzema', 'erik@roelfzema.com'), ('Krzysztof Kieslowski', 'email@email.com'),
    ('Edmond Rostand', 'edmond@rostand.com');

INSERT INTO Film(title, year, genre, score, director_id, star_id, writer_id)
    VALUES ('2001: A Space Odyssey', '1968', 'Science Fiction', 10, 1, 1, 1),
    ('Star Wars: A New Hope', '1977', 'Science Fiction', 7, 2, 2, 2), ('To Kill A Mockingbird', '1962', 'Drama', 10, 3, 3, 3),
    ('Titanic', '1997', 'Romance', 5, 4, 4, 4), ('Dr Zhivago', '1965', 'Historical', 8, 5, 5, 5),
    ('El Cid', '1961', 'Historical', 6, 6, 6, 6), ('Voyage to Cythera', '1984', 'Drama', 8, 7, 7, 7),
    ('Soldier of Orange', '1977', 'Thriller', 8, 8, 8, 8), ('Three Colours: Blue', '1993', 'Drama', 8, 9, 9, 9),
    ('Cyrano de Bergerac', '1990', 'Historical', 9, 10, 10, 10);

--Show the title and director name for all films
SELECT f.title, d.name
FROM Film f
INNER JOIN Director d ON f.director_id = d.id;

--Show the title, director and star name for all films
SELECT f.title, d.name AS director_name, s.name AS star_name
FROM Film f
INNER JOIN Director d ON f.director_id = d.id
INNER JOIN Star s ON f.star_id = s.id;

--Show the title of films where the director is from the USA
SELECT f.title, d.country
FROM Film f
INNER JOIN Director d ON f.director_id = d.id
WHERE d.country = 'USA';

--Show only those films where the writer and the director are the same person
SELECT f.title, w.name AS writer_director
FROM Film f
INNER JOIN Writer w ON f.writer_id = w.id
INNER JOIN Director d ON f.director_id = d.id
WHERE w.name = d.name;

--Show directors and film titles for films with a score of 8 or higher
SELECT f.title, d.name, f.score
FROM Film f
INNER JOIN Director d ON f.director_id = d.id
WHERE f.score > 7;

--Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.

--Show historical films where the star is born after 1923
SELECT f.title, f.genre, s.dob
FROM Film f
INNER JOIN Star s ON f.star_id = s.id
WHERE s.dob > '1923-12-31' AND f.genre = 'Historical';

--Show stars born less than 40 years before the making of their film
SELECT s.name, s.dob, f.title, f.year
FROM Film f
INNER JOIN Star s ON f.star_id = s.id
WHERE CAST(f.year AS INTEGER) - EXTRACT(YEAR FROM s.dob) < 40;

--Show films where the writer has an email address that contains the word "email"
SELECT f.title, w.name, w.email
FROM Film f
INNER JOIN Writer w ON f.writer_id = w.id
WHERE w.email LIKE '%email%';

--Show the writers of films where the director is not from the USA
SELECT f.title, w.name AS author_name, d.country AS director_country
FROM Film f
INNER JOIN Writer w ON f.writer_id = w.id
INNER JOIN Director d ON f.director_id = d.id
WHERE d.country NOT LIKE 'USA';

--Show films where the directors ID equals its score
SELECT f.title, f.score, d.id AS director_id
FROM Film f
INNER JOIN Director d ON f.director_id = d.id
WHERE d.id = f.score;