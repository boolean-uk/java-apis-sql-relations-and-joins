CREATE TABLE film_cast (
    cast_id SERIAL PRIMARY KEY,
    film_id INTEGER REFERENCES films(film_id),
    actor_id INTEGER REFERENCES people(person_id)
);

INSERT INTO people (name)
VALUES
    ('Harrison Ford'),
    ('Carrie Fisher'),
    ('Liam Neeson'),
    ('Natalie Portman'),
    ('Meryl Streep'),
    ('Tom Hanks');

-- Link actors to films
INSERT INTO film_cast (film_id, actor_id)
VALUES
    (2, 27),
    (2, 28),
    (4, 29),
    (4, 30),
    (7, 31),
    (8, 32);


-- DEMO QUERIES:

-- List actors in films
SELECT
  films.title,
  star.name AS star_name,
  COALESCE(STRING_AGG(people.name, ', '), 'Unknown') AS "cast"
FROM films
LEFT JOIN film_cast ON films.film_id = film_cast.film_id
LEFT JOIN people ON film_cast.actor_id = people.person_id
LEFT JOIN people AS star ON films.star_id = star.person_id
GROUP BY films.title, star.name
ORDER BY films.title;

-- List films in which an actor appeared
SELECT films.title
FROM films
INNER JOIN film_cast ON films.film_id = film_cast.film_id
INNER JOIN people ON film_cast.actor_id = people.person_id
WHERE people.name = 'Harrison Ford';