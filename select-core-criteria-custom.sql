-- Film titles and star names where star is born after 1950
SELECT title
FROM films AS f
INNER JOIN stars AS s
ON f.star_id = s.star_id
WHERE s.birth_date >= '1950-01-01';

-- Writer name and film rating in the drama genre
SELECT w.name, score
FROM films AS f
INNER JOIN writers AS w
ON f.writer_id = w.writer_id
WHERE genre = 'Drama';

-- Film titles whose director is not from the USA and release year is after 1970
SELECT title
FROM films AS f
INNER JOIN directors AS d
ON f.director_id = d.director_id
WHERE d.country != 'USA' AND year > 1970;

-- Writer name and email with either film in Historical or Romance genre
SELECT name, email
FROM writers AS w
INNER JOIN films AS f
ON w.writer_id = f.writer_id
WHERE genre = 'Historical' OR genre = 'Romance';

-- Star name and date of birth in films with score of 9 or higher
SELECT name, birth_date
FROM stars AS s
INNER JOIN films AS f
ON s.star_id = f.star_id
WHERE score >= 9;