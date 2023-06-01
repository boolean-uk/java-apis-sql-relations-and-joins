insert into people
    (name)
values
    ('Stanley Kubrick'),
    ('George Lucas'),
    ('Robert Mulligan'),
    ('David Lean'),
    ('Anthony Mann'),
    ('Theodoros Angelopoulos'),
    ('Paul Verhoeven'),
    ('Jean-Paul Rappeneau'),
    ('Keir Dullea'),
    ('Mark Hamill'),
    ('Gregory Peck'),
    ('Leonardo DiCaprio'),
    ('Julie Christie'),
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
    ('Erik Hazelhoff Roelfzema'),
    ('Krzysztof Kieslowski'),
    ('Edmond Rostand');

insert into directors
    (people_id, country)
values
    (1, 'USA'),
    (2, 'USA'),
    (3, 'USA'),
    (21, 'Canada'),
    (4, 'UK'),
    (5, 'USA'),
    (6, 'Greece'),
    (7, 'Netherlands'),
    (25, 'Poland'),
    (8, 'France');


insert into stars
    (people_id, date_of_birth)
values
    (9, '1936-05-30'),
    (10, '1951-09-25'),
    (11, '1916-04-05'),
    (12, '1974-11-11'),
    (13, '1940-04-13'),
    (14, '1908-08-14'),
    (15, '1944-01-23'),
    (15, '1944-01-23'),
    (16, '1964-03-09'),
    (17, '1948-12-27');


insert into writers
    (people_id, email)
values
    (18, 'arthur@clarke.com'),
    (19, 'george@email.com'),
    (20, 'harper@lee.com'),
    (21, 'james@cameron.com'),
    (22, 'boris@boris.com'),
    (23, 'fred@frank.com'),
    (5, 'theo@angelopoulos.com'),
    (24,'erik@roelfzema.com'),
    (25, 'email@email.com'),
    (26, 'edmond@rostand.com');

-- add more people for cast
insert into people
    (name)
values
    ('Russell Crowe'),
    ('Joaquin Phoenix'),
    ('Clint Eastwood'),
    ('Morgan Freeman'),
    ('Jack Nicholson'),
    ('Al Pacino'),
    ('Marlon Brando'),
    ('Robert De Niro'),
    ('Christian Bale'),
    ('Dustin Hoffman');

insert into casts
    (film_id, people_id)
values
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (2, 5),
    (2, 6),
    (3, 7),
    (3, 8),
    (4, 9),
    (5, 10),
    (6, 3),
    (6, 4),
    (7, 1),
    (8, 2),
    (8, 3),
    (8, 4),
    (9, 7),
    (9, 8),
    (9, 5),
    (9, 6),
    (9, 10),
    (10, 9),
    (10, 8),
    (10, 2);



insert into films
    (title, genre, score, year, star_id, director_id, writer_id)
values
('2001: A Space Odyssey', 'Science Fiction', 10, 1968, 1, 1, 1),
('Star Wars: A New Hope', 'Science Fiction', 7, 1977, 2, 2, 2),
('To Kill A Mockingbird', 'Drama', 10, 1962, 3, 3, 3),
('Titanic', 'Romance', 5, 1997, 4, 4, 4),
('Dr Zhivago', 'Historical', 8, 1965, 5, 5, 5),
('El Cid', 'Historical', 6, 1961, 6, 6, 6),
('Voyage to Cythera', 'Drama', 8, 1984, 7, 7, 7),
('Soldier of Orange', 'Thriller', 8, 1977, 8, 8, 8),
('Three Colours: Blue', 'Drama', 8, 1993, 9, 9, 9),
('Cyrano de Bergerac', 'Historical', 9, 1990, 10, 10, 10);