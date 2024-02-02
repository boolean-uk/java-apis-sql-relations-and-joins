-- (1) --
SELECT
    movies.title AS movie_title,
    people.name AS movie_director
		FROM movies
			JOIN directors ON movies.director_id = directors.director_id
			JOIN people ON directors.person_id = people.person_id;

-- (2) --
SELECT
	movies.title AS movie_title,
    director.name AS movie_director,
    star.name AS movie_star
        FROM movies
          JOIN directors ON movies.director_id = directors.director_id
          JOIN people AS director ON directors.person_id = director.person_id
          JOIN stars ON movies.star_id = stars.star_id
          JOIN people AS star ON stars.person_id = star.person_id;

-- (3) --
SELECT
	movies.title AS movie_title,
    people.name AS movie_director,
    people.country AS country
        FROM movies
          JOIN directors ON movies.director_id = directors.director_id
          JOIN people ON directors.person_id = people.person_id
              WHERE people.country = 'USA';

-- (4) --
SELECT
	movies.title AS movie_title,
    people.name AS director_and_writer
        FROM movies
          JOIN directors ON movies.director_id = directors.director_id
          JOIN people AS director_and_writer ON director_and_writer.person_id = directors.person_id
          JOIN writers ON movies.writer_id = writers.writer_id
          JOIN people on people.person_id = writers.person_id
        		WHERE director_and_writer.name = people.name;


-- (5) --
SELECT
    people.name AS director_name,
    movies.title AS movie_title,
    movies.score AS score
			FROM movies
				JOIN people ON movies.director_id = people.person_id
					WHERE movies.score >= 8
          	ORDER BY people.name ASC;
