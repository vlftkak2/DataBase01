--����1
select (first_name ||' '|| last_name) AS "full name",email as "�̸���",phone_number as "��ȭ��ȣ" from EMPLOYEES order by hire_date asc;


--����2
select job_title,max_salary from jobs order by job_title desc,max_salary desc;

--����3
select COUNT(*) from EMPLOYEES where MANAGER_ID is null;

--����4
select job_title as "�̸�" from jobs order by job_title asc, max_salary desc;

--����5
select COUNT(*) from DEPARTMENTS;

--����6
select DEPARTMENT_NAME from DEPARTMENTS order by length(DEPARTMENT_NAME) desc;

--����7
select * from DEPARTMENTS;
select COUNT(*) from EMPLOYEES where MANAGER_ID is null;

--����8
select upper('abcdef') from dual;
select upper(country_name) from COUNTRIES;

--����9
select * from locations;
select region_name from regions order by length(REGION_name) desc;

--����10
select distinct(lower(city)) from locations order by lower(city) asc  ;