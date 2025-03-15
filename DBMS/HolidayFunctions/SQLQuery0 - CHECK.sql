USE VPD_311_Import;
GO
-- Выполнение процедуры для обновления данных на 2023 год
--EXEC dbo.UpdateHolidays @Year = 2024;
-- Проверка данных в таблице
SELECT * FROM Holidays;