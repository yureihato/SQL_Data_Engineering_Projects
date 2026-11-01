-- TOP PAYING SKILLS FOR DATA ENGINEERING 



SELECT 
sd.skills,
ROUND (MEDIAN(jpf.salary_year_avg) , 0 ) AS median_salary ,
COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd 
  ON jpf.job_id = sjd.job_id 
INNER JOIN skills_dim AS sd
  ON sjd.skill_id = sd.skill_id
WHERE
  jpf.job_title_short = 'Data Engineer'
AND
  jpf.job_location IN ('France')
GROUP BY 
  sd.skills
HAVING 
  demand_count > 100
ORDER BY 
  median_salary DESC
LIMIT 25;


/*

-Top Earners (€147,500): Spark, Scala, PostgreSQL, and Elasticsearch sit at the absolute peak of compensation for French data roles
-The Spark & Scala Synergy: Unlike the global remote data results where infrastructure tools like Terraform dominated, the top-paying stack in France heavily leans into heavy distributed processing and JVM-based data engineering (Spark + Scala with over 730+ listings each at top-tier pay)
-BI and Visualization Tools like Power BI (€146k), Tableau (€146k), and R (€146k) command surprisingly high median salaries in France for positions tagged as Data Engineering. This suggests that senior data engineering roles in French markets often require bridging the gap into analytics engineering and reporting architecture
-The Salary Drop-off (Linux, Kubernetes, SQL Server): Technologies like Kubernetes, Linux, and SQL Server showing lower medians (~€34,560) likely reflect a reporting quirk in the dataset where salary disclosures are sparse, entry-level/IT-support roles are misclassified, or part-time/contract postings distort the annual average



┌───────────────┬───────────────┬──────────────┐
│    skills     │ median_salary │ demand_count │
│    varchar    │    double     │    int64     │
├───────────────┼───────────────┼──────────────┤
│ postgresql    │      147500.0 │          159 │
│ scala         │      147500.0 │          738 │
│ elasticsearch │      147500.0 │          112 │
│ spark         │      147500.0 │         1063 │
│ power bi      │      146000.0 │          262 │
│ tableau       │      146000.0 │          196 │
│ r             │      146000.0 │          133 │
│ aws           │      122472.0 │          744 │
│ java          │      122472.0 │          693 │
│ kafka         │      122472.0 │          463 │
│ python        │      121722.0 │         1493 │
│ jenkins       │       97444.0 │          215 │
│ ansible       │       97444.0 │          166 │
│ terraform     │       97444.0 │          219 │
│ docker        │       97444.0 │          418 │
│ nosql         │       97444.0 │          410 │
│ git           │       97444.0 │          386 │
│ gcp           │       97444.0 │          624 │
│ sql           │       94972.0 │         1457 │
│ azure         │       94972.0 │          765 │
│ github        │       92500.0 │          112 │
│ hadoop        │       66002.0 │          639 │
│ sql server    │       34560.0 │          222 │
│ kubernetes    │       34560.0 │          361 │
│ linux         │       34560.0 │          181 │
└───────────────┴───────────────┴──────────────┘
  25 rows                            3 columns
  */


