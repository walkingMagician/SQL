USE VPD_311_Import;
GO

--CREATE TRIGGER trg_PreventHolidayLesson
--ON Schedule
--INSTEAD OF INSERT, UPDATE
--AS
--BEGIN
    -- ���������, ���� �� ����������� � �����������
--   IF EXISTS (
--       SELECT 1
--       FROM inserted i
 --       JOIN Holidays h
--        ON i.date BETWEEN h.StartDate AND h.EndDate
--    )
--    BEGIN
        -- ���� ���� �����������, ������ ������ � �������� �������/����������
--        RAISERROR('���������� ������������� ���� �� ��������.', 16, 1);
--        ROLLBACK TRANSACTION;
--    END
--    ELSE
--    BEGIN
        -- ���� ����������� ���, ��������� �������/����������
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
    -- ���������, ���� �� ������, ������� �������� �������� ��� �������� �� ����������� ����
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN holidays h
        ON i.date BETWEEN h.StartDate AND h.EndDate
    )
    BEGIN
        -- ���� ����� ������ ����, �������� �������� � ������� ��������� �� ������
        RAISERROR('������ ������������� ���� �� ����������� ����.', 16, 1)
        ROLLBACK TRANSACTION
    END
END