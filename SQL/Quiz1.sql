-- 1. student 테이블을 작성
-- ※ 열 정보
-- 이름 : 문자열 (50byte)
-- 국어 : 숫자
-- 영어 : 숫자
-- 수학 : 숫자
select * from student;

-- 2. Student 테이블에 행을 3개 정도 추가
insert into student VALUES('홍길동',100,97,92);
insert into student VALUES('임꺽정',88,77,98);
insert into student VALUES('전우치',100,88,90);
insert into student VALUES('허준',90,78,84);
insert into student VALUES('장금이',88,56,66);
select * from student;
commit;

-- 3. 아무 학생이나 선택해서 국 영 수 점수 수정
UPDATE student
    set
        name = '홍길순',
        kor = 87,
        eng = 82,
        mat = 100
        where name = '홍길동';
select * from student;
commit;

-- 4. 아무 학생을 선택해서 정보 제거
delete from student where eng < 60;

select * from student;
rollback;
commit;






