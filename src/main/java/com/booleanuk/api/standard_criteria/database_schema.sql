create table if not exists stars (
    id serial primary key,
    star_name varchar(50) not null,
    date_of_birth date
);

create table if not exists directors (
    id serial primary key,
    director_name varchar(50) not null,
    country varchar(50) not null
);

create table if not exists writers (
    id serial primary key,
    writer_name varchar(50) not null,
    email varchar(50)
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