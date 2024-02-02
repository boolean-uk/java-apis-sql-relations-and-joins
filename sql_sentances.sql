-- Core and Extension 1 (mixed) -------------------------------

CREATE TABLE movies(
    id SERIAL PRIMARY KEY,
    title TEXT,
    genreID BIGINT(20) unsigned,
    directorID BIGINT(20) unsigned,
    writerID BIGINT(20) unsigned,
    starID BIGINT(20) unsigned,
    year INTEGER,
    score INTEGER,
    UNIQUE (title),
    FOREIGN KEY (genreID) REFERENCES genre(id),
    FOREIGN KEY (directorID) REFERENCES individual(id),
    FOREIGN KEY (writerID) REFERENCES individual(id),
    FOREIGN KEY (starID) REFERENCES individual(id)
)

CREATE TABLE genre(
    id SERIAL PRIMARY KEY,
    name TEXT
)

CREATE TABLE individual(
    id SERIAL PRIMARY KEY,
    name TEXT,
    last_name TEXT,
    email TEXT NOT NULL,
    date_of_birth DATE,
    countryID BIGINT(20) unsigned,
    UNIQUE (email),
    FOREIGN KEY (countryID) REFERENCES country(id)
)

CREATE TABLE country(
    id SERIAL PRIMARY KEY,
    name TEXT
)

INSERT INTO country(name)
VALUES
    ('USA'),
    ('Canada'),
    ('France'),
    ('Netherlands'),
    ('Greece'),
    ('UK'),
    ('Poland'),
    ('Russia')

INSERT INTO genre(name)
VALUES
    ('Science Fiction'),
    ('Drama'),
    ('Romance'),
    ('Historical'),
    ('Thriller')

-- The ids got skewed, so I had to compensate ---------------------------

INSERT INTO individual(id, name, last_name, email, date_of_birth, countryID)
VALUES
    (1, 'Keir', 'Dullea', 'keir.duellea@lolmail.gov',               '1936-05-30', 1),
    (2, 'Mark', 'Hamill', 'mark.hamill@mail.com',                   '1951-09-25', 1),
    (3, 'Gregory', 'Peck', 'gregory.peck@email.net',                '1916-04-05', 1),
    (4, 'Leonardo', 'DiCaprio', 'lenno.dee@inmail.org',             '1974-11-11', 1),
    (5, 'Julie', 'Christie', 'julie.ch@mail.com',                   '1940-04-14', 6),
    (6, 'Charlton', 'Heston', 'charlton@hottmail.com',              '1923-10-04', 1),
    (7, 'Manos', 'Katrakis', 'manos.kathy@thehottestofmails.org',   '1908-08-14', 5),
    (8, 'Rutger', 'Hauer', 'rutger.hauer@mail.com',                 '1944-01-23', 4),
    (9, 'Juliette', 'Binoche', 'juliette.binoche@gullablemail.com', '1964-03-09', 3),
    (10, 'Gerard', 'Depardieu', 'gerard.de.pardieu@hotmail.net',    '1948-12-27', 3),
    (11, 'Arthur', 'C Clarke', 'arthur@clarke.com',                 '1917-12-16', 6),
    (12, 'George', 'Lucas', 'george@email.com',                     '1944-05-04', 1),
    (13, 'Harper', 'Lee', 'harper@lee.com',                         '1926-04-28', 1),
    (14, 'James', 'Cameron', 'james@cameron.com',                   '1954-08-16', 2),
    (15, 'Boris', 'Pasternak', 'boris@boris.com',                   '1954-08-16', 8),
    (16, 'Frederick', 'Frank', 'fred@frank.com',                    '1966-11-14', 1),
    (17, 'Theodoros', 'Angelopoulos', 'theo@angelopoulos.com',      '1935-03-27', 5),
    (18, 'Erik', 'Hazelhoff Roelfzema', 'erik@roelfzema.com',       '1933-07-08', 3),
    (19, 'Krzysztof', 'Kieslowski', 'email@email.com',              '1941-06-27', 7),
    (20, 'Edmond', 'Rostand', 'edmond@rostand.com',                 '1868-04-01', 3),
    (21, 'Jean-Paul', 'Rappeneau', 'jean.paul@rappen.com',          '1910-02-28', 3),
    (22, 'Paul', 'Verhoeven', 'paul@verhoe.net',                    '1939-07-03', 4),
    (23, 'Anthony', 'Mann', 'some@mail.com',                        '1957-09-21', 1),
    (24, 'David', 'Lean', 'david@mail.com',                         '1955-10-10', 6),
    (25, 'Robert', 'Mulligan', 'robert@mail.com',                   '1954-05-07', 1),
    (26, 'Stanley', 'Kubrick', 'stanley@mail.com',                  '1930-05-06', 1)

