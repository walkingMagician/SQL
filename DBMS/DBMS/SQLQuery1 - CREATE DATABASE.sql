USE master 
GO


CREATE DATABASE VPD_311_SQL 
ON -- определяем параметры файла базы данных 
(
	NAME = VPD_311_SQL,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\VPD_311_SQL.mdf',
	SIZE = 8MB,
	MAXSIZE = 500MB,
	FILEGROWTH = 8MB
)
LOG ON -- определяем параметры файла журнала базы данных 
(
	NAME = VPD_311_SQL_Log,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\VPD_311_SQL_log.ldf',
	SIZE = 8MB,
	MAXSIZE = 500MB,
	FILEGROWTH = 8MB
)
