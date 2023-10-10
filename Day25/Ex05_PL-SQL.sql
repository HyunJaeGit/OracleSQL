-- PL/SQL
-- 1. Oracle DB에서 사용되는 프로그래밍 언어
-- 2. SQL문을 프로그래밍 문장과 결합하여 DB에서 실행되는 프로그램 블록을 작성 가능
-- 3. 데이터 처리 및 로직을 구성하고, 프로시저, 함수, 트리거 작성에 사용

set serveroutput on;
-- DB구문을 콘솔에 출력하게 하는 구문
-- DB 접속 후 딱 한번만 수행하면 된다

declare                                     -- 내부 로직에서 사용할 변수를 선언
    v_name    varchar2(20);                     -- v_ 로 (가상)을 붙여줘서 기존 테이블 name과 오해 방지
    v_age     number := 30;                     -- age 를 30으로 초기화 시킴(대입연산)
    v_grade   number;
begin                                       -- 로직의 시작점 (Java로 치면 main함수)

    select 
        name, grade into v_name, v_grade    -- into는 pl/sql에서만 사용 가능
        from student                        -- 조회한 데이터를 변수에 저장하고 이후 로직에 활용가능
        where idx = 20000101;                   -- ex) 총 학점을 가져와 졸업 학점인지 아닌지 구별

    v_age := v_age +5;                      -- begin ~ end 사이에서 변수를 선언할 수는 없지만 변경은 가능
    
    dbms_output.put_line('이름 : ' || v_name);    -- 이어서 데이터를 출력시 || 를 사용
    dbms_output.put_line('나이 : ' || v_age);
    dbms_output.put_line('총학점 : ' || v_grade);
end;                                        -- 끝 ( 구문 전체를 드래그한뒤 실행해야함)








