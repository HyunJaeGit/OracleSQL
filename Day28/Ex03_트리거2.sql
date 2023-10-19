-- 트리거 생성

create or replace trigger test
    after delete or update on tri_test          -- [after | before] [delete | update] on [table]
    for each row                                -- 각 행마다 모두 적용해라
    
declare
    v_action      varchar2(10);
begin
    if deleting then                            -- deleting : 삭제 작업일 경우 '참'
        v_action := '삭제';
    elsif updating then                         -- updateing : 수정 작업일 경우 '참'
        v_action := '수정';
    end if;                                     -- inserting : 추가 작업일 경우 '참'
    
    insert into tri_back(idx, name, age, action)            -- :old 는 trigger 발생 이전 열 데이터
        values(:old.idx, :old.name, :old.age, v_action);    -- :new 는 trigger 발생 이후 열 데이터
end;