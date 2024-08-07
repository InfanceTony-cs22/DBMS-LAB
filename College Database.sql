 Number of male and female students per semester.

sql
Copy code
SELECT Semester, Gender, COUNT(*)
FROM STUDENT
GROUP BY Semester, Gender;
b) Update Finalmark (average of best two test marks).

sql
Copy code
UPDATE MARKS
SET Finalmark = (GREATEST(Test1, Test2, Test3) + LEAST(GREATEST(Test1, Test2), GREATEST(Test2, Test3), GREATEST(Test1, Test3))) / 2;
c) Categorize students based on Finalmark.

sql
Copy code
UPDATE MARKS
SET Category = CASE
    WHEN Finalmark >= 81 THEN 'Outstanding'
    WHEN Finalmark >= 51 THEN 'Average'
    ELSE 'Weak'
END;
d) View of Test3 marks for a particular student.

sql
Copy code
CREATE VIEW Test3_Marks_View AS
SELECT RegNo, Subject, Test3
FROM MARKS
WHERE RegNo = 'specific_regno';  -- Replace with actual student ID
e) Procedure to show student details.

sql
Copy code
CREATE OR REPLACE PROCEDURE Show_Student_Details AS
BEGIN
    FOR rec IN (SELECT * FROM STUDENT) LOOP
        DBMS_OUTPUT.PUT_LINE('RegNo: ' || rec.RegNo || ', Name: ' || rec.Name);
    END LOOP;
END;
