USE sakila;

-- Q1 list all actors
SELECT * 
FROM actor;

-- Q2 Find the surname of the actor with the forename 'John'
SELECT
    last_name
FROM actor
WHERE first_name = "John";

-- Q3 Find all actors with surname 'Neeson'
SELECT *
FROM actor
WHERE last_name = "Neeson";

-- Q4 Find all actors with ID numbers divisible by 10
SELECT *
FROM actor
WHERE actor_id % 10 = 0;
-- WHERE mod(actor_id, 10) 0;

-- Q5 What is the description of the movie with an ID of 100
SELECT description
FROM film
WHERE film_id = 100;

-- Q6 Find every R-rated movie
SELECT *
FROM film
WHERE rating = "R";

-- Q7 Find every non-R-rated movie
SELECT *
FROM film
WHERE rating != "R";

-- Q8 Find the ten shortest movies
SELECT *
FROM film
ORDER BY length
LIMIT 10;

-- Q9 Find the movies with the longest runtime, without using LIMIT
SELECT *
FROM film
WHERE length = 185
ORDER BY length DESC;

-- Q10 Find all movies that have deleted scenes
SELECT title, special_features
FROM film
WHERE special_features LIKE "Deleted%";

-- Q11 Using HAVING, reverse-alphabetically list the last names that are not repeated.
SELECT last_name, COUNT(last_name)
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) = 1
ORDER BY last_name DESC;

-- Q12 Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
SELECT last_name, COUNT(last_name) AS frequency
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 1
ORDER BY frequency DESC;

-- Q13 Which actor has appeared in the most films
SELECT 
	a.first_name AS first_name, 
    a.last_name AS last_name,
    COUNT(a.last_name) AS num_of_movies
FROM actor AS a

INNER JOIN film_actor AS fa
ON a.actor_id = fa.actor_id
INNER JOIN film AS f
ON fa.film_id = f.film_id
GROUP BY last_name;



