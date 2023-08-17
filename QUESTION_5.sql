# Q5) Display the Supplier details of who is supplying more than one product.


SELECT * from SUPPLIER_PRICING;
SELECT SUPP_ID FROM SUPPLIER_PRICING GROUP BY supp_id HAVING COUNT(supp_id) > 2;

SELECT * FROM SUPPLIER AS S
INNER JOIN 
(
	SELECT SUPP_ID FROM SUPPLIER_PRICING GROUP BY SUPP_ID HAVING COUNT(SUPP_ID) >2
    
) AS TEST
ON TEST.SUPP_ID=S.SUPP_ID;

