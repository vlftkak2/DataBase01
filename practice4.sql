--혼합--

--문제1
select a.FIRST_NAME,a.SALARY,b.DEPARTMENT_NAME,a.HIRE_DATE from EMPLOYEES a, DEPARTMENTS b, (select max(hire_date) "hire_date" from EMPLOYEES) c
where a.DEPARTMENT_ID=b.DEPARTMENT_ID
and a.HIRE_DATE=c."hire_date";

--문제2
select a.EMPLOYEE_ID "사원번호",a.LAST_NAME "성",a.SALARY "연봉" from EMPLOYEES a, (select DEPARTMENT_ID,avg(salary) "avg_salary" from EMPLOYEES group by DEPARTMENT_ID) b
where a.DEPARTMENT_ID=b.DEPARTMENT_ID
and a.SALARY>b."avg_salary" order by a.SALARY desc;


--문제3
select a.EMPLOYEE_ID,a.FIRST_NAME,a.LAST_NAME, b.JOB_TITLE, a.SALARY from EMPLOYEES a, jobs b
where a.JOB_ID=b.JOB_ID
and a.DEPARTMENT_ID=(select DEPARTMENT_ID from (select DEPARTMENT_ID, avg(salary) as avg_salary from EMPLOYEES group by DEPARTMENT_ID)
where avg_salary = (
select max(avg(salary)) from EMPLOYEES group by DEPARTMENT_ID));

--부서별 평균연봉이 가장높은 부서
select DEPARTMENT_ID from (select DEPARTMENT_ID, avg(salary) as avg_salary from EMPLOYEES group by DEPARTMENT_ID)
   where avg_salary = (
select max(avg(salary)) from EMPLOYEES group by DEPARTMENT_ID);

--부서별 평균
select DEPARTMENT_ID,avg(salary) from EMPLOYEES group by DEPARTMENT_ID; 

--문제4

select DEPARTMENT_NAME "연봉이 가장 높은 부서"from DEPARTMENTS 
where DEPARTMENT_ID=(select DEPARTMENT_ID from (select DEPARTMENT_ID, avg(salary) as avg_salary from EMPLOYEES group by DEPARTMENT_ID)
   where avg_salary = (
select max(avg(salary)) from EMPLOYEES group by DEPARTMENT_ID));

--문제5
select city from locations where location_id=(select location_id from (select b.location_id,a.salary from employees a,departments b
where a.DEPARTMENT_ID=b.DEPARTMENT_ID) group by location_id 
having avg(salary)=(select max(avg(salary)) from(select b.location_id, a.salary
from EMPLOYEES a, DEPARTMENTS b where a.DEPARTMENT_ID=b.DEPARTMENT_ID) 
group by location_id));


--문제6
select job_title "평균 연봉이 높은 업무"from jobs
where job_id=(select job_id from (select job_id, avg(salary) as avg_salary from EMPLOYEES group by job_id)
   where avg_salary = (
select max(avg(salary)) from EMPLOYEES group by job_id));



--직업별 가장 높은 연봉
select job_id from (select job_id, avg(salary) as avg_salary from EMPLOYEES group by job_id)
   where avg_salary = (
select max(avg(salary)) from EMPLOYEES group by job_id);





