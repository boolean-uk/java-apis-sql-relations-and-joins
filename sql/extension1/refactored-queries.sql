--i
select films.title, people.name from films
inner join directors on films.director_id = people_id
inner join people on people_id = people.id

--ii
select films.title, a.name as director, b.name as star from films
join people a on films.director_id = a.id
join people b on films.star_id = b.id

--iii
select films.title from films
inner join directors on films.director_id = directors.people_id
where directors.country = 'USA'

--iv
select films.title from films
inner join directors on films.director_id = directors.people_id
inner join writers on films.writer_id = writers.people_id
where directors.people_id = writers.people_id

--v
select people.name as director, films.title as film from films
inner join directors on films.director_id = directors.people_id
inner join people on people_id = people.id
where films.score >= 8

--vi
select people.name from actors
inner join films on films.star_id = actors.people_id
inner join people on people_id = people.id
where genre = 'Drama'

select title ,people.name, country from directors
join films on films.director_id = directors.people_id
inner join people on people_id = people.id
where score < 6

select title ,b.name as star_name, actors.dob, directors.country, a.name as director_name from films
join people a on films.director_id = a.id
join people b on films.star_id = b.id

select title ,b.name as star_name, a.name as director_name, c.name as writer_name, genre from films
join people a on films.director_id = a.id
join people b on films.star_id = b.id
join people c on films.writer_id = c.id
where score > 6 and not genre = 'Drama'

select title, name as writer, year from films
inner join people on films.writer_id = people.id
order by year desc