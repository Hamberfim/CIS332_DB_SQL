/* Written by Anthony Hamlin
   CIS332 - Midterm Lab Exam - Oct 3, 2019
*/

-- Problem 1
DROP TABLE automaker;

CREATE TABLE automaker
(id number(4), automaker_name varchar2(20), country_id char(1),
CONSTRAINT automaker_id_pk PRIMARY KEY (id));

-- Problem 2

DROP TABLE country;

CREATE TABLE country
(id char(1), country_name varchar2(25), tariff char(1),
CONSTRAINT contry_id_pk PRIMARY KEY (id));

SAVEPOINT TWO;

-- Problem 3

ALTER TABLE automaker
ADD CONSTRAINT automaker_country_fk FOREIGN KEY (country_id) 
REFERENCES country (id);

ALTER TABLE automaker
MODIFY (automaker_name CONSTRAINT automaker_automaker_name_nn NOT NULL);

ALTER TABLE country 
MODIFY (tariff DEFAULT 'N' CONSTRAINT tariff_yes_no_ck CHECK (tariff IN ('Y', 'N')));  
 
SAVEPOINT THREE;

-- Problem 4

DROP SEQUENCE automaker_id_seq;

CREATE SEQUENCE automaker_id_seq
START WITH 100
INCREMENT BY 5
MAXVALUE 1000
NOCYCLE;

SAVEPOINT FOUR;

-- Problem 5

SELECT automaker_id_seq.nextval
FROM DUAL;

SELECT automaker_id_seq.currval
FROM DUAL;

SELECT *
FROM user_constraints
WHERE table_name = 'country';
