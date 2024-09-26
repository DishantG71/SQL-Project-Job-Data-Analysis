-- Get job and companies from january
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION

-- Get job and companies from february
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION --combine another table

-- Get job and companies from march
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs

-- UNION ALL --

-- Get job and companies from january
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION ALL

-- Get job and companies from february
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION ALL--combine another table

-- Get job and companies from march
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs