SELECT Film.Title, Director.Name
FROM Film
JOIN Director ON Film.DirectorID = Director.DirectorID;

SELECT Film.Title
FROM Film
JOIN Director ON Film.DirectorID = Director.DirectorID
WHERE Director.Country = 'USA';

SELECT Film.Title
FROM Film
JOIN Director ON Film.DirectorID = Director.DirectorID
WHERE Director.Country = 'USA';

SELECT Film.Title
FROM Film
JOIN Director ON Film.DirectorID = Director.DirectorID
JOIN Writer ON Film.WriterID = Writer.WriterID
WHERE Director.Name = Writer.Name;

SELECT Director.Name AS DirectorName, Film.Title
FROM Film
JOIN Director ON Film.DirectorID = Director.DirectorID
WHERE Film.Score >= 8;


-- Example Query 1: Show all films with their genres and the corresponding writer's email
SELECT Film.Title, Film.Genre, Writer.Email
FROM Film
JOIN Writer ON Film.WriterID = Writer.WriterID;

-- Example Query 2: Show star names and their birthdates for films released in 1962
SELECT Star.Name, Star.DOB, Film.Title
FROM Film
JOIN Star ON Film.StarID = Star.StarID
WHERE Film.Year = 1962;

-- Example Query 3: Show the total number of films in each genre
SELECT Genre, COUNT(*) AS FilmCount
FROM Film
GROUP BY Genre;

-- Example Query 4: Show the oldest and youngest stars for each director
SELECT Director.Name AS DirectorName, MIN(Star.DOB) AS OldestStarDOB, MAX(Star.DOB) AS YoungestStarDOB
FROM Film
JOIN Director ON Film.DirectorID = Director.DirectorID
JOIN Star ON Film.StarID = Star.StarID
GROUP BY Director.Name;

-- Example Query 5: Show the average score for each writer
SELECT Writer.Name AS WriterName, AVG(Film.Score) AS AverageScore
FROM Film
JOIN Writer ON Film.WriterID = Writer.WriterID
GROUP BY Writer.Name;

