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

-- 3. List the names of students who have taken course v4 (crsCode).
SELECT name 
FROM Student AS s
INNER JOIN Transcript AS t
ON s.id = t.studId 
WHERE crsCode = @v4;

-- 1.The bottle neck in this query is resulting from the WHERE clause or more specifically the subqueary in the 
-- WHERE clause
-- 2.I identified it by running the EXPLAIN ANALYZE operator, which showed that the actual time of the SUBQUEARY
-- was .090-.091
-- 3.In order to reslove the bottleneck I got rid of the subqueary and added an INNER JOIN on the id columns in 
-- both the student and transcript table, then filtered for the crsCode