/*
START OF MEMBER ACTIONS
_________________________________________________________________________
*/
CREATE PROC checkDegreesSP               
@username varchar(20)
AS
DECLARE @user_name varchar(20)
SELECT M.name,M.name_fac
FROM Maj_Degrees M, Members Me, Users U
WHERE @user_name = U.user_name AND U.user_id = Me.user_id AND U.logged_in = 1;


CREATE PROC viewFaqSP
@user_name varchar(20)
AS
SELECT Q.question, Q.subject,Q.reply
FROM Questions Q,Members Me, Users U
WHERE  @user_name = U.user_name AND U.user_id = Me.user_id AND U.logged_in = 1 AND Q.q_count > 5;

CREATE PROC logIn                             /*tested*/
@user_name varchar(20),
@password varchar(15)
AS
UPDATE Users
SET logged_in = 1
WHERE @user_name = user_name AND @password = pass;

CREATE PROC logOut              
@user_name varchar(20)
AS
UPDATE Users
SET logged_in = 0
WHERE @user_name = user_name;

CREATE PROC changePassword			
@user_name varchar(20),
@password varchar(15),
@newPassword varchar(15)
AS
Update Users
SET pass = @newPassword
WHERE @user_name = user_name AND pass = @password;

/*__________________________________________________________________________
END OF MEMBER ACTIONS
*/


/*START OF STUDENT ACTIONS
____________________________________________________________________________
*/
CREATE PROC insertUser   
@f_name varchar(10),
@l_name varchar(10),
@phone_no varchar(10),
@user_name varchar(20),
@pass varchar(15)
AS
INSERT INTO Users VALUES(@f_name,@l_name,@phone_no,@user_name,@pass,0);

CREATE PROC insertStudent 
@user_name varchar(20)
AS
DECLARE @user_id int
SELECT @user_id = Users.user_id
FROM Users
WHERE @user_name = Users.user_name
Insert
INTO Students ([user_id]) VALUES(@user_id);

CREATE PROC getUserId 
@user_name varchar(20),
@user_id int OUTPUT
AS
SELECT @user_id = Users.user_id
FROM Users
WHERE @user_name = Users.user_name;

CREATE PROC studentSignUp 
@f_name varchar(10),
@l_name varchar(10),
@phone_no varchar(10),
@user_name varchar(20),
@pass varchar(15)
AS
INSERT INTO Users Values(@f_name,@l_name,@phone_no,@user_name,@pass,0)
INSERT INTO Students ([user_id])
SELECT Users.user_id
FROM Users
WHERE user_name = @user_name;

create PROC register
 @username varchar(10),
 @course varchar(5)
 as
 declare @userid int
 select @userid = u.user_id
 from Users u, Students s,Courses c
 WHERE u.user_name = @username and c.code = @course and s.user_id = u.user_id and u.logged_in = 1
 INSERT INTO Courses_registeredTo_Students values(@userid, @course, 0)
 INSERT INTO Courses_receiveNotification_Students VALUES(@userid,@course,NULL,1);

CREATE PROC checkNotifications 
@user_name varchar(20)
AS
SELECT C.name_course,CrN.notifications
FROM Courses_receiveNotification_Students CrN, Users U,Courses C
WHERE  U.user_name = @user_name AND CrN.user_id = U.user_id and U.logged_in = 1 AND C.code = CrN.code;

CREATE PROC fillCourseSurvey
@user_name varchar(20),
@name_ev varchar(10),
@result varchar(200)
AS
DECLARE @user_id int
SELECT @user_id = Users.user_id
FROM Users,Evaluations,Students
WHERE Users.user_name = @user_name AND Evaluations.name_ev = @name_ev AND Evaluations.type = 'Course' AND Students.user_id = @user_id
INSERT INTO Evaluations_filledBy_Students VALUES(@name_ev,@result,@user_id);



CREATE PROC fillSatSurvey
@user_name varchar(20),
@name_ev varchar(10),
@result varchar(200)
AS
DECLARE @user_id int
SELECT @user_id = Users.user_id
FROM Users,Evaluations,Students
WHERE Users.user_name = @user_name AND Evaluations.name_ev = @name_ev AND Evaluations.type = 'Satisfactory' AND Students.user_id = Users.user_id 
INSERT INTO Evaluations_filledBy_Students VALUES(@name_ev,@result,@user_id);

