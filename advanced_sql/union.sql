SELECT
    quarter1_job_postings.job_title_short,
    skills_dim.skills,
    skills_dim.type,
    quarter1_job_postings.salary_year_avg

FROM(
    SELECT *
    FROM january_jobs
    UNION ALl
    SELECT *
    FROM february_jobs
    UNION ALl
    SELECT *
    FROM march_jobs
) AS quarter1_job_postings

LEFT JOIN skills_job_dim ON quarter1_job_postings.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE  
    quarter1_job_postings.salary_year_avg > 70000 
ORDER BY    
    quarter1_job_postings.salary_year_avg DESC

