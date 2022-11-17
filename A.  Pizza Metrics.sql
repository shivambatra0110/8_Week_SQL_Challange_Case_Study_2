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
SELECT c.customer_id,
	CAST(p.pizza_name AS nvarchar(100)) AS Pizza_names,
	COUNT(c.order_id) AS pizzas_ordered 
FROM customer_orders AS c 
left join pizza_names AS p
  on c.pizza_id = p.pizza_id 
GROUP BY c.customer_id,CAST(p.pizza_name AS nvarchar(100))
ORDER BY c.customer_id;

-- 6. What was the maximum number of pizzas delivered in a single order? --
WITH cte_pizza AS (
	SELECT
		c.order_id,
		COUNT(c.pizza_id) AS count_pizza
	FROM #customer_orders c
	JOIN #runner_orders r ON c.order_id = r.order_id
	WHERE r.distance !=0
	GROUP BY c.order_id)
SELECT
	MAX(count_pizza) AS max_num_pizza
FROM cte_pizza;

-- 7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
SELECT c.customer_id,
	SUM(CASE 
		WHEN c.exclusions != ' ' OR c.extras != ' ' THEN 1
		ELSE 0
		END) AS with_changes,
	SUM(CASE 
		WHEN c.exclusions = ' ' AND extras = ' '  THEN 1 
		ELSE 0
		END) AS no_changes
FROM #customer_orders AS c
JOIN #runner_orders AS r
	ON c.order_id = r.order_id
WHERE r.distance != 0
GROUP BY c.customer_id
ORDER BY c.customer_id

-- 8. How many pizzas were delivered that had both exclusions and extras? --
SELECT 	COUNT(c.customer_id) AS Count_Pizza
FROM #customer_orders AS c
JOIN #runner_orders AS r
	ON c.order_id = r.order_id
WHERE r.distance !=0 AND c.extras != '' AND c.exclusions != '' 
GROUP BY c.customer_id

-- 9. What was the total volume of pizzas ordered for each hour of the day? --

			--- ONGOING ---
		 --- UPDATE  SOOON ---