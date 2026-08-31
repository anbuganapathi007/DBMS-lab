SQL> Create table Student0(StudentID int PRIMARY KEY, Name varchar(30), Age int);

Table created.

SQL> Create table Courses0 (CourseID int PRIMARY KEY, CourseName varchar(20));

Table created.

SQL> Create table Enrollments0 (StudentID int REFERENCES Student(StudentID), CourseID int REFERENCES Courses(CourseID));

Table created.

SQL> Insert into Student0 values(1,'Alice', 20);

1 row created.

SQL> Insert into Student0 values(2,'Bob', 22);

1 row created.

SQL> Insert into Student0 values(3,'Charlie', 21);

1 row created.

SQL> Insert into Student0 values(4,'David', 19);

1 row created.

SQL> Insert into Courses0 values (101, 'Database Management');

1 row created.

SQL> Insert into Courses0 values (102, 'Algorithms');

1 row created.

SQL> Insert into Courses0 values (103, 'Web Development');

1 row created.

SQL> Insert into Enrollments0 values(1,101);

1 row created.

SQL> Insert into Enrollments0 values(1,102);

1 row created.

SQL> Insert into Enrollments0 values(2,102);

1 row created.

SQL> Insert into Enrollments0 values(3,101);

1 row created.

SQL> Insert into Enrollments0 values(3,103);

1 row created.

SQL> Insert into Enrollments0 values(4,103);

1 row created.

SQL> SELECT * FROM Student;

 STUDENTID NAME                                  AGE
---------- ------------------------------ ----------
         1 Alice                                  20
         2 Bob                                    20
         3 Charlie                                21
         4 David                                  19

SQL> SELECT Name, Age FROM Student WHERE Age > 20;

NAME                                  AGE
------------------------------ ----------
Charlie                                21

SQL> SELECT Name FROM Student0 WHERE StudentID IN (SELECT StudentID FROM Enrollments0 WHERE CourseID = (SELECT CourseID FROM Courses0 WHERE CourseName = 'Database Management'));

NAME
------------------------------
Alice
Charlie


SQL> SELECT CourseID, CourseName FROM Courses0 WHERE CourseID IN ( SELECT CourseID FROM Enrollments0 GROUP BY CourseID HAVING COUNT(*) > 1 );

  COURSEID COURSENAME
---------- --------------------
       101 Database Management
       102 Algorithms
       103 Web Development

SQL> SELECT AVG(Age) AS AverageAge FROM Student;

AVERAGEAGE
----------
        20

SQL> SELECT Name, Age FROM Student WHERE Age > (SELECT AVG(Age) FROM Student);

NAME                                  AGE
------------------------------ ----------
Charlie                                21
