--Fetch all the column and rows

Select * from Employee

--Fetch only selected columns

Select cEmployeeCode, vFirstName, cCity from Employee

--Heading for cols =, as

Select 'Emp Code'=cEmployeeCode, 'First Name'= vFirstName from Employee

Select cEmployeeCode as 'Emp Code', vLastName as LastName, cCity as City from Employee

--Arthimetic Operation with columns

Select (vFirstName+' '+vLastName) as 'Full Name' from Employee

Select * from Position

Select cPositionCode as PCode, vDescription as [Description], (iBudgetedStrength-iCurrentStrength) as 'Difference' from Position

Select vDescription+' having '+convert(varchar(5),(iBudgetedStrength-iCurrentStrength))+' Vacancies' from Position

--Batch

--User Defined variable

Declare @Name varchar(100)

Declare @Age int

SET @Name='Bathri'

Set @Age=15

Print 'Hi,' +@Name +' your age is '+ convert(varchar(10),@Age)

--Distinct -unique value

select * from Employee

Select distinct cState from Employee

---TOP

Select Top 3 * from Employee

Select Top 3 cEmployeeCode, vFirstName from Employee

--Order By - Sort

Select * from MonthlySalary

Select * from MonthlySalary Order By mMonthlySalary -- Default ascending order

Select * from MonthlySalary Order By mMonthlySalary ASC

Select * from MonthlySalary Order By mMonthlySalary DESC

Select Top 3* from MonthlySalary Order By mMonthlySalary DESC

Select vFirstName, siTestScore from ExternalCandidate

--To get top 3 scores

Select Top 3 vFirstName, vLastName, siTestScore from ExternalCandidate Order By siTestScore DESC

--

--New Codes

--Where

Select * from MonthlySalary Where mMonthlySalary>2000

Select * from MonthlySalary Where mMonthlySalary>2000 and dPayDate>'2001-01-01'

Select cEmployeeCode, vFirstName, cCity from Employee Where cCity IN('Dublin','Norton','Columbus')

Select cEmployeeCode, vFirstName, cCity from Employee Where cCity NOT IN('Dublin','Norton','Columbus')

Select vFirstName, vLastName, siTestScore from ExternalCandidate Where siTestScore Between 50 and 60

Select vFirstName, vLastName, siTestScore from ExternalCandidate Where siTestScore NOT Between 50 and 60

Select * from ExternalCandidate

Select vFirstName, cCity, vEmailId from ExternalCandidate Where vEmailId is not null

Select vFirstName, cCity, vEmailId from ExternalCandidate Where vEmailId is null

--LIKE - Match Pattern (% - zero or more character or digit, _ - one single character or digit, []-range and it is one character or digit)

Select vFirstName from ExternalCandidate Where vFirstName LIKE '%a'

Select vFirstName from ExternalCandidate Where vFirstName LIKE '%a%'

Select vFirstName from ExternalCandidate Where vFirstName like '[a-d]%'

Select cEmployeeCode from MonthlySalary Where cEmployeeCode LIKE '00001_'

--Aggergate Function - SUM, AVG, Count, Min and MAX

Select count(*) as 'No of Records' from Employee --Count all the rows including NULL

Select count(vFirstName) from ExternalCandidate

Select count(vEmailId) as 'Available EmailID' from ExternalCandidate --Count all the rows excluding NULL

Select SUM(mMonthlySalary), dPayDate from MonthlySalary --Error

Select SUM(mMonthlySalary), count(dPayDate) from MonthlySalary

--Group By

Select count(vFirstName) as 'No of People Living', cState, cCity from ExternalCandidate Group by cState, cCity

order by count(vFirstName) ASC

Select Count(mMonthlySalary) as 'No of Salaries', SUM(mMonthlySalary) as 'Total Salary', dPayDate from MonthlySalary group by dPayDate



---Post Lunch



--Group By



Select Count(mMonthlySalary) as 'No of Salaries', SUM(mMonthlySalary) as 'Total Salary', dPayDate from MonthlySalary group by dPayDate

having count(mMonthlySalary) >=5 and Sum(mMonthlySalary)>25000



Select * from AnnualSalary

Select STR(12345.456,8,1)

Select SUBSTRING('Hello',1,4)

Select (SUBSTRING(vFirstName,1,1)+' '+vLastName) as [Name] from Employee

