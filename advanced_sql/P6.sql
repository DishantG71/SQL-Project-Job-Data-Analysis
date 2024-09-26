CREATE TABLE january_jobs AS
    Select *
    FROM 
        job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE february_jobs AS
    Select *
    FROM 
        job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;


CREATE TABLE march_jobs AS
    Select *
    FROM 
        job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

Select job_posted_date
FROM march_jobs