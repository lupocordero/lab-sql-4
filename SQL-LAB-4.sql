-- Get film ratings.
select distinct rating from sakila.film;

-- Get release years.
select distinct release_year from sakila.film;

-- Get all films with ARMAGEDDON in the title.
select title from sakila.film
where title regexp 'armageddon';

-- Get all films with APOLLO in the title
select title from sakila.film
where title regexp 'apollo';

-- Get all films which title ends with APOLLO.
select title from sakila.film
where title regexp 'apollo$';

-- Get all films with word DATE in the title.
select title from sakila.film
where title regexp 'date';

-- Get 10 films with the longest title.
select title from sakila.film
ORDER BY LENGTH(title) desc 
LIMIT 10;

-- Get 10 the longest films.
select title, length 
from sakila.film
ORDER BY max(length), 'asc'
Limit 10;

select title from sakila.film
ORDER BY LENGTH(title) desc 
LIMIT 1; -- ARACHNOPHOBIA ROLLERCOASTER


-- How many films include Behind the Scenes content?
select title, special_features from sakila.film
where special_features regexp 'behind';

-- List films ordered by release year and title in alphabetical order.
SELECT film.title, film.release_year
FROM sakila.film
ORDER BY release_year, title;

-- importing new movies from 2020
drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;


show variables like 'local_infile';
set global local_infile = 1;

select * from sakila.films_2020;


select *
from sakila.customer;

select * from staff;

select * from customer
where last_name = 'sanders';

insert into sakila.staff(first_name,last_name,address_id, store_id, username)
values ('Tammy', 'Sanders', 79, 2, 'Tammy');




