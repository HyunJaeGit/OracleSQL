-- 1. primary key : 기본키
-- - 테이블 당 한개만 가질 수 있다
-- - 기본키가 지정된 일은 중복값이 방지되며, null도 입력할 수 없다

-- 2. unique : 고유 제약
-- - 테이블에 여러개 지정 가능
-- - 지정된 열은 중복값이 방지된다
-- - 기본키 외 중복값을 거를때 사용

-- 3. not null : null 제약
-- - 테이블에 여러개 지정 가능
-- - 지정된 열은 null값 입력이 방지된다
-- - 무조건 data를 받아야함

-- 4. default : 기본값
-- - 지정열에 기본값을 세팅
-- - 값을 입력하지 않으면 세팅된 기본값이 열에 채워진다

create table account (
    idx         number          constraint account_idx primary key, 
    userid      varchar2(20)    constraint account_userid unique not null, 
    userpw      varchar2(20)    not null,
    nick        varchar2(100)   constraint account_nick unique not null, 
    email       varchar2(100)   not null,
    join_date   date            default sysdate 
);

drop table account;

insert into account values(1001 , 'user1', '1234', '유저1', 'user1@naver.com', default );
-- 1번째 실행시 -> 성공
-- 2번째 실행시 -> 실패, 이미 pk, unique에 중복으로 걸림(= 무결성 제약)

insert into account values(1002 , 'itbank', '1234', '아뱅', 'user1@naver.com', default );
-- 실행시 -> 성공, 테이블에 존재하던 기존의 데이터와 중복이 없기 때문

insert into account values(1003 , 'hong0812', null, '콩', 'hong@gmail.com', default );
-- 실행시 -> 실패, userpw는 not null이 설정 되어있다. 따라서 null 입력이 불가능

commit;

