-- employee 테이블에서 고용 일자 (h_date)를 가져와서 N연차를 출력

DECLARE
    v_name      VARCHAR2(20);
    v_hyear     number;
    v_cyear     number := extract(year from sysdate);
    v_result    number;
BEGIN
    SELECT  NAME, extract(year from h_date)
        INTO v_name, v_hyear
        FROM employee
        WHERE idx = 20230110;
            
    v_result := v_cyear - v_hyear;
    DBMS_OUTPUT.PUT_LINE('이름 : ' || v_name || '님은 ' || v_result || '년차 입니다');
END;