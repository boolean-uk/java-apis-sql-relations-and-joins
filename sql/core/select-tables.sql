select films.title, directors.name as director from films
inner join directors on films.director_id = directors.id

select films.title, directors.name as director, stars.name as star from films
inner join directors on films.director_id = directors.id
inner join stars on films.star_id = stars.id

select films.title from films
inner join directors on films.director_id = directors.id
where directors.country = 'USA'

select films.title from films
inner join directors on films.director_id = directors.id
inner join writers on films.writer_id = writers.id
where directors.name = writers.name

select directors.name as director, films.title as film from films
inner join directors on films.director_id = directors.id
where films.score >= 8