USE VPD_311_Import;
GO

CREATE TABLE Holidays (
    HolidayID INT IDENTITY(1,1) PRIMARY KEY,
    HolidayName NVARCHAR(100),
    StartDate DATE,
    EndDate DATE
);