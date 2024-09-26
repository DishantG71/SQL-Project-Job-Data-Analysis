
--::DATE
SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date :: DATE AS date    

-- :: DATE converts the time stamp to only date
FROM
    job_postings_fact
LIMIT 5  

--AT Time Zone
SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date    
FROM
    job_postings_fact
LIMIT 5  

--Extract

SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date,   
    Extract(Month FROM job_posted_date) AS column_month
FROM
    job_postings_fact
LIMIT 5  

--How job postings vary from month to month

SELECT
    COUNT(job_id) AS job_posted_count,
    Extract(Month FROM job_posted_date) AS month
FROM
    job_postings_fact
Where 
    job_title_short = 'Data Analyst'
GROUP BY 
    month
ORDER BY 
    job_posted_count desc;
