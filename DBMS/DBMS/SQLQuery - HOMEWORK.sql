USE master 
GO


CREATE DATABASE VPD_311_SQL_HOMEWORK 
ON -- ���������� ��������� ����� ���� ������ 
(
	NAME = VPD_311_SQL_HOMEWORK,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\VPD_311_SQL_HOMEWORK.mdf',
	SIZE = 8MB,
	MAXSIZE = 500MB,
	FILEGROWTH = 8MB
)
LOG ON -- ���������� ��������� ����� ������� ���� ������ 
(
	NAME = VPD_311_SQL_HOMEWORK_Log,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\VPD_311_SQL_HOMEWORK_log.ldf',
	SIZE = 8MB,
	MAXSIZE = 500MB,
	FILEGROWTH = 8MB
)
GO

USE VPD_311_SQL_HOMEWORK;
GO

CREATE TABLE Directions
(
	direction_id		TINYINT				PRIMARY KEY,
	direction_name		NVARCHAR(150)		NOT NULL
);

CREATE TABLE Groups
(
	group_id		int			PRIMARY KEY,
	group_name		NVARCHAR(24)NOT NULL,
	direction		TINYINT		NOT NULL,

	-- ������ ������� ���� 
	CONSTRAINT FK_Groups_Directions FOREIGN KEY(direction) REFERENCES Directions(direction_id)
);

CREATE TABLE Students
(
	student_id		INT				PRIMARY KEY,
	last_name		NVARCHAR(50)	NOT NULL,
	first_name		NVARCHAR(50)	NOT NULL,
	middle_name		NVARCHAR(50)	NULL,
	birth_date		DATE			NOT NULL,
	[group]			INT				NOT NULL
	CONSTRAINT FK_Students_groups FOREIGN KEY REFERENCES Groups(group_id)
);

CREATE TABLE Teachers
(
	teacher_id		INT				PRIMARY KEY,
	last_name		NVARCHAR(50)	NOT NULL,
	first_name		NVARCHAR(50)	NOT NULL,
	middle_name		NVARCHAR(50)	NULL,
	birth_date		DATE			NOT NULL,
	work_sinse		DATE			NOT NULL
);

CREATE TABLE Disciplines
(
	discipline_id		SMALLINT		PRIMARY KEY,
	discipline_name		NVARCHAR(150)	NOT NULL,
	number_of_lessons	TINYINT			NOT NULL
);

CREATE TABLE RequredDisciplines
(
	discipline				SMALLINT,
	required_discipline		SMALLINT,
	PRIMARY KEY (discipline, required_discipline), -- ��������� ��������� ���� ����� ������� ������ ��� 
	CONSTRAINT FK_RD_Discipline_2_Discipline	FOREIGN KEY (discipline)			REFERENCES Disciplines(discipline_id),
	CONSTRAINT FK_RD_Required_2_Discipline		FOREIGN KEY (required_discipline)	REFERENCES Disciplines(discipline_id)
);

CREATE TABLE TeachersDisciplinesRelation
(
	teacher			INT,
	discipline		SMALLINT,
	PRIMARY KEY(teacher, discipline),
	CONSTRAINT FK_TDR_Teachers		FOREIGN KEY (teacher)		REFERENCES Teachers(teacher_id),
	CONSTRAINT FK_TDR_Discipline	FOREIGN KEY (discipline)	REFERENCES Disciplines(discipline_id)
);

CREATE TABLE DisciplinesDerectionsRelactions
(
	discipline		SMALLINT,
	direction		TINYINT,
	PRIMARY KEY(discipline, direction),
	CONSTRAINT FK_DDR_Disciplines		FOREIGN KEY (discipline)	REFERENCES Disciplines(discipline_id),
	CONSTRAINT FK_DDR_Directions		FOREIGN KEY (direction)		REFERENCES Directions(direction_id)
);

CREATE TABLE Schedule
(
	lesson_id		BIGINT			PRIMARY KEY,
	[date]			DATE		NOT NULL,
	[time]			TIME		NOT NULL,
	[group]			INT			NOT NULL CONSTRAINT FK_Schedule_groups		FOREIGN KEY REFERENCES Groups(group_id),
	discipline		SMALLINT	NOT NULL CONSTRAINT FK_Schedule_Disciplines FOREIGN KEY REFERENCES Disciplines(discipline_id),
	teacher			INT			NOT NULL CONSTRAINT FK_Schedule_Teachers	FOREIGN KEY REFERENCES Teachers(teacher_id),
	[subject]		NVARCHAR(256)	NULL,
	spent			BIT			NOT NULL
);

CREATE TABLE Grades
(
	student		INT		CONSTRAINT	FK_Grades_Students	FOREIGN KEY REFERENCES Students(student_id),
	lesson		BIGINT	CONSTRAINT	FK_Grades_Schedule	FOREIGN KEY REFERENCES Schedule(lesson_id),
	PRIMARY KEY (student, lesson),
	present		BIT		NOT NULL,
	grade_1		TINYINT	CONSTRAINT CK_Grade_1 CHECK (grade_1 > 0 AND grade_1 <= 12),
	grade_2		TINYINT	CONSTRAINT CK_Grade_2 CHECK (grade_2 > 0 AND grade_2 <= 12)
);

CREATE TABLE Exams
(
	PRIMARY KEY (student, discipline),
	student		INT			CONSTRAINT	FK_Exams_Students		FOREIGN KEY REFERENCES Students(student_id),
	discipline	SMALLINT	CONSTRAINT	FK_Exams_Discipline	FOREIGN KEY REFERENCES Disciplines(discipline_id),
	grade		TINYINT		CONSTRAINT CK_Grade CHECK (grade > 0 AND grade <= 12)
);
GO