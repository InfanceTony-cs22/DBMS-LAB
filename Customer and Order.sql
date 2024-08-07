 List names and addresses of customers who ordered products > 500.

sql
Copy code
SELECT DISTINCT c.Name, c.Address
FROM CUSTOMER c
JOIN ORDER o ON c.Customer_id = o.Customer_id
WHERE o.Price > 500;
b) List product names ordered costing >= 1000.

sql
Copy code
SELECT DISTINCT Product_Name
FROM ORDER
WHERE Price >= 1000;
c) List product names ordered by customers from Delhi.

sql
Copy code
SELECT DISTINCT o.Product_Name
FROM ORDER o
JOIN CUSTOMER c ON o.Customer_id = c.Customer_id
WHERE c.City = 'Delhi';
d) Add Email_id column in CUSTOMER table.

sql
Copy code
ALTER TABLE CUSTOMER ADD (Email_id VARCHAR2(100));
e) Function to get customer address.

sql
Copy code
CREATE OR REPLACE FUNCTION Get_Customer_Address (c_id IN NUMBER) RETURN VARCHAR2 IS
    address VARCHAR2(255);
BEGIN
    SELECT Address INTO address
    FROM CUSTOMER
    WHERE Customer_id = c_id;
    RETURN address;
END;
