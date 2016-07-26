--Jack���� ������ ���� ����� �̸���?
select salary from EMPLOYEES where FIRST_NAME='Jack';
select first_name, salary from EMPLOYEES where SALARY>8400;

select first_name, salary from EMPLOYEES where SALARY> (select salary from EMPLOYEES where FIRST_NAME='Jack');

--������ -> 2���� row�� ����
select first_name, salary from EMPLOYEES where SALARY> (select salary from EMPLOYEES where FIRST_NAME='Karen');
select salary from EMPLOYEES where FIRST_NAME='Karen';

--����1 �ּ� ������ �޴� ���
select min(salary) from EMPLOYEES;
select FIRST_name,salary from EMPLOYEES where SALARY = (select min(salary) from EMPLOYEES);

--��տ������� ���� �޴� ���
select avg(salary) from EMPLOYEES;
select FIRST_name,salary from EMPLOYEES where SALARY < (select avg(salary) from EMPLOYEES);

--sales���� �μ����� ���ϴ� �����
select first_name,department_id from EMPLOYEES 
where DEPARTMENT_ID=(select department_id from departments where department_name='Purchasing');
select department_id from departments where department_name='Purchasing';

--join������ �ذ�
select a.first_name,a.department_id from EMPLOYEES a, DEPARTMENTS b 
where a.DEPARTMENT_ID=b.DEPARTMENT_ID
and b.DEPARTMENT_NAME='Purchasing';

select min(salary) from EMPLOYEES;

--Sub Query�� ����� multi row�� ��� in�� ���ش�. in or - any
select FIRST_name,salary from EMPLOYEES where SALARY in (select min(salary) from EMPLOYEES group by DEPARTMENT_ID);
select min(salary) from EMPLOYEES group by DEPARTMENT_ID;

--multi row && multi colum ***//�ڱ� �μ��� �ּ� ������ �޴� ���Ի��
select FIRST_name,salary from EMPLOYEES where (DEPARTMENT_ID,SALARY) in (select DEPARTMENT_ID,min(salary) from EMPLOYEES group by DEPARTMENT_ID);

select DEPARTMENT_ID,min(salary) from EMPLOYEES group by DEPARTMENT_ID;

-- Correlated Query
select DEPARTMENT_ID,first_name,salary from EMPLOYEES a 
where salary=(select min(SALARY) from EMPLOYEES where DEPARTMENT_ID=a.DEPARTMENT_ID);

--from���� select(select ����� ���̺�� ����Ѵ�.)
select DEPARTMENT_ID,min(salary) "min_salary" from EMPLOYEES group by DEPARTMENT_ID;
select * from EMPLOYEES;

select a.first_name,a.SALARY from EMPLOYEES a, 
     (select DEPARTMENT_ID,min(salary) "min_salary" from EMPLOYEES group by DEPARTMENT_ID) b
     where a.DEPARTMENT_ID=b.DEPARTMENT_ID
     and a.SALARY=b."min_salary";

--select FIRST_name,salary from EMPLOYEES 
--where (DEPARTMENT_ID,SALARY) in (select DEPARTMENT_ID,min(salary) from EMPLOYEES group by DEPARTMENT_ID);


