INSERT INTO directors (name, country) VALUES
('Stanley Kubrick', 'USA'),
('George Lucas', 'USA'),
('Robert Mulligan', 'USA'),
('James Cameron', 'Canada'),
('David Lean', 'UK'),
('Anthony Mann', 'USA'),
('Theodoros Angelopoulos', 'Greece'),
('Paul Verhoeven', 'Netherlands'),
('Krzysztof Kieslowski', 'Poland'),
('Jean-Paul Rappeneau', 'France');

INSERT INTO stars (name, date_of_birth) VALUES
('Keir Dullea', '30/05/1936'),
('Mark Hamill', '25/09/1951'),
('Gregory Peck', '05/04/1916'),
('Leonardo DiCaprio', '11/11/1974'),
('Julie Christie', '14/04/1940'),
('Charlton Heston', '04/10/1923'),
('Manos Katrakis', '14/08/1908'),
('Rutger Hauer', '23/01/1944'),
('Juliette Binoche', '09/03/1964'),
('Gerard Depardieu', '27/12/1948');

INSERT INTO writers (name, email) VALUES
('Arthur C Clarke', 'arthur@clarke.com'),
('George Lucas', 'george@email.com'),
('Harper Lee', 'harper@lee.com'),
('James Cameron', 'james@cameron.com'),
('Boris Pasternak', 'boris@boris.com'),
('Frederick Frank', 'fred@frank.com'),
('Theodoros Angelopoulos', 'theo@angelopoulos.com'),
('Erik Hazelhoff Roelfzema', 'erik@roelfzema.com'),
('Krzysztof Kieslowski', 'email@email.com'),
('Edmond Rostand', 'edmond@rostand.com');

INSERT INTO films (title, director_id, star_id, writer_id, year, genre, score) VALUES
('2001: A Space Odyssey', 1, 1, 1, 1968, 'Science Fiction', 10),
('Star Wars: A New Hope', 2, 2, 2, 1977, 'Science Fiction', 7),
('To Kill A Mockingbird', 3, 3, 3, 1962, 'Drama', 10),
('Titanic', 4, 4, 4, 1997, 'Romance', 5),
('Dr Zhivago', 5, 5, 5, 1965, 'Historical', 8),
('El Cid', 6, 6, 6, 1961, 'Historical', 6),
('Voyage to Cythera', 7, 7, 7, 1984, 'Drama', 8),
('Soldier of Orange', 8, 8, 8, 1977, 'Thriller', 8),
('Three Colours: Blue', 9, 9, 9, 1993, 'Drama', 8),
('Cyrano de Bergerac', 10, 10, 10, 1990, 'Historical', 9);