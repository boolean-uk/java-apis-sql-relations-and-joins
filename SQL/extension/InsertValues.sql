INSERT INTO people
(name)
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
('George Lucas'),
('Harper Lee'),
('James Cameron'),
('Boris Pasternak'),
('Frederick Frank'),
('Theodoros Angelopoulos'),
('Erik Hazelhoff Roelfzema'),
('Krzysztof Kieslowski'),
('Edmond Rostand')
ON CONFLICT (name) DO NOTHING;


INSERT INTO directors
    (person_id, country)
VALUES
    ((SELECT id FROM people WHERE name = 'Stanley Kubrick'), 'USA'),
    ((SELECT id FROM people WHERE name = 'George Lucas'), 'USA'),
    ((SELECT id FROM people WHERE name = 'Robert Mulligan'), 'USA'),
    ((SELECT id FROM people WHERE name = 'James Cameron'), 'Canada'),
    ((SELECT id FROM people WHERE name = 'David Lean'), 'UK'),
    ((SELECT id FROM people WHERE name = 'Anthony Mann'), 'USA'),
    ((SELECT id FROM people WHERE name = 'Theodoros Angelopoulos'), 'Greece'),
    ((SELECT id FROM people WHERE name = 'Paul Verhoeven'), 'Netherlands'),
    ((SELECT id FROM people WHERE name = 'Krzysztof Kieslowski'), 'Poland'),
    ((SELECT id FROM people WHERE name = 'Jean-Paul Rappeneau'), 'France');
-- let crash if conflict


INSERT INTO writers
    (person_id, email)

VALUES
    ((SELECT id FROM people WHERE name = 'Arthur C Clarke'), 'arthur@clarke.com'),
    ((SELECT id FROM people WHERE name = 'George Lucas'), 'george@email.com'),
    ((SELECT id FROM people WHERE name = 'Harper Lee'), 'harper@lee.com'),
    ((SELECT id FROM people WHERE name = 'James Cameron'), 'james@cameron.com'),
    ((SELECT id FROM people WHERE name = 'Boris Pasternak'), 'boris@boris.com'),
    ((SELECT id FROM people WHERE name = 'Frederick Frank'), 'fred@frank.com'),
    ((SELECT id FROM people WHERE name = 'Theodoros Angelopoulos'), 'theo@angelopoulos.com'),
    ((SELECT id FROM people WHERE name = 'Erik Hazelhoff Roelfzema'), 'erik@roelfzema.com'),
    ((SELECT id FROM people WHERE name = 'Krzysztof Kieslowski'), 'email@email.com'),
    ((SELECT id FROM people WHERE name = 'Edmond Rostand'), 'edmond@rostand.com');


INSERT INTO stars
    (person_id, birthdate)
VALUES
    ((SELECT id FROM people WHERE name = 'Keir Dullea'), '30/05/1936'),
    ((SELECT id FROM people WHERE name = 'Mark Hamill'), '25/09/1951'),
    ((SELECT id FROM people WHERE name = 'Gregory Peck'), '05/04/1916'),
    ((SELECT id FROM people WHERE name = 'Leonardo DiCaprio'), '11/11/1974'),
    ((SELECT id FROM people WHERE name = 'Julie Christie'), '14/04/1940'),
    ((SELECT id FROM people WHERE name = 'Charlton Heston'), '04/10/1923'),
    ((SELECT id FROM people WHERE name = 'Manos Katrakis'), '14/08/1908'),
    ((SELECT id FROM people WHERE name = 'Rutger Hauer'), '23/01/1944'),
    ((SELECT id FROM people WHERE name = 'Juliette Binoche'), '09/03/1964'),
    ((SELECT id FROM people WHERE name = 'Gerard Depardieu'), '27/12/1948');



INSERT INTO films
    (title, director_id, star_id, writer_id, year, genre, score)