CREATE PROC checkDetails
@user_name varchar(20)
AS
SELECT C.name_course,C.content,C.resources,C.learning_outcome,C.coordinator
FROM Courses C, Users U, Courses_registered_Students CrS
WHERE U.user_name = @user_name AND CrS.user_id = U.user_id AND U.logged_in = 1 AND C.code = CrS.code AND CrS.approved_admin = 1;

CREATE PROC fillGradSurvey
 @username varchar(20),
 @result varchar(200),
 @nameeval varchar(10)
 AS
 declare @userid int
 SELECT @userid = u.user_id
 FROM Users u, Evaluations e, Undergraduates s
 WHERE u.user_name = @username and s.user_id = u.user_id and (YEAR(CURRENT_TIMESTAMP) - s.admission_year)>4 and e.name_ev = @nameeval and e.name_ev = 'Graduation'AND u.logged_in = 1
 INSERT INTO Evaluations_fill_Seniors values (@nameeval, @userid, @result);

/*
END OF STUDENT ACTIONS 
_____________________________________________________________________________
*/

/*
START OF ACADEMIC ACTIONS
_____________________________________________________________________________
*/
CREATE PROC academicSignUp  
@f_name varchar(10),
@l_name varchar(10),
@phone_no varchar(10),
@user_name varchar(20),
@pass varchar(15)
AS
INSERT INTO Users Values(@f_name,@l_name,@phone_no,@user_name,@pass,0);
/*
END OF ACADEMIC ACTIONS
_____________________________________________________________________________
*/

/*
START OF GUEST ACTIONS
_____________________________________________________________
*/
CREATE PROC checkDegreesGuest
AS
SELECT *
FROM Maj_Degrees M;

CREATE PROC askQuestion
@question varchar(30),
@name varchar(20),
@subject varchar(20)
AS
BEGIN
IF(EXISTS (SELECT Q.question
		   FROM Questions Q
		   WHERE Q.question = @question))
		   BEGIN
		   UPDATE Questions
		   SET q_count = q_count + 1
		   WHERE Questions.question = @question
		   END
		   ELSE
		   INSERT INTO Questions VALUES(@question, @name, @subject,NULL,1,CURRENT_TIMESTAMP, 1)
		   END;

CREATE PROC viewFaqGuest
AS
SELECT Q.question, Q.subject, Q.reply
FROM Questions Q
WHERE Q.q_count > 5 ;

/*END OF GUEST ACTIONS
__________________________________________________________
*/

/*START OF ADMIN AND STAFF ACTIONS
__________________________________________________________
*/
CREATE PROC inviteAcademics
@user_name varchar(20),
@invited_name varchar(20),
@dept varchar(30),
@jb_title varchar(30)
AS
BEGIN
IF(EXISTS (SELECT *
FROM Users U
WHERE U.user_name = @user_name AND @user_name = 'Admin' AND U.logged_in = 1))
BEGIN
DECLARE @invited_id int
DECLARE @admin_id int
SELECT @admin_id = Users.user_id
FROM Users 
WHERE Users.user_name = 'Admin'
SELECT @invited_id = Users.user_id
FROM Users
WHERE Users.user_name = @invited_name
INSERT INTO Members VALUES(@invited_id)
INSERT INTO Academics VALUES(@invited_id,@dept,@jb_title,@admin_id)
END
ELSE
PRINT 'ADMIN NOT LOGGED IN OR INVALID USER OF ACTION'
END;

CREATE PROC approveRegister
@user_name varchar(20),
@student_name varchar(20),
@course_code varchar(5),
@approve bit
AS
BEGIN
IF(EXISTS (SELECT *
FROM Users U
WHERE U.user_name = @user_name AND @user_name = 'Admin' AND U.logged_in = 1))
BEGIN
DECLARE @student_id int
SELECT @student_id = Users.user_id
FROM Users
WHERE Users.user_name = @student_name
IF(@approve = 1)
BEGIN
UPDATE Courses_registeredTo_Students
SET approved_admin = 1
WHERE @student_id = user_id AND @course_code = code
END
ELSE
BEGIN
DELETE 
FROM Courses_registeredTo_Students
WHERE  @student_id = user_id AND @course_code = code
END
END
ELSE
PRINT 'ADMIN NOT LOGGED IN OR INVALID USER OF ACTION'
END;

