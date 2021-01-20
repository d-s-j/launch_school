/* Create a billing database */

CREATE DATABASE auction;

/* Create a bidders, items, and bids table */

CREATE TABLE bidders (
  id serial PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE items (
  id serial PRIMARY KEY,
  name text NOT NULL,
  initial_price decimal(6, 2) NOT NULL CHECK (initial_price BETWEEN 0.01 AND 1000.00),
  sales_price decimal(6, 2) CHECK (sales_price BETWEEN 0.01 AND 1000.00)
);

CREATE TABLE bids (
  id serial PRIMARY KEY,
  bidder_id integer NOT NULL REFERENCES bidders(id) ON DELETE CASCADE,
  item_id integer NOT NULL REFERENCES items(id) ON DELETE CASCADE,
  amount decimal(6, 2) NOT NULL CHECK (amount BETWEEN 0.01 AND 1000.00)
);

/* Create a composite index with bidder_id and item_id for the bids table */

CREATE INDEX ON bids (bidder_id, item_id);

/* Use \copy meta-command to import files into auction database */

\copy bidders FROM 'bidders.csv' WITH HEADER CSV;
\copy items FROM 'items.csv' WITH HEADER CSV;
\copy bids FROM 'bids.csv' WITH HEADER CSV;

/* Display all items that have bids on them using the logical operator IN with a subquery */

SELECT name AS "Bid on Items" FROM items
WHERE items.id IN (SELECT DISTINCT item_id FROM bids);

/* Display all items that have no bids on them using the logical operator NOT IN with a subquery */

SELECT name AS "Not Bid On" FROM items
WHERE items.id NOT IN (SELECT DISTINCT item_id FROM bids);

/* Display bidders names who has a bid in the auction using the logical operator EXISTS with a subquery */
/* Further Exploration: Return the same output using a JOIN clause */

SELECT bidders.name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

SELECT DISTINCT bidders.name FROM bidders
JOIN bids ON bids.bidder_id = bidders.id
GROUP BY bidders.id;

/* Use a subquery to generate a virtual table, then query that table for the largest number of bids */

SELECT MAX(bid_counts.count) FROM
  (SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;

/* Use a scalar subquery to determine the number of bids on each item, along with the name of each item */
/* Further Exploration: Return the same output using a LEFT JOIN clause */

SELECT items.name,
       (SELECT COUNT(item_id) FROM bids WHERE item_id = items.id) 
FROM items;

SELECT items.name, COUNT(item_id) FROM items
LEFT JOIN bids ON bids.item_id = items.id
GROUP BY items.name, items.id
ORDER BY items.id;

/* Display an item's id with the given data without using keyword AND */

SELECT items.id FROM items WHERE 
ROW(name, initial_price, sales_price) = ROW('Painting', 100.00, 250.00);