-- 트리거 (Trigger)
-- 1. 특정 테이블에 이벤트가 발생시 실행되는 일련 코드(= 프로시저)
-- 2. 트리거는 직접 실행할 수 없고 무조건 이벤트가 발생해야 실행된다
-- 3. 트리거는 테이블에 부착되어 실행되는 프로시저라고 생각하면 좋다


-- 1. 실습용 테이블을 하나 작성

create table tri_test(
    idx         number          constraint tri_idx primary key,
    name        varchar2(20)    not null,
    age         number          not null
);

-- 2. 더미 데이터 삽입
insert into tri_test values(1001 , '홍길동', 22);
insert into tri_test values(1002 , '김민수', 30);
insert into tri_test values(1003 , '박민지', 25);

commit;

-- 3. 결과 확인
select * from tri_test;


-- 4. 백업용 테이블 작성
create table tri_back (
    idx         number          constraint trib_idx primary key,
    name        varchar2(20)    not null,
    age         number          not null,
    del_date    date            default sysdate
);


-- 5. 트리거 생성은 ex03.sql에서 확인
-- - 트리거가 동작하게 delete or update를 수행한다
delete from tri_test where idx = 1002;

update tri_test set name = '홍진호' where idx = 1001;

rollback;


-- 6. 확인
select * from tri_back;
select * from tri_test;

delete from tri_back;


