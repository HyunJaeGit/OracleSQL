-- create : DB 객체를 생성하는 명령
-- (사용자, 테이블 등등)

create table test (
    name    varchar2(20),
    height  number,
    birth   date,
    email   varchar2(50)
);

-- alter : 테이블의 열 정보를 변경
-- 1. 구문) alter table [테이블명] modify [열] [자료형];
alter TABLE test modify name varchar(30);

-- 2. alter table [테이블명] add [열] [자료형];
alter table test add address varchar(150);

-- 3. alter table [테이블명] drop column [열];
alter table test drop column email;

-- 4. alter table [테이블명] rename column [기존열] to [변경열];
alter table test rename column address to ads;

desc test;

-- drop : DB 객체를 제거
-- (계정, 사용자, 테이블 등등 제거가능)
-- drop table [테이블명];
drop table test;

-- ※ 계정 생성 및 제거 (+ 권한 부여)