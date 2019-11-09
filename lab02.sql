/* Written by Anthony Hamlin
   CIS332 - Lab Exam 2 - Nov 7, 2019
*/

-- Problem 1

SELECT DISTINCT INITCAP(p.name) AS "Publisher Name"
FROM books b JOIN publisher p ON b.pubid = p.pubid
WHERE b.category = 'CHILDREN';

-- Problem 2

SELECT INITCAP(a.fname || ' ' || a.lname) AS "Author Name"
FROM books b JOIN bookauthor ba ON b.ISBN=ba.ISBN 
             JOIN author a ON a.AUTHORID = ba.AUTHORID
WHERE b.title = 'DATABASE IMPLEMENTATION'
ORDER BY a.lname;

-- Problem 3

SELECT INITCAP(a.fname || ' ' || a.lname) AS "Author Name"
FROM books b JOIN bookauthor ba ON b.ISBN=ba.ISBN 
             JOIN author a ON a.AUTHORID = ba.AUTHORID
WHERE b.category = 'FAMILY LIFE'
ORDER BY a.lname;

-- Problem 4

SELECT o.order# AS "Order Number"
FROM orders o join orderitems oi on o.order#=oi.order#
              join books b    on oi.isbn=b.isbn
WHERE b.title = 'REVENGE OF MICKEY'
ORDER BY o.order#;

-- Problem 5

SELECT DISTINCT c.customer# AS "Customer Number"
FROM customers c JOIN orders o ON c.customer#=o.customer#
WHERE c.ZIP <> o.SHIPZIP;

