INSERT INTO Film (film_name, film_genre, film_release_year, film_score, director_id, star_id, writer_id) VALUES
('Inception', 'Sci-Fi', 2010, 9, 1, 1, 1),
('The Godfather', 'Crime', 1972, 9, 2, 2, 2),
('Pulp Fiction', 'Crime', 1994, 8, 3, 3, 3),
('The Dark Knight', 'Action', 2008, 9, 4, 4, 4),
('The Shawshank Redemption', 'Drama', 1994, 10, 5, 5, 5),
('Django Unchained', 'Western', 2012, 8, 3, 3, 3),
('The Departed', 'Crime', 2006, 9, 5, 1, 5),
('Interstellar', 'Sci-Fi', 2014, 9, 1, 1, 5),
('Goodfellas', 'Crime', 1990, 9, 5, 2, 5);

INSERT INTO Director (director_name, director_country) VALUES
('Christopher Nolan', 'UK'),
('Francis Ford Coppola', 'USA'),
('Quentin Tarantino', 'USA'),
('Steven Spielberg', 'USA'),
('Martin Scorsese', 'USA');

INSERT INTO Star (star_name, star_dob) VALUES
('Leonardo DiCaprio', '1974-11-11'),
('Marlon Brando', '1924-04-03'),
('Samuel L. Jackson', '1948-12-21'),
('Christian Bale', '1974-01-30'),
('Morgan Freeman', '1937-06-01');

INSERT INTO Writer (writer_name, writer_email) VALUES
('Christopher Nolan', 'cnolan@example.com'),
('Mario Puzo', 'mpuzo@example.com'),
('Quentin Tarantino', 'qtarantino@example.com'),
('Frank Darabont', 'fdarabont@example.com'),
('Jonathan Nolan', 'jnolan@example.com');
