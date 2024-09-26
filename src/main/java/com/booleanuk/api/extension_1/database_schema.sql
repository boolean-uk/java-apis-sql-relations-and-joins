create table if not exists people (
    id serial primary key,
    name varchar(50) not null
);

create table if not exists stars (
    id serial primary key,
    date_of_birth date,
    people_id integer,
    constraint fk_people
        foreign key (people_id)
            references people(id)
);

create table if not exists directors (
    id serial primary key,
    country varchar(50) not null,
    people_id integer,
    constraint fk_people
        foreign key (people_id)
            references people(id)
);

create table if not exists writers (
    id serial primary key,
    email varchar(50),
    people_id integer,
    constraint fk_people
        foreign key (people_id)
            references people(id)
);

create table if not exists films (
    id serial primary key,
    title varchar(50) not null,
    genre varchar(50) not null,
    score integer,
    year integer,
    star_id integer,
    director_id integer,
    writer_id integer,
    constraint fk_star
        foreign key (star_id)
            references stars(id),
    constraint fk_director
        foreign key (director_id)
            references directors(id),
    constraint fk_writer
        foreign key (writer_id)
            references writers(id)
);