-- Question 5 : Display the Supplier details who can supply more than one product.

use ecommerce;

select s.SUPP_NAME, count(p.PRO_NAME) as product_count from supplier as s 
	inner join supplier_pricing as sp on s.SUPP_ID = sp.SUPP_ID
	inner join product as p on p.PRO_ID = sp.PRO_ID 
    group by s.SUPP_NAME 
    having count(p.PRO_NAME) > 1;
