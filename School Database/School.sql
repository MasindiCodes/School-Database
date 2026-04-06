USE Schools_DB;

-- Create Principal Table
CREATE TABLE Principal (
    PrincipalID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);

-- Create Parent Table
CREATE TABLE Parent (
    ParentID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);

-- Create Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Gender VARCHAR(10),
    DOB DATE,
    ParentID INT FOREIGN KEY REFERENCES Parent(ParentID)
);

-- Create Teacher Table
CREATE TABLE Teacher (
    TeacherID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

-- Create Subject Table
CREATE TABLE Subject (
    SubjectID INT PRIMARY KEY,
    Name VARCHAR(50),
    Description VARCHAR(255)
);

-- Create ClassRoom Table
CREATE TABLE ClassRoom (
    ClassRoomID INT PRIMARY KEY,
    RoomNumber VARCHAR(10),
    Capacity INT
);

-- Create Class Table
CREATE TABLE Class (
    ClassID INT PRIMARY KEY,
    GradeLevel VARCHAR(10),
    Year INT,
    TeacherID INT FOREIGN KEY REFERENCES Teacher(TeacherID),
    ClassRoomID INT FOREIGN KEY REFERENCES ClassRoom(ClassRoomID)
);

-- Create Enrollment Table
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES Student(StudentID),
    ClassID INT FOREIGN KEY REFERENCES Class(ClassID),
    EnrollmentDate DATE
);

-- Create Attendance Table
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES Student(StudentID),
    ClassID INT FOREIGN KEY REFERENCES Class(ClassID),
    AttendanceDate DATE,
    Status VARCHAR(20)
);

-- Create Grade Table
CREATE TABLE Grade (
    GradeID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES Student(StudentID),
    SubjectID INT FOREIGN KEY REFERENCES Subject(SubjectID),
    ClassID INT FOREIGN KEY REFERENCES Class(ClassID),
    Score DECIMAL(5,2),
    GradeDate DATE
);

-- Insert Principal
INSERT INTO Principal (PrincipalID,FullName,Email,PhoneNumber)
VALUES 
	(1, 'Mr. Daniel Matlala', 'matlala.d@sunrise.edu', '0812345678');

-- Insert Parents
INSERT INTO Parent (ParentID,FullName,Phone,Email)
VALUES 
	(1, 'Susan Smith', '0811111111', 'susan.smith@gmail.com'),
	(2, 'James Brown', '0822222222', 'james.brown@yahoo.com'),
	(3, 'Linda White', '0833333333', 'linda.white@gmail.com'),
	(4, 'Michael Black', '0844444444', 'michael.black@gmail.com'),
	(5, 'Elizabeth Green', '0855555555', 'elizabeth.green@hotmail.com'),
	(6, 'Robert Adams', '0866666666', 'robert.adams@gmail.com'),
	(7, 'Jennifer Lee', '0877777777', 'jennifer.lee@gmail.com'),
	(8, 'Charles Harris', '0888888888', 'charles.harris@yahoo.com'),
	(9, 'Mary Clark', '0899999999', 'mary.clark@hotmail.com'),
	(10, 'Patricia Lewis', '0801234567', 'patricia.lewis@gmail.com'),
	(11, 'Thomas Walker', '0802345678', 'thomas.walker@yahoo.com'),
	(12, 'Barbara Hall', '0803456789', 'barbara.hall@gmail.com'),
	(13, 'Steven Allen', '0804567890', 'steven.allen@hotmail.com'),
	(14, 'Sarah Young', '0805678901', 'sarah.young@gmail.com'),
	(15, 'Edward King', '0806789012', 'edward.king@yahoo.com');

