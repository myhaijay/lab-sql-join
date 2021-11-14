-- 1. List number of films per category.
select f.title, c.name from film as f
join film_category as fc 
on f.film_id = fc.film_id
join category as c on c.category_id = fc.category_id;

-- 2. Display the first and last names, as well as the address, of each staff member.
select s.first_name, s.last_name, a.address from staff as s
join address as a on a.address_id = s.address_id;

-- 3. Display the total amount rung up by each staff member in August of 2005.
select first_name, last_name, sum(amount) as Amount_IN_Aug from payment as p
join staff as s on s.staff_id = p.staff_id
where p.payment_date like "2005-08%" 
group by s.staff_id;


-- 4. List each film and the number of actors who are listed for that film.
select f.title, count(actor_id) as actors from film as f
join film_actor as fa on f.film_id = fa.film_id
-- join actor as a on fa.actor_id = a.actor_id
group by title ;

-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select c.first_name, c.last_name, sum(p.amount) as payment from payment as p
join customer as c on p.customer_id = c.customer_id
group by c.customer_id
order by c.last_name;