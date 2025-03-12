USE VPD_311_Import;
GO

--Подсчитать количество преподавателей по каждой дисциплине;
SELECT DISTINCT
		[Дисциплина]	=	discipline_name,
		[Количество учетелей]		=	COUNT( teacher_id)
FROM Teachers, Disciplines, TeachersDisciplinesRelation
WHERE	teacher		=	teacher_id	
AND		discipline		=	discipline_id
GROUP BY discipline_name
;

--Для каждого преподавателя вывести количество дисциплин, которые он может читать;
SELECT DISTINCT
	[Учетеля]		=	last_name + ' ' + first_name,
	[Дисциплина]	=	COUNT (DISTINCT discipline_id)
FROM	Teachers , Disciplines , TeachersDisciplinesRelation 
WHERE	teacher		=	teacher_id	
AND		discipline		=	discipline_id
GROUP BY last_name, first_name
;

--Подсчитать количество преподавателей по каждому направлению обучения;
SELECT DISTINCT
	[Направление обучения]		=	direction_name,
	[Количество учителей]		=	COUNT(DISTINCT teacher_id)
FROM	Teachers, Disciplines, Directions, DisciplinesDirectionsRelation dd, TeachersDisciplinesRelation td
WHERE	dd.direction		=	direction_id
AND		td.teacher			=	teacher_id
AND		td.discipline		=	discipline_id
AND		dd.discipline		=	discipline_id
GROUP BY direction_name
;