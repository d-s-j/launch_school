/* Create a `billing` database */
CREATE DATABASE billing;

/* Create `customers` and `services` table */
CREATE TABLE customers (
  id serial PRIMARY KEY,
  name text NOT NULL,
  payment_token char(8) NOT NULL UNIQUE CHECK (payment_token ~ '^[A-Z]{8}$')
);

CREATE TABLE services(
  id serial PRIMARY KEY,
  description text NOT NULL,
  price numeric(10,2) NOT NULL CHECK(price >= 0.00)
);

/* Insert data into `customers` and `services` tables */
INSERT INTO customers (name, payment_token)
VALUES ('Pat Johnson', 'XHGOAHEQ'),
       ('Nancy Monreal', 'JKWQPJKL'),
       ('Lynn Blake', 'KLZXWEEE'),
       ('Chen Ke-Hua', 'KWETYCVX'),
       ('Scott Lakso', 'UUEAPQPS'),
       ('Jim Pornot', 'XKJEYAZA');

INSERT INTO services (description, price)
VALUES ('Unix Hosting', 5.95),
       ('DNS', 4.95),
       ('Whois Registration', 1.95),
       ('High Bandwidth', 15.00),
       ('Business Support', 250.00),
       ('Dedicated Hosting', 50.00),
       ('Bulk Email', 250.00),
       ('One-to-one Training' , 999.00);

/* Create a join table associating `customers` with `services` and vica versa */
CREATE TABLE customers_services(
  id serial PRIMARY KEY,
  customer_id int REFERENCES customers(id) ON DELETE CASCADE NOT NULL,
  service_id int REFERENCES services(id) NOT NULL,
  UNIQUE (customer_id, service_id)
);

/* Insert data into `customers_services` table */
INSERT INTO customers_services (customer_id, service_id)
VALUES (1, 1), (1, 2), (1, 3),
       (3, 1), (3, 2), (3, 3), (3, 4), (3, 5),
       (4, 1), (4, 4),
       (5, 1), (5, 2), (5, 6),
       (6, 1), (6, 6), (6, 7);

/* Write a query displaying `customers` data for customers who have at least one service */
SELECT DISTINCT customers.* FROM customers
       JOIN customers_services 
       ON customers_services.customer_id = customers.id;

/* Write a query displaying `customer` data for customers with zero servicees */
SELECT customers.* FROM customers
       LEFT JOIN customers_services 
       ON customers_services.customer_id = customers.id
       WHERE service_id IS NULL;
/* Write a query displaying `customers` data for customers with zero services and
`services` data for services not being used by any customers */
SELECT customers.*, services.* FROM customers
       LEFT JOIN customers_services ON customers_services.customer_id = customers.id
       FULL JOIN services ON customers_services.service_id = services.id
       WHERE customers_services.id IS NULL;

/* Write a query displaying a list of services not currently in use using a RIGHT JOIN*/
SELECT description FROM customers_services
       RIGHT JOIN services
       ON services.id = service_id
       WHERE service_id IS NULL;

/* Write a query displaying customer names and a comma-separated list of services they use */
SELECT customers.name, 
       STRING_AGG(services.description, ',') AS services
FROM customers
LEFT JOIN customers_services 
       ON customers_services.customer_id = customers.id
LEFT JOIN services 
       ON customers_services.service_id = services.id
GROUP BY customers.name;

/* Display customers name along with the services they use using the `lag()` function and a `CASE` condition */
SELECT 
       CASE lag(customers.name) OVER (ORDER BY customers.name)
       WHEN customers.name THEN ''
       ELSE customers.name
       END,
       services.description AS services
FROM customers
LEFT JOIN customers_services
       ON customers_services.customer_id = customers.id
LEFT JOIN services
       ON customers_services.service_id = services.id;

/* Write a query displaying each service being used by 3 or more customers. Include the customer count */
SELECT description, COUNT(service_id) FROM services
JOIN customers_services ON services.id = service_id
GROUP BY description
HAVING COUNT(customer_id) >= 3
ORDER BY description;

/* Display total gross income expected to receive */
SELECT SUM(price) as gross
FROM services
JOIN customers_services 
ON customers_services.service_id = services.id;

/* Insert a new customer */
INSERT INTO customers (name, payment_token)
VALUES ('John Doe', 'EYODHLCN');

INSERT INTO customers_services (customer_id, service_id)
VALUES (7, 1), (7, 2), (7, 3);

/* Display income from services being used that are over $100.00 */
SELECT SUM(price) FROM services
JOIN customers_services ON service_id = services.id
WHERE price >= 100;
/* Display income from services over $100.00 if all customers purchased them */
SELECT COUNT(customers.id) * (SELECT SUM(price) FROM services WHERE price >= 100) AS sum
FROM customers;

SELECT sum(price)
FROM customers
CROSS JOIN services
WHERE price > 100;

/* Delete 'Bulk Email' service and customer 'Chen Ke-Hua' from the database */
DELETE FROM customers_services
WHERE service_id = 7;

DELETE FROM services
WHERE description = 'Bulk Email';

DELETE FROM customers
WHERE name = 'Chen Ke-Hua';