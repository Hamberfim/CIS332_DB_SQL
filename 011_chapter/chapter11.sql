/* Written by Anthony Hamlin
   CIS332 - Chapter 11 Assignment
*/

--Problem 1

SELECT category, count(*)
FROM books
GROUP BY category
ORDER BY 2 DESC, 1;

--Problem 2

SELECT COUNT(*) AS "Books over $30"
FROM books
WHERE retail > 30;

-- Problem 3

SELECT to_char(max(pubdate), 'fmMonth ddth, yyyy'), min(pubdate)
FROM books;

-- Problem 4

SELECT TO_CHAR(sum((oi.paideach - b.cost) * oi.quantity), '$999.00') AS "Profit"
FROM orders o JOIN orderitems oi ON o.order#=oi.order#
            JOIN books b ON oi.isbn=b.isbn
WHERE o.customer# = 1017;

-- Problem 5

SELECT TO_CHAR(min(retail), '$999.00') AS "Least Expensive Computer Book"
FROM books
WHERE category = 'COMPUTER';

-- Problem 6

SELECT TO_CHAR(avg(oi.paideach - b.cost), '$999.00') AS "Average Profit by Orders"
FROM orders o JOIN orderitems oi ON o.order#=oi.order#
              JOIN books b ON oi.isbn=b.isbn;

-- Problem 7

SELECT customer# AS "Customer Number", count(*) AS "Number of orders Placed"
FROM orders
GROUP BY customer#;

-- Problem 8

SELECT INITCAP(p.name) AS "Publisher Name", INITCAP(b.category) AS "Category", TO_CHAR(avg(b.retail), '$999.00') AS "Average Retail Price"
FROM books b JOIN publisher p ON b.pubid=p.pubid
WHERE category IN('CHILDREN', 'COMPUTER')
GROUP BY p.name, b.category
HAVING avg(b.retail) > 50;

-- Problem 9

SELECT DISTINCT(INITCAP(c.firstname || ' ' || c.lastname)) AS "Customer with orders over $80", c.state AS "State"
FROM customers c JOIN orders o ON c.customer#=o.customer#
                 JOIN orderitems oi ON o.order#=oi.order#
WHERE c.state IN('GA', 'FL') AND oi.paideach > 80
ORDER BY c.state;

-- Problem 10

SELECT TO_CHAR(max(retail), '$999.00') AS "Lisa White's highest book"
FROM books b JOIN bookauthor ba ON b.isbn=ba.isbn
             JOIN author a ON ba.authorid=a.authorid
WHERE a.Lname = 'WHITE' AND a.Fname = 'LISA';
