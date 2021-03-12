--local temporary procedure but cannot be used on multiple sessions
create proc #temp1
as select * from Customers

exec #temp1

--global temporary procedure but can be used on multiple sessions
create proc ##globalProc
as select * from Customers

exec ##globalProc

create proc usp_GetCustomerByCountry (@Country varchar(50))
as
select CustomerID, ContactName,ContactTitle,City,Country from Customers 
where Country=@Country

exec usp_GetCustomerByCountry 'Spain'

--altering proc---
alter proc usp_GetCustomerByCountry (@Country varchar(50))
with encryption,recompile
as
set nocount on
select CustomerID, ContactName,City,Country from Customers 
where Country=@Country

exec usp_GetCustomerByCountry 'Spain'
with result sets((Id char(10), Name varchar(50), City varchar(50), CountryName varchar(50)))

---output param---
select * from [Order Details]

create proc usp_ReturnSumOfUnitPriceAndQuantityByProductId(@ProductId int,@UnitPrice money out,@Quantity int out)
as
begin
	select @UnitPrice=SUM(UnitPrice), @Quantity=SUM(Quantity) from [Order Details] group by ProductID 
end

select SUM(UnitPrice)as 'sum UnitPrice', SUM(Quantity)as 'sum Quantity' from [Order Details] group by ProductID

--executing usp_ReturnSumOfUnitPriceAndQuantityByProductId using batches
declare @Price money,@Qty int,@ProductId int
set @ProductId = 51
exec usp_ReturnSumOfUnitPriceAndQuantityByProductId @ProductId, @Price out,@Qty out
print 'Total price is '+CAST(@Price as varchar)
print 'Total quantity is '+CAST(@Qty as varchar)
--------------------or----------------------------
select @Price as Price, @Qty as Quantity

--Create Proc for OUT Parameter
Create Proc usp_GetSumOfPriceByProductId(@ProductId int)
as
Declare @Price money, @Qty int
EXEC usp_ReturnSumofUnitPriceAndQuantityByProductId @ProductId, @Price out, @Qty out
Select @Price as Price, @Qty as Quantity

exec usp_GetSumOfPriceByProductId 55
--------class work--------
--1
create proc usp_InsertValues( @std_code int ,@std_name varchar(10) ,@dept_code int, @dob datetime,@Address varchar(50) ) 
as
insert Student_master values(@std_code,@std_name,@dept_code,@dob,@Address)

exec usp_insertvalues @std_code=1022 ,@std_name='prayas',@dept_code =20,@dob='1999-02-23',@Address='delhi'

--2
create proc usp_GetStudentInfo(@stud_id int)
as
select Stud_Code, Stud_Name,[Address] from Student_master
where Stud_Code = @stud_id

exec usp_GetStudentInfo 1006

-- With Return

alter Proc usp_GetCustomerByCountry(@Country varchar(50))

with encryption, recompile

as

set nocount on

if(@Country is null OR @Country='')

return 1

Select CustomerId, ContactName, City, Country from Customers Where Country=@Country

Declare @Ctry varchar(50), @Result int

SET @Ctry = null

EXEC @Result= usp_GetCustomerByCountry ''

if(@Result=1)

Print 'Country cannot be null'

----

alter Proc usp_GetSumOfPriceByProductId(@ProductId int)

as

Declare @Price money, @Qty int

if(@ProductId<=0)

 return 1

else

begin

 EXEC usp_ReturnSumofUnitPriceAndQuantityByProductId @ProductId, @Price out, @Qty out

Select @Price as Price, @Qty as Quantity

end

Declare @Res int

exec @Res=usp_GetSumOfPriceByProductId -4

if(@Res=1)

Print 'Product Id cannot be zero'

----

alter Proc usp_GetProduct(@ProductId int, @UnitPrice money, @UnitsInStock int)

as

if(@ProductId<=0)

--return 1

Raiserror('Product Id cannot be less than zero',16,1)

if(@UnitPrice<=0)

--return 2

Raiserror('Unit Price cannot be less than zero',16,2)