-- Insert Students (30 with ParentIDs between 1 and 15)
INSERT INTO Student (StudentID,FullName,Gender,DOB,ParentID)
VALUES
	(1, 'Alice Smith', 'Female', '2013-02-15', 1),
	(2, 'Bob Brown', 'Male', '2012-07-10', 2),
	(3, 'Cathy White', 'Female', '2014-11-22', 3),
	(4, 'David Black', 'Male', '2013-03-05', 4),
	(5, 'Ella Green', 'Female', '2012-08-13', 5),
	(6, 'Frank Adams', 'Male', '2014-01-30', 6),
	(7, 'Grace Lee', 'Female', '2013-06-17', 7),
	(8, 'Henry Harris', 'Male', '2012-12-09', 8),
	(9, 'Isla Clark', 'Female', '2014-04-21', 9),
	(10, 'Jack Lewis', 'Male', '2013-09-14', 10),
	(11, 'Kara Walker', 'Female', '2012-10-11', 11),
	(12, 'Liam Hall', 'Male', '2014-06-08', 12),
	(13, 'Mia Allen', 'Female', '2013-12-25', 13),
	(14, 'Noah Young', 'Male', '2012-03-18', 14),
	(15, 'Olivia King', 'Female', '2014-05-27', 15),
	(16, 'Paul Smith', 'Male', '2013-01-04', 1),
	(17, 'Queenie Brown', 'Female', '2012-11-12', 2),
	(18, 'Ryan White', 'Male', '2014-09-16', 3),
	(19, 'Sophie Black', 'Female', '2013-07-28', 4),
	(20, 'Tom Green', 'Male', '2012-02-19', 5),
	(21, 'Uma Adams', 'Female', '2014-08-03', 6),
	(22, 'Victor Lee', 'Male', '2013-10-06', 7),
	(23, 'Wendy Harris', 'Female', '2012-06-15', 8),
	(24, 'Xander Clark', 'Male', '2014-03-24', 9),
	(25, 'Yara Lewis', 'Female', '2013-05-09', 10),
	(26, 'Zane Walker', 'Male', '2012-01-22', 11),
	(27, 'Amy Hall', 'Female', '2014-10-31', 12),
	(28, 'Ben Allen', 'Male', '2013-11-19', 13),
	(29, 'Chloe Young', 'Female', '2012-04-14', 14),
	(30, 'Dylan King', 'Male', '2014-07-01', 15);

-- Insert Teachers
INSERT INTO Teacher (TeacherID, FullName, Email, Phone)
VALUES
	(1, 'Mrs. Jacobs', 'jacobs.t@sunrise.edu', '0832123456'),
	(2, 'Mr. Dube', 'dube.r@sunrise.edu', '0839988776'),
	(3, 'Ms. Khan', 'khan.m@sunrise.edu', '0828877665'),
	(4, 'Mrs. Nkosi', 'nkosi.n@sunrise.edu', '0817766554'),
	(5, 'Mr. Daniels', 'daniels.s@sunrise.edu', '0846655443'),
	(6, 'Miss Chetty', 'chetty.l@sunrise.edu', '0855544332'),
	(7, 'Mr. Mokoena', 'mokoena.k@sunrise.edu', '0864433221'),
	(8, 'Mrs. Naidoo', 'naidoo.j@sunrise.edu', '0873322110'),
	(9, 'Ms. Hugo', 'hugo.s@sunrise.edu', '0882211009'),
	(10, 'Mr. Molefe', 'molefe.d@sunrise.edu', '0891100998'),
	(11, 'Miss Zulu', 'zulu.b@sunrise.edu', '0809998887'),
	(12, 'Mr. Mbatha', 'mbatha.l@sunrise.edu', '0818887776'),
	(13, 'Mrs. Sibanda', 'sibanda.p@sunrise.edu', '0827776665'),
	(14, 'Mr. Theron', 'theron.a@sunrise.edu', '0836665554'),
	(15, 'Ms. Mthembu', 'mthembu.c@sunrise.edu', '0845554443'),
	(16, 'Mr. Fourie', 'fourie.g@sunrise.edu', '0854443332'),
	(17, 'Mrs. Hoosen', 'hoosen.t@sunrise.edu', '0863332221'),
	(18, 'Miss Bester', 'bester.n@sunrise.edu', '0872221110'),
	(19, 'Mr. Erasmus', 'erasmus.j@sunrise.edu', '0881110009'),
	(20, 'Ms. Van Wyk', 'vanwyk.r@sunrise.edu', '0890009998'),
	(21, 'Mrs. Langa', 'langa.z@sunrise.edu', '0808899887'),
	(22, 'Mr. Radebe', 'radebe.k@sunrise.edu', '0817788776'),
	(23, 'Miss Pillay', 'pillay.y@sunrise.edu', '0826677665'),
	(24, 'Mr. Pretorius', 'pretorius.e@sunrise.edu', '0835566554'),
	(25, 'Ms. Moko', 'moko.t@sunrise.edu', '0844455443'),
	(26, 'Mr. Ndlovu', 'ndlovu.f@sunrise.edu', '0853344332'),
	(27, 'Mrs. Petersen', 'petersen.v@sunrise.edu', '0862233221'),
	(28, 'Miss Abrahams', 'abrahams.h@sunrise.edu', '0871122110'),
	(29, 'Mr. Motsoeneng', 'motsoeneng.l@sunrise.edu', '0880011009'),
	(30, 'Ms. Visser', 'visser.s@sunrise.edu', '0899900998');


