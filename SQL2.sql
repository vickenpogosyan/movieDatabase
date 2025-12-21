-- a) From table Actors find the average age.
SELECT ROUND(AVG(2025 - year_of_birth), 1) AS avg_age
FROM "Actor";

-- b) Find the number of different countries in which actors from the movie “Beautiful Mind” were born.
SELECT COUNT(DISTINCT "BirthLocation".country) AS country_count
FROM "Actor"
JOIN "MovieActor" ON "Actor".id = "MovieActor"."id_Actor"
JOIN "Movie" ON "MovieActor"."id_Movie" = "Movie".id
JOIN "BirthLocation" ON "Actor"."id_BirthLocation" = "BirthLocation".id
WHERE "Movie".title = 'Beautiful Mind';

-- c) Find the number of actors with green eye color.
SELECT COUNT(*) AS num_green_eyed
FROM "Actor"
WHERE eye_color = 'Green';

-- d) What is the number of movies in which Brad Pitt was playing? 
SELECT COUNT(*) AS movie_count
FROM "MovieActor"
JOIN "Actor" ON "MovieActor"."id_Actor" = "Actor".id
WHERE "Actor".first_name = 'Brad' AND "Actor".surname = 'Pitt';

-- e) Find the minimum, average and maximum budget for each type of movie.
SELECT 
    "Genre".type AS genre,
    MIN("Movie".budget) AS min_budget,
    AVG("Movie".budget) AS avg_budget,
    MAX("Movie".budget) AS max_budget
FROM "Movie"
JOIN "MovieGenre" ON "Movie".id = "MovieGenre"."id_Movie"
JOIN "Genre" ON "MovieGenre"."id_Genre" = "Genre".id
GROUP BY "Genre".type
ORDER BY "Genre".type;

-- f) Find the average rating for each movie which has director born in Toronto or actor with blue eye color.
SELECT "Movie".title, ROUND(AVG("Movie".rating), 2) AS avg_rating
FROM "Movie"
LEFT JOIN "Director" ON "Movie".id = "Director"."id_Movie"
LEFT JOIN "BirthLocation" ON "Director"."id_BirthLocation" = "BirthLocation".id
LEFT JOIN "MovieActor" ON "Movie".id = "MovieActor"."id_Movie"
LEFT JOIN "Actor" ON "MovieActor"."id_Actor" = "Actor".id
WHERE "BirthLocation".city = 'Toronto' OR "Actor".eye_color = 'Blue'
GROUP BY "Movie".title;

-- g) Find all the movies that have actors born in at least two different countries.
SELECT "Movie".title
FROM "Movie"
JOIN "MovieActor" ON "Movie".id = "MovieActor"."id_Movie"
JOIN "Actor" ON "MovieActor"."id_Actor" = "Actor".id
JOIN "BirthLocation" ON "Actor"."id_BirthLocation" = "BirthLocation".id
GROUP BY "Movie".title
HAVING COUNT(DISTINCT "BirthLocation".country) >= 2;

-- h) Find how many awards each movie in total has received and rank the movies (display the title) by the amount of awards.
SELECT "Movie".title, COUNT("Award".award_id) AS total_awards
FROM "Movie"
LEFT JOIN "Award" ON "Movie".id = "Award"."id_Movie"
GROUP BY "Movie".title
ORDER BY total_awards DESC;
