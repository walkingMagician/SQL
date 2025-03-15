USE VPD_311_Import;
GO

-- ��������� ��� ���������� ������ �� ������� ���
ALTER PROCEDURE dbo.UpdateHolidays
    @Year INT --���������� ��� �������� ���� 
AS
BEGIN

    -- ������� ������� ����� �����������
    DELETE FROM Holidays;

    -- ���������� ��������
    INSERT INTO Holidays (HolidayName, StartDate, EndDate)
    VALUES ('���������� ��������', DATEFROMPARTS(@Year, 1, 1), DATEFROMPARTS(@Year, 1, 14));

    -- 23 �������
    INSERT INTO Holidays (HolidayName, StartDate, EndDate)
    VALUES ('23 �������', DATEFROMPARTS(@Year, 2, 23), DATEFROMPARTS(@Year, 2, 23));

    -- 8 �����
    INSERT INTO Holidays (HolidayName, StartDate, EndDate)
    VALUES ('8 �����', DATEFROMPARTS(@Year, 3, 8), DATEFROMPARTS(@Year, 3, 8));

    -- �����
    DECLARE @EasterDate DATE = dbo.GetEasterDate(@Year);
    INSERT INTO Holidays (HolidayName, StartDate, EndDate)
    VALUES ('�����', @EasterDate, DATEADD(DAY, 2, @EasterDate));

    -- ������� ���������
    INSERT INTO Holidays (HolidayName, StartDate, EndDate)
    VALUES ('������� ���������', DATEFROMPARTS(@Year, 5, 1), DATEFROMPARTS(@Year, 5, 10));

    -- ������ ��������
    INSERT INTO Holidays (HolidayName, StartDate, EndDate)
    VALUES ('������ ��������', DATEFROMPARTS(@Year, 7, 25), DATEFROMPARTS(@Year, 8, 7));
END;