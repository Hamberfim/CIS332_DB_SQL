/* Written by Anthony Hamlin
   CIS332 - Chapter 10 Assignment
*/

-- EXTRA 

SELECT customer#, state, DECODE (state, 'CA', 0.08,
                                        'FL', 0.07,
                                        'GA', 0.06,
                                              0.05) AS "Sales Tax Rate"
FROM customers
WHERE state IN('CA', 'FL', 'GA', 'IA', 'TX');

-- Problem 1

SELECT INITCAP(Firstname || ' ' || Lastname) AS "Customer Name"
FROM CUSTOMERS;

-- Problem 2

SELECT c.customer# AS "Customer#", 
       NVL2(c.referred, 'REFERRED', 'NOT REFERRED') AS "Referred by"
FROM customers c LEFT JOIN customers r
ON c.referred = r.customer#
ORDER BY c.lastname;

-- Problem 3

SELECT INITCAP(b.title) AS "Title", TO_CHAR((oi.paideach - b.cost), '$999.00') AS "Profit"
FROM orders o LEFT JOIN orderitems oi
ON o.order#=oi.order#
            join books b on oi.isbn=b.isbn
WHERE o.order# = '1002';

-- Problem 4

SELECT INITCAP(title) AS "Title", TO_CHAR((ROUND((retail / cost)*100)) || '%') AS "Markup %"
FROM books;

-- Problem 5

SELECT TO_CHAR(SYSDATE, 'Day') || ', ' || TO_CHAR(SYSDATE, 'hh:mm:ss') AS "Day and Time"
FROM DUAL;


-- Problem 6

SELECT INITCAP(title) AS "TITLE", LPAD(cost, 12, '*') AS "Cost"
FROM books;

-- Problem 7

SELECT DISTINCT LENGTH(ISBN) AS "Length of ISBN Data Field"
FROM books;

-- Problem 8

SELECT INITCAP(title) AS "Title", pubdate AS "Publication Date", TO_CHAR(SYSDATE, 'DD-MON-YY') AS "Current Date",
        ROUND(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_DATE(pubdate, 'DD-MON-YY'))) AS "Age in Months"
FROM books;

-- Problem 9

SELECT next_day(SYSDATE, 'WEDNESDAY') AS "Date of Next Wednesday"
FROM dual;

-- Problem 10

SELECT customer# AS "Customer#", SUBSTR(zip,3,2) AS "3rd/4th digits in zip", INSTR(zip, '3') AS "Position of first 3 in zip"
FROM customers;