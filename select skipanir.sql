-- Liður 1 og 2 see HOPVERKEFNI.SQL
-- Liður 3. -Virkar
SELECT `MOVIE_TITLE`,`MOVIE_YEAR`,`MOVIE_COST`
FROM `MOVIE`
WHERE `MOVIE_TITLE` LIKE '%hope%';
-- Liður 4. -Virkar
SELECT `MOVIE_TITLE`, `MOVIE_YEAR`, `MOVIE_GENRE`
FROM `MOVIE`
WHERE `MOVIE_GENRE` = "ACTION";
-- Liður 5. -Virkar
SELECT `MOVIE_NUM`, `MOVIE_TITLE`,  `MOVIE_COST`
FROM  `MOVIE`
WHERE `MOVIE_COST` > 40;
-- Liður 6. -Virkar
SELECT `MOVIE_NUM`, `MOVIE_TITLE`, `MOVIE_COST`, `MOVIE_GENRE`
FROM `MOVIE`
WHERE `MOVIE_COST` < 50
ORDER BY `MOVIE_GENRE`;
-- liður 7. -Virkar 
SELECT `MOVIE_NUM`, CONCAT(`MOVIE_TITLE`,' ','(', YEAR(`MOVIE_YEAR`),') ', `MOVIE_GENRE`) AS `MOVIE_DESCRIPTION`
FROM `MOVIE`;
-- Liður 8. -Virkar
SELECT `MOVIE_GENRE`, COUNT(*) AS `NUMBER OF MOVIES`
FROM `MOVIE`
GROUP BY `MOVIE_GENRE`
ORDER BY  `NUMBER OF MOVIES` DESC;
-- Liður 9. - Virkar
SELECT CAST(AVG(`MOVIE_COST`) AS DECIMAL(10,4)) AS `AVRAGE MOVIE COST`
FROM `MOVIE`;
-- Liður 10. -Virkar
SELECT `MOVIE_GENRE`, CAST(AVG(`MOVIE_COST`) AS DECIMAL(10,2)) AS `AVRAGE COST`
FROM `MOVIE`
GROUP BY `MOVIE_GENRE`
ORDER BY `AVRAGE COST` DESC;
-- Liður 11. -Virkar
SELECT `MOVIE_TITLE`, `MOVIE_GENRE`, `PRICE`.`PRICE_DESCRIPTION`, `PRICE`.`PRICE_RENTFEE`
FROM `MOVIE`
INNER JOIN `PRICE` ON `MOVIE`.`PRICE_CODE` = `PRICE`.`PRICE_CODE`;
-- Liður 12. -Virkar
SELECT `MOVIE_GENRE`, CAST(AVG(`PRICE`.`PRICE_RENTFEE`) AS DECIMAL(10,2)) AS `AVRAGE RENTAL FEE`
FROM `MOVIE`
INNER JOIN `PRICE` ON `MOVIE`.`PRICE_CODE` = `PRICE`.`PRICE_CODE`
GROUP BY `MOVIE_GENRE`
ORDER BY `AVRAGE RENTAL FEE` DESC;
-- Liður 13 -Virkar
SELECT `MOVIE_TITLE`, YEAR(`MOVIE_YEAR`) AS `MOVIE_YEAR`, CAST((`MOVIE_COST`/`PRICE`.`PRICE_RENTFEE`)AS DECIMAL(10,2)) AS `BREAKEVEN RENTALS`
FROM `MOVIE`
INNER JOIN `PRICE` ON `MOVIE`.`PRICE_CODE` = `PRICE`.`PRICE_CODE`
ORDER BY `BREAKEVEN RENTALS` DESC;
-- Liður 14.
SELECT `MOVIE_TITLE`,YEAR(`MOVIE_YEAR`) AS `MOVIE_YEAR`
FROM `MOVIE`
INNER JOIN `PRICE` ON `MOVIE`.`PRICE_CODE` = `PRICE`.`PRICE_CODE`
WHERE `PRICE`.`PRICE_CODE` IS NOT NULL
ORDER BY `MOVIE_YEAR` DESC;
-- Liður 15. -Virkar
SELECT `MOVIE_TITLE`, `MOVIE_YEAR`, `MOVIE_COST`
FROM `MOVIE`
WHERE `MOVIE_COST` BETWEEN 44.99 AND 49.99;
-- Liður 16. -Virkar
SELECT `MOVIE_TITLE`, YEAR(`MOVIE_YEAR`) AS `MOVIE_YEAR`, `PRICE`.`PRICE_DESCRIPTION`,`PRICE`.`PRICE_RENTFEE`,`MOVIE_GENRE`
FROM `MOVIE`
INNER JOIN `PRICE` ON `MOVIE`.`PRICE_CODE`= `PRICE`.`PRICE_CODE`
WHERE `MOVIE_GENRE` = "FAMILY" OR `MOVIE_GENRE` = "DRAMA" OR `MOVIE_GENRE` = "COMEDY";
-- Liður 17. -Virkar.
SELECT MIN(`MEM_BALANCE`) AS `MINIMUM BALANCE` ,MAX(`MEM_BALANCE`) AS `MAXIMUM BALANCE` ,CAST(AVG(`MEM_BALANCE`) AS DECIMAL(10,2)) AS `AVRAGE BALANCE` 
FROM `MEMEBERSHIP`;
-- Liður 18. -Virkar
SELECT CONCAT(`MEM_FNAME`, ' ', `MEM_LNAME`) AS `MEMBERSHIP NAME`, CONCAT(`MEM_STREET`, ' ', `MEM_STATE`,' ', `MEM_ZIP` ) AS `MEMBERSHIP ADDRESS`
FROM `MEMEBERSHIP`;
-- Liður 19. -Virkar 
SELECT `RENTAL`.`RENT_NUM`, `RENTAL`.`RENT_DATE`, `VIDEO`.`VID_NUM`, `MOVIE`.`MOVIE_TITLE`, `DETAILRENTAL`.`DETAIL_DUEDATE`, `DETAILRENTAL`.`DETAIL_RETURNDATE`
FROM `DETAILRENTAL`
INNER JOIN `RENTAL` ON `DETAILRENTAL`.`RENT_NUM` = `RENTAL`.`RENT_NUM`
INNER JOIN `VIDEO` ON `DETAILRENTAL`.`VID_NUM`  = `VIDEO`.`VID_NUM`
INNER JOIN `MOVIE` ON `VIDEO`.`MOVIE_NUM` = `MOVIE`.`MOVIE_NUM`
WHERE `DETAILRENTAL`.`DETAIL_DUEDATE` < `DETAILRENTAL`.`DETAIL_RETURNDATE`;
-- Liður 20. -Virkar
SELECT `RENTAL`.`RENT_NUM`, `RENTAL`.`RENT_DATE`, `VIDEO`.`VID_NUM`, `MOVIE`.`MOVIE_TITLE`, `DETAILRENTAL`.`DETAIL_DUEDATE`, `DETAILRENTAL`.`DETAIL_RETURNDATE`, (`DETAILRENTAL`.`DETAIL_RETURNDATE`-`DETAILRENTAL`.`DETAIL_DUEDATE`) AS `DAYS PAST DUEDATE`
FROM `DETAILRENTAL`
INNER JOIN `RENTAL` ON `DETAILRENTAL`.`RENT_NUM` = `RENTAL`.`RENT_NUM`
INNER JOIN `VIDEO` ON `DETAILRENTAL`.`VID_NUM`  = `VIDEO`.`VID_NUM`
INNER JOIN `MOVIE` ON `VIDEO`.`MOVIE_NUM` = `MOVIE`.`MOVIE_NUM`
WHERE `DETAILRENTAL`.`DETAIL_DUEDATE` < `DETAILRENTAL`.`DETAIL_RETURNDATE`;
-- Liður 21. -Virkar
SELECT `RENTAL`.`RENT_NUM`, `RENTAL`.`RENT_DATE`, `MOVIE`.`MOVIE_TITLE`, `PRICE`.`PRICE_RENTFEE` AS `DETAIL_FEE`
FROM `DETAILRENTAL`
INNER JOIN `RENTAL` ON `DETAILRENTAL`.`RENT_NUM` = `RENTAL`.`RENT_NUM`
INNER JOIN `VIDEO` ON `DETAILRENTAL`.`VID_NUM`  = `VIDEO`.`VID_NUM`
INNER JOIN `MOVIE` ON `VIDEO`.`MOVIE_NUM` = `MOVIE`.`MOVIE_NUM`
INNER JOIN `PRICE` ON `MOVIE`.`PRICE_CODE`= `PRICE`.`PRICE_CODE`
WHERE `DETAILRENTAL`.`DETAIL_DUEDATE` > `DETAILRENTAL`.`DETAIL_RETURNDATE`;
-- Liður 22. -Virkar
SELECT `MEMEBERSHIP`.`MEM_NUM`, `MEMEBERSHIP`.`MEM_LNAME`, `MEMEBERSHIP`.`MEM_FNAME`,  SUM(`PRICE`.`PRICE_RENTFEE`) AS `RENTAL FEE REVENUE`
FROM `MEMEBERSHIP`
INNER JOIN `RENTAL` ON `MEMEBERSHIP`.`MEM_NUM` =`RENTAL`.`MEM_NUM`
INNER JOIN `DETAILRENTAL` ON `RENTAL`.`RENT_NUM`=`DETAILRENTAL`.`RENT_NUM`
INNER JOIN `VIDEO` ON `DETAILRENTAL`.`VID_NUM`  = `VIDEO`.`VID_NUM`
INNER JOIN `MOVIE` ON `VIDEO`.`MOVIE_NUM` = `MOVIE`.`MOVIE_NUM`
INNER JOIN `PRICE` ON `MOVIE`.`PRICE_CODE`= `PRICE`.`PRICE_CODE`
WHERE `DETAILRENTAL`.`DETAIL_DUEDATE` > `DETAILRENTAL`.`DETAIL_RETURNDATE`
GROUP BY `MEMEBERSHIP`.`MEM_NUM`;
-- Liður 23. -Virkar
SELECT `MOVIE_NUM`, `G`.`MOVIE_GENRE`, CAST(`AC` AS DECIMAL(10,2)) AS `AVRAGE COST` , `MOVIE_COST`, CAST((`MOVIE_COST`-`AC`)/`AC`*100 AS DECIMAL(10,2)) AS `PRECENTAGE DIFFREANCE`
FROM`MOVIE` `G`, (SELECT `MOVIE_GENRE`, AVG(`MOVIE_COST`) AS `AC` FROM`MOVIE` GROUP BY  `MOVIE_GENRE`) `J` 
WHERE `G`.`MOVIE_GENRE` = `J`.`MOVIE_GENRE`; 
-- Liður 24. -Virkar
ALTER TABLE `DETAILRENTAL`
ADD `DETAIL_DAYSLATE` INT(3) NULL;
-- Liður 25. -Virkar
ALTER TABLE `VIDEO`
ADD `VID_STATUS` VARCHAR(4) DEFAULT 'IN' NOT NULL
CHECK  (`VID_STATUS` = 'IN' OR `VID_STATUS` = 'OUT' OR `VID_STATUS` = 'LOST');
-- Liður 26. -Virkar
UPDATE `VIDEO`
SET `VID_STATUS` = 'OUT'
WHERE `VID_NUM` IN (SELECT `VID_NUM` FROM `DETAILRENTAL` WHERE `DETAIL_RETURNDATE` IS NULL);
-- Liður 27. -Virkar
ALTER TABLE `PRICE` 
ADD `PRICE_RENTDAYS` INT(2) DEFAULT 3 NOT NULL;
-- Liður 28 -Virkar
UPDATE `PRICE`
SET `PRICE_RENTDAYS` = 5
WHERE `PRICE_CODE` IN (1,3);

UPDATE `PRICE`
SET `PRICE_RENTDAYS` = 7
WHERE `PRICE_CODE` = 4;
--  Liður 29
CREATE TRIGGER TRG_LATE_RETURN
BEFORE UPDATE OF DETAIL_RETURNDATE, DETAIL_DUEDATE ON DETAILRENTAL
FOR EACH ROW 
BEGIN
IF :NEW.DETAIL_RETURNDATE IS NULL THEN
	:NEW.DETAIL_DAYSLATE:=NULL;
ELSIF Trunc(:NEW.DETAIL_RETURNDATE) <= Trunc(:NEW.DETAIL_DUEDATE)
	OR (Trunc(:NEW.DETAIL_RETURNDATE) = Trunc(:NEW.DETAIL_DUEDATE) + 1
	AND To_CHAR(:NEW.DETAIL_RETURNDATE, 'HH24:MI:SS') <= '12:00:00') THEN
	:NEW.DETAIL_DAYSLATE :=0;
	ELSE
	:NEW.DETAIL_DAYSLATE := Trunc(:NEW.DETAIL_RETURNDATE)-
	Trunc(:NEW.DETAIL_DUEDATE);
END IF;	
END;
