/* Written by Anthony Hamlin
   CIS332 - Chapter 12 Assignment
*/

--Problem 1

SELECT INITCAP(title) AS "Book Title", TO_CHAR(retail, '$999.99') AS "Below AVG Retail Price"
FROM books
WHERE retail < (SELECT AVG(retail) FROM books);

--Problem 2

SELECT INITCAP(title) AS "Book Title", INITCAP(category) AS "Category", TO_CHAR(cost, '$999.99') AS "Below AVG Cost in Category"
FROM books
WHERE cost < (SELECT AVG(cost) FROM books WHERE category = books.category);

-- Problem 3

SELECT order# AS "Order Number", shipstate AS "Shipping State match #1014"
FROM orders
WHERE shipstate = ANY(SELECT shipstate FROM orders WHERE order# = 1014);

-- Problem 4

SELECT order# AS "Order Number", TO_CHAR(paideach, '$999.99') AS "Higher Total than #1008" 
FROM orderitems
WHERE paideach > ANY(SELECT paideach FROM orderitems WHERE order# = 1008);

-- Problem 5

SELECT DISTINCT INITCAP(fname) || ' ' || INITCAP(lname) AS "Most Purchased Authors"
FROM author a JOIN bookauthor ba ON a.authorid = ba.authorid
                   JOIN orderitems oi ON oi.isbn = ba.isbn
WHERE ba.isbn IN (SELECT isbn FROM orderitems 
                    GROUP BY isbn HAVING SUM(QUANTITY) = (SELECT MAX(COUNT(*)) FROM orderitems GROUP BY isbn));

-- Problem 6

-- I'm not sure I understood this question
SELECT INITCAP(title) AS "Book Titles" 
FROM books 
WHERE category IN (SELECT DISTINCT category FROM books b JOIN orderitems oi ON b.isbn = oi.isbn
                                                         JOIN orders o ON o.order# = oi.order#
                                                         WHERE o.customer# = 1007) 
                                                         AND isbn NOT IN (SELECT isbn FROM orders o JOIN orderitems oi 
                                                                       ON o.order# = oi.order# 
                                                                       WHERE o.customer# = 1007); 

-- Problem 7

SELECT INITCAP(shipcity) AS "City", shipstate AS "State", (SELECT MAX(shipdate-orderdate) FROM orders) AS "Shipping Delay"  
FROM orders 
WHERE shipdate-orderdate = (SELECT MAX(shipdate-orderdate) FROM orders);

-- Problem 8

SELECT INITCAP(c.firstname) || ' ' || INITCAP(c.lastname) AS "Customer Name", 
                    c.customer# AS "Customer #", TO_CHAR(b.retail, '$999.99') AS "Price"
FROM customers c JOIN orders o ON c.customer# = o.customer# 
                JOIN orderitems oi ON oi.order#=o.order# 
                JOIN books b ON b.isbn=oi.isbn 
                WHERE retail = (SELECT MIN(retail) FROM books); 

-- Problem 9

SELECT COUNT(DISTINCT o.customer#) AS "# Customers James Austin Books"
FROM orders o JOIN orderitems oi ON o.order#=oi.order# 
WHERE oi.isbn IN (SELECT oi.isbn FROM orderitems oi JOIN bookauthor ba ON oi.isbn=ba.isbn 
                                                    JOIN author a ON a.authorid=ba.authorid 
                                                    WHERE lname= 'AUSTIN' AND fname = 'JAMES'); 

-- Problem 10

SELECT INITCAP(title) AS "Same Publisher" 
FROM books 
WHERE pubid = (SELECT pubid FROM books WHERE title = 'THE WOK WAY TO COOK');
