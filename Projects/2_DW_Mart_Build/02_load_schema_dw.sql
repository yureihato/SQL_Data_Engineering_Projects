-- load csv files into tables


INSERT INTO company_dim( company_id , name )
SELECT company_id , name
FROM read_csv('https://storage.googleapis.com/sql_de/company_dim.csv',
      AUTO_DETECT=true) ; 


INSERT INTO skills_dim ( skill_id , skills , type) 
SELECT skill_id , skills , type 
FROM read_csv('https://storage.googleapis.com/sql_de/skills_dim.csv',
      AUTO_DETECT=true) ;

INSERT INTO job_postings_fact( 
job_id, company_id, job_title_short, job_title, job_location,
job_via, job_schedule_type, job_work_from_home, search_location,
job_posted_date, job_no_degree_mention, job_health_insurance,
job_country, salary_rate, salary_year_avg, salary_hour_avg
)
SELECT 
job_id, company_id, job_title_short, job_title, job_location,
job_via, job_schedule_type, job_work_from_home, search_location,
job_posted_date, job_no_degree_mention, job_health_insurance,
job_country, salary_rate, salary_year_avg, salary_hour_avg 
FROM read_csv('https://storage.googleapis.com/sql_de/job_postings_fact.csv',
      AUTO_DETECT=true) ;


INSERT INTO skills_job_dim (job_id , skill_id
)
SELECT job_id , skill_id 
FROM read_csv('https://storage.googleapis.com/sql_de/skills_job_dim.csv',
      AUTO_DETECT=true) ;



SELECT 'Company Dim' AS table_name, COUNT(*) AS record_count FROM company_dim
UNION ALL
SELECT 'Skills Dim', COUNT(*) FROM skills_dim
UNION ALL
SELECT 'Job Postings Fact', COUNT(*) FROM job_postings_fact
UNION ALL
SELECT 'Skills Job Dim', COUNT(*) FROM skills_job_dim;

SELECT '==COMPANY DIM SAMPLE' AS info ;
SELECT * FROM company_dim LIMIT 5 ; 
SELECT '==SKILLS DIM SAMPLE'AS info ;
SELECT * FROM skills_dim LIMIT 5 ; 
SELECT '==SKILLS JOB DIM SAMPLE' AS info ;
SELECT * FROM skills_job_dim LIMIT 5 ; 
SELECT '==JOB POSTINGS FACT SAMPLE' AS info ;
SELECT * FROM job_postings_fact LIMIT 5 ; 

