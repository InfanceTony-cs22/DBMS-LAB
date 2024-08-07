Display customers and account numbers from branch 'XXXXX'.

sql
Copy code
SELECT Cust_Name, Account_No
FROM Account
WHERE Branch_Name = 'XXXXX';
b) Display names and account types with balance > 10,000.

sql
Copy code
SELECT Cust_Name, Account_Type
FROM Account
WHERE Balance > 10000;
c) Add Cust_Date_of_Birth column.

sql
Copy code
ALTER TABLE Account ADD (Cust_Date_of_Birth DATE);
d) Display account details with balance < 1,000.

sql
Copy code
SELECT Account_No, Cust_Name, Branch_Name
FROM Account
WHERE Balance < 1000;
e) Procedure to show account details.

sql
Copy code
CREATE OR REPLACE PROCEDURE Show_Account_Details AS
BEGIN
    FOR rec IN (SELECT * FROM Account) LOOP
        DBMS_OUTPUT.PUT_LINE('Account No: ' || rec.Account_No || ', Name: ' || rec.Cust_Name || ', Branch: ' || rec.Branch_Name);
    END LOOP;
END;
