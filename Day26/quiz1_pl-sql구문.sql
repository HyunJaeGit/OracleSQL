-- 연습)
-- employee 테이블에서 사원번호 20230112인
-- 사람의 이름, 성별, 직급, 부서, 봉급을 sql developer 콘솔에 출력해보세요
-- ※ 출력 형태는 자유롭게

set serveroutput on;

create or replace procedure test as
begin
    dbms_output.put_line('Hello PL/SQL!!!');
end;

exec test;