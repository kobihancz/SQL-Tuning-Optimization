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

-- 4. List the names of students who have taken a course taught by professor v5 (name).
SELECT s.name
FROM Student AS s
INNER JOIN Transcript AS t
ON s.id = t.studId
WHERE t.crsCode IN (
	SELECT crsCode 
	FROM Professor AS p
	INNER JOIN Teaching AS t
	ON p.id = t.profId
	WHERE name = @v5);
    