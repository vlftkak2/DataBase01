--문제1
select a.EMPLOYEE_ID as 사번, a.FIRST_NAME as 이름, b.DEPARTMENT_NAME as 부서명, c.FIRST_NAME as 매니저이름 from EMPLOYEES a, DEPARTMENTS b, Employees
c where a.DEPARTMENT_ID=b.DEPARTMENT_ID 
and c.EMPLOYEE_ID=a.MANAGER_ID;

select a.EMPLOYEE_ID as 사번, a.FIRST_NAME as 이름, b.DEPARTMENT_NAME as 부서명, c.FIRST_NAME as 매니저이름 from EMPLOYEES a join DEPARTMENTS b
 on a.DEPARTMENT_ID=b.DEPARTMENT_ID join employees c
on c.EMPLOYEE_ID=a.MANAGER_ID;


--문제2
select b.REGION_NAME,a.COUNTRY_NAME  from COUNTRIES a, REGIONS b 
where a.REGION_ID=b.REGION_ID order by b.REGION_NAME desc, a.COUNTRY_NAME desc;

--문제3
select a.DEPARTMENT_ID,a.DEPARTMENT_NAME, b.FIRST_NAME,c.CITY,d.COUNTRY_NAME,e.REGION_NAME from DEPARTMENTS a, EMPLOYEES b, LOCATIONS c, COUNTRIES d, REGIONS e
where a.MANAGER_ID=b.EMPLOYEE_ID 
and a.LOCATION_ID=c.LOCATION_ID
and c.COUNTRY_ID=d.COUNTRY_ID
and d.REGION_ID=e.REGION_ID;

--문제4
select c.EMPLOYEE_ID, (c.FIRST_NAME || c.LAST_NAME) as "name" from jobs a, job_history b,EMPLOYEES c
where a.JOB_TITLE='Public Accountant'
and a.JOB_ID=b.JOB_ID
and b.EMPLOYEE_ID=c.EMPLOYEE_ID;

--문제5
select a.employee_id,a.FIRST_NAME,a.LAST_NAME,b.DEPARTMENT_NAME from EMPLOYEES a, DEPARTMENTS b
where a.DEPARTMENT_ID=b.DEPARTMENT_ID order by a.LAST_NAME asc;

--문제6
select b.LAST_NAME,b.HIRE_DATE, a.LAST_NAME,a.HIRE_DATE from EMPLOYEES a, EMPLOYEES b
where a.EMPLOYEE_ID=b.MANAGER_ID 
and a.HIRE_DATE>b.HIRE_DATE order by b.HIRE_DATE;

select a.FIRST_NAME as "사원이름", nvl(b.FIRST_NAME,'없음') as "매니저" from EMPLOYEES a, EMPLOYEES b where a.MANAGER_ID = b.EMPLOYEE_ID(+) order by a.FIRST_NAME asc; 




