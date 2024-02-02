
INSERT INTO writer
	(name, email)
VALUES
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


INSERT INTO star
	(name, starDOB)
VALUES
	('Keir Dullea','30/05/1936'),
  ('Mark Hamill','25/09/1951'),
  ('Gregory Peck','05/04/1916'),
  ('Leonardo DiCaprio','11/11/1974'),
  ('Julie Christie','14/04/1940'),
  ('Charlton Heston','04/10/1923'),
  ('Manos Katrakis','14/08/1908'),
  ('Rutger Hauer','23/01/1944'),
  ('Juliette Binoche','09/03/1964'),
  ('Gerard Depardieu','27/12/1948');



INSERT INTO director
	(name, country)
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
  ('Jean-Paul Rappeneau','France');



INSERT INTO film
	(directorId, starId, writerId, title, genre, release_year, score)
VALUES
	(1,1,1,'2001: A Space Odyssey','Science Fiction',1968,10),
  (2,2,2,'Star Wars: A New Hope','Science Fiction',1977,7),
  (3,3,3,'To Kill A Mockingbird','Drama',1962,10),
  (4,4,4,'Titanic','Romance',1997,5),
  (5,5,5,'Dr Zhivago','Historical',1965,8),
  (6,6,6,'El Cid','Historical',1961,6),
  (7,7,7,'Voyage to Cythera','Drama',1984,8),
  (8,8,8,'Soldier of Orange','Thriller',1977,8),
  (9,9,9,'Three Colours: Blue','Drama',1993,8),
  (10,10,10,'Cyrano de Bergerac','Historical',1990,9);


