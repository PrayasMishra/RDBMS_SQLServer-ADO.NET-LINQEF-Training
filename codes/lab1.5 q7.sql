/*
Display Staff Code, Staff Name, and Department Name for those who have taken 
more than one book
*/
use Training


Select Stud_Name, Subject1 from Student_master a join Student_Marks b on a.Stud_Code = b.Stud_Code

where b.Subject1 >=ALL(select Subject1 from Student_Marks) order by Subject1 desc

Select Top 1 Stud_Name, Subject1 from Student_master a join Student_Marks b On a.Stud_Code=b.Stud_Code

group by Stud_Name, Subject1

order by max(subject1) desc

--Raghu

select b.Stud_Name, Subject1 from Student_Marks a,Student_master b

where a.Stud_Code=b.Stud_Code and Subject1

=(select max(Subject1) from Student_Marks)

--Supreetha

SELECT sm.Stud_Code,sm.Stud_Name,marks.Subject1

FROM Student_master sm

INNER JOIN Student_Marks marks

ON sm.Stud_Code=marks.Stud_Code

WHERE marks.Subject1=(SELECT MAX(Subject1) FROM Student_Marks)

--Suraj

Select Stud_Name,Stud_Code

From Student_master

Where Stud_Code In(Select Stud_Code

          From Student_Marks

          Where Subject1>=(Select Max(Subject1)

                   From Student_Marks))







