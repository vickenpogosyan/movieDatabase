-- a) List all directors who were born in Canada.
SELECT d.first_name, d.surname
FROM "Director" d
JOIN "BirthLocation" b ON d."id_BirthLocation" = b.id
WHERE b.country = 'Canada';

-- b) Which movies are directed by David Lynch?
SELECT "Movie".title
FROM "Director"
JOIN "Movie" ON "Director"."id_Movie" = "Movie".id
WHERE "Director".first_name = 'David' AND "Director".surname = 'Lynch';

-- c) List all the actors who played in the movies for which the cost of production was more than $1M. Compute cost in other currencies
SELECT 
    "Actor".first_name,
    "Actor".surname,
    "Movie".title,
    "Movie".budget AS usd_budget,
    ROUND("Movie".budget::numeric * 1.37, 2) AS cad_budget,
    "Movie".budget * 153 AS jpy_budget,
    "Movie".budget * 92 AS rub_budget,
    "Movie".budget * 0.91 AS eur_budget,
    "Movie".budget * 0.88 AS chf_budget
FROM "Actor"
JOIN "MovieActor" ON "Actor".id = "MovieActor"."id_Actor"
JOIN "Movie" ON "MovieActor"."id_Movie" = "Movie".id
WHERE "Movie".budget > 1000000;

-- d) Using operator LIKE find all the directors whose surname start with letter “A” and “D”.
SELECT first_name, surname
FROM "Director"
WHERE surname LIKE 'A%' OR surname LIKE 'D%';

-- e) Find all the comedy movies in which there is a playing actor who is less than 40 (age).
SELECT DISTINCT "Movie".title
FROM "Movie"
JOIN "MovieActor" ON "Movie".id = "MovieActor"."id_Movie"
JOIN "Actor" ON "MovieActor"."id_Actor" = "Actor".id
JOIN "MovieGenre" ON "Movie".id = "MovieGenre"."id_Movie"
JOIN "Genre" ON "MovieGenre"."id_Genre" = "Genre".id
WHERE "Genre".type = 'Comedy' AND (2025 - "Actor".year_of_birth) < 40;

-- f) Find all the pairs of actors who have blue eye color. Produce pairs in alphabetic order, e.g., (Howard before Lynch) and do not produce pairs like (Lynch, Lynch)
SELECT a1.first_name, a1.surname, a2.first_name, a2.surname
FROM "Actor" a1, "Actor" a2
WHERE a1.eye_color = 'Blue' AND a2.eye_color = 'Blue'
  AND (
        a1.surname < a2.surname
        OR (a1.surname = a2.surname AND a1.first_name < a2.first_name)
      )
ORDER BY a1.surname, a1.first_name, a2.surname, a2.first_name;
