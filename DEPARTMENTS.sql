Departments and Employees
a) Grant privileges.

sql
Copy code
GRANT SELECT, INSERT ON Employee TO Department;
b) Revoke all privileges.

sql
Copy code
REVOKE ALL ON Employee FROM Department;
c) Revoke some privileges.

sql
Copy code
REVOKE SELECT, INSERT ON Employee FROM Department;
d) Save point.

sql
Copy code
SAVEPOINT my_savepoint;
e) Procedure example.

sql
Copy code
CREATE OR REPLACE PROCEDURE Show_Employee_Details AS
BEGIN
    FOR rec IN (SELECT * FROM Employee) LOOP
        DBMS_OUTPUT.PUT_LINE('Name: ' || rec.Name);
    END LOOP;
END;
