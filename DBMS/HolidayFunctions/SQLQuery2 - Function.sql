USE VPD_311_Import;
GO

CREATE FUNCTION dbo.GetEasterDate(@Year INT)
RETURNS DATE
AS
BEGIN
    DECLARE @a INT, @b INT, @c INT, @d INT, @e INT, @f INT, @g INT, @h INT, @i INT, @k INT, @l INT, @m INT;
    DECLARE @Month INT, @Day INT;

    SET @a = @Year % 19;
    SET @b = @Year / 100;
    SET @c = @Year % 100;
    SET @d = @b / 4;
    SET @e = @b % 4;
    SET @f = (@b + 8) / 25;
    SET @g = (@b - @f + 1) / 3;
    SET @h = (19 * @a + @b - @d - @g + 15) % 30;
    SET @i = @c / 4;
    SET @k = @c % 4;
    SET @l = (32 + 2 * @e + 2 * @i - @h - @k) % 7;
    SET @m = (@a + 11 * @h + 22 * @l) / 451;
    SET @Month = (@h + @l - 7 * @m + 114) / 31;
    SET @Day = ((@h + @l - 7 * @m + 114) % 31) + 1;

    RETURN DATEFROMPARTS(@Year, @Month, @Day);
END;