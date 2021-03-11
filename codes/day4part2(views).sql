------ Views

Select * from Customers

Select CustomerId, CompanyName, ContactName, City from Customers

sp_helpindex Customers

sp_help Customers

sp_spaceused Customers

Create view vw_Customers
as
Select CustomerId, CompanyName, ContactName, City from Customers

select * from vw_Customers Where City='Madrid'

Update vw_Customers SET ContactName='Kayal' where CustomerID='BOLID'

sp_helpindex vw_Customers

sp_help vw_Customers

sp_spaceused vw_Customers

Alter view vw_Customers

as

Select CustomerId, CompanyName, ContactName, City from Customers

select * from vw_Customers

Use Training
Go
Create view vw_BooksNotIssued
as
SELECT book.Book_name,book.Author,book.Book_code,book.book_category
FROM Book_Master book
WHERE NOT EXISTS(SELECT Book_code
      FROM Book_Transaction t
      WHERE book.Book_code=t.Book_code
	  )

Select * from vw_BooksNotIssued

Delete from vw_BooksNotIssued Where Book_name='Let Us C'

Create View vwStudentWithSubject

as

SELECT sm.Stud_Code,sm.Stud_Name,marks.Subject1

FROM Student_master sm

INNER JOIN Student_Marks marks

ON sm.Stud_Code=marks.Stud_Code

Select * from vwStudentWithSubject

Update vwStudentWithSubject SET Subject1=100 Where Stud_Code=1001

Update vwStudentWithSubject SET Subject1=100, Stud_Name='Senthil' Where Stud_Code=1002

Delete from vwStudentWithSubject Where Stud_Code=1001


--to see views

select * from sys.syscomments

-----Encryption and Schemabinding-------

Create View vwStudentWithSubject
with encryption, schemabinding /* hides the details from sys.syscomments */
as
SELECT sm.Stud_Code, marks.Subject1 FROM dbo.Student_master sm INNER JOIN dbo.Student_Marks marks ON sm.Stud_Code=marks.Stud_Code

Select * from Student_Marks

Alter table Student_master drop column Stud_name

alter table Student_marks drop column Subject1

select * from vwStudentWithSubject

Drop view vwStudentWithSubject