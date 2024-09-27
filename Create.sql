CREATE TABLE film (
    filmID INT PRIMARY KEY,
    title TEXT,
    year INT,
    genre VARCHAR(50),
    score INT,
    directorID INT,
    starID INT,
    writerID INT,
    FOREIGN KEY (directorID) REFERENCES Director(directorID),
    FOREIGN KEY (starID) REFERENCES Star(starID),
    FOREIGN KEY (writerID) REFERENCES Writer(writerID)
);

-- Director Table
CREATE TABLE director (
    directorID INT PRIMARY KEY,
    director TEXT,
    country TEXT
);

-- Star Table
CREATE TABLE star (
    starID INT PRIMARY KEY,
    star TEXT,
    DOB DATE
);

-- Writer Table
CREATE TABLE writer (
    writerID INT PRIMARY KEY,
    writer TEXT,
    email TEXT
);

-- Director_Star Table (Junction Table)
CREATE TABLE director_Star (
    directorStarID INT PRIMARY KEY,
    directorID INT,
    starID INT,
    FOREIGN KEY (directorID) REFERENCES director(directorID),
    FOREIGN KEY (starID) REFERENCES star(starID)
);