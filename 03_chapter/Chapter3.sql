/* Written by Anthony Hamlin
   CIS332 - Chapter 3 Assignment
*/

-- Problem 1

CREATE TABLE category
(CatCode CHAR(2), CarDesc varchar2(10));

-- Problem 2

CREATE TABLE employees
(Emp# number(5), Lastname varchar2(35), Firstname varchar2(35), Job_class varchar2(4));

-- Problem 3

ALTER TABLE employees
ADD (EmpDate DATE DEFAULT sysdate, EndDate CHAR(8));

-- Problem 4

ALTER TABLE employees
MODIFY (Job_class char(2));

-- Problem 5

ALTER TABLE employees
SET UNUSED (EndDate);

ALTER TABLE employees
DROP UNUSED COLUMNS;

-- Problem 6

RENAME Employees TO JL_EMPS;

-- Problem 7

CREATE TABLE BOOK_PRICING
AS (SELECT ISBN AS ID, Cost, Retail, Category 
FROM books);

-- Problem 8

ALTER TABLE BOOK_PRICING
SET UNUSED (Category);

SELECT * FROM BOOK_PRICING;  -- verifing category column is not available

-- Problem 9

TRUNCATE TABLE BOOK_PRICING;

SELECT * FROM BOOK_PRICING;  -- verifing table nolonger contains data

-- Problem 10

DROP TABLE BOOK_PRICING PURGE;

DROP TABLE JL_EMPS;

FLASHBACK TABLE JL_EMPS
TO BEFORE DROP;

