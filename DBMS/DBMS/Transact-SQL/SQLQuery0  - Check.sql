USE VPD_311_Import;
SET DATEFIRST 1;
GO


--EXEC sp_SelectScheduleForGroup N'VPD_311';
--EXEC sp_SetCheduleForSemistacionar N'VPD_311', N'%UML%', '2024-08-25', '12:00', N'Ковтун', 7
--EXEC sp_SetCheduleForSemistacionar N'VPD_311', N'%Hardware%', '2024-01-01', '12:00', N'Ковтун', 7
EXEC sp_SelectScheduleForGroup N'VPD_311';
--EXEC sp_SelectSchedule;
--EXEC sp_SelectDisciplineForGroup N'VPD_311', N'Объектно%';
