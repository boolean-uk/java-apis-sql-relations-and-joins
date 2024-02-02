-- Create new Cast table with the film_id and actor_id as PK
CREATE TABLE IF NOT EXISTS cast_table (
	film_id INT NOT NULL,
	actor_id INT NOT NULL,
	CONSTRAINT fk_film
		FOREIGN KEY (film_id)
			REFERENCES film(id),
	CONSTRAINT fk_actor
		FOREIGN KEY (actor_id)
			REFERENCES people(id),
	CONSTRAINT pk_cast PRIMARY KEY (film_id, actor_id)
);

-- Cast members of 2001: A Space Odyssey
INSERT INTO people
  (name, dob)
VALUES
  ('Gary Lockwood', '21/02/1937'),
  ('William Sylvester', '31/01/1922');

INSERT INTO cast_table
  (film_id, actor_id)
VALUES
  (1, 27),
  (1, 28);

-- Cast member of Titanic
INSERT INTO people
  (name, dob)
VALUES
  ('Kate Winslet', '05/10/1975');

INSERT INTO cast_table
  (film_id, actor_id)
VALUES
  (4, 29);

-- Cast members of Voyage to Cythera
INSERT INTO people
  (name, dob)
VALUES
  ('Mary Hronopoulou', '16/07/1933'),
  ('Dionysis Papagiannopoulos','12/07/1912'),
  ('Dora Volanaki', '01/01/1915');

INSERT INTO cast_table
  (film_id, actor_id)
VALUES
  (7, 30),
  (7, 31),
  (7,32);

-- Find films with actors in the cast table
SELECT film.title, people.name AS actor
	FROM film
		JOIN cast_table ON film.id = cast_table.film_id
		JOIN people ON cast_table.actor_id = people.id;

-- Count number of actors of each film in the cast table
SELECT film.title, COUNT(cast_table.actor_id) AS actor_count
	FROM film
		JOIN cast_table ON film.id = cast_table.film_id
	GROUP BY film.title
	ORDER BY actor_count;