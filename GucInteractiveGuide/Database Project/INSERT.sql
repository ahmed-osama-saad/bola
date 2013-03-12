
INSERT INTO Users values('MR', 'Admin', '123456', 'Admin', '1234567',1);

INSERT INTO Users values('MR', 'Student', '123456', 'student', '1234567',1);

INSERT INTO Users values('MRs', 'Student', '123456', 'student2', '1234567',1);

INSERT INTO Users values('MR', 'Member', '123456', 'member', '1234567',1);

INSERT INTO Users values('MRs', 'Member', '123456', 'member2', '1234567',1);

INSERT INTO Users values('MR', 'Adminst', '123456', 'adminst', '1234567',1);

INSERT INTO Users values('MRs', 'Adminst', '123456', 'adminst2', '1234567',1);

INSERT INTO Users values('MR', 'Academic', '123456', 'academic', '1234567',1);

INSERT INTO Users values('MRs', 'Academic', '123456', 'academic2', '1234567',1);

INSERT INTO Users values('MR', 'Dean', '123456', 'dean', '1234567',1);

INSERT INTO Users values('MRs', 'Dean', '123456', 'dean2', '1234567',1);

INSERT INTO Users values('MR', 'Lecturer', '123456', 'lecturer', '1234567',1);

INSERT INTO Users values('MRs', 'Lecturer', '123456', 'lecturer2', '1234567',1);

INSERT INTO Users values('MR', 'Undergr', '123456', 'undergrad', '1234567',1);

INSERT INTO Users values('MRs', 'Undergr', '123456', 'undergrad2', '1234567',1);

INSERT INTO Users values('MR', 'Graduate', '123456', 'grad', '1234567',1);

INSERT INTO Users values('MRs', 'Graduate', '123456', 'grad2', '1234567',1);

SELECT *
FROM Users;

INSERT INTO Members values (4);
INSERT INTO Members values (5);
INSERT INTO Members values (6);
INSERT INTO Members values (7);
INSERT INTO Members values (8);
INSERT INTO Members values (9);
INSERT INTO Members values (10);
INSERT INTO Members values (11);
INSERT INTO Members values (12);
INSERT INTO Members values (13);

SELECT *
FROM Members;

INSERT INTO Students values(2, 'cs');
INSERT INTO STUDENTS values(3, 'dmet');
INSERT INTO STUDENTS values(14, 'dmet');
INSERT INTO STUDENTS values(15, 'dmet');
INSERT INTO STUDENTS values(16, 'dmet');
INSERT INTO STUDENTS values(17, 'dmet');

SELECT *
FROM Students;

INSERT INTO Adminstratives values (6,1,6);
INSERT INTO Adminstratives values (7,0,6);

SELECT *
FROM Adminstratives;

INSERT INTO Academics values (9, 'Managment', 'prof', 6);
INSERT INTO Academics values (8,'pharmacy', 'prof', 6);

SELECT *
FROM Academics;

INSERT INTO Deans values (9);
INSERT INTO Deans values (8);

SELECT *
FROM Deans;

INSERT INTO Lecturers values (9);
INSERT INTO Lecturers values (8);

SELECT *
FROM Lecturers;

INSERT INTO Undergraduates values (15, 1, 2005);
INSERT INTO Undergraduates values (14, 2, 2009);

SELECT *
FROM Undergraduates;

INSERT INTO Graduates values (17);
INSERT INTO Graduates values (16);

INSERT INTO Grad_Degrees values(17,'PHD');
INSERT INTO Grad_Degrees values(17,'Masters');
INSERT INTO Grad_Degrees values (16,'PHD');
INSERT INTO Grad_Degrees values (16,'Masters');

SELECT * 
FROM Graduates;
SELECT *
FROM Grad_Degrees;

INSERT INTO Evaluations values ('databases', 'do you like this course?', 'Course');
INSERT INTO Evaluations values ('seniors', 'did you like your study here?', 'Graduation');
INSERT INTO Evaluations values ('satisfy', 'what do u think of the university?', 'Satisfactory');

SELECT *
fROM Evaluations; 

INSERT INTO Courses values ('CS3', 'computer science', 'lab', 'Ghadeer', 3,'English', 'Java', 'Slides', 'program',9);
INSERT INTO Courses values ('AS1', 'Acting', 'theatre', 'Ghadeer', 8,'French', 'acting', 'tapes', 'act',8);

SELECT *
FROM Courses;

INSERT INTO Faculties values ('IET');
INSERT INTO Faculties values ('MET');

SELECT *
FROM Faculties;

INSERT INTO Majors Values ('CSEN', 'MET', 'Technology', 'programing major');
INSERT INTO Majors Values ('DMET', 'MET', 'Technology', 'media major');
INSERT INTO Majors Values ('NTW', 'IET', 'Networks', 'networking major');
INSERT INTO Majors Values ('COMM', 'IET', 'Communict', 'Communication major');

SELECT *
FROM Majors;

INSERT INTO Maj_Degrees values ('DMET', 'MET', 'Masters');
INSERT INTO Maj_Degrees values ('DMET', 'MET', 'Bachlors');
INSERT INTO Maj_Degrees values ('NTW', 'IET', 'Masters');

SELECT *
FROM Maj_Degrees;

INSERT INTO Assessments values('quiz1', 'AS1', 'quiz', .20);
INSERT INTO Assessments values('midterm', 'CS3', 'midterm', .50);

SELECT *
FROM Assessments;
