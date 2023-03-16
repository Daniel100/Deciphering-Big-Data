-- install mariadb
brew install mariadb
brew cleanup mariadb
brew services start mariadb
brew services restart mariadb
Mysql -- login mariadb


-- Creating a database
SHOW DATABASES;
CREATE DATABASE STUDENT;
USE STUDENT;

-- Table: Student + data insert
CREATE TABLE STUDENT (
    ID INT NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    BirthDay DATE NOT NULL,
    PRIMARY KEY (ID)
);

INSERT INTO STUDENT (ID, FirstName, LastName,  BirthDay)
VALUES(1001, 'Bob', 'Baker', '2001-08-25');

INSERT INTO STUDENT (ID, FirstName, LastName,  BirthDay)
VALUES(1002, 'Sally', 'Davies', '1999-10-02');

INSERT INTO STUDENT (ID, FirstName, LastName,  BirthDay)
VALUES(1003, 'Mark', 'Hanmill', '1995-06-05');

INSERT INTO STUDENT (ID, FirstName, LastName,  BirthDay)
VALUES(1004, 'Anas', 'Ali', '1980-08-03');

INSERT INTO STUDENT (ID, FirstName, LastName,  BirthDay)
VALUES(1005, 'Cheuk', 'Yin', '2002-05-01');


-- Table: Course + data insert
CREATE TABLE COURSE(
    ID INT NOT NULL,
    CourseName  VARCHAR(255) NOT NULL,
    ExamBoards  VARCHAR(255) NOT NULL,
    TeacherName VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID)
);

INSERT INTO COURSE (ID, CourseName, ExamBoards ,  TeacherName)
VALUES(1, 'Computer Science', 'BCS',  'Mr Jones');

INSERT INTO COURSE (ID, CourseName, ExamBoards ,  TeacherName)
VALUES(2, 'Mathe', 'EdExcel',  'Ms Parker');

INSERT INTO COURSE (ID, CourseName, ExamBoards ,  TeacherName)
VALUES(3, 'Physics', 'OCR',  'Mr Peters');

INSERT INTO COURSE (ID, CourseName, ExamBoards ,  TeacherName)
VALUES(4, 'Maths', 'AQA',  'Ms Parker');

INSERT INTO COURSE (ID, CourseName, ExamBoards ,  TeacherName)
VALUES(5, 'Biology', 'WJEC',  'Mrs Patel');

INSERT INTO COURSE (ID, CourseName, ExamBoards ,  TeacherName)
VALUES(6, 'Music', 'AQA',  'Ms Daniels');

-- Table: Performance + data insert
CREATE TABLE PERFORMANCE(
    ID INT NOT NULL,
    StudentId INT NOT NULL,
    CourseId  INT NOT NULL,
    ExamScore INT NOT NULL,
    Support VARCHAR(3),

    FOREIGN KEY (StudentId) references Student(ID),
    FOREIGN KEY (CourseId) references Course(ID)
);

INSERT INTO PERFORMANCE (ID, StudentId, CourseId, ExamScore, Support)
VALUES(1, 1001, 1, 78, 'No');

INSERT INTO PERFORMANCE (ID, StudentId, CourseId, ExamScore, Support)
VALUES(2, 1001, 2, 78, 'No');

INSERT INTO PERFORMANCE (ID, StudentId, CourseId, ExamScore, Support)
VALUES(3, 1001, 3, 78, 'No');


INSERT INTO PERFORMANCE (ID, StudentId, CourseId, ExamScore, Support)
VALUES(4, 1002, 2, 55, 'Yes');

INSERT INTO PERFORMANCE (ID, StudentId, CourseId, ExamScore, Support)
VALUES(5, 1002, 5, 55, 'Yes');

INSERT INTO PERFORMANCE (ID, StudentId, CourseId, ExamScore, Support)
VALUES(6, 1002, 6, 55, 'Yes');


INSERT INTO PERFORMANCE (ID, StudentId, CourseId, ExamScore, Support)
VALUES(7, 1003, 1, 90, 'No');

INSERT INTO PERFORMANCE (ID, StudentId, CourseId, ExamScore, Support)
VALUES(8, 1003, 2, 90, 'No');

INSERT INTO PERFORMANCE (ID, StudentId, CourseId, ExamScore, Support)
VALUES(9, 1003, 3, 90, 'No');

INSERT INTO PERFORMANCE (ID, StudentId, CourseId, ExamScore, Support)
VALUES(10, 1004, 2, 70, 'No');

INSERT INTO PERFORMANCE (ID, StudentId, CourseId, ExamScore, Support)
VALUES(11, 1004, 3, 70, 'No');

INSERT INTO PERFORMANCE (ID, StudentId, CourseId, ExamScore, Support)
VALUES(12, 1004, 5, 70, 'No');

INSERT INTO PERFORMANCE (ID, StudentId, CourseId, ExamScore, Support)
VALUES(13, 1005, 1, 45, 'Yes');

INSERT INTO PERFORMANCE (ID, StudentId, CourseId, ExamScore, Support)
VALUES(14, 1005, 2, 45, 'Yes');

INSERT INTO PERFORMANCE (ID, StudentId, CourseId, ExamScore, Support)
VALUES(15, 1005, 6, 45, 'Yes');


SELECT 
    StudentId AS 'Student Number',
    FirstName AS 'First Name',
    LastName AS 'Last Name',
    Support,
    BirthDay AS 'Date of Birth',
    CourseName AS 'Course Name',
    ExamBoards AS 'Exam Boards',
    TeacherName AS 'Teacher Name'
FROM PERFORMANCE
    LEFT JOIN STUDENT ON PERFORMANCE.StudentId = STUDENT.ID
    LEFT JOIN COURSE ON PERFORMANCE.CourseId = Course.ID;
