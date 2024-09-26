SELECT 
    job_title_short,
    job_location,
    Case
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'On-site'
    End AS location_category
FROM 
    job_postings_fact
/*
Label new column as follows:
-'Anywhere' jobs as remote
-'New York, NY' as local
-'Otherwise' as 'On-site'
*/

-- Can use GROUP BY to agg how many job postings available for each location.

SELECT 
    COUNT(job_id) AS number_of_jobs,
    Case
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'On-site'
    End AS location_category
FROM 
    job_postings_fact
GROUP BY location_category;