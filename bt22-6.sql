CREATE DATABASE StudentTest; 
create table test(
Testid int primary key,
Name varchar(50)
);
create table student(
RN int primary key,
Name varchar(50) not null,
Age int
);
create table studenttest(
RN int,
testid int,
 foreign key (testid) references test(testid),
 foreign key (RN) references student(RN),
Date datetime,
mark float
);
insert into student values(1,'Nguyen Hong Ha',20),(2,'Truong Ngoc Anh',30),
(3,'Tuan Minh',25),(4,'Dan Truong',22);
insert into test values(1,'EPC'),(2,'DWMX'),(3,'SQL1'),(4,'SQL2');
insert into studenttest values(1,1,'2006-07-17',8),(1,2,'2006-07-18',5),(1,3,'2006-07-19',7),
(2,1,'2006-07-17',7),(2,2,'2006-07-18',4),(2,3,'2006-07-19',2),(3,1,'2006-07-17',10)
,(3,3,'2006-07-18',1);
-- Cau2
CREATE VIEW DSdiemthi AS
select student.Name,test.Name Nametest,studenttest.mark,studenttest.Date
from studenttest join test on studenttest.testid = test.testid join student  on studenttest.RN = student.RN;
-- Cau3
Select * from student
where not exists (select * from studenttest where student.RN = studenttest.RN);
-- Cau4
select S.name,T.Name,ST.mark,ST.date
from studenttest ST join test T on ST.testid = T.testid join student S on ST.RN = S.RN
where ST.mark < 5;
-- Cau5
CREATE VIEW DSdiemtrungbinh AS
select Student.name,avg(mark) as 'AVGmark'
from studenttest join student  on studenttest.RN = student.RN
group by name ;
select * from dsdiemtrungbinh;
-- Cau6
select dsdiemtrungbinh.name,max(avgmark) as 'maxmark'
from dsdiemtrungbinh;
-- Cau7
select dsdiemthi.Nametest,max(mark) as 'maxmark'
from dsdiemthi
group by dsdiemthi.Nametest
order by  dsdiemthi.Nametest ASC;
-- Cau8
-- Cau9
update student set age = age + 1
where RN >0;
-- Cau10
alter table student add status varchar(10);
-- Cau11
update student set status = 'young'
where Age < 30 and RN>0;
update student set status = 'old'
where Age >= 30 and RN>0;
-- Cau12
CREATE VIEW vwStudentTestList AS
select * from dsdiemthi
order by  dsdiemthi.date ASC;

select * from vwStudentTestList;
-- Cau13
