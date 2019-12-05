--  Create data for Excel pivot table

select isbn, title, pubdate,cost, retail, discount, category,
       name, contact, phone
from publisher join books using (pubid)
order by name, category;


--  Display Subtotal for each Publisher / Category combination

select name, category, count(isbn)
from books join publisher using (pubid)
group by name, category
order by 1,2;

--  Display Subtotal for each Publisher

select name, count(isbn)
from books join publisher using (pubid)
group by name
order by 1;


--  Display Subtotal for each Category

select category, count(isbn)
from books join publisher using (pubid)
group by category
order by 1;


--  Display Grand Total

select count(isbn)
from books join publisher using (pubid);


--  Use Grouping Sets to display all Subtotal combinations

select name, category, count(isbn)
  from books join publisher using (pubid)
group by grouping sets ((name,category), name, category, ());


--  Use Cube to display all Subtotal combinations

select name, category, count(isbn)
  from books join publisher using (pubid)
group by cube(name, category)
order by 1,2;



--  Use Rollup to display Total for each Category

select name, count(isbn)
from books join publisher using(pubid)
group by rollup(name)
order by 1;


--  Display Grand Total

select name, category, count(isbn)
from books join publisher using(pubid)
group by rollup(name, category)
order by 1,2;


--  Does not display Grand Total

select name, category, count(isbn)
from books join publisher using(pubid)
group by name, rollup(category)
order by 1,2;



