-- Create part table
CREATE TABLE part (
    pno NUMBER(10),
    pname VARCHAR(20),
    colour VARCHAR(20),
    PRIMARY KEY (pno)
);

-- Create supplier table
CREATE TABLE supplier (
    sno NUMBER(10),
    sname VARCHAR(20),
    address VARCHAR(20),
    PRIMARY KEY (sno)
);

-- Create supply table
CREATE TABLE supply (
    pno NUMBER(10),
    sno NUMBER(10),
    quantity VARCHAR(20),
    PRIMARY KEY (pno, sno),
    FOREIGN KEY (pno) REFERENCES part(pno) ON DELETE CASCADE,
    FOREIGN KEY (sno) REFERENCES supplier(sno) ON DELETE CASCADE
);

-- Insert data into part table
INSERT INTO part VALUES (1, 'plug', 'black');
INSERT INTO part VALUES (2, 'bolt', 'blue');
INSERT INTO part VALUES (3, 'nut', 'green');

-- Insert data into supplier table
INSERT INTO supplier VALUES (10, 'Anoop', 'udupi');
INSERT INTO supplier VALUES (15, 'Bharath', 'mangalore');
INSERT INTO supplier VALUES (20, 'Ram', 'bangalore');

-- Insert data into supply table
INSERT INTO supply VALUES (1, 10, '50');
INSERT INTO supply VALUES (2, 10, '30');
INSERT INTO supply VALUES (1, 15, '70');
INSERT INTO supply VALUES (3, 15, '40');
INSERT INTO supply VALUES (1, 20, '55');
INSERT INTO supply VALUES (2, 20, '65');
INSERT INTO supply VALUES (3, 20, '75');

-- Select data from part table
SELECT * FROM part;

-- Select data from supply table
SELECT * FROM supply;

-- Select data from supplier table
SELECT * FROM supplier;

-- Select pno from supply where sno is supplier 'Ram'
SELECT pno 
FROM supply
WHERE sno IN (SELECT sno FROM supplier WHERE sname = 'Ram');

-- Select sname and pname where pname is 'bolt'
SELECT sname, pname
FROM supplier s, supply sp, part p
WHERE p.pname = 'bolt' AND sp.sno = s.sno AND sp.pno = p.pno;

-- Delete rows from part table where colour is 'green'
DELETE FROM part WHERE colour = 'green';
