--6
Select Staff_Name as 'Staff Name', Hiredate as 'Hire Date', DAY(Hiredate) as 'Day Number'from Staff_Master


--8
select * from Student_Marks
select * from Student_Master
Select Stud_Code as 'Student Code' from Student_Marks where Subject1=89
intersect 
Select Stud_Code as 'Student Code' from Student_master

--11
select * from Student_Master
select * from Staff_Master
Select Stud_Code as 'Student Code' ,Stud_Name as ' Student Name '  from Student_Master where Dept_Code=20
union
Select Staff_Code as 'Staff Code' ,Staff_Name as ' Staff Name '  from Staff_Master where Dept_Code=20

--12
select * from Student_Marks
select Stud_Code as 'Student Code' from Student_Marks where Subject1=NULL or Subject2=NULL or Subject3=NULL

--13
select * from Book_Transaction
select Stud_Code as 'Student Code' from Book_Transaction where Issue_date=Null
