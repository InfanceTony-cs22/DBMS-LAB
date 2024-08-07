 Bank Table
a) Display customers from branch 'XXXXX'.

sql
Copy code
SELECT Cust_Name, Account_No
FROM Bank
WHERE Branch = 'XXXXX';
b) Display names and account types with balance > 10,000.

sql
Copy code
SELECT Cust_Name, Account_Type
FROM Bank
WHERE Balance > 10000;
c) Add CONTACTNO column.

sql
Copy code
ALTER TABLE Bank ADD (CONTACTNO VARCHAR2(15));
d) Display account details with balance < 1,000.

sql
Copy code
SELECT Account_No, Cust_Name, Branch
FROM Bank
WHERE Balance < 1000;
e) Trigger for balance < 1,000.

sql
Copy code
CREATE OR REPLACE TRIGGER Check_Balance
BEFORE UPDATE ON Bank
FOR EACH ROW
BEGIN
    IF :NEW.Balance < 1000 THEN
        DBMS_OUTPUT.PUT_LINE('Balance below 1000 for Account No ' || :NEW.Account_No);
    END IF;
END;
