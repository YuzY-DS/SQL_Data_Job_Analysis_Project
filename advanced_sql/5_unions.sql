SELECT 
    job_title_short,
    job_location,
    job_via,
    ROUND(salary_year_avg,0),
    job_posted_date::DATE

FROM(
    SELECT *
    FROM january_job_postings
    UNION ALL
    SELECT *
    FROM february_job_postings
    UNION ALL
    SELECT *
    FROM march_job_postings
) AS quarter_1_job_postings
WHERE job_title_short = 'Data Analyst' AND
    salary_year_avg > 70000;
