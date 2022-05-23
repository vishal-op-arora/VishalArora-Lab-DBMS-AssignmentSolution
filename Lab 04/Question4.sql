-- Question 4 : Display all the orders along with product name ordered by a customer having Customer_Id=2

use ecommerce;

select customer.CUS_NAME, `order`.ORD_ID, `order`.ORD_DATE, supplier.SUPP_NAME, product.PRO_NAME, supplier_pricing.PRICING_ID  from `order` 
	inner join customer on `order`.CUS_ID = customer.CUS_ID 
	inner join supplier_pricing on `order`.PRICING_ID = supplier_pricing.PRICING_ID
	inner join supplier on supplier.SUPP_ID = supplier_pricing.SUPP_ID
	inner join product on supplier_pricing.PRO_ID = product.PRO_ID
	where `order`.CUS_ID=2;
