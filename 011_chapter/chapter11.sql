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

SELECT sum((oi.paideach - b.cost) * oi.quantity) AS "Profit"
FROM orders o JOIN orderitems oi ON  o.order#=oi.order#
            JOIN books b ON oi.isbn=b.isbn
WHERE o.customer# = 1017;