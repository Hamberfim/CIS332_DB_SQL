/* Written by Anthony Hamlin
   CIS332 - Chapter 2 Assignment
*/

-- Problem 1

SELECT * 
FROM books;

-- Problems 2

SELECT title 
FROM books;

-- Problem 3

SELECT title,
    pubdate "Publication Date"
FROM books;

-- Problem 4 

SELECT customer#, city, state
FROM customers;

-- Problem 5

SELECT name, contact "Contact Person", phone
FROM publisher;

-- Problem 6

SELECT DISTINCT category
FROM books;

-- Problem 7

SELECT DISTINCT customer#  -- trying unique instead of distinct
FROM orders;

-- problem 8

SELECT category, title
FROM books;

-- Problem 9

SELECT lname || ', ' || fname
FROM author;

-- Problem 10

 SELECT order#, item#, isbn, quantity, paideach, quantity * paideach AS "Item Total"
 FROM orderitems;
 
 