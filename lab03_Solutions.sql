--   CIS332 - Lab Exam 3 Solution
--   12/12/2019

--  Problem 1

select initcap(b.title)               "Title", 
       to_char(b.retail,'$99.00')     "Lowest Retail Price",
       initcap(p.name)                "Publisher"
from books b join publisher p on b.pubid=p.pubid
where retail =  (select min(retail) from books);


--  Problem 2

select isbn, 
       initcap(title)                       "Title", 
       to_char(pubdate,'fmMonth dd, yyyy')  "Publish Date"
  from books
 where pubid = (select p.pubid 
                  from publisher p join books b on p.pubid=b.pubid
                 where initcap(b.title) = 'Painless Child-Rearing')
  and initcap(title) != 'Painless Child-Rearing'
order by 1;


--  Problem 3

select initcap(b.title)         "Title",
       nvl(sum(oi.quantity),0)  "Number of Copies Sold"
  from books b left outer join orderitems oi on b.isbn = oi.isbn
 group by b.title
 order by 1;
 
 
--  Problem 4

select initcap(b.category)          "Category", 
       initcap(b.title)             "Title", 
       to_char(b.retail,'$99.00')   "Retail Price"
from books b join (select category,
                          min(retail)  min_retail
                     from books
                    group by category) a on b.category = a.category and b.retail = a.min_retail
order by 1;