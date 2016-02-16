use prints;
-- 1.	Create a view named Under_100. It consists of the item_id, title, artist, unit_price and order_qty for every print with a unit_price under 100 dollars. 
CREATE VIEW Under_100 AS 
SELECT items.item_id, title, artist, unit_price, order_qty 
FROM items INNER JOIN orderline ON items.item_id = orderline.item_id WHERE unit_price < 100;
-- 2.	Create a view named Allen. It consists of the customer_id, customer_name, customer_phone, title, and artist of each print ordered. 
  CREATE VIEW Allen AS
  SELECT customers.customer_id, customer_name, customer_phone, title, artist
  FROM (((customers INNER JOIN orders ON customers.customer_id = orders.customer_id) JOIN orderline ON orderline.order_id = orders.order_id) JOIN items ON items.item_id = orderline.item_id); 
-- 3.	Create a view named orders. It consists of the item_id, title, artist, unit_price and order_qty for every print ordered in the range of 2014-01-01 and 2014-02-28.
CREATE VIEW orders AS
SELECT items.item_id, title, artist, unit_price, order_qty, order_date
FROM ((items JOIN orderline ON items.item_id = orderline.item_id) JOIN orders ON orders.order_id = orderline.order_id) 
WHERE orders.order_date BETWEEN '2014-01-01' AND '2014-02-28';
-- 4.	Create a view named zip_27. It consists of the customer_name, customer_phone, title, artist and date_shipped of each print ordered by a customer whose zip code begins with 27.
CREATE VIEW zip_27 AS
SELECT customer_name, customer_phone, title, artist, ship_date 
FROM (((customers JOIN orders ON customers.customer_id = orders.customer_id) JOIN orderline ON orderline.order_id = orders.order_id) JOIN items ON items.item_id = orderline.item_id)
WHERE customer_zip LIKE '27%';
-- 5.	Create the following indexes. Use the indicated index name.
-- a.	Create an index named customer_id on the customer_id field in the customers table.
CREATE INDEX customer_id ON customers (customer_id);
-- b.	Create an index named name on the customer_name field in the customers table.
CREATE INDEX name ON customers (customer_name);
-- c.	Create an index named shipped on the customer_id and ship_date in the orders table.
CREATE INDEX shipped ON orders (customer_id, ship_date);
-- 6.	Drop the name index.
ALTER TABLE customers DROP INDEX name;
-- 7.	Specify the integrity constraint that the unit_price of any print must be more than $35.
ALTER TABLE items ADD CHECK (unit_price > 35);
-- 8.	Ensure that the following are foreign keys (that is, specify referential integrity) within the prints database.
-- a.	customer_id is a foreign key in the orders table.

	 ALTER TABLE orders ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id);
-- b.	Item_id is a foreign key in the orderline table.
	ALTER TABLE orderline ADD FOREIGN KEY (item_id) REFERENCES items(item_id);
-- 9.	Add to the items table a new character field named type that is one character in length. 
ALTER TABLE items ADD type CHAR(1);
-- 10.	Change the type field in the items table to M for the print titled Skies Above.
UPDATE items SET type = 'M' WHERE Title = 'Skies Above';
-- 11.	Change the length of the artist field in the items table to 30.
ALTER TABLE items MODIFY COLUMN Artist CHAR(30);
-- 12.	 What command would you use to delete the orders table from the prints database? (Do not delete the orders table.)
	-- DROP TABLE orders;
