CREATE TABLE Ruser (
	userid varchar2(15) not null primary key,
	userpw varchar2(20) not null,
	usernm varchar2(20),
	age number(10),
	phone varchar2(20)
);

---

CREATE TABLE Rroom (
  rnum varchar2(15) not null primary key,
  grade varchar2(20),
  breakfast varchar2(1)
);

---

CREATE TABLE Rreserv (
	date_s varchar2(20) not null,
	date_e varchar2(20) not null,
	rnum varchar2(15) not null,
	userid varchar2(20) not null,
	usernm varchar2(20),
	phone varchar2(20),
	constraint fk_rnum foreign key(rnum) references Rroom(rnum),
	constraint fk_userid foreign key(userid) references Ruser(userid),
	constraint pk_Rreserv primary key(date_s, date_e, rnum, userid)
);