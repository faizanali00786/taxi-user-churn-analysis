-- =========================================================
-- SECTION 7: USER RETENTION STATUS
-- =========================================================
-- Objective:
-- Classify users into Active, At-Risk, and Churned
-- based on days since last ride.

WITH last_ride AS (
    SELECT
        user_id,
        MAX(DATE(pickup_dt)) AS last_ride_date
    FROM taxi
    GROUP BY user_id
),

platform_date AS (
    SELECT
        MAX(DATE(pickup_dt)) AS max_platform_date
    FROM taxi
),

user_status AS (
    SELECT
        l.user_id,
        l.last_ride_date,
        DATEDIFF(
            p.max_platform_date,
            l.last_ride_date
        ) AS days_inactive
    FROM last_ride l
    CROSS JOIN platform_date p
)

SELECT
    user_id,
    last_ride_date,
    days_inactive,
    CASE
        WHEN days_inactive <= 7 THEN 'Active'
        WHEN days_inactive BETWEEN 8 AND 30 THEN 'At Risk'
        ELSE 'Churned'
    END AS customer_status
FROM user_status
ORDER BY days_inactive DESC;