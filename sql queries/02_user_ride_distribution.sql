-- =========================================================
-- SECTION 2: USER RIDE DISTRIBUTION
-- =========================================================
-- Objective:
-- Classify users based on ride frequency.

WITH user_rides AS (
    SELECT
        user_id,
        COUNT(*) AS total_rides
    FROM taxi
    GROUP BY user_id
),

classified_users AS (
    SELECT
        user_id,
        total_rides,
        CASE
            WHEN total_rides <= 2 THEN 'Low'
            WHEN total_rides BETWEEN 3 AND 5 THEN 'Medium'
            ELSE 'High'
        END AS user_type
    FROM user_rides
)

SELECT
    user_type,
    COUNT(*) AS user_count
FROM classified_users
GROUP BY user_type
ORDER BY user_count DESC;