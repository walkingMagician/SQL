USE VPD_311_SQL;
GO

INSERT Directions
		(direction_id, direction_name) 
VALUES	(1,			   N'Разработка програмного обеспечения'),
		(2,			   N'Сетевые тихнологии и системное обеспечение'),
		(3,			   N'Компьтерная графика и дизайн')
;
GO

SELECT * FROM Directions;