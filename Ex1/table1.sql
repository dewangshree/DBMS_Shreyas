-- Create employee table
CREATE TABLE employee (
    ssn VARCHAR(6), 
    name VARCHAR(10),
    deptno INT, 
    PRIMARY KEY (ssn)
);

-- Create project table
CREATE TABLE project (
    projectno VARCHAR(10), 
    projectarea VARCHAR(20), 
    PRIMARY KEY (projectno)
);

-- Create app table
CREATE TABLE app (
    usn VARCHAR(6), 
    projectno VARCHAR(10), 
    FOREIGN KEY (usn) REFERENCES employee(ssn),
    FOREIGN KEY (projectno) REFERENCES project(projectno)
);

-- Insert data into employee table
INSERT INTO employee VALUES ('01', 'abc', 10);
INSERT INTO employee VALUES ('02', 'xyz', 20);
INSERT INTO employee VALUES ('03', 'pqr', 30);
INSERT INTO employee VALUES ('04', 'lmn', 40);

-- Insert data into project table
INSERT INTO project VALUES ('100', 'database');
INSERT INTO project VALUES ('200', 'network');
INSERT INTO project VALUES ('300', 'android');

-- Insert data into app table
INSERT INTO app VALUES ('01', '100');
INSERT INTO app VALUES ('02', '200');
INSERT INTO app VALUES ('03', '300');
INSERT INTO app VALUES ('01', '200');

-- Select data from employee table
SELECT * FROM employee;

-- Select data from project table
SELECT * FROM project;

-- Select data from app table
SELECT * FROM app;
