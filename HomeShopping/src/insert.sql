INSERT INTO member_tbl_02 VALUES (
    '10001', 
    '김행복', 
    '010-1111-2222', 
    '서울 동대문구 휘경 1동', 
    TO_DATE('20151202', 'YYYYMMDD'), 
    'A', 
    '01'
);

INSERT INTO member_tbl_02 VALUES (
    '10002', 
    '이축복', 
    '010-1111-3333', 
    '서울 동대문구 휘경 2동', 
    TO_DATE('20151206', 'YYYYMMDD'), 
    'B', 
    '01'
);

INSERT INTO money_tbl_02 VALUES ('10001', '20160001', '500', '5', '2500', 'A001', TO_DATE('20160101', 'YYYYMMDD'));
INSERT INTO money_tbl_02 VALUES ('10001', '20160002', '1000', '4', '4000', 'A002', TO_DATE('20160101', 'YYYYMMDD'));
INSERT INTO money_tbl_02 VALUES ('10001', '20160003', '500', '3', '1500', 'A008', TO_DATE('20160101', 'YYYYMMDD'));