-- Insert Subjects
INSERT INTO Subject (SubjectID,Name,Description)
VALUES
	(1, 'Mathematics', 'Numbers, calculations, and problem solving'),
	(2, 'English', 'Language, reading, and writing'),
	(3, 'Life Skills', 'Personal and social well-being'),
	(4, 'Natural Sciences', 'Life and physical sciences'),
	(5, 'Social Sciences', 'History and geography'),
	(6, 'Technology', 'Basic mechanics and innovation'),
	(7, 'Arts and Culture', 'Visual art, music, and drama'),
	(8, 'Physical Education', 'Fitness and movement'),
	(9, 'Afrikaans', 'Second language instruction'),
	(10, 'IsiZulu', 'Home language or second language');

-- Insert ClassRooms
INSERT INTO ClassRoom (ClassRoomID,RoomNumber,Capacity)
VALUES
	(1, 'A101', 30),
	(2, 'A102', 30),
	(3, 'A103', 30),
	(4, 'A104', 30),
	(5, 'B201', 30),
	(6, 'B202', 30),
	(7, 'B203', 30),
	(8, 'B204', 30),
	(9, 'C301', 30),
	(10, 'C302', 30),
	(11, 'C303', 30),
	(12, 'C304', 30),
	(13, 'D401', 30),
	(14, 'D402', 30),
	(15, 'D403', 30),
	(16, 'D404', 30),
	(17, 'E501', 30),
	(18, 'E502', 30),
	(19, 'E503', 30),
	(20, 'E504', 30),
	(21, 'F601', 30),
	(22, 'F602', 30),
	(23, 'F603', 30),
	(24, 'F604', 30),
	(25, 'G701', 30),
	(26, 'G702', 30),
	(27, 'G703', 30),
	(28, 'G704', 30),
	(29, 'H801', 30),
	(30, 'H802', 30);

-- Insert Classes
INSERT INTO Class (ClassID,GradeLevel,Year,TeacherID,ClassRoomID)
VALUES
	(1, 'R', 2024, 1, 1),
	(2, 'R', 2024, 2, 2),
	(3, '1', 2024, 3, 3),
	(4, '1', 2024, 4, 4),
	(5, '2', 2024, 5, 5),
	(6, '2', 2024, 6, 6),
	(7, '3', 2024, 7, 7),
	(8, '3', 2024, 8, 8),
	(9, '4', 2024, 9, 9),
	(10, '4', 2024, 10, 10),
	(11, '5', 2024, 11, 11),
	(12, '5', 2024, 12, 12),
	(13, '6', 2024, 13, 13),
	(14, '6', 2024, 14, 14),
	(15, '7', 2024, 15, 15),
	(16, '7', 2024, 16, 16),
	(17, 'R', 2024, 17, 17),
	(18, '1', 2024, 18, 18),
	(19, '2', 2024, 19, 19),
	(20, '3', 2024, 20, 20),
	(21, '4', 2024, 21, 21),
	(22, '5', 2024, 22, 22),
	(23, '6', 2024, 23, 23),
	(24, '7', 2024, 24, 24),
	(25, 'R', 2024, 25, 25),
	(26, '1', 2024, 26, 26),
	(27, '2', 2024, 27, 27),
	(28, '3', 2024, 28, 28),
	(29, '4', 2024, 29, 29),
	(30, '5', 2024, 30, 30);

-- Insert Enrollments (1 enrollment per student)
INSERT INTO Enrollment (EnrollmentID,StudentID,ClassID,EnrollmentDate)
VALUES
	(1, 1, 1, '2024-01-15'),
	(2, 2, 2, '2024-01-15'),
	(3, 3, 3, '2024-01-15'),
	(4, 4, 4, '2024-01-15'),
	(5, 5, 5, '2024-01-15'),
	(6, 6, 6, '2024-01-15'),
	(7, 7, 7, '2024-01-15'),
	(8, 8, 8, '2024-01-15'),
	(9, 9, 9, '2024-01-15'),
	(10, 10, 10, '2024-01-15'),
	(11, 11, 11, '2024-01-15'),
	(12, 12, 12, '2024-01-15'),
	(13, 13, 13, '2024-01-15'),
	(14, 14, 14, '2024-01-15'),
	(15, 15, 15, '2024-01-15'),
	(16, 16, 16, '2024-01-15'),
	(17, 17, 17, '2024-01-15'),
	(18, 18, 18, '2024-01-15'),
	(19, 19, 19, '2024-01-15'),
	(20, 20, 20, '2024-01-15'),
	(21, 21, 21, '2024-01-15'),
	(22, 22, 22, '2024-01-15'),
	(23, 23, 23, '2024-01-15'),
	(24, 24, 24, '2024-01-15'),
	(25, 25, 25, '2024-01-15'),
	(26, 26, 26, '2024-01-15'),
	(27, 27, 27, '2024-01-15'),
	(28, 28, 28, '2024-01-15'),
	(29, 29, 29, '2024-01-15'),
	(30, 30, 30, '2024-01-15');

