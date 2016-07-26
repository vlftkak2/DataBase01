--서브쿼리--
--문제1
select COUNT(*) from EMPLOYEES where salary < (select avg(salary) from employees);

--문제2
select EMPLOYEE_ID "사번",last_name "성",salary "연봉" from employees where (DEPARTMENT_ID,salary) in (select DEPARTMENT_ID,max(salary) from employees group by DEPARTMENT_ID)
order by salary desc;

--문제3
select a.JOB_TITLE, b."sum_salary" from EMPLOYEES a,(select job_id, SUM(SALARY) "sum_salary" from EMPLOYEES group by JOB_ID) b
where a.JOB_ID=b.job_id;

select a.JOB_TITLE,b."sum_salary" from jobs a, (select job_id,SUM(SALARY) "sum_salary" from EMPLOYEES group by JOB_ID) b
where a.JOB_ID=b.job_id order by b."sum_salary" desc;

--문제4
select a.EMPLOYEE_ID "사번",a.FIRST_NAME "이름",a.SALARY "봉급" from EMPLOYEES a, (select DEPARTMENT_ID,avg(salary) "avg_salary" from employees where DEPARTMENT_ID is not null group by DEPARTMENT_ID) b
where a.DEPARTMENT_ID=b.DEPARTMENT_ID
and a.SALARY>b."avg_salary" 
order by a.SALARY desc;

select DEPARTMENT_ID,avg(salary) from employees where DEPARTMENT_ID is not null group by DEPARTMENT_ID;
