create table dbo.audittable1(
  logid int identity(1,1) primary key,
  insertdate datetime,
  insertby nvarchar(100),
  updatedate datetime,
  updateby nvarchar(100),
  deletedate datetime,
  deleteby nvarchar(100)
)

create trigger pai 
on Person.ContactType
after insert
as
begin
   insert into dbo.audittable1(insertdate,insertby) values (GETDATE(),SUSER_SNAME());
end;
go

create trigger pau
on Person.ContactType
after update
as
begin
   insert into dbo.audittable1(updatedate,updateby) values (GETDATE(),SUSER_SNAME());
end;
go

create trigger pad
on Person.ContactType
after delete
as
begin
   insert into dbo.audittable1(deletedate,deleteby) values (GETDATE(),SUSER_SNAME());
end;
go
select * from Sales.SalesPerson
update Sales.SalesPerson
set SalesLastYear=100
where BusinessEntityID=274

select * from dbo.audittable1



select * from Person.ContactType



delete from sys.triggers where name='au1'

insert into Person.ContactType(Name,ModifiedDate) values ('intern',GETDATE())
delete from Person.ContactType where Name='intern'

create table dbo.ioi(
   name varchar(100)
)

create trigger pioi
on Person.ContactType
instead of insert
as 
begin 
   insert into dbo.ioi (name)
   select 
      i.Name
   from
      inserted i;
end;
go
insert into Person.ContactType(Name,ModifiedDate) values ('intern2',GETDATE())
select * from dbo.ioi