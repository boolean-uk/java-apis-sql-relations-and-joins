-- Same ten films, but every id now points into people.
-- Note films 2, 4, 7 and 9: director_id and writer_id are the SAME id.
INSERT INTO films (id, title, director_id, star_id, writer_id, release_year, genre, score, created_at) VALUES
(1, '2001: A Space Odyssey', 1, 11, 21, 1968, 'Science Fiction', 10, CURRENT_TIMESTAMP),
(2, 'Star Wars: A New Hope', 2, 12, 2, 1977, 'Science Fiction', 7, CURRENT_TIMESTAMP),
(3, 'To Kill A Mockingbird', 3, 13, 22, 1962, 'Drama', 10, CURRENT_TIMESTAMP),
(4, 'Titanic', 4, 14, 4, 1997, 'Romance', 5, CURRENT_TIMESTAMP),
(5, 'Dr Zhivago', 5, 15, 23, 1965, 'Historical', 8, CURRENT_TIMESTAMP),
(6, 'El Cid', 6, 16, 24, 1961, 'Historical', 6, CURRENT_TIMESTAMP),
(7, 'Voyage to Cythera', 7, 17, 7, 1984, 'Drama', 8, CURRENT_TIMESTAMP),
(8, 'Soldier of Orange', 8, 18, 25, 1977, 'Thriller', 8, CURRENT_TIMESTAMP),
(9, 'Three Colours: Blue', 9, 19, 9, 1993, 'Drama', 8, CURRENT_TIMESTAMP),
(10, 'Cyrano de Bergerac', 10, 20, 26, 1990, 'Historical', 9, CURRENT_TIMESTAMP);
