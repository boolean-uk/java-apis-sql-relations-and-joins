--i
select films.title, directors.name as director from films
inner join directors on films.director_id = directors.id

--ii
select films.title, directors.name as director, stars.name as star from films
inner join directors on films.director_id = directors.id
inner join stars on films.star_id = stars.id

--iii
select films.title from films
inner join directors on films.director_id = directors.id
where directors.country = 'USA'

--iv
select films.title from films
inner join directors on films.director_id = directors.id
inner join writers on films.writer_id = writers.id
where directors.name = writers.name

--v
select directors.name as director, films.title as film from films
inner join directors on films.director_id = directors.id
where films.score >= 8

--vi
select name from stars
inner join films on films.star_id = stars.id
where genre = 'Drama'

select title ,name, country from directors
join films on films.director_id = directors.id
where score < 6

select title ,stars.name as star_name, stars.dob, directors.country, directors.name as director_name from directors
join films on films.director_id = directors.id
join stars on films.star_id = stars.id

select title ,stars.name as star_name, directors.name as director_name, writers.name as writer_name, genre from directors
join films on films.director_id = directors.id
join stars on films.star_id = stars.id
join writers on writers.id = films.writer_id
where score > 6 and not genre = 'Drama'

select title, name as writer, year from films
join writers on writers.id = films.writer_id
order by year desc