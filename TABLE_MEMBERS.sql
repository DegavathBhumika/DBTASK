CREATE TABLE MEMBERS
(
  MID      NUMBER,
  MNAME    VARCHAR2(100 BYTE)                   NOT NULL,
  DOJ      DATE,
  ACTIVE   CHAR(1 BYTE),
  PHONENO  NUMBER
);
ALTER TABLE MEMBERS ADD (PRIMARY KEY (MID));