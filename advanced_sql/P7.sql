/*
Find the count of no. of remote job postings per skill.
-Display the top 5 skill by their demand in remote jobs.
-Include skill_id, name and count of postings requiring the skill.
*/

SELECT 
    job_postings.job_id, --this is deleted later
    skill_id,
    job_postings.job_work_from_home --this is deleted later
FROM
    skills_job_dim AS skills_to_job
INNER JOIN 
    job_postings_fact AS job_postings ON job_postings.job_id = skills_to_job.job_id
WHERE
    job_postings.job_work_from_home = TRUE

SELECT 
    skill_id,
    COUNT(*) AS skill_count
FROM
    skills_job_dim AS skills_to_job
INNER JOIN 
    job_postings_fact AS job_postings ON job_postings.job_id = skills_to_job.job_id
WHERE
    job_postings.job_work_from_home = TRUE
GROUP BY
    skill_id

-- Now building our CTE

WITH remote_job_skills AS (
    SELECT 
        skill_id,
        COUNT(*) AS skill_count
    FROM
        skills_job_dim AS skills_to_job
    INNER JOIN 
        job_postings_fact AS job_postings ON job_postings.job_id = skills_to_job.job_id
    WHERE
        job_postings.job_work_from_home = TRUE AND 
        job_postings.job_title_short = 'Data Analyst'
    GROUP BY
        skill_id
)
/* We've combined job_postings_fact with skill_job_dim table,
Now we further do a INNER JOIN with the above CTE to skills_dim table
*/

SELECT 
    skills.skill_id,
    skills AS skill_name,
    skill_count
FROM 
    remote_job_skills
INNER JOIN 
    skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY
    skill_count DESC
LIMIT 5;