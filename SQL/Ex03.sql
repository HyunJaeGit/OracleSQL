-- insert : 행 삽입
-- 구문1 : insert into 테이블명 values(값1, 값2 ...);
insert into person VALUES('박철수',171.2,'03/06/10');

-- 구문2 : insert into 테이블명(열1, 열2 ...) values(값1, 값2 ...); -> 지정한 열만 채움
insert into person(name, birth) VALUES('김희선', '91/07/19');



-- 테이블의 행의 변경 흐름 단위를 '트랜젝션'이라고 한다
-- 1. commit : 변경된 트렌잭션을 DB에 반영 ( = 저장 )
-- 2. rollback : 변경된 트랜젝션을 취소, 이전 commit까지 회귀

commit;
rollback;


-- 연습) insert 구문1, 2를 한번씩 사용해서 2명의 사람을 추가하라
insert into person values('신지원',166.3,'99/02/14');
insert into 
    person(name, birth) 
    values('김현아','98/12/21');
    
commit;
select * from person;