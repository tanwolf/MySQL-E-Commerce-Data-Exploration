/*
SQL JOIN
------------------------------------------------------------------------------------------------
HOW TO GET THE SCHEMA OF A DATABASE: 
* Windows/Linux: Ctrl + r
* MacOS: Cmd + r
*/



guv9ivuii


USE magist;
-- Getting to know the data

-- How many orders are there in the dataset?
SELECT COUNT(order_id)
FROM orders;
/* Answer: 


Thoughts:


*/

-- Are orders actually delivered?
SELECT order_id, order_status
FROM magist.orders
GROUP BY order_status;

/* Answer: 


Thoughts:


*/

SELECT order_status, COUNT(order_status)
FROM magist.orders
GROUP BY order_status
ORDER BY COUNT(order_status) DESC;
/* Answer: 


Thoughts:


*/

-- Orders per year

SELECT YEAR(order_purchase_timestamp), COUNT(order_id)
FROM magist.orders
GROUP BY YEAR(order_purchase_timestamp)
ORDER BY YEAR(order_purchase_timestamp) desc;
/* Answer: 


Thoughts:


*/

-- Orders per year

SELECT YEAR(order_purchase_timestamp), COUNT(order_id)
FROM magist.orders
GROUP BY YEAR(order_purchase_timestamp)
ORDER BY YEAR(order_purchase_timestamp) desc;
/* Answer: 


Thoughts:


*/

-- orders per month
SELECT 
    YEAR(order_purchase_timestamp) AS year_,
    MONTH(order_purchase_timestamp) AS month_,
    COUNT(order_id)
FROM
    magist.orders
GROUP BY year_ , month_
ORDER BY year_ , month_;

/* Answer: 


Thoughts:


*/



-- customers per month
SELECT 
    YEAR(order_purchase_timestamp) AS year_,
    MONTH(order_purchase_timestamp) AS month_,
    COUNT(customer_id)
FROM
    magist.orders
GROUP BY year_ , month_
ORDER BY year_ , month_;
/* Answer: 


Thoughts:


*/

-- How many products are there in the products table? Make sure there are no duplicate products

SELECT 
    COUNT(DISTINCT product_id) AS products_count
FROM
    products;
/* Answer: 


Thoughts:


*/


-- Which are the categories with most products?

SELECT product_category_name, COUNT(distinct product_id) AS n_products
FROM magist.products
GROUP BY product_category_name
ORDER BY COUNT(distinct product_id) desc;

/* Answer: 


Thoughts:


*/
-- How many of those products were present in actual transactions?
-- Answer given is not correct? How to do this query?

/* Answer: 


Thoughts:


*/

-- That’s the price for the most expensive and cheapest products?

SELECT MIN(price) AS Cheapest, MAX(price) AS most_expensive
FROM magist.order_items;

/* Answer: 


Thoughts:


*/

-- What are the highest and lowest payment values? 

SELECT MIN(payment_value) AS lowest, MAX(payment_value) AS highest
FROM magist.order_payments;


/* Answer: 


Thoughts:


*/



-- Business questions

-- In relation to the products: 
-- 1) What categories of tech products does Magist have?

SELECT distinct(product_category_name)
FROM magist.products;

/* We decided on 
audio
electronic
computer_accessories
computers
watches_gifts
tablets_printing_image
telephony
*/

-- tech products:
SELECT product_category_name_english
FROM magist.product_category_name_translation
WHERE product_category_name_english IN('audio', 'electronics', 'computers_accessories', 'computers', 'watches_gifts', 'tablets_printing_image', 'telephony');

SELECT pcnt.product_category_name_english AS eng_cat_name
FROM magist.product_category_name_translation
LEFT JOIN product_category_name_translation pcnt ON p.product_category_name = pcnt.product_category_name;


WHERE product_category_name_english IN('audio', 'electronics', 'computers_accessories', 'computers', 'watches_gifts', 'tablets_printing_image', 'telephony');

SELECT distinct(product_category_name)
FROM magist.products
WHERE product_category_name LIKE '%audio%';

SELECT distinct(product_category_name)
FROM magist.products
WHERE product_category_name LIKE '%audio%'
OR product_category_name LIKE '%tronics%';

 OR '%computers_accessories%' OR '%computers%' OR '%watches_gifts%' OR '%tablets_printing_image%' OR '%telephony%');

/* Answer: 


Thoughts:


*/



-- 2 How many products of these tech categories have been sold (within the time window of the database snapshot)? What percentage does that represent from the overall number of products sold?



