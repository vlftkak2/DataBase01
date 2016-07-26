--Jack보다 월급이 많은 사람의 이름은?
select salary from EMPLOYEES where FIRST_NAME='Jack';
select first_name, salary from EMPLOYEES where SALARY>8400;

select first_name, salary from EMPLOYEES where SALARY> (select salary from EMPLOYEES where FIRST_NAME='Jack');

--문제점 -> 2개의 row가 생김
select first_name, salary from EMPLOYEES where SALARY> (select salary from EMPLOYEES where FIRST_NAME='Karen');
select salary from EMPLOYEES where FIRST_NAME='Karen';

--연습1 최소 연봉을 받는 사람
select min(salary) from EMPLOYEES;
select FIRST_name,salary from EMPLOYEES where SALARY = (select min(salary) from EMPLOYEES);

--평균연봉보다 적게 받는 사람
select avg(salary) from EMPLOYEES;
select FIRST_name,salary from EMPLOYEES where SALARY < (select avg(salary) from EMPLOYEES);

--sales에서 부서에서 일하는 사람들
select first_name,department_id from EMPLOYEES 
where DEPARTMENT_ID=(select department_id from departments where department_name='Purchasing');
select department_id from departments where department_name='Purchasing';

--join문제로 해결
select a.first_name,a.department_id from EMPLOYEES a, DEPARTMENTS b 
where a.DEPARTMENT_ID=b.DEPARTMENT_ID
and b.DEPARTMENT_NAME='Purchasing';

select min(salary) from EMPLOYEES;

--Sub Query의 결과가 multi row인 경우 in을 써준다. in or - any
select FIRST_name,salary from EMPLOYEES where SALARY in (select min(salary) from EMPLOYEES group by DEPARTMENT_ID);
select min(salary) from EMPLOYEES group by DEPARTMENT_ID;

--multi row && multi colum ***//자기 부서에 최소 연봉을 받는 신입사원
select FIRST_name,salary from EMPLOYEES where (DEPARTMENT_ID,SALARY) in (select DEPARTMENT_ID,min(salary) from EMPLOYEES group by DEPARTMENT_ID);

select DEPARTMENT_ID,min(salary) from EMPLOYEES group by DEPARTMENT_ID;

-- Correlated Query
select DEPARTMENT_ID,first_name,salary from EMPLOYEES a 
where salary=(select min(SALARY) from EMPLOYEES where DEPARTMENT_ID=a.DEPARTMENT_ID);

--from절에 select(select 결과를 테이블로 사용한다.)
select DEPARTMENT_ID,min(salary) "min_salary" from EMPLOYEES group by DEPARTMENT_ID;
select * from EMPLOYEES;

select a.first_name,a.SALARY from EMPLOYEES a, 
     (select DEPARTMENT_ID,min(salary) "min_salary" from EMPLOYEES group by DEPARTMENT_ID) b
     where a.DEPARTMENT_ID=b.DEPARTMENT_ID
     and a.SALARY=b."min_salary";

--select FIRST_name,salary from EMPLOYEES 
--where (DEPARTMENT_ID,SALARY) in (select DEPARTMENT_ID,min(salary) from EMPLOYEES group by DEPARTMENT_ID);


