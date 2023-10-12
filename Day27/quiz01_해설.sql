-- 3. employee 기술부 연봉 10% 인상

declare
    
    v_salary        number;

    cursor cur_emp is
        select name, department, salary 
            from employee 
            where department='기술부';
begin
    for per in cur_emp() loop
        v_salary := per.salary * 1.1;
    
        dbms_output.put_line(per.name || per.department || v_salary);
        
        update employee
            set salary = v_salary
            where name = per.name;
    end loop;
end;





