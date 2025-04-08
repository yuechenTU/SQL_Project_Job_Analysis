/*
Question: what are the top-paying data analyst jobs?
- Identify the top 5 highest-paying 'Data Analyst' roles that are available in 'Houston'.
- Focus on job postings with specified salaries (remove nulls).
- This will hightlights the top-paying opportunities for Data Analysts,
    and offering an overview of employment opportunities in companies
*/

SELECT
    job_id,
    job_title_short,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN
    company_dim
ON  job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' 
    AND
    job_location LIKE '%Houston%'
    AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 5


