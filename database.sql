CREATE TABLE Film (
    FilmID INT PRIMARY KEY,
    Title VARCHAR(255),
    Year INT,
    Genre VARCHAR(255),
    Score INT,
    DirectorID INT,
    StarID INT,
    WriterID INT,
    FOREIGN KEY (DirectorID) REFERENCES Director(DirectorID),
    FOREIGN KEY (StarID) REFERENCES Star(StarID),
    FOREIGN KEY (WriterID) REFERENCES Writer(WriterID)
);


CREATE TABLE Director (
    DirectorID INT PRIMARY KEY,
    DirectorName VARCHAR(255),
    DirectorCountry VARCHAR(255)
);

CREATE TABLE Star (
    StarID INT PRIMARY KEY,
    StarName VARCHAR(255),
    StarDOB DATE
);

CREATE TABLE Writer (
    WriterID INT PRIMARY KEY,
    WriterName VARCHAR(255),
    WriterEmail VARCHAR(255)
);


INSERT INTO Film (FilmID, Title, Year, Genre, Score, DirectorID, StarID, WriterID)
VALUES
  (1, '2001: A Space Odyssey', 1968, 'Science Fiction', 10, 1, 1, 1),
  (2, 'Star Wars: A New Hope', 1977, 'Science Fiction', 7, 2, 2, 2),
  (3, 'To Kill A Mockingbird', 1962, 'Drama', 10, 3, 3, 3),
  (4, 'Titanic', 1997, 'Romance', 5, 4, 4, 4),
  (5, 'Dr Zhivago', 1965, 'Historical', 8, 5, 5, 5),
  (6, 'El Cid', 1961, 'Historical', 6, 6, 6, 6),
  (7, 'Voyage to Cythera', 1984, 'Drama', 8, 7, 7, 7),
  (8, 'Soldier of Orange', 1977, 'Thriller', 8, 8, 8, 8),
  (9, 'Three Colours: Blue', 1993, 'Drama', 8, 9, 9, 9),
  (10, 'Cyrano de Bergerac', 1990, 'Historical', 9, 10, 10, 10);
  
  INSERT INTO Director (DirectorID, DirectorName, DirectorCountry)
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


INSERT INTO Star (StarID, StarName, StarDOB)
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
  
  
  INSERT INTO Writer (WriterID, WriterName, WriterEmail)
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
  
  SELECT Film.Title, Director.DirectorName
FROM Film
JOIN Director ON Film.DirectorID = Director.DirectorID;

SELECT Film.Title, Director.DirectorName, Star.StarName
FROM Film
JOIN Director ON Film.DirectorID = Director.DirectorID
JOIN Star ON Film.StarID = Star.StarID;

SELECT Title
FROM Film
JOIN Director ON Film.DirectorID = Director.DirectorID
WHERE Director.DirectorCountry = 'USA';

SELECT Film.Title
FROM Film
JOIN Director ON Film.DirectorID = Director.DirectorID
JOIN Writer ON Film.WriterID = Writer.WriterID
WHERE Director.DirectorName = Writer.WriterName;

SELECT Director.DirectorName, Film.Title
FROM Film
JOIN Director ON Film.DirectorID = Director.DirectorID
WHERE Film.Score >= 8;

SELECT Film.Title
FROM Film
JOIN Director ON Film.DirectorID = Director.DirectorID
JOIN Star ON Film.StarID = Star.StarID
WHERE Director.DirectorCountry = Star.StarCountry;

SELECT Film.Title, Star.StarName
FROM Film
JOIN Star ON Film.StarID = Star.StarID
WHERE Film.Genre = 'Drama';

SELECT genre, director_name
FROM films
JOIN directors ON directors.id = films.director_id
WHERE genre = 'Romance';

SELECT Film.Title, Writer.WriterName
FROM Film
JOIN Writer ON Film.WriterID = Writer.WriterID
WHERE Writer.WriterEmail LIKE '%.com';



