USE sql_store;
SELECT *
FROM customers
WHERE customer_id=1
ORDER BY first_name;

SELECT first_name, last_name, points, points * 20 + 100 AS discount_factor
FROM customers; 

SELECT state 
FROM customers;

select name, unit_price, unit_price *1.1 as new_price
from products;

select * from customers
where points > 2000;

select * from customers
WHERE state = 'VA';

select * from customers
WHERE state <> 'VA';

select * from customers
WHERE birth_date > '1990-01-01';

select * from orders
WHERE order_date >= '2018-01-01';

SELECT * FROM customers
WHERE birth_date > '1990-01-01' or points > 1000;

SELECT * FROM customers
WHERE birth_date > '1990-01-01' or points > 1000 AND state = 'TX';

-- NOT (to negate a condition)
SELECT * FROM customers
WHERE NOT birth_date > '1990-01-01' or points > 1000 AND state = 'TX';

-- Returns customers in any of these states: VA, NY, CA
SELECT *
FROM customers 
WHERE state IN (‘VA’, ‘NY’, ‘CA’);

-- Return products with quantity in stock is equal to 49, 38, 72
SELECT *
FROM products 
WHERE quantity_in_stock IN (49,38,72);
 
-- Between operator
SELECT *
FROM customers
WHERE points >= 1000 AND 3000;

SELECT *
FROM customers
WHERE points NOT BETWEEN 1000 AND 2000;

SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

-- Returns customers first name whose last character starts with b 
SELECT *
FROM customers 
WHERE first_name LIKE 'b%';

-- Returns customers last name whose last character ends with y
SELECT *
FROM customers 
WHERE last_name LIKE '%y';

-- Returns customers that has b anywhere in last name starts 
SELECT *
FROM customers 
WHERE last_name LIKE '%b%';

-- Returns customers whose last name has start with b and end with y 
SELECT *
FROM customers 
WHERE last_name LIKE 'b____y';

-- Returns customers whose  last name has 6 characters and end with y 
SELECT *
FROM customers 
WHERE last_name LIKE '_____y';

-- Returns customers whose address contain Trail or Avenue 
SELECT *
FROM customers 
WHERE address LIKE '%trail%' OR address LIKE '%avenue%';

-- Returns customers whose phone number ends with 9 
SELECT *
FROM customers 
WHERE phone LIKE '%9';

-- Returns customers whose phone number dont ends with 9 
SELECT *
FROM customers 
WHERE phone NOT LIKE '%9';

-- Returns customers that has Field has last name 
SELECT *
FROM customers 
WHERE last_name LIKE '%field%';

-- Returns customers that has field or mac or rose as last name 
SELECT *
FROM customers 
WHERE last_name REGEXP 'field|mac|rose';

-- Returns customers whose last name field or mac or rose 
SELECT *
FROM customers 
WHERE last_name REGEXP '^field$|mac|rose';

-- Returns customers that have e in last name 
SELECT *
FROM customers 
WHERE last_name REGEXP 'e';

-- Returns customers that have ge or ie or me in last name 
SELECT *
FROM customers 
WHERE last_name REGEXP '[gim]e';

-- Returns customers that have ef or em or el in last name 
SELECT *
FROM customers 
WHERE last_name REGEXP '[fel]e';

-- Returns customers that have a-h then e in last name 
SELECT *
FROM customers 
WHERE last_name REGEXP '[a-h]e';

-- Returns customers whose last name ends with EY or ON 
SELECT *
FROM customers 
WHERE last_name REGEXP 'ey$|on$';

-- Returns customers whose first name is Elka or Ambur
SELECT *
FROM customers 
WHERE first_name REGEXP 'Elka|Ambur';

-- Returns customers whose first name is Elka or Ambur
SELECT *
FROM customers 
WHERE first_name REGEXP 'Elka|Ambur';

-- Returns customers whose last name start with MY or contain SE 
SELECT *
FROM customers 
WHERE last_name REGEXP '^my|se';

-- Returns customers whose last name contains B followed by R or U
SELECT *
FROM customers 
WHERE last_name REGEXP 'b[ru]';

-- Returns customers with missing value, customers who don’t have a phone number
SELECT *
FROM customers 
WHERE phone IS NULL;

-- Returns customers with no missing phone number
SELECT *
FROM customers 
WHERE phone IS NOT NULL;

-- Returns ORDERS ARE NOT SHIPPED YET
SELECT *
FROM orders 
WHERE shipper_id IS NULL;

-- Return Sort customer by name
Select * 
FROM customers
ORDER BY first_name;

-- Return Sort customer by first name descending order
Select * 
FROM customers
ORDER BY first_name DESC; 

-- Sort customers by state (in ascending order), and then —- by their first name (in descending order)
SELECT *
FROM customers
ORDER BY state, first_name DESC;

-- Sort customers name by their birth date
SELECT first_name , last_name
FROM customers
ORDER BY birth_date;

-- Sort customers name by column
SELECT first_name , last_name
FROM customers
ORDER BY 1,2;

-- Sort quantity * unit price in order ID-2 AS total price in descending order
SELECT *, quantity * unit_price AS Total_Price
FROM order_items 
WHERE order_id = 2
ORDER BY quantity * unit_price DESC;

-- Return only the first 3 customers
SELECT *
FROM customers
LIMIT 3;

-- Return customer per page 
SELECT *
FROM customers
LIMIT 6,3;

-- Return customer with highest 3 points
SELECT * 
FROM customers
ORDER BY points DESC
Limit 3;

-- Return to join  tables orderd id and customer id
SELECT *
FROM orders 
JOIN customers ON orders.customer_id = customers.customer_id;

-- Return to join  tables 
SELECT order_id, first_name, last_name
FROM orders 
JOIN customers ON orders.customer_id = customers.customer_id;

-- Return to join  tables 
SELECT order_id, first_name, last_name
FROM orders 
JOIN customers ON orders.customer_id = customers.customer_id;

-- Return to join tables multible databases product from SQL_inventory database and order items from SQL_store
SELECT *
FROM order_items oi
JOIN sql_inventory.products p
ON oi.product_id = p.product_id;

-- Deleting rows
DELETE FROM customers
WHERE customer_id = 1;


-- Outer Joins
-- Return all customers whether they have any orders or not 
SELECT *
FROM customers c
LEFT JOIN orders o 
   ON c.customer_id = o.customer_id;

-- USING Clause
-- If column names are exactly the same,  simplifying the join with the USING clause.
SELECT *
FROM customers c JOIN orders o 
   USING (customer_id);

-- Unions
-- Combine records from multiple result sets 
SELECT name, address
FROM customers ;


SELECT name, address FROM clients ;
                                                                                                                                                                                                                                                                       

-- Inserting Data
-- Insert a single record
INSERT INTO customers(first_name, phone, points) VALUES (‘Mosh’, NULL, DEFAULT);


-- Insert multiple single records
INSERT INTO customers(first_name, phone, points) VALUES 
(‘Mosh’, NULL, DEFAULT),
(‘Bob’, ‘1234’, 10)