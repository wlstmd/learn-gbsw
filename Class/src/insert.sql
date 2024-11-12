-- class --
insert into class values ('A001', '소프트웨어개발과', '054-123-1234');
insert into class values ('A002', '사물인터넷과', '054-123-1235');
insert into class values ('A003', '게임개발과', '054-123-1236');

commit;

-- student --
insert into student values('20220201', '진', '경상북도 의성군 봉양면', '050101', 'A001');
insert into student values('20220202', '슈가', '경상북도 안동시 태화동', '050505', 'A001');
insert into student values('20220203', '제이홉', '경상북도 구미시 도량동', '050708', 'A002');
insert into student values('20220204', '지민', '대구 광역시 달서구 용산동', '050912', 'A003');

commit;

-- subject --
insert into subject values('s001', '데이터베이', '오라클 데이터베이스 강의');
insert into subject values('s002', '프로그래밍', 'C프로그래밍 강의');
insert into subject values('s003', '댄스', '방송댄스 강의');

commit;

-- request --
insert into request values('1', '20220201', 's001', '2022-03-01');

commit;