CREATE PROC defineSurvey
@user_name varchar(20),
@name_ev varchar(10),
@questions varchar(200)
AS
BEGIN
IF(EXISTS (SELECT *
FROM Users U
WHERE U.user_name = @user_name AND @user_name = 'Admin' AND U.logged_in = 1))
BEGIN
UPDATE Evaluations
SET questions = @questions
WHERE name_ev = @name_ev
END
ELSE
PRINT 'ADMIN NOT LOGGED IN OR INVALID USER OF ACTION'
END;

CREATE PROC checkResultsAdmin
AS
SELECT EfS.results,EfS.name_ev ,EfSt.results,EfSt.name_ev ,AfE.results,AfE.name_ev 
FROM Evaluations_filledBy_Students EfSt, Evaluations_filledBy_Seniors EfS, Academics_filledBy_Evaluations AfE;

CREATE PROC respondQuestions
@user_name varchar(20),
@question varchar(30),
@reply varchar(30)
AS
BEGIN
IF(EXISTS (SELECT *
FROM Users U
WHERE U.user_name = @user_name AND @user_name = 'Admin' AND U.logged_in = 1))
BEGIN
DECLARE @date DATETIME
SELECT @date = Questions.date_posted
FROM Questions
WHERE Questions.question = @question
IF(NOT EXISTS (SELECT *
FROM Questions
WHERE Questions.date_posted < @date AND Questions.reply IS NULL))
BEGIN
UPDATE Questions
SET reply = @reply
WHERE question = @question
END
ELSE
PRINT 'OUT OF ORDER RESPONSE'
END
ELSE
PRINT 'ADMIN NOT LOGGED IN OR INVALID USER OF ACTION'
END;

CREATE PROC viewAllQuestions
@user_name varchar(20)
AS
BEGIN
IF(EXISTS (SELECT *
FROM Users U
WHERE U.user_name = @user_name AND @user_name = 'Admin' AND U.logged_in = 1))
BEGIN
SELECT Questions.question, Questions.subject, Questions.reply,Questions.date_posted
FROM Questions
ORDER BY date_posted ASC
END
ELSE
PRINT 'ADMIN NOT LOGGED IN OR INVALID USER OF ACTION'
END;

CREATE PROC viewAllEvaluations
@user_name varchar(20)
AS
BEGIN
IF(EXISTS (SELECT *
FROM Users U
WHERE U.user_name = @user_name AND @user_name = 'Admin' AND U.logged_in = 1))
BEGIN
SELECT Evaluations.name_ev,Evaluations.type
FROM Evaluations
END
ELSE
PRINT 'ADMIN NOT LOGGED IN OR INVALID USER OF ACTION'
END;

CREATE PROC defineFacMaj
@user_name varchar(20),
@name_fac varchar(3),
@name_mj varchar(15),
@field varchar(10),
@description varchar(20)
AS
BEGIN
IF(EXISTS (SELECT *
FROM Users U
WHERE U.user_name = @user_name AND @user_name = 'Admin' AND U.logged_in = 1))
BEGIN
INSERT INTO Faculties VALUES(@name_fac)
INSERT INTO Majors VALUES(@name_mj,@name_fac,@field,@description)
END
ELSE
PRINT 'ADMIN NOT LOGGED IN OR INVALID USER OF ACTION'
END;

CREATE PROC defineDegree
@user_name varchar(20),
@name_mj varchar(15),
@name_fac varchar(3),
@name varchar(10)
AS
BEGIN
IF(EXISTS (SELECT *
FROM Users U
WHERE U.user_name = @user_name AND @user_name = 'Admin' AND U.logged_in = 1))
BEGIN
INSERT INTO Maj_Degrees VALUES(@name_mj,@name_fac,@name)
END
ELSE
PRINT 'ADMIN NOT LOGGED IN OR INVALID USER OF ACTION'
END;

CREATE PROC sendReport
@user_name varchar(20),
@manager_name varchar(20),
@report varchar(50)
AS
IF((EXISTS(SELECT *
FROM Users,Adminstratives
WHERE Users.user_name = @user_name AND Users.user_id = Adminstratives.user_id AND Users.logged_in = 1))AND
(EXISTS(SELECT *
FROM Users,Adminstratives
WHERE Users.user_name = @manager_name AND Users.user_id = Adminstratives.user_id )))
BEGIN
DECLARE @user_id int
DECLARE @manager_id int
SELECT @user_id = Users.user_id
FROM Users
WHERE Users.user_name = @user_name
SELECT @manager_id = Users.user_id
FROM Users
WHERE Users.user_name = @manager_name
INSERT INTO Adminstratives_sendReports_Managers VALUES(@user_id,@manager_id,@report)
END;


