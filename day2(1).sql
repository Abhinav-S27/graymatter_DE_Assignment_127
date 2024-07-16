--productions.ProductInventory
--salesorderdetail,salesorderheader

select * from Production.ProductInventory
select * from Sales.SalesOrderDetail
select * from Sales.SalesOrderHeader

create table #t1(
  pid int,
  qty int
)

create procedure inventory
    @startdate date,
	@enddate date
	as
	begin

	with cfe as (
	select Sales.SalesOrderHeader.SalesOrderID,Sales.SalesOrderHeader.OrderDate, Sales.SalesOrderDetail.OrderQty,Sales.SalesOrderDetail.ProductID
	from Sales.SalesOrderDetail
	inner join Sales.SalesOrderHeader
	on Sales.SalesOrderHeader.SalesOrderID=Sales.SalesOrderDetail.SalesOrderID )
	select ProductID,SUM(OrderQty) as totalqty from cfe   group by ProductID

	update Production.ProductInventory
  

