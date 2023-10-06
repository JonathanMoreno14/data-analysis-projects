
-- Creating table ------------------------------------------------------------------------------------------------
-- show_id, type, title, director,	cast, country, date_added, release_year, rating, duration,	listed_in,	description

-- Created table
CREATE TABLE netflix_titles(
    show_id VARCHAR(15),
    type TEXT,
    title TEXT,
    director TEXT,
    "cast" TEXT,
    country TEXT,
    date_added DATE,
    release_year INTEGER,
    rating VARCHAR(15),
    duration VARCHAR(15),
    listed_in TEXT,
    description TEXT
);


-- Imported dateset from dekstop
COPY netflix_titles
FROM 'FILEPATH'
DELIMITER ','
CSV HEADER;


-- Shows the dataset
SELECT * FROM netflix_titles;


-- Data Cleaning -----------------------------

--Checking for NULLS------------
-- SELECT show_id, type, title, director, "cast", country, date_added, rating, duration, listed_in 
SELECT *
FROM netflix_titles;


-- Shows the total rows in the dataset
SELECT COUNT(*) as row_count_table
FROM netflix_titles; -- There are 8807 rows with 10 Columns


-- Checking each individual column for Nulls
SELECT show_id, COUNT(*) FROM netflix_titles WHERE show_id IS NULL GROUP BY show_id;
-- NO NULLs
SELECT type, COUNT(*) FROM netflix_titles WHERE type IS NULL GROUP BY type;
-- No NULLs
SELECT title, COUNT(*) FROM netflix_titles WHERE title IS NULL GROUP BY title;
-- No NULLs
SELECT director, COUNT(*) FROM netflix_titles WHERE director IS NULL GROUP BY director; 
-- 2634 NULLs
SELECT "cast", COUNT(*) FROM netflix_titles WHERE "cast" IS NULL GROUP BY "cast"; 
-- 825 NULLs
SELECT country, COUNT(*) FROM netflix_titles WHERE country IS NULL GROUP BY country;
-- 831 NULLs
SELECT date_added, COUNT(*) FROM netflix_titles WHERE date_added IS NULL GROUP BY date_added;
-- 10 NULLS
SELECT rating, COUNT(*) FROM netflix_titles WHERE rating IS NULL GROUP BY rating;
-- 4 NULLs
SELECT duration, COUNT(*) FROM netflix_titles WHERE duration IS NULL GROUP BY duration;
-- 3 NULLs
SELECT listed_in, COUNT(*) FROM netflix_titles WHERE listed_in IS NULL GROUP BY listed_in;
-- No NULLs


-- Created a View for the columns that contain Nulls
CREATE VIEW v_netflix_titles_with_null_columns AS
SELECT SUM(CASE WHEN director IS NULL THEN 1 ELSE 0 END) AS director_nulls,
SUM(CASE WHEN "cast" IS NULL THEN 1 ELSE 0 END) AS cast_nulls,
SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS country_nulls,
SUM(CASE WHEN date_added IS NULL THEN 1 ELSE 0 END) AS dated_nulls,
SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS rating_nulls,
SUM(CASE WHEN duration IS NULL THEN 1 ELSE 0 END) AS duration_nulls
FROM netflix_titles;


-- Displays 6 columns with the SUM of all Nulls
SELECT * FROM v_netflix_titles_with_null_columns;


-- Using COALESCE to replace null with text ----
SELECT COALESCE(director, 'Unknown') AS director
FROM netflix_titles

SELECT COALESCE("cast", 'Unknown') AS "cast"
FROM netflix_titles

SELECT COALESCE(country, 'Unknown') AS country
FROM netflix_titles


-- Updated the Null values 
UPDATE netflix_titles
SET director = 'Unknown',
    "cast" = 'Unknown',
	country = 'Unknown',
  --  date_added = 0000-00-00,
    rating = 'Unknown',
    duration = 'Unknown'
WHERE NOT (netflix_titles IS NOT NULL)
RETURNING *


-- Updated Date column
-- Displays the MAX & MIN from date_added Column
SELECT MAX(date_added), MIN(date_added)
FROM netflix_titles


UPDATE netflix_titles
SET  date_added = '2008-01-01'
WHERE date_added IS NULL
RETURNING *


-- Checking for Null values
SELECT * FROM v_netflix_titles_with_null_columns;

