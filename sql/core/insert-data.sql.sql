INSERT INTO Writer (name,email)
VALUES 
	('Arthur C Clarke','arthur@clarke.com'),
	('George Lucas','george@email.com'),
	('Harper Lee','harper@lee.com'),
	('James Cameron','james@cameron.com'),
	('Boris Pasternak','boris@boris.com'),
	('Frederick Frank','fred@frank.com'),
	('Theodoros Angelopoulos','theo@angelopoulos.com'),
	('Erik Hazelhoff Roelfzema','erik@roelfzema.com'),
	('Krzysztof Kieslowski','email@email.com'),
	('Edmond Rostand','edmond@rostand.com')

INSERT INTO Director (name,country)
VALUES 
	('Stanley Kubrick','USA'),
	('George Lucas','USA'),
	('Robert Mulligan','USA'),
	('James Cameron','Canada'),
	('David Lean','UK'),
	('Anthony Mann','USA'),
	('Theodoros Angelopoulos','Greece'),
	('Paul Verhoeven','Netherlands'),
	('Krzysztof Kieslowski','Poland'),
	('Jean-Paul Rappeneau','France')

INSERT INTO Star (name,dob)
VALUES 
    ('Keir Dullea', '1936-05-30'),
    ('Mark Hamill', '1951-09-25'),
    ('Gregory Peck', '1916-04-05'),
    ('Leonardo DiCaprio', '1974-11-11'),
    ('Julie Christie', '1940-04-14'),
    ('Charlton Heston', '1923-10-04'),
    ('Manos Katrakis', '1908-08-14'),
    ('Rutger Hauer', '1944-01-23'),
    ('Juliette Binoche', '1964-03-09'),
    ('Gerard Depardieu', '1948-12-27');

INSERT INTO film (title,genre,score,year, director_id, star_id, writer_id)
VALUES 
	('2001: A Space Odyssey','Science Fiction',10,1968, 1, 1, 1),
	('Star Wars: A New Hope','Science Fiction',7,1977, 2, 2, 2),
	('To Kill A Mockingbird','Drama',10,1962, 3, 3, 3),
	('Titanic','Romance',5,1997, 4, 4, 4),
	('Dr Zhivago','Historical',8,1965, 5, 5, 5),
	('El Cid','Historical',6,1961, 6, 6, 6),
	('Voyage to Cythera','Drama',8,1984, 7, 7, 7),
	('Soldier of Orange','Thriller',8,1977, 8, 8, 8),
	('Three Colours: Blue','Drama',8,1993, 9, 9, 9),
	('Cyrano de Bergerac','Historical',9,1990, 10, 10, 10)