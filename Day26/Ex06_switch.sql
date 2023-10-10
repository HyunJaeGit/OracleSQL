-- 여러 조건을 처리할 땐 case문을 사용할 수 있다

declare
    v_menu          number := 1;
    v_msg           varchar2(20);
begin
    case
        when v_menu = 1 then
            v_msg := '1번 선택';
        when v_menu = 2 then
            v_msg := '2번 선택';
        when v_menu = 3 then
            v_msg := '3번 선택';
        else
            v_msg := '없는 메뉴';
    end case;
    
    dbms_output.put_line(v_msg);
end;

