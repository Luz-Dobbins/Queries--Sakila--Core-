CREATE DATABASE  IF NOT EXISTS `sakila` ;
USE `sakila`;

# 1. What query would you run to get all the customers inside city_id = 312? 
# 	Your query should return the customers' first name, last name, email, address, and city.
SELECT cs.first_name, cs.last_name, cs.email, ad.address, c.city 
FROM customer AS cs, city AS c
JOIN address AS ad
ON c.city_id = ad.city_id
WHERE c.city_id = 312;

# 2. What query would you run to get all comedy films? Note that the genre is called the category in this schema. 
# 	Your query should return film title, description, release year, rating, and special features.
SELECT fl.title, fl.description, fl.release_year, fl.rating, fl.special_features
FROM film AS fl, category AS ca
WHERE ca.name = 'comedy';

# 3. What query would you run to get all the films that Johnny Lollobrigida was in? 
#Your query should return the actor's last name, film title, and release year.
SELECT ac.last_name, fl.title, fl.release_year
FROM film AS fl, actor AS ac
WHERE ac.first_name= 'Johnny' AND ac.last_name = 'Lollobrigida';

# 4. What query would you run to get the first and last names of all the actors in the movie titled "Bingo Talented"?
SELECT ac.first_name, ac.last_name
FROM actor AS ac, film AS fl
WHERE fl.title = 'Bingo Talented';

# 5. What query would you run to get the customer_id associated with all payments greater than twice the average payment amount?
SELECT cs.customer_id, AVG(pay.amount) AS avg_amount
FROM payment as pay
JOIN customer AS cs
ON cs.customer_id = pay.customer_id
GROUP BY customer_id
HAVING avg_amount = 2*'avg_amount';

# 6. What query wouldf you run to list the first and last name of the 5 customers who have the highest number(count) of paymentd?
SELECT cs.first_name, cs.last_name, COUNT(pay.amount) AS num_payments
FROM payment AS pay
JOIN customer AS cs
ON cs.customer_id = pay.customer_id
GROUP BY cs.first_name, cs.last_name
ORDER BY num_payments DESC
LIMIT 5;

