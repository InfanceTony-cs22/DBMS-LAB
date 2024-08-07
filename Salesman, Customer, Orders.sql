Salesman, Customer, Orders
a) Salesmen with more than one customer.

sql
Copy code
SELECT s.Name
FROM SALESMAN s
JOIN CUSTOMER c ON s.Salesman_id = c.Salesman_id
GROUP BY s.Name
HAVING COUNT(c.Customer_id) > 1;
b) Salesmen with and without customers in their cities.

sql
Copy code
SELECT s.Name, CASE WHEN c.Customer_id IS NOT NULL THEN 'Has Customers' ELSE 'No Customers' END AS Status
FROM SALESMAN s
LEFT JOIN CUSTOMER c ON s.Salesman_id = c.Salesman_id AND s.City = c.City;
c) View to find the salesman with the highest order of the day.

sql
Copy code
CREATE VIEW Top_Salesman AS
SELECT s.Name
FROM SALESMAN s
JOIN CUSTOMER c ON s.Salesman_id = c.Salesman_id
JOIN ORDERS o ON c.Customer_id = o.Customer_id
WHERE o.Order_Amount = (SELECT MAX(Order_Amount) FROM ORDERS WHERE Order_Date = SYSDATE);
d) Delete salesman with ID 1000 and all his orders.

sql
Copy code
DELETE FROM ORDERS WHERE Salesman_id = 1000;
DELETE FROM SALESMAN WHERE Salesman_id = 1000;
e) Triggers for insert, delete, and update.

sql
Copy code
CREATE OR REPLACE TRIGGER Insert_Salesman
AFTER INSERT ON SALESMAN
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('New Salesman Added: ' || :NEW.Name);
END;

CREATE OR REPLACE TRIGGER Delete_Salesman
AFTER DELETE ON SALESMAN
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Salesman Deleted: ' || :OLD.Name);
END;

CREATE OR REPLACE TRIGGER Update_Salesman
AFTER UPDATE ON SALESMAN
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Salesman Updated: ' || :NEW.Name);
END;
