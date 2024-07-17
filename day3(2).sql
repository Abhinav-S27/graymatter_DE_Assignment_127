--enable cdc on the databse
exec sys.sp_cdc_enable_db

exec sys.sp_cdc_enable_table
       @source_schema = N'dbo',
	   @source_name=N'insertlog',
	   @role_name=NULL

select * from cdc.dbo_insertlog_CT

select * from dbo.InsertLog

insert into dbo.InsertLog values(GETDATE(),'a')
insert into dbo.InsertLog values(GETDATE(),'b')
insert into dbo.InsertLog values(GETDATE(),'c')

delete from dbo.InsertLog where insertby='a'

--lsn-log sequence number, 

select * from Sales.SalesOrderHeader
select CAST(OrderDate as date) from Sales.SalesOrderHeader

select * from Person.EmailAddress




SELECT 
SUBSTRING (EmailAddress, CHARINDEX( '@', EmailAddress) + 1,
LEN(EmailAddress)) AS Domain
FROM Person.EmailAddress where BusinessEntityID=1305;


create function doaminname(@bid int)
returns varchar
as 
begin 
    declare @v varchar;
    @v = SELECT BusinessEntityID,
         SUBSTRING (EmailAddress, CHARINDEX( '@', EmailAddress) + 1,
         LEN(EmailAddress)) AS Domain
FROM Person.EmailAddress where BusinessEntityID=1305;



select * from scd0

create table #tempsource(empid int primary key, name varchar,jd date)
alter table #tempsource
alter column name varchar(10)

insert into scd0 values (2,'b',GETDATE())
insert into scd0 values (3,'c',GETDATE())
insert into scd0 values (4,'d',GETDATE())

insert into #tempsource values(2,'e',GETDATE())
insert into #tempsource values(5,'j',GETDATE())
insert into #tempsource values(6,'l',GETDATE())

MERGE scd0 AS Target
USING #tempsource	AS Source
ON Source.empid = Target.empid
when matched and source.name <> target.name 
then update set name=source.name
WHEN NOT MATCHED BY Target THEN
    INSERT (empid,name, jd) 
    VALUES (Source.empid,Source.name, Source.jd);
select * from #tempsource

--soft delete 
update Sales.Customer
set ed=getdate(),iscurrent=0,isdeleted=1
where cid in(iscurrent =1) and cid not in()

update sales.Customer
set ed=getdat(),iscurrent=0,isdeleted=1
where cid in(iscurrent=1) and cid in (isdeleted=1)