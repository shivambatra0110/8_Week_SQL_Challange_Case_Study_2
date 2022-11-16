-- Data Creation --

-- create Database to store the data --
create DATABASE pizza;

-- create schema to store the data --
CREATE SCHEMA pizza_runner;

-- create runners table that consists runner_id and registration_date --
CREATE TABLE runners (
runner_id integer,
registration_date date);

-- inserting data into the runners table --
INSERT INTO runners VALUES 
(1, '2021-01-01'), (2, '2021-01-03'), (3, '2021-01-08'), (4, '2021-01-15');

-- create customer_orders that consists the order_id, customer_id, pizza_id, exclusions, extras, and order_time --
CREATE TABLE customer_orders (
order_id integer,
customer_id integer,
pizza_id integer,
exclusions VARCHAR(4),
extras VARCHAR(4),
order_date datetime);


-- insert data to customer_orders table --
INSERT INTO customer_orders VALUES
  ('1', '101', '1', '', '','2020-01-01 18:05:02'),
  ('2', '101', '1', '', '','2020-01-01 19:00:52'),
  ('3', '102', '1', '', '','2020-01-02 23:51:23'),
  ('3', '102', '2', '', NULL,'2020-01-02 23:51:23'),
  ('4', '103', '1', '4', '','2020-01-04 13:23:46'),
  ('4', '103', '1', '4', '','2020-01-04 13:23:46'),
  ('4', '103', '2', '4', '','2020-01-04 13:23:46'),
  ('5', '104', '1', 'null','1','2020-01-08 21:00:29'),
  ('6', '101', '2', 'null','null','2020-01-08 21:03:13'),
  ('7', '105', '2', 'null','1','2020-01-08 21:20:29'),
  ('8', '102', '1', 'null','null','2020-01-09 23:54:33'),
  ('9', '103', '1', '4', '1,5','2020-01-10 11:22:59'),
  ('10', '104', '1', 'null','null','2020-01-11 18:34:49'),
  ('10', '104', '1', '2, 6','1, 4','2020-01-11 18:34:49');
  
-- create runner_orders table --
CREATE TABLE runner_orders (
order_id integer,
runner_id integer,
pickup_time VARCHAR(19),
distance VARCHAR(7),
duration VARCHAR(10),
cancellation VARCHAR(23));

-- insert data into runner_orders table --
INSERT INTO runner_orders VALUES
('1', '1', '2020-01-01 18:15:34', '20km', '32 minutes', ''),
('2', '1', '2020-01-01 19:10:54', '20km', '27 minutes', ''),
('3', '1', '2020-01-03 00:12:37', '13.4km', '20 mins', NULL),
('4', '2', '2020-01-04 13:53:03', '23.4', '40', NULL),
('5', '3', '2020-01-08 21:10:57', '10', '15', NULL),
('6', '3', 'null', 'null', 'null', 'Restaurant Cancellation'),
('7', '2', '2020-01-08 21:30:45', '25km', '25mins', 'null'),
('8', '2', '2020-01-10 00:15:02', '23.4 km', '15 minute', 'null'),
('9', '2', 'null', 'null', 'null', 'Customer Cancellation'),
('10', '1', '2020-01-11 18:50:20', '10km', '10minutes', 'null');

-- create pizza_names table --
CREATE TABLE pizza_names (
pizza_id integer,
pizza_name text);

-- insert data into pizza_names table --
INSERT INTO pizza_names VALUES
('1', 'Meat Lovers'), ('2', 'Vegetarian');

-- create pizza_recipes table --
CREATE TABLE pizza_recipes (
pizza_id integer,
toppings text);

-- insert data into pizza_recipes table --
INSERT INTO pizza_recipes VALUES
('1','1, 2, 3, 4, 5, 6, 8, 10'), ('2', '4, 6, 7, 9, 11, 12');

-- create pizza_toppings table --
CREATE TABLE pizza_toppings (
topping_id integer,
topping_name text);

-- insert data into pizza_toppings table --
INSERT INTO pizza_toppings VALUES
(1, 'Bacon'), (2, 'BBQ Sauce'), (3, 'Beef'), (4, 'Cheese'), (5, 'Chicken'), (6, 'Mushrooms'),
(7, 'Onions'), (8, 'Pepperoni'), (9, 'Peppers'), (10, 'Salami'), (11, 'Tomatoes'),
(12, 'Tomato Sauce');

-- Table Creation end check the tables which we made just now --
SELECT *
FROM runners;

SELECT *
FROM customer_orders;

SELECT *
FROM runner_orders;

SELECT *
FROM pizza_names;

SELECT *
FROM pizza_recipes;

SELECT *
FROM pizza_toppings;

-- END --