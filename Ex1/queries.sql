select ssn from employee
where ssn=(select usn
           from app
            where projectno=(select projectno from project
                             where projectarea='database'));
       ​​



select count(ssn),deptno from employee group by deptno;





update app set projectno='200' where usn='03';
select * from app;