Select LEN(vFirstName) as Length from Employee

Select UPPER(vFirstName) as FirstName, cCity from Employee

--Date Functions

Select GETDATE(), GETUTCDATE()

Select MONTH(getdate())

Select Year(getdate())

Select DAY(getdate())

Select cEmployeeCode, vFirstName, dBirthDate from Employee Where YEAR(dBirthDate)=1971

Select DATENAME(MM,getdate())

Select DATENAME(MM, dPayDate) from MonthlySalary

Select DATEDIFF(YYYY,dBirthDate,getdate()) as Age from Employee

Select DATEADD(DD,2,getdate()) as Estimated_Date

Select DATEPART(MM,getdate())

Select vFirstName, DATEPART(YYYY,dBirthDate) from Employee

Select ABS(-1000.33)

Select ROUND(12345.567,1)

Select RAND()

Select Convert(varchar,dBirthDate,111) from Employee

Select vFirstName, vLastName, cCity, cState from Employee

union all

Select vFirstName, vLastName, cCity, cState from ExternalCandidate

Select vFirstName, vLastName, cCity, cState from Employee

union

Select vFirstName, vLastName, cCity, cState from ExternalCandidate

Select vFirstName, vLastName, cCity, cState from Employee

intersect

Select vFirstName, vLastName, cCity, cState from ExternalCandidate

Select vFirstName, vLastName, cCity, cState from Employee

except

Select vFirstName, vLastName, cCity, cState from ExternalCandidate

Select vFirstName, vLastName, cCity, cState from ExternalCandidate Where vFirstName='Betty'





------------Joins

--Joins

--Inner Join or EQUI Join

sp_help Employee

Select * from Employee

Select * from Department

Select * from Country

update Employee SET cDepartmentCode=null where cEmployeeCode='000005'

Select cEmployeeCode, vFirstName, vLastName, Department.cDepartmentCode, vDepartmentName from Employee inner join Department

ON Employee.cDepartmentCode=Department.cDepartmentCode order by 1

Select cEmployeeCode, vFirstName, vLastName, d.cDepartmentCode, vDepartmentName from Employee e inner join Department d

ON e.cDepartmentCode=d.cDepartmentCode join Country c ON e.cCountryCode=c.cCountryCode order by d.cDepartmentCode

Select cEmployeeCode, vFirstName, vLastName, c.cCountry from Employee e inner join Department d

ON e.cDepartmentCode=d.cDepartmentCode join Country c ON e.cCountryCode=c.cCountryCode order by d.cDepartmentCode

Select cEmployeeCode, vFirstName, vDepartmentName, cCountry from Employee e, Department d, Country c

Where e.cDepartmentCode=d.cDepartmentCode and e.cCountryCode=c.cCountryCode order by d.cDepartmentCode

--OUTER (LEFT OUTER)

Select a.cDepartmentCode,a.vDepartmentName,b.vFirstName from Department a LEFT OUTER JOIN Employee b ON a.cDepartmentCode=b.cDepartmentCode

--OUTER (RIGHT OUTER)

Select a.cDepartmentCode,a.vDepartmentName,b.vFirstName, vLastName from Department a RIGHT OUTER JOIN Employee b ON a.cDepartmentCode=b.cDepartmentCode

--FULL OUTER

Select a.cDepartmentCode,a.vDepartmentName,b.vFirstName, vLastName from Department a FULL OUTER JOIN Employee b ON a.cDepartmentCode=b.cDepartmentCode

--CROSS JOIN

Select * from Employee CROSS JOIN Department

--SELF JOIN

Create Table Employees(EmployeeId int primary key, EmpName varchar(50), ManagerId int references Employees(EmployeeId))

sp_Help Employees

Insert Employees(EmployeeId, EmpName, ManagerId) values

(101, 'Praveen',null),

(102,'Lokesh',101),

(103,'Jagan',101),

(104,'Pradeep',103),

(105,'Jameel',102),

(106,'Jaffar',104),

(107,'Suman',105),

(108,'Naveen',105),

(109,'Senthil',108),

(110,'Prakash',108)

Select * from Employees

Select a.EmployeeId, a.EmpName as Employee, b.EmployeeId, b.EmpName as Manager from Employees a join Employees b On a.ManagerId=b.EmployeeId
