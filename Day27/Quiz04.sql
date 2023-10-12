-- 아래 프로시저가 실행되게 한다
-- 전달된 employee 전체 급여를 n% 인상

create or replace procedure quiz3(
    n        number
) as
    v_salary        number;
    v_idx           number;
    
    cursor cur_emp is
        select idx, salary
        from employee;
begin
    
    for emp in cur_emp() loop
        v_salary := emp.salary * (100 + n)/100;
    
        update employee 
            set salary = trunc(v_salary)
            where idx = emp.idx;
    end loop;
-- commit;
end;

select * from employee;
exec quiz3(10);
rollback;