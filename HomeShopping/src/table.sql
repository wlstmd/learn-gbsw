CREATE TABLE member_tbl_02 (
    custno number(6) primary key,
    custname varchar2(20),
    phone varchar2(13),
    address varchar2(60),
    joindate date,
    grade char(1),
    city char(2)
);

CREATE TABLE money_tbl_02 (
    custno number(6),
    salenol number(8) primary key,
    pcost number(8),
    amount number(4),
    price number(8),
    pcode varchar2(4),
    sdate date,
    CONSTRAINT fk_custno FOREIGN KEY (custno) REFERENCES member_tbl_02(custno)
);