if(@UnitsInStock<=0)

--return 3

Raiserror('Unit In Stock cannot be less than zero',11,3)

Select * from Products Where ProductID=@ProductId and UnitPrice= @UnitPrice and UnitsInStock=@UnitsInStock

--Procedure with Return should call the below code

Declare @Result int

EXEC @Result=usp_GetProduct 10, 31.00, -2

if(@Result=1)

Print 'Product Id cannot be less than zero'

if(@Result=2)

Print 'Unit Price cannot be zero'

if(@Result=3)

Print 'Quantity cannot be zero'

--Executing Procedure with Raiserror

usp_GetProduct 10, 31.00, -2

exec usp_InsertINTOProducts(1, 'sdfsd',45)

Insert Products(ProductID, ProductName, UnitPrice) values (1,'sdf',34)

Select @@ERROR

Select * from sys.messages Where message_id=544

sp_helptext usp_GetProduct

--Try Catch

--Implementing using batches

Begin try

Insert Products(ProductID, ProductName, UnitPrice) values (1,'sdf',34)

end try

begin catch

Select ERROR_NUMBER(), ERROR_LINE(), ERROR_MESSAGE()

end catch

--------------------------------------------------
					--AFTER LUNCH--
--------------------------------------------------
--PDF-7 Pg-34 Examples
--------------------------------------------------
 CREATE TABLE Category
(
CategoryID INT PRIMARY KEY,
CategoryName VARCHAR(20)
)

CREATE TABLE Product
(
ProductID INT PRIMARY KEY,
ProductName VARCHAR(30),
UnitPrice MONEY,
Quantity INT,
CategoryID INT
FOREIGN KEY REFERENCES Category(CategoryID)
)


--Ex. 1 : Insert record in Category table using Stored Procedure

CREATE PROC usp_InsertCategory
(
@CatID INT,
@CatName VARCHAR(20)
)
AS
BEGIN
	IF(@CatID IS NULL OR @CatID < 0)
	BEGIN
		RAISERROR('Category ID cannot be null or negative', 1, 1)
	END
	
	ELSE
	BEGIN
		IF EXISTS (SELECT CategoryID FROM Category WHERE CategoryID = @CatID)
		BEGIN
			RAISERROR('Category ID already exists', 1, 1)
		END
		ELSE
		BEGIN
			INSERT INTO Category(CategoryID, CategoryName) VALUES (@CatID, @CatName)
		END
	END
END

EXEC usp_InsertCategory 1, 'Bikes'

EXEC usp_InsertCategory @CatName = 'Electronics', @CatID = 2

select * from Category

--Ex. 2 : Insert record in Product table using Stored Procedure

CREATE PROC usp_InsertProduct
(
@ProdID INT,
@ProdName VARCHAR(20),
@Price MONEY,
@Qty INT,
@CatID INT
)
AS
BEGIN
	IF(@ProdID IS NULL OR @ProdID < 0)
	BEGIN
		RAISERROR(‘Product ID cannot be null or negative’, 1, 1)
	END
	ELSE
	BEGIN
		IF EXISTS (SELECT ProductName FROM Product WHERE ProductID = @ProdID)
		BEGIN
			RAISERROR(‘Product ID already exists’, 1, 1)
		END
		ELSE
		BEGIN
			IF EXISTS (SELECT CategoryName FROM Category WHERE CategoryID = @CatID OR @CatID IS NULL)
			BEGIN
				IF (@Price <= 0 OR @Qty <=0)
				BEGIN
					RAISERROR(‘Unit Price or Quantity cannot be negative or zero’, 1, 1)
				END
				ELSE
				BEGIN
					INSERT INTO Product(ProductID, ProductName, UnitPrice, Quantity, CategoryID)VALUES
(@ProdID, @ProdName, @Price, @Qty, 
@CatID)
END
END
ELSE
BEGIN
RAISERROR(‘Category ID does not exists’, 1, 1)
END
END
END
END


--Ex3
---------------------------------------------------------------------------

