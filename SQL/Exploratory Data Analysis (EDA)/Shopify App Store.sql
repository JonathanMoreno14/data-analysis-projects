-- Created tables for Dataset ------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- Apps Table
-- id, url, title, developer, developer_link, icon,	rating,	reviews_count, description_raw,	description, tagline, pricing_hint, lastmod
CREATE TABLE apps(
   id VARCHAR(50),
   url VARCHAR(255),
   title TEXT,
   developer TEXT,
   developer_link VARCHAR(255),	
   icon VARCHAR(255),
   rating DECIMAL,	
   reviews_count INTEGER,
   description_raw TEXT,
   description	TEXT,
   tagline TEXT,
   pricing_hint TEXT,
   lastmod DATE	
);


-- Apps Categories Table
-- app_id, category_id
CREATE TABLE apps_categories (
  app_id VARCHAR(50),
  category_id TEXT
);

-- Categories Table
-- id, title
CREATE TABLE categories (
  id VARCHAR(50), 
  title TEXT
);


-- key_benefits Table
-- app_id, title, description
CREATE TABLE key_benefits (
  app_id VARCHAR(50), 
  title TEXT, 
  description TEXT
);


-- pricing_plan_features Table
-- app_id, pricing_plan_id, feature
CREATE TABLE pricing_plan_features (
  app_id VARCHAR(50), 
  pricing_plan_id VARCHAR(50), 
  feature TEXT
);


-- pricing_plans Table
-- id, app_id, title, price
CREATE TABLE pricing_plans (
  id VARCHAR(50), 
  app_id VARCHAR(50), 
  title TEXT, 
  price	TEXT	
);


-- reviews Table
-- app_id, author, rating, posted_at, body, helpful_count, developer_reply, developer_reply_posted_at
CREATE TABLE reviews (
  app_id VARCHAR(50), 
  author TEXT, 
  rating INTEGER, 
  posted_at TEXT, 
  body TEXT, 
  helpful_count INTEGER, 
  developer_reply TEXT, 
  developer_reply_posted_at DATE
);


-- Imported datesets from dekstop -------------------------------
-- apps
COPY apps
FROM 'FILEPATH'
DELIMITER ','
CSV HEADER;

-- apps_categories
COPY apps_categories
FROM 'FILEPATH'
DELIMITER ','
CSV HEADER;

-- categories
COPY categories
FROM 'FILEPATH'
DELIMITER ','
CSV HEADER;


-- key_benefits
COPY key_benefits
FROM 'FILEPATH'
DELIMITER ','
CSV HEADER;


-- pricing_plan_features
COPY pricing_plan_features
FROM 'FILEPATH'
DELIMITER ','
CSV HEADER;


-- pricing_plans
COPY pricing_plans
FROM 'FILEPATH'
DELIMITER ','
CSV HEADER;


-- reviews
COPY reviews
FROM 'FILEPATH'
DELIMITER ','
CSV HEADER;



-- Shows the dataset with Tables
SELECT * FROM apps;
SELECT * FROM apps_categories;
SELECT * FROM categories;
SELECT * FROM key_benefits;
SELECT * FROM pricing_plan_features; 
SELECT * FROM pricing_plans;
SELECT * FROM reviews;




-------- Data Cleaning -------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------- Checking for NULLS --------------------
-- Apps Table
SELECT * FROM apps;
-- id, url, title, developer, developer_link, icon,	rating,	reviews_count, description_raw,	description, tagline, pricing_hint, lastmod
CREATE VIEW v_app_with_nulls_columns AS
SELECT SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS id_nulls,
SUM(CASE WHEN url IS NULL THEN 1 ELSE 0 END) AS url_nulls,
SUM(CASE WHEN title IS NULL THEN 1 ELSE 0 END) AS title_nulls,
SUM(CASE WHEN developer IS NULL THEN 1 ELSE 0 END) AS developer_nulls,
SUM(CASE WHEN developer_link IS NULL THEN 1 ELSE 0 END) AS developer_link_nulls,
SUM(CASE WHEN icon IS NULL THEN 1 ELSE 0 END) AS icon_nulls,
SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS rating_nulls,
SUM(CASE WHEN reviews_count IS NULL THEN 1 ELSE 0 END) AS reviews_count_nulls,
SUM(CASE WHEN description_raw IS NULL THEN 1 ELSE 0 END) AS description_raw_nulls,
SUM(CASE WHEN description IS NULL THEN 1 ELSE 0 END) AS description_nulls,
SUM(CASE WHEN tagline IS NULL THEN 1 ELSE 0 END) AS tagline_nulls,
SUM(CASE WHEN pricing_hint IS NULL THEN 1 ELSE 0 END) AS pricing_hint_nulls,
SUM(CASE WHEN lastmod IS NULL THEN 1 ELSE 0 END) AS lastmod_nulls
FROM apps;

