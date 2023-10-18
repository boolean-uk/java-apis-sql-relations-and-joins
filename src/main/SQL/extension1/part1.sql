--create new table people for extension part 1
CREATE TABLE IF NOT EXISTS people(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
email TEXT,
country TEXT,
dob TEXT
);

--change films ids reference to new table people
CREATE TABLE IF NOT EXISTS films (
 	id SERIAL PRIMARY KEY,
 	title TEXT NOT NULL,
 	director_id INTEGER NOT NULL,
 		CONSTRAINT fk_director
 		FOREIGN KEY(director_id)
 		REFERENCES people(id),
 	star_id INTEGER NOT NULL,
 		CONSTRAINT fk_star
 		FOREIGN KEY(star_id)
 		REFERENCES people(id),
 	writer_id INTEGER NOT NULL,
 		CONSTRAINT fk_writer
 		FOREIGN KEY(writer_id)
 		REFERENCES people(id),
 	year INTEGER,
 	genre TEXT,
 	score FLOAT
);

--insert data to new people and films

--insert directors
INSERT INTO people (Name, Country)
VALUES
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
--insert stars
INSERT INTO people (Name, DOB)
VALUES
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
--insert writers
INSERT INTO people (Name, Email)
VALUES
('Arthur C Clarke', 'arthur@clarke.com'),
('Harper Lee', 'harper@lee.com'),
('Boris Pasternak', 'boris@boris.com'),
('Frederick Frank', 'fred@frank.com'),
('Erik Hazelhoff Roelfzema', 'erik@roelfzema.com'),
('Edmond Rostand', 'edmond@rostand.com');
--update people that are directors and writers
UPDATE people SET email='george@email.com' WHERE name='George Lucas';
UPDATE people SET email='james@cameron.com' WHERE name='James Cameron';
UPDATE people SET email='theo@angelopoulos.com' WHERE name='Theodoros Angelopoulos';
UPDATE people SET email='email@email.com' WHERE name='Krzysztof Kieslowski';



--insert films with new ids from people table
INSERT INTO films (Title, director_id, star_id, writer_id, Year, Genre, Score)
VALUES
('2001: A Space Odyssey', 1, 11, 21, 1968, 'Science Fiction', 10),
('Star Wars: A New Hope', 2, 12, 2, 1977, 'Science Fiction', 7),
('To Kill A Mockingbird', 3, 13, 22, 1962, 'Drama', 10),
('Titanic', 4, 14, 4, 1997, 'Romance', 5),
('Dr Zhivago', 5, 15, 23, 1965, 'Historical', 8),
('El Cid', 6, 16, 24, 1961, 'Historical', 6),
('Voyage to Cythera', 7, 17, 7, 1984, 'Drama', 8),
('Soldier of Orange', 8, 18, 25, 1977, 'Thriller', 8),
('Three Colours: Blue', 9, 19, 9, 1993, 'Drama', 8),
('Cyrano de Bergerac', 10, 20, 26, 1990, 'Historical', 9);