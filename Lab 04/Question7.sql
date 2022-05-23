-- Question 7 : Display the Id and Name of the Product ordered after “2021-10-05”.

use ecommerce;

select PRO_ID, PRO_NAME from product where PRO_ID in ( 
	select PRO_ID from supplier_pricing where PRICING_ID in (
		select PRICING_ID from `order` where ORD_DATE > '2021-10-05'
	)
);