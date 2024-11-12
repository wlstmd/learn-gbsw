-- class --
CREATE TABLE class (
    class_code char(10) primary key,
    class_name varchar2(30) not null,
    class_phone varchar2(12)
);

-- student --
CREATE TABLE student (
    stu_code char(10) primary key,
    stu_name char(10) not null,
    stu_address varchar2(50),
    stu_bir char(6),
    class_code char(10) not null,
    FOREIGN KEY (class_code) REFERENCES class(class_code)
);

-- subject --
CREATE TABLE subject (
	sub_code char(10) primary key,
	sub_name varchar2(50) not null,
	sub_text varchar2(50)
);

-- request --
CREATE TABLE request (
	add_code number(3) primary key,
	stu_code char(10),
	sub_code char(10),
	add_date char(10)
);