-- Create Director Table
CREATE TABLE Director (
    DirectorID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Country VARCHAR(50)
);

-- Create Star Table
CREATE TABLE Star (
    StarID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    DOB DATE
);

-- Create Writer Table
CREATE TABLE Writer (
    WriterID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255)
);

-- Create Film Table
CREATE TABLE Film (
    FilmID SERIAL PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    DirectorID INT REFERENCES Director(DirectorID),
    StarID INT REFERENCES Star(StarID),
    WriterID INT REFERENCES Writer(WriterID),
    Year INT,
    Genre VARCHAR(50),
    Score INT
);