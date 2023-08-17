# Q8) Display customer name and gender whose names start or end with character 'A'.

SELECT * FROM CUSTOMER AS C;
SELECT * FROM CUSTOMER AS C WHERE C.CUS_NAME = 'MEGHA'; 
SELECT C.CUS_NAME,C.CUS_GENDER FROM customer AS C WHERE (C.CUS_NAME LIKE  'A%' OR C.CUS_NAME LIKE  '%A');


