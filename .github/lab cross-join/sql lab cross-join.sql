use sakila;
-- Get all pairs of actors that worked together.
select * from (
  select distinct actor_id from sakila.film_actor
) sub1
cross join (
  select distinct film_id from sakila.film
) sub2;

select f.film_id, fa1.actor_id, fa2.actor_id, concat(a1.first_name," ", a1.last_name), concat(a2.first_name," ", a2.last_name)
from film f
    inner join film_actor fa1
    on f.film_id=fa1.film_id
    
    inner join actor a1
    on fa1.actor_id=a1.actor_id
    
    inner join film_actor fa2
    on f.film_id=fa2.film_id
    
    inner join actor a2
    on fa2.actor_id=a2.actor_id   
where f.film_id = 5;


select f.film_id, fa1.actor_id, fa2.actor_id, concat(a1.first_name," ", a1.last_name), concat(a2.first_name," ", a2.last_name)
from film f
    inner join film_actor fa1
    on f.film_id=fa1.film_id
    
    inner join actor a1
    on fa1.actor_id=a1.actor_id
    
    inner join film_actor fa2
    on f.film_id=fa2.film_id
    
    inner join actor a2
    on fa2.actor_id=a2.actor_id   
where f.film_id = 4;


select f.film_id, fa1.actor_id, fa2.actor_id, concat(a1.first_name," ", a1.last_name), concat(a2.first_name," ", a2.last_name)
from film f
    inner join film_actor fa1
    on f.film_id=fa1.film_id
    
    inner join actor a1
    on fa1.actor_id=a1.actor_id
    
    inner join film_actor fa2
    on f.film_id=fa2.film_id
    
    inner join actor a2
    on fa2.actor_id=a2.actor_id   
where f.film_id = 3;

select f.film_id, fa1.actor_id, fa2.actor_id, concat(a1.first_name," ", a1.last_name), concat(a2.first_name," ", a2.last_name)
from film f
    inner join film_actor fa1
    on f.film_id=fa1.film_id
    
    inner join actor a1
    on fa1.actor_id=a1.actor_id
    
    inner join film_actor fa2
    on f.film_id=fa2.film_id
    
    inner join actor a2
    on fa2.actor_id=a2.actor_id   
where f.film_id = 2;

select f.film_id, fa1.actor_id, fa2.actor_id, concat(a1.first_name," ", a1.last_name), concat(a2.first_name," ", a2.last_name)
from film f
    inner join film_actor fa1
    on f.film_id=fa1.film_id
    
    inner join actor a1
    on fa1.actor_id=a1.actor_id
    
    inner join film_actor fa2
    on f.film_id=fa2.film_id
    
    inner join actor a2
    on fa2.actor_id=a2.actor_id   
where f.film_id = 1;

-- Get all pairs of customers that have rented the same film more than 3 times.

SELECT o1.customer_id AS CustomerID1,
       o2.customer_id AS CustomerID2,
       COUNT(*) NºtimesrentalMovies
FROM( (SELECT c.customer_id, f.film_id
        FROM customer AS c
        JOIN rental AS r ON r.customer_id = c.customer_id
        JOIN inventory AS i ON i.inventory_id = r.inventory_id
        JOIN film AS f ON i.film_id = f.film_id
        ) AS o1
        JOIN (SELECT c.customer_id, f.film_id
                FROM customer AS c
                JOIN rental AS r ON r.customer_id = c.customer_id
                JOIN inventory AS i ON i.inventory_id = r.inventory_id
                JOIN film AS f ON i.film_id = f.film_id
    ) AS o2 ON o2.film_id = o1.film_id AND o2.customer_id < o1.customer_id ) 
GROUP BY o1.customer_id, o2.customer_id
ORDER BY COUNT(*) DESC;

-- Get all possible pairs of actors and films.

select fa.actor_id, fc.category_id, count(*) as num_films
from film_actor fa join
     film_category fc
     on fa.film_id = fc.film_id
group by fa.actor_id, fc.category_id; 