INSERT INTO "BirthLocation" (country, city, state)
VALUES
('Canada', 'Toronto', 'Ontario'),
('Canada', 'Vancouver', 'British Columbia'),
('USA', 'Los Angeles', 'California'),
('UK', 'London', 'England'),
('France', 'Paris', 'Ile-de-France');

INSERT INTO "Movie" (title, release_time, date, rating, budget, gross)
VALUES
('Blue Fire', '00:00', '2005-04-22', 6, 300000, 2000000),
('Echo', '00:00', '2003-08-19', 7, 550000, 4000000),
('Dusk', '00:00', '2022-12-07', 9, 7500000, 30000000),
('Broken', '00:00', '2021-01-12', 6, 700000, 1500000),
('Fall of a City', '00:00', '2009-05-25', 8, 450000, 5000000),
('Beautiful Mind', '00:00', '2016-09-15', 8, 600000, 8000000),
('The Notebook', '02:00', '2004-06-25', 8, 29000000, 115000000),
('The Vow', '01:00', '2012-02-10', 7, 30000000, 196000000);  

INSERT INTO "University" (name, is_private, color)
VALUES
('York University', FALSE, 'Red'),
('University of Toronto', FALSE, 'Blue'),
('Toronto Metropolitan University', FALSE, 'Gold'),
('Harvard', TRUE, 'Crimson'),
('Yale University', TRUE, 'Blue');

INSERT INTO "Director"
(first_name, surname, year_of_birth, "id_BirthLocation", "id_Movie", "id_University")
VALUES
('David', 'Lynch', 1963, 1, 1, 1),
('Sashah', 'Angel',  1981, 3, 2, 3),
('Mark', 'Holland', 1946, 5, 3, 2),
('Alex', 'Donavitch', 1978, 2, 4, 5),
('Johnny', 'Lopez', 1969, 4, 5, 4),
('Ron', 'Howard', 1960, 1, 6, 2),
('Nick', 'Cassavetes', 1959, 2, 7, 2),
('Michael', 'Sucsy', 1973, 2, 8, 2);   

INSERT INTO "Actor"
(first_name, surname, year_of_birth, "id_BirthLocation", eye_color)
VALUES
('Tony', 'Hew', 1956, 1, 'Blue'),
('Elizabeth', 'Stan', 1990, 2, 'Green'),
('Amy', 'Timberly', 1998, 5, 'Brown'),
('Joseph', 'Anthony', 2001, 4, 'Blue'),
('Sali', 'Doltri', 1973, 3, 'Blue'),
('Brad', 'Pitt', 1963, 2, 'Blue'),
('Ryan', 'Gosling', 1980, 1, 'Brown'),         
('Rachel', 'McAdams', 1978, 1, 'Hazel'), 
('Channing', 'Tatum', 1980, 2, 'Green');    

INSERT INTO "Department" ("id_University", name)
VALUES
(1, 'Engineering'),
(2, 'Law'),
(3, 'Business'),
(4, 'Psychology'),
(5, 'Film Studies');

INSERT INTO "MovieActor" ("id_Movie", "id_Actor")
VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 6),
(3, 4),
(3, 5),
(4, 6),
(6, 1),
(6, 2),
(6, 3),
(7, 7),   
(7, 8),
(8, 9),    
(8, 8);

INSERT INTO "Genre" (type)
VALUES
('Romance'),
('Comedy'),
('Action'),
('Thriller'),
('Horror');

INSERT INTO "MovieGenre" ("id_Movie", "id_Genre")
VALUES
(1, 3),
(2, 1),
(3, 4),
(4, 1),
(5, 2),
(6, 3),
(7, 5),
(8, 5);   

INSERT INTO "Cinema" (cinema_name, location, type)
VALUES
('Scotiabank Theatre', 'Toronto', 'IMAX'),
('Marine Gateway', 'Vancouver', 'VIP'),
('TCL Chinese Theatre', 'Los Angeles', 'Standard'),
('Electric Cinema', 'London', 'Standard'),
('Pathe La Villette', 'Paris', '4D');

INSERT INTO "Ticket" (price, "id_Cinema")
VALUES
(25.00, 1),
(21.00, 2),
(45.00, 3),
(32.50, 4),
(16.99, 5);

INSERT INTO "ShowTime"
(show_name, show_time, show_duration, "id_Cinema_Ticket", "id_Movie")
VALUES
('Blue Fire Night', '19:30', 140, 1, 1),
('Echo Evening', '20:00', 120, 2, 2),
('Dusk Late', '21:30', 130, 3, 3),
('Broken Matinee', '17:30', 100, 4, 4),
('Fall of a City Premiere', '18:45', 135, 5, 5);

INSERT INTO "Award" (award_name, "id_Movie")
VALUES
('Oscars', 1),
('Golden Globes', 2),
('Toronto International Film Festival (TIFF) Awards', 3),
('Global Award', 3),
('Critics Award', 5);

INSERT INTO "Category" (category_name, "award_id_Award", "id_Movie_Award")
VALUES
('Best Director', 1, 1),
('Best actor', 2, 2),
('Best Costume Design', 3, 3),
('Best Original Score', 4, 3),
('Best Picture', 5, 3);
