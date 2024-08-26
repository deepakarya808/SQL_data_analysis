SELECT * from pizza_sales;

-- Total Revenue

SELECT SUM(total_price) AS total_revenue from pizza_sales

-- Average Order value


SELECT SUM(total_price)/ COUNT(DISTINCT order_id) AS Avg_Order_Value from pizza_sales

--- Total Pizzas sold

SELECT SUM(quantity) AS Total_Pizzas_Sold from pizza_sales

--- Total Orders Placed

SELECT COUNT(DISTINCT order_id) AS Total_orders from pizza_sales

--- Average Pizzas Per Order

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL (10,2)) AS Avg_Pizzas_per_order from pizza_sales

--- Daily Trend for Total Orders

SELECT DATENAME(DW,order_date) as order_day, COUNT(DISTINCT order_id) AS Total_orders
from pizza_sales
GROUP BY DATENAME(DW, order_date) 

--- Monthly Trend for Orders

SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT (DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)

---Percentage of Sales by Pizza Category

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category


--- Percentage of sales by Pizza size


SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

--- Total Pizzas sold by Pizza Category

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC


--- Top 5 Sales by Revenue

SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

--- Bottom 5 Pizzas by Revenue

SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC


--- Top 5 Sales by Quantity

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

--- Bottom 5 Sales by Quantity

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC

--- Top 5 Pizzas by Total Orders

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders From pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC 

--- Bottom 5 Pizzas by Total Orders

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders From pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC


