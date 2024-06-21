-- 1. Write a SQL query to count the number of characters except for the spaces for each actor. Return the first 10 actors' name lengths along with their names
use mavenmovies

SELECT 
    CONCAT(first_name, ' ', last_name) AS actor_name,
    LENGTH(REPLACE(CONCAT(first_name, last_name), ' ', '')) AS name_length
FROM actor
LIMIT 10;


-- 2.List all Oscar awardees(Actors who received the Oscar award) with their full names and the length of their names

select * from actor_award

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name, 
    LENGTH(CONCAT(first_name, ' ', last_name)) AS name_length,
    awards
FROM actor_award
WHERE awards = 'oscar';


-- 3. Find the actors who have acted in the film ‘Frost Head.’


SELECT actor.first_name, actor.last_name
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
WHERE film.title = 'Frost Head';

-- 4. Pull all the films acted by the actor ‘Will Wilson
SELECT title
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
WHERE concat(actor.first_name, ' ' , actor.last_name )="Will Wilson"

-- 5. Pull all the films which were rented and return them in the month of May

select * from rental
select * from inventory
select * from film


select title
from inventory
join rental on rental.inventory_id = inventory.inventory_id
join film on inventory.film_id = film.film_id
where month(rental.return_date) = 5

-- 5. Pull all the films with ‘Comedy’ category
select * from film
select * from film_category
select * from category

select title
from film
join film_category on film.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
where category.name = "comedy"