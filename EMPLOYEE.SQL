 Employee Table
a) Add a salary column.

sql
Copy code
ALTER TABLE employee ADD salary NUMBER;
b) Copy the employee table.

sql
Copy code
CREATE TABLE Emp AS SELECT * FROM employee;
c) Delete the 2nd row.

sql
Copy code
DELETE FROM employee WHERE ROWNUM = 2;
d) Drop the employee table.

sql
Copy code
DROP TABLE employee;
e) Trigger to update salary.

sql
Copy code
CREATE OR REPLACE TRIGGER Update_Salary
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
    UPDATE employee SET salary = :NEW.salary * 1.1 WHERE S_No = :NEW.S_No;
END;
