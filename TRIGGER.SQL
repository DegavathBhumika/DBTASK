CREATE OR REPLACE TRIGGER T1 AFTER INSERT OR UPDATE ON BORROW_RECORDS FOR EACH ROW
DECLARE
  CURSOR C1 is select * from books WHERE BID=:NEW.BID AND AVILABILITY='Y' FOR UPDATE;
  l_x number;
BEGIN
    IF INSERTING  THEN
        FOR i in C1 LOOP
             l_x := i.TOTAVAIL-1;
            update books set TOTAVAIL=l_x,AVILABILITY=DECODE(l_x,0,'N','Y') where CURRENT OF C1;
        END LOOP;
        IF l_x is NULL THEN
           RAISE_APPLICATION_ERROR(-20001,'Book Not Available');
         END IF;    
    ELSE
            if :new.RETURN_STATUS='Y' THEN
                update books set TOTAVAIL=TOTAVAIL+1,AVILABILITY='Y' 
                where  BID=:NEW.BID;
            END IF;    
        
    END IF;
END;
/
