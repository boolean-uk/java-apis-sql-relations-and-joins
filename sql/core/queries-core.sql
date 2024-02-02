
SELECT film.title, director.name FROM film JOIN director ON film.directorid = director.directorid GROUP BY title, name;


SELECT film.title, director.name AS directorname, star.name AS starname
FROM film
	JOIN director ON film.directorid = director.directorid
	JOIN star ON film.starid = star.starid
GROUP BY title, directorName, starname;



SELECT film.title AS title FROM film JOIN director ON film.directorid = director.directorid WHERE director.country LIKE 'USA';


SELECT film.title AS title FROM film
	JOIN director ON film.directorid = director.directorid
  JOIN writer ON film.writerid = writer.writerid
WHERE director.name = writer.name;


SELECT director.name AS directorname, film.title as title FROM film
	JOIN director ON film.directorid = director.directorid
WHERE film.score >= 8;



--My queries

--Get films where director name is the same as writer and film is released after 1990 ordered ascendingly
SELECT film.title AS title, writer.name as writername, film.release_year as releaseyear FROM film
	JOIN director ON film.directorid = director.directorid
  JOIN writer ON film.writerid = writer.writerid
WHERE director.name = writer.name AND film.release_year > 1990
GROUP BY writername, releaseyear, title
ORDER BY film.release_year ASC;



--Get movies where the director name is the same as writer
SELECT film.title, director.name, writer.name FROM director, film, writer
WHERE director.name = writer.name
AND film.directorid = director.directorid
AND film.writerid = writer.writerid;



--Check for movies with stars that doesn't contain 0 in date of birth
SELECT film.title, star.name, star.stardob as dateOfBirth FROM film, star
WHERE film.starid = star.starid
AND star.stardob NOT LIKE '%0%';


--Get movies from USA ordered descendingly
SELECT film.title, director.country FROM film, director
WHERE film.directorid = director.directorid
AND director.country LIKE 'USA'
ORDER BY film.title DESC;

--Get movies with release dates before 1980 where the star is born before 1950
SELECT film.title, film.release_year, star.name, star.stardob FROM film, star
WHERE film.starid = star.starid
AND film.release_year < 1980
AND (star.stardob LIKE '________0%'
OR star.stardob LIKE '________1%'
OR star.stardob LIKE '________2%'
OR star.stardob LIKE '________3%'
OR star.stardob LIKE '________4%'
AND (star.stardob LIKE '_________1%')
OR star.stardob LIKE '_________2%'
OR star.stardob LIKE '_________3%'
OR star.stardob LIKE '_________4%'
OR star.stardob LIKE '_________5%'
OR star.stardob LIKE '_________6%'
OR star.stardob LIKE '_________7%'
OR star.stardob LIKE '_________8%'
OR star.stardob LIKE '_________9%');





