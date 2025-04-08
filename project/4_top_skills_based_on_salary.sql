/*
Question: What are the top skills based on salary
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries
- This will reveal how different skills impact salary levels for Data Aanalyst,
    and help identify the most financially rewarding skills to acquire or improve      
*/

SELECT 
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
    sd.skills
ORDER BY
    average_year_salary DESC
LIMIT 20


/*
CONCLUSION: 
- AI/ML rules: PyTorch, TensorFlow, Hugging Face, Keras → $120K–$150K+
- Cloud/DevOps is hot: Terraform, Ansible, Puppet → $124K–$147K
- Blockchain rises: Solidity → $179K
- Data tools strong: Kafka, Couchbase → $130K–$160K
- Modern languages pay: Go, Perl → $124K–$155K
*/