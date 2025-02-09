USE VPD_311_SQL;
GO

CREATE TABLE Groups
(
	group_id		int			PRIMARY KEY,
	group_name		NVARCHAR(24)NOT NULL,
	direction		TINYINT		NOT NULL,

	-- создаём внешний ключ 
	CONSTRAINT FK_Groups_Directions FOREIGN KEY(direction) REFERENCES Directions(direction_id)
);