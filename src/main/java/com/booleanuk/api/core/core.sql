
-- Creating tables

CREATE TABLE Director (
    DirectorID INT NOT NULL PRIMARY KEY,
    Name TEXT NOT NULL,
    Country TEXT NOT NULL
);


CREATE TABLE Star (
    StarID INT NOT NULL PRIMARY KEY,
    Name TEXT NOT NULL,
    DateOfBirth DATE NOT NULL
);


CREATE TABLE Writer (
    WriterID INT NOT NULL PRIMARY KEY,
    Name TEXT NOT NULL,
    Email TEXT NOT NULL
);


CREATE TABLE Film (
    FilmID INT NOT NULL PRIMARY KEY,
    Title TEXT NOT NULL,
    DirectorID INT,
    StarID INT,
    WriterID INT,
    Year INT NOT NULL,
    Genre TEXT NOT NULL,
    Score INT NOT NULL,
    FOREIGN KEY (DirectorID) REFERENCES Director(DirectorID),
    FOREIGN KEY (StarID) REFERENCES Star(StarID),
    FOREIGN KEY (WriterID) REFERENCES Writer(WriterID)
);

-----------------------------------------------------------------------------------------------------------

-- Inserting into tables

INSERT INTO Director (DirectorID, Name, Country) VALUES
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



INSERT INTO Star (StarID, Name, DateOfBirth) VALUES
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


INSERT INTO Writer (WriterID, Name, Email) VALUES
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


INSERT INTO Film (FilmID, Title, DirectorID, StarID, WriterID, Year, Genre, Score) VALUES
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


-----------------------------------------------------------------------------------------------------------

-- Queries on the tables

SELECT film.title, director.name
FROM director
INNER JOIN film ON director.directorid = film.directorid;

SELECT film.title, director.name, star.name
FROM director
INNER JOIN film ON director.directorid = film.directorid
INNER JOIN star ON film.starid = star.starid;

SELECT film.title, director.country
FROM film
INNER JOIN director ON film.directorid = director.directorid
WHERE director.country = 'USA';

SELECT film.title, director.name
FROM film
INNER JOIN director ON film.directorid = director.directorid
INNER JOIN writer ON director.directorid = writer.writerid
WHERE director.name = writer.name;

SELECT director.name, film.title, film.score
FROM film
INNER JOIN director ON film.directorid = director.directorid
WHERE film.score >= 8;

-----------------------------------------------------------------------------------------------------------
-- List the Names of Stars and the Titles of Films They Starred In
SELECT star.name, film.title
FROM film
INNER JOIN star ON film.starid = star.starid;


-- Find the Email Addresses of Writers for Films Released Before 1970
SELECT writer.name, writer.email, film.year
FROM film
INNER JOIN writer ON film.writerid = writer.writerid
WHERE film.year < 1970;


-- Show All Films Along with Their Director's Country
SELECT film.title, director.country
FROM film
INNER JOIN director ON film.directorid = director.directorid;


-- List the Titles of Films Along with Their Star’s Name Where the Film Was Released After 1980
SELECT film.title, star.name
FROM film
INNER JOIN star ON film.starid = star.starid
WHERE film.year > 1980;


-- Count the Number of Films Written by Each
SELECT film.title
FROM film
INNER JOIN director ON film.directorid = director.directorid
WHERE film.genre = 'Drama' AND director.country = 'UK';