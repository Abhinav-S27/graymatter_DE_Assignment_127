--scd 0 
create table scd0(
   empid int primary key,
   name varchar(100),
   jd date
)
alter table scd0
alter column name varchar(100)
insert into scd0 values(1,'abhinav',GETDATE())

--scd 1 

create table scd1(
    empid int primary key,
	name varchar(10),
	married varchar(10),
	ai int
)
insert into scd1(empid,name) values(1,'abhinav')
update scd1
set married='yes',ai=1000
where name='abhinav'
--scd2
create table scd2(
    sln int identity(1,1) primary key ,
    empid int ,
	name varchar(10),
	designation varchar(10),
	jd date,
	ed date
)
insert into scd2 (empid,name,designation,jd,ed) values(101,'abhinav','sde3',GETDATE())
insert into scd2 (empid,name,designation,jd,ed) values(101,'abhinav','manager',GETDATE(),GETDATE())
--update scd2 set od = getdate() where empid=101 and ed is null
select * from scd2
--scd3 
create table scd3(
      empid int primary key,
	  name varchar(10),
	  designation varchar(10),
	  pd varchar
)
alter table scd3
alter column pd varchar(10)
insert into scd3 values(101,'abhinav','manager','sde3')
select * from scd3