product_category_name_english

FROM magist.products;



/* Answer: 


Thoughts:


*/
SELECT distinct(product_category_name)

WHERE product_category_name = 

FROM magist.products;


/* Answer: 


Thoughts:


*/

-- 3 What’s the average price of the products being sold?
-- tech 132, all 121 

/* Answer: 


Thoughts:


*/


-- 4 Are expensive tech products popular? * TIP: Look at the function CASE WHEN to accomplish this task.
-- Ben: justify popular (sales etc.)
/* Tanja: include reviews order_reviews:

review_score
review_comment_title
review_comment_mesage
review_creation_date checken mit delivery time 

high tech is rated a little worse than 



*/

/* Answer: 


Thoughts:


*/

-- 5 How many sellers are there?

SELECT COUNT(seller_id)
FROM magist.sellers;
/* Answer: 


Thoughts:


*/
-- 6 What’s the average monthly revenue of Magist’s sellers?

SELECT COUNT(DISTINCT seller_id), AVG(price)
FROM magist.order_items
ORDER BY AVG(price) DESC;

/* Answer: 


Thoughts:


*/
-- 7 What’s the average revenue of sellers that sell tech products?
SELECT

FROM magist. 



WHERE prodeng.product_category_name_english IN ('audio', 'electronics', 'computer_accessories', 'computers', 'watches_gifts', 'tablets_printing_image', 'telephony')


; 


/* Answer: 


Thoughts:


*/

-- In relation to the delivery time:
-- 8 What’s the average time between the order being placed and the product being delivered?



SELECT order_purchase_timestamp, order_delivered_customer_date
FROM magist.orders; 



/* Tanja
order being placed
order_purchase_timestamp

AVG order being delivered
order_delivered_customer_date

Check all vs tech products

Stefan:

TIMESTAMPDIFF(DAY, order_estimated



*/

/* Answer: 


Thoughts:


*/

-- 9 How many orders are delivered on time vs orders delivered with a delay?

SELECT Distinct order_status
FROM magist.orders;

-- Note Tanja: There is no status for delayed!

/* Answer: 


Thoughts:


*/

SELECT order_delivered_customer_date, order_estimated_delivery_date
FROM magist.orders; 

/* Answer: 


Thoughts:


*/


SELECT order_purchase_timestamp, order_delivered_customer_date, order_estimated_delivery_date
FROM magist.orders; 

/* Answer: 


Thoughts:


*/


SELECT order_delivered_customer_date, order_estimated_delivery_date
FROM magist.orders
WHERE TIMESTAMPDIFF (DAY, order_estimated_delivery_date, order_delivered_customer_date); 


/*
Tanja: How to aggregate dates?

create a new colum COUNT(order_delivered_customer_date > order_estimated_delivery_date)




*/

/* Answer: 


Thoughts:


*/

-- 10 Is there any pattern for delayed orders, e.g. big products being delayed more often?

SELECT order_delivered_customer_date, order_estimated_delivery_date
FROM magist.orders; 

/*
product_weight_g
product_length_cm
product_height-cm
product_width_cm

products

delivery time of tech products by size


*/

/* Answer: 


Thoughts:


*/


/* Further questions Tanja:

Tanja:
Check: 
order.status (orders)

What does payment sequential mean? payment_sequential (order_payments)
payment_ installments (for tech products?)(order_payments)

SELECT distinct payment_sequential
FROM magist.order_payments;

SELECT distinct payment_installments
FROM magist.order_payments
ORDER BY payment_installments ASC;

EDIT: Ratenzahlung

Where does the target group for tech products live? customer_zip_code_prefix (customers)

close to the coast


Where do the sellers for tech life? seller_zip_code_prefix (sellers)
shipping_limit_date (order Items)




*/


/*-- WHERE product_category_name_english = "computer_accessories";

SELECT s.seller_zip_code_prefix, COUNT(seller_id)
FROM magist.sellers AS s
INNER JOIN 
GROUP BY s.seller_zip_code_prefix
Order By COUNT(s.seller_id) DESC


HAVING product_category_name_english = "computer_accessories";*/

/* Answer: 


Thoughts:


*/

SELECT order_delivered_customer_date, order_estimated_delivery_date
FROM magist.orders; 

-- Stefan


SELECT 
  yearpurchased,
