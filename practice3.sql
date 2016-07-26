--����1
select MAX(salary) "�ְ��ӱ�" ,MIN(salary) "�����ӱ�",(MAX(salary)-Min(salary)) as "�ְ��ӱ�-�����ӱ�" from EMPLOYEES;

--����2
select to_char(max(hire_date), 'yyyy"��"-mm"��"-dd"��"') "���Ի��" from EMPLOYEES;

--����3
select to_char(avg(salary),'99,999') "��պ���",to_char(max(SALARY),'99,999')"�ְ����",to_char(min(SALARY),'99,999') "��������" from EMPLOYEES group by DEPARTMENT_ID
order by avg(salary) desc, max(salary) desc, min(salary) desc;

--����4
select to_char(avg(salary),'99,999') "��պ���",to_char(max(SALARY),'99,999') "�ְ����",to_char(min(SALARY),'99,999') "��������" from EMPLOYEES group by job_id 
order by avg(salary) desc, max(salary) desc, min(salary) desc;

--����5
select to_char(min(HIRE_DATE),'yyyy"��"-mm"��"-dd"��"') "���� ������ ����" from EMPLOYEES;

--����6
select DEPARTMENT_ID "�μ�id",to_char(avg(SALARY),'99,999') "��պ���",to_char(min(SALARY),'99,999') "��������",to_char(avg(SALARY)-min(SALARY),'99,999') "��պ���-��������"
from EMPLOYEES 
group by DEPARTMENT_ID HAVING avg(SALARY)-min(SALARY)<2000
order by avg(SALARY)-min(SALARY);

--����7
select JOB_ID "Job��ȣ",to_char(max(SALARY),'99,999') "�ְ��ӱ�",to_char(min(SALARY),'99,999') "�����ӱ�",to_char((MAX(salary)-Min(salary)),'99,999') as "�ְ��ӱ�-�����ӱ�" from EMPLOYEES 
group by JOB_ID having MAX(salary)-Min(salary)>5000;

select JOB_ID "Job��ȣ",to_char(max(SALARY),'99,999') "�ְ��ӱ�",to_char(min(SALARY),'99,999') "�����ӱ�",to_char((MAX(salary)-Min(salary)),'99,999') as "�ְ��ӱ�-�����ӱ�" from EMPLOYEES 
group by JOB_ID;

select job_title from jobs where job_id='SA_REP';

--Sub query
select max(dief_salary) from (select job_id, (max(salary)-min(salary)) as DIEF_SALARY from EMPLOYEES group by job_id) a;
select * from EMPLOYEES;
