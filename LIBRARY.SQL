 Library Database
a) Retrieve book details.

sql
Copy code
SELECT Book_id, Title, Publisher_Name
FROM BOOK;
b) Borrowers with more than 3 books borrowed between Jan 2017 and Jun 2017.

sql
Copy code
SELECT Borrower_ID
FROM BORROWINGS
WHERE Borrow_Date BETWEEN '2017-01-01' AND '2017-06-30'
GROUP BY Borrower_ID
HAVING COUNT(Book_ID) > 3;
c) Delete a book and update other tables.

sql
Copy code
DELETE FROM BOOK WHERE Book_id = 1;  -- Replace 1 with the actual book id
DELETE FROM BOOK_AUTHORS WHERE Book_id = 1;
d) Create a view of available books.

sql
Copy code
CREATE VIEW Available_Books AS
SELECT Book_id, Title
FROM BOOK
WHERE No_of_copies > 0;
e) Procedure to display book details by author.

sql
Copy code
CREATE OR REPLACE PROCEDURE Get_Books_By_Author (author_name IN VARCHAR2) IS
BEGIN
    FOR rec IN (SELECT Title FROM BOOK WHERE Book_id IN (SELECT Book_id FROM BOOK_AUTHORS WHERE Author_Name = author_name)) 
    LOOP
        DBMS_OUTPUT.PUT_LINE('Title: ' || rec.Title);
    END LOOP;
END;