CREATE PROC checkReports
@user_name varchar(20)
AS
SELECT Asm.report
FROM Administratives_sendReports_Managers AsM, Users U
WHERE U.user_name = @user_name AND Asm.manager_id = U.user_id AND U.logged_in = 1;


/*END OF ADMIN AND STAFF ACTIONS
__________________________________________________________
*/


CREATE PROC checkResultsLec
@user_name varchar(20),
@code varchar(5)
AS
BEGIN
IF(EXISTS(SELECT *
FROM Users,Lecturers
WHERE Users.user_name = @user_name AND Users.user_id = Lecturers.user_id AND Users.logged_in = 1))
BEGIN 
SELECT EfS.results,EfS.name_ev ,EfSt.results,EfSt.name_ev ,AfE.results,AfE.name_ev 
FROM Evaluations_filledBy_Students EfSt, Evaluations_filledBy_Seniors EfS, Academics_fill_Evaluations AfE
END
ELSE
PRINT 'LECTURER NOT LOGGED IN OR INVALID USER OF ACTION'
END;

CREATE PROC adminstrativeSignUp 
@f_name varchar(10),
@l_name varchar(10),
@phone_no varchar(10),
@user_name varchar(20),
@pass varchar(15)
AS
INSERT INTO Users Values(@f_name,@l_name,@phone_no,@user_name,@pass,0)
INSERT INTO Members ([user_id])
SELECT Users.user_id
FROM Users
WHERE user_name = @user_name
INSERT INTO Adminstratives([user_id])
SELECT Users.user_id
FROM Users
WHERE user_name = @user_name;



CREATE PROC seniorfilleval
@username varchar(20),
@result varchar(200),
@nameev varchar(10)
AS
DECLARE @userid int
SELECT @userid = u.user_id
FROM Users u, Evaluations e, Students s
WHERE u.user_name = @username and u.user_id = s.user_id and @nameev = e.name_ev and e.type = 'graduation' and u.logged_in = 1
INSERT INTO  Evaluations_filledBy_Seniors values (@nameev, @userid, @result);

CREATE PROC AddCourse
@code varchar(5),
@name_course varchar(20),
@type varchar(20),
@coordinator varchar(20),
@semester varchar(4),
@language varchar(10),
@content varchar (10), 
@resources varchar (10), 
@learning_outcome varchar (10),
@user_name varchar(20)
as
declare @userid int
SELECT @userid = u.user_id
FROM Users u, Lecturers l
WHERE u.user_name = @user_name and u.user_id = l.user_id AND u.logged_in = 1
INSERT INTO Courses values (@code, @name_course, @type, @coordinator, @semester, @language, @content, @resources, @learning_outcome, @userid);

CREATE PROC addOtherLecturers
@course varchar(5),
@username varchar(20),
@addusername varchar(20)
AS
DECLARE @userid1 int
DECLARE @userid2 int
SELECT @userid1 = u.user_id, @userid2 = uu.user_id
FROM Users u, Users uu, Courses c, Lecturers l, Lecturers ll
WHERE u.user_name = @username and uu.user_name = @addusername and uu.user_id = l.user_id and c.code = @course and u.user_id = c.user_id
INSERT INTO Lecturers_addOther_Lecturers values (@userid1 , @userid2 ,@course);

CREATE PROC defineAssess
@type varchar(15),
@name varchar (10),
@weight numeric(3,2),
@username varchar (20),
@course varchar(5)
AS
declare @userid int
SELECT @userid = u.user_id
FROM Users u, Courses c
WHERE u.user_name = @username and c.code = @course and u.user_id = c.user_id and u.logged_in =1
INSERT INTO Assessments VALUES (@name, @course, @type, @weight)
INSERT INTO Assessments_definedBy_Lecturers VALUES (@name, @course, @userid);

CREATE PROC insUnder
@user_name varchar(20),
@gpa numeric (3,2),
@admission_year int
AS
DECLARE @user_id int
SELECT @user_id = Users.user_id
FROM Users
WHERE Users.user_name = @user_name
INSERT INTO Undergraduates VALUES(@user_id,@gpa,@admission_year);

CREATE PROC insGrad
@user_name varchar(20)
AS
DECLARE @user_id int
SELECT @user_id = Users.user_id
FROM Users
WHERE Users.user_name = @user_name
INSERT INTO Graduates VALUES(@user_id);

