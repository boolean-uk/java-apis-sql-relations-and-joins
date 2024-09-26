create table casts (
id serial primary key,
film_id int,
actor_id int,
foreign key (film_id) references films(id),
foreign key (actor_id) references actors(people_id)
)

insert into casts (film_id, actor_id) (
values
(1,2),
(1,3),
(1,4),
(2,3),
(2,4),
(2,5),
(2,6),
(4,5),
(4,6),
(4,7),
(4,8),
(6,7),
(6,8),
(6,9),
(6,10)
)