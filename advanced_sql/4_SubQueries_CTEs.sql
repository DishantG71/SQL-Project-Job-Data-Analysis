--SubQuery
SELECT *
FROM (-- SubQuery starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;
--SubQuery ends here

-- CTE
WITH january_jobs AS (-- CTE definition starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) -- CTE defintion ends here

SELECT * 
FROM
    january_jobs;

-- SubQueries Example --

-- Want to get list of companies that have a job and don't require any degree.

SELECT
    company_id,
    job_no_degree_mention
FROM
    job_postings_fact
WHERE 
    job_no_degree_mention = TRUE

--Now making this into a subquery

SELECT 
    company_id,
      name AS company_name
FROM
    company_dim
WHERE
    company_id IN (
    SELECT
        company_id
    FROM
        job_postings_fact
    WHERE 
        job_no_degree_mention = TRUE
    ORDER BY company_id
    )

-- CTEs Example --

/*
Find the companies that have the most job openings.
-Get the total no. of job postings per company id.
-Return the total no. of jobs with the company name.
*/

-- core statement that we use inside our CTE
SELECT
     company_id,
     COUNT(*) 
FROM
    job_postings_fact
GROUP BY
    company_id

-- will be joining tables A = company_dim B = job_postings_fact
WITH company_job_count AS (
    SELECT
        company_id,
        COUNT(*) AS total_jobs
    FROM
        job_postings_fact
    GROUP BYs
        company_id
)

SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM
     company_dim
LEFT JOIN  
    company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY
    total_jobs desc