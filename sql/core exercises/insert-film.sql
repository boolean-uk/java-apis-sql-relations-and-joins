INSERT INTO director
	(name, country)
VALUES
	('Stanley Kubrick', 'USA'),
	('George Lucas', 'USA'),
	('Robert Mulligan', 'USA'),
	('James Cameron', 'Canada'),
	('David Lean ', 'UK'),
	('Anthony Mann', 'USA'),
	('Theodoros Angelopoulos','Greece'),
	('Paul Verhoeven', 'Netherlands'),
	('Krzysztof Kieslowski', 'Poland'),
	('Jean-Paul Rappeneau', 'France');


INSERT INTO star
	(name, dob)
VALUES
	('Keir Dullea', '30/05/1936'),
	('Mark Hamill','25/09/1951'),
	('Gregory Peck', '05/04/1916'),
	('Leonardo DiCaprio', '11/11/1974'),
	('Julie Christie', '14/04/1940'),
	('Charlton Heston', '04/10/1923'),
	('Manos Katrakis', '14/08/1908'),
	('Rutger Hauer', '23/01/1944'),
	('Juliette Binoche', '09/03/1964'),
	('Gerard Depardieu', '27/12/1948');


INSERT INTO writer
	(name, email)
VALUES
	('Arthur C Clarke','arthur@clarke.com'),
	('Harper Lee', 'harper@lee.com'),
	('James Cameron', 'james@cameron.com'),
	('Boris Pasternak', 'boris@boris.com'),
	('Frederick Frank', 'fred@frank.com'),
	('Theodoros Angelopoulos', 'theo@angelopoulos.com'),
	('Erik Hazelhoff Roelfzema', 'erik@roelfzema.com'),
	('Krzysztof Kieślowski', 'email@email.com'),
	('Edmond Rostand', 'edmond@rostand.com');


INSERT INTO film
	(title, year, genre, director_id, star_id, writer_id, score)

VALUES
	('2001: A Space Odyssey ', 1968, 'Science Fiction', 1, 1, 1, 10),
	('Star Wars: A New Hope ', 1977, 'Science Fiction', 2, 2, 2, 7),
	('To Kill A Mockingbird ', 1962,'Drama', 3, 3, 3, 10),
	('Titanic  ', 1997, 'Romance', 4, 4, 4, 5),
	('TDr Zhivago ', 1965, 'Historical', 5, 5, 5, 8),
	('El Cid ', 1961, 'Historical', 6, 6, 6, 6),
	('Voyage to Cythera ', 1984, 'Drama', 7, 7, 7, 8),
	('Soldier of Orange ', 1977, 'Thriller', 8, 8, 8, 8),
	('Three Colours: Blue',1993, 'Drama', 9, 9, 9, 8),
	('Cyrano de Bergerac',1990, 'Historical', 10, 10, 10, 9);
