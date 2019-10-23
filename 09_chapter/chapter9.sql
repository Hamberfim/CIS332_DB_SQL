/* Written by Anthony Hamlin
   CIS332 - Chapter 9 Assignment
*/

-- Problem 1

SELECT b.title AS "Book Title", p.contact AS "Contact Name", p.phone AS "Contact Phone#"
FROM books b INNER JOIN publisher p
ON b.pubid = p.pubid;

-- Problem 2

SELECT c.Firstname || ' ' || c.Lastname AS "Customer Name", o.orderdate, o.shipdate
FROM orders o INNER JOIN customers c
ON c.customer# = o.customer#
WHERE shipdate IS NULL
ORDER BY o.orderdate;

-- Problem 3

SELECT DISTINCT(c.Firstname || ' ' || c.Lastname) AS "Customer Name", b.category AS "Book Category"
FROM books b, customers c INNER JOIN orders o
ON c.customer# = o.customer#
WHERE State = 'FL' AND category = 'COMPUTER';

-- Problem 4

SELECT DISTINCT (c.firstname || ' ' || c.lastname) AS "Customer Name", b.title 
FROM customers c, books b, orders o, orderitems m
WHERE c.customer# = o.customer#
AND o.order# = m.order#
AND m.ISBN = b.ISBN
AND c.lastname = 'LUCAS';

-- Problem 5

SELECT DISTINCT (c.firstname || ' ' || c.lastname) AS "Customer Name", b.title, o.orderdate, (m.paideach - b.cost) AS "Profit"
FROM customers c, books b, orders o, orderitems m
WHERE c.customer# = o.customer#
AND o.order# = m.order#
AND m.ISBN = b.ISBN
AND c.lastname = 'LUCAS'
ORDER BY o.orderdate, "Profit" DESC;

-- Problem 6

SELECT DISTINCT b.title AS "Book Title", a.Lname AS "Author's Last Name"
FROM books b, bookauthor ba, author a
WHERE b.ISBN = ba.ISBN
AND ba.authorid = a.authorid
AND Lname = 'ADAMS';

-- Problem 7

SELECT b.title, b.retail, p.gift
FROM books b, promotion p
WHERE b.title = 'SHORTEST POEMS'
AND b.retail BETWEEN p.minretail AND p.maxretail;

-- Problem 8

SELECT DISTINCT (c.firstname || ' ' || c.lastname) AS "Customer Name", (a.fname || ' ' || a.lname) AS "Author's Name" 
FROM customers c, books b, orders o, orderitems m, bookauthor ba, author a
WHERE c.customer# = o.customer#
AND o.order# = m.order#
AND m.ISBN = b.ISBN
AND ba.authorid = a.authorid
AND c.lastname = 'NELSON';

-- Problem 9

SELECT b.title, o.order#, c.state 
FROM books b LEFT OUTER JOIN orderitems m 
ON b.ISBN = m.ISBN
LEFT OUTER JOIN orders o 
ON o.order# = m.order#
LEFT OUTER JOIN customers c 
ON c.customer# = o.customer#
ORDER BY b.title;

-- Problem 10

SELECT (e.fname || ' ' || e.lname) AS "Employee Name", e.job AS "Job Title", (m.fname || ' ' || m.lname) AS "Manager"
FROM employees e, employees m
WHERE e.mgr = m.empno;
