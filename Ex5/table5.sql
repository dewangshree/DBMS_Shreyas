-- Create books table
CREATE TABLE books (
    ISBN VARCHAR(10),
    Title VARCHAR(10),
    Author VARCHAR(10),
    Publisher VARCHAR(10),
    PRIMARY KEY(ISBN)
);

-- Insert data into books table
INSERT INTO books VALUES ('123', 'T1', 'A1', 'P1');
INSERT INTO books VALUES ('002', 'DB', 'A2', 'P2');
INSERT INTO books VALUES ('003', 'T3', 'A3', 'P3');
INSERT INTO books VALUES ('004', 'T4', 'A4', 'P4');
INSERT INTO books VALUES ('005', 'T5', 'A5', 'P5');

-- Create student1 table
CREATE TABLE student1 (
    usn VARCHAR(10), 
    name VARCHAR(10),
    sem INT, 
    dept VARCHAR(3),
    PRIMARY KEY(usn)
);

-- Insert data into student1 table
INSERT INTO student1 VALUES ('111', 'aaa', 3, 'ISE');
INSERT INTO student1 VALUES ('222', 'bbb', 4, 'CSE');
INSERT INTO student1 VALUES ('333', 'ccc', 3, 'CSE');
INSERT INTO student1 VALUES ('444', 'ddd', 4, 'ISE');
INSERT INTO student1 VALUES ('555', 'eee', 4, 'ISE');

-- Create borrow table
CREATE TABLE borrow (
    ISBN VARCHAR(10),
    usn VARCHAR(10), 
    dates VARCHAR(10),
    FOREIGN KEY(ISBN) REFERENCES books(ISBN),
    FOREIGN KEY(usn) REFERENCES student1(usn)
);

-- Insert data into borrow table
INSERT INTO borrow VALUES ('123', '222', '1/2/13');
INSERT INTO borrow VALUES ('002', '333', '2/2/13');
INSERT INTO borrow VALUES ('003', '111', '3/2/13');
INSERT INTO borrow VALUES ('005', '444', '4/2/13');
INSERT INTO borrow VALUES ('003', '555', '5/2/13');

-- Query 1: Get student name who borrowed a book with ISBN '123'
SELECT name
FROM student1
WHERE usn = (SELECT usn FROM borrow WHERE ISBN = '123');

-- Query 2: Get student name who borrowed a book with title 'DB'
SELECT name
FROM student1
WHERE usn = (SELECT usn FROM borrow WHERE ISBN = (SELECT ISBN FROM books WHERE Title = 'DB'));

-- Query 3: Count of books borrowed by each student
SELECT usn, COUNT(ISBN) AS num_books_borrowed
FROM borrow
GROUP BY usn;
