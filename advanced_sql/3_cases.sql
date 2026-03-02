SELECT 
    COUNT(job_id) as job_posted_count,
    CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York' THEN 'Local'
        ELSE 'On-site'
    END AS job_location_category
FROM 
    job_postings_fact
GROUP BY 
    job_location_category;

SELECT 
    COUNT(job_id) as job_posted_count,
    CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York' THEN 'Local'
        ELSE 'On-site'
    END AS job_location_category
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY 
    job_location_category
ORDER BY
    job_posted_count DESC;

SELECT
    job_title_short,
    salary_year_avg,
    CASE 
        WHEN salary_year_avg < 70000 THEN 'Salary Low'
        WHEN salary_year_avg >= 70000 AND salary_year_avg < 100000 THEN 'Standard Salary'
        ELSE 'Salary High'
    END AS salary_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst';

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



