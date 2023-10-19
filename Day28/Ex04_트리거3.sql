create or replace trigger tri_insert
    before insert on tri_test
    for each row
declare

begin
    if :new.idx < 1000 then
        raise_application_error(-20000, '에러 메세지~');
        -- 예외를 발생시킨 구문이 취소된다
        return;
    end if;
end;

insert into tri_test values(1004, '이수진', 17);

insert into tri_test values(900, '김철수', 29);

select * from tri_test;