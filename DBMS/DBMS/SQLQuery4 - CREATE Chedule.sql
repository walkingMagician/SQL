USE VPD_311_SQL;
GO

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
GO

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