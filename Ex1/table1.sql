 
create table employee
(
ssn varchar(6), 
name varchar(10),
deptno int, 
primary key(ssn)
);
 
create table project
(
projectno varchar(10), 
projectarea varchar(20), 
primary key(projectno)
);
 
create table app
(
usn varchar(6), 
projectno varchar(10), 
foreign key(usn)references e(ssn),
foreign key(projectno)references p(projectno)
);
 
insert into employee values('01','abc',10);
insert into employee values('02','xyz',20);
insert into employee values('03','pqr',30);
insert into employee values('04','lmn',40);
 
insert into project values('100','database');​
insert into project values('200','network');
insert into project values('300','android');
 
insert into app values('01','100');
insert into app values('02','200');
insert into app values('03','300');
insert into app values('01','200');
 
select * from employee;
 
select *  from project;
 
select *  from app;

 
