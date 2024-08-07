 Triggers for insert, delete, and update operations.

sql
Copy code
CREATE OR REPLACE TRIGGER Insert_Employee
AFTER INSERT ON Employee
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('New Employee Added: ' || :NEW.Name);
END;

CREATE OR REPLACE TRIGGER Delete_Employee
AFTER DELETE ON Employee
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Employee Deleted: ' || :OLD.Name);
END;

CREATE OR REPLACE TRIGGER Update_Employee
AFTER UPDATE ON Employee
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Employee Updated: ' || :NEW.Name);
END;
14. Supplier Table
a) Display supplier numbers and names where names start with 'S'.

sql
Copy code
SELECT Sup_No, Sup_Name
FROM Supplier
WHERE Sup_Name LIKE 'S%';
b) Add CONTACTNO column.

sql
Copy code
ALTER TABLE Supplier ADD (CONTACTNO VARCHAR2(15));
c) Display supplier numbers, names, and item prices for Chennai.

sql
Copy code
SELECT Sup_No, Sup_Name, Item_Price
FROM Supplier
WHERE City = 'Chennai';
d) Create a view showing only supplier numbers and names.

sql
Copy code
CREATE VIEW Supplier_View AS
SELECT Sup_No, Sup_Name
FROM Supplier;
e) Procedure to show supplier details.

sql
Copy code
CREATE OR REPLACE PROCEDURE Show_Supplier_Details AS
BEGIN
    FOR rec IN (SELECT * FROM Supplier) LOOP
        DBMS_OUTPUT.PUT_LINE('Supplier No: ' || rec.Sup_No || ', Name: ' || rec.Sup_Name);
    END LOOP;
END;
