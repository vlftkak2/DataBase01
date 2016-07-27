--Connect by prior(계층구조 데이터 표현할 때, 트리,디렉터리 구조)
select level, employee_id,MANAGER_ID,last_name from EMPLOYEES START with MANAGER_ID is null
CONNECT by prior EMPLOYEE_ID=MANAGER_ID order by level;
 
--Rollup, Cube
SELECT DEPARTMENT_ID,job_id,sum(salary) from EMPLOYEES group by rollup(DEPARTMENT_ID,job_id);

SELECT DEPARTMENT_ID,job_id,sum(salary) from EMPLOYEES group by cube(DEPARTMENT_ID,job_id);

--top-k rownum(게시판에서 페이징을 처리시 사용)
select rownum, employee_id,FIRST_name from EMPLOYEES where rownum<6 order by EMPLOYEE_ID;

--order by 이전에 where 절까지 실행되서 선택된 row가 있는 임시 테이블에서 rownum이 세팅됨
select rownum, employee_id,FIRST_name from EMPLOYEES order by first_name;

--해결방법(SubQuery)
select rownum,employee_id,FIRST_name 
from (select employee_id,FIRST_name from EMPLOYEES order by first_name) 
where rownum<10;

--문제
select rownum,employee_id,FIRST_name 
from (select employee_id,FIRST_name from EMPLOYEES order by first_name)
where rownum<10 and rownum<20;

--최종 해결 방법
select * from(
select rownum as rn,employee_id,FIRST_name 
from (select employee_id,FIRST_name from EMPLOYEES order by first_name))
where 10<rn and rownum<20; 

--rowid(pseudo column rownum, sysdate, rowid)
select rowid,first_name from EMPLOYEES;

























