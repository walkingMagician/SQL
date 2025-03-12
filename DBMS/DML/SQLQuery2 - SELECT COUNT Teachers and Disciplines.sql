USE VPD_311_Import;
GO

--���������� ���������� �������������� �� ������ ����������;
SELECT DISTINCT
		[����������]	=	discipline_name,
		[���������� ��������]		=	COUNT( teacher_id)
FROM Teachers, Disciplines, TeachersDisciplinesRelation
WHERE	teacher		=	teacher_id	
AND		discipline		=	discipline_id
GROUP BY discipline_name
;

--��� ������� ������������� ������� ���������� ���������, ������� �� ����� ������;
SELECT DISTINCT
	[�������]		=	last_name + ' ' + first_name,
	[����������]	=	COUNT (DISTINCT discipline_id)
FROM	Teachers , Disciplines , TeachersDisciplinesRelation 
WHERE	teacher		=	teacher_id	
AND		discipline		=	discipline_id
GROUP BY last_name, first_name
;

--���������� ���������� �������������� �� ������� ����������� ��������;
SELECT DISTINCT
	[����������� ��������]		=	direction_name,
	[���������� ��������]		=	COUNT(DISTINCT teacher_id)
FROM	Teachers, Disciplines, Directions, DisciplinesDirectionsRelation dd, TeachersDisciplinesRelation td
WHERE	dd.direction		=	direction_id
AND		td.teacher			=	teacher_id
AND		td.discipline		=	discipline_id
AND		dd.discipline		=	discipline_id
GROUP BY direction_name
;