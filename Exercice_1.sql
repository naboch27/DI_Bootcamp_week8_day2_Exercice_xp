

/*All items, ordered by price (lowest to highest).*/
select * from items ORDER by price_items asc;

/* Items with a price above 80 (80 included), ordered by price (highest to lowest).  */

select * from items ORDER by price_items desc ;

/* The first 3 customers in alphabetical order of the first name (A-Z) – exclude the primary key column from the results.  */

select * from customers ORDER by first_name_customers LIMIT 3;

/* All last names (no other columns!), in reverse alphabetical order (Z-A)  */

select * from customers ORDER by last_name_customers desc;