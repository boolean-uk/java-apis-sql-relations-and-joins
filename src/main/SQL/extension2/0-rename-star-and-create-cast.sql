ALTER TABLE star RENAME TO actor;
-- create the cast table
CREATE TABLE IF NOT EXISTS "cast" (
    cast_id SERIAL PRIMARY KEY,
    film_id INT,
    actor_id INT,
    FOREIGN KEY (film_id) REFERENCES film(id),
    FOREIGN KEY (actor_id) REFERENCES actor(id)
);
-- as a design choice i want to keep the star of the film inside the film and the cast table will contain only other relevant cast.
-- fill the cast table with entries that don't make much sense, reusing previous actors.
INSERT INTO "cast"
(film_id,actor_id)
VALUES
(1,2),
(1,6),
(2,1),
(3,7),
(3,6),
(4,8),
(5,10),
(6,10),
(7,1),
(8,3),
(9,10),
(9,3),
(10,1),
(10,2);
-- since each films contains it's "star" actor, the cast table will contain all but the star actor (as a design choice)
-- after the above query, the cast table will contain movies and their cast actors, all of which are reused from the actors table.
-- to see the result of the above query we need to do:
SELECT film.title AS film_name, person.name AS actor_name
FROM "cast", person, film, actor
WHERE film.id = "cast".film_id AND actor.person_id = person.id AND "cast".actor_id = actor.id