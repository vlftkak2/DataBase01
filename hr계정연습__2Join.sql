--inner join

--equi join
select first_name,DEPARTMENT_ID from employees;

select a.FIRST_NAME, b.DEPARTMENT_NAME from EMPLOYEES a, DEPARTMENTS b where a.DEPARTMENT_ID = b.DEPARTMENT_ID(+);
select * from DEPARTMENTS;
select * from EMPLOYEES;
select department_name from DEPARTMENTS;

--theta join
select * from jobs;
select * from EMPLOYEES a, jobs b where a.SALARY BETWEEN b.MIN_SALARY and b.MAX_SALARY;

--self join
select * from EMPLOYEES order by first_name asc;
select a.FIRST_NAME, b.FIRST_NAME  from EMPLOYEES a, EMPLOYEES b where a.MANAGER_ID = b.EMPLOYEE_ID;

SELECT * FROM EMPLOYEES;

--outer join
select a.FIRST_NAME as "사원이름", nvl(b.FIRST_NAME,'없음') as "매니저" from EMPLOYEES a, EMPLOYEES b where a.MANAGER_ID = b.EMPLOYEE_ID(+) order by a.FIRST_NAME asc; 

select a.first_name, b.DEPARTMENT_NAME from EMPLOYEES a, DEPARTMENTS b where a.DEPARTMENT_ID=b.DEPARTMENT_ID(+);



