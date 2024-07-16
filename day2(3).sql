--start a transaction

select * from Production.ProductInventory

begin transaction
declare @pid int =1
declare @shelf varchar ='C'
declare @fw int =6
declare @tw int =
declare @qt int =10

update Production.ProductInventory
Set Quantity=Quantity-@qt
where ProductID=@pid and LocationID=@lid

insert into Production.ProductInventory (ProductID,LocationID,Shelf,Quantity,Bin) VALUES(@pid,@lid,@shelf,@qt,5)
commit transaction
print 'inventory transfer completed successfully'