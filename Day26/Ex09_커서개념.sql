declare
    -- 커서 : 테이블을 가리키는 객체 (= jdbc의 ResultSet과 같음)
    -- 테이블 자체를 출력할수없어서, 커서로 테이블을 가져옴
    cursor cur_per is
        select * from person;
begin
    for per in cur_per() loop
        dbms_output.put_line(per.name || ' ' || per.height || ' ' || per.birth);
    end loop;

end;