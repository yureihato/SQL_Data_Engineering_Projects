SELECT * 
FROM ( 
  SELECT * 
  FROM job_postings_fact
  WHERE salary_year_avg IS NOT NULL 
  OR salary_hour_avg IS NOT NULL 
) AS valid_salaries
LIMIT 10 ;


WITH valid_salaries AS (
  SELECT * 
  FROM job_postings_fact
  WHERE salary_year_avg IS NOT NULL 
  OR salary_hour_avg IS NOT NULL 
)
SELECT * 
FROM valid_salaries
LIMIT 10; 



SELECT 
job_title_short,
salary_year_avg,
 ( SELECT 
  MEDIAN (salary_year_avg) 
  FROM job_postings_fact
) AS median_salary
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
 
LIMIT 10 ;



SELECT 
job_title_short,
MEDIAN(salary_year_avg) AS job_median_salary,
( SELECT MEDIAN (salary_year_avg) 
  FROM job_postings_fact
) AS median_salary
FROM (
  SELECT 
  job_title_short,
  salary_year_avg
  FROM job_postings_fact 
  WHERE job_work_from_home = TRUE) AS remote_median_salary
WHERE salary_year_avg IS NOT NULL
GROUP BY job_title_short
LIMIT 10 ;


SELECT 
    job_title_short,
    MEDIAN(salary_year_avg) AS job_median_salary,
    (
        SELECT MEDIAN(salary_year_avg) 
        FROM job_postings_fact 
        WHERE salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    ) AS remote_median_salary 

FROM job_postings_fact
WHERE 
    job_work_from_home = TRUE 
    AND salary_year_avg IS NOT NULL
GROUP BY job_title_short 
HAVING MEDIAN(salary_year_avg) > (
        SELECT MEDIAN(salary_year_avg) 
        FROM job_postings_fact 
        WHERE salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE )
ORDER BY job_median_salary DESC
LIMIT 10;


_________________________________________________________________________________________


WITH title_median AS (
    SELECT
        job_title_short,
        job_work_from_home,
        CAST (MEDIAN (salary_year_avg) AS INTEGER ) AS median_salary
    FROM job_postings_fact
    WHERE job_country = 'France'
    GROUP BY
        job_title_short,
        job_work_from_home
)
SELECT 
    r.job_title_short,
    r.median_salary AS remote_median_salary,
    o.median_salary AS onsite_median_salary,
    (r.median_salary - o.median_salary) AS remote_premium
FROM title_median AS r
INNER JOIN title_median AS o
    ON r.job_title_short = o.job_title_short
WHERE r.job_work_from_home = TRUE
  AND o.job_work_from_home = FALSE
ORDER BY remote_premium DESC;

_________________________________________________________________________________________


SELECT * 
FROM job_postings_fact AS jpf 
WHERE NOT EXISTS (
  SELECT 1 
  FROM skills_job_dim AS sjd 
  WHERE jpf.job_id = sjd.job_id
)
ORDER BY job_id ; 




