/* Written by Anthony Hamlin
   CIS332 - Chapter 6 Assignment
*/

-- Problem 1

CREATE SEQUENCE customers_customer#_seq
INCREMENT BY 1
START WITH 1021
NOCACHE
NOCYCLE;

-- Problem 2

INSERT INTO customers (customer#, lastname, firstname, zip)
VALUES (customers_customer#_seq.NEXTVAL, 'Shoulders', 'Frank', 23567);

-- Problem 3

CREATE SEQUENCE my_first_seq
INCREMENT BY -3
START WITH 5
MAXVALUE 5
MINVALUE 0
NOCACHE;

-- Problem 4

SELECT my_first_seq.nextval
FROM DUAL;

SELECT my_first_seq.nextval
FROM DUAL;

SELECT my_first_seq.nextval
FROM DUAL;

-- The next value is below the minimum value set.

-- Problem 5

ALTER SEQUENCE my_first_seq
MINVALUE -1000;

-- Problem 6

CREATE TABLE email_log
(emailid NUMBER GENERATED AS IDENTITY PRIMARY KEY, emaildate DATE DEFAULT (SYSDATE), customer# number(4));

INSERT INTO email_log (emaildate, customer#)
VALUES (DEFAULT, 1007);

INSERT INTO email_log (emailid, emaildate, customer#)
VALUES (DEFAULT, DEFAULT, 1008);

INSERT INTO email_log (emailid, emaildate, customer#)
VALUES (25, DEFAULT, 1009);  -- can not insert a value in a identity column. it has to be don by the sequence generator

-- Problem 7

CREATE SYNONYM numgen
FOR my_first_seq;

-- Problem 8

SELECT numgen.currval
FROM DUAL;

DROP SYNONYM numgen;

-- Problem 9

CREATE BITMAP INDEX customers_state_idx
ON customers (state);

SELECT table_name, index_name, index_type
FROM user_indexes
WHERE table_name = 'CUSTOMERS';

DROP INDEX customers_state_idx;

-- Problem 10

CREATE INDEX customers_lastname_idx
ON customers (lastname);

SELECT table_name, index_name, index_type
FROM user_indexes
WHERE table_name = 'CUSTOMERS';

DROP INDEX customers_lastname_idx;

-- Problem 11

CREATE INDEX orders_orderdate_shipdate_idx
ON orders(shipdate-orderdate);

-- verifing
SELECT table_name, index_name, index_type
FROM user_indexes
WHERE table_name = 'ORDERS';

-- testing
SELECT orderdate, shipdate,(shipdate-orderdate) AS orderdate_shipdate_diff
FROM orders;