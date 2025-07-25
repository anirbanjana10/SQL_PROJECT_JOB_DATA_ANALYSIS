SELECT
    company_id,
    job_count,

    CASE
        WHEN job_count < 10 THEN 'Small'
        WHEN job_count BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'  
    END AS size_category

FROM(
    SELECT
        company_id,
        COUNT(*) AS job_count
    FROM 
        job_postings_fact
    GROUP BY
        company_id

)AS company_job_counts;