-- 1) declare 구문부터 만든다

declare
    v_name      varchar2(20);
    v_salary    number;
begin
    select name, salary
        into v_name, v_salary
        from employee
        where idx = 20230117;
        
        v_salary := v_salary * 1.1;
        
    -- dbms_output.put_line(v_name || v_salary);
    update employee
        set salary = v_salary
        where idx = 20230117;
    
    commit;
end;

select * from employee where idx = 20230117;

-- 2) 프로시저를 만든다

create or replace procedure Q2(
    p_idx       number
) as
    v_name      varchar2(20);
    v_salary    number;
begin
    select name, salary
        into v_name, v_salary
        from employee
        where idx = p_idx;
        
        v_salary := v_salary * 1.1;
        
    -- dbms_output.put_line(v_name || v_salary);
    update employee
        set salary = v_salary
        where idx = p_idx;
    
    commit;
end;

select * from employee where idx = 20230117;