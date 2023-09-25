-- 시퀀스 생성 (자동 증가열 - 자동으로 증가시켜줌)
-- start with(다음으로 시작), increment by(증분), minvalue,maxvalue(최소,최대), nocache(캐시없음)
create SEQUENCE account_seq
    start with 1003
    increment by 1
    minvalue 1001
    maxvalue 999999999999999
    nocache;

-- ※ 아래는 잘 못 만들었을 경우 사용해서 지우세요
-- 시퀀스 제거
drop SEQUENCE account_seq;

-- ※ 아래는 테이블의 열 정보를 변경 (힘들면 그냥 클럭으로 바꾸자~)
alter table account modify idx number default account_seq.nextval;

insert into
    account(userid, userpw, nick, email)
    values('root', 'qwe@123', '관리자1', 'root@gmail.com');
    
SELECT * from account order by idx desc;

select banner from v$version;