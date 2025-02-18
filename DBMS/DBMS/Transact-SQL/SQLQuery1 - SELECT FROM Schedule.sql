USE VPD_311_Import;
GO

SELECT 
		[Група]				=	group_name,
		[Дисципоина]		=	discipline_name,
		[Преподаватель]		=	last_name + ' ' + first_name + ' ' + middle_name,
		[Дата]				=	[date],
		[Время]				=	[time],
		[Статус]			=	IIF(spent = 1 , N'Проведено', N'запланоровано') --Тернарный оператор
FROM	Schedule, Groups, Disciplines, Teachers
WHERE	[group]				=	group_id
AND		discipline			=	discipline_id
AND		teacher				=	teacher_id