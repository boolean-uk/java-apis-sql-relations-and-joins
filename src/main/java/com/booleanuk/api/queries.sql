
-- I
SELECT Film.Title, Director.Name
FROM Film
JOIN Director ON Film.DirectorID = Director.DirectorID;

-- II
SELECT Film.Title, Director.Name AS Director, Star.Name AS Star
FROM Film
JOIN Director ON Film.DirectorID = Director.DirectorID
JOIN Star ON Film.StarID = Star.StarID;

-- III
SELECT Film.Title
FROM Film
JOIN Director ON Film.DirectorID = Director.DirectorID
WHERE Director.Country = 'USA';

-- IV
SELECT Film.Title
FROM Film
JOIN Director ON Film.DirectorID = Director.DirectorID
JOIN Writer ON Film.WriterID = Writer.WriterID
WHERE Director.Name = Writer.Name;

-- V
SELECT Director.Name, Film.Title
FROM Film
JOIN Director ON Film.DirectorID = Director.DirectorID
WHERE Film.Score >= 8;


-- VI
SELECT Film.Title, Writer.Email
FROM Film
JOIN Writer ON Film.WriterID = Writer.WriterID;

SELECT Film.Title, Director.Name AS Director, Star.Name AS Star
FROM Film
JOIN Director ON Film.DirectorID = Director.DirectorID
JOIN Star ON Film.StarID = Star.StarID;

SELECT Film.Title, Film.Genre, Writer.Name AS Writer
FROM Film
JOIN Writer ON Film.WriterID = Writer.WriterID;

SELECT Film.Title, Film.Score
FROM Film
JOIN Director ON Film.DirectorID = Director.DirectorID
WHERE Director.Country = 'USA';

SELECT Star.Name AS Star, Film.Title, Film.Year
FROM Film
JOIN Star ON Film.StarID = Star.StarID
ORDER BY Film.Year ASC;

SELECT Film.Title, Director.Name AS Director, Writer.Name AS Writer
FROM Film
JOIN Director ON Film.DirectorID = Director.DirectorID
JOIN Writer ON Film.WriterID = Writer.WriterID
WHERE Director.Name != Writer.Name;

-- ex 1

-- I
SELECT Film.title, People.name
FROM Film
JOIN People ON Film.person_id = People.person_id
WHERE People.role = 'director';

-- II
SELECT Film.title, People.name AS director, Star.name AS star
FROM Film
JOIN People ON Film.person_id = People.person_id
JOIN People AS Star ON Film.star_id = Star.person_id
WHERE People.role = 'director';

-- III
SELECT Film.title
FROM Film
JOIN People ON Film.person_id = People.person_id
WHERE People.role = 'director' AND People.country = 'USA';

-- iv
SELECT Film.title
FROM Film
JOIN People AS Director ON Film.person_id = Director.person_id
JOIN People AS Writer ON Film.writer_id = Writer.person_id
WHERE Director.role = 'director' AND Writer.role = 'writer' AND Director.person_id = Writer.person_id;

-- v
SELECT People.name, Film.title
FROM Film
JOIN People ON Film.person_id = People.person_id
WHERE Film.score >= 8 AND People.role = 'director';