VALUES
    ('2001: A Space Odyssey',
        (SELECT person_id FROM directors WHERE person_id = (SELECT id FROM people WHERE name = 'Stanley Kubrick')),
        (SELECT person_id FROM stars WHERE person_id = (SELECT id FROM people WHERE name = 'Keir Dullea')),
        (SELECT person_id FROM writers WHERE person_id = (SELECT id FROM people WHERE name = 'Arthur C Clarke')),
        1968, 'Science Fiction', 10),
    ('Star Wars: A New Hope',
        (SELECT person_id FROM directors WHERE person_id = (SELECT id FROM people WHERE name = 'George Lucas')),
        (SELECT person_id FROM stars WHERE person_id = (SELECT id FROM people WHERE name = 'Mark Hamill')),
        (SELECT person_id FROM writers WHERE person_id = (SELECT id FROM people WHERE name = 'George Lucas')),
        1977, 'Science Fiction', 7),
    ('To Kill A Mockingbird',
        (SELECT person_id FROM directors WHERE person_id = (SELECT id FROM people WHERE name = 'Robert Mulligan')),
        (SELECT person_id FROM stars WHERE person_id = (SELECT id FROM people WHERE name = 'Gregory Peck')),
        (SELECT person_id FROM writers WHERE person_id = (SELECT id FROM people WHERE name = 'Harper Lee')),
        1962, 'Drama', 10),
    ('Titanic',
        (SELECT person_id FROM directors WHERE person_id = (SELECT id FROM people WHERE name = 'James Cameron')),
        (SELECT person_id FROM stars WHERE person_id = (SELECT id FROM people WHERE name = 'Leonardo DiCaprio')),
        (SELECT person_id FROM writers WHERE person_id = (SELECT id FROM people WHERE name = 'James Cameron')),
        1997, 'Romance', 5),
    ('Dr Zhivago',
        (SELECT person_id FROM directors WHERE person_id = (SELECT id FROM people WHERE name = 'David Lean')),
        (SELECT person_id FROM stars WHERE person_id = (SELECT id FROM people WHERE name = 'Julie Christie')),
        (SELECT person_id FROM writers WHERE person_id = (SELECT id FROM people WHERE name = 'Boris Pasternak')),
        1965, 'Historical', 8),
    ('El Cid',
        (SELECT person_id FROM directors WHERE person_id = (SELECT id FROM people WHERE name = 'Anthony Mann')),
        (SELECT person_id FROM stars WHERE person_id = (SELECT id FROM people WHERE name = 'Charlton Heston')),
        (SELECT person_id FROM writers WHERE person_id = (SELECT id FROM people WHERE name = 'Frederick Frank')),
        1961, 'Historical', 6),
    ('Voyage to Cythera',
        (SELECT person_id FROM directors WHERE person_id = (SELECT id FROM people WHERE name = 'Theodoros Angelopoulos')),
        (SELECT person_id FROM stars WHERE person_id = (SELECT id FROM people WHERE name = 'Manos Katrakis')),
        (SELECT person_id FROM writers WHERE person_id = (SELECT id FROM people WHERE name = 'Theodoros Angelopoulos')),
        1984, 'Drama', 8),
    ('Soldier of Orange',
        (SELECT person_id FROM directors WHERE person_id = (SELECT id FROM people WHERE name = 'Paul Verhoeven')),
        (SELECT person_id FROM stars WHERE person_id = (SELECT id FROM people WHERE name = 'Rutger Hauer')),
        (SELECT person_id FROM writers WHERE person_id = (SELECT id FROM people WHERE name = 'Erik Hazelhoff Roelfzema')),
        1977, 'Thriller', 8),
    ('Three Colours: Blue',
        (SELECT person_id FROM directors WHERE person_id = (SELECT id FROM people WHERE name = 'Krzysztof Kieslowski')),
        (SELECT person_id FROM stars WHERE person_id = (SELECT id FROM people WHERE name = 'Juliette Binoche')),
        (SELECT person_id FROM writers WHERE person_id = (SELECT id FROM people WHERE name = 'Krzysztof Kieslowski')),
        1993, 'Drama', 8),
    ('Cyrano de Bergerac',
        (SELECT person_id FROM directors WHERE person_id = (SELECT id FROM people WHERE name = 'Jean-Paul Rappeneau')),
        (SELECT person_id FROM stars WHERE person_id = (SELECT id FROM people WHERE name = 'Gerard Depardieu')),
        (SELECT person_id FROM writers WHERE person_id = (SELECT id FROM people WHERE name = 'Edmond Rostand')),
        1990, 'Historical', 9);
