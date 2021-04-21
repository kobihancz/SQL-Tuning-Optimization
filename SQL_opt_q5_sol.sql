USE springboardopt;

-- -------------------------------------
SET @v1 = 1612521;
SET @v2 = 1145072;
SET @v3 = 1828467;
SET @v4 = 'MGT382';
SET @v5 = 'Amber Hill';
SET @v6 = 'MGT';
SET @v7 = 'EE';			  
SET @v8 = 'MAT';

-- 5. List the names of students who have taken a course from department v6 (deptId), but not v7.

SELECT s.name 
FROM Student AS s
INNER JOIN (
	SELECT t.studId, 
		c.deptId 
    FROM Transcript AS t
    INNER JOIN Course As c
    ON t.crsCode = c.crsCode
    WHERE deptId = @v6
    AND studID NOT IN (
		SELECT t.studId,
		c.deptId 
    FROM Transcript AS t
    INNER JOIN Course As c
    ON t.crsCode = c.crsCode
    WHERE deptId = @v7)) AS a
ON s.id = a.studId


-- 1.The bottlenecks where mainly in the first SELECT * statement which I reduced to just selecting the name column,
-- the main bulk of the time delay was in the multiple and nested subquarys
-- 2.I identified them through the EXPLAIN ANALYZE operator and looked into the quaery plan, Identifying all the steps
-- that had the highest actual time
-- 3.In order to solve the bottleneck I reduced the nested double subqueary from 2 to 1, I also reduced the ammount of
-- joins from 4 to 2 and reduced the amount of unnecessary columns returned.  		
