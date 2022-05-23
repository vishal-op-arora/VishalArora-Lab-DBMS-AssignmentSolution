CREATE DEFINER = `root`@`localhost` PROCEDURE `new_procedure`()
BEGIN
	select `order`.PRICING_ID, avg(rating.RAT_RATSTARS) as rating, 
		case 
			when avg(rating.RAT_RATSTARS) = 5 
				then 'Excellent Service'
			when avg(rating.RAT_RATSTARS) > 4 
				then 'Good Service'
			when avg(rating.RAT_RATSTARS) < 2 
				then 'Average Service'
			else 'Poor Service' end as Type_of_Service from `order` 
        
		inner join rating where `order`.ORD_ID=rating.ORD_ID group by `order`.PRICING_ID;
END