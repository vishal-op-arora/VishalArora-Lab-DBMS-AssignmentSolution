-- Question 8 : Display customer name and gender whose names start or end with character 'A'. 

use ecommerce;

select CUS_NAME, CUS_GENDER from customer where CUS_NAME like "A%" or CUS_NAME like "%A";
