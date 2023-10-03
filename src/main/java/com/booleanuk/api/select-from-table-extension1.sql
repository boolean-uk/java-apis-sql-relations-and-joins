1. Show the title and director name for all films
SELECT title, people.name AS director_name
FROM films
JOIN directors ON films.director_id = directors.id
JOIN people ON directors.person_id = people.id;

2. Show the title, director and star name for all films
SELECT title, directors_people.name AS director_name, stars_people.name AS star_name
FROM films
JOIN directors ON films.director_id = directors.id
JOIN stars ON films.star_id = stars.id
JOIN people AS directors_people ON directors.person_id = directors_people.id
JOIN people AS stars_people ON stars.person_id = stars_people.id;

3. Show the title of films where the director is from the USA
SELECT title
FROM films
JOIN directors ON films.director_id = directors.id
JOIN people ON directors.person_id = people.id
WHERE directors.country = 'USA';

4. Show only those films where the writer and the director are the same person
SELECT title
FROM films
JOIN directors ON films.director_id = directors.id
JOIN writers ON films.writer_id = writers.id
JOIN people AS directors_people ON directors.person_id = directors_people.id
JOIN people AS writers_people ON writers.person_id = writers_people.id
WHERE writers_people.name = directors_people.name;

5. Show directors and film titles for films with a score of 8 or higher
SELECT title, directors_people.name AS director_name
FROM films
JOIN directors ON films.director_id = directors.id
JOIN people AS directors_people ON directors.person_id = directors_people.id
WHERE score >= 8;