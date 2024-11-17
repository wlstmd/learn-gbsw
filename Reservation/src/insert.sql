INSERT INTO Ruser VALUES ('gbsw', '1234', '진창훈', '20', '010-1234-5678');

commit;

---

INSERT INTO Rroom VALUES ('101', '2', '1');
INSERT INTO Rroom VALUES ('102', '3', '0');
INSERT INTO Rroom VALUES ('201', '1', '1');
INSERT INTO Rroom VALUES ('202', '2', '0');
INSERT INTO Rroom VALUES ('203', '1', '1');
INSERT INTO Rroom VALUES ('205', '3', '0');

commit;

---

INSERT INTO Rreserv VALUES ('2022-09-10', '2022-09-11', '101', 'gbsw', '진창훈', '010-1234-5678');
INSERT INTO Rreserv VALUES ('2024-12-10', '2024-12-11', '204', 'gbsw', '진창훈', '010-1234-5678');

commit;