-- 1)In the dvdrental database write a query to select all the columns from the “customer” table.

select * from customer;

--2)Write a query to display the names (first_name, last_name) using an alias named “full_name”.

select first_name ||' '|| last_name as full_name from customer;

--3)Lets get all the dates that accounts were created. Write a query to select all the create_date from the “customer” table (there should be no duplicates).

SELECT DISTINCT create_date FROM customer;

--4)Write a query to get all the customer details from the customer table, it should be displayed in descending order by their first name.

select * from customer order by first_name;

--5)Write a query to get the film ID, title, description, year of release and rental rate in ascending order according to their rental rate.

select
    film_id,
    title,
    description,
    release_year,
    rental_rate
from film
order by rental_rate;

--Write a query to get the address, and the phone number of all customers living in the Texas district, these details can be found in the “address” table.

select
    address,
    address2,
    phone
from customer
    INNER join address on customer.address_id = address.address_id
WHERE
    address.district = 'Texas' -- 7) Write a query to retrieve all movie details where the movie id is either 15 or 150.
SELECT *
FROM film
WHERE
    film.film_id = 15
    OR film.film_id = 150;

/*
 8) Write a query which should check if your favorite movie exists in the database. 
 Have your query get the film ID, title, description, length and the rental rate, 
 these details can be found in the “film” table.
 */

SELECT
    film.film_id,
    film.title,
    film.description,
    film.length,
    film.rental_rate
FROM film
WHERE film.title = 'Heroes';

/*
 9) No luck finding your movie? Maybe you made a mistake spelling the name. 
 Write a query to get the film ID, title, description, 
 length and the rental rate of all the movies starting with the two first letters of your favorite movie.
 */

SELECT
    film.film_id,
    film.title,
    film.description,
    film.length,
    film.rental_rate
FROM film
WHERE film.title LIKE 'He%';

-- 10) Write a query which will find the 10 cheapest movies.

SELECT * FROM film ORDER BY film.rental_rate LIMIT 10;

-- 11) Not satisfied with the results. Write a query which will find the next 10 cheapest movies.

SELECT * FROM film ORDER BY film.rental_rate LIMIT 10 OFFSET 10;

/*
 12) Write a query which will join the data in the customer table and the payment table. 
 You want to get the first name and last name from the curstomer table, 
 as well as the amount and the date of every payment made by a customer, 
 ordered by their id (from 1 to…).
 */

SELECT
    c.first_name,
    c.last_name,
    p.amount,
    p.payment_date
FROM customer c
    INNER JOIN payment p ON p.customer_id = c.customer_id
ORDER BY c.customer_id;

/*
 13) You need to check your inventory. Write a query to get all the movies which are not in inventory.
 */

SELECT *
FROM film
    LEFT JOIN inventory ON inventory.film_id = film.film_id
WHERE inventory.film_id IS NULL;

-- 14) Write a query to find which city is in which country.

SELECT
    city.city,
    country.country
FROM city
    INNER JOIN country ON country.country_id = city.country_id
    /*
     15) Bonus You want to be able to see how your sellers have been doing? 
     Write a query to get the customer’s id, names (first and last), 
     the amount and the date of payment ordered by the id of the staff member who sold them the dvd.
     */
SELECT
    customer.customer_id,
    customer.first_name || ' ' || customer.last_name AS customer_name,
    film.title,
    payment.amount,
    payment.payment_date,
    staff.first_name || ' ' || staff.last_name AS staff_name
FROM customer
    INNER JOIN payment ON payment.customer_id = customer.customer_id
    INNER JOIN staff ON staff.staff_id = payment.staff_id
    INNER JOIN rental ON rental.customer_id = customer.customer_id
    INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
    INNER JOIN film ON film.film_id = inventory.film_id
ORDER BY staff.staff_id