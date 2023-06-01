-- Show the title and director name for all films
select title, director.name as directors
from films
join directors on directors.id = films.director_id
join people director on director.id = directors.people_id;

-- Show the title, director and star name for all films
select title, director.name as directors, star.name as stars
from films
join directors on directors.id = films.director_id
join stars on stars.id = films.star_id
join people director on director.id = directors.people_id
join people star on star.id = stars.people_id;

-- Show the title of films where the director is from the USA
select title
from films
join directors on directors.id = films.director_id
where directors.country like 'USA';

-- Show only those films where the writer and the director are the same person
select title
from films
join directors on directors.id = films.director_id
join writers on writers.id = films.writer_id
join people writer on writer.id = writers.people_id
join people director on director.id = directors.people_id
where writer.name = director.name;


-- Show directors and film titles for films with a score of 8 or higher
select title, director.name
from films
join directors on films.director_id = directors.id
join people director on director.id = directors.people_id
where films.score >= 8;


-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.
-- Show directors and film titles for films where the director is from USA and films have a score of 8 or higher
select title, director.name
from films
join directors on directors.id = films.director_id
join people director on director.id = directors.people_id
where directors.country = 'USA' and films.score >= 8;


-- Show stars and film titles for films where the star is older than 50 years old
select title, star.name
from films
join stars on stars.id = films.star_id
join people star on star.id = stars.people_id
where stars.date_of_birth <= '1973-01-01';

-- Show the email of the writers that are also directors
select email
from films
join writers on films.writer_id = writers.id
join directors on films.director_id = directors.id
join people writer on writers.people_id = writer.id
join people director on directors.people_id = director.id
where writer.name = director.name;

-- count the number of movies for each country where the directors are coming from?
select country, count(*)
from films
join directors on films.director_id = directors.id
group by directors.country;


-- Show stars for the films that have a score of 9
select title, star.name
from films
join stars on films.star_id = stars.id
join people star on star.id = stars.people_id
where films.score = 9;