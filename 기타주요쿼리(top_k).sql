--Connect by prior(�������� ������ ǥ���� ��, Ʈ��,���͸� ����)
select level, employee_id,MANAGER_ID,last_name from EMPLOYEES START with MANAGER_ID is null
CONNECT by prior EMPLOYEE_ID=MANAGER_ID order by level;
 
--Rollup, Cube
SELECT DEPARTMENT_ID,job_id,sum(salary) from EMPLOYEES group by rollup(DEPARTMENT_ID,job_id);

SELECT DEPARTMENT_ID,job_id,sum(salary) from EMPLOYEES group by cube(DEPARTMENT_ID,job_id);

--top-k rownum(�Խ��ǿ��� ����¡�� ó���� ���)
select rownum, employee_id,FIRST_name from EMPLOYEES where rownum<6 order by EMPLOYEE_ID;

--order by ������ where ������ ����Ǽ� ���õ� row�� �ִ� �ӽ� ���̺��� rownum�� ���õ�
select rownum, employee_id,FIRST_name from EMPLOYEES order by first_name;

--�ذ���(SubQuery)
select rownum,employee_id,FIRST_name 
from (select employee_id,FIRST_name from EMPLOYEES order by first_name) 
where rownum<10;

--����
select rownum,employee_id,FIRST_name 
from (select employee_id,FIRST_name from EMPLOYEES order by first_name)
where rownum<10 and rownum<20;

--���� �ذ� ���
select * from(
select rownum as rn,employee_id,FIRST_name 
from (select employee_id,FIRST_name from EMPLOYEES order by first_name))
where 10<rn and rownum<20; 

--rowid(pseudo column rownum, sysdate, rowid)
select rowid,first_name from EMPLOYEES;

























