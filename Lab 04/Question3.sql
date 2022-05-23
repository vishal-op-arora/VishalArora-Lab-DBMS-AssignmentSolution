-- Question 3: Display the total number of customers based on gender who have placed orders of worth at least Rs.3000

-- select * from customer;
-- select * from `order` where ORD_AMOUNT >= 3000;
-- select count(*), CUS_GENDER from customer where CUS_ID in (select C.CUS_ID from customer as c inner join `order` as o on c.CUS_ID = o.CUS_ID where o.ORD_AMOUNT>=3000) group by CUS_GENDER;

use ecommerce;

select CUS_GENDER, count(*) from customer where CUS_ID in (select CUS_ID from `order` where ORD_AMOUNT >= 3000) group by CUS_GENDER;
