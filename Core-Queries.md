
    Show the title and director name for all films
SELECT title, director_name
FROM movie
JOIN director
ON director.id = movie.director_id;

//Result
title	                director_name
2001: A Space Odyssey	Stanley Kubrick
Star Wars: A New Hope	George Lucas
To Kill A Mockingbird	Robert Mulligan
Titanic	                James Cameron
Dr Zhivago	            David Lean
El Cid	                Anthony Mann
Voyage to Cythera	    Theodoros Angelopoulos
Soldier of Orange	    Paul Verhoeven
Three Colours: Blue	    Krzysztof Kieslowski
Cyrano de Bergerac	    Jean-Paul Rappeneau

    Show the title, director and star name for all films
SELECT title, director_name, star_name
FROM movie
JOIN director
ON director.id = movie.director_id
JOIN star
ON star.id = movie.star_id;

//Result
title	                director_name	        star_name
2001: A Space Odyssey	Stanley Kubrick	        Keir Dullea
Star Wars: A New Hope	George Lucas	        Mark Hamill
To Kill A Mockingbird	Robert Mulligan	        Gregory Peck
Titanic	                James Cameron	        Leonardo DiCaprio
Dr Zhivago	            David Lean	            Julie Christie
El Cid	                Anthony Mann	        Charlton Heston
Voyage to Cythera	    Theodoros Angelopoulos	Manos Katrakis
Soldier of Orange	    Paul Verhoeven	        Rutger Hauer
Three Colours: Blue	    Krzysztof Kieslowski	Juliette Binoche
Cyrano de Bergerac	    Jean-Paul Rappeneau	    Gerard Depardieu

    Show the title of films where the director is from the USA
SELECT movie.title, director.director_name, country
FROM movie
JOIN director ON director.id = movie.director_id
WHERE director.country = 'USA';

//Result
title	                director_name	    country
2001: A Space Odyssey	Stanley Kubrick	    USA
Star Wars: A New Hope	George Lucas	    USA
To Kill A Mockingbird	Robert Mulligan	    USA
El Cid	                Anthony Mann	    USA

    Show only those films where the writer and the director are the same person
SELECT title, director_name
FROM movie
JOIN director ON director.id = movie.director_id
JOIN writer ON director.director_name = writer.writer_name;

//Result
title	                director_name
Star Wars: A New Hope	George Lucas
Titanic	                James Cameron
Voyage to Cythera	    Theodoros Angelopoulos
Three Colours: Blue	    Krzysztof Kieslowski

    Show directors and film titles for films with a score of 8 or higher
SELECT title, director_name, score
FROM movie
JOIN director ON director.id = movie.director_id
WHERE score >= 8;

title	                director_name	        score
2001: A Space Odyssey	Stanley Kubrick	        10
To Kill A Mockingbird	Robert Mulligan	        10
Dr Zhivago	            David Lean	            8
Voyage to Cythera	    Theodoros Angelopoulos	8
Soldier of Orange	    Paul Verhoeven	        8
Three Colours: Blue	    Krzysztof Kieslowski	8
Cyrano de Bergerac	    Jean-Paul Rappeneau	    9

    Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.

    Show movie title, movie year, star name and date of birth
SELECT title, year, star_name, dateOfBirth
FROM movie
JOIN STAR on star.id = movie.star_id

//Result
title	                year	star_name	        dateofbirth
2001: A Space Odyssey	1968	Keir Dullea	        30/05/1936
Star Wars: A New Hope	1977	Mark Hamill	        25/09/1951
To Kill A Mockingbird	1962	Gregory Peck	    05/04/1916
Titanic	                1997	Leonardo DiCaprio	11/11/1974
Dr Zhivago	            1965	Julie Christie	    14/04/1940
El Cid	                1961	Charlton Heston	    04/10/1923
Voyage to Cythera	    1984	Manos Katrakis	    14/08/1908
Soldier of Orange	    1977	Rutger Hauer	    23/01/1944
Three Colours: Blue	    1993	Juliette Binoche	09/03/1964
Cyrano de Bergerac	    1990	Gerard Depardieu	27/12/1948

    Show movie title, Star name for films that have a score of 8
SELECT title, star_name
FROM movie
JOIN STAR on star.id = movie.star_id
WHERE score = 8;

//Result
title	star_name
Dr Zhivago	Julie Christie
Voyage to Cythera	Manos Katrakis
Soldier of Orange	Rutger Hauer
Three Colours: Blue	Juliette Binoche

    Show the title, writer and director of movies with the genre drama
SELECT title, director_name, writer_name
FROM movie
JOIN director ON movie.director_id = director.id
JOIN writer ON movie.writer_id = writer.id
WHERE genre = 'Drama';

//Result
title	                director_name	        writer_name
To Kill A Mockingbird	Robert Mulligan	        Harper Lee
Voyage to Cythera	    Theodoros Angelopoulos	Theodoros Angelopoulos
Three Colours: Blue	    Krzysztof Kieslowski	Krzysztof Kieslowski

    Show the writers and movie titles of movies where the Director comes from a different country then the USA and the score is lower then a 10
SELECT
title, writer_name
FROM
movie
JOIN director ON movie.director_id = director.id
JOIN writer ON movie.writer_id = writer.id
WHERE director.country != 'USA' AND movie.score < 10;

//Result
title	                writer_name
Titanic	                James Cameron
Dr Zhivago	            Boris Pasternak
Voyage to Cythera	    Theodoros Angelopoulos
Soldier of Orange	    Erik Hazelhoff Roelfzema
Three Colours: Blue	    Krzysztof Kieslowski
Cyrano de Bergerac	    Edmond Rostand

    Show the star name and movie title of movies where the release year is before 1977 and the director country is USA
SELECT
title, star_name
FROM movie
JOIN  director ON movie.director_id = director.id
JOIN star ON movie.star_id = star.id
WHERE movie.year < 1977 AND director.country = 'USA';

//Result
title	                star_name
2001: A Space Odyssey	Keir Dullea
To Kill A Mockingbird	Gregory Peck
El Cid	                Charlton Heston