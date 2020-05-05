SELECT name FROM teacher WHERE dept IS NULL;

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id);

SELECT teacher.name, dept.name FROM teacher
LEFT OUTER JOIN dept ON teacher.dept = dept.id;

SELECT teacher.name, dept.name FROM teacher RIGHT OUTER JOIN dept ON teacher.dept = dept.id;

SELECT teacher.name, COALESCE(mobile, '07986 444 2266') AS mobile_number FROM teacher;

SELECT teacher.name, COALESCE(dept.name, 'None') AS Department FROM teacher
LEFT OUTER JOIN dept ON teacher.dept = dept.id;

SELECT COUNT(teacher.name), COUNT(teacher.mobile) FROM teacher;

SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT OUTER JOIN dept ON teacher.dept = dept.id
GROUP BY dept.name;

SELECT teacher.name,
 CASE
  WHEN dept IN (1, 2) THEN 'Sci'
  ELSE 'Art'
 END AS category
FROM teacher;

SELECT teacher.name,
 CASE
  WHEN teacher.dept IN (1, 2) THEN 'Sci'
  WHEN teacher.dept = 3 THEN 'Art'
  ELSE 'None'
 END AS category
FROM teacher;
