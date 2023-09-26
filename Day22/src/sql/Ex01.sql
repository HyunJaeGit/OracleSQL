
-- dual : 임시 테이블, 연산자나 sql함수 결과를 출력시 사용됨
-- rount()  : 소숫점 표시
-- mod()    : 나머지 구하는 연산
select 100+200, 100-200, round(100/3, 2), mod(100, 6) from dual;

-- 형변환
select 100 + '20' from dual;
select '100' + '20' from dual;

-- ※ oracle에서는 자바처럼 문자열을 이어붙이지 않음
select 'hello' + 'world' from dual;
select 100 + 3.141592 from dual;

-- to_char()    : 문자로 형변환
select to_char(100) from dual;

-- to_number()  : 숫자로 형변환
select to_number('54321') from dual;

-- to_date()    : 날짜로 형변환
select TO_DATE('20230130') from dual;
select TO_DATE('2023-01-30') from dual;
select TO_DATE('2023/01/30') from dual;

select to_char(sysdate, 'YYYY-MM-DD') from dual;

select to_char(to_date('20231111'), 'YYYY-MM-DD') from dual;
select to_char(sysdate, 'YYYY-MM-DD  HH24:MI:SS') from dual;

select to_date(sysdate) from dual;








