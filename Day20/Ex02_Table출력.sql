-- ※ 테이블명 변경
alter table student rename to test_student;


-- VIEW : 가상 테이블
-- - 실제 디스크의 용량을 차지하지 않음
-- - 실제 테이블의 일부만 보여주거나, 혹은 연산이 자주 필요한 구문에 사용
create view test_stu_view as
   ( select A.*, kor + eng + mat as total,
   round((kor + eng + mat) / 3, 2) as avg 
   from test_student A);
   
-- ※ round(실수, 소수점 자리) : 지정 자리까지 제한
drop view test_stu_view;

-- 그럼 이제, 긴 select를 작성하지 않고, view를 출력하면 된다~
select * from test_stu_view;

-- 실제 TABLE 데이터는 즉시 입력된 값을 계산하지못함
-- 그래서, 가상 테이블로 계산할수있다.
update test_stu_view
    set kor = 71
    where name = '홍길순';

commit;

select * from TEST_STUDENT;




