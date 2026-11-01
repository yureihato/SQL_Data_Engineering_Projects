-- MOST SALARY DEMAND OPTIMAL SKILLS FOR DATA ENGINEERING 



SELECT 
sd.skills,
ROUND (MEDIAN(jpf.salary_year_avg) , 0 ) AS median_salary ,
COUNT(jpf.salary_year_avg) AS demand_count , 
ROUND((MEDIAN(jpf.salary_year_avg) * log(COUNT(jpf.salary_year_avg)))/ 100_000  , 1 )  AS optimal_score
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd 
  ON jpf.job_id = sjd.job_id 
INNER JOIN skills_dim AS sd
  ON sjd.skill_id = sd.skill_id
WHERE
  jpf.job_title_short = 'Data Engineer'
--AND
  --jpf.job_location IN ('France')
AND 
  jpf.job_work_from_home = True
GROUP BY 
  sd.skills
HAVING 
  demand_count > 100
ORDER BY 
  optimal_score DESC
LIMIT 25;



/* 

-Terraform hits the #1 spot with an impressive 4.2 optimal score, driven heavily by a leading $184,000 median salary. This highlights a critical market trend: companies are willing to pay top-dollar for remote engineers who can automate cloud infrastructure
-Cloud providers and heavy data engineering infrastructure like AWS ($137k, score 4.0), Airflow ($150k, score 3.9), and Spark ($140k, score 3.8) cluster closely at the top. Orchestration and processing frameworks command significant financial premiums.
-While foundational tools like SQL are essential, specialized data engineering tooling commands a distinct financial bump. Airflow ($150k) and Kafka ($145k) show that pipeline orchestration and real-time streaming technologies are major salary drivers for remote data engineering roles compared to standard database querying alone


┌────────────┬───────────────┬──────────────┬───────────────┐
│   skills   │ median_salary │ demand_count │ optimal_score │
│  varchar   │    double     │    int64     │    double     │
├────────────┼───────────────┼──────────────┼───────────────┤
│ terraform  │      184000.0 │          193 │           4.2 │
│ python     │      135000.0 │         1133 │           4.1 │
│ sql        │      130000.0 │         1128 │           4.0 │
│ aws        │      137320.0 │          783 │           4.0 │
│ airflow    │      150000.0 │          386 │           3.9 │
│ spark      │      140000.0 │          503 │           3.8 │
│ kafka      │      145000.0 │          292 │           3.6 │
│ snowflake  │      135500.0 │          438 │           3.6 │
│ azure      │      128000.0 │          475 │           3.4 │
│ java       │      135000.0 │          303 │           3.3 │
│ scala      │      137290.0 │          247 │           3.3 │
│ kubernetes │      150500.0 │          147 │           3.3 │
│ git        │      140000.0 │          208 │           3.2 │
│ redshift   │      130000.0 │          274 │           3.2 │
│ databricks │      132750.0 │          266 │           3.2 │
│ nosql      │      134415.0 │          193 │           3.1 │
│ hadoop     │      135000.0 │          198 │           3.1 │
│ pyspark    │      140000.0 │          152 │           3.1 │
│ gcp        │      136000.0 │          196 │           3.1 │
│ mongodb    │      135750.0 │          136 │           2.9 │
│ r          │      134775.0 │          133 │           2.9 │
│ go         │      140000.0 │          113 │           2.9 │
│ docker     │      135000.0 │          144 │           2.9 │
│ github     │      135000.0 │          127 │           2.8 │
│ bigquery   │      135000.0 │          123 │           2.8 │
└────────────┴───────────────┴──────────────┴───────────────┘
  25 rows                                         4 columns
  */
