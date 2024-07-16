--1.
 create procedure calculateandupdatecustomersales2
 as
 begin
select * from Sales.Customer
select * from Sales.SalesOrderHeader
  create table #t(
   sid int,
   od date,
   td int
   )
select CustomerID,count(*)
from Sales.SalesOrderHeader
Group by  CustomerID 

select CustomerID,SUM(TotalDue)
   from Sales.SalesOrderHeader
   where CustomerID=11000
   group by CustomerID

select * from Sales.SalesOrderHeader
end

create procedure calculateandupdatecustomersales3
   @cid int,@sid int,@ntd money
   as
   begin
declare @totalsales int
with totalsalesamount as (
   select CustomerID,SalesOrderID,SUM(TotalDue) as totalamnt
   from Sales.SalesOrderHeader
   where CustomerID=11000
   group by CustomerID);
   select @totalsales=totalamnt from totalsalesamount
   print @totalsales

 declare @salesorderid int=43659
insert into #t 
 select SalesOrderID,OrderDate,TotalDue
 from Sales.SalesOrderHeader
 where SalesOrderID=@salesorderid


 create table dbo.SalesOrderChangeLog(
     cid int identity(1,1) primary key,
	 sid int,
	 otd money,
	 ntd money,
	 changedate datetime
 )


 create trigger us
 on Sales.SalesOrderHeader
 after update
 as
 begin
    declare @sid int,@ot money,@nt money

	select 
	      @sid=i.SalesOrderID,
		  @ot=d.TaxAmt,
		  @nt=i.Taxamt
	From
	   inserted i
	   inner join deleted d on i.SalesOrderID=d.SalesOrderID
  
    insert into dbo.SalesOrderChangeLog(sid,otd,ntd,changedate) values (@sid,@ot,@nt,GETDATE()) 
end

update Sales.SalesOrderHeader
set TaxAmt=100
where SalesOrderID=43659

select * from dbo.SalesOrderChangeLog
	--select * into table from othertable,commit transaction

exec calculateandupdatecustomersales2