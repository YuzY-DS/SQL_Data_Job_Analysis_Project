WITH company_job_count AS (
    SELECT 
        company_id,
        COUNT(*) AS total_jobs
    FROM 
        job_postings_fact
    GROUP BY 
        company_id
)
SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs,
    CASE 
        WHEN company_job_count.total_jobs < 10 THEN 'Small'
        WHEN company_job_count.total_jobs >= 10 AND company_job_count.total_jobs <= 50 THEN 'Medium'
        ELSE 'Large'
    END AS company_size
FROM 
    company_dim
LEFT JOIN
    company_job_count ON company_dim.company_id = company_job_count.company_id;

WITH skills_count AS (
    SELECT 
        skill_id,
        COUNT(skill_id) AS skill_count
    FROM 
        skills_job_dim
    GROUP BY 
        skill_id
)
SELECT 
    skills_dim.skills,
    skills_count.skill_count
FROM 
    skills_dim
LEFT JOIN 
    skills_count ON skills_dim.skill_id = skills_count.skill_id
ORDER BY skill_count DESC
LIMIT 5;    

WITH company_job_count AS (
    SELECT 
        company_id,
        COUNT(*) AS total_jobs
    FROM 
        job_postings_fact
    GROUP BY 
        company_id
)
SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM 
    company_dim
    LEFT JOIN company_job_count ON company_dim.company_id = company_job_count.company_id
ORDER BY total_jobs DESC;

SELECT
    company_id,
    name AS company_name
FROM 
    company_dim
WHERE
    company_id IN (
        SELECT company_id
        FROM job_postings_fact
        WHERE job_health_insurance = TRUE
        ORDER BY company_id ASC
    );
