insert into People (name, dob, country, email, role)
values
('Stanley Kubrick', null, 'USA', null, 'director'),
('George Lucas', null, 'USA', null, 'director'),
('Robert Mulligan', null, 'USA', null, 'director'),
('James Cameron', null, 'Canada', null, 'director'),
('David Lean', null, 'UK', null, 'director'),
('Anthony Mann', null, 'USA', null, 'director'),
('Theodoros Angelopoulos', null, 'Greece', null, 'director'),
('Paul Verhoeven', null, 'Netherlands', null, 'director'),
('Krzysztof Kieslowski', null, 'Poland', null, 'director'),
('Jean-Paul Rappeneau', null, 'France', null, 'director'),

('Keir Dullea', '30/05/1936', null, null, 'star'),
('Mark Hamill', '25/09/1951', null, null, 'star'),
('Gregory Peck', '05/04/1916', null, null, 'star'),
('Leonardo DiCaprio', '11/11/1974', null, null, 'star'),
('Julie Christie', '14/04/1940', null, null, 'star'),
('Charlton Heston', '04/10/1923', null, null, 'star'),
('Manos Katrakis', '14/08/1908', null, null, 'star'),
('Rutger Hauer', '23/01/1944', null, null, 'star'),
('Juliette Binoche', '09/03/1964', null, null, 'star'),
('Gerard Depardieu', '27/12/1948', null, null, 'star'),

('Arthur C Clarke', null, null, 'arthur@clarke.com', 'writer'),
('George Lucas', null, null, 'george@email.com', 'writer'),
('Harper Lee', null, null, 'harper@lee.com', 'writer'),
('James Cameron', null, null, 'james@cameron.com', 'writer'),
('Boris Pasternak', null, null, 'boris@boris.com', 'writer'),
('Frederick Frank', null, null, 'fred@frank.com', 'writer'),
('Theodoros Angelopoulos', null, null, 'theo@angelopoulos.com', 'writer'),
('Erik Hazelhoff Roelfzema', null, null, 'erik@roelfzema.com', 'writer'),
('Krzysztof Kieslowski', null, null, 'email@email.com', 'writer'),
('Edmond Rostand', null, null, 'edmond@rostand.com', 'writer');

insert into Film(title, year, genre, score, director_id, star_id, writer_id)
values
('2001: A Space Odyssey',1968,'Science Fiction',10,1,11,21),
('Star Wars: A New Hope',1977,'Science Fiction',7,2,12,22),
('To Kill A Mockingbird',1962,'Drama',10,3,13,23),
('Titanic',1997,'Romance',5,4,14,24),
('Dr Zhivago',1965,'Historical',8,5,15,25),
('El Cid',1961,'Historical',6,6,16,26),
('Voyage to Cythera',1984,'Drama',8,7,17,27),
('Soldier of Orange',1977,'Thriller',8,8,18,28),
('Three Colours: Blue',1993,'Drama',8,9,19,29),
('Cyrano de Bergerac',1990,'Historical',9,10,20,30);