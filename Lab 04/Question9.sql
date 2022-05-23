-- Question 9 : Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent 
-- Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”

drop procedure if exists supplierRatings ;
DELIMITER &&  
CREATE PROCEDURE supplierRatings ()  
BEGIN  
	
    SELECT sup.SUPP_ID as 'Supplier ID',sup.SUPP_NAME as 'Supplier Name', AVG(rate.RAT_RATSTARS) as 'Average Rating',
		CASE 
			when avg(rate.RAT_RATSTARS) = 5 then "Excellent Service"
			when avg(rate.RAT_RATSTARS) > 4 then "Good Service"
			when avg(rate.RAT_RATSTARS) > 2 then "Average Service"
			else "Poor Service"
		END as typeOfServices
    FROM supplier sup 
    JOIN Supplier_pricing sp
	ON sup.SUPP_ID = sp.SUPP_ID  
    JOIN `order` o
    ON sp.PRICING_ID=o.PRICING_ID
    JOIN rating rate
    ON o.ORD_ID=rate.ORD_ID GROUP BY (sup.SUPP_ID );
END &&  
DELIMITER ;  

use ecommerce;
call supplierRatings();