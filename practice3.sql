--문제1
select MAX(salary) "최고임금" ,MIN(salary) "최저임금",(MAX(salary)-Min(salary)) as "최고임금-최저임금" from EMPLOYEES;

--문제2
select to_char(max(hire_date), 'yyyy"년"-mm"월"-dd"일"') "신입사원" from EMPLOYEES;

--문제3
select to_char(avg(salary),'99,999') "평균봉급",to_char(max(SALARY),'99,999')"최고봉급",to_char(min(SALARY),'99,999') "최저봉급" from EMPLOYEES group by DEPARTMENT_ID
order by avg(salary) desc, max(salary) desc, min(salary) desc;

--문제4
select to_char(avg(salary),'99,999') "평균봉급",to_char(max(SALARY),'99,999') "최고봉급",to_char(min(SALARY),'99,999') "최저봉급" from EMPLOYEES group by job_id 
order by avg(salary) desc, max(salary) desc, min(salary) desc;

--문제5
select to_char(min(HIRE_DATE),'yyyy"년"-mm"월"-dd"일"') "가장 오래된 직원" from EMPLOYEES;

--문제6
select DEPARTMENT_ID "부서id",to_char(avg(SALARY),'99,999') "평균봉급",to_char(min(SALARY),'99,999') "최저봉급",to_char(avg(SALARY)-min(SALARY),'99,999') "평균봉급-최저봉급"
from EMPLOYEES 
group by DEPARTMENT_ID HAVING avg(SALARY)-min(SALARY)<2000
order by avg(SALARY)-min(SALARY);

--문제7
select JOB_ID "Job번호",to_char(max(SALARY),'99,999') "최고임금",to_char(min(SALARY),'99,999') "최저임금",to_char((MAX(salary)-Min(salary)),'99,999') as "최고임금-최저임금" from EMPLOYEES 
group by JOB_ID having MAX(salary)-Min(salary)>5000;

select JOB_ID "Job번호",to_char(max(SALARY),'99,999') "최고임금",to_char(min(SALARY),'99,999') "최저임금",to_char((MAX(salary)-Min(salary)),'99,999') as "최고임금-최저임금" from EMPLOYEES 
group by JOB_ID;

select job_title from jobs where job_id='SA_REP';

--Sub query
select max(dief_salary) from (select job_id, (max(salary)-min(salary)) as DIEF_SALARY from EMPLOYEES group by job_id) a;
select * from EMPLOYEES;
