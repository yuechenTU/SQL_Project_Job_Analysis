/*
Question: What are the most in-demanding skills for data analyst?
- Identify the top 5 in-demand skills for a data analyst
- focus on all job postings
- This will retrieve the top 5 skills with the highest demand in the job market,
    providing insights into the most valuable skills for job seekers
*/

SELECT 
    sd.skills,
    COUNT(*) AS skill_count
FROM 
    job_postings_fact AS jpf  
INNER JOIN 
    skills_job_dim AS sjd 
ON  jpf.job_id = sjd.job_id
INNER JOIN
    skills_dim AS sd
ON  sjd.skill_id = sd.skill_id
WHERE 
    jpf.job_title_short = 'Data Analyst'
GROUP BY 
    sd.skill_id
ORDER BY 
    skill_count DESC
LIMIT 5