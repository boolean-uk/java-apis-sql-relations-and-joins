 create table boolean_uk.director(
	director_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(100)
 );
 
 create table boolean_uk.star (
	star_id INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(255) NOT NULL,
    dob VARCHAR(100) 
 );
 
  create table boolean_uk.writter (
	writter_id INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(255) NOT NULL,
    email VARCHAR(255) unique
 );

create table boolean_uk.films (
 film_id INT PRIMARY KEY AUTO_INCREMENT,
 title VARCHAR(255) NOT NULL,
 director_id INT,
 star_id INT,
 writter_id INT,
 genre VARCHAR(255),
 release_year INTEGER,
 score INT CHECK (score >= 0 AND score <= 10),
 FOREIGN KEY (director_id) REFERENCES  boolean_uk.director(director_id),
 FOREIGN KEY (star_id) REFERENCES  boolean_uk.star(star_id),
 FOREIGN KEY (writter_id) REFERENCES  boolean_uk.writter(writter_id)
 );
 
INSERT INTO boolean_uk.director (name, country) VALUES
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

INSERT INTO boolean_uk.star (fullname, dob) VALUES
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

INSERT INTO boolean_uk.writter (fullname, email) VALUES
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

INSERT INTO boolean_uk.films (title, director_id, star_id, writter_id, genre, release_year, score) VALUES
('2001: A Space Odyssey', 1, 1, 1, 'Science Fiction', 1968, 10),
('Star Wars: A New Hope', 2, 2, 2, 'Science Fiction', 1977, 7),
('To Kill A Mockingbird', 3, 3, 3, 'Drama', 1962, 10),
('Titanic', 4, 4, 4, 'Romance', 1997, 5),
('Dr Zhivago', 5, 5, 5, 'Historical', 1965, 8),
('El Cid', 6, 6, 6, 'Historical', 1961, 6),
('Voyage to Cythera', 7, 7, 7, 'Drama', 1984, 8),
('Soldier of Orange', 8, 8, 8, 'Thriller', 1977, 8),
('Three Colours: Blue', 9, 9, 9, 'Drama', 1993, 8),
('Cyrano de Bergerac', 10, 10, 10, 'Historical', 1990, 9);

SELECT f.title, d.name AS director_name
FROM boolean_uk.films f
INNER JOIN boolean_uk.director d ON f.director_id = d.director_id;

SELECT f.title, d.name AS director_name, s.fullname AS star_name
FROM boolean_uk.films f
INNER JOIN boolean_uk.star s ON f.star_id = s.star_id
INNER JOIN boolean_uk.director d ON f.director_id = d.director_id;

SELECT f.title 
FROM boolean_uk.films f
INNER JOIN boolean_uk.director d ON f.director_id = d.director_id AND country= 'USA';

SELECT f.title 
FROM boolean_uk.films f
INNER JOIN boolean_uk.director d ON f.director_id = d.director_id
INNER JOIN boolean_uk.writter w ON f.writter_id = w.writter_id
where d.name = w.fullname;

SELECT f.title, d.name AS director_name
FROM boolean_uk.films f
INNER JOIN boolean_uk.director d ON f.director_id = d.director_id
where f.score >= 8;

select f.title, s.dob AS star_dob
from boolean_uk.films f
INNER JOIN boolean_uk.star s ON f.star_id = s.star_id;

SELECT DISTINCT s.fullname
FROM boolean_uk.films f
INNER JOIN boolean_uk.star s ON f.star_id = s.star_id
WHERE f.genre = 'Drama';

SELECT f.title, w.email AS writer_email
FROM boolean_uk.films f
INNER JOIN boolean_uk.writter w ON f.writter_id = w.writter_id;

SELECT f.title, d.name AS director_name
FROM boolean_uk.films f
INNER JOIN boolean_uk.director d ON f.director_id = d.director_id
WHERE f.release_year > 1990;

SELECT f.title, d.name AS director_name, d.country AS director_country, w.fullname AS writer_name
FROM boolean_uk.films f
INNER JOIN boolean_uk.director d ON f.director_id = d.director_id
INNER JOIN boolean_uk.writter w ON f.writter_id = w.writter_id
WHERE d.country <> 'USA';
