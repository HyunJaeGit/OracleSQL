-- 1. Account 테이블 삭제시 실행할 Account_del 트리거를 장석한다
-- - delete 작업시 account_back이라는 테이블에 삭제할 데이터를 insert한다

-- 2. 작성 후 트리거 테스트

create table Account_back(
    idx         number,
    userid      varchar2(20),
    userpw      varchar2(20),
    nick        varchar2(100),
    email       varchar2(150),
    join_date   date,
    action      varchar2(20)
);

drop table Account_back;
create or replace trigger Account_del
    after delete or update on Account
    for each row
declare
    v_action        varchar2(20);
begin
    if deleting then
        v_action := '삭제';
    elsif updating then
        v_action := '수정';
    end if;

    insert into Account_back (idx, userid, userpw, nick, email, join_date, action)
        values(:old.idx, 
        :old.userid, :old.userpw, 
        :old.nick, :old.email, 
        :old.join_date, v_action);
end;
    
rollback;
delete from Account where idx = 1002;
update Account set nick = 'tester' where idx = 1005;


select * from account_back;
select * from account;
