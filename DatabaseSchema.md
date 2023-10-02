-- films table:

film_id (PK)
title (TEXT)
director_id (FK referencing Director)
writer_id (FK referencing Writer)
star_id (FK referencing Star)
genre (TEXT)
release_year (INTEGER)
score (INTEGER)

-- directors table:
director_id (PK)
name (VARCHAR)
country (VARCHAR)


-- star table:
star_id (PK)
name (VARCHAR)
dob (DATE)

-- writer table:
writer_id (PK)
name (VARCHAR)
email (VARCHAR)
