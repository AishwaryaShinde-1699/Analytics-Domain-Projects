-- Sales Dataset

use new;
show tables;
select * from sales;

-- Total sales by date: calculate the total sales for each date in the dataset and display the results in ascending order of the date
SELECT date, SUM(sales) AS total_sales
FROM sales
GROUP BY date
ORDER BY date;

-- Total sales by store: calculate the total sales for each store in the dataset and display the results in descending order of the total sales
SELECT store, SUM(sales) AS total_sales
FROM sales
GROUP BY store
ORDER BY total_sales DESC;

-- Total sales by item: calculate the total sales for each item in the dataset and display the results in descending order of the total sales
SELECT item, SUM(sales) AS total_sales
FROM sales
GROUP BY item
ORDER BY total_sales DESC;
 
-- Monthly sales trend: calculate the total sales for each month
SELECT EXTRACT(YEAR_MONTH FROM date) AS month, SUM(sales) AS total_sales
FROM sales
GROUP BY month
ORDER BY month;

-- Top-selling items: identify the top 5 items with the highest total sales in the dataset
SELECT item, SUM(sales) AS total_sales
FROM sales
GROUP BY item
ORDER BY total_sales DESC
LIMIT 5;
 
-- Average daily sales: calculates the average sales for each date 
SELECT date, AVG(sales) AS average_sales
FROM sales
GROUP BY date
ORDER BY date;

-- Total sales by store and item: calculates the total sales for each combination of store and item 
SELECT store, item, SUM(sales) AS total_sales
FROM sales
GROUP BY store, item
ORDER BY total_sales DESC;

-- Monthly sales comparison: compares the total sales for each month across different stores (Store A, Store B, Store C) 
SELECT EXTRACT(YEAR_MONTH FROM date) AS month,
       SUM(CASE WHEN store = 'Store A' THEN sales ELSE 0 END) AS sales_store_a,
       SUM(CASE WHEN store = 'Store B' THEN sales ELSE 0 END) AS sales_store_b,
       SUM(CASE WHEN store = 'Store C' THEN sales ELSE 0 END) AS sales_store_c
FROM sales
GROUP BY month
ORDER BY month;

-- Monthly sales distribution by item: calculates the total sales for each item within each month (ascending order of the month and descending order of the total sales)
SELECT EXTRACT(YEAR_MONTH FROM date) AS month, item, SUM(sales) AS total_sales
FROM sales
GROUP BY month, item
ORDER BY month, total_sales DESC;

-- Store-wise sales performance comparison: calculates the total sales for each store
SELECT store, SUM(sales) AS total_sales
FROM sales
GROUP BY store
ORDER BY total_sales DESC;
 
-- Top-selling items by month:  identifies the top-selling items for each month (filters out items with zero sales)
SELECT EXTRACT(YEAR_MONTH FROM date) AS month, item, SUM(sales) AS total_sales
FROM sales
GROUP BY month, item
HAVING total_sales > 0
ORDER BY month, total_sales DESC;
 
 