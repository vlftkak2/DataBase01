--문제1
select (first_name ||' '|| last_name) AS "full name",email as "이메일",phone_number as "전화번호" from EMPLOYEES order by hire_date asc;


--문제2
select job_title,max_salary from jobs order by job_title desc,max_salary desc;

--문제3
select COUNT(*) from EMPLOYEES where MANAGER_ID is null;

--문제4
select job_title as "이름" from jobs order by job_title asc, max_salary desc;

--문제5
select COUNT(*) from DEPARTMENTS;

--문제6
select DEPARTMENT_NAME from DEPARTMENTS order by length(DEPARTMENT_NAME) desc;

--문제7
select * from DEPARTMENTS;
select COUNT(*) from EMPLOYEES where MANAGER_ID is null;

--문제8
select upper('abcdef') from dual;
select upper(country_name) from COUNTRIES;

--문제9
select * from locations;
select region_name from regions order by length(REGION_name) desc;

--문제10
select distinct(lower(city)) from locations order by lower(city) asc  ;