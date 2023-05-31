-- Show the title and director name for all films
select title, director_name from films, directors where films.director_id = directors.id;

-- Show the title, director and star name for all films
select title, director_name, star_name from films, directors, stars where films.director_id = directors.id and films.star_id = stars.id;

-- Show the title of films where the director is from the USA
select title from films, directors where films.director_id = directors.id and directors.country = 'USA';

-- Show only those films where the writer and the director are the same person
select title 
from films, directors, writers
where 
    films.director_id = directors.id 
    and 
    films.writer_id = writers.id 
    and 
    directors.director_name = writers.writer_name;

-- Show directors and film titles for films with a score of 8 or higher
select director_name, title 
from films, directors
where 
    films.director_id = directors.id 
    and 
    films.score >= 8;


-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.

-- Show directors and film titles for films where the director is from USA and films have a score of 8 or higher


-- Show stars and film titles for films where the star is older than 50 years old


-- Show the email of the writers that are also directors


-- Show stars and film titles where the film is released at least 30 years after the star was born 


-- Show stars for the films that have a score of 9