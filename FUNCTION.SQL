CREATE OR REPLACE FUNCTION f_books_borrowed_by_mem(p_mid members.mid%type) return NUMBER
IS
   l_cnt NUMBER:=0;
BEGIN
    select count(*) into l_cnt from borrow_records where mid=p_mid and NVL(RETURN_STATUS,'N')='N';
    return l_cnt;
END;
/