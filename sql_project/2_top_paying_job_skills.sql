/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        ROUND(salary_year_avg, 0) AS avg_yearly_salary,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)  

SELECT
    top_paying_jobs.*,
    skills
FROM
    top_paying_jobs
INNER JOIN skills_job_dim ON  top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY avg_yearly_salary DESC;

/*
Here are the top-paying data analyst jobs along with the specific skills required for each role.
This information can help job seekers identify which skills are in demand for high-paying data analyst positions, 
allowing them to focus their skill development efforts on areas that align with lucrative opportunities.
*/

/*
[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "avg_yearly_salary": 255830,
    "company_name": "AT&T",
    "skills": "sql, python, r, azure, databricks, aws, pandas, pyspark, jupyter, excel, tableau, power bi, powerpoint"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "avg_yearly_salary": 232423,
    "company_name": "Pinterest Job Advertisements",
    "skills": "sql, python, r, hadoop, tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "avg_yearly_salary": 217000,
    "company_name": "Uclahealthcareers",
    "skills": "sql, crystal, oracle, tableau, flow"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "avg_yearly_salary": 205000,
    "company_name": "SmartAsset",
    "skills": "sql, python, go, snowflake, pandas, numpy, excel, tableau, gitlab"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "avg_yearly_salary": 189309,
    "company_name": "Inclusively",
    "skills": "sql, python, azure, aws, oracle, snowflake, tableau, power bi, sap, jenkins, bitbucket, atlassian, jira, confluence"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "avg_yearly_salary": 189000,
    "company_name": "Motional",
    "skills": "sql, python, r, git, bitbucket, atlassian, jira, confluence"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "avg_yearly_salary": 186000,
    "company_name": "SmartAsset",
    "skills": "sql, python, go, snowflake, pandas, numpy, excel, tableau, gitlab"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "avg_yearly_salary": 184000,
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql, python, r"
  }
]
*/