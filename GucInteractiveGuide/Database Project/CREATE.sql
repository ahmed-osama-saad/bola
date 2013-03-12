
CREATE TABLE Users(user_id int IDENTITY, f_name varchar(10), l_name varchar(20), phone_no varchar(10),user_name varchar(20) UNIQUE, pass varchar(15) DEFAULT '123456', logged_in bit NOT NULL DEFAULT 0,
       PRIMARY KEY(user_id),
	   CHECK (Len(pass)>5));

CREATE TABLE Members(user_id int ,PRIMARY KEY (user_id),
      FOREIGN KEY (user_id) REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Students(user_id int, major varchar(20),  
      PRIMARY KEY (user_id),
      FOREIGN KEY (user_id) references Users ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Adminstratives(user_id int,is_manager bit, manager_id int,
       PRIMARY KEY (user_id),
       FOREIGN KEY (user_id) references Members ON DELETE CASCADE ON UPDATE CASCADE,
       FOREIGN KEY (manager_id) references Adminstratives ON DELETE NO ACTION ON UPDATE NO ACTION);

CREATE TABLE Academics(user_id int, department varchar(30),job_title varchar(30),admin_id int,
      PRIMARY KEY (user_id) ,
	  foreign key (user_id) references Members ON DELETE CASCADE ON UPDATE CASCADE, 
      FOREIGN KEY (admin_id) references Adminstratives ON DELETE NO ACTION ON UPDATE NO ACTION);

CREATE TABLE Lecturers(user_id int ,PRIMARY KEY (user_id),
        FOREIGN KEY (user_id) references Academics ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Deans(user_id INTEGER ,PRIMARY KEY(user_id),
       FOREIGN KEY (user_id) REFERENCES Academics ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Evaluations(name_ev varchar(10), questions varchar(200), type varchar(30) NOT NULL
      PRIMARY KEY (name_ev));

CREATE TABLE Courses(code varchar(5), name_course varchar(20),type varchar(20),coordinator varchar(20),
     semester int, language varchar(10),content varchar (10), resources varchar (10), learning_outcome varchar (10), user_id int,
     PRIMARY KEY (code), foreign key (user_id) references Lecturers ON DELETE NO ACTION ON UPDATE NO ACTION);

CREATE TABLE Graduates(user_id int,
      PRIMARY KEY (user_id), 
      FOREIGN KEY (user_id) references Students ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Grad_Degrees(user_id int, degree varchar(10),
        PRIMARY KEY(user_id, degree),
        FOREIGN KEY (user_id) references Graduates ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Undergraduates(user_id int, gpa int check (gpa <5 AND gpa >1), admission_year int, 
       PRIMARY KEY (user_id),
       FOREIGN KEY (user_id) references Students ON DELETE CASCADE ON UPDATE CASCADE
	  );

CREATE TABLE Faculties(name_fac varchar(3), PRIMARY KEY (name_fac));


CREATE TABLE Majors(name_mj varchar(15), name_fac varchar(3), field varchar(10),
    description varchar (20), PRIMARY KEY(name_mj, name_fac),
    FOREIGN KEY (name_fac) references Faculties ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Maj_Degrees(name_mj varchar(15), name_fac varchar(3), name varchar(10)
     Primary Key(name_mj,name_fac,name),
     FOREIGN KEY(name_mj,name_fac) references Majors  ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Assessments(name_asses varchar(10),code varchar(5),type varchar(15), weight numeric(3,2), 
      PRIMARY KEY(name_asses, code),
      FOREIGN KEY (code) references Courses ON DELETE CASCADE ON UPDATE CASCADE);

 

CREATE TABLE Questions(question_id int IDENTITY,question varchar(30), name_of_person varchar(20), subject varchar(20),reply varchar(30), q_count smallint DEFAULT 1,date_posted DATETIME, admin_id int,
      PRIMARY KEY (question_id),
      FOREIGN KEY (admin_id) references Adminstratives);

 

CREATE TABLE Lecturers_addOther_Lecturers(lec_id int,added_id int,code varchar(5),
            PRIMARY KEY(added_id,code),
            FOREIGN KEY (lec_id) references Lecturers,
            FOREIGN KEY (added_id) references Lecturers,
            FOREIGN KEY (code) references Courses);


CREATE TABLE Courses_registeredTo_Students(user_id int, code varchar(5),approved_admin bit,
           PRIMARY KEY (user_id,code),
           FOREIGN KEY (user_id) references Students  ON DELETE CASCADE ON UPDATE CASCADE,
           FOREIGN KEY (code) references Courses  ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Assessments_definedBy_Lecturers(name_asses varchar(10),code varchar(5), user_id int,
          PRIMARY KEY(name_asses, code, user_id),
          FOREIGN KEY(name_asses,code) references Assessments ON DELETE CASCADE ON UPDATE CASCADE,
          FOREIGN KEY(user_id) references Lecturers);

CREATE TABLE Courses_offeredTo_Majors(name_mj varchar(15), name_fac varchar(3), code varchar(5),
           PRIMARY KEY(name_mj,name_fac,code),
           FOREIGN KEY(name_mj,name_fac) references Majors  ON DELETE CASCADE ON UPDATE CASCADE,
           FOREIGN KEY(code) references Courses  ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Academics_fill_Evaluations(name_ev varchar(10),results varchar(200), user_id int,
          PRIMARY KEY (name_ev, user_id),
          FOREIGN KEY (name_ev) references Evaluations ON DELETE CASCADE ON UPDATE CASCADE,
          FOREIGN KEY (user_id) references Academics);

CREATE TABLE Evaluations_filledBy_Students(name_ev varchar(10),results varchar(200), user_id int,
          PRIMARY KEY (name_ev, user_id),
          FOREIGN KEY (name_ev) references Evaluations  ON DELETE CASCADE ON UPDATE CASCADE,
          FOREIGN KEY (user_id) references Students);

CREATE TABLE Evaluations_filledBy_Seniors(name_ev varchar(10), results varchar(200),user_id INTEGER,
          PRIMARY KEY (name_ev, user_id),
          FOREIGN KEY (name_ev) references Evaluations  ON DELETE CASCADE ON UPDATE CASCADE,
          FOREIGN KEY (user_id) references Undergraduates);


CREATE TABLE Courses_receiveNotification_Students(user_id int, code varchar(5),notifications varchar(50),registered bit
          PRIMARY KEY (user_id, code),
          FOREIGN KEY (user_id) references Students  ON DELETE CASCADE ON UPDATE CASCADE,
          FOREIGN KEY (code) references Courses  ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Administratives_sendReports_Managers(user_id int, manager_id int, report varchar(50),
												  PRIMARY KEY(user_id,manager_id),
												  FOREIGN KEY(user_id) REFERENCES Adminstratives,
												  FOREIGN KEY(manager_id) REFERENCES Adminstratives);
