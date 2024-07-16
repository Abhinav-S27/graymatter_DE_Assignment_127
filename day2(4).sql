--create a scalar function
create function calculatetotalprice (@unitprice decimal(10,2),@quantity int)
returns decimal(10,2)
as
begin 
   declare @totalprice decimal(10,2)
   set @totalprice=@unitprice*@quantity
   return @totalprice
end;

select * from Production.Product

--using scaler function
select ProductID,ListPrice,Size,dbo.calculatetotalprice(ListPrice,10) as totalprice
from Production.Product


select * from Person.Address
--create table fucntion
create function getcustomercity(@city nvarchar(100))
returns table
as
return (
     select AddressID,rowguid,City
	 From Person.Address
	 where City=@city
)

select * from dbo.getcustomercity('Bothell')