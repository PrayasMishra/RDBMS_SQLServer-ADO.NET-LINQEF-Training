use Northwind

select City,(FirstName+' '+LastName) as 'Full name' from Employees 
where EmployeeID =(
select EmployeeID from Customers
where City='Seattle' 
)

-- =
select * from Customers
where City = (select City from Employees where EmployeeID = 1)

-- IN
select CompanyName,ContactName,Country,City,[Address],Phone from Customers
where City in (select City from Customers where Country = 'France')

--EXISTS
select CompanyName,ContactName,Country,City,[Address],Phone from Customers
where City in (select City from Customers where Country = 'Spain')


--INDEX

CREATE TABLE MyTable2(Id int, FullName varchar(100), City varchar(100))

Create Clustered Index idx_MyTable2_Id ON MyTable2(Id)

Insert MyTable2(Id, FullName, City) values (1,'As','sdf'),(1,'sdf','wer')

Select * from MyTable2

Truncate table MyTable2

Drop Index idx_MyTable2_Id on MyTable2

Create unique Clustered Index idx_MyTable2_Id ON MyTable2(Id)

Create Index idx_MyTable2_City ON MyTable2(City)

sp_helpindex MyTable2

sp_helpindex Products

sp_spaceused Products

sp_help Products

--Composite Clustered Index

Create Index idx_Products_UnitPrice_UnitsInStock ON Products(UnitPrice, UnitsInStock)



--lab work--
--1.5(10)// here database has no non issued books so insert few books that aren't issued.
use Training
go
SELECT book.Book_name,book.Author,book.Book_code,book.book_category
FROM Book_Master book
WHERE NOT EXISTS(SELECT Book_code
				 FROM Book_Transaction bt
				 WHERE book.Book_code=bt.Book_code
				)
-----------------OR---------------------------------------------------
use Training
go
select Book_name,Author,Book_code,book_category
from Book_Master
where Book_code not in(select Book_code from Book_Transaction)

