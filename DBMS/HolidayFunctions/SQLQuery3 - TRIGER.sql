USE VPD_311_Import;
GO

--CREATE TRIGGER trg_PreventHolidayLesson
--ON Schedule
--INSTEAD OF INSERT, UPDATE
--AS
--BEGIN
    -- Проверяем, есть ли пересечение с праздниками
--   IF EXISTS (
--       SELECT 1
--       FROM inserted i
 --       JOIN Holidays h
--        ON i.date BETWEEN h.StartDate AND h.EndDate
--    )
--    BEGIN
        -- Если есть пересечение, выдаем ошибку и отменяем вставку/обновление
--        RAISERROR('Невозможно запланировать урок на праздник.', 16, 1);
--        ROLLBACK TRANSACTION;
--    END
--    ELSE
--    BEGIN
        -- Если пересечения нет, выполняем вставку/обновление
--        INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time], spent)
--        SELECT lesson_id, [group], discipline, teacher, [date], [time], spent
--        FROM inserted;
--    END
--END;


CREATE TRIGGER trg_PreventLessonsOnHolidays
ON Schedule
AFTER INSERT, UPDATE
AS
BEGIN
    -- Проверяем, есть ли записи, которые пытаются вставить или обновить на праздничный день
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN holidays h
        ON i.date BETWEEN h.StartDate AND h.EndDate
    )
    BEGIN
        -- Если такие записи есть, отменяем операцию и выводим сообщение об ошибке
        RAISERROR('Нельзя запланировать урок на праздничный день.', 16, 1)
        ROLLBACK TRANSACTION
    END
END