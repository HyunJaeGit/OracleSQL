-- 프로시저

-- - SQL구문과 프로그래밍 문장을 조합해서 사용하는 코드 불록
-- - 이를 지정해서 사용하는 것이 '저장된 프로시저(stored procedure)'라고 함
-- - ※ 자바로 치면 void형 메서드라고 생각하면 좋음

-- 1. 프로시저 생성 (ex01.sql)
create or replace procedure test as

begin
    for i in 1..5 loop
    dbms_output.put_line('Hello, World!!!');
    end loop;
end;

-- 2. 실행은 ex02.sql 에서