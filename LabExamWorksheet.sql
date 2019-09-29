/* Written by Anthony Hamlin
   CIS332 - Practice Lab Exam
*/

-- Problem 1 
-- LAB0101

DROP TABLE employees;

CREATE TABLE employees
    (id number(4), first_name varchar2(25), middle_name varchar2(25), 
        last_name varchar2(25), dept_id number(4));

SAVEPOINT ONE;

-- Problem 2
-- LAB0102

DROP TABLE departments;

CREATE TABLE departments
    (id number(4), name varchar2(30), manager number(4));

SAVEPOINT TWO;

-- Problem 3
-- LAB0103

ALTER TABLE employees
MODIFY last_name varchar2(30);

ALTER TABLE employees
SET UNUSED (middle_name);

ALTER TABLE employees
DROP UNUSED COLUMNS;

ALTER TABLE employees
ADD CONSTRAINT emp_id_pk PRIMARY KEY (id);

ALTER TABLE departments
ADD CONSTRAINT dept_id_pk PRIMARY KEY (id);

ALTER TABLE employees
ADD CONSTRAINT emp_id_fk FOREIGN KEY (id) 
REFERENCES departments (id);

ALTER TABLE departments
ADD CONSTRAINT dept_mamager_fk FOREIGN KEY (id) 
REFERENCES employees (id);

SAVEPOINT THREE;

-- Problem 4
-- LAB0104

ALTER TABLE employees
ADD (status CHAR(1) DEFAULT 'A', CONSTRAINT comm_A_I_ck CHECK (status IN ('A', 'I')));

SAVEPOINT FOUR;

-- Problem 5
-- LAB0105

DROP SEQUENCE depts_seq;

CREATE SEQUENCE depts_seq
INCREMENT BY 10
START WITH 100
MAXVALUE 9900
NOCYCLE;

