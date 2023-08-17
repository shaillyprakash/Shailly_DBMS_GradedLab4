# Q7) Display the Id and Name of the Product ordered after “2021-10-05”. 

SELECT PRODUCT.PRO_ID, PRODUCT.PRO_NAME FROM `ORDER`
INNER JOIN SUPPLIER_PRICING 
ON SUPPLIER_PRICING.PRICING_ID = `ORDER`.PRICING_ID
INNER JOIN PRODUCT 
ON PRODUCT.PRO_ID = SUPPLIER_PRICING.PRO_ID
WHERE `ORDER`.ORD_DATE > '2021-10-05';

