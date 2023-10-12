-- 아래 프로시저가 실행되게 한다
-- 전달된 employee의 idx의 급여를 10% 인상

create or replace procedure Quiz2(
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
        
    update employee
        set salary = v_salary
        where idx = p_idx;
        
    dbms_output.put_line(p_idx || ' ' || v_name||' 연봉 인상 완료');
    dbms_output.put_line('인상된 연봉 : ' || v_salary);
    
--    commit;
end;


exec Quiz2(20230117);
rollback;
select idx, name, salary from employee where idx = 20230117;