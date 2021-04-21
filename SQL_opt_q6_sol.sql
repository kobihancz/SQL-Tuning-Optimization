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

-- 6. List the names of students who have taken all courses offered by department v8 (deptId).
SELECT name FROM Student
JOIN Transcript
	ON Student.id = Transcript.studId
		WHERE crsCode IN
		(SELECT crsCode FROM Course WHERE deptId = @v8 AND crsCode IN (SELECT crsCode FROM Teaching))
		GROUP BY studId
		HAVING COUNT(*) = 
			(SELECT COUNT(*) FROM Course WHERE deptId = @v8 AND crsCode IN (SELECT crsCode FROM Teaching));
            
-- 1. The bottleneck was in the first subqueary whih i changed to a join on studId between the transcript and students table 
-- 2. I identified them through the EXPLAIN ANALYZE operator and looked into the quaery plan, Identifying all the steps
-- that had the highest actual time
-- 3. In order to solve the bottleneck I reduced the initial subqueary to a join the is reduced the need for the where clause at
-- the end of the queary 
