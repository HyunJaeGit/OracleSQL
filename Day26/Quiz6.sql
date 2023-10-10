 -- 3. employee 테이블에서 직급이 '사원'인 직원의 연봉을 10% 인상시켜보세요
 
 declare
    v_idx           number;
    v_salary        number;
    
    cursor cur_emp is 
        select * from employee 
        where position = '사원';
        
 begin
    for emp in cur_emp() loop
        v_salary := emp.salary + (emp.salary*0.1);
        
        dbms_output.put_line(v_idx || v_salary);
        update employee
            set salary = v_salary
            where idx = emp.idx;
    end loop;
 end;
 
 rollback;
 commit;