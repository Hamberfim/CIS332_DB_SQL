--  CIS332 - Lab Exam 2 Solutions

--   Problem 1

select initcap(p.name)  "Publisher Name"
from books b join publisher p on b.pubid=p.pubid
where b.category='CHILDREN'
order by 1;


--  Problem 2

select initcap(a.fname || ' ' || a.lname) "Author Name"
from books b join bookauthor ba on b.isbn=ba.isbn
             join author a on ba.authorid=a.authorid
where b.title='DATABASE IMPLEMENTATION'
order by a.lname;


--  Problem 3

select initcap(a.fname || ' ' || a.lname) "Author Name"
from books b join bookauthor ba on b.isbn=ba.isbn
             join author a on ba.authorid=a.authorid
where category='FAMILY LIFE'
order by a.lname;


--  Problem 4

select o.order# "Order Number"
from orders o join orderitems oi on o.order#=oi.order#
              join books b on oi.isbn=b.isbn
where b.title='REVENGE OF MICKEY'
order by 1;   


--  Problem 5

select distinct c.customer# "Customer Number"
from customers c join orders o on c.customer#=o.customer#
where c.zip != o.shipzip
order by 1;


 


