USE VPD_311_Import;
SET DATEFIRST 1; -- устанавливает понедельник первым днём недели 
GO

ALTER PROCEDURE sp_SetCheduleForSemistacionar
	@group_name			AS	NVARCHAR(10),
	@discipline_name	AS	NVARCHAR(150),
	@start_date			AS	DATE,
	@start_time			AS	TIME,
	@teacher_last_name	AS	NVARCHAR(50),
	@day				AS	TINYINT
AS
BEGIN
	DECLARE @group				AS		INT			=	dbo.GetGroupID(@group_name);
	DECLARE @discipline			AS		SMALLINT	=	dbo.GetDisciplineID(@discipline_name);
	DECLARE @number_of_lessons	AS		TINYINT		=	dbo.GetNumberOfLessons(@discipline_name);
	DECLARE @teacher			AS		SMALLINT	=	dbo.GetTeachersID(@teacher_last_name);
	--DECLARE @start_date			AS		DATE		=	N'2024-04-7';
	DECLARE @date				AS		DATE		=	@start_date;
	DECLARE @time				AS		TIME(0)		=	@start_time;
	--DECLARE @data				AS		DATE		=	@start_date;
	
	PRINT(@group);
	PRINT(@discipline);
	PRINT(@number_of_lessons);
	PRINT(@teacher);
	PRINT(@start_date);
	PRINT(@time);
	PRINT('sp_SetCheduleForSemistacionar');
	PRINT('===================================');
	
	DECLARE @lesson_number		AS		TINYINT		=	0;
	WHILE (@lesson_number < @number_of_lessons)
	BEGIN
		PRINT(@date);
		PRINT(DATENAME(WEEKDAY, @date));
		PRINT(@lesson_number + 1);
		PRINT(@time);

		-------------------------------------
		SET @time = @start_time;
		EXEC sp_InsertLessonToSchedule @group, @discipline, @teacher, @date, @time;
		SET @lesson_number = @lesson_number + 1;
		
		----------------------------------------------
		PRINT(@lesson_number + 1);
		PRINT(@time);
		SET @time = DATEADD(MINUTE, 95, @time);
		EXEC sp_InsertLessonToSchedule @group, @discipline, @teacher, @date, @time;
		SET @lesson_number = @lesson_number + 1;

		-------------------------------------------
		PRINT(@lesson_number + 1);
		SET @time = DATEADD(MINUTE, 190, @time);
		EXEC sp_InsertLessonToSchedule @group, @discipline, @teacher, @date, @time;
		SET @lesson_number = @lesson_number + 1;
		PRINT('===================================');
		SET @date = DATEADD(WEEK, 1, @date);
		
		END
END