-- 03_business_queries.sql
-- Report: Overview of active projects and customer contacts for the management team
SELECT 
    p.project_name,
    p.status,
    c.first_name || ' ' || c.last_name AS customer_fullname,
    p.start_date,
    p.estimated_end_date - p.start_date AS total_planned_days
FROM projects p
INNER JOIN customers c ON p.customer_id = c.customer_id
WHERE p.status != 'Completed'
ORDER BY p.start_date DESC;