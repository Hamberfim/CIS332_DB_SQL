/* Written by Anthony Hamlin
   CIS332 - Chapter 8 Assignment
*/

-- Problem 1

SELECT lastname , firstname , state 
FROM customers
WHERE state = 'NJ';

-- Problem 2

SELECT order#, shipdate
FROM orders
WHERE shipdate > '01-APR-09';

-- Problem 3

SELECT title, category
FROM books
WHERE category <> 'FITNESS';

-- Problem 4

SELECT customer#, lastname, state 
FROM customers
WHERE state = 'NJ' OR state = 'GA'
ORDER BY lastname;

SELECT customer#, lastname, state 
FROM customers
WHERE state IN ('NJ', 'GA')
ORDER BY lastname;

-- Problem 5

SELECT order#, orderdate
FROM orders
WHERE orderdate <= '01-APR-09';

SELECT order#, orderdate
FROM orders
WHERE orderdate < '01-APR-09' OR orderdate = '01-APR-09';

-- Problem 6

SELECT lname, fname
FROM author
WHERE lname LIKE '%IN%'
ORDER BY lname, fname;

-- Problem 7

SELECT lastname, referred
FROM customers
WHERE referred IS NOT NULL;

-- Problem 8

SELECT title, category
FROM books
WHERE category LIKE 'CHI%' OR category LIKE 'COO%';

SELECT title, category
FROM books
WHERE category = 'CHILDREN' OR category = 'COOKING';

SELECT title, category
FROM books
WHERE category IN ('CHILDREN', 'COOKING');

-- Problem 9

SELECT isbn, title
FROM books
WHERE title LIKE '_A_N%'
ORDER BY title DESC;

-- Problem 10

SELECT title, pubdate
FROM books
WHERE pubdate BETWEEN '01-JAN-05' AND '31-DEC-05';

SELECT title, pubdate
FROM books
WHERE pubdate >= '01-JAN-05' AND pubdate <='31-DEC-05';

SELECT title, pubdate
FROM books
WHERE pubdate LIKE '%-05';
