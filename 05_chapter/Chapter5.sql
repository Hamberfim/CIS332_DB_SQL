/* Written by Anthony Hamlin
   CIS332 - Chapter 5 Assignment
*/

-- Problem 1

INSERT INTO orders (order#, customer#, orderdate)
VALUES (1021, 1009, TO_DATE('20-JUL-2009'));

-- Problem 2

UPDATE orders
SET shipzip = 33222
WHERE order# = 1017;

-- Problem 3

COMMIT;

-- Problem 4

INSERT INTO orders (order#, customer#, orderdate)
VALUES (1022, 2000, TO_DATE('06-AUG-2009'));

-- Referential issue. There is no matching key in the parent table.

-- Problem 5

INSERT INTO orders (order#, customer#)
VALUES (1023, 1009);

-- NULL Value issue. An orderdate is required.

-- Problem 6

UPDATE books
SET cost = '&cost'
WHERE ISBN = '&ISBN';

-- Problem 7

-- above script executed with the following values:  cost = 20.00 / isbn = 1059831198

-- Problem 8

ROLLBACK;

-- Problem 9

DELETE FROM orderitems
WHERE order# = 1005;

DELETE FROM orders
WHERE order# = 1005;

-- Problem 10

ROLLBACK;
