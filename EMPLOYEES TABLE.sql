Employee Table with Additional Queries
a) Display students in semester 'xxx'.

sql
Copy code
SELECT Name, Salary
FROM Employee
WHERE Department = 'xxx';
b) Lowest-paid employee in each department.

sql
Copy code
SELECT Department, MIN(Salary) AS Lowest_Paid
FROM Employee
GROUP BY Department;
c) List employee names in descending order.

sql
Copy code
SELECT Name FROM Employee ORDER BY Name DESC;
d) Rename column.

sql
Copy code
ALTER TABLE Employee RENAME COLUMN Job TO Position;
e) Insert row using triggers.

sql
Copy code
CREATE OR REPLACE TRIGGER Insert_Trigger
BEFORE INSERT ON Employee
FOR EACH ROW
BEGIN
    IF :NEW.Salary IS NULL THEN
        :NEW.Salary := 1000; -- Default Salary
    END IF;
END;
