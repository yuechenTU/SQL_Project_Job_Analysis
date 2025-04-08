/*
Question: What are the most optimal skills to learn>
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on jobs that specified salaries
- This will target skills that offer high demand and high salaries,
    offering strategic insights for career development in data analysis
*/
WITH skills_demand AS(
    SELECT 
        sd.skill_id,
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
        AND
        jpf.salary_year_avg IS NOT NULL
    GROUP BY 
        sd.skill_id
),
average_salary AS(
    SELECT 
        sd.skill_id,
        sd.skills,
        ROUND(AVG(jpf.salary_year_avg), 0) AS average_year_salary
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
        AND
        jpf.salary_year_avg IS NOT NULL
    GROUP BY 
        sd.skill_id
)

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    skill_count,
    average_year_salary
FROM
    skills_demand
INNER JOIN
    average_salary
ON  skills_demand.skill_id = average_salary.skill_id
ORDER BY
    skill_count DESC, 
    average_year_salary DESC
LIMIT 20



