-- 퀴즈
-- 1. sal_up이라는 프로시저를 생성한다
-- 2. sal_up은 employee의 idx와 연봉 상승률(n%)를 전달하면
--      해당 idx의 사원의 연봉을 n% 증가시키는 프로시저이다
-- 3. 그 후 증가된 연봉을 반환한다

-- set serveroutput on;

create or replace procedure sal_up(
    p_idx     in      number,
    p_up       in      number,
    result  out     number
)as
    v_sal     number;
    v_up      number;
begin
    v_up := p_up;
    
    select salary
        into v_sal
        from employee
        where idx = p_idx;
    result := v_sal*(100+v_up)/100;
    
    update employee
        set salary = result
        where idx = p_idx;
--  commit;
end;


declare
    result      number;
    result2     number;    
begin
    sal_up(20230112, 5, result);
    dbms_output.put_line('연봉 상승 완료 : ' || result);    
    sal_up(20230112, 10, result2);
    dbms_output.put_line('연봉 상승 완료 : ' || result2);    
end;


select * from employee;

rollback;



create or replace procedure selectAll(
) as
    v_idx       number;
    v_name      varchar2(20);
    v_sal       number;
    v_dep       varchar2(20);
    
    cursor is cur_emp
        select idx, name, salary, department
        from employee;
begin
    for emp in cur_emp loop
        idx : = v_idx;
        name : = v_name;
        salary : = v_sal;
        department : = v_dep;
    dbms_output.put_line(v_idx  || ' ' || v_name  || ' ' || v_sal  || ' ' || v_dep);
    end loop;
end;