--  SUM(delivered) AS "orders delivered",
  SUM(CASE WHEN ddelayed <= 0 THEN 1 ELSE 0 END) AS "undelayed",
  SUM(CASE WHEN ddelayed = 1 THEN 1 ELSE 0 END) AS "1d",
  SUM(CASE WHEN ddelayed = 2 THEN 1 ELSE 0 END) AS "2d",
  SUM(CASE WHEN ddelayed = 3 THEN 1 ELSE 0 END) AS "3d",
  SUM(CASE WHEN ddelayed = 4 THEN 1 ELSE 0 END) AS "4d",
  SUM(CASE WHEN ddelayed = 5 THEN 1 ELSE 0 END) AS "5d",
  SUM(CASE WHEN (ddelayed > 5 AND ddelayed <= 10) THEN 1 ELSE 0 END) AS "5-10d",
  SUM(CASE WHEN (ddelayed > 10) THEN 1 ELSE 0 END) AS ">10d"
FROM
(
SELECT 
  YEAR(o.order_purchase_timestamp) AS yearpurchased,
  CASE o.order_status WHEN "delivered" THEN 1 ELSE 0 END AS delivered,
  TIMESTAMPDIFF(DAY,order_estimated_delivery_date,order_delivered_customer_date) ddelayed,
  CASE o.order_estimated_delivery_date WHEN o.order_estimated_delivery_date < o.order_delivered_customer_date THEN 1 ELSE 0 END AS delayd,
  /*
  CASE TIMESTAMPDIFF(DAY,order_estimated_delivery_date,order_delivered_customer_date) WHEN 
    NOT(ISNULL(order_delivered_customer_date)) AND NOT(ISNULL(order_estimated_delivery_date)) AND TIMESTAMPDIFF(DAY,order_estimated_delivery_date,order_delivered_customer_date) = 10 THEN 1 ELSE 0 END AS delayed1d,
    */
  CASE WHEN TIMESTAMPDIFF(DAY,order_delivered_customer_date,order_estimated_delivery_date) = 0 THEN 1 ELSE 0 END AS undelayed,
  CASE WHEN TIMESTAMPDIFF(DAY,order_delivered_customer_date,order_estimated_delivery_date) = 1 THEN 1 ELSE 0 END AS delayed1d,
  CASE WHEN TIMESTAMPDIFF(DAY,order_delivered_customer_date,order_estimated_delivery_date) = 2 THEN 1 ELSE 0 END AS delayed2d,
  CASE WHEN TIMESTAMPDIFF(DAY,order_delivered_customer_date,order_estimated_delivery_date) = 3 THEN 1 ELSE 0 END AS delayed3d,
  CASE WHEN TIMESTAMPDIFF(DAY,order_delivered_customer_date,order_estimated_delivery_date) = 4 THEN 1 ELSE 0 END AS delayed4d,
  CASE WHEN (TIMESTAMPDIFF(DAY,order_delivered_customer_date,order_estimated_delivery_date) >= 5 AND TIMESTAMPDIFF(DAY,order_delivered_customer_date,order_estimated_delivery_date) < 10) THEN 1 ELSE 0 END AS delayed5_10d,
  CASE WHEN TIMESTAMPDIFF(DAY,order_delivered_customer_date,order_estimated_delivery_date) >= 10 THEN 1 ELSE 0 END AS delayed10_d,
  CASE YEAR(o.order_purchase_timestamp) WHEN 2016 THEN 1 ELSE 0 END AS ordered2016,
  CASE YEAR(o.order_purchase_timestamp) WHEN 2017 THEN 1 ELSE 0 END AS ordered2017,
  CASE YEAR(o.order_purchase_timestamp) WHEN 2018 THEN 1 ELSE 0 END AS ordered2018
FROM magist.orders o
) AS OVERVIEW
GROUP BY yearpurchased
ORDER BY yearpurchased 
;

-- are orders delivered on time?
select * from magist.order_reviews;
select * from magist.order_items;
-- shipping_limit_date; 
select *,TIMESTAMPDIFF(DAY,order_delivered_customer_date,order_estimated_delivery_date) from magist.orders o;
/*
  .order_status (delivered,canceled,unavailable,shipped,...)
  .order_purchase_timestamp (kaufzeitpunkt)
  .order_approved_at (bestellbestätigung)
  .order_delivered_carrier_date (versandzeitpunkt)
  .order_delivered_customer_date (zustellzeitpunkt)
  .order_estimated_delivery_date (geschätzter zustellzeitpunkt)
  .order_status="delivered" and estimated >= order_delivered_customer_date
percent delivered,avg delay,canceled,delay2016 
*/

/* Answer: 


Thoughts:


*/