-- Insert Attendance (1 attendance record per student)
INSERT INTO Attendance (AttendanceID,StudentID,ClassID,AttendanceDate,Status)
VALUES
	(1, 1, 1, '2024-04-10', 'Present'),
	(2, 2, 2, '2024-04-10', 'Present'),
	(3, 3, 3, '2024-04-10', 'Absent'),
	(4, 4, 4, '2024-04-10', 'Present'),
	(5, 5, 5, '2024-04-10', 'Present'),
	(6, 6, 6, '2024-04-10', 'Absent'),
	(7, 7, 7, '2024-04-10', 'Present'),
	(8, 8, 8, '2024-04-10', 'Present'),
	(9, 9, 9, '2024-04-10', 'Present'),
	(10, 10, 10, '2024-04-10', 'Present'),
	(11, 11, 11, '2024-04-10', 'Absent'),
	(12, 12, 12, '2024-04-10', 'Present'),
	(13, 13, 13, '2024-04-10', 'Present'),
	(14, 14, 14, '2024-04-10', 'Present'),
	(15, 15, 15, '2024-04-10', 'Present'),
	(16, 16, 16, '2024-04-10', 'Absent'),
	(17, 17, 17, '2024-04-10', 'Present'),
	(18, 18, 18, '2024-04-10', 'Present'),
	(19, 19, 19, '2024-04-10', 'Present'),
	(20, 20, 20, '2024-04-10', 'Present'),
	(21, 21, 21, '2024-04-10', 'Present'),
	(22, 22, 22, '2024-04-10', 'Present'),
	(23, 23, 23, '2024-04-10', 'Absent'),
	(24, 24, 24, '2024-04-10', 'Present'),
	(25, 25, 25, '2024-04-10', 'Present'),
	(26, 26, 26, '2024-04-10', 'Present'),
	(27, 27, 27, '2024-04-10', 'Present'),
	(28, 28, 28, '2024-04-10', 'Absent'),
	(29, 29, 29, '2024-04-10', 'Present'),
	(30, 30, 30, '2024-04-10', 'Present');

-- Insert Grades (Each student has 1 subject & class match)
INSERT INTO Grade (GradeID,StudentID,SubjectID,ClassID,Score,GradeDate)
VALUES
	(1, 1, 1, 1, 85.50, '2024-04-12'),
	(2, 2, 2, 2, 78.00, '2024-04-12'),
	(3, 3, 3, 3, 67.50, '2024-04-12'),
	(4, 4, 4, 4, 92.00, '2024-04-12'),
	(5, 5, 5, 5, 74.25, '2024-04-12'),
	(6, 6, 6, 6, 88.00, '2024-04-12'),
	(7, 7, 7, 7, 69.75, '2024-04-12'),
	(8, 8, 8, 8, 81.00, '2024-04-12'),
	(9, 9, 9, 9, 77.50, '2024-04-12'),
	(10, 10, 10, 10, 90.25, '2024-04-12'),
	(11, 11, 1, 11, 66.75, '2024-04-12'),
	(12, 12, 2, 12, 79.00, '2024-04-12'),
	(13, 13, 3, 13, 70.00, '2024-04-12'),
	(14, 14, 4, 14, 85.00, '2024-04-12'),
	(15, 15, 5, 15, 88.50, '2024-04-12'),
	(16, 16, 6, 16, 91.00, '2024-04-12'),
	(17, 17, 7, 17, 82.25, '2024-04-12'),
	(18, 18, 8, 18, 73.00, '2024-04-12'),
	(19, 19, 9, 19, 76.25, '2024-04-12'),
	(20, 20, 10, 20, 89.00, '2024-04-12'),
	(21, 21, 1, 21, 92.50, '2024-04-12'),
	(22, 22, 2, 22, 87.00, '2024-04-12'),
	(23, 23, 3, 23, 80.00, '2024-04-12'),
	(24, 24, 4, 24, 77.75, '2024-04-12'),
	(25, 25, 5, 25, 85.00, '2024-04-12'),
	(26, 26, 6, 26, 90.00, '2024-04-12'),
	(27, 27, 7, 27, 84.00, '2024-04-12'),
	(28, 28, 8, 28, 73.50, '2024-04-12'),
	(29, 29, 9, 29, 91.75, '2024-04-12'),
	(30, 30, 10, 30, 86.00, '2024-04-12');
