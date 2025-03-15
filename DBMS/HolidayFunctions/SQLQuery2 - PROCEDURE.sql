USE VPD_311_Import;
GO

-- Процедура для обновления данных на текущий год
ALTER PROCEDURE dbo.UpdateHolidays
    @Year INT --переменная для введения года 
AS
BEGIN

    -- Очистка таблицы перед обновлением
    DELETE FROM Holidays;

    -- Новогодние каникулы
    INSERT INTO Holidays (HolidayName, StartDate, EndDate)
    VALUES ('Новогодние каникулы', DATEFROMPARTS(@Year, 1, 1), DATEFROMPARTS(@Year, 1, 14));

    -- 23 Февраля
    INSERT INTO Holidays (HolidayName, StartDate, EndDate)
    VALUES ('23 Февраля', DATEFROMPARTS(@Year, 2, 23), DATEFROMPARTS(@Year, 2, 23));

    -- 8 Марта
    INSERT INTO Holidays (HolidayName, StartDate, EndDate)
    VALUES ('8 Марта', DATEFROMPARTS(@Year, 3, 8), DATEFROMPARTS(@Year, 3, 8));

    -- Пасха
    DECLARE @EasterDate DATE = dbo.GetEasterDate(@Year);
    INSERT INTO Holidays (HolidayName, StartDate, EndDate)
    VALUES ('Пасха', @EasterDate, DATEADD(DAY, 2, @EasterDate));

    -- Майские праздники
    INSERT INTO Holidays (HolidayName, StartDate, EndDate)
    VALUES ('Майские праздники', DATEFROMPARTS(@Year, 5, 1), DATEFROMPARTS(@Year, 5, 10));

    -- Летние каникулы
    INSERT INTO Holidays (HolidayName, StartDate, EndDate)
    VALUES ('Летние каникулы', DATEFROMPARTS(@Year, 7, 25), DATEFROMPARTS(@Year, 8, 7));
END;