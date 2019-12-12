/* Written by Anthony Hamlin
   CIS332 - Lab Exam 03 -- Dec 12
*/

--Problem 1

SELECT INITCAP(b.title) AS "Title", INITCAP(TO_CHAR(b.retail, '$999.99')) AS "Lowest Retail Price", INITCAP(p.name) AS "Publisher" 
FROM books b JOIN publisher p ON b.pubid = p.pubid
WHERE b.retail = (SELECT MIN(retail) FROM books);

-- Problem 2

SELECT isbn, INITCAP(title) AS "Title", TO_CHAR(Pubdate,'fmMonth dd, yyyy') AS "Publish Date" 
FROM books 
WHERE pubid = (SELECT pubid FROM books WHERE title = 'PAINLESS CHILD-REARING') AND title <> 'PAINLESS CHILD-REARING'
ORDER BY 1;

-- Problem 3

SELECT INITCAP(b.title) AS "Title", oi.quantity AS "Number of Copies Sold"
FROM orderitems oi JOIN books b ON oi.isbn=b.isbn;

--SELECT INITCAP(b.title) AS "Title", (SELECT MAX(COUNT(*)) FROM orderitems GROUP BY title) AS "Number of Copies Sold"
--FROM orderitems oi JOIN books b ON oi.isbn=b.isbn;


-- Problem 4

SELECT INITCAP(category) AS "Category", INITCAP(title) AS "Title", INITCAP(TO_CHAR(retail, '$999.99')) AS "Retail Price" 
FROM books
--WHERE retail = (SELECT MIN(retail) FROM books) 
ORDER BY category;

