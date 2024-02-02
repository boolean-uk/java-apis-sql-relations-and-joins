
INSERT INTO persons (name)
VALUES
('Stanley Kubrick'),
('George Lucas'),
('Robert Mulligan'),
('James Cameron'),
('David Lean'),
('Anthony Mann'),
('Theodoros Angelopoulos'),
('Paul Verhoeven'),
('Krzysztof Kieslowski'),
('Jean-Paul Rappeneau'),
('Keir Dullea'),
('Mark Hamill'),
('Gregory Peck'),
('Leonardo DiCaprio'),
('Julie Christie'),
('Charlton Heston'),
('Manos Katrakis'),
('Rutger Hauer'),
('Juliette Binoche'),
('Gerard Depardieu'),
('Arthur C Clarke'),
('Harper Lee'),
('Boris Pasternak'),
('Frederick Frank'),
('Erik Hazelhoff Roelfzema'),
('Edmond Rostand');


INSERT INTO directors (personId, country)
VALUES
(1, 'USA'),
(2, 'USA'),
(3, 'USA'),
(4, 'Canada'),
(5, 'UK'),
(6, 'USA'),
(7, 'Greece'),
(8, 'Netherlands'),
(9, 'Poland'),
(10, 'France');

INSERT INTO stars (personId, dob)
VALUES
(11, '30/05/1936'),
(12, '25/09/1951'),
(13, '05/04/1916'),
(14, '11/11/1974'),
(15, '14/04/1940'),
(16, '04/10/1923'),
(17, '14/08/1908'),
(18, '23/01/1944'),
(19, '09/03/1964'),
(20, '27/12/1948');

INSERT INTO writers (personId, email)
VALUES
(21, 'arthur@clarke.com'),
(2, 'george@email.com'),
(22, 'harper@lee.com'),
(4, 'james@cameron.com'),
(23, 'boris@boris.com'),
(24, 'fred@frank.com'),
(7, 'theo@angelopoulos.com'),
(25, 'erik@roelfzema.com'),
(9, 'email@email.com'),
(26, 'edmond@rostand.com');

INSERT INTO films (title, year, genre, score, directorId, starId, writerId)
VALUES
('2001: A Space Odyssey', 1968, 'Science Fiction', 10, 1, 1, 1),
('Star Wars: A New Hope', 1977, 'Science Fiction', 7, 2, 2, 2),
('To Kill A Mockingbird', 1962, 'Drama', 10, 3, 3, 3),
('Titanic', 1997, 'Romance', 5, 4, 4, 4),
('Dr Zhivago', 1965, 'Historical', 8, 5, 5, 5),
('El Cid', 1961, 'Historical', 6, 6, 6, 6),
('Voyage to Cythera', 1984, 'Drama', 8, 7, 7, 7),
('Soldier of Orange', 1977, 'Thriller', 8, 8, 8, 8),
('Three Colours: Blue', 1993, 'Drama', 8, 9, 9, 9),
('Cyrano de Bergerac', 1990, 'Historical', 9, 10, 10, 10);






