-- A. Pizza Metrics --
-- 1. How many pizzas were ordered? --

SELECT COUNT(DISTINCT(order_id)) AS no_of_pizzas_ordered
FROM #customer_orders;

-- 2. How many unique customer orders were made? --
SELECT customer_id, COUNT(order_id) AS unique_orders
FROM #customer_orders
GROUP BY customer_id

-- 3. How many successful orders were delivered by each runner? --
SELECT COUNT(order_id) AS successful_orders
FROM #runner_orders
WHERE distance != 0

-- 4. How many of each type of pizza was delivered? --
SELECT pizza_id, COUNT(pizza_id) AS no_of_delivered_pizza
FROM #customer_orders AS c
JOIN #runner_orders AS r
	ON c.order_id = r.order_id
WHERE distance != 0
GROUP BY pizza_id

-- 5. How many Vegetarian and Meatlovers were ordered by each customer? --

			--- ONGOING ---
		 --- UPDATE  SOOON ---