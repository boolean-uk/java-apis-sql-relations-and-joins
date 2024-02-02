-- 1
SELECT film_title, name AS director FROM film
    JOIN role ON film_id = film.id
    JOIN person ON person_id = person.id
    WHERE role_type ILIKE 'director';

-- 2
SELECT film_title, director.name, actor.name AS actor FROM film
	JOIN role AS director_role ON film.id = director_role.film_id 
        AND director_role.role_type ILIKE 'director'
	JOIN person AS director ON director_role.person_id = director.id
	LEFT JOIN role AS star_role ON film.id = star_role.film_id 
        AND star_role.role_type ILIKE 'actor'
	LEFT JOIN person AS actor ON star_role.person_id = actor.id;

-- 3
SELECT film_title FROM film
	JOIN role ON film.id = film_id 
        AND role_type ILIKE 'director'
	JOIN person ON person_id = person.id
	WHERE person.country = 'USA';

-- 4
SELECT film_title FROM film
	JOIN role AS director_role ON film.id = director_role.film_id 
        AND director_role.role_type ILIKE 'director'
	JOIN role AS writer_role ON film.id = writer_role.film_id 
        AND writer_role.role_type ILIKE 'writer'
	JOIN person AS director ON director_role.person_id = director.id
	JOIN person AS writer ON writer_role.person_id = writer.id
	WHERE director.id = writer.id;

-- 5
SELECT film_title, director.name, film_score FROM film
	JOIN role AS director_role ON film.id = director_role.film_id 
        AND director_role.role_type ILIKE 'director'
	JOIN person AS director ON director_role.person_id = director.id
	WHERE film_score > 7
    ORDER BY film_score DESC;

-- 6
-- Get amount of directors from usa
SELECT COUNT(*) AS directors_from_usa FROM role
    JOIN person ON person.id = person_id 
        AND role.role_type ILIKE 'director' 
        AND person.country ILIKE 'usa';

-- List all writers and their movies that released aftr 1950. Newest movies first
SELECT person.name AS writer, film_title, film_year FROM film
    JOIN role AS writer_role ON film.id = writer_role.film_id 
        AND writer_role.role_type ILIKE 'writer'
    JOIN person ON writer_role.person_id = person.id
    WHERE film_year > 1950
    ORDER BY film_year DESC;

-- list actors with films in alphabetical order by actor name
SELECT person.name AS actor, film_title FROM film
	JOIN role AS actor_role ON film.id = actor_role.film_id 
  	    AND actor_role.role_type ILIKE 'actor'
	JOIN person ON actor_role.person_id = person.id
	ORDER BY actor;

-- list actors by their age when their movie released
SELECT person.name AS actor, film.film_title, film.film_year - EXTRACT(YEAR FROM person.birthdate) AS age_at_release FROM film
    JOIN role AS actor_role ON film.id = actor_role.film_id 
        AND actor_role.role_type ILIKE 'Actor'
    JOIN person ON actor_role.person_id = person.id
    ORDER BY age_at_release;

-- list all writers who does not have a country (aka they are not writers and directos in this case)
SELECT person.name AS writer_without_country FROM role AS role
	LEFT JOIN person ON role.person_id = person.id
	WHERE role_type ILIKE 'writer' 
  	AND person.country IS NULL;
