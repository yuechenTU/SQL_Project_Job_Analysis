SELECT 
    first_quarter.job_title_short,
    first_quarter.job_location,
    first_quarter.job_via,
    first_quarter.job_posted_date ::date,
    first_quarter.salary_year_avg 
FROM (
    SELECT *
    from january_jobs
    UNION all
    SELECT *
    from february_jobs
    UNION all
    SELECT *
    from march_jobs
     ) as first_quarter
WHERE
    first_quarter.salary_year_avg >70000
    AND
    first_quarter.job_title_short = 'Data Analyst'
ORDER BY
    first_quarter.salary_year_avg DESC
