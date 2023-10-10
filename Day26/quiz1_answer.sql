-- 연습)
-- employee 테이블에서 사원번호 20230112인
-- 사람의 이름, 성별, 직급, 부서, 봉급을 sqldeveloper 콘솔에 출력해 보세요
-- ※ 출력 형태는 자유롭게

select * from employee;

set serveroutput on;  


declare                 
    v_name          varchar(20);
    v_gender        varchar(6);
    v_position      varchar(20);
    v_department    varchar(50);
    v_salary        number;
begin
    select name, gender, position, department, salary 
        into v_name, v_gender, v_position, v_department, v_salary 
        from employee
        where idx = 20230110;
        
    dbms_output.put_line('이름 : ' || v_name);
    dbms_output.put_line('성별 : ' || v_gender);
    dbms_output.put_line('직급 : ' || v_position);
    dbms_output.put_line('부서 : ' || v_department);
    dbms_output.put_line('봉급 : ' || v_salary);
end;