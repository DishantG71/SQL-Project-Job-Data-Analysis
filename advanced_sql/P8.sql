/*
Find job postings from the first Qtr that have a salary > $70k
- Combine job posting tables from the 1st Qtr of 2023.
- Get job postings with an average yearly salary > $70k.
*/

SELECT *
FROM january_jobs

UNION ALL

SELECT *
FROM february_jobs

UNION ALL

SELECT *
FROM march_jobs

-- Now we'll start building this into a subquery.

SELECT 
    qtr1_job_postings.job_title_short,
    qtr1_job_postings.job_location,
    qtr1_job_postings.job_via,
    qtr1_job_postings.job_posted_date :: DATE,
    qtr1_job_postings.salary_year_avg
FROM (
    SELECT *
    FROM january_jobs

    UNION ALL

    SELECT *
    FROM february_jobs

    UNION ALL

    SELECT *
    FROM march_jobs
) AS qtr1_job_postings
WHERE
    qtr1_job_postings.salary_year_avg > 70000  AND
    qtr1_job_postings.job_title_short = 'Data Analyst'
ORDER BY 
    qtr1_job_postings.salary_year_avg DESC