SELECT * FROM v_app_with_nulls_columns;


-- Apps Categories Table
SELECT * FROM apps_categories;
-- app_id, category_id
CREATE VIEW v_apps_categories_columns AS 
SELECT SUM(CASE WHEN app_id IS NULL THEN 1 ELSE 0 END) AS app_id_nulls,
SUM(CASE WHEN category_id IS NULL THEN 1 ELSE 0 END) AS category_id_nulls
FROM apps_categories;

SELECT * FROM v_apps_categories_columns;


-- Categories Table
-- Checked for Nulls 
-- Ther are 9 row with 2 columns there are not Nulls
SELECT * FROM categories;


-- key_benefits Table
SELECT * FROM key_benefits;
-- app_id, title, description
CREATE VIEW v_key_benefits_columns AS 
SELECT  SUM(CASE WHEN app_id IS NULL THEN 1 ELSE 0 END) AS app_id_nulls,
SUM(CASE WHEN title IS NULL THEN 1 ELSE 0 END) AS title_nulls,
SUM(CASE WHEN description IS NULL THEN 1 ELSE 0 END) AS description_nulls
FROM key_benefits;

SELECT * FROM v_key_benefits_columns;


-- pricing_plan_features Table
SELECT * FROM pricing_plan_features; 
-- app_id, pricing_plan_id, feature
CREATE VIEW v_pricing_plan_features_columns AS 
SELECT  SUM(CASE WHEN app_id IS NULL THEN 1 ELSE 0 END) AS app_id_nulls,
SUM(CASE WHEN pricing_plan_id IS NULL THEN 1 ELSE 0 END) AS pricing_plan_id_nulls,
SUM(CASE WHEN feature IS NULL THEN 1 ELSE 0 END) AS feature_nulls
FROM pricing_plan_features; 

SELECT * FROM v_pricing_plan_features_columns;


-- pricing_plans Table
SELECT * FROM pricing_plans;
-- id, app_id, title, price
CREATE VIEW v_pricing_plan_columns AS 
SELECT  SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS id_nulls,
SUM(CASE WHEN app_id IS NULL THEN 1 ELSE 0 END) AS app_id_nulls,
SUM(CASE WHEN title IS NULL THEN 1 ELSE 0 END) AS title_nulls,
SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS price_nulls
FROM pricing_plans;

SELECT * FROM v_pricing_plan_columns;


-- reviews Table
SELECT * FROM reviews;
-- -- app_id, author, rating, posted_at, body, helpful_count, developer_reply, developer_reply_posted_at
CREATE VIEW v_reviews_columns AS 
SELECT SUM(CASE WHEN app_id IS NULL THEN 1 ELSE 0 END) AS app_id_nulls,
SUM(CASE WHEN author IS NULL THEN 1 ELSE 0 END) AS author_nulls,
SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS rating_nulls,
SUM(CASE WHEN posted_at IS NULL THEN 1 ELSE 0 END) AS posted_at_nulls,
SUM(CASE WHEN body IS NULL THEN 1 ELSE 0 END) AS body_nulls,
SUM(CASE WHEN helpful_count IS NULL THEN 1 ELSE 0 END) AS helpful_count_nulls,
SUM(CASE WHEN developer_reply IS NULL THEN 1 ELSE 0 END) AS developer_reply_nulls,
SUM(CASE WHEN developer_reply_posted_at IS NULL THEN 1 ELSE 0 END) AS developer_reply_posted_at_nulls
FROM reviews;

