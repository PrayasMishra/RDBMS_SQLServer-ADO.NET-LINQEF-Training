
--1--
select * from Employee

--2--
select * from InternalCandidate

--3--
select * from JobFair

select cJobFairCode as 'Job Code',vLocation as 'Location',vJobFairCompany as 'company name',mFee as 'Fees',dFairDate as 'Fair Date'
from JobFair

--4--(a)
select(vFirstName)+' living in '+ vAddress +','+cCity+' and working as '+cDesignation 
from Employee

--(b)--
select * from Position

select  'Total vacancy : '+convert(varchar(5),(iBudgetedStrength-iCurrentStrength)) +' for the position :' + cPositionCode 
from position

--5--
select * from ContractRecruiter

select cContractRecruiterCode,cName,cPhone +' Total paid is $ '+convert(varchar(100),mTotalPaid) 
from ContractRecruiter

--6--
select * from ExternalCandidate

select cCandidateCode,(vFirstName+' '+vLastName) as 'Full Name' ,(vAddress+' '+cCity+' '+cState) as 'Candidate address' 
from ExternalCandidate

--7--
select cEmployeeCode,(vFirstName +' '+vLastName) as 'Full Name' 
from Employee 
where cState IN('Kansas', 'California', 'Georgia', 'Ohio') 

--8--
select (vFirstName+' '+vLastName) as 'Full Name',dBirthDate 
from ExternalCandidate 
where dBirthDate > '1971-01-01'

--9--
select * from AnnualSalary
select cEmployeeCode as 'ID',mAnnualSalary as 'CTC',siYear as 'Year' 
from AnnualSalary 
where mAnnualSalary>30000

--10--
select (vFirstName+' '+vLastName) as 'Full Name',siTestScore,cRating  
from ExternalCandidate 
where (siTestScore Between 70 and 80 and cRating between 7 and 9)

--11--
select * from MonthlySalary

select mMonthlySalary
from MonthlySalary 
order by mMonthlySalary

--12--
select  (vFirstName+' '+vLastName) as 'Full Name' 
from Employee 
order by vFirstName,vLastName

select (vFirstName+' '+vLastName) as 'Full Name' 
from ExternalCandidate 
order by vFirstName,vLastName

--13--
select (vFirstName+' '+vLastName) as 'Full Name',cPhone 
from Employee 
where cPhone like '(702)%'

--14--
select cCandidateCode,(vFirstName+' '+vLastName) as 'Full Name',cCity,cCampusRecruitmentCode  
from ExternalCandidate 
where cCampusRecruitmentCode is null

--15--
select * from ExternalCandidate 
where cEmployeeReferralNo is not null

--16--
select cEmployeeCode,(vFirstName+' '+vLastName) as 'Full Name',cDesignation,cEmailId 
from Employee
where cEmailId
like '%@gmail.com'

--17---
select (vFirstName+' '+vLastName) as 'Full Name',cState 
from ExternalCandidate 
where cState like 'G%'

--18--
select (vFirstName+' '+vLastName) as 'Full Name',cState 
from ExternalCandidate 
group by cState,vFirstName,vLastName

--19--
select Top 3 sum(mAnnualSalary) as 'Total Salary',siYear 
from AnnualSalary 
group by siYear
order by siYear DESC
