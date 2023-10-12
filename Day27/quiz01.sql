-- set SERVEROUTPUT on;

-- 1. employee 테이블에서 이름이 '박수진'의 정보를 출력
select * from employee;
DECLARE
    v_name      varchar2(20);
    v_position  VARCHAR2(20);
    v_dep       varchar2(20);
    
begin
    select  name, position, department
        into    v_name, v_position, v_dep
        from    employee
        where   name = '박수진';
        
    dbms_output.put_line('문제1) : ' || v_name ||' '|| v_position || ' '|| v_dep);

end;




-- 2. person 테이블에서 홍길동이 '성인/미성년자'이니 판별해서 출력
select * from person;

DECLARE     -- 변수선언
    v_name      varchar2(20);
    v_birth     date;
    v_age       number;
    v_result    varchar2(20);
    
begin
    select  name, birth
        into    v_name, v_birth
        from    person
        where   name = '홍길동';
       
    v_age := extract(year from sysdate) - extract(year from v_birth);
    
    if v_age >=19 then
        v_result := '성인';
    else
        v_result := '미성년자';
    end if;
    dbms_output.put_line(v_name || ' (' || v_age || '세) ' || v_result);

end;

-- 3. employee 전체 테이블에 기술부의 연봉을 10% 인상

DECLARE
    v_name          varchar2(20);
    v_salary        number;
    v_department    varchar2(20);
    
begin
     for emp in (select name, salary from employee where department = '기술부') loop
        v_name := emp.name;
        v_salary := trunc(emp.salary * 1.1);
        
        -- 해당 직원의 연봉을 업데이트
        UPDATE employee
            SET salary = v_salary
            WHERE name = v_name;
        
        -- 콘솔에 결과 출력
        DBMS_OUTPUT.PUT_LINE(v_name || '의 연봉이 인상되었습니다.');
    end loop;
end;
commit;
rollback;
select * from employee where department = '기술부';