SELECT * FROM v_reviews_columns; 



-- Null Views ---------------------
SELECT * FROM v_app_with_nulls_columns; -- No Nulls
SELECT * FROM v_apps_categories_columns; -- No Nulls
SELECT * FROM v_key_benefits_columns; -- No Nulls
SELECT * FROM v_pricing_plan_features_columns; -- No Nulls
SELECT * FROM v_pricing_plan_columns; -- title_nulls (2251)
SELECT * FROM v_reviews_columns; -- author_nulls (90), body_nulls (161), developer_reply_nulls (509150), developer_reply_posted_at_nulls (509150)


-- Combine Tables with columns that have Nulls
SELECT * FROM pricing_plans;
SELECT * FROM reviews;
-- INNER JOINED pricing_plans & reviews with app_id
SELECT title, author, body, developer_reply, developer_reply_posted_at
FROM pricing_plans INNER JOIN reviews
ON pricing_plans.app_id = reviews.app_id


-- For Analysis there will be no need developer_reply, developer_reply_posted_at, body columns


-------- Exploratory Data Analysis (EDA) -------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
SELECT * FROM apps;
SELECT * FROM apps_categories;
SELECT * FROM categories;
SELECT * FROM key_benefits;
SELECT * FROM pricing_plan_features; 
SELECT * FROM pricing_plans;
SELECT * FROM reviews;


-- Number of Rows ------------------------------------------
SELECT COUNT(*) FROM apps; -- 7341 Rows
SELECT COUNT(*) FROM apps_categories; -- 10164 Rows
SELECT COUNT(*) FROM categories; -- 9 Rows
SELECT COUNT(*) FROM key_benefits; -- 19998 Rows
SELECT COUNT(*) FROM pricing_plan_features; -- 42107 Rows
SELECT COUNT(*) FROM pricing_plans; -- 12201 Rows
SELECT COUNT(*) FROM reviews; -- 640633 Rows

-- Maximum & Minimum Values ------------------------------------------
-- Key benefits
SELECT MIN(title), description
FROM key_benefits
GROUP BY title, description
ORDER BY title ASC
LIMIT 1;

SELECT MAX(title), description
FROM key_benefits
GROUP BY title, description
ORDER BY title DESC
LIMIT 1;

-- Pricing Plan features 
SELECT MIN(feature)
FROM pricing_plan_features
GROUP BY feature
ORDER BY feature ASC
LIMIT 1;

SELECT MAX(feature)
FROM pricing_plan_features
GROUP BY feature
ORDER BY feature DESC
LIMIT 1;


-- Pricing Plans
SELECT MIN(title), MIN(price)
FROM pricing_plans
GROUP BY title, price
ORDER BY title ASC
LIMIT 1;

SELECT MAX(title), MAX(price)
FROM pricing_plans
GROUP BY title, price
ORDER BY title DESC
LIMIT 1;


-- SUM Values ------------------------------------------
SELECT SUM(rating) -- SUM of all ratings 22284.2
FROM apps;

SELECT SUM(rating) -- SUM of ratings with 5.0 = 9845.0
FROM apps
WHERE rating = 5.0; 

------ The reviews_count shows the amount of reviews per application
SELECT id, title, developer, rating, reviews_count, description, tagline, pricing_hint
FROM apps
GROUP BY id, title, developer, rating, reviews_count, description, tagline, pricing_hint
ORDER BY reviews_count DESC
LIMIT 1; 


SELECT title, rating, reviews_count
FROM apps
GROUP BY title, rating, reviews_count 
ORDER BY reviews_count ASC
LIMIT 1;


-- Average Values ------------------------------------------
SELECT AVG(rating) -- 3.0355
FROM apps

SELECT title, rating, AVG(rating)
FROM apps
WHERE rating < 3.0
GROUP BY title, rating


-- Variance and Standard Deviation
SELECT var_samp(rating)
FROM apps;

SELECT stddev_samp(rating)
FROM apps;

-- Coefficeint of Variation
SELECT stddev_samp(rating)/AVG(rating) AS coefficient_of_variation
FROM apps;

