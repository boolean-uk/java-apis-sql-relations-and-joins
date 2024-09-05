SELECT f.title, p.name AS director_name
FROM Film f
JOIN People p ON f.director_id = p.person_id;


SELECT f.title,
       pd.name AS director_name,
       ps.name AS star_name
FROM Film f
JOIN People pd ON f.director_id = pd.person_id
JOIN People ps ON f.star_id = ps.person_id;

SELECT f.title
FROM Film f
JOIN People p ON f.director_id = p.person_id
WHERE p.country = 'USA';

SELECT f.title, p.name AS director_writer
FROM Film f
JOIN People p ON f.director_id = p.person_id
WHERE f.director_id = f.writer_id;


SELECT p.name AS director_name, f.title
FROM Film f
JOIN People p ON f.director_id = p.person_id
WHERE f.score >= 8;
