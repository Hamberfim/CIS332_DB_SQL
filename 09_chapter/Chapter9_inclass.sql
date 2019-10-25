--  Chapter 9 Assignment


--  Problem 1

select b.title,
       b.pubid,
       p.pubid,
       p.name,
       p.contact,
       p.phone
  from books b join publisher p on b.pubid=p.pubid;
  
select b.title,
       p.name,
       p.contact,
       p.phone
  from books b, publisher p 
  where b.pubid=p.pubid;
  
--  Problem 2
   
select c.firstname || ' ' || c.lastname  "Customer",
       o.orderdate
 from  customers c join orders o on c.customer#=o.customer#
 where o.shipdate is null
 order by o.orderdate;      



--  Problem 3

select distinct c.firstname || ' ' || c.lastname  "Customer"
from customers c join orders o      on c.customer#=o.customer#
                 join orderitems oi on o.order#=oi.order#
                 join books b       on oi.isbn=b.isbn
  where b.category='COMPUTER'
    and c.state = 'FL';
    
--  Problem 4

select o.order#,
       o.orderdate,
       b.title,
       oi.paideach - b.cost   "Profit"
from customers c join orders o      on c.customer#=o.customer#
                 join orderitems oi on o.order#=oi.order#
                 join books b       on oi.isbn=b.isbn
where c.firstname = 'JAKE' and c.lastname='LUCAS'
order by 2, 4 desc;

--  Problem 7

select p.gift
from books b join promotion p on b.retail between p.minretail and p.maxretail
where b.title = 'SHORTEST POEMS';

select isbn from books
minus
select distinct isbn from orderitems;

select b.title, oi.order#
from  books b left join orderitems oi on b.isbn=oi.isbn
order by oi.order#;











   