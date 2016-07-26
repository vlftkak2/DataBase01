--COUNT
select COUNT(*) from EMPLOYEES;
select COUNT(manager_id) from EMPLOYEES;

--AVG
select AVG(SALARY) FROM EMPLOYEES;

  select DEPARTMENT_ID,to_char(AVG(salary),99999) from employees group by DEPARTMENT_ID;

select DEPARTMENT_ID,to_char(AVG(salary),'99,999'),
to_char(SUM(salary),'999,999')
,to_char(AVG(salary),'99,999') 
,to_char(MAX(salary),'99,999') 
,to_char(MIN(salary),'99,999') 
from employees group by DEPARTMENT_ID order by AVG(salary)asc;

select DEPARTMENT_ID,to_char(AVG(salary),'99,999')
from employees group by DEPARTMENT_ID  having Avg(salary)>10000;

--»çÀå´ÔÀ» »« ºÎ¼­º° Æò±Õ ¿¬ºÀÀÌ 5000ÀÌ»óÀÏ ¶§, Æò±Õ ¿¬ºÀÀÌ ³ôÀº ¼øÀ¸·Î Ãâ·Â
select DEPARTMENT_ID,to_char(AVG(salary),'99,999')
from employees where DEPARTMENT_ID is not null group by DEPARTMENT_ID  having Avg(salary)>5000 order by Avg(salary) asc;



