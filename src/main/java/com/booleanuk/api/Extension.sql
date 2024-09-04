--Refactor the database tables so that the Actors, Directors and Writers all identify people
--(using a Foreign Key) that are present in a single People table

CREATE TABLE IF NOT EXISTS People(
    id serial PRIMARY KEY,
    name TEXT NOT NULL,
    country TEXT
    dob DATE
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
    CONSTRAINT fk_director FOREIGN KEY(director_id) REFERENCES People(id),
    CONSTRAINT fk_star FOREIGN KEY(star_id) REFERENCES People(id),
    CONSTRAINT fk_writer FOREIGN KEY(writer_id) REFERENCES People(id)
);

INSERT INTO People(name, country, dob, email)
    VALUES
    ('Stanley Kubrick', 'USA', NULL, NULL), --1
    ('George Lucas', 'USA', NULL, 'george@email.com'), --2
    ('Robert Mulligan', 'USA', NULL, NULL), --3
    ('James Cameron', 'Canada', NULL, 'james@cameron.com'), --4
    ('David Lean', 'UK', NULL, NULL), --5
    ('Anthony Mann', 'USA', NULL, NULL), --6
    ('Theodoros Angelopoulos', 'Greece', NULL, 'theo@angelopoulos.com'), --7
    ('Paul Verhoeven', 'Netherlands', NULL, NULL), --8
    ('Krzysztof Kieslowski', 'Poland', NULL, 'email@email.com'), --9
    ('Jean-Paul Rappeneau', 'France', NULL, NULL), --10
    ('Keir Dullea', NULL, '1936-05-30', NULL), --11
    ('Mark Hamill', NULL, '1951-09-25', NULL), --12
    ('Gregory Peck', NULL, '1916-04-05', NULL), --13
    ('Leonardo DiCaprio', NULL, '1974-11-11', NULL), --14
    ('Julie Christie', NULL, '1940-04-14', NULL), --15
    ('Charlton Heston', NULL, '1923-10-04', NULL), --16
    ('Manos Katrakis', NULL, '1908-08-14', NULL), --17
    ('Rutger Hauer', NULL, '1944-01-23', NULL), --18
    ('Juliette Binoche', NULL, '1964-03-09', NULL), --19
    ('Gerard Depardieu', NULL, '1948-12-27', NULL), --20
    ('Arthur C Clarke', NULL, NULL, 'arthur@clarke.com'), --21
    ('Harper Lee', NULL, NULL, 'harper@lee.com'), --22
    ('Boris Pasternak', NULL, NULL, 'boris@boris.com'), --23
    ('Frederick Frank', NULL, NULL, 'fred@frank.com'), --24
    ('Erik Hazelhoff Roelfzema', NULL, NULL, 'erik@roelfzema.com'), --25
    ('Edmond Rostand', NULL, NULL, 'edmond@rostand.com'); --26

INSERT INTO Film(title, year, genre, score, director_id, star_id, writer_id)
    VALUES ('2001: A Space Odyssey', '1968', 'Science Fiction', 10, 1, 11, 21),
    ('Star Wars: A New Hope', '1977', 'Science Fiction', 7, 2, 12, 2), ('To Kill A Mockingbird', '1962', 'Drama', 10, 3, 13, 22),
    ('Titanic', '1997', 'Romance', 5, 4, 14, 4), ('Dr Zhivago', '1965', 'Historical', 8, 5, 15, 23),
    ('El Cid', '1961', 'Historical', 6, 6, 16, 24), ('Voyage to Cythera', '1984', 'Drama', 8, 7, 17, 7),
    ('Soldier of Orange', '1977', 'Thriller', 8, 8, 18, 25), ('Three Colours: Blue', '1993', 'Drama', 8, 9, 19, 9),
    ('Cyrano de Bergerac', '1990', 'Historical', 9, 10, 20, 26);

--Where necessary refactor the queries to take advantage of this new structure

--Show the title and director name for all films
SELECT f.title, p.name
FROM Film f
INNER JOIN People p ON f.director_id = p.id;

--Show the title, director and star name for all films
SELECT f.title, d.name AS director_name, s.name AS star_name
FROM Film f
INNER JOIN People d ON f.director_id = d.id
INNER JOIN People s ON f.star_id = s.id;

--Show the title of films where the director is from the USA
SELECT f.title, p.country
FROM Film f
INNER JOIN People p ON f.director_id = p.id
WHERE p.country = 'USA';

--Show only those films where the writer and the director are the same person
SELECT f.title, w.name AS writer_director
FROM Film f
INNER JOIN People w ON f.writer_id = w.id
INNER JOIN People d ON f.director_id = d.id
WHERE w.name = d.name;

--Show directors and film titles for films with a score of 8 or higher
SELECT f.title, p.name, f.score
FROM Film f
INNER JOIN People p ON f.director_id = p.id
WHERE f.score > 7;

--Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.

--Show historical films where the star is born after 1923
SELECT f.title, f.genre, p.dob
FROM Film f
INNER JOIN People p ON f.star_id = p.id
WHERE p.dob > '1923-12-31' AND f.genre = 'Historical';

--Show stars born less than 40 years before the making of their film
SELECT p.name, p.dob, f.title, f.year
FROM Film f
INNER JOIN People p ON f.star_id = p.id
WHERE CAST(f.year AS INTEGER) - EXTRACT(YEAR FROM p.dob) < 40;

--Show films where the writer has an email address that contains the word "email"
SELECT f.title, p.name, p.email
FROM Film f
INNER JOIN People p ON f.writer_id = p.id
WHERE p.email LIKE '%email%';

--Show the writers of films where the director is not from the USA
SELECT f.title, w.name AS author_name, d.country AS director_country
FROM Film f
INNER JOIN People w ON f.writer_id = w.id
INNER JOIN People d ON f.director_id = d.id
WHERE d.country NOT LIKE 'USA';

--Show films where the directors ID equals its score
SELECT f.title, f.score, p.id AS director_id
FROM Film f
INNER JOIN People p ON f.director_id = p.id
WHERE p.id = f.score;