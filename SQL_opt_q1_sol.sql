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

-- 1. List the name of the student with id equal to v1 (id).
SELECT name 
FROM Student 
WHERE id = @v1;

-- 1.There was no Bottleneck in this Queary as It was a simple queary that filtered for the id in the @v1 placeholder
-- then returned the name associated with it. 
-- 2.I dentified that there was no problem by using the EXPLAIN ANALYZE operator to check the run time and queary plan 
-- 3.No bottleneck that needed to be resolved 
 