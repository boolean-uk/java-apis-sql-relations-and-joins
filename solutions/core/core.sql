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
			references Director(id),
	constraint fk_star
		foreign key(star_id)
			references Star(id),
	constraint fk_writer
		foreign key(writer_id)
			references Writer(id)


);

create table Director(
	id serial primary key,
	name text,
	country text

);

create table Star(
	id serial primary key,
	name text,
	dob text

);

create table Writer(
	id serial primary key,
	name text,
	email text

);
--Show the title and director name for all films
select title, name as director_name from Film join Director on Film.director_id = Director.id;

--Show the title, director and star name for all films
select title, Director.name as director_name, Star.name as star_name from Film join Director on Film.director_id = Director.id join Star on Film.star_id = Star.id;

--Show the title of films where the director is from the USA
select title from Film join Director on Film.director_id = Director.id where Director.country = 'USA';

--Show only those films where the writer and the director are the same person
select title from Film join Director on Film.director_id = Director.id join Writer on Film.writer_id = Writer.id where Director.name = Writer.name;

--Show directors and film titles for films with a score of 8 or higher
select name as director_name, title from Film join Director on Film.director_id = Director.id where score >= 8;

--Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.

select title, Director.name as director_name, Star.name as star, Writer.name as writer_name  from Film join Director on Film.director_id = Director.id join Star on Film.star_id = Star.id join Writer on Film.writer_id = Writer.id;


select title, name as director_name, year from Film join Director on Film.director_id = Director.id order by year;

select title, name as director_name, score from Film join Director on Film.director_id = Director.id order by score;

select title from Film join Director on Film.director_id = Director.id join Writer on Film.writer_id = Writer.id where Director.name not like Writer.name;

select title from Film join Director on Film.director_id = Director.id where Director.country != 'USA';
