-- 1. 외래키가 걸려있기 때문에 전공 테이블을 먼저 좀 채워야 한다

insert into department values(100, '물리학', '1995-01-02', '02-123-4567', 'phy@naver.com');
insert into department values(200, '경영학', '1996-02-01', '02-534-3434', 'hello@gmail.com');
insert into department values(300, '컴퓨터공학', '1999-01-01', '02-432-1313', 'com@daum.net');
insert into department values(400, '영어문학', '1995-03-03', '02-111-4566', 'eng@icloud.com');
insert into department values(500, '역사학', '1995-01-01', '02-222-1234', 'hi@gmail.com');

select * from department order by idx;

commit;


-- 2. 학생정보 3개 정도 추가
insert into student 
    values(default, '홍길동', 80, 300,'남','2001-05-05','부산광역시','010-1234-5678', 'h@naver.com');
insert into student 
    values(default, '김민지', 90, 100,'여','2000-01-25','서울특별시','010-3434-1212', 'k@gmail.com');
insert into student 
    values(default, '이민수', 68, 400,'남','2003-07-10','대구광역시','010-5656-9999', '1@kakao.com');

select * from student order by idx;

commit;

-- 3. join 연습1 : 학생의 정보를 출력(단, 학번, 이름, 연락처, 학과명, 학과 연락처)

select A.idx, A.name, A.phone, B.name, B.phone
    from student A
    inner join department B
    on A.dep_code = B.idx;

-- 4. join 연습2 : 컴공인 학생의 정보를 출력(단, 학번, 이름, 연락처, 학과명, 학과 연락처)

select A.idx, A.name, A.phone, B.name as dep_name, B.phone as dep_phone
    from student A
    inner join department B
    on A.dep_code = B.idx
    where b.name = '컴퓨터공학';

-- 5. join 연습 3 : 학생의 정보를 출력, 학생이 없는 학과도 출력(단, 학번, 이름, 연락처, 학과명, 학과연락처)

select A.idx, A.name, A.phone, B.name as dep_name, B.phone as dep_phone
    from student A
    right outer join department B
    on A.dep_code = B.idx;

