 --natural join 
 -- �ΰ��� ���� ������ �ǵ����� �ʾҴµ� �ɸ� 
 -- department_id, manager_id 
       select a.first_name, b.department_name 
         from employees a 
 natural join departments b; 
 
 -- join ~ using 
 select a.first_name, b.department_name 
   from employees a 
   join departments b 
  using (department_id); 
   
 -- join ~ on 
 select a.first_name, b.department_name 
   from employees a 
   join departments b 
     on a.department_id = b.department_id; 
 -- ���� 
 --select a.first_name, b.department_name 
 --  from employees a, departments b 
 -- where b.department_id = a.department_id;      
 
 
 --  left outer 
 --select a.first_name, b.department_name 
 --  from employees a, departments b 
 -- where b.department_id (+)= a.department_id; 
          select a.first_name, b.department_name 
            from employees a 
 left outer join departments b 
              on a.department_id = b.department_id;    
 
 
          select a.first_name, b.department_name 
            from departments b 
 right outer join employees a 
              on a.department_id = b.department_id;    
