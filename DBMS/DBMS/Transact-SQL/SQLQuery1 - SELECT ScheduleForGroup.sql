USE VPD_311_Import;
GO

CREATE PROCEDURE sp_SelectScheduleForGroup
-- sp_	- Stored Procedure
	@group_name		AS	NVARCHAR(10)
AS	
BEGIN
	SELECT 
			[������]		=	group_name,
			[����������]	=	discipline_name,
			[����]			=	[date],
			[�����]			=	[time],
			[����]			=	DATENAME(WEEKDAY, [date]),
			[�������������]	=	FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name),
			[������]		=	IIF(spent = 1, N'���������', N'��������������')
	FROM	Schedule, Groups, Disciplines, Teachers
	WHERE	[group]			=	group_id
	AND		discipline		=	discipline_id
	AND		teacher			=	teacher_id
	AND		group_name		=	@group_name
	ORDER BY [date]
	;
END