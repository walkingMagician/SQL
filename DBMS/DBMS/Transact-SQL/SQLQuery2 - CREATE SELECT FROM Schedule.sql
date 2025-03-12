USE VPD_311_Import;
GO

CREATE PROCEDURE sp_SelectSchedule
-- sp_	- Stored Procedure
AS	
BEGIN
	SELECT 
			[Группа]		=	group_name,
			[Дисциплина]	=	discipline_name,
			[Дата]			=	[date],
			[время]			=	[time],
			[день]			=	DATENAME(WEEKDAY, [date]),
			[Преподаватель]	=	FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name),
			[Статус]		=	IIF(spent = 1, N'Проведено', N'Запланированно')
	FROM	Schedule, Groups, Disciplines, Teachers
	WHERE	[group]			=	group_id
	AND		discipline		=	discipline_id
	AND		teacher			=	teacher_id
	ORDER BY [date]
	;
END