SELECT show_id, director, date_added 
FROM netflix_titles
WHERE show_id = 's4'
GROUP BY show_id, director, date_added



-- Final Results with updated columns
SELECT *
FROM netflix_titles



-- Checking for Duplicates------------
-- No Duplicates found
SELECT *, COUNT(*) AS counted_duplicates
FROM netflix_titles
GROUP BY GROUPING SETS(show_id, type, title, director,	"cast", country, date_added, 
					   release_year, rating, duration, listed_in,	description);

-- To make sure checked to exclude 
SELECT *, COUNT(*) AS counted_duplicates
FROM netflix_titles
GROUP BY GROUPING SETS(show_id, type, title, director,	"cast", country, date_added, 
					   release_year, rating, duration, listed_in,	description)
HAVING COUNT(*) > 1;


-- Checking the dataset, looking into the rows there is bound to be duplicates such as column Type (Movie, TV Show), Director
-- Country, Dates, Release Year, Ratings, Duration, and Listed_in
-- Will not be removing any duplicates this is due to the fact that some ofthe categories available for the columns tend to be Nominal
-- and Ordinal



-- Data Analysis with Questions -----------------------------------------------------------------------------------

--	Understanding what content is available in different countries ***** DONE
--	Network analysis of Actors / Directors and find interesting insights ***** DONE
--	Does Netflix has more focus on TV Shows than movies in recent years. ***** DONE

--  What type of listed content is frequent in the dataset? **** DONE 
--  What is the least common duration that is utlized for their streaming service? **** DONE
--  What year Where the most releases? **** DONE
--  What rating is the most common among the TV Shows and Movies? ***** DONE


--------------------------- Analysis ------------------------------
SELECT *
FROM netflix_titles;

-- Finding the MAX country, type, releases 
SELECT MAX(country) AS max_country , Max(type) AS max_type, 
MAX(release_year) max_release_year, MAX(rating) AS max_rating
FROM netflix_titles;


-- Country with the most TV Shows & Movies
SELECT country, MAX(type)
FROM netflix_titles
WHERE type = 'TV Show'
GROUP BY country
LIMIT 1;

SELECT country, MAX(type)
FROM netflix_titles
WHERE type = 'Movie'
GROUP BY country
LIMIT 1;



-- What is the least common duration that is utlized for their streaming service?
SELECT DISTINCT MIN(duration) AS min_duration
FROM netflix_titles


-- Finding the most common rating among TV Shows & Movies 
SELECT type, MAX( DISTINCT rating) AS max_rating
FROM netflix_titles
GROUP BY type;


-- Does Netflix focus more on TV Shows than movies in recent years
SELECT DISTINCT DATE_PART('YEAR', date_added) AS year_focused, MAX(type) AS max_type, COUNT(type) AS total_type
FROM netflix_titles
GROUP BY year_focused
ORDER BY year_focused DESC;


--  What type of listed content is frequent in the dataset? 
-- Shows 514 Types of content with total listed content 
SELECT DISTINCT listed_in, COUNT(listed_in) AS total_listed_in, type
FROM netflix_titles
GROUP BY listed_in, type
ORDER BY total_listed_in DESC;



--	Understanding what content is available in different countries 
-- Shows country with content and total of content 
SELECT DISTINCT Country, listed_in, COUNT(listed_in) AS total_listed_in
FROM netflix_titles
GROUP BY country, listed_in
ORDER BY total_listed_in DESC;

-- Country with stand-up comedies
SELECT DISTINCT country, COUNT(listed_in) AS total_standup_comedy 
FROM netflix_titles
WHERE listed_in = 'Stand-Up Comedy'
GROUP BY country 
ORDER BY total_standup_comedy  DESC;



--	Network analysis of Actors / Directors and find interesting insights 
-- 3946 Directors 
SELECT DISTINCT director   
FROM netflix_titles;
-- 5201 Cast
SELECT DISTINCT "cast"
FROM netflix_titles;
-- MAX director, and cast
SELECT MAX(director), MAX("cast")
FROM netflix_titles;


-- Director by country 
SELECT DISTINCT director, country
FROM netflix_titles;

-- Director = cast (32)
SELECT DISTINCT director, "cast", type
FROM netflix_titles
WHERE director = "cast"
AND (director != 'Unknown' AND "cast" != 'Unknown'); 





