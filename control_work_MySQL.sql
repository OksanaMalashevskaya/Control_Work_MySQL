CREATE DATABASE IF NOT EXISTS control_work_mySQL ;
USE control_work_mySQL;
-- 1.Создайте функцию, которая принимает кол-во сек и далее переводит их в кол-во дней,часов,минут,секунд.
-- Пример:123456 ->'1 days 10 hours 17 minutes 36 seconds'
delimiter //
CREATE FUNCTION convert_seconds(INPUT_SECONDS INT) RETURNS VARCHAR(255)
deterministic
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds INT;

    -- Calculate days, hours, minutes and seconds
    SET days = FLOOR(INPUT_SECONDS / 86400);
    SET hours = FLOOR((INPUT_SECONDS % 86400) / 3600);
    SET minutes = FLOOR((INPUT_SECONDS % 3600) / 60);
    SET seconds = INPUT_SECONDS % 60;

    -- Return the formatted result
    RETURN CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
END // 

delimiter ;
SELECT convert_seconds(123456);

-- 2. Выведите только четные числа от 1 до 10. 
-- Пример: 2,4,6,8,10 


--- Решение второй задачи ---
DELIMITER $$
CREATE PROCEDURE Even_numbers(n INT)  


BEGIN
    SET @i := 2;
    SET @result := '';
    WHILE @i <= n DO
        SET @result = CONCAT(@result, ' ', @i);
        SET @i = @i + 2;
    END WHILE;

    IF n % 2 = 0 THEN
        SET @result = CONCAT(@result, ' ', n);
    END IF;

    SELECT TRIM(LEADING ' ' FROM @result);
END $$

DELIMITER ;

CALL Even_numbers(11);



