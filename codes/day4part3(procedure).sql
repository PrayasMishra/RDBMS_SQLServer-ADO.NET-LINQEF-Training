-----------Procedure----------------
--Stored Procedure

Select * from Customers

Select * from Products

Select * from [Order Details]

--Creating View

Create view vw_GetProductByUnitPrice
as
Select ProductId, ProductName, UnitPrice from Products

Create Procedure usp_GetProductByUnitPrice
as
Select ProductId, ProductName, UnitPrice from Products
--Execute View

select * from vw_GetProductByUnitPrice Where UnitPrice>50

--Executing Procedure

EXEC usp_GetProductByUnitPrice

---Altering Procedure with parameter

Alter Procedure usp_GetProductByUnitPrice(@UnitPrice money) 
as
Select ProductId, ProductName, UnitPrice from Products where UnitPrice>@UnitPrice


--executing procedure with parameter
EXEC usp_GetProductByUnitPrice 80



/*Create Proc usp_InsertINTOProducts(@ProductId int, @ProductName nvarchar(40), @UntiPrice money)

as

if(exists(Select * from Products Where ProductID=@ProductId))

Begin

Print 'Product Id already exists'

end

else

begin

Insert Products(ProductID, ProductName, UnitPrice) values (@ProductId, @ProductName, @UntiPrice)

end*/

Alter Proc usp_InsertINTOProducts(@ProductName nvarchar(40), @UntiPrice money)

as

Insert Products(ProductName, UnitPrice) values (@ProductName, @UntiPrice)

Exec usp_InsertINTOProducts 'Wireless Mouse', 1450.50
