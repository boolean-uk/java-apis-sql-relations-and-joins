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

INSERT INTO Star (StarID, Name, DOB) VALUES
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


-- ex 1

ALTER TABLE Film
ADD COLUMN person_id INT,
ADD CONSTRAINT fk_person_id FOREIGN KEY (person_id) REFERENCES People(person_id);

INSERT INTO People (person_id, name, role)
VALUES
    (1, 'Keir Dullea', 'actor'),
    (2, 'Mark Hamill', 'actor'),
    (3, 'Gregory Peck', 'actor'),
    (4, 'Leonardo DiCaprio', 'actor'),
    (5, 'Julie Christie', 'actor'),
    (6, 'Charlton Heston', 'actor'),
    (7, 'Manos Katrakis', 'actor'),
    (8, 'Rutger Hauer', 'actor'),
    (9, 'Juliette Binoche', 'actor'),
    (10, 'Gerard Depardieu', 'actor');

INSERT INTO People (person_id, name, role)
VALUES
    (11, 'Stanley Kubrick', 'director'),
    (12, 'George Lucas', 'director'),
    (13, 'Robert Mulligan', 'director'),
    (14, 'James Cameron', 'director'),
    (15, 'David Lean', 'director'),
    (16, 'Anthony Mann', 'director'),
    (17, 'Theodoros Angelopoulos', 'director'),
    (18, 'Paul Verhoeven', 'director'),
    (19, 'Krzysztof Kieslowski', 'director'),
    (20, 'Jean-Paul Rappeneau', 'director');

INSERT INTO People (person_id, name, role)
VALUES
    (21, 'Arthur C Clarke', 'writer'),
    (22, 'George Lucas', 'writer'),
    (23, 'Harper Lee', 'writer'),
    (24, 'James Cameron', 'writer'),
    (25, 'Boris Pasternak', 'writer'),
    (26, 'Frederick Frank', 'writer'),
    (27, 'Theodoros Angelopoulos', 'writer'),
    (28, 'Erik Hazelhoff Roelfzema', 'writer'),
    (29, 'Krzysztof Kieslowski', 'writer'),
    (30, 'Edmond Rostand', 'writer');

UPDATE Film
SET person_id =
    CASE
        WHEN title = '2001: A Space Odyssey' THEN 11
        WHEN title = 'Star Wars: A New Hope' THEN 12
        WHEN title = 'To Kill A Mockingbird' THEN 13
        WHEN title = 'Titanic' THEN 14
        WHEN title = 'Dr Zhivago' THEN 15
        WHEN title = 'El Cid' THEN 16
        WHEN title = 'Voyage to Cythera' THEN 17
        WHEN title = 'Soldier of Orange' THEN 18
        WHEN title = 'Three Colours: Blue' THEN 19
        WHEN title = 'Cyrano de Bergerac' THEN 20
    END;
