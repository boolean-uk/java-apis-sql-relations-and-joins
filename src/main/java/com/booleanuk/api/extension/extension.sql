
-- New people table
CREATE TABLE People (
    PersonID INT NOT NULL PRIMARY KEY,
    Name TEXT NOT NULL
);

-- Updated director table
CREATE TABLE Director (
    DirectorID INT NOT NULL PRIMARY KEY,
    PersonID INT,
    Country TEXT NOT NULL,
    FOREIGN KEY (PersonID) REFERENCES People(PersonID)
);

-- Updated star table
CREATE TABLE Star (
    StarID INT NOT NULL PRIMARY KEY,
    PersonID INT,
    Name TEXT NOT NULL,
    FOREIGN KEY (PersonID) REFERENCES People(PersonID)
);

-- Updated writer table
CREATE TABLE Writer (
    WriterID INT NOT NULL PRIMARY KEY,
    PersonID INT,
    Name TEXT NOT NULL,
    FOREIGN KEY (PersonID) REFERENCES People(PersonID)
);

-- Updated film table
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

-- Insert new data in people table
INSERT INTO People (PersonID, Name) VALUES
(1, 'Keir Dullea'),
(2, 'Mark Hamill'),
(3, 'Gregory Peck'),
(4, 'Leonardo DiCaprio'),
(5, 'Julie Christie'),
(6, 'Charlton Heston'),
(7, 'Manos Katrakis'),
(8, 'Rutger Hauer'),
(9, 'Juliette Binoche'),
(10, 'Gerard Depardieu'),
(11, 'Arthur C Clarke'),
(12, 'George Lucas'),
(13, 'Harper Lee'),
(14, 'James Cameron'),
(15, 'Boris Pasternak'),
(16, 'Frederick Frank'),
(17, 'Theodoros Angelopoulos'),
(18, 'Erik Hazelhoff Roelfzema'),
(19, 'Krzysztof Kieslowski'),
(20, 'Edmond Rostand');


-- Insert into director table
INSERT INTO Director (DirectorID, PersonID, Country) VALUES
(1, 1, 'USA'),
(2, 2, 'USA'),
(3, 3, 'USA'),
(4, 4, 'Canada'),
(5, 5, 'UK'),
(6, 6, 'USA'),
(7, 7, 'Greece'),
(8, 8, 'Netherlands'),
(9, 9, 'Poland'),
(10, 10, 'France');


-- Insert into star table
INSERT INTO Star (StarID, PersonID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


-- Insert into writer table
INSERT INTO Writer (WriterID, PersonID, Email) VALUES
(1, 11, 'arthur@clarke.com'),
(2, 12, 'george@email.com'),
(3, 13, 'harper@lee.com'),
(4, 14, 'james@cameron.com'),
(5, 15, 'boris@boris.com'),
(6, 16, 'fred@frank.com'),
(7, 17, 'theo@angelopoulos.com'),
(8, 18, 'erik@roelfzema.com'),
(9, 19, 'email@email.com'),
(10, 20, 'edmond@rostand.com');


-- Refactor query 1

-- Refactor query 2

