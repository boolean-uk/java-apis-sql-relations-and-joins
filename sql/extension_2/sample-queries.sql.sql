-- Get a film and star name and actors name
SELECT title, ps.name AS star, pa.name AS actor FROM film_cast tb1
JOIN film ON tb1.film_id = film.id
JOIN actor AS fa ON fa.id = tb1.actor_id
JOIN actor AS fs ON fs.id = tb1.star_id
JOIN person AS ps ON ps.id = fs.person_id
JOIN person AS pa ON pa.id = fa.person_id;
-- WHERE film.title = 'Titanic';
