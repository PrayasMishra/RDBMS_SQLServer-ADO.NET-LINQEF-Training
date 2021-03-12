-----------Trigger---------------------------------------------------------

Select * from Position

Select * from Employee

Select * into EmployeeBackup from Employee

Select * from EmployeeBackup Where cCity='Norton'

Delete from EmployeeBackup Where cCity='Norton'



--Magic Tables

--inserted - Insert

--deleted - Delete



alter trigger trg_EmployeeBackupDelete ON EmployeeBackup

for Delete

as

Declare @city varchar(100)

Select @city=cCity from deleted

if(@city='Las Vegas' OR @city='Norton')

begin

Raiserror('Cities Las Vegas Or Norton cannot be deleted',11,1)

rollback tran

end



--Check with delete statement

Delete from EmployeeBackup Where cCity='Norton'



--Creating trigger for Insert into employee

alter Trigger trg_InsertEmpUpdatePosition ON Employee

after insert

as

Declare @PCode char(4)

Select @PCode=cCurrentPosition from inserted

if(@PCode is not null)

begin

set nocount on

Update Position SET iCurrentStrength+=1 where cPositionCode=@PCode

end

else

begin

raiserror('Please enter position code',11,1)

rollback tran

end



--Check the trigger

Insert Employee(cEmployeeCode, vFirstName, cSocialSecurityNo) values ('E0004','Jagan','789-7886')

Select * from Employee

Select * from Position


---------------------------------------------------------------------------

alter view vw_EmployeeExternal

as

Select cEmployeeCode, a.vFirstName, a.cCity as EmployeeCity, b.cCity as CandidateCity, b.cCandidateCode from Employee a Join ExternalCandidate b

on a.cCandidateCode=b.cCandidateCode

Select * from vw_EmployeeExternal

Update vw_EmployeeExternal SET EmployeeCity='Bengaluru', CandidateCity='Bengaluru' where cCandidateCode='000005'

alter trigger trg_UpdateCity ON vw_EmployeeExternal

Instead of Update

as

Declare @EmployeeCity varchar(50), @CcandidateCity varchar(50), @ECode varchar(10)

Select @EmployeeCity=EmployeeCity, @CcandidateCity=CandidateCity, @ECode=cCandidateCode from inserted

if(@ECode is not null)

begin

Update Employee SET cCity=@EmployeeCity Where cCandidateCode=@ECode

update ExternalCandidate SET cCity=@CcandidateCity where cCandidateCode=@ECode

end





