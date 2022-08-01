-- EX 1

SELECT COUNT("endDate") as currentExperiences from experiences;



-- EX 2


SELECT users.id, COUNT(users.id) AS educations FROM educations
JOIN users ON educations."userId"=users.id
GROUP BY users.id;


-- EX 3


SELECT users.name as writer,COUNT(users.name) as "testimonailCount" FROM testimonials t
JOIN users ON t."writerId" = users.id
WHERE users.id =435
GROUP BY users.id;


-- EX 4


SELECT MAX(jobs.salary) AS "maximumSalary",roles.name AS role
FROM jobs
JOIN roles
ON jobs."roleId"=roles.id
WHERE jobs.active=true
GROUP BY roles.name
ORDER BY "maximumSalary";


-- BÔNUS


SELECT s.name as school,
c.name as course,
COUNT(e.id) as "studentCount",
e.status
FROM educations e
JOIN schools s ON s.id=e."schoolId"
JOIN courses c ON c.id=e."courseId"
WHERE e.status='finished' OR e.status='ongoing'
GROUP BY c.id,s.id,e.status
ORDER BY "studentCount" DESC
LIMIT 3