INSERT INTO movies(title, genreID, directorID, starID, writerID, year, score)
VALUES
    ('2001: A Space Odyssey', 1, 26, 1, 11, 1968, 10),
    ('Star Wars: A New Hope', 1, 12, 2, 12, 1977, 7),
    ('To Kill A Mockingbird', 2, 25, 3, 13, 1962, 10),
    ('Titanic', 3, 14, 4, 14, 1997, 5),
    ('Dr Zhivago', 4, 24, 5, 15, 1965, 8),
    ('El Cid', 4, 23, 6, 16, 1961, 6),
    ('Voyage to Cythera', 2, 17, 7, 17, 1984, 8),
    ('Soldier of Orange', 5, 22, 8, 18, 1977, 8),
    ('Three Colours: Blue', 2, 19, 9, 19, 1993, 8),
    ('Cyrano de Bergerac', 4, 21, 10, 20, 1990, 9)

-- i

SELECT
    movies.title,
    individual.name AS author_name,
    individual.last_name AS author_last_name
FROM movies
    INNER JOIN individual ON movies.directorID=individual.id

-- ii

SELECT
    movies.title,
    i1.name AS author_name,
    i1.last_name AS author_last_name,
    i2.name AS star_name,
    i2.last_name AS star_last_name
FROM movies
    LEFT JOIN individual i1 ON movies.directorID=i1.id
    LEFT JOIN individual i2 ON movies.starID=i2.id

-- iii

SELECT
    movies.title
FROM movies
    INNER JOIN individual ON movies.directorID=individual.id
    LEFT JOIN country c ON individual.countryID=c.id
WHERE c.name='USA'

-- iv

SELECT
    movies.title
FROM movies
    LEFT JOIN individual director ON movies.directorID=director.id
    LEFT JOIN individual writer ON movies.writerID=writer.id
WHERE director.id=writer.id

-- v

SELECT
    movies.title,
    individual.name AS author_name,
    individual.last_name AS author_last_name
FROM movies
    INNER JOIN individual ON movies.directorID=individual.id
WHERE
    movies.score >= 8

-- vi

-- Give me all of the titles of the movies with a score higher than 8, and all of the stars should come from the USA

SELECT
    movies.title
FROM movies
    INNER JOIN individual ON movies.starID=individual.id
    LEFT JOIN country c ON individual.countryID=c.id
WHERE c.name='USA' AND movies.score > 8

-- Give me all the names of the people who are not from the USA

SELECT
    individual.name,
    individual.last_name
FROM individual
    INNER JOIN country c ON individual.countryID=c.id
WHERE c.name != 'USA'

-- Give me names and surnames of all the writers who are born before 1940

SELECT
    writer.name AS writer_name,
    writer.last_name AS writer_last_name
FROM movies
    LEFT JOIN individual writer ON movies.writerID=writer.id
WHERE CAST(YEAR(writer.date_of_birth) AS INTEGER) < 1940

-- Give me the emails to all of the writers of the movies that are 6 and below, so I can email them about how bad they are

SELECT
    writer.email,
    movies.score
FROM movies
    LEFT JOIN individual writer ON movies.writerID=writer.id
WHERE movies.score <= 6

-- Give me everything, except for the IDs, date of birth and emails, where all the IDs are replaced with actual names and descriptions

SELECT
    title,
    director.name AS director_name,
    director.last_name AS director_last_name,
    cd.name AS director_country,
    star.name AS star_name,
    star.last_name AS star_last_name,
    cs.name AS star_country,
    writer.name AS writer_name,
    writer.last_name AS writer_last_name,
    cw.name AS writer_country,
    genre.name,
    year,
    score
FROM movies
    LEFT JOIN genre ON movies.genreID=genre.id
    LEFT JOIN individual director ON movies.directorID=director.id
    LEFT JOIN individual star ON movies.starID=star.id
    LEFT JOIN individual writer ON movies.writerID=writer.id
    INNER JOIN country cd ON director.countryID=cd.id
    INNER JOIN country cs ON star.countryID=cs.id
    INNER JOIN country cw ON writer.countryID=cw.id
