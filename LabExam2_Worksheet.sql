/* Written by Anthony Hamlin
   CIS332 - Lab Exam Worksheet - Nov 7, 2019
*/
-- Study for exam
-- TO_CHAR, INITCAP, TO_DATE, NVL/NVL2, DECODE

-- Problem 1
-- Display the title, category, publish date and retail price for each book. 
-- Sort the output by title in alphabetical order.

SELECT INITCAP(b.title) AS "Title", 
    INITCAP(b.category) AS "Category", 
    INITCAP(TO_CHAR((b.pubdate), 'FMMonth DD, YYYY')) AS "Published",  -- FM suppresses blank padding
    TO_CHAR(b.retail, '$999.00') AS "Price"
FROM books b
ORDER BY "Title";

-- Problem 2
-- Display the ISBN, title and publisher’s name for each book in the Computer category.
-- Sort the output by ISBN in ascending order.

SELECT b.isbn, INITCAP(b.title) AS "Title", INITCAP(p.name) AS "Publisher"
FROM books b JOIN publisher p ON b.pubid=p.pubid
WHERE category = 'COMPUTER'
ORDER BY b.isbn;

-- Problem 3
--Display a list of customer #’s that have not placed an order. Sort the results by customer# in ascending order.

SELECT customer# AS "No Orders"
FROM customers
MINUS
SELECT customer#
FROM orders;
 
-- Problem 4

SELECT LPAD(o.order#, 9, ' ') AS "Order #", 
       INITCAP(c.firstname || ' ' || c.lastname) AS  "Customer",
       TO_CHAR(o.orderdate, 'MM/DD/YYYY') AS "Order Date",
       TO_CHAR(o.shipdate, 'MM/DD/YYYY') AS "Ship Date"
 FROM  customers c join orders o on c.customer#=o.customer#
 WHERE o.shipdate IS NOT NULL
 ORDER BY o.order#;

-- Problem 5
-- Display a list of all customers, along with the name of the customer that referred them.
-- If a customer was not referred, display the literal N/A.
-- Sort the results on the customer’s last name.

SELECT INITCAP(c.firstname || ' ' || c.lastname) AS "Customer", 
       NVL2(c.referred, INITCAP(r.firstname || ' ' || r.lastname), 'N/A') AS "Referred by"
FROM customers c LEFT JOIN customers r
ON c.referred= r.customer#
ORDER BY c.lastname;
