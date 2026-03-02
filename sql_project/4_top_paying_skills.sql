/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_yearly_salary
FROM skills_dim
INNER JOIN skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
INNER JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_yearly_salary DESC
LIMIT 25;

/*
Here are the top skills for Data Analysts based on average yearly salary. 
This information can help job seekers and professionals in the field understand 
which skills are associated with higher salary levels, guiding their career development and 
skill acquisition efforts towards the most financially rewarding areas in the data analysis domain.
*/

/*
[
  {
    "skills": "svn",
    "avg_yearly_salary": "400000"
  },
  {
    "skills": "solidity",
    "avg_yearly_salary": "179000"
  },
  {
    "skills": "couchbase",
    "avg_yearly_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_yearly_salary": "155486"
  },
  {
    "skills": "golang",
    "avg_yearly_salary": "155000"
  },
  {
    "skills": "mxnet",
    "avg_yearly_salary": "149000"
  },
  {
    "skills": "dplyr",
    "avg_yearly_salary": "147633"
  },
  {
    "skills": "vmware",
    "avg_yearly_salary": "147500"
  },
  {
    "skills": "terraform",
    "avg_yearly_salary": "146734"
  },
  {
    "skills": "twilio",
    "avg_yearly_salary": "138500"
  },
  {
    "skills": "gitlab",
    "avg_yearly_salary": "134126"
  },
  {
    "skills": "kafka",
    "avg_yearly_salary": "129999"
  },
  {
    "skills": "puppet",
    "avg_yearly_salary": "129820"
  },
  {
    "skills": "keras",
    "avg_yearly_salary": "127013"
  },
  {
    "skills": "pytorch",
    "avg_yearly_salary": "125226"
  },
  {
    "skills": "perl",
    "avg_yearly_salary": "124686"
  },
  {
    "skills": "ansible",
    "avg_yearly_salary": "124370"
  },
  {
    "skills": "hugging face",
    "avg_yearly_salary": "123950"
  },
  {
    "skills": "tensorflow",
    "avg_yearly_salary": "120647"
  },
  {
    "skills": "cassandra",
    "avg_yearly_salary": "118407"
  },
  {
    "skills": "notion",
    "avg_yearly_salary": "118092"
  },
  {
    "skills": "atlassian",
    "avg_yearly_salary": "117966"
  },
  {
    "skills": "bitbucket",
    "avg_yearly_salary": "116712"
  },
  {
    "skills": "airflow",
    "avg_yearly_salary": "116387"
  },
  {
    "skills": "scala",
    "avg_yearly_salary": "115480"
  }
]
*/
