-- Database(= DB) : 데이터를 저장하고 관리하는 시스템 소프트웨어
-- DBMS : DB를 효과적으로 사용하고 관리하는 프로그램
-- ex) Oracle DB, MySQL, MS-SQL 등

-- SQL : DB를 제어하기 위한 프로그램언어
-- 1. DDL : create, drop, alter
-- 2. DML : select, insert, update, delete
-- 3. DCL : grant, revoke, commit, rollback

-- table : 데이터를 저장하는 객체

-- SELECT 구문 : 조회
-- 구문 : select 열1, 열2, ...   from 테이블명;
SELECT * from person;
SELECT name from person;
SELECT name, height from person;
SELECT height, name from person;
SELECT name, birth from person;

-- 조건절 where : 조건에 일치하는 행을 찾는다
-- 비교 연산 : >, <, >=, <=, =, !=
-- 논리 연산 : and, or, not
select * from person where name = '홍진호';
select * from person where height >= 170;
select name from person where height <= 170;

select * from person where birth >= '00/01/01' and height <= 170;

-- 구문이 길어지면 줄을 나누어 작성한다
select * from person
    where birth < '00/01/01'
    and height >= 170;
    
-- null 값 판별 : is라는 키워드로 판별
select * from person where birth = null;
select * from person where birth is null;
select * from person where birth is not null;

-- (null)이 실제 null값(괄호있는게 실제 null)
select * from person where name is null;
select * from person where name = 'null';

-- order by : 정렬
-- asc : 오름차순(기본값)
-- desc : 내림차순 (4321,라다나가,DCBA)
select * from person order by name asc;
select * from person order by name desc;
select * from person order by height asc;

select * from person 
    where birth >= '00/01/01' 
    order by height desc;


-- 연습 : 나이순으로 내림차순 해보세요
select * from person 
    order by birth;

-- ※ 아래는 참고
-- 1. 현재 계정이 가진 테이블 목록
select * from tab;

-- 2. 지정 테이블의 간단한 열 정보
desc person;






