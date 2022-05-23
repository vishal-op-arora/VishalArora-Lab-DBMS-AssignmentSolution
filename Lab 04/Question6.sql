-- Question 6 : Find the least expensive product from each category and print the table with category id, name, product name and price of the product 

use ecommerce;

select c.CAT_ID, c.CAT_NAME, p.PRO_NAME, sp.SUPP_PRICE from category as c
	inner join product as p on c.CAT_ID = p.CAT_ID
	inner join supplier_pricing as sp on sp.PRO_ID=p.PRO_ID
	group by c.CAT_NAME 
    having min(sp.SUPP_PRICE);
