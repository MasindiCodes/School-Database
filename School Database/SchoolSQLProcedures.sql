CREATE TABLE ErrorLog (
    ErrorID INT IDENTITY PRIMARY KEY,
    ErrorMessage NVARCHAR(4000),
    ErrorDate DATETIME
);

--A procedure to add a  new student
CREATE PROCEDURE AddStudent

    @FullName NVARCHAR(100),
    @Gender NVARCHAR(10),
    @DateOfBirth DATE,
    @ParentID INT
AS
BEGIN
    BEGIN TRY
    INSERT INTO Student (FullName, Gender, DOB, ParentID)
    VALUES (@FullName, @Gender, @DateOfBirth, @ParentID);
END TRY
BEGIN CATCH
	INSERT INTO ErrorLog (ErrorMessage, ErrorDate)
        VALUES (ERROR_MESSAGE(), GETDATE());
		 END CATCH
END;

--Makes  it so if an attendance entry is emoty, it will be changed to absent
Create TRIGGER UpdateAttendanceStatus
ON Attendance
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE Attendance
    SET Status = CASE
        WHEN Status IS NULL THEN 'Absent'
        ELSE Status
    END
    WHERE AttendanceID IN (SELECT AttendanceID FROM inserted);
END;

--Creates an admin login for the school database
CREATE LOGIN SchoolAdmin
WITH PASSWORD = 'StrongPassword123!';


CREATE USER SchoolAdminUser FOR LOGIN SchoolAdmin;


CREATE ROLE SchoolAdminRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo TO SchoolAdminRole;
EXEC sp_addrolemember 'SchoolAdminRole', 'SchoolAdminUser';


--A view for students and their grade
CREATE VIEW StudentGrades AS
SELECT S.StudentID, S.FullName, G.Score, G.GradeDate
FROM Student S
JOIN Grade G ON S.StudentID = G.StudentID;
--Links students to their grades


--Creates view which shows the subjects each teacher works with
CREATE VIEW TeacherSubjects AS
SELECT T.TeacherID, T.FullName, S.Name AS SubjectName
FROM Teacher T
JOIN Class C ON T.TeacherID = C.TeacherID
Join Grade G ON G.ClassID = C.ClassID
JOIN Subject S ON G.SubjectID = S.SubjectID;

--A procedure to change information about a student
CREATE PROCEDURE UpdateStudent
    @StudentID INT,
    @FullName NVARCHAR(100),
    @Gender NVARCHAR(10),
    @DateOfBirth DATE,
    @ParentID INT
AS
BEGIN
    UPDATE Student
    SET FullName = @FullName,
        Gender = @Gender,
        DOB = @DateOfBirth,
        ParentID = @ParentID
    WHERE StudentID = @StudentID;
END;


--
CREATE TRIGGER LogGradeChanges
ON Grade
AFTER UPDATE
AS
BEGIN
    INSERT INTO GradeChangeLog (GradeID, OldScore, NewScore, ChangeDate)
    SELECT 
        i.GradeID, 
        d.Score AS OldScore, 
        i.Score AS NewScore, 
        GETDATE() AS ChangeDate
    FROM inserted i
    JOIN deleted d ON i.GradeID = d.GradeID;
END;

--Calculates the age of a student
CREATE FUNCTION CalculateAge (@DateOfBirth DATE)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, @DateOfBirth, GETDATE()) - 
           CASE WHEN DATEADD(YEAR, DATEDIFF(YEAR, @DateOfBirth, GETDATE()), @DateOfBirth) > GETDATE() THEN 1 ELSE 0 END;
END;

--index for the full names of students
CREATE INDEX IDX_Student_FullName
ON Student (FullName);
