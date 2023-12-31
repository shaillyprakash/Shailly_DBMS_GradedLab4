CREATE PROCEDURE `CALL_RATINGS` ()
BEGIN

SELECT REPORT.SUPP_ID, REPORT.SUPP_NAME, REPORT.AVERAGE,
    CASE 
        WHEN REPORT.AVERAGE = 5 THEN 'Excellent Service'
        WHEN REPORT.AVERAGE > 4 THEN 'Good Service'
        WHEN REPORT.AVERAGE > 2 THEN 'Average Service'
        ELSE 'Poor Service'
    END AS Type_of_Service FROM 
    (
		SELECT FINAL.SUPP_ID, SUPPLIER.SUPP_NAME, FINAL.AVERAGE FROM 
        (
			SELECT TEST2.SUPP_ID,SUM(TEST2.RAT_RATSTARS) / COUNT(TEST2.RAT_RATSTARS) AS AVERAGE FROM 
            (
				SELECT SUPPLIER_PRICING.SUPP_ID, TEST.ORD_ID, TEST.RAT_RATSTARS FROM SUPPLIER_PRICING
				INNER JOIN 
                (
					SELECT `ORDER`.PRICING_ID, RATING.ORD_ID, RATING.RAT_RATSTARS FROM `ORDER`
					INNER JOIN RATING 
                    ON RATING.`ORD_ID` = `ORDER`.ORD_ID
				) AS TEST 
                ON TEST.PRICING_ID = SUPPLIER_PRICING.PRICING_ID
			) AS TEST2 GROUP BY SUPPLIER_PRICING.SUPP_ID
        ) AS FINAL 
        INNER JOIN SUPPLIER 
        ON FINAL.SUPP_ID = SUPPLIER.SUPP_ID 
	) AS REPORT;

END
