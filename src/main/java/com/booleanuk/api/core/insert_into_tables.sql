INSERT INTO directors (director_name, director_country) VALUES
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

INSERT INTO stars (star_name, star_dob) VALUES
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


INSERT INTO writers (writer_name, writer_email) VALUES
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


INSERT INTO films (film_name, film_genre, film_release_year, film_score, director_id, star_id, writer_id) VALUES
('2001: A Space Odyssey', 'Science Fiction', 1968, 10,
    (SELECT director_id FROM directors WHERE director_name = 'Stanley Kubrick'),
    (SELECT star_id FROM stars WHERE star_name = 'Keir Dullea'),
    (SELECT writer_id FROM writers WHERE writer_name = 'Arthur C Clarke')),

('Star Wars: A New Hope', 'Science Fiction', 1977, 7,
    (SELECT director_id FROM directors WHERE director_name = 'George Lucas'),
    (SELECT star_id FROM stars WHERE star_name = 'Mark Hamill'),
    (SELECT writer_id FROM writers WHERE writer_name = 'George Lucas')),

('To Kill A Mockingbird', 'Drama', 1962, 10,
    (SELECT director_id FROM directors WHERE director_name = 'Robert Mulligan'),
    (SELECT star_id FROM stars WHERE star_name = 'Gregory Peck'),
    (SELECT writer_id FROM writers WHERE writer_name = 'Harper Lee')),

('Titanic', 'Romance', 1997, 5,
    (SELECT director_id FROM directors WHERE director_name = 'James Cameron'),
    (SELECT star_id FROM stars WHERE star_name = 'Leonardo DiCaprio'),
    (SELECT writer_id FROM writers WHERE writer_name = 'James Cameron')),

('Dr Zhivago', 'Historical', 1965, 8,
    (SELECT director_id FROM directors WHERE director_name = 'David Lean'),
    (SELECT star_id FROM stars WHERE star_name = 'Julie Christie'),
    (SELECT writer_id FROM writers WHERE writer_name = 'Boris Pasternak')),

('El Cid', 'Historical', 1961, 6,
    (SELECT director_id FROM directors WHERE director_name = 'Anthony Mann'),
    (SELECT star_id FROM stars WHERE star_name = 'Charlton Heston'),
    (SELECT writer_id FROM writers WHERE writer_name = 'Frederick Frank')),

('Voyage to Cythera', 'Drama', 1984, 8,
    (SELECT director_id FROM directors WHERE director_name = 'Theodoros Angelopoulos'),
    (SELECT star_id FROM stars WHERE star_name = 'Manos Katrakis'),
    (SELECT writer_id FROM writers WHERE writer_name = 'Theodoros Angelopoulos')),

('Soldier of Orange', 'Thriller', 1977, 8,
    (SELECT director_id FROM directors WHERE director_name = 'Paul Verhoeven'),
    (SELECT star_id FROM stars WHERE star_name = 'Rutger Hauer'),
    (SELECT writer_id FROM writers WHERE writer_name = 'Erik Hazelhoff Roelfzema')),

('Three Colours: Blue', 'Drama', 1993, 8,
    (SELECT director_id FROM directors WHERE director_name = 'Krzysztof Kieslowski'),
    (SELECT star_id FROM stars WHERE star_name = 'Juliette Binoche'),
    (SELECT writer_id FROM writers WHERE writer_name = 'Krzysztof Kieslowski')),

('Cyrano de Bergerac', 'Historical', 1990, 9,
    (SELECT director_id FROM directors WHERE director_name = 'Jean-Paul Rappeneau'),
    (SELECT star_id FROM stars WHERE star_name = 'Gerard Depardieu'),
    (SELECT writer_id FROM writers WHERE writer_name = 'Edmond Rostand'));
