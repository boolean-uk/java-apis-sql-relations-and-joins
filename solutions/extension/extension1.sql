create table People (
    id SERIAL primary key,
    name text,
    dob text,
    country text,
    email text,
    role text check (role in('star','writer','director'))
);

create table Film(
	id serial primary key,
	title text unique,
	year int,
	genre text,
	score int,
	director_id int,
	star_id int,
	writer_id int,
	constraint fk_director
		foreign key(director_id)
			references People(id),
	constraint fk_star
		foreign key(star_id)
			references People(id),
	constraint fk_writer
		foreign key(writer_id)
			references People(id)
);


--Show the title and director name for all films
select title, name as director_name from Film join People on Film.director_id = People.id where role = 'director';

-- Show the title, director, star, and writer name for all films
select title, Director.name as director_name, Star.name as star_name
from Film join People as Director
on Film.director_id = Director.id and Director.role = 'director'
join People as Star
on Film.star_id = Star.id and Star.role = 'star';

--Show the title of films where the director is from the USA
select title, name as director_name
from Film join People on Film.director_id = People.id
where country = 'USA';

--Show only those films where the writer and the director are the same person
select title
from Film join People as Director
on Film.director_id = Director.id and Director.role = 'director'
join People as writer
on Film.writer_id = Writer.id and Writer.role ='writer'
where Director.name = Writer.name;

--Show directors and film titles for films with a score of 8 or higher
select title, name as director_name
from Film join People
on Film.director_id = People.id and score >= 8;

--Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.

--select title, Director.name as director_name, Star.name as star, Writer.name as writer_name  from Film join Director on Film.director_id = Director.id join Star on Film.star_id = Star.id join Writer on Film.writer_id = Writer.id;
select title, Director.name as director_name, Star.name as star_name, Writer.name as writer_name
from Film join People as Director
on Film.director_id = Director.id
join People as Star
on Film.star_id = Star.id
join People as Writer
on Film.writer_id = Writer.id;

--select title, name as director_name, year from Film join Director on Film.director_id = Director.id order by year;
select title, name as director_name, year from Film join People on Film.director_id = People.id order by year;

--select title, name as director_name, score from Film join Director on Film.director_id = Director.id order by score;
select title, name as director_name, score from Film join People on Film.director_id = People.id order by score;

--select title from Film join Director on Film.director_id = Director.id join Writer on Film.writer_id = Writer.id where Director.name not like Writer.name;
select title, Director.name as director_name, Writer.name as writer_name
from Film join People as Director
on Film.director_id = Director.id
join People as Writer
on Film.writer_id = Writer.id
where Director.name != Writer.name;

--select title from Film join Director on Film.director_id = Director.id where Director.country != 'USA';
select title from Film join People on Film.director_id = People.id and People.country != 'USA';










