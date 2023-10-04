show user;

-- 사원 테이블 (사원번호, 이름, 부서번호)
create table emp (
    idx     number      constraint emp_idx primary key,
    name    varchar2(20)    not null,
    dep_idx number   
);

-- 부서 테이블 (부서번호, 부서이름, 부서연락처)
create table dep (
    idx         number          constraint dep_idx unique,
    name        varchar2(20),
    phone       varchar2(20)
);


-- 사원 테이블 채우기

insert into emp values(1001, '홍길동', 100);
insert into emp values(1002, '김민지', 200);
insert into emp values(1003, '박수철', 300);
insert into emp values(1004, '강호동', null);
insert into emp values(1005, '유재석', 100);
insert into emp values(1006, '이경규', null);


-- 부서 테이블 채우기
insert into dep values(100, '생산부', '051-123-5678');
insert into dep values(200, '개발부', '051-343-7878');
insert into dep values(300, '총무부', '051-567-1234');
insert into dep values(400, '영업부', '051-654-9876');
insert into dep values(500, '회계부', '051-121-0099');

commit;

select * from emp;
select * from dep;

-- 외래키
-- 1. 다른 테이블의 열을 참조하는 키
-- 2. 참조하는 열에 없는 데이터면 현재 열에도 데이터가 추가되지 않음
-- 3. 테이블을 정규화로 나눈 후 관계를 표현시 사용하는 키

select * from emp order by idx;

-- ※ 외래키 세팅 후 아래 두 코드 실행 후 비교
insert into emp values(1007, 'test', 1000);
insert into emp values(1007, 'test', 500);
-- 비교 결과
-- 1. dep_idx에 1000을 집어 넣으니 에러, 참조중인 DEP테이블 idx에 1000이 없음
-- 2. dep_idx에 500을 집어 넣으니 실행됨. 참조중인 DEP테이블 idx에 500이 있음




rollback;

