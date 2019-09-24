/* Written by Anthony Hamlin
   CIS332 - Chapter 4 Assignment
*/

-- Problem 1

CREATE TABLE store_reps
(rep_ID NUMBER(5), last VARCHAR2(15), first VARCHAR2(10), comm CHAR(1) DEFAULT 'Y',
CONSTRAINT rep_repid_pk PRIMARY KEY (rep_ID));

-- Problem 2

ALTER TABLE store_reps
MODIFY (last CONSTRAINT store_reps_last_nn NOT NULL);

ALTER TABLE store_reps
MODIFY (first CONSTRAINT store_reps_first_nn NOT NULL);

-- Problem 3

ALTER TABLE store_reps 
MODIFY (comm DEFAULT 'Y' CONSTRAINT comm_yes_no_ck CHECK (comm IN ('Y', 'N')));  

-- Problem 4

ALTER TABLE store_reps
ADD (Base_salary NUMBER(7, 2), CONSTRAINT Base_salary_ck CHECK (Base_salary > 0));

-- Problem 5

CREATE TABLE BOOK_STORES
(Store_ID number(8), Name VARCHAR2(30), Contact VARCHAR2(30), Rep_ID VARCHAR(5),
CONSTRAINT BOOK_STORES_Storeid_pk PRIMARY KEY (Store_ID),
CONSTRAINT BOOK_STORES_Name_uk UNIQUE (Name));

-- Problem 6

ALTER TABLE BOOK_STORES
MODIFY Rep_ID NUMBER(5);

ALTER TABLE BOOK_STORES
ADD CONSTRAINT BOOK_STORES_store_repsid_fk FOREIGN KEY (Rep_ID) 
REFERENCES store_reps (Rep_ID);

-- Problem 7

ALTER TABLE BOOK_STORES
DROP CONSTRAINT BOOK_STORES_store_repsid_fk;

ALTER TABLE BOOK_STORES
ADD CONSTRAINT BOOK_STORES_store_repsid_fk FOREIGN KEY (Rep_ID) 
REFERENCES store_reps (Rep_ID) ON DELETE CASCADE;

-- Problem 8  -- could not solve this one on my own   -- solution from stackoverflow

CREATE TABLE REP_CONTRACTS
(store_id NUMBER(8), name NUMBER(5), quarter CHAR(3), rep_ID NUMBER(5));

ALTER TABLE REP_CONTRACTS
ADD CONSTRAINT cmpst_repcntrcts_pk PRIMARY KEY (rep_ID, store_id, quarter);

ALTER TABLE REP_CONTRACTS 
ADD CONSTRAINT  cmpst_repcntrcts_st_uk unique(STORE_ID);

ALTER TABLE REP_CONTRACTS 
ADD CONSTRAINT  cmpst_repcntrcts_rep_uk unique(REP_ID);

ALTER TABLE REP_CONTRACTS 
ADD CONSTRAINT storeid_fk FOREIGN KEY(STORE_ID) REFERENCES REP_CONTRACTS(store_id);

ALTER TABLE REP_CONTRACTS 
ADD CONSTRAINT repid_fk FOREIGN KEY(REP_ID) REFERENCES REP_CONTRACTS(rep_ID);

-- Problem 9

SELECT constraint_name, column_name
FROM user_cons_columns
WHERE table_name = 'STORE_REPS';

-- Problem 10

ALTER TABLE STORE_REPS
DISABLE CONSTRAINT COMM_YES_NO_CK;

ALTER TABLE STORE_REPS
ENABLE CONSTRAINT COMM_YES_NO_CK;