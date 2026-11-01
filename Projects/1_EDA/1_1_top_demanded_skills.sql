-- TOP 10 IN DEMAND SKILLS FOR DATA ENGINEERING IN FRANCE


SELECT 
sd.skills,
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
ORDER BY 
  demand_count DESC
LIMIT 10;


/*

-Python (1,493 listings) and SQL (1,457 listings) are practically tied at the very top. Unlike Data Analyst roles where SQL is usually far ahead, Data Engineering requires heavy scripting, API wrangling, and pipeline automation alongside database querying, making both languages non-negotiable foundations
-Spark comes in at #3 with 1,063 mentions, showing that large-scale distributed data processing is a core requirement for French data engineering positions. Traditional big data storage like Hadoop (639) also maintains a strong footprint
-Enterprise cloud platforms are heavily demanded in the French market. Azure (765) and AWS (744) lead closely, followed by GCP (624). This indicates a diversified cloud ecosystem across French enterprises, spanning Microsoft-heavy corporate environments and AWS/GCP tech stacks




┌─────────┬──────────────┐
│ skills  │ demand_count │
│ varchar │    int64     │
├─────────┼──────────────┤
│ python  │         1493 │
│ sql     │         1457 │
│ spark   │         1063 │
│ azure   │          765 │
│ aws     │          744 │
│ scala   │          738 │
│ java    │          693 │
│ hadoop  │          639 │
│ gcp     │          624 │
│ kafka   │          463 │
└─────────┴──────────────┘
  10 rows      2 columns
*/
