SELECT * FROM films


SELECT title,directors.name AS director
from films
join directors on directorId = directors.id

SELECT title,directors.name AS director,stars.name AS star
from films
join directors on directorId = directors.id
join stars on starId = stars.id

SELECT title,directors.country AS country
from films
join directors on directorId = directors.id
where country = 'USA'

SELECT title,directors.name AS director, writers.name AS writer
from films
join directors on directorId = directors.id
join writers on writerId = writers.id
where writers.name = directors.name

SELECT title,directors.name AS director,score
from films
join directors on directorId = directors.id
where score >7

/*Five more*/
/*Shows the same table in core*/
SELECT films.id,title,directors.name AS director,directors.country AS director_country,
stars.name as star,stars.dob as star_dob,writers.name as writer,writers.email as writer_email,
year,genre,score
from films
join directors on directorId = directors.id
join writers on writerId = writers.id
join stars on starId = stars.id

/*Show actors born before 1940*/
SELECT title,stars.name AS star, stars.dob AS dob
from films
join stars on starId = stars.id
where stars.dob < '1940-01-01'

/* Director countries outside of USA*/
SELECT title,directors.name AS director, directors.country AS country
from films
join directors on directorId = directors.id
where directors.country not like 'USA'

/*A random select that does not want a writer with a in the name,
and not a director with e in its name, and a star without c in its name*/
SELECT title,directors.name AS director, writers.name AS writer,
stars.name as star
from films
join directors on directorId = directors.id
join writers on writerId = writers.id
join stars on starId = stars.id
where writers.name not like '%a%' and directors.name not like '%e'
and stars.name not like '%c'

/*See how old the actor were at the time of release*/
SELECT title,stars.name AS star, stars.dob as year_born,year as movie_year,
(year - EXTRACT(YEAR FROM stars.dob)) AS ageAtRelease
from films
join stars on starId = stars.id