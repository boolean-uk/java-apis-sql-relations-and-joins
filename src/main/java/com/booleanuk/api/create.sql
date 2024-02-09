CREATE TABLE Director (
    DirectorID INT PRIMARY KEY,
    Name VARCHAR(255),
    Country VARCHAR(255)
);

CREATE TABLE Star (
    StarID INT PRIMARY KEY,
    Name VARCHAR(255),
    DOB DATE
);

CREATE TABLE Writer (
    WriterID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255)
);

CREATE TABLE Film (
    FilmID INT PRIMARY KEY,
    Title VARCHAR(255),
    DirectorID INT,
    StarID INT,
    WriterID INT,
    Year INT,
    Genre VARCHAR(255),
    Score INT,
    FOREIGN KEY (DirectorID) REFERENCES Director(DirectorID),
    FOREIGN KEY (StarID) REFERENCES Star(StarID),
    FOREIGN KEY (WriterID) REFERENCES Writer(WriterID)
);

-- ex 1

CREATE TABLE People (
    person_id INT PRIMARY KEY,
    name VARCHAR(255),
    role VARCHAR(100)
);

ALTER TABLE Film
ADD COLUMN person_id INT,
ADD CONSTRAINT fk_person_id FOREIGN KEY (person_id) REFERENCES People(person_id);

