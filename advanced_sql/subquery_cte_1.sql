

SELECT
    skills_dim.skill_id,
    skills_dim.skills AS skill_name,
    job_skills.skill_count
FROM (
    
    SELECT 
        skill_id, 
        COUNT(*) AS skill_count
    FROM 
        skills_job_dim AS skills_to_job
    INNER JOIN job_postings_fact AS job_postings ON job_postings.job_id = skills_to_job.job_id
    GROUP BY
        skill_id

) AS job_skills

INNER JOIN skills_dim ON skills_dim.skill_id = job_skills.skill_id
ORDER BY 
    skill_count DESC
LIMIT 5;