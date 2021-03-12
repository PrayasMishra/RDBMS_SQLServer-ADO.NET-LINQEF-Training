--------Transaction

Begin Transaction t1

--1

--2

Save Transaction t1

--3

Commit Transaction t1

Rollback Transaction t1

------------------

SET Implicit_Transactions OFF

------------------

Select * from Position

Select * from Employee

-----------------

begin try

begin tran s1

Update Position SET siYear=2022 Where cPositionCode='0006'

Insert Employee(cEmployeeCode, vFirstName, cSocialSecurityNo) values ('E0005','Test','789-78948')

commit tran s1

end try

begin catch

rollback tran s1

end catch

------------------

Update Position SET siYear=2007 Where cPositionCode='0001'

--------------

Select * from Position