
CREATE TABLE People(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country TEXT,
  email TEXT,
  dob date
);
CREATE TABLE Directors(
  id SERIAL PRIMARY KEY,
  personId INT,
  CONSTRAINT fk_director
  	FOREIGN KEY(personId)
  		REFERENCES People(id)
);

CREATE TABLE Stars(
  id SERIAL PRIMARY KEY,
  personId INT,
  CONSTRAINT fk_star
  	FOREIGN KEY(personId)
  		REFERENCES People(id)
);

CREATE TABLE Writers(
  id SERIAL PRIMARY KEY,
  personId INT,
  CONSTRAINT fk_writer
  	FOREIGN KEY(personId)
  		REFERENCES People(id)
);


CREATE TABLE Films (
  id SERIAL,
  title TEXT NOT NULL,
  year INT,
  genre TEXT NOT NULL,
  score INT,
  writerId INT,
  directorId INT,
  starId INT,
  UNIQUE(title),
  CONSTRAINT fk_writer
  	FOREIGN KEY(writerId)
  		REFERENCES Writers(id),
  CONSTRAINT fk_director
  	FOREIGN KEY(directorId)
  		REFERENCES Directors(id),
  CONSTRAINT fk_star
  	FOREIGN KEY(starId)
  		REFERENCES Stars(id)
);






INSERT INTO Writers(personId)
  VALUES (1),
  (2),
  (3),
  (4),
  (5),
  (6),
  (7),
  (8),
  (9),
  (10);
INSERT INTO Directors(personId)
  VALUES (11),
  (2),
  (12),
  (4),
  (13),
  (14),
  (7),
  (15),
  (9),
  (16);

 INSERT INTO Stars(personId)
  VALUES (17),
  (18),
  (19),
  (20),
  (21),
  (22),
  (23),
  (24),
  (25),
  (26);

  INSERT INTO People(name,country,email,dob)
  VALUES ('Arthur C Clarke',null,'arthur@clarke.com',null),
  ('George Lucas','USA','george@email.com',null),
  ('Harper Lee',null,'harper@lee.com',null),
  ('James Cameron','Canada','james@cameron.com',null),
  ('Boris Pasternak',null,'boris@boris.com',null),
  ('Frederick Frank',null,'fred@frank.com',null),
  ('Theodoros Angelopoulos','Greece','theo@angelopoulos.com',null),
  ('Erik Hazelhoff Roelfzema',null,'erik@roelfzema.com',null),
  ('Krzysztof Kieslowski','Poland','email@email.com',null),
  ('Edmond Rostand',null,'edmond@rostand.com',null),
  ('Stanley Kubrick','USA',null,null),
  ('Robert Mulligan','USA',null,null),
  ('David Lean','UK',null,null),
  ('Anthony Mann','USA',null,null),
  ('Paul Verhoeven','Netherlands',null,null),
  ('Jean-Paul Rappeneau','France',null,null),
  ('Keir Dullea',null,null,'1936-05-30'),
  ('Mark Hamill',null,null,'1951-09-25'),
  ('Gregory Peck',null,null,'1916-05-04'),
  ('Leonardo DiCaprio',null,null,'1974-11-11'),
  ('Julie Christie',null,null,'1940-04-14'),
  ('Charlton Heston',null,null,'1923-04-10'),
  ('Manos Katrakis',null,null,'1908-08-14'),
  ('Rutger Hauer',null,null,'1944-01-23'),
  ('Juliette Binoche',null,null,'1964-03-09'),
  ('Gerard Depardieu',null,null,'1948-12-27');


 INSERT INTO Films(title,year,genre,score,writerId,directorId,starId)
  VALUES ('2001: A Space Odyssey',1968,'Science Fiction',10,1,1,1),
  ('Star Wars: A New Hope',1977,'Science Fiction',7,2,2,2),
  ('To Kill A Mockingbird',1962,'Drama',10,3,3,3),
  ('Titanic',1997,'Romance',5,4,4,4),
  ('Dr Zhivago',1965,'Historical',8,5,5,5),
  ('El Cid',1961,'Historical',6,6,6,6),
  ('Voyage to Cythera',1984,'Drama',8,7,7,7),
  ('Soldier of Orange',1977,'Thriller',8,8,8,8),
  ('Three Colours: Blue',1993,'Drama',8,9,9,9),
  ('Cyrano de Bergerac',1990,'Historical',9,10,10,10);





