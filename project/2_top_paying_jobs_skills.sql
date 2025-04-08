/*
Question: what skills are required for the top-paying data analyst jobs in Houston?
- Use the top 5 higheset-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- This will provide a detailed look at which high-paying jobs demand certian skills,
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_pay_jobs AS (
    SELECT
        job_id,
        job_title_short,
        job_title,
        salary_year_avg,
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
)

SELECT 
    tpj.*,
    sd.skills
FROM 
    top_pay_jobs AS tpj 
INNER JOIN -- because we only care about the skills needed
    skills_job_dim AS sjd 
ON  tpj.job_id = sjd.job_id
INNER JOIN
    skills_dim AS sd
ON  sjd.skill_id = sd.skill_id
ORDER BY salary_year_avg DESC

-- There's no stored data of skills required from Instrumental Engineer, so only four job_id showed

/* 
Conclusion: Among the top 15 most common skills:

Programming Languages & Libraries:
- Python: 4 occurrences (most frequent skill)
- Scikit-learn: 2
- PyTorch: 2
- TensorFlow: 3
Total: 11 out of 24 skill mentions (45.8%) are ML/Programming-related

Cloud Platforms:
- Azure: 3
- AWS: 2
Total: 5 out of 24 (20.8%)

Data Tools:
- SQL: 2
- Tableau: 2
- SAS: 2
Total: 6 out of 24 (25%)

Other Tools/Skills:
- JavaScript: 2
- Snowflake, Docker, Jenkins, Spark, Databricks: 1 each

So among the top 15:
ML/Programming skills dominate (~46%)
Followed by data tools (~25%) and cloud platforms (~